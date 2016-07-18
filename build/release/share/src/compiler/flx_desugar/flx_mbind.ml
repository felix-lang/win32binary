open Flx_util
open Flx_ast
open Flx_types
open Flx_print
open Flx_typing
open Flx_exceptions
open List

type extract_t =
  | Proj_n of Flx_srcref.t * int             (* tuple projections 1 .. n *)
  | Udtor of Flx_srcref.t * qualified_name_t (* argument of union component s *)
  | Vdtor of Flx_srcref.t * string           (* argument of variant component s *)
  | Proj_s of Flx_srcref.t * string          (* record projection name *)
  | Proj_head of Flx_srcref.t                (* tuple_cons head extractor  *)
  | Proj_tail of Flx_srcref.t                (* tuple_cons tail extractor  *)
  | Polyrec_tail of Flx_srcref.t * string list (* list of fields to exclude! *)
  | Expr of Flx_srcref.t * expr_t

type extractor_t = extract_t list
type psym_t = string * (Flx_srcref.t * extractor_t)
type psym_table_t = psym_t list

(* the extractor is a function to be applied to
   the argument to extract the value of the identifier;
   it is represented here as a list of functions
   to be applied, with the function at the top
   of the list to be applied last.

   Note that the difference between an abstract
   extractor and a concrete one is that the
   abstract one isn't applied to anything,
   while the concrete one is applied to a specific
   expression.
*)

let gen_extractor
  (extractor : extractor_t)
  (mv : expr_t)
: expr_t =
  List.fold_right
  (fun x marg -> match x with
    | Proj_n (sr,n) -> EXPR_get_n (sr,(n,marg))
    | Udtor (sr,qn) -> EXPR_ctor_arg (sr,(qn,marg))
    | Vdtor (sr,qn) -> EXPR_variant_arg (sr,(qn,marg))
    | Proj_s (sr,s) -> EXPR_get_named_variable (sr,(s,marg))
    | Proj_tail (sr) -> EXPR_get_tuple_tail (sr,(marg))
    | Proj_head (sr) -> EXPR_get_tuple_head (sr,(marg))
    | Polyrec_tail (sr,flds) -> EXPR_remove_fields (sr,marg,flds)
    | Expr (sr,e) -> e
  )
  extractor
  mv

