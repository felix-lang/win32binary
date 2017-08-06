open Flx_bid
type bexpr_t =
  | BEXPR_int of int
  | BEXPR_not of t
  | BEXPR_deref of t

  (* name of a variable OR a constant including union constant constructor? *)
  | BEXPR_varname of bid_t * Flx_btype.t list

  | BEXPR_ref of bid_t * Flx_btype.t list
  | BEXPR_likely of t
  | BEXPR_unlikely of t
  | BEXPR_address of t
  | BEXPR_new of t
  | BEXPR_class_new of Flx_btype.t * t
  | BEXPR_literal of Flx_literal.literal_t
  | BEXPR_apply of t * t
  | BEXPR_apply_prim of bid_t * Flx_btype.t list * t
  | BEXPR_apply_direct of bid_t * Flx_btype.t list * t
  | BEXPR_apply_stack of bid_t * Flx_btype.t list * t
  | BEXPR_apply_struct of bid_t * Flx_btype.t list * t
  | BEXPR_tuple of t list
  | BEXPR_record of (string * t) list
  | BEXPR_polyrecord of (string * t) list * t
  | BEXPR_remove_fields of t * string list
  | BEXPR_variant of string * t
  | BEXPR_closure of bid_t * Flx_btype.t list
  | BEXPR_identity_function of Flx_btype.t

(* value of union constant constructor *)
  | BEXPR_case of int * Flx_btype.t


(* test if case index matches constructor index *)
  | BEXPR_match_case of int * t
  | BEXPR_match_variant of string * t

(* decoding of union/sum value *)
  | BEXPR_case_arg of int * t
  | BEXPR_variant_arg of string * t 

  | BEXPR_case_index of t

(* inline application of C++ string as function to argument *)
  | BEXPR_expr of Flx_code_spec.t * Flx_btype.t * t 

  | BEXPR_range_check of t * t * t
  | BEXPR_coerce of t * Flx_btype.t
  | BEXPR_compose of t * t
  | BEXPR_tuple_tail of t
  | BEXPR_tuple_head of t
  | BEXPR_tuple_cons of t * t
  | BEXPR_tuple_body of t
  | BEXPR_tuple_last of t
  | BEXPR_tuple_snoc of t * t
  | BEXPR_prj of int * Flx_btype.t * Flx_btype.t
  | BEXPR_rprj of string * int * Flx_btype.t * Flx_btype.t
  | BEXPR_aprj of t * Flx_btype.t * Flx_btype.t

(* union/sum constructor wrapped as function *)
  | BEXPR_inj of int * Flx_btype.t * Flx_btype.t 
    (* first arg = constructor index, second arg domain = ctor type, third arg codomain = union type *)

  | BEXPR_label of bid_t
  | BEXPR_unitptr of int
  | BEXPR_cond of t * t * t (* conditional *)

  (* This term is the product of a tuple or array of functions,
     to be eliminated after monomorphisation because it's a heck
     of a lot easier to do it then than on binding. It's replaced
     by an ordinary function application, and the function generated
  *)
  | BEXPR_funprod of t
  | BEXPR_funsum of t
  | BEXPR_lrangle of t (* mediating morphism of a product *)
  | BEXPR_lrbrack of t (* mediating morphism of a sum *)

and t = bexpr_t * Flx_btype.t

let sbt typ = Flx_btype.str_of_btype typ

(* HACK: NOT REENTRANT and might clash with the actual global
  counter .. oh well 
*)
let counter = ref 1 

(* -------------------------------------------------------------------------- *)

let complete_check t = 
(*
  if Flx_btype.complete_type t then t else
  let () = print_endline "WARNING: expression type has free fixpoint" in
*)
  t
let complete_check_list ts = List.map complete_check ts

let bexpr_cond ((_,ct) as c) ((_,tt) as t) ((_,ft) as f) =
   assert  (ct = (Flx_btype.btyp_unitsum 2)); 
   assert (tt = ft);
   BEXPR_cond (c,t,f),complete_check tt

let bexpr_identity_function t = BEXPR_identity_function t, Flx_btype.btyp_function (t,t)

let bexpr_unitptr i = BEXPR_unitptr i, Flx_btype.trivtype i
let bexpr_unit = bexpr_unitptr 0

let bexpr_bool b = BEXPR_case ((if b then 1 else 0), Flx_btype.btyp_bool ()),Flx_btype.btyp_bool ()
let bexpr_true = bexpr_bool true
let bexpr_false = bexpr_bool false

let bexpr_label i = BEXPR_label (i), Flx_btype.btyp_label ()

let bexpr_tuple_tail t e = BEXPR_tuple_tail e, complete_check t
let bexpr_tuple_head t e = BEXPR_tuple_head e, complete_check t
let bexpr_tuple_cons t (eh,et) = BEXPR_tuple_cons (eh,et), complete_check t

let bexpr_tuple_body t e = BEXPR_tuple_body e, complete_check t
let bexpr_tuple_last t e = BEXPR_tuple_last e, complete_check t
let bexpr_tuple_snoc t (eh,et) = BEXPR_tuple_snoc (eh,et), complete_check t