(* this routine is used to substitute match variables
   in a when expression with their bindings ..
   it needs to be completed!!!

   IT IS ALSO A HACK. THIS IS THE WRONG WAY!
   THE RIGHT WAY IS TO HANDLE THE PATTERN WITHOUT ANY WHEN CLAUSE,
   AND THEN USE A CONDITIONAL IN THE HANDLER. UNFORTUNATELY, IF THE
   WHEN CLAUSE DOESN'T MATCH, WE WOULD NEED TO JUMP OUT TO THE NEXT
   BRANCH OF THE PATTERN MATCH .. WHICH IS HARD TO ORGANISE AT 
   THIS POINT IN THE CODE.
*)
let rec subst (vars:psym_table_t) (e:expr_t) mv : expr_t =
  let subst e = subst vars e mv in
  (* FIXME: most of these cases are legal, the when clause should
     be made into a function call to an arbitrary function, passing
     the match variables as arguments.

     We can do this now, since we have type extractors matching
     the structure extractors Proj_n and Udtor (ie, we can
     name the types of the arguments now)
  *)
  match e with
  | EXPR_patvar _
  | EXPR_patany _
  | EXPR_vsprintf _
  | EXPR_interpolate _
  | EXPR_type_match _
  | EXPR_noexpand _
  | EXPR_expr _
  | EXPR_typeof _
  | EXPR_void _
  | EXPR_typed_case _
  | EXPR_projection _
  | EXPR_case_arg _
  | EXPR_arrow _
  | EXPR_effector _
  | EXPR_longarrow _
  | EXPR_ellipsis _
  | EXPR_intersect _
  | EXPR_isin _ (* only used in type constraints *)
  | EXPR_callback _
  | EXPR_record_type _
  | EXPR_polyrecord_type _
  | EXPR_variant_type _
  | EXPR_extension _
  | EXPR_get_tuple_tail _
  | EXPR_get_tuple_head _
  | EXPR_label _
  | EXPR_rnprj _
  | EXPR_remove_fields _
  | EXPR_typecase_match _
    ->
      let sr = src_of_expr e in
      clierr sr ("[mbind:subst] Not expected in pattern when clause: " ^ string_of_expr e); 

  | EXPR_tuple_cons (sr, eh, et) -> EXPR_tuple_cons (sr, subst eh, subst et)
  | EXPR_superscript (sr,(e1,e2)) -> EXPR_superscript (sr, (subst e1, subst e2))
  | EXPR_product (sr,ls) -> EXPR_product (sr,map subst ls)
  | EXPR_sum (sr,ls) -> EXPR_sum (sr, map subst ls)
  | EXPR_andlist (sr, ls) -> EXPR_andlist (sr,map subst ls)
  | EXPR_orlist (sr, ls) -> EXPR_orlist (sr, map subst ls)
  | EXPR_cond (sr,(e,b1,b2)) -> EXPR_cond (sr, (subst e, subst b1, subst b2))
  | EXPR_not (sr,e) -> EXPR_not (sr, subst e)
 
  (* NOTE: this is wrong, in the case the letin pattern has a variable
     which hides our current pattern variable 
  *)
  | EXPR_letin (sr, (pat,e1,e2)) -> EXPR_letin (sr, (pat, subst e1, subst e2))

  (* as above, it's wrong .. *)
  | EXPR_match (sr, (e,ps)) -> EXPR_match (sr, (subst e, map (fun (p,e') -> p,subst e') ps))

  | EXPR_case_index _ -> e
  | EXPR_index _  -> e
  | EXPR_lookup _ -> e
  | EXPR_suffix _ -> e
  | EXPR_literal _ -> e
  | EXPR_case_tag _ -> e
  | EXPR_as _ -> e
  | EXPR_as_var _ -> e

  | EXPR_name (sr,name,idx) ->
    if idx = [] then
    if List.mem_assoc name vars
    then
      let sr,extractor = List.assoc name vars in
      gen_extractor extractor mv
    else e
    else failwith "Can't use indexed name in when clause :("



  | EXPR_deref (sr,e') -> EXPR_deref (sr,subst e')
  | EXPR_ref (sr,e') -> EXPR_ref (sr,subst e')
  | EXPR_likely (sr,e') -> EXPR_likely (sr,subst e')
  | EXPR_unlikely (sr,e') -> EXPR_unlikely (sr,subst e')
  | EXPR_new (sr,e') -> EXPR_new (sr,subst e')
  | EXPR_apply (sr,(f,e)) -> EXPR_apply (sr,(subst f,subst e))
  | EXPR_map (sr,f,e) -> EXPR_map (sr,subst f,subst e)
  | EXPR_tuple (sr,es) -> EXPR_tuple (sr,map subst es)
  | EXPR_record (sr,es) -> EXPR_record (sr,map (fun (s,e)->s,subst e) es)
  | EXPR_polyrecord (sr,es,e) -> EXPR_polyrecord (sr,map (fun (s,e)->s,subst e) es, subst e)
  | EXPR_variant (sr,(s,e)) -> EXPR_variant (sr,(s,subst e))
  | EXPR_arrayof (sr,es) -> EXPR_arrayof (sr,map subst es)

  | EXPR_lambda _ -> assert false

  | EXPR_match_case _
  | EXPR_match_variant _
  | EXPR_ctor_arg _
  | EXPR_variant_arg _
  | EXPR_get_n _
  | EXPR_get_named_variable _
  | EXPR_match_ctor _
    ->
    let sr = src_of_expr e in
    clierr sr "[subst] not implemented in when part of pattern"

  | EXPR_coercion _ -> failwith "subst: coercion"

  | EXPR_range_check (sr, mi, v, mx) -> EXPR_range_check (sr, subst mi, subst v, subst mx)

(* This routine runs through a pattern looking for
  pattern variables, and adds a record to a hashtable
  keyed by each variable name. The data recorded
  is the list of extractors which must be applied
  to 'deconstruct' the data type to get the part
  which the variable denotes in the pattern

  for example, for the pattern

    | Ctor (1,(x,_))

  the extractor for x is

    [Udtor "Ctor"; Proj_n 2; Proj_n 1]

  since x is the first component of the second
  component of the argument of the constructor "Ctor"
*)

let rec get_pattern_vars
  (vars : psym_table_t ref)
  pat       (* pattern *)
  (extractor : extractor_t)
=
  match pat with
  | PAT_name (sr,id) -> vars :=  (id, (sr,extractor))::!vars

  | PAT_tuple (sr,pats) ->
    let n = ref 0 in
    List.iter
    (fun pat ->
      let sr = src_of_pat pat in
      let extractor' = (Proj_n (sr,!n)) :: extractor in
      incr n;
      get_pattern_vars vars pat extractor'
    )
    pats

  | PAT_tuple_cons (sr,pat1,pat2) ->
    let sr = src_of_pat pat1 in
    let extractor' = Proj_head (sr) :: extractor in
    get_pattern_vars vars pat1 extractor';

    let sr = src_of_pat pat2 in
    let extractor' = Proj_tail (sr) :: extractor in
    get_pattern_vars vars pat2 extractor'

  | PAT_nonconst_ctor (sr,name,pat) ->
    let extractor' = (Udtor (sr, name)) :: extractor in
    get_pattern_vars vars pat extractor'

  | PAT_nonconst_variant (sr,name,pat) ->
    let extractor' = (Vdtor (sr, name)) :: extractor in
    get_pattern_vars vars pat extractor'


  | PAT_as (sr,pat,id) ->
    vars := (id, (sr,extractor)) :: !vars;
    get_pattern_vars vars pat extractor

  | PAT_coercion (sr,pat,_)

  | PAT_when (sr,pat,_) ->
    get_pattern_vars vars pat extractor
  
  | PAT_with (sr,pat,es) ->
    (* we have to add all the variables defined in es at this point
      as pattern variables. The only problem is, what are the extractors?
      They are, in fact, just expressions, and, this will work provided
      we replace in them the variables they depend on with THEIR extractors.
      Like we have to do with PAT_when.
    *)
(*
    print_endline ("PAT_with !");
*)
    List.iter (fun (s,e) ->
      let extractor = Expr (sr,e) :: extractor in
(*
print_endline ("PAT_with: " ^ s ^ " = " ^ Flx_print.string_of_expr e); 
*)
      vars := (s, (sr,extractor))::!vars
    )
    (List.rev es);
    get_pattern_vars vars pat extractor

  | PAT_record (sr,rpats) ->
    List.iter
    (fun (s,pat) ->
      let sr = src_of_pat pat in
      let extractor' = (Proj_s (sr,s)) :: extractor in
      get_pattern_vars vars pat extractor'
    )
    rpats

  | PAT_polyrecord (sr,rpats,r) ->
    List.iter
    (fun (s,pat) ->
      let sr = src_of_pat pat in
      let extractor' = (Proj_s (sr,s)) :: extractor in
      get_pattern_vars vars pat extractor'
    )
    rpats;
    let flds = List.map fst rpats in
    let extractor' = Polyrec_tail (sr,flds) :: extractor in 
    vars := (r, (sr,extractor'))::!vars

  | _ -> ()

let closure sr e =
  let ret = STMT_fun_return (sr,e) in 
  EXPR_lambda (sr, (`Function, dfltvs, [[],None], flx_bool, [ret]))
 
let rec gen_match_check pat (arg:expr_t) =
  let apl sr f x =
    EXPR_apply
    (
      sr,
      (
        EXPR_name (sr,f,[]),
        x
      )
    )
  and apl2 sr f x1 x2 =
    match f,x1,x2 with
    | "land",EXPR_typed_case(_,1,TYP_unitsum 2),x -> x
    | "land",x,EXPR_typed_case(_,1,TYP_unitsum 2) -> x
    | _ ->
    EXPR_apply
    (
      sr,
      (
        EXPR_name (sr,f,[]),
        EXPR_tuple (sr,[x1;x2])
      )
    )
  and truth sr = EXPR_typed_case (sr,1,flx_bool)
  and ssrc x = Flx_srcref.short_string_of_src x
  and mklit sr e = EXPR_literal (sr,e)
  in
  match pat with
  | PAT_alt _
  | PAT_expr _ -> assert false
  | PAT_literal (sr,s) -> apl2 sr "eq" (mklit sr s) arg
  | PAT_none sr -> clierr sr "Empty pattern not allowed"

  (* ranges *)
  | PAT_range (sr,l1,l2) ->
    let b1 = apl2 sr "<=" (mklit sr l1) arg
    and b2 = apl2 sr "<=" arg (mklit sr l2)
    in apl2 sr "land" b1 b2

  (* other *)
  | PAT_name (sr,_) -> truth sr

  | PAT_tuple (sr,[]) ->
      (* Lower:
       *
       *   match () with
       *   | () => ...
       *   endmatch;
       *
       * to:
       *
       *   if eq ((), ()) then ...
       *
       * We can't lower it directly to "if true" because we need to check
       * that the argument is the right type.
       *
       * *)
      apl2 sr "eq" (EXPR_tuple (sr, [])) arg

  | PAT_tuple (sr,pats) ->
    let counter = ref 1 in
    List.fold_left (fun init pat ->
      let sr = src_of_pat pat in
      let n = !counter in
      incr counter;
      apl2 sr "land" init
        (
          gen_match_check pat (EXPR_get_n (sr,(n, arg)))
        )
    )
    (
      let pat = List.hd pats in
      let sr = src_of_pat pat in
      gen_match_check pat (EXPR_get_n (sr,(0, arg)))
    )
    (List.tl pats)

  | PAT_record (sr,rpats) ->
    List.fold_left
    (fun init (s,pat) ->
      let sr = src_of_pat pat in
      apl2 sr "land" init
        (
          gen_match_check pat (EXPR_get_named_variable (sr,(s, arg)))
        )
    )
    (
      let s,pat = List.hd rpats in
      let sr = src_of_pat pat in
      gen_match_check pat (EXPR_get_named_variable (sr,(s, arg)))
    )
    (List.tl rpats)

  | PAT_polyrecord (sr,rpats,r) ->
    List.fold_left
    (fun init (s,pat) ->
      let sr = src_of_pat pat in
      apl2 sr "land" init
        (
          gen_match_check pat (EXPR_get_named_variable (sr,(s, arg)))
        )
    )
    (
      let s,pat = List.hd rpats in
      let sr = src_of_pat pat in
      gen_match_check pat (EXPR_get_named_variable (sr,(s, arg)))
    )
    (List.tl rpats)


  | PAT_any sr -> truth sr
  | PAT_setform_any sr -> truth sr
  | PAT_const_ctor (sr,name) ->
    EXPR_match_ctor (sr,(name,arg))

  | PAT_const_variant (sr,name) ->
    EXPR_match_variant (sr,(name,arg))


  | PAT_nonconst_ctor (sr,name,pat) ->
    let check_component = EXPR_match_ctor (sr,(name,arg)) in
    let tuple = EXPR_ctor_arg (sr,(name,arg)) in
    let check_tuple = gen_match_check pat tuple in
    apl2 sr "andthen" check_component (closure sr check_tuple)

  | PAT_nonconst_variant (sr,name,pat) ->
    let check_component = EXPR_match_variant (sr,(name,arg)) in
    let tuple = EXPR_variant_arg (sr,(name,arg)) in
    let check_tuple = gen_match_check pat tuple in
    apl2 sr "andthen" check_component (closure sr check_tuple)

  | PAT_coercion (sr,pat,_)
  | PAT_as (sr,pat,_) ->
    gen_match_check pat arg

  | PAT_with (sr, pat,es) ->
    gen_match_check pat arg

  | PAT_when (sr,pat,expr) ->
    let vars =  ref [] in
    get_pattern_vars vars pat [];
    let mc = gen_match_check pat arg in 
    let mwhen = subst (!vars) expr arg in
    begin match mc with
    | EXPR_typed_case(_,1,TYP_unitsum 2)  ->  mwhen
    | _ -> apl2 sr "andthen" mc (closure sr mwhen)
    end

  | PAT_tuple_cons (sr, p1, p2) -> 
    (* Not clear how to check p2 matches the rest of the argument,
       since we don't know the type of the argument, we don't know
       how many components are involved. So p2 had better be a wildcard!
    *)
    gen_match_check p1 (EXPR_get_n (sr,(0, arg)))