let bexpr_deref t e : t = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ -> BEXPR_deref e, complete_check t

let bexpr_int i = BEXPR_int i, Flx_btype.btyp_int ()

let bexpr_not (e,t) : t = BEXPR_not (e,t), complete_check t

let bexpr_varname t (bid, ts) = 
(*
  print_endline ("Creating varname term " ^ string_of_int bid);
*)
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ ->   BEXPR_varname (bid, complete_check_list ts), complete_check t

let bexpr_ref t (bid, ts) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ -> BEXPR_ref (bid, complete_check_list ts), complete_check t

let bexpr_likely ((_,t) as e) = BEXPR_likely e, complete_check t

let bexpr_unlikely ((_,t) as e) = BEXPR_unlikely e, complete_check t

let bexpr_address ((_,t) as e) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr (k + 1)
  | _ -> BEXPR_address e, complete_check (Flx_btype.btyp_pointer t)

let bexpr_new ((_,t) as e) = 
  match Flx_btype.trivorder t with
  | Some k ->bexpr_unitptr (k + 1)
  | _ -> BEXPR_new e, complete_check (Flx_btype.btyp_pointer t)

let bexpr_class_new cl e = BEXPR_class_new (cl,e), complete_check (Flx_btype.btyp_pointer cl)

let bexpr_literal t l = BEXPR_literal l, complete_check t

let bexpr_apply t (e1, e2) = 
  let _,ft = e1 and _,at = e2 in
  begin match Flx_btype.unfold "Flx_bexpr:bexpr_apply" ft with
  | Flx_btype.BTYP_effector (d,_,c)
  | Flx_btype.BTYP_function (d,c)
  | Flx_btype.BTYP_cfunction (d,c) ->
    if not (Flx_typeeq.type_eq Flx_btype.st counter d at) then begin
      print_endline ("Warning: bexpr_apply: function type: " ^ Flx_btype.st ft);
      print_endline ("Warning: bexpr_apply: function domain\n"^ Flx_btype.st d ^ "\ndoesn't agree with argtype\n" ^ Flx_btype.st at);
      failwith ("SYSTEM ERROR: bexpr_apply: function domain\n"^ Flx_btype.st d ^ "\ndoesn't agree with argtype\n" ^ Flx_btype.st at);
    end; 
    if not (Flx_typeeq.type_eq Flx_btype.st counter c t) then begin
      print_endline ("Warning: bexpr_apply: function type: " ^ Flx_btype.st ft);
      print_endline ("Warning: bexpr_apply: function codomain\n"^ Flx_btype.st c ^ "\ndoesn't agree with applytype\n" ^ Flx_btype.st t);
      failwith("SYSTEM ERROR: bexpr_apply: function codomain\n"^ Flx_btype.st c ^ "\ndoesn't agree with applytype\n" ^ Flx_btype.st t);
    end

  | Flx_btype.BTYP_inst _ -> () (* can't check without lookup! *)
  | _ -> print_endline ("WARNING: bexpr_apply: unknown function type " ^ Flx_btype.st t);
  end;
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ -> BEXPR_apply (e1, e2), complete_check t

let bexpr_apply_prim t (bid, ts, e) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ -> BEXPR_apply_prim (bid, complete_check_list ts, e), complete_check t

let bexpr_apply_direct t (bid, ts, e) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ -> BEXPR_apply_direct (bid, complete_check_list ts, e), complete_check t

let bexpr_apply_stack t (bid, ts, e) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ -> BEXPR_apply_stack (bid, complete_check_list ts, e), complete_check t

let bexpr_apply_struct t (bid, ts, e) = 
  BEXPR_apply_struct (bid, complete_check_list ts, e), complete_check t

let bexpr_tuple t es = 
  match es with 
  | [] -> bexpr_unit 
  | _ -> BEXPR_tuple es, complete_check t

let bexpr_coerce (e, t) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ ->  BEXPR_coerce (e, t), complete_check t

let bexpr_prj n d c = 
  begin match d with
  (* Arrays with unitsum indices *)
  | Flx_btype.BTYP_pointer ( Flx_btype.BTYP_array (_,Flx_btype.BTYP_unitsum m))
  |Flx_btype.BTYP_array (_,Flx_btype.BTYP_unitsum m) ->
    if n>= m then
      failwith ("Array length " ^ string_of_int m ^ 
      " projection index " ^
      string_of_int n ^ " is out of range"
    )

  (* Tuples *)
  | Flx_btype.BTYP_pointer ( Flx_btype.BTYP_tuple ls)
  | Flx_btype.BTYP_tuple ls -> 
    if n>= List.length ls then
      failwith ("Tuple length " ^ string_of_int (List.length ls) ^ 
      " projection index " ^
      string_of_int n ^ " is out of range"
    )

  (* Records *)
  | Flx_btype.BTYP_pointer (Flx_btype.BTYP_record ls)
  | Flx_btype.BTYP_record ls ->
    if n>= List.length ls then
      failwith ("Record length " ^ string_of_int (List.length ls) ^ 
      " projection index " ^
      string_of_int n ^ " is out of range"
    )

  (* Structs and cstructs but we can't check without lookup *)
  | Flx_btype.BTYP_pointer (Flx_btype.BTYP_inst _ )
  | Flx_btype.BTYP_inst _ -> ()

  (* polyrecords and anything else aren't allowed *)
  | _ -> 
    print_endline ("Indexed projection " ^ string_of_int n ^
    " bad domain " ^ Flx_btype.st d);
    assert false
  end;

  BEXPR_prj (n,d,c),complete_check (Flx_btype.btyp_function (d,c))

(* note, inefficiency, if we find a field key
  and start counting down sequence numbers,
  and run out of fields of the right name,
  we continue down the tail and fail at the end,
  instead of failing right away.

  Note: this algo works whether the keys are sorted or not,
  but the result is only stable if the order is stable
*)
let find_seq name seq fs : (int * Flx_btype.t) option =
  let rec aux idx seq fs =
    match fs with
    | [] -> None
    | (key,t) :: _  when key = name && seq == 0 -> Some (idx,t)
    | (key,_) :: tail when key = name -> aux (idx + 1) (seq - 1) tail
    | (key,_) :: tail -> aux (idx + 1) seq tail
  in aux 0 seq fs

let bexpr_rnprj name seq d c =
  match d with
  | Flx_btype.BTYP_pointer (Flx_btype.BTYP_record ts) 
  | Flx_btype.BTYP_record ts ->
    begin match find_seq name seq ts with
    | Some (idx,t) -> bexpr_prj idx d c
    | None ->
      print_endline ("Invalid named projection " ^ name ^ 
        ", seq=" ^ string_of_int seq ^ ", fields=" ^
          String.concat ","(List.map fst ts)
      );
      assert false
    end

  | _ -> 
    BEXPR_rprj (name,seq,d,c),complete_check (Flx_btype.btyp_function (d,c))

let bexpr_rprj name d c = bexpr_rnprj name 0 d c

let bexpr_record es : t = 
  let all_blank = List.fold_left (fun acc (s,_) -> acc && s = "") true es in
  if all_blank then bexpr_tuple (Flx_btype.btyp_tuple (List.map (fun (s,(e,t))->t) es)) (List.map snd es) else
  let cmp (s1,e1) (s2,e2) = compare s1 s2 in
  let es = List.stable_sort cmp es in
  let ts = List.map (fun (s,(_,t)) -> s,t) es in
  BEXPR_record es, complete_check (Flx_btype.btyp_record ts)

(* NOTE: you can only remove known fields! Just like you can only
   do projections of known fields 
*)

let cal_removal e ts ss =
  let _,domain = e in
  let mkprj fld seq fldt : t = bexpr_rnprj fld seq domain fldt in

  (* calculate which fields to remove, and how many times *)
  let flds2remove = Hashtbl.create (List.length ss) in
  List.iter (fun s -> 
    if Hashtbl.mem flds2remove s 
    then Hashtbl.replace flds2remove s (Hashtbl.find flds2remove s + 1) 
    else Hashtbl.add flds2remove s 1
  )
  ss
  ;

  (* result, reversed order *)
  let components = ref [] in

  (* fields scanned, and how many times *)
  let fldsscanned= Hashtbl.create (List.length ts) in
  let add_scan field = 
    if Hashtbl.mem fldsscanned field then
      Hashtbl.replace fldsscanned field (Hashtbl.find fldsscanned field + 1)
    else
      Hashtbl.add fldsscanned field 1
  in

  (* for each field entry *)
  List.iter  (fun (name,fldt) ->
    add_scan name;

    (* if we have to remove this field, skip over it *)
    if Hashtbl.mem flds2remove name
    then begin let count = Hashtbl.find flds2remove name in
      (* if there's only one more time to skip the field, delete from table *)
      if count = 1 
      then Hashtbl.remove flds2remove name 
      (* otherwise just decrement the count *)
      else Hashtbl.replace flds2remove name (count - 1)
    end else begin
      let seq = Hashtbl.find fldsscanned name - 1 in
      let prj = mkprj name seq fldt in
      let component = bexpr_apply fldt (prj,e) in
      components := (name,component) :: !components
    end
  )
  ts
  ;
  List.rev (!components)

let bexpr_remove_fields e ss : t =
(*
print_endline "Remove fields";
*)
  let _,domain = e in
  match domain with
  | Flx_btype.BTYP_record ts ->
(*
print_endline "Type record";
*)
    let components = cal_removal e ts ss in
    let result = bexpr_record components in
    result
 
  | Flx_btype.BTYP_polyrecord (ts,t) ->
(*
print_endline "Type poly record";
*)
    let components = cal_removal e ts ss in
    let field_types = List.map (fun (name,(_,t)) -> name,t) components in
    let result_type = Flx_btype.btyp_polyrecord field_types t in
(*
print_endline ("Type is " ^ st result_type);
*)
    BEXPR_remove_fields (e,ss),result_type
 
  | _ -> 
print_endline "type BUGGED";
    failwith ("BUG: caller should have checked! remove fields from non-(poly)record type " ^ Flx_btype.st domain)

(************************ POLYRECORD **************************)
let bexpr_polyrecord (es: (string * t) list) ((e',t') as e) =
(*
print_endline ("[bexpr_polyrecord] Constructing polyrecord: extension fields = " ^ String.concat "," (List.map (fun (s,(_,t)) -> s^":"^ st t) es));
print_endline ("[bexpr_polyrecord] Constructing polyrecord: core type= " ^ st t');
*)
  let fldts = List.map (fun (s,(_,t)) -> s,t) es in
  let result_type : Flx_btype.t = complete_check (Flx_btype.btyp_polyrecord fldts t') in
(*
print_endline ("[bexpr_polyrecord] expected result type = " ^ st domain);  
*)
  let mkprj fld seq fldt : t = bexpr_rnprj fld seq t' fldt in
  match t' with
  | Flx_btype.BTYP_tuple [] -> bexpr_record es

  | Flx_btype.BTYP_record flds ->
(*
print_endline ("polyrecord core is record: fields = " ^ String.concat "," (List.map (fun (s,t) -> s^":"^st t) flds));
*)
    let dcnt = ref 0 in
    let idx = ref 0 in
    let ctrl_key = ref "" in
    let nuflds = ref [] in
    let first = ref true in
    List.iter 
      (fun (name,t) -> 
        if !first then begin first := false; ctrl_key := name; dcnt := 0 end else
        if name = !ctrl_key then incr dcnt else begin ctrl_key := name; dcnt := 0 end;
(*
print_endline ("bexpr_polyrecord: record case ..");
*)
        let x = bexpr_apply t (mkprj name (!dcnt) t, e) in
(*
print_endline ("   .. application done");
*)
        nuflds := ( name, x) :: !nuflds;
        incr idx
      ) 
      flds
    ;
    let fields =es @ List.rev (!nuflds) in
(*
print_endline ("Result fields = " ^ String.concat "," (List.map (fun (s,(_,t)) -> s^":"^ st t) fields));
*)
    let (_,t) as e = bexpr_record (fields) in
(*
print_endline ("[bexpr_polyrecord] actual result type = " ^ st t);  
*)
    e

  | Flx_btype.BTYP_polyrecord (flds,v) ->
(*
print_endline "Constructing polyrecord value";
*)
    let dcnt = ref 0 in
    let idx = ref 0 in
    let ctrl_key = ref "" in
    let nuflds = ref [] in
    let nunames = ref [] in
    let first = ref true in
    List.iter 
      (fun (name,t) -> 
        if !first then begin first := false; ctrl_key := name; dcnt :=0 end else
        if name = !ctrl_key then incr dcnt else begin ctrl_key := name; dcnt := 0 end;
(*
print_endline ("bexpr_polyrecord: polyrecord case ..");
*)
        nuflds := ( name, bexpr_apply t (mkprj name (!dcnt) t, e)) :: !nuflds;
(*
print_endline ("   .. application done");
*)
        nunames := name :: !nunames;
        incr idx
      ) 
      flds
    ;
    let fields =es @ List.rev (!nuflds) in
(*
print_endline "Removing fields";
*)
    let reduced_e = bexpr_remove_fields e (!nunames) in
(*
print_endline "fields removed";
*)
    let cmp (s1,e1) (s2,e2) = compare s1 s2 in
    let fields = List.stable_sort cmp fields in
    let e = BEXPR_polyrecord (fields, reduced_e),result_type in
(*
print_endline "polyrecord created";
print_endline ("Result type = " ^ st result_type);
print_endline ("Fields = " ^ String.concat "," (List.map (fun (name,(_,t)) -> name ^ ":" ^ st t) fields));
print_endline ("Core = " ^ st (snd reduced_e));
*)
    e

  | Flx_btype.BTYP_type_var _ ->
    let cmp (s1,e1) (s2,e2) = compare s1 s2 in
    let es = List.stable_sort cmp es in
    BEXPR_polyrecord (es,e), result_type 

  | _ ->
   let fld = "",e in
   let es = es @ [fld] in
   bexpr_record es


(************************ END POLYRECORD **************************)

let bexpr_variant t (n, e) = BEXPR_variant (n, e), complete_check t


let bexpr_aprj ix d c = 
  BEXPR_aprj (ix,d,c),complete_check (Flx_btype.btyp_function (d,c))

let bexpr_inj n d c = 
  BEXPR_inj (n,d,c),complete_check (Flx_btype.btyp_function (d,c))

let bexpr_get_n c n (e,d) =  
  match Flx_btype.trivorder c with
  | Some k -> bexpr_unitptr k
  | _ -> bexpr_apply c ( bexpr_prj n d c, (e,d) )

let bexpr_get_named c name (e,d) =
  match Flx_btype.trivorder c with
  | Some k -> bexpr_unitptr k
  | _ -> bexpr_apply c ( bexpr_rprj name d c, (e,d) )


let bexpr_closure t (bid, ts) = 
(*
  print_endline ("Creating closure term " ^ string_of_int bid);
*)
  BEXPR_closure (bid, complete_check_list ts), complete_check t

let bexpr_const_case (i, t) = BEXPR_case (i, t), complete_check t

let bexpr_nonconst_case argt (i, sumt) = 
  BEXPR_inj (i, argt, sumt), 
  complete_check (Flx_btype.btyp_function (argt,sumt))

let bexpr_match_case (i, e) = 
  BEXPR_match_case (i, e), Flx_btype.btyp_unitsum 2

let bexpr_match_variant (s, e) = 
  BEXPR_match_variant (s, e), Flx_btype.btyp_unitsum 2 

let bexpr_case_arg t (i, e) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ ->    BEXPR_case_arg (i, e), complete_check t

let bexpr_variant_arg t (v, e) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ ->  BEXPR_variant_arg (v, e), complete_check t

let bexpr_case_index t e = BEXPR_case_index e, complete_check t

let bexpr_expr (s, t, e) = 
  match Flx_btype.trivorder t with
  | Some k -> bexpr_unitptr k
  | _ ->  BEXPR_expr (s, t, e), complete_check t

let bexpr_range_check t (e1, e2, e3) = BEXPR_range_check (e1, e2, e3), complete_check t

let bexpr_compose t (e1, e2) = BEXPR_compose (e1, e2), complete_check t

let bexpr_unitsum_case i j =
  let case_type = Flx_btype.btyp_unitsum j in
  bexpr_const_case (i, case_type)

let bexpr_funprod t e = BEXPR_funprod e,t
let bexpr_funsum t e = BEXPR_funsum e,t
let bexpr_lrangle t e = BEXPR_lrangle e,t
let bexpr_lrbrack t e = BEXPR_lrbrack e,t

(* -------------------------------------------------------------------------- *)

(** Extract the type arguments of a bound expression. *)
let get_ts (e,_) =
  match e with
  | BEXPR_varname (_, ts)
  | BEXPR_closure (_, ts)
  | BEXPR_ref (_, ts)
  | BEXPR_apply_prim (_, ts, _)
  | BEXPR_apply_direct (_, ts, _)
  | BEXPR_apply_struct (_, ts, _) -> ts
  | _ -> []


(** Return whether or not one bound expression is equivalent with another bound
 * expression. *)
let rec cmp ((a,_) as xa) ((b,_) as xb) =
  (* Note that we don't bother comparing the type subterm: this had better be
   * equal for equal expressions: the value is merely the cached result of a
   * synthetic context independent type calculation *)
  match a,b with
  | BEXPR_cond (c,t,f), BEXPR_cond (c',t',f') ->
    cmp c c' && cmp t t' && cmp f f'

  | BEXPR_label (i), BEXPR_label (i') -> i = i'
  | BEXPR_coerce (e,t),BEXPR_coerce (e',t') ->
    (* not really right .. *)
    cmp e e'

  | BEXPR_record ts,BEXPR_record ts' ->
    List.length ts = List.length ts' &&
    List.map fst ts = List.map fst ts' &&
    List.fold_left2 (fun r a b -> r && a = b)
      true (List.map snd ts) (List.map snd ts')

  | BEXPR_variant (s,e),BEXPR_variant (s',e') ->
    s = s' && cmp e e'

  | BEXPR_int (e),BEXPR_int (e') -> e = e'

  | BEXPR_not (e),BEXPR_not (e') 
  | BEXPR_deref e,BEXPR_deref e' -> cmp e e'

  | BEXPR_varname (i,ts),BEXPR_varname (i',ts')
  | BEXPR_ref (i,ts),BEXPR_ref (i',ts')
  | BEXPR_closure (i,ts),BEXPR_closure (i',ts') ->
     i = i' && List.length ts = List.length ts' &&
     List.fold_left2 (fun r a b -> r && a = b) true ts ts'

  (* Note any two distinct new expressions are distinct ...
   * not sure what is really needed here *)
  | BEXPR_new e1,BEXPR_new e2 -> false
  | BEXPR_class_new _,BEXPR_class_new _ -> false

  | _,BEXPR_likely e2
  | _,BEXPR_unlikely e2 -> cmp xa e2

  | BEXPR_likely e1,_
  | BEXPR_unlikely e1,_ -> cmp e1 xb

  | BEXPR_literal a,BEXPR_literal a' -> a == a'

  | BEXPR_apply (a,b),BEXPR_apply (a',b') -> cmp a a' && cmp b b'

  | BEXPR_apply_prim (i,ts,b),BEXPR_apply_prim (i',ts',b')
  | BEXPR_apply_direct (i,ts,b),BEXPR_apply_direct (i',ts',b')
  | BEXPR_apply_struct (i,ts,b),BEXPR_apply_struct (i',ts',b')
  | BEXPR_apply_stack (i,ts,b),BEXPR_apply_stack (i',ts',b') ->
     i = i' &&
     List.length ts = List.length ts' &&
     List.fold_left2 (fun r a b -> r && a = b) true ts ts' &&
     cmp b b'

  | BEXPR_tuple [], BEXPR_unitptr 0
  | BEXPR_unitptr 0,BEXPR_tuple [] -> true

  | BEXPR_tuple ls,BEXPR_tuple ls' ->
     List.length ls = List.length ls' &&
     List.fold_left2 (fun r a b -> r && cmp a b) true ls ls'

  | BEXPR_case_arg (i,e),BEXPR_case_arg (i',e')
  | BEXPR_match_case (i,e),BEXPR_match_case (i',e') ->
    i = i' && cmp e e'

  | BEXPR_case_index e,BEXPR_case_index e' -> cmp e e'

  | BEXPR_case (i,t),BEXPR_case (i',t') -> i = i' && t = t'
  | BEXPR_expr (s,t,e),BEXPR_expr (s',t',e') -> s = s' && t = t' && cmp e e'
  | BEXPR_range_check (e1,e2,e3), BEXPR_range_check (e1',e2',e3') ->
    cmp e1 e1' && cmp e2 e2' && cmp e3 e3'

  | BEXPR_tuple_head e1, BEXPR_tuple_head e2
  | BEXPR_tuple_tail e1, BEXPR_tuple_tail e2 ->
    cmp e1 e2
  | BEXPR_tuple_cons (eh,et), BEXPR_tuple_cons (eh',et') ->
    cmp eh eh' && cmp et et'

  | BEXPR_tuple_body e1, BEXPR_tuple_body e2
  | BEXPR_tuple_last e1, BEXPR_tuple_last e2 ->
    cmp e1 e2
  | BEXPR_tuple_snoc (eh,et), BEXPR_tuple_snoc (eh',et') ->
    cmp eh eh' && cmp et et'

  | BEXPR_aprj (ix,d,c), BEXPR_aprj (ix',d',c') ->
    d = d' && c = c' && cmp ix ix'

  | BEXPR_rprj (ix,n,d,c), BEXPR_rprj (ix',n',d',c') ->
    d = d' && c = c' && ix = ix' && n = n'

  | BEXPR_prj (n,d,c), BEXPR_prj (n',d',c') ->
    d = d' && c = c' && n = n'

  | BEXPR_inj (n,d,c), BEXPR_inj (n',d',c') ->
    d = d' && c = c' && n = n'
  | BEXPR_funprod e, BEXPR_funprod e' ->
    cmp e e'
  | BEXPR_funsum e, BEXPR_funsum e' ->
    cmp e e'
  | BEXPR_lrangle e, BEXPR_lrangle e' ->
    cmp e e'
  | BEXPR_lrbrack e, BEXPR_lrbrack e' ->
    cmp e e'

  | BEXPR_identity_function t1, BEXPR_identity_function t2 ->
    t1 = t2 

  | _ -> false

(* -------------------------------------------------------------------------- *)

(* this routine applies arguments HOFs to SUB components only, not to the actual
 * argument. It isn't recursive, so the argument HOF can be. *)
let flat_iter
  ?(f_bid=fun _ -> ())
  ?(f_btype=fun _ -> ())
  ?(f_bexpr=fun _ -> ())
  ?(f_label=fun _ -> ())
  ((x,t) as e) =
  match x with
  | BEXPR_cond (c,t,f) -> f_bexpr c; f_bexpr t; f_bexpr f
  | BEXPR_label (i) -> f_label i; f_bid i
  | BEXPR_not e -> f_bexpr e
  | BEXPR_int e -> ()

  | BEXPR_deref e -> f_bexpr e
  | BEXPR_ref (i,ts) ->
      f_bid i;
      List.iter f_btype ts
  | BEXPR_likely e -> f_bexpr e
  | BEXPR_unlikely e -> f_bexpr e
  | BEXPR_address e -> f_bexpr e
  | BEXPR_new e -> f_bexpr e
  | BEXPR_class_new (t,e) -> f_btype t; f_bexpr e
  | BEXPR_apply (e1,e2) ->
      f_bexpr e1;
      f_bexpr e2
  | BEXPR_compose (e1,e2) ->
      f_bexpr e1;
      f_bexpr e2
  | BEXPR_apply_prim (i,ts,e2) ->
      f_bid i;
      List.iter f_btype ts;
      f_bexpr e2
  | BEXPR_apply_direct (i,ts,e2) ->
      f_bid i;
      List.iter f_btype ts;
      f_bexpr e2
  | BEXPR_apply_struct (i,ts,e2) ->
      f_bid i;
      List.iter f_btype ts;
      f_bexpr e2
  | BEXPR_apply_stack (i,ts,e2) ->
      f_bid i;
      List.iter f_btype ts;
      f_bexpr e2
  | BEXPR_tuple es -> List.iter f_bexpr es
  | BEXPR_record es -> List.iter (fun (s,e) -> f_bexpr e) es
  | BEXPR_polyrecord (es,e) -> List.iter (fun (s,e) -> f_bexpr e) es; f_bexpr e
  | BEXPR_remove_fields (e,ss) -> f_bexpr e
  | BEXPR_variant (s,e) -> f_bexpr e
  | BEXPR_closure (i,ts) ->
      f_bid i;
      List.iter f_btype ts
  | BEXPR_identity_function t -> f_btype t

  | BEXPR_varname (i,ts) ->
      f_bid i;
      List.iter f_btype ts
  | BEXPR_case (i,t') -> f_btype t'
  | BEXPR_match_case (i,e) -> f_bexpr e
  | BEXPR_match_variant (s,e) -> f_bexpr e
  | BEXPR_case_arg (i,e) -> f_bexpr e
  | BEXPR_variant_arg (v,e) -> f_bexpr e
  | BEXPR_case_index e -> f_bexpr e
  | BEXPR_literal x -> f_btype t
  | BEXPR_expr (s,t1,e) -> f_btype t1; f_bexpr e
  | BEXPR_range_check (e1,e2,e3) ->
      f_bexpr e1;
      f_bexpr e2;
      f_bexpr e3
  | BEXPR_coerce (e,t) ->
      f_bexpr e;
      f_btype t

  | BEXPR_tuple_tail e -> f_bexpr e
  | BEXPR_tuple_head e -> f_bexpr e
  | BEXPR_tuple_cons (eh,et) -> f_bexpr eh; f_bexpr et

  | BEXPR_tuple_body e -> f_bexpr e
  | BEXPR_tuple_last e -> f_bexpr e
  | BEXPR_tuple_snoc (eh,et) -> f_bexpr eh; f_bexpr et


  | BEXPR_aprj (ix,d,c) -> f_bexpr ix; f_btype d; f_btype c
  | BEXPR_rprj (ix,n,d,c) -> f_btype d; f_btype c
  | BEXPR_prj (n,d,c) -> f_btype d; f_btype c
  | BEXPR_inj (n,d,c) -> f_btype d; f_btype c
  | BEXPR_funprod e -> f_bexpr e
  | BEXPR_funsum e -> f_bexpr e
  | BEXPR_lrangle e -> f_bexpr e
  | BEXPR_lrbrack e -> f_bexpr e
  | BEXPR_unitptr _ -> ()

(* this is a self-recursing version of the above routine: the argument to this
 * routine must NOT recursively apply itself! *)
let rec iter
  ?f_bid
  ?(f_btype=fun _ -> ())
  ?(f_bexpr=fun _ -> ())
  ?(f_label=fun _ -> ())
  ((x,t) as e)
=
  f_bexpr e;
  f_btype t;
  let f_bexpr e = iter ?f_bid ~f_btype ~f_bexpr ~f_label e in
  flat_iter ?f_bid ~f_btype ~f_bexpr ~f_label e


let map
  ?(f_bid=fun i -> i)
  ?(f_btype=fun t -> t)
  ?(f_bexpr=fun e -> e)
  (e,t')
=
  let t = f_btype t' in
  match e with
  | BEXPR_cond (c,tr,fa) -> bexpr_cond (f_bexpr c) (f_bexpr tr) (f_bexpr fa)
  | BEXPR_label (i) -> bexpr_label (f_bid i)
  | BEXPR_not e -> bexpr_not (f_bexpr e)
  | BEXPR_int i -> bexpr_int i

  | BEXPR_deref e -> bexpr_deref t (f_bexpr e)
  | BEXPR_ref (i,ts) -> bexpr_ref t (f_bid i, List.map f_btype ts)
  | BEXPR_new e -> bexpr_new (f_bexpr e)
  | BEXPR_class_new (cl,e) ->  bexpr_class_new (f_btype cl) (f_bexpr e)
  | BEXPR_address e -> bexpr_address (f_bexpr e)
  | BEXPR_likely e -> bexpr_likely (f_bexpr e)
  | BEXPR_unlikely e -> bexpr_unlikely (f_bexpr e)
  | BEXPR_apply (e1',e2') -> 
     let e1 = f_bexpr e1' and e2 = f_bexpr e2' in
     begin 
       try 
         bexpr_apply t (e1,e2)
     with exn -> 
       print_endline ("[Flx_bexpr:map] Error mapping apply term!");
       print_endline ("Input Function type " ^ Flx_btype.st (snd e1'));
       print_endline ("Input Argument type " ^ Flx_btype.st (snd  e2'));
       print_endline ("Input term type " ^ Flx_btype.st t');
       print_endline ("Output Function type " ^ Flx_btype.st (snd e1));
       print_endline ("Output Argument type " ^ Flx_btype.st (snd e2));
       print_endline ("Output term type= " ^ Flx_btype.st t);
       raise exn
     end

  | BEXPR_compose (e1,e2) -> bexpr_compose t (f_bexpr e1, f_bexpr e2)
  | BEXPR_apply_prim (i,ts,e2) ->
      bexpr_apply_prim t (f_bid i, List.map f_btype ts, f_bexpr e2)
  | BEXPR_apply_direct (i,ts,e2) ->
      bexpr_apply_direct t (f_bid i, List.map f_btype ts, f_bexpr e2)
  | BEXPR_apply_struct (i,ts,e2) ->
      bexpr_apply_struct t (f_bid i, List.map f_btype ts, f_bexpr e2)
  | BEXPR_apply_stack (i,ts,e2) ->
      bexpr_apply_stack t (f_bid i, List.map f_btype ts, f_bexpr e2)
  | BEXPR_tuple  es -> bexpr_tuple t (List.map f_bexpr es)
  | BEXPR_record es ->
      bexpr_record (List.map (fun (s,e) -> s, f_bexpr e) es)
  | BEXPR_polyrecord (es,e) ->
      bexpr_polyrecord (List.map (fun (s,e) -> s, f_bexpr e) es) (f_bexpr e)
  | BEXPR_remove_fields (e,ss) -> bexpr_remove_fields (f_bexpr e) ss

  | BEXPR_variant (s,e) -> bexpr_variant t (s, f_bexpr e)
  | BEXPR_closure (i,ts) ->
      bexpr_closure t (f_bid i, List.map f_btype ts)
  | BEXPR_identity_function t -> 
    bexpr_identity_function (f_btype t)

  | BEXPR_varname (i,ts) -> bexpr_varname t (f_bid i, List.map f_btype ts)
  | BEXPR_case (i,t) -> bexpr_const_case (i,f_btype t)
  | BEXPR_match_case (i,e) -> bexpr_match_case (i, f_bexpr e)
  | BEXPR_match_variant(s,e) -> bexpr_match_variant (s, f_bexpr e)
  | BEXPR_case_arg (i,e) -> bexpr_case_arg t (i, f_bexpr e)
  | BEXPR_variant_arg (s,e) -> bexpr_variant_arg t (s, f_bexpr e)
  | BEXPR_case_index e -> bexpr_case_index t (f_bexpr e)
  | BEXPR_literal x -> bexpr_literal t x
  | BEXPR_expr (s,t,e) -> bexpr_expr (s, f_btype t, f_bexpr e)
  | BEXPR_range_check (e1,e2,e3) ->
      bexpr_range_check t (f_bexpr e1, f_bexpr e2, f_bexpr e3)
  | BEXPR_coerce (e,t) -> bexpr_coerce (f_bexpr e, f_btype t)

  | BEXPR_tuple_tail e -> bexpr_tuple_tail t (f_bexpr e)
  | BEXPR_tuple_head e -> bexpr_tuple_head t (f_bexpr e)
  | BEXPR_tuple_cons (eh,et) -> bexpr_tuple_cons t (f_bexpr eh, f_bexpr et)

  | BEXPR_tuple_body e -> bexpr_tuple_body t (f_bexpr e)
  | BEXPR_tuple_last e -> bexpr_tuple_last t (f_bexpr e)
  | BEXPR_tuple_snoc (eh,et) -> bexpr_tuple_snoc t (f_bexpr eh, f_bexpr et)


  | BEXPR_rprj (ix,n,d,c) -> bexpr_rnprj ix n (f_btype d) (f_btype c)
  | BEXPR_aprj (ix,d,c) -> bexpr_aprj (f_bexpr ix) (f_btype d) (f_btype c)
  | BEXPR_prj (n,d,c) -> 
(*
    print_endline ("Mapping projection: " ^ st d ^ " -> " ^ st c);
*)
    bexpr_prj n (f_btype d) (f_btype c)
    (* BEXPR_prj (n, f_btype d, f_btype c) *)

  | BEXPR_inj (n,d,c) -> bexpr_inj n (f_btype d) (f_btype c)
  | BEXPR_funprod e -> bexpr_funprod t (f_bexpr e)
  | BEXPR_funsum e -> bexpr_funsum t (f_bexpr e)
  | BEXPR_lrangle e -> bexpr_lrangle t (f_bexpr e)
  | BEXPR_lrbrack e -> bexpr_lrbrack t (f_bexpr e)
  | BEXPR_unitptr i -> bexpr_unitptr i

(* -------------------------------------------------------------------------- *)

(** Simplify the bound expression. *)
let rec reduce e = 
  let rec f_bexpr e =
    match map ~f_bexpr:f_bexpr e with
    | BEXPR_not (BEXPR_not (e,t1),t2),t3 when t1 = t2 && t2 = t3 -> e,t1 (* had better be bool! *)
    | BEXPR_apply ((BEXPR_prj (n, _,_),_),((BEXPR_tuple ls),_)),_ -> List.nth ls n
    | BEXPR_deref (BEXPR_ref (i,ts),_),t -> BEXPR_varname (i,ts),t
    | BEXPR_deref (BEXPR_address (e,t),_),_ -> (e,t)
    | BEXPR_address (BEXPR_deref (e,t),_),_ -> (e,t)
    | BEXPR_apply ((BEXPR_identity_function _,_),e),_ -> e

    | BEXPR_apply 
      (
       (BEXPR_compose( (_,Flx_btype.BTYP_function (_,b) as f1), f2),_),
       e
      ),t ->
      bexpr_apply t (f2, bexpr_apply b (f1,e))
    | BEXPR_apply((BEXPR_compose _,_),_),_ -> print_endline "Bugged composition"; assert false
    | BEXPR_cond ((BEXPR_case (0,Flx_btype.BTYP_unitsum 2),Flx_btype.BTYP_unitsum 2), _, fa),_ -> fa
    | BEXPR_cond ((BEXPR_case (1,Flx_btype.BTYP_unitsum 2),Flx_btype.BTYP_unitsum 2), tr, _),_ -> tr
    | BEXPR_rprj (name,seq,d,c),_ -> bexpr_rnprj name seq d c 
    | BEXPR_polyrecord (es,e),_ -> bexpr_polyrecord es e
    | BEXPR_remove_fields (e,ss),_ -> 
      bexpr_remove_fields e ss
    | x -> x
  in f_bexpr e

