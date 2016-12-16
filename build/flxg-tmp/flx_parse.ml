
# 1 "build/flxg-tmp\flx_parse.dyp"
       
open Flx_token
open Flx_drules

let _ = () (* dummy line to improve OCaml error location *)
# 9                  "build/flxg-tmp\flx_parse.ml"
let _ =
  if "20120619" <> Dyp.version
  then (Printf.fprintf stderr
    "version mismatch, dypgen version 20120619 and dyplib version %s\n" Dyp.version;
  exit 2)

module Dyp_symbols =
struct
  let get_token_name () = 0
  let str_token _ = failwith "str_token must not be called with dypgen lexers"
  let ter_string_list = [
      ("DUMMY",0);
      ("ENDMARKER",1);
      ("ERRORTOKEN",2);
      ("HASH_LINE",3);
      ("INTEGER",4);
      ("NAME",5);
      ("NONTERMINAL",6);
      ("STRING",7);
      ("UNDERSCORE",8);
      ("__dypgen_layout",9);]
end

module Dyp_symbols_array =
struct
  let token_name_array =
  [|"DUMMY";
    "ENDMARKER";
    "ERRORTOKEN";
    "HASH_LINE";
    "INTEGER";
    "NAME";
    "NONTERMINAL";
    "STRING";
    "UNDERSCORE";
    "__dypgen_layout"|]
  let nt_cons_list =
  [
    ("action",11);
    ("basic_name",12);
    ("basic_name_comma_list",13);
    ("compilation_unit",14);
    ("dyalt",15);
    ("dyaltlist",16);
    ("dyalts",17);
    ("dypgen__nested_nt_0",18);
    ("dypgen__nested_nt_1",19);
    ("dypgen__nested_nt_2",20);
    ("dypgen__nested_nt_3",21);
    ("dypgen__nested_nt_4",22);
    ("dypgen__nested_nt_5",23);
    ("dyprod",24);
    ("dyprods",25);
    ("epsilon",26);
    ("grammar_init",27);
    ("macro_args",28);
    ("name_list",29);
    ("note",30);
    ("opt_prio",31);
    ("opt_private",32);
    ("pri",33);
    ("prilist",34);
    ("rhs",35);
    ("schemevar",36);
    ("sepsilon",36);
    ("sexpr",36);
    ("ssre",37);
    ("sstatement_star",38);
    ("sstatements",36);
    ("sterm",36);
    ("stmt",36);
    ("strepsilon",36);
    ("symbol",39);
    ("syntax_init",40);
    ("syntax_unit",41);
    ("top_statements",42)]
  let str_cons o = match o with
    | `Lex_parse_C_comment _ -> "Lex_parse_C_comment"
    | `Lex_parse_C_comment_Arg_count _ -> "Lex_parse_C_comment_Arg_count"
    | `Lex_parse_fdoc_comment _ -> "Lex_parse_fdoc_comment"
    | `Lexeme_matched _ -> "Lexeme_matched"
    | `Obj_ERRORTOKEN _ -> "Obj_ERRORTOKEN"
    | `Obj_HASH_LINE _ -> "Obj_HASH_LINE"
    | `Obj_INTEGER _ -> "Obj_INTEGER"
    | `Obj_NAME _ -> "Obj_NAME"
    | `Obj_NONTERMINAL _ -> "Obj_NONTERMINAL"
    | `Obj_STRING _ -> "Obj_STRING"
    | `Obj___dypgen_layout _ -> "Obj___dypgen_layout"
    | `Obj_action _ -> "Obj_action"
    | `Obj_basic_name _ -> "Obj_basic_name"
    | `Obj_basic_name_comma_list _ -> "Obj_basic_name_comma_list"
    | `Obj_compilation_unit _ -> "Obj_compilation_unit"
    | `Obj_dyalt _ -> "Obj_dyalt"
    | `Obj_dyaltlist _ -> "Obj_dyaltlist"
    | `Obj_dyalts _ -> "Obj_dyalts"
    | `Obj_dypgen__nested_nt_0 _ -> "Obj_dypgen__nested_nt_0"
    | `Obj_dypgen__nested_nt_1 _ -> "Obj_dypgen__nested_nt_1"
    | `Obj_dypgen__nested_nt_2 _ -> "Obj_dypgen__nested_nt_2"
    | `Obj_dypgen__nested_nt_3 _ -> "Obj_dypgen__nested_nt_3"
    | `Obj_dypgen__nested_nt_4 _ -> "Obj_dypgen__nested_nt_4"
    | `Obj_dypgen__nested_nt_5 _ -> "Obj_dypgen__nested_nt_5"
    | `Obj_dyprod _ -> "Obj_dyprod"
    | `Obj_dyprods _ -> "Obj_dyprods"
    | `Obj_epsilon _ -> "Obj_epsilon"
    | `Obj_grammar_init _ -> "Obj_grammar_init"
    | `Obj_macro_args _ -> "Obj_macro_args"
    | `Obj_name_list _ -> "Obj_name_list"
    | `Obj_note _ -> "Obj_note"
    | `Obj_opt_prio _ -> "Obj_opt_prio"
    | `Obj_opt_private _ -> "Obj_opt_private"
    | `Obj_pri _ -> "Obj_pri"
    | `Obj_prilist _ -> "Obj_prilist"
    | `Obj_rhs _ -> "Obj_rhs"
    | `Obj_sexpr _ -> "Obj_sexpr"
    | `Obj_ssre _ -> "Obj_ssre"
    | `Obj_sstatement_star _ -> "Obj_sstatement_star"
    | `Obj_symbol _ -> "Obj_symbol"
    | `Obj_syntax_init _ -> "Obj_syntax_init"
    | `Obj_syntax_unit _ -> "Obj_syntax_unit"
    | `Obj_top_statements _ -> "Obj_top_statements"
    | _ -> failwith "str_cons, unexpected constructor"
  let cons_array = [|
    "Lex_parse_C_comment";
    "Lex_parse_C_comment_Arg_count";
    "Lex_parse_fdoc_comment";
    "Lexeme_matched";
    "Obj_ERRORTOKEN";
    "Obj_HASH_LINE";
    "Obj_INTEGER";
    "Obj_NAME";
    "Obj_NONTERMINAL";
    "Obj_STRING";
    "Obj___dypgen_layout";
    "Obj_action";
    "Obj_basic_name";
    "Obj_basic_name_comma_list";
    "Obj_compilation_unit";
    "Obj_dyalt";
    "Obj_dyaltlist";
    "Obj_dyalts";
    "Obj_dypgen__nested_nt_0";
    "Obj_dypgen__nested_nt_1";
    "Obj_dypgen__nested_nt_2";
    "Obj_dypgen__nested_nt_3";
    "Obj_dypgen__nested_nt_4";
    "Obj_dypgen__nested_nt_5";
    "Obj_dyprod";
    "Obj_dyprods";
    "Obj_epsilon";
    "Obj_grammar_init";
    "Obj_macro_args";
    "Obj_name_list";
    "Obj_note";
    "Obj_opt_prio";
    "Obj_opt_private";
    "Obj_pri";
    "Obj_prilist";
    "Obj_rhs";
    "Obj_sexpr";
    "Obj_ssre";
    "Obj_sstatement_star";
    "Obj_symbol";
    "Obj_syntax_init";
    "Obj_syntax_unit";
    "Obj_top_statements";
    "";
    "";
    "";
  |]
  let entry_points = [
    "syntax_unit";
    "compilation_unit";]
end

let dypgen_lexbuf_position lexbuf = Dyp.dyplex_lexbuf_position lexbuf

module Dyp_aux_functions =
struct
  let get_token_value _ = `Dypgen__dummy_obj_cons
  let cons_table = Dyp.Tools.hashtbl_of_array Dyp_symbols_array.cons_array
end

module Dyp_priority_data =
struct
  let relations = [
    ["ralt_prix";"rseq_prix";"rpostfix_prix";"ratom_prix";];
  ]
end

let global_data = ()
let local_data = ()
let global_data_equal = (==)
let local_data_equal = (==)

let dyp_merge_Lex_parse_C_comment = Dyp.Tools.keep_zero
let dyp_merge_Lex_parse_C_comment_Arg_count = Dyp.Tools.keep_zero
let dyp_merge_Lex_parse_fdoc_comment = Dyp.Tools.keep_zero
let dyp_merge_Lexeme_matched = Dyp.Tools.keep_zero
let dyp_merge_Obj_ERRORTOKEN = Dyp.Tools.keep_zero
let dyp_merge_Obj_HASH_LINE = Dyp.Tools.keep_zero
let dyp_merge_Obj_INTEGER = Dyp.Tools.keep_zero
let dyp_merge_Obj_NAME = Dyp.Tools.keep_zero
let dyp_merge_Obj_NONTERMINAL = Dyp.Tools.keep_zero
let dyp_merge_Obj_STRING = Dyp.Tools.keep_zero
let dyp_merge_Obj___dypgen_layout = Dyp.Tools.keep_zero
let dyp_merge_Obj_action = Dyp.Tools.keep_zero
let dyp_merge_Obj_basic_name = Dyp.Tools.keep_zero
let dyp_merge_Obj_basic_name_comma_list = Dyp.Tools.keep_zero
let dyp_merge_Obj_compilation_unit = Dyp.Tools.keep_zero
let dyp_merge_Obj_dyalt = Dyp.Tools.keep_zero
let dyp_merge_Obj_dyaltlist = Dyp.Tools.keep_zero
let dyp_merge_Obj_dyalts = Dyp.Tools.keep_zero
let dyp_merge_Obj_dypgen__nested_nt_0 = Dyp.Tools.keep_zero
let dyp_merge_Obj_dypgen__nested_nt_1 = Dyp.Tools.keep_zero
let dyp_merge_Obj_dypgen__nested_nt_2 = Dyp.Tools.keep_zero
let dyp_merge_Obj_dypgen__nested_nt_3 = Dyp.Tools.keep_zero
let dyp_merge_Obj_dypgen__nested_nt_4 = Dyp.Tools.keep_zero
let dyp_merge_Obj_dypgen__nested_nt_5 = Dyp.Tools.keep_zero
let dyp_merge_Obj_dyprod = Dyp.Tools.keep_zero
let dyp_merge_Obj_dyprods = Dyp.Tools.keep_zero
let dyp_merge_Obj_epsilon = Dyp.Tools.keep_zero
let dyp_merge_Obj_grammar_init = Dyp.Tools.keep_zero
let dyp_merge_Obj_macro_args = Dyp.Tools.keep_zero
let dyp_merge_Obj_name_list = Dyp.Tools.keep_zero
let dyp_merge_Obj_note = Dyp.Tools.keep_zero
let dyp_merge_Obj_opt_prio = Dyp.Tools.keep_zero
let dyp_merge_Obj_opt_private = Dyp.Tools.keep_zero
let dyp_merge_Obj_pri = Dyp.Tools.keep_zero
let dyp_merge_Obj_prilist = Dyp.Tools.keep_zero
let dyp_merge_Obj_rhs = Dyp.Tools.keep_zero
let dyp_merge_Obj_sexpr = Dyp.Tools.keep_zero
let dyp_merge_Obj_ssre = Dyp.Tools.keep_zero
let dyp_merge_Obj_sstatement_star = Dyp.Tools.keep_zero
let dyp_merge_Obj_symbol = Dyp.Tools.keep_zero
let dyp_merge_Obj_syntax_init = Dyp.Tools.keep_zero
let dyp_merge_Obj_syntax_unit = Dyp.Tools.keep_zero
let dyp_merge_Obj_top_statements = Dyp.Tools.keep_zero
let dyp_merge = Dyp.keep_one
let dypgen_match_length = `shortest
let dypgen_choose_token = `first
let dypgen_keep_data = `both
let dypgen_use_rule_order = false
let dypgen_use_all_actions = false

# 5 "build/flxg-tmp\flx_parse.dyp"


(* parser header *)
exception EndOfInput
open Ocs_types
open Dyp
open Lexing
open Flx_string
open Flx_dssl
open Flx_parse_data
open Flx_define_syntax

let lexeme x = Dyp.lexeme x

let dyp_merge_Obj_sexpr ol = keep_all ol

let dyphack (ls : ( 'a * string) list) : 'a =
  match ls with
  | [x,_] -> x
  | [] -> failwith "No parse found"
  | _ -> failwith "Multiple parses found"


let open_syntax dyp namelist =
  let sr = Flx_parse_srcref.getsr dyp in
  print_endline
    ("Opening syntax extensions " ^ Flx_srcref.short_string_of_src sr);

  let dssls = List.map snd namelist in

  print_endline
    ("Parsed open of syntax extensions " ^ String.concat "," dssls);

  let m = dyp.local_data in

  let to_install = Flx_dssl.tran_cls_dssls m.drules m.installed_dssls dssls in
  let rules, prios = Flx_dssl.extract_syntax to_install m.drules in
  let add_rules, bindings = Flx_dssl.bind_grammar_rules dyp rules in
  let local_data = 
  { 
    m with installed_dssls = to_install @ m.installed_dssls
  } 
  in
  bindings @ [Add_rules add_rules; Local_data local_data; Relation prios]

let define_syntax dyp dssl_name dyprods =
  (* NOTE ORDER!! dyprods is reversed, but the fold reverses it again *)
  let sr = Flx_parse_srcref.getsr dyp in
  let local_data = dyp.local_data in
  let macros,dyprods = Flx_define_syntax.process_rules dssl_name dyp.global_data.pcounter local_data.drules dyprods in
  let dssl = { Flx_parse_data.fresh_dssl with macros = macros } in
  let local_data =
    if Drules.mem dssl_name local_data.drules then failwith ("DSSL " ^ dssl_name ^ " already defined!")
    else { local_data with drules = Drules.add dssl_name dssl local_data.drules }
  in
  let global_data,local_data = Flx_export_syntax.add_rules dssl_name dyp.global_data local_data  dyprods in
  (* This cal tries to avoid gratutions mods to global/local data
     by checking for physical equality. Note changes to any
     embedded mutable data structure propagate anyhow.
  *)
  let mods =
    (if dyp.global_data != global_data then [Global_data global_data] else [])
    @
    (if dyp.local_data != local_data then [Local_data local_data] else [])
  in
  Snull, mods


let _ = () (* dummy line to improve OCaml error location *)
# 324                "build/flxg-tmp\flx_parse.ml"
let __dypgen_ra_list, __dypgen_main_lexer, __dypgen_aux_lexer =
let parse_C_comment (count:'dypgen__Lex_parse_C_comment_Arg_count) lexbuf =
  match Dyp.lex "parse_C_comment" [(`Lex_parse_C_comment_Arg_count (count:'dypgen__Lex_parse_C_comment_Arg_count))] lexbuf with
  | `Lex_parse_C_comment x -> (x:'dypgen__Lex_parse_C_comment)
  | _ -> failwith "lexer `parse_C_comment' returned a wrong obj constructor"
in
let parse_fdoc_comment  lexbuf =
  match Dyp.lex "parse_fdoc_comment" [] lexbuf with
  | `Lex_parse_fdoc_comment x -> (x:'dypgen__Lex_parse_fdoc_comment)
  | _ -> failwith "lexer `parse_fdoc_comment' returned a wrong obj constructor"
in
[
(("syntax_unit",[Dyp.Non_ter ("syntax_init",Dyp.No_priority );Dyp.Non_ter ("top_statements",Dyp.No_priority );Dyp.Ter "ENDMARKER"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_syntax_init ( (
(_:'dypgen__Obj_syntax_init)
# 341                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_top_statements ( (
(_:'dypgen__Obj_top_statements)
# 344                "build/flxg-tmp\flx_parse.ml"
 as _2)); _3] -> `Obj_syntax_unit 
# 264 "build/flxg-tmp\flx_parse.dyp"
(
                                         ( dyp.last_local_data ):(local_data_t))
# 349                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("syntax_init",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_syntax_init 
# 267 "build/flxg-tmp\flx_parse.dyp"
(
   (
    let file = Flx_srcref.file (Flx_parse_srcref.getsr dyp) in
    print_endline ("syninit: Parsing " ^ file)
   ):'dypgen__Obj_syntax_init)
# 362                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("compilation_unit",[Dyp.Non_ter ("grammar_init",Dyp.No_priority );Dyp.Non_ter ("top_statements",Dyp.No_priority );Dyp.Ter "ENDMARKER"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_grammar_init ( (
(_:'dypgen__Obj_grammar_init)
# 370                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_top_statements ( (
(_:'dypgen__Obj_top_statements)
# 373                "build/flxg-tmp\flx_parse.ml"
 as _2)); _3] -> `Obj_compilation_unit 
# 273 "build/flxg-tmp\flx_parse.dyp"
(
                                          ( dyp.last_local_data ):(local_data_t))
# 378                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("grammar_init",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] ->  let res = 
# 275 "build/flxg-tmp\flx_parse.dyp"
(
              (
    (* print_endline ("grammar_init: Parsing " ^ file); *)
    let m = dyp.local_data in

    (* We need to reinstall the dssls that we loaded in syntax_unit. *)
    let to_install = tran_cls_dssls m.drules [] m.installed_dssls in
    let rules, prios = extract_syntax to_install m.drules in

    match !(dyp.global_data.parsing_device) with
    | Some device ->
      (* print_endline "Parsing device detected"; *)

      let ffpdev = Marshal.from_string device 0 in
      (* print_endline "Unmarshalled parsing device"; *)

      let add_rules, bindings = bind_grammar_rules dyp rules in
      let pdev = import_functions ffpdev dyp.parser_pilot add_rules in
      (), bindings @ [Parser pdev]

    | None ->
      (* print_endline "Parsing device missing"; *)

      (* Since we don't have a parsing device, we will have to run the scheme
       * commands. *)
      let env = dyp.global_data.env in
      let scm = List.rev m.scm in
      load_scheme_defs env scm;

      (* We need to bind after we've executed the scheme. *)
      let add_rules, bindings = bind_grammar_rules dyp rules in

      let local_data = { m with installed_dssls = to_install } in
      (*
      print_endline ("Mounting Dssls = " ^ (Drules.fold (fun k _ acc -> acc ^ " " ^ k) m.drules ""));
      *)

      (),
      bindings @ [Add_rules add_rules; Local_data local_data; Relation prios]
  ):'dypgen__Obj_grammar_init * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 426                "build/flxg-tmp\flx_parse.ml"
  in `Obj_grammar_init(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("stmt",[Dyp.Ter "HASH_LINE";Dyp.Ter "INTEGER";Dyp.Ter "STRING";Dyp.Regexp (Dyp.RE_Name "newline")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_HASH_LINE  (
(_:('obj Dyp.dyplexbuf))
# 435                "build/flxg-tmp\flx_parse.ml"
 as _1);`Obj_INTEGER  (
(_:(int))
# 438                "build/flxg-tmp\flx_parse.ml"
 as _2);`Obj_STRING  (
(_:(string))
# 441                "build/flxg-tmp\flx_parse.ml"
 as _3); `Lexeme_matched _4] -> `Obj_sexpr 
# 317 "build/flxg-tmp\flx_parse.dyp"
(
   (
     let sr = Flx_parse_srcref.getsr dyp in
     let lexbuf = _1 in
     let n = _2 in
     Flx_parse_srcref.set_lineno lexbuf n;
     Dyp.set_fname lexbuf _3;
     Snull
   ):'dypgen__Obj_sexpr)
# 453                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("stmt",[Dyp.Ter "HASH_LINE";Dyp.Ter "INTEGER";Dyp.Regexp (Dyp.RE_Name "newline")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_HASH_LINE  (
(_:('obj Dyp.dyplexbuf))
# 461                "build/flxg-tmp\flx_parse.ml"
 as _1);`Obj_INTEGER  (
(_:(int))
# 464                "build/flxg-tmp\flx_parse.ml"
 as _2); `Lexeme_matched _3] -> `Obj_sexpr 
# 327 "build/flxg-tmp\flx_parse.dyp"
(
   (
     let sr = Flx_parse_srcref.getsr dyp in
     let lexbuf = _1 in
     let n = _2 in
     Flx_parse_srcref.set_lineno lexbuf n;
     Snull
   ):'dypgen__Obj_sexpr)
# 475                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("top_statements",[Dyp.Non_ter ("sstatement_star",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_sstatement_star ( (
(_:'dypgen__Obj_sstatement_star)
# 483                "build/flxg-tmp\flx_parse.ml"
 as _1))] ->  let res = 
# 338 "build/flxg-tmp\flx_parse.dyp"
(
   (
     let local_data =
        match _1 with
        | [] -> dyp.last_local_data
        | stmts -> 
          { 
            dyp.last_local_data with 
            rev_stmts_as_scheme = stmts @ dyp.last_local_data.rev_stmts_as_scheme; 
          }
      in
      (),[Keep_grammar; Local_data (local_data)]
   ):'dypgen__Obj_top_statements * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 499                "build/flxg-tmp\flx_parse.ml"
  in `Obj_top_statements(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("top_statements",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_top_statements 
# 351 "build/flxg-tmp\flx_parse.dyp"
(
   ( () ):'dypgen__Obj_top_statements)
# 510                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sstatements",[Dyp.Non_ter ("sstatement_star",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_sstatement_star ( (
(_:'dypgen__Obj_sstatement_star)
# 518                "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_sexpr 
# 356 "build/flxg-tmp\flx_parse.dyp"
(
                    ( Ocs_misc.make_slist Snull _1 ):'dypgen__Obj_sexpr)
# 523                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sstatement_star",[Dyp.Non_ter ("sstatement_star",Dyp.No_priority );Dyp.Non_ter ("stmt",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_sstatement_star ( (
(_:'dypgen__Obj_sstatement_star)
# 531                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_sexpr ( (
(_:'dypgen__Obj_sexpr)
# 534                "build/flxg-tmp\flx_parse.ml"
 as _2))] ->  let res = 
# 360 "build/flxg-tmp\flx_parse.dyp"
(
   (
     (match _2 with Snull -> _1 | stmt -> stmt :: _1), (* reverse order *)
     [Keep_grammar; Local_data (dyp.last_local_data)]
    ):'dypgen__Obj_sstatement_star * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 542                "build/flxg-tmp\flx_parse.ml"
  in `Obj_sstatement_star(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sstatement_star",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_sstatement_star 
# 364 "build/flxg-tmp\flx_parse.dyp"
(
    ( [] ):'dypgen__Obj_sstatement_star)
# 553                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("name_list",[Dyp.Ter "NAME";Dyp.Non_ter ("name_list",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 561                "build/flxg-tmp\flx_parse.ml"
 as _1);`Obj_name_list ( (
(_:'dypgen__Obj_name_list)
# 564                "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_name_list 
# 367 "build/flxg-tmp\flx_parse.dyp"
(
                   ( _1 :: _2 ):'dypgen__Obj_name_list)
# 569                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("name_list",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_name_list 
# 368 "build/flxg-tmp\flx_parse.dyp"
(
    ( [] ):'dypgen__Obj_name_list)
# 579                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprods",[Dyp.Non_ter ("dyprods",Dyp.No_priority );Dyp.Non_ter ("dyprod",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_dyprods ( (
(_:'dypgen__Obj_dyprods)
# 587                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_dyprod ( (
(_:'dypgen__Obj_dyprod)
# 590                "build/flxg-tmp\flx_parse.ml"
 as _2))] ->  let res = 
# 372 "build/flxg-tmp\flx_parse.dyp"
(
    ( 
      _2 :: _1,  
     [Keep_grammar; Local_data (dyp.last_local_data)]
    ):'dypgen__Obj_dyprods * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 598                "build/flxg-tmp\flx_parse.ml"
  in `Obj_dyprods(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprods",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_dyprods 
# 376 "build/flxg-tmp\flx_parse.dyp"
(
    ( [] ):'dypgen__Obj_dyprods)
# 609                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("opt_private",[Dyp.Regexp (Dyp.RE_String "private")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1] -> `Obj_opt_private 
# 379 "build/flxg-tmp\flx_parse.dyp"
(
              ( Privacy_Private ):'dypgen__Obj_opt_private)
# 619                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("opt_private",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_opt_private 
# 380 "build/flxg-tmp\flx_parse.dyp"
(
    ( Privacy_Public ):'dypgen__Obj_opt_private)
# 629                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("opt_prio",[Dyp.Regexp (Dyp.RE_String "[");Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "]")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_NAME  (
(_:(string))
# 637                "build/flxg-tmp\flx_parse.ml"
 as _2); `Lexeme_matched _3] -> `Obj_opt_prio 
# 383 "build/flxg-tmp\flx_parse.dyp"
(
                 ( Priority_Name _2 ):'dypgen__Obj_opt_prio)
# 642                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("opt_prio",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_opt_prio 
# 384 "build/flxg-tmp\flx_parse.dyp"
(
    ( Priority_Default ):'dypgen__Obj_opt_prio)
# 652                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("pri",[Dyp.Ter "NAME"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 660                "build/flxg-tmp\flx_parse.ml"
 as _1)] -> `Obj_pri 
# 387 "build/flxg-tmp\flx_parse.dyp"
(
         ( _1 ):'dypgen__Obj_pri)
# 665                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("prilist",[Dyp.Non_ter ("pri",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "<");Dyp.Non_ter ("prilist",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_pri ( (
(_:'dypgen__Obj_pri)
# 673                "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2;`Obj_prilist ( (
(_:'dypgen__Obj_prilist)
# 676                "build/flxg-tmp\flx_parse.ml"
 as _3))] -> `Obj_prilist 
# 390 "build/flxg-tmp\flx_parse.dyp"
(
                    ( _1 :: _3 ):'dypgen__Obj_prilist)
# 681                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("prilist",[Dyp.Non_ter ("pri",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_pri ( (
(_:'dypgen__Obj_pri)
# 689                "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_prilist 
# 391 "build/flxg-tmp\flx_parse.dyp"
(
        ( [_1] ):'dypgen__Obj_prilist)
# 694                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprod",[Dyp.Regexp (Dyp.RE_String "open");Dyp.Regexp (Dyp.RE_String "syntax");Dyp.Non_ter ("basic_name_comma_list",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1; `Lexeme_matched _2;`Obj_basic_name_comma_list ( (
(_:'dypgen__Obj_basic_name_comma_list)
# 702                "build/flxg-tmp\flx_parse.ml"
 as _3)); `Lexeme_matched _4] ->  let res = 
# 395 "build/flxg-tmp\flx_parse.dyp"
(
    (
      Rule_Nop, open_syntax dyp _3
    ):'dypgen__Obj_dyprod * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 709                "build/flxg-tmp\flx_parse.ml"
  in `Obj_dyprod(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprod",[Dyp.Non_ter ("opt_private",Dyp.No_priority );Dyp.Ter "NAME";Dyp.Non_ter ("opt_prio",Dyp.No_priority );Dyp.Non_ter ("name_list",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ":=");Dyp.Non_ter ("dyalts",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_opt_private ( (
(_:'dypgen__Obj_opt_private)
# 718                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_NAME  (
(_:(string))
# 721                "build/flxg-tmp\flx_parse.ml"
 as _2);`Obj_opt_prio ( (
(_:'dypgen__Obj_opt_prio)
# 724                "build/flxg-tmp\flx_parse.ml"
 as _3));`Obj_name_list ( (
(_:'dypgen__Obj_name_list)
# 727                "build/flxg-tmp\flx_parse.ml"
 as _4)); `Lexeme_matched _5;`Obj_dyalts ( (
(_:'dypgen__Obj_dyalts)
# 730                "build/flxg-tmp\flx_parse.ml"
 as _6)); `Lexeme_matched _7] -> `Obj_dyprod 
# 400 "build/flxg-tmp\flx_parse.dyp"
(
     (
       (*
       print_endline ("RULE " ^ snd _2);
       *)
       Rule_Unprocessed_Scheme_rule (_1, _2, _3, _4, _6)
     ):'dypgen__Obj_dyprod)
# 740                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprod",[Dyp.Non_ter ("opt_private",Dyp.No_priority );Dyp.Ter "NAME";Dyp.Non_ter ("opt_prio",Dyp.No_priority );Dyp.Non_ter ("name_list",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "=");Dyp.Non_ter ("symbol",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_opt_private ( (
(_:'dypgen__Obj_opt_private)
# 748                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_NAME  (
(_:(string))
# 751                "build/flxg-tmp\flx_parse.ml"
 as _2);`Obj_opt_prio ( (
(_:'dypgen__Obj_opt_prio)
# 754                "build/flxg-tmp\flx_parse.ml"
 as _3));`Obj_name_list ( (
(_:'dypgen__Obj_name_list)
# 757                "build/flxg-tmp\flx_parse.ml"
 as _4)); `Lexeme_matched _5;`Obj_symbol ( (
(_:'dypgen__Obj_symbol)
# 760                "build/flxg-tmp\flx_parse.ml"
 as _6)); `Lexeme_matched _7] -> `Obj_dyprod 
# 408 "build/flxg-tmp\flx_parse.dyp"
(
     (
       (*
       print_endline ("RULE " ^ snd _2);
       *)
       let prod = [_6] in
       let action = Action_Scheme "_1" in
       let anote = "" in
       let dyalt = prod,Flx_parse_srcref.getsr dyp,action,anote in
       let dyalts = [dyalt] in 
       Rule_Unprocessed_Scheme_rule (_1, _2, _3, _4, dyalts)
     ):'dypgen__Obj_dyprod)
# 775                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprod",[Dyp.Regexp (Dyp.RE_String "requires");Dyp.Non_ter ("basic_name_comma_list",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_basic_name_comma_list ( (
(_:'dypgen__Obj_basic_name_comma_list)
# 783                "build/flxg-tmp\flx_parse.ml"
 as _2)); `Lexeme_matched _3] -> `Obj_dyprod 
# 421 "build/flxg-tmp\flx_parse.dyp"
(
     (
        let dssls = List.map snd _2 in
       Rule_Requires dssls
     ):'dypgen__Obj_dyprod)
# 791                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprod",[Dyp.Ter "NAME";Dyp.Non_ter ("prilist",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 799                "build/flxg-tmp\flx_parse.ml"
 as _1);`Obj_prilist ( (
(_:'dypgen__Obj_prilist)
# 802                "build/flxg-tmp\flx_parse.ml"
 as _2)); `Lexeme_matched _3] -> `Obj_dyprod 
# 427 "build/flxg-tmp\flx_parse.dyp"
(
     (
       if _1 <> "priority" then raise Giveup;
       Rule_Priorities _2
     ):'dypgen__Obj_dyprod)
# 810                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprod",[Dyp.Regexp (Dyp.RE_String "regdef");Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "=");Dyp.Non_ter ("ssre",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_NAME  (
(_:(string))
# 818                "build/flxg-tmp\flx_parse.ml"
 as _2); `Lexeme_matched _3;`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 821                "build/flxg-tmp\flx_parse.ml"
 as _4)); `Lexeme_matched _5] -> `Obj_dyprod 
# 432 "build/flxg-tmp\flx_parse.dyp"
(
                                ( Rule_Regex (_2,_4) ):'dypgen__Obj_dyprod)
# 826                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyprod",[Dyp.Non_ter ("opt_private",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "literal");Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "=>#");Dyp.Ter "STRING";Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_opt_private ( (
(_:'dypgen__Obj_opt_private)
# 834                "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2;`Obj_NAME  (
(_:(string))
# 837                "build/flxg-tmp\flx_parse.ml"
 as _3); `Lexeme_matched _4;`Obj_STRING  (
(_:(string))
# 840                "build/flxg-tmp\flx_parse.ml"
 as _5); `Lexeme_matched _6] -> `Obj_dyprod 
# 435 "build/flxg-tmp\flx_parse.dyp"
(
     (
       let priv = _1 in
       let name = _3 in
       let prio = Priority_Default in
       let scm = _5 in
       let action = Action_Scheme scm in
       let anote = "" in
       let prod = [Grammar_Regex (RE_Name name)] in
(*
       print_endline ("Defining literal " ^ name ^ " as " ^ scm);
*)
       let dyalts = [prod,Flx_parse_srcref.getsr dyp,action,anote] in
       Rule_Unprocessed_Scheme_rule (priv,name,prio,[],dyalts) 
     ):'dypgen__Obj_dyprod)
# 858                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Non_ter ("ssre",Dyp.Greatereq_priority "ralt_prix");Dyp.Non_ter ("dypgen__nested_nt_1",Dyp.No_priority )],"ralt_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 866                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_dypgen__nested_nt_1 ( (
(_:'dypgen__Obj_dypgen__nested_nt_1)
# 869                "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_ssre 
# 450 "build/flxg-tmp\flx_parse.dyp"
(
                                                    ( RE_Alt (_1::_2) ):'dypgen__Obj_ssre)
# 874                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dypgen__nested_nt_0",[Dyp.Regexp (Dyp.RE_String "|");Dyp.Non_ter ("ssre",Dyp.Greater_priority "ralt_prix")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 882                "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_dypgen__nested_nt_0 
(
(_2):'dypgen__Obj_dypgen__nested_nt_0)
# 886                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dypgen__nested_nt_1",[Dyp.Non_ter ("dypgen__nested_nt_2",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_dypgen__nested_nt_2 ( (
(_:'dypgen__Obj_dypgen__nested_nt_2)
# 894                "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_dypgen__nested_nt_1 
(
(List.rev _1):'dypgen__Obj_dypgen__nested_nt_1)
# 898                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dypgen__nested_nt_2",[Dyp.Non_ter ("dypgen__nested_nt_2",Dyp.No_priority );Dyp.Non_ter ("dypgen__nested_nt_0",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_dypgen__nested_nt_2 ( (
(_:'dypgen__Obj_dypgen__nested_nt_2)
# 906                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_dypgen__nested_nt_0 ( (
(_:'dypgen__Obj_dypgen__nested_nt_0)
# 909                "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_dypgen__nested_nt_2 
(
(_2::_1):'dypgen__Obj_dypgen__nested_nt_2)
# 913                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dypgen__nested_nt_2",[Dyp.Non_ter ("dypgen__nested_nt_0",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_dypgen__nested_nt_0 ( (
(_:'dypgen__Obj_dypgen__nested_nt_0)
# 921                "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_dypgen__nested_nt_2 
(
([_1]):'dypgen__Obj_dypgen__nested_nt_2)
# 925                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Non_ter ("ssre",Dyp.Greatereq_priority "rseq_prix");Dyp.Non_ter ("dypgen__nested_nt_4",Dyp.No_priority )],"rseq_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 933                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_dypgen__nested_nt_4 ( (
(_:'dypgen__Obj_dypgen__nested_nt_4)
# 936                "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_ssre 
# 451 "build/flxg-tmp\flx_parse.dyp"
(
                                                ( RE_Seq (_1::_2)  ):'dypgen__Obj_ssre)
# 941                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dypgen__nested_nt_3",[Dyp.Non_ter ("ssre",Dyp.Greater_priority "rseq_prix")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 949                "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_dypgen__nested_nt_3 
(
(_1):'dypgen__Obj_dypgen__nested_nt_3)
# 953                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dypgen__nested_nt_4",[Dyp.Non_ter ("dypgen__nested_nt_5",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_dypgen__nested_nt_5 ( (
(_:'dypgen__Obj_dypgen__nested_nt_5)
# 961                "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_dypgen__nested_nt_4 
(
(List.rev _1):'dypgen__Obj_dypgen__nested_nt_4)
# 965                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dypgen__nested_nt_5",[Dyp.Non_ter ("dypgen__nested_nt_5",Dyp.No_priority );Dyp.Non_ter ("dypgen__nested_nt_3",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_dypgen__nested_nt_5 ( (
(_:'dypgen__Obj_dypgen__nested_nt_5)
# 973                "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_dypgen__nested_nt_3 ( (
(_:'dypgen__Obj_dypgen__nested_nt_3)
# 976                "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_dypgen__nested_nt_5 
(
(_2::_1):'dypgen__Obj_dypgen__nested_nt_5)
# 980                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dypgen__nested_nt_5",[Dyp.Non_ter ("dypgen__nested_nt_3",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_dypgen__nested_nt_3 ( (
(_:'dypgen__Obj_dypgen__nested_nt_3)
# 988                "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_dypgen__nested_nt_5 
(
([_1]):'dypgen__Obj_dypgen__nested_nt_5)
# 992                "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Non_ter ("ssre",Dyp.Greatereq_priority "rpostfix_prix");Dyp.Regexp (Dyp.RE_String "*")],"rpostfix_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 1000               "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2] -> `Obj_ssre 
# 452 "build/flxg-tmp\flx_parse.dyp"
(
                                    ( RE_Star _1 ):'dypgen__Obj_ssre)
# 1005               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Non_ter ("ssre",Dyp.Greatereq_priority "rpostfix_prix");Dyp.Regexp (Dyp.RE_String "+")],"rpostfix_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 1013               "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2] -> `Obj_ssre 
# 453 "build/flxg-tmp\flx_parse.dyp"
(
                                    ( RE_Plus _1 ):'dypgen__Obj_ssre)
# 1018               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Non_ter ("ssre",Dyp.Greatereq_priority "rpostfix_prix");Dyp.Regexp (Dyp.RE_String "?")],"rpostfix_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 1026               "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2] -> `Obj_ssre 
# 454 "build/flxg-tmp\flx_parse.dyp"
(
                                    ( RE_Option _1 ):'dypgen__Obj_ssre)
# 1031               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Regexp (Dyp.RE_String "(");Dyp.Non_ter ("ssre",Dyp.Greatereq_priority "ralt_prix");Dyp.Regexp (Dyp.RE_String ")")],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_ssre ( (
(_:'dypgen__Obj_ssre)
# 1039               "build/flxg-tmp\flx_parse.ml"
 as _2)); `Lexeme_matched _3] -> `Obj_ssre 
# 455 "build/flxg-tmp\flx_parse.dyp"
(
                                    (_2 ):'dypgen__Obj_ssre)
# 1044               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Ter "INTEGER"],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_INTEGER  (
(_:(int))
# 1052               "build/flxg-tmp\flx_parse.ml"
 as _1)] -> `Obj_ssre 
# 456 "build/flxg-tmp\flx_parse.dyp"
(
                  ( RE_Char (Char.chr _1) ):'dypgen__Obj_ssre)
# 1057               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Regexp (Dyp.RE_String "_")],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1] -> `Obj_ssre 
# 457 "build/flxg-tmp\flx_parse.dyp"
(
              ( RE_Char_set [Char.chr 0, Char.chr 255] ):'dypgen__Obj_ssre)
# 1067               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Regexp (Dyp.RE_String ".")],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1] -> `Obj_ssre 
# 458 "build/flxg-tmp\flx_parse.dyp"
(
              ( RE_Char_set [Char.chr 32, Char.chr 255] ):'dypgen__Obj_ssre)
# 1077               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Regexp (Dyp.RE_String "[");Dyp.Ter "INTEGER";Dyp.Regexp (Dyp.RE_String "-");Dyp.Ter "INTEGER";Dyp.Regexp (Dyp.RE_String "]")],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_INTEGER  (
(_:(int))
# 1085               "build/flxg-tmp\flx_parse.ml"
 as _2); `Lexeme_matched _3;`Obj_INTEGER  (
(_:(int))
# 1088               "build/flxg-tmp\flx_parse.ml"
 as _4); `Lexeme_matched _5] -> `Obj_ssre 
# 459 "build/flxg-tmp\flx_parse.dyp"
(
                                      ( 
    RE_Char_set [
      Char.chr _2, 
      Char.chr _4
    ] ):'dypgen__Obj_ssre)
# 1097               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Regexp (Dyp.RE_String "charset");Dyp.Ter "STRING"],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_STRING  (
(_:(string))
# 1105               "build/flxg-tmp\flx_parse.ml"
 as _2)] -> `Obj_ssre 
# 465 "build/flxg-tmp\flx_parse.dyp"
(
                           (
    let lst = ref [] in
    String.iter (fun ch -> lst := (ch,ch)::(!lst)) _2;
    RE_Char_set (!lst)
  ):'dypgen__Obj_ssre)
# 1114               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Regexp (Dyp.RE_String "[");Dyp.Ter "STRING";Dyp.Regexp (Dyp.RE_String "]")],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_STRING  (
(_:(string))
# 1122               "build/flxg-tmp\flx_parse.ml"
 as _2); `Lexeme_matched _3] -> `Obj_ssre 
# 471 "build/flxg-tmp\flx_parse.dyp"
(
                         (
    let lst = ref [] in
    String.iter (fun ch -> lst := (ch,ch)::(!lst)) _2;
    RE_Char_set (!lst)
  ):'dypgen__Obj_ssre)
# 1131               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Ter "STRING"],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_STRING  (
(_:(string))
# 1139               "build/flxg-tmp\flx_parse.ml"
 as _1)] -> `Obj_ssre 
# 477 "build/flxg-tmp\flx_parse.dyp"
(
                 ( RE_String _1 ):'dypgen__Obj_ssre)
# 1144               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("ssre",[Dyp.Ter "NAME"],"ratom_prix",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1152               "build/flxg-tmp\flx_parse.ml"
 as _1)] -> `Obj_ssre 
# 478 "build/flxg-tmp\flx_parse.dyp"
(
               (RE_Name _1 ):'dypgen__Obj_ssre)
# 1157               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("action",[Dyp.Ter "STRING"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_STRING  (
(_:(string))
# 1165               "build/flxg-tmp\flx_parse.ml"
 as _1)] -> `Obj_action 
# 481 "build/flxg-tmp\flx_parse.dyp"
(
            ( Action_Scheme _1 ):'dypgen__Obj_action)
# 1170               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("action",[Dyp.Regexp (Dyp.RE_String "(");Dyp.Non_ter ("sexpr",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ")")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_sexpr ( (
(_:'dypgen__Obj_sexpr)
# 1178               "build/flxg-tmp\flx_parse.ml"
 as _2)); `Lexeme_matched _3] -> `Obj_action 
# 482 "build/flxg-tmp\flx_parse.dyp"
(
                    ( Action_Expr _2 ):'dypgen__Obj_action)
# 1183               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("action",[Dyp.Regexp (Dyp.RE_String "{");Dyp.Non_ter ("sstatements",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "}")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_sexpr ( (
(_:'dypgen__Obj_sexpr)
# 1191               "build/flxg-tmp\flx_parse.ml"
 as _2)); `Lexeme_matched _3] -> `Obj_action 
# 483 "build/flxg-tmp\flx_parse.dyp"
(
                         ( Action_Statements _2 ):'dypgen__Obj_action)
# 1196               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("note",[Dyp.Ter "NAME";Dyp.Ter "STRING"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1204               "build/flxg-tmp\flx_parse.ml"
 as _1);`Obj_STRING  (
(_:(string))
# 1207               "build/flxg-tmp\flx_parse.ml"
 as _2)] -> `Obj_note 
# 487 "build/flxg-tmp\flx_parse.dyp"
(
     (
       if _1 <> "note" then raise Giveup;
       _2
     ):'dypgen__Obj_note)
# 1215               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("note",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_note 
# 491 "build/flxg-tmp\flx_parse.dyp"
(
     ( "" ):'dypgen__Obj_note)
# 1225               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyalt",[Dyp.Non_ter ("rhs",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "=>#");Dyp.Non_ter ("action",Dyp.No_priority );Dyp.Non_ter ("note",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_rhs ( (
(_:'dypgen__Obj_rhs)
# 1233               "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2;`Obj_action ( (
(_:'dypgen__Obj_action)
# 1236               "build/flxg-tmp\flx_parse.ml"
 as _3));`Obj_note ( (
(_:'dypgen__Obj_note)
# 1239               "build/flxg-tmp\flx_parse.ml"
 as _4))] -> `Obj_dyalt 
# 495 "build/flxg-tmp\flx_parse.dyp"
(
     (
       let anote = _4 in
       let prod = _1 in
       let action = _3 in
       let action : action_t =
         match action with
         | Action_Scheme _ as x -> x
         | Action_Expr _ as x -> x
         | Action_Statements _ as x -> x
         | Action_None as x -> x
       in
       prod,Flx_parse_srcref.getsr dyp,action,anote
     ):'dypgen__Obj_dyalt)
# 1256               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyalt",[Dyp.Non_ter ("rhs",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_rhs ( (
(_:'dypgen__Obj_rhs)
# 1264               "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_dyalt 
# 508 "build/flxg-tmp\flx_parse.dyp"
(
         ( _1,Flx_parse_srcref.getsr dyp,Action_None,"" ):'dypgen__Obj_dyalt)
# 1269               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyaltlist",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_dyaltlist 
# 511 "build/flxg-tmp\flx_parse.dyp"
(
     ( [] ):'dypgen__Obj_dyaltlist)
# 1279               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyaltlist",[Dyp.Regexp (Dyp.RE_String "|");Dyp.Non_ter ("dyalt",Dyp.No_priority );Dyp.Non_ter ("dyaltlist",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_dyalt ( (
(_:'dypgen__Obj_dyalt)
# 1287               "build/flxg-tmp\flx_parse.ml"
 as _2));`Obj_dyaltlist ( (
(_:'dypgen__Obj_dyaltlist)
# 1290               "build/flxg-tmp\flx_parse.ml"
 as _3))] -> `Obj_dyaltlist 
# 512 "build/flxg-tmp\flx_parse.dyp"
(
                         ( _2 :: _3 ):'dypgen__Obj_dyaltlist)
# 1295               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyalts",[Dyp.Non_ter ("dyalt",Dyp.No_priority );Dyp.Non_ter ("dyaltlist",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_dyalt ( (
(_:'dypgen__Obj_dyalt)
# 1303               "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_dyaltlist ( (
(_:'dypgen__Obj_dyaltlist)
# 1306               "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_dyalts 
# 515 "build/flxg-tmp\flx_parse.dyp"
(
                     ( _1 :: _2 ):'dypgen__Obj_dyalts)
# 1311               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("dyalts",[Dyp.Regexp (Dyp.RE_String "|");Dyp.Non_ter ("dyalt",Dyp.No_priority );Dyp.Non_ter ("dyaltlist",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_dyalt ( (
(_:'dypgen__Obj_dyalt)
# 1319               "build/flxg-tmp\flx_parse.ml"
 as _2));`Obj_dyaltlist ( (
(_:'dypgen__Obj_dyaltlist)
# 1322               "build/flxg-tmp\flx_parse.ml"
 as _3))] -> `Obj_dyalts 
# 516 "build/flxg-tmp\flx_parse.dyp"
(
                          ( _2 :: _3 ):'dypgen__Obj_dyalts)
# 1327               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("rhs",[Dyp.Non_ter ("symbol",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_symbol ( (
(_:'dypgen__Obj_symbol)
# 1335               "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_rhs 
# 519 "build/flxg-tmp\flx_parse.dyp"
(
           ( [_1] ):'dypgen__Obj_rhs)
# 1340               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("rhs",[Dyp.Non_ter ("symbol",Dyp.No_priority );Dyp.Non_ter ("rhs",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_symbol ( (
(_:'dypgen__Obj_symbol)
# 1348               "build/flxg-tmp\flx_parse.ml"
 as _1));`Obj_rhs ( (
(_:'dypgen__Obj_rhs)
# 1351               "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_rhs 
# 520 "build/flxg-tmp\flx_parse.dyp"
(
               ( _1 :: _2 ):'dypgen__Obj_rhs)
# 1356               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Ter "NAME"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1364               "build/flxg-tmp\flx_parse.ml"
 as _1)] -> `Obj_symbol 
# 523 "build/flxg-tmp\flx_parse.dyp"
(
         ( Grammar_Nonterminal (_1, Priority_None) ):'dypgen__Obj_symbol)
# 1369               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Ter "STRING"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_STRING  (
(_:(string))
# 1377               "build/flxg-tmp\flx_parse.ml"
 as _1)] -> `Obj_symbol 
# 524 "build/flxg-tmp\flx_parse.dyp"
(
           ( Grammar_String _1 ):'dypgen__Obj_symbol)
# 1382               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Regexp (Dyp.RE_String "(");Dyp.Non_ter ("dyalts",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ")")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_dyalts ( (
(_:'dypgen__Obj_dyalts)
# 1390               "build/flxg-tmp\flx_parse.ml"
 as _2)); `Lexeme_matched _3] -> `Obj_symbol 
# 525 "build/flxg-tmp\flx_parse.dyp"
(
                   ( Grammar_Group _2 ):'dypgen__Obj_symbol)
# 1395               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "[");Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "]")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1403               "build/flxg-tmp\flx_parse.ml"
 as _1); `Lexeme_matched _2;`Obj_NAME  (
(_:(string))
# 1406               "build/flxg-tmp\flx_parse.ml"
 as _3); `Lexeme_matched _4] -> `Obj_symbol 
# 526 "build/flxg-tmp\flx_parse.dyp"
(
                      ( Grammar_Nonterminal (_1, Priority_Greatereq _3) ):'dypgen__Obj_symbol)
# 1411               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "[");Dyp.Regexp (Dyp.RE_String ">");Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "]")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1419               "build/flxg-tmp\flx_parse.ml"
 as _1); `Lexeme_matched _2; `Lexeme_matched _3;`Obj_NAME  (
(_:(string))
# 1422               "build/flxg-tmp\flx_parse.ml"
 as _4); `Lexeme_matched _5] -> `Obj_symbol 
# 527 "build/flxg-tmp\flx_parse.dyp"
(
                          ( Grammar_Nonterminal (_1, Priority_Greater _4) ):'dypgen__Obj_symbol)
# 1427               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Ter "NAME";Dyp.Non_ter ("macro_args",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1435               "build/flxg-tmp\flx_parse.ml"
 as _1);`Obj_macro_args ( (
(_:'dypgen__Obj_macro_args)
# 1438               "build/flxg-tmp\flx_parse.ml"
 as _2))] -> `Obj_symbol 
# 528 "build/flxg-tmp\flx_parse.dyp"
(
                     ( Grammar_Macro_Call (_1,_2) ):'dypgen__Obj_symbol)
# 1443               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "::");Dyp.Ter "NAME";Dyp.Non_ter ("macro_args",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1451               "build/flxg-tmp\flx_parse.ml"
 as _1); `Lexeme_matched _2;`Obj_NAME  (
(_:(string))
# 1454               "build/flxg-tmp\flx_parse.ml"
 as _3);`Obj_macro_args ( (
(_:'dypgen__Obj_macro_args)
# 1457               "build/flxg-tmp\flx_parse.ml"
 as _4))] -> `Obj_symbol 
# 529 "build/flxg-tmp\flx_parse.dyp"
(
                               ( Grammar_External_Macro_Call (_1,_3,_4) ):'dypgen__Obj_symbol)
# 1462               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Non_ter ("symbol",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "*")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_symbol ( (
(_:'dypgen__Obj_symbol)
# 1470               "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2] -> `Obj_symbol 
# 530 "build/flxg-tmp\flx_parse.dyp"
(
               ( Grammar_Star _1 ):'dypgen__Obj_symbol)
# 1475               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Non_ter ("symbol",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "+")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_symbol ( (
(_:'dypgen__Obj_symbol)
# 1483               "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2] -> `Obj_symbol 
# 531 "build/flxg-tmp\flx_parse.dyp"
(
               ( Grammar_Plus _1 ):'dypgen__Obj_symbol)
# 1488               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("symbol",[Dyp.Non_ter ("symbol",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "?")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_symbol ( (
(_:'dypgen__Obj_symbol)
# 1496               "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2] -> `Obj_symbol 
# 532 "build/flxg-tmp\flx_parse.dyp"
(
               ( Grammar_Quest _1 ):'dypgen__Obj_symbol)
# 1501               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("macro_args",[Dyp.Regexp (Dyp.RE_String "<");Dyp.Non_ter ("symbol",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ">")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_symbol ( (
(_:'dypgen__Obj_symbol)
# 1509               "build/flxg-tmp\flx_parse.ml"
 as _2)); `Lexeme_matched _3] -> `Obj_macro_args 
# 535 "build/flxg-tmp\flx_parse.dyp"
(
                   ( [_2] ):'dypgen__Obj_macro_args)
# 1514               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("macro_args",[Dyp.Regexp (Dyp.RE_String "<");Dyp.Non_ter ("symbol",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ">");Dyp.Non_ter ("macro_args",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_symbol ( (
(_:'dypgen__Obj_symbol)
# 1522               "build/flxg-tmp\flx_parse.ml"
 as _2)); `Lexeme_matched _3;`Obj_macro_args ( (
(_:'dypgen__Obj_macro_args)
# 1525               "build/flxg-tmp\flx_parse.ml"
 as _4))] -> `Obj_macro_args 
# 536 "build/flxg-tmp\flx_parse.dyp"
(
                              ( _2 :: _4 ):'dypgen__Obj_macro_args)
# 1530               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("stmt",[Dyp.Regexp (Dyp.RE_String "SCHEME");Dyp.Ter "STRING";Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_STRING  (
(_:(string))
# 1538               "build/flxg-tmp\flx_parse.ml"
 as _2); `Lexeme_matched _3] ->  let res = 
# 541 "build/flxg-tmp\flx_parse.dyp"
(
    (
      let sr = Flx_parse_srcref.getsr dyp in
      let s = _2 in
      let failwith x = print_endline ("Evaluating " ^ s); failwith x in
      (*
      let env = Ocs_env.env_copy dyp.local_data.env in
      *)
      let env = dyp.global_data.env in
      let r =
        try Flx_ocs_run.scheme_run sr env s
        with Ocs_error.Error err | Ocs_error.ErrorL (_,err) ->
          print_endline ("Error "^err^" executing " ^s);
          failwith "Error executing SCHEME"
      in
      let local_data = { dyp.local_data with scm = (sr,s) :: dyp.local_data.scm } in
      Snull, [Local_data local_data]
    ):'dypgen__Obj_sexpr * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 1559               "build/flxg-tmp\flx_parse.ml"
  in `Obj_sexpr(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("stmt",[Dyp.Regexp (Dyp.RE_String "SAVE");Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1; `Lexeme_matched _2] -> `Obj_sexpr 
# 560 "build/flxg-tmp\flx_parse.dyp"
(
    (
      print_endline "Setting automaton";
      let sr = Flx_parse_srcref.getsr dyp in
      let s = Marshal.to_string (function_free_pdev dyp.parser_pilot.pp_dev) [] in
      dyp.global_data.parsing_device := Some s;
      print_endline "Automaton set";
      Snull
    ):'dypgen__Obj_sexpr)
# 1577               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("stmt",[Dyp.Regexp (Dyp.RE_String "STMT");Dyp.Ter "STRING";Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_STRING  (
(_:(string))
# 1585               "build/flxg-tmp\flx_parse.ml"
 as _2); `Lexeme_matched _3] ->  let res = 
# 570 "build/flxg-tmp\flx_parse.dyp"
(
    (
      let sr = Flx_parse_srcref.getsr dyp in
      let s = _2 in
      let failwith x = print_endline ("Evaluating " ^ s); failwith x in
      (*
      let env = Ocs_env.env_copy dyp.local_data.env in
      *)
      let env = dyp.global_data.env in
      let r =
        try Flx_ocs_run.scheme_run sr env s
        with Ocs_error.Error err | Ocs_error.ErrorL (_,err) ->
          print_endline ("Error "^err^" executing " ^s);
          failwith "Error executing SCHEME"
      in
      let local_data = { dyp.local_data with scm = (sr,s) :: dyp.local_data.scm } in
      r, [Local_data local_data]
    ):'dypgen__Obj_sexpr * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 1606               "build/flxg-tmp\flx_parse.ml"
  in `Obj_sexpr(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("schemevar",[Dyp.Ter "NAME"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1615               "build/flxg-tmp\flx_parse.ml"
 as _1)] ->  let res = 
# 590 "build/flxg-tmp\flx_parse.dyp"
(
    (
      let sr = Flx_parse_srcref.getsr dyp in
      let s = _1 in
      let failwith x = print_endline ("Evaluating " ^ s); failwith x in
      (*
      let env = Ocs_env.env_copy dyp.local_data.env in
      *)
      let env = dyp.global_data.env in
      let r =
        try Flx_ocs_run.scheme_run sr env s
        with Ocs_error.Error err | Ocs_error.ErrorL (_,err) ->
          print_endline ("Error "^err^" executing " ^s);
          failwith "Error executing SCHEME"
      in
      print_endline ("NAME=" ^ s ^ ", evaluates to " ^ Ocs_print.string_of_ocs r);
      let local_data = dyp.local_data in
      r, [Local_data local_data]
     ):'dypgen__Obj_sexpr * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 1637               "build/flxg-tmp\flx_parse.ml"
  in `Obj_sexpr(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("stmt",[Dyp.Regexp (Dyp.RE_String "syntax");Dyp.Ter "NAME";Dyp.Regexp (Dyp.RE_String "{");Dyp.Non_ter ("dyprods",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String "}")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1;`Obj_NAME  (
(_:(string))
# 1646               "build/flxg-tmp\flx_parse.ml"
 as _2); `Lexeme_matched _3;`Obj_dyprods ( (
(_:'dypgen__Obj_dyprods)
# 1649               "build/flxg-tmp\flx_parse.ml"
 as _4)); `Lexeme_matched _5] ->  let res = 
# 611 "build/flxg-tmp\flx_parse.dyp"
(
    (
       define_syntax dyp _2 _4
    ):'dypgen__Obj_sexpr * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 1656               "build/flxg-tmp\flx_parse.ml"
  in `Obj_sexpr(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("stmt",[Dyp.Regexp (Dyp.RE_String "open");Dyp.Regexp (Dyp.RE_String "syntax");Dyp.Non_ter ("basic_name_comma_list",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ";")],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ `Lexeme_matched _1; `Lexeme_matched _2;`Obj_basic_name_comma_list ( (
(_:'dypgen__Obj_basic_name_comma_list)
# 1665               "build/flxg-tmp\flx_parse.ml"
 as _3)); `Lexeme_matched _4] ->  let res = 
# 616 "build/flxg-tmp\flx_parse.dyp"
(
    (
       Snull,open_syntax dyp _3
    ):'dypgen__Obj_sexpr * ('t,'obj,'gd,'ld,'l) Dyp.dyp_action list)
# 1672               "build/flxg-tmp\flx_parse.ml"
  in `Obj_sexpr(fst res), snd res
 | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sexpr",[Dyp.Ter "DUMMY"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ _1] -> `Obj_sexpr 
# 620 "build/flxg-tmp\flx_parse.dyp"
(
               ( Snull ):'dypgen__Obj_sexpr)
# 1683               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sepsilon",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_sexpr 
# 627 "build/flxg-tmp\flx_parse.dyp"
(
            ( Snull ):'dypgen__Obj_sexpr)
# 1693               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("strepsilon",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_sexpr 
# 628 "build/flxg-tmp\flx_parse.dyp"
(
              ( Sstring "" ):'dypgen__Obj_sexpr)
# 1703               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("basic_name",[Dyp.Ter "NAME"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_NAME  (
(_:(string))
# 1711               "build/flxg-tmp\flx_parse.ml"
 as _1)] -> `Obj_basic_name 
# 632 "build/flxg-tmp\flx_parse.dyp"
(
   ( 
     let sr = Flx_parse_srcref.getsr dyp in
     sr,_1 
   ):'dypgen__Obj_basic_name)
# 1719               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("basic_name_comma_list",[Dyp.Non_ter ("basic_name",Dyp.No_priority );Dyp.Regexp (Dyp.RE_String ",");Dyp.Non_ter ("basic_name_comma_list",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_basic_name ( (
(_:'dypgen__Obj_basic_name)
# 1727               "build/flxg-tmp\flx_parse.ml"
 as _1)); `Lexeme_matched _2;`Obj_basic_name_comma_list ( (
(_:'dypgen__Obj_basic_name_comma_list)
# 1730               "build/flxg-tmp\flx_parse.ml"
 as _3))] -> `Obj_basic_name_comma_list 
# 638 "build/flxg-tmp\flx_parse.dyp"
(
                                         ( _1 :: _3 ):'dypgen__Obj_basic_name_comma_list)
# 1735               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("basic_name_comma_list",[Dyp.Non_ter ("basic_name",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [`Obj_basic_name ( (
(_:'dypgen__Obj_basic_name)
# 1743               "build/flxg-tmp\flx_parse.ml"
 as _1))] -> `Obj_basic_name_comma_list 
# 639 "build/flxg-tmp\flx_parse.dyp"
(
               ( [_1] ):'dypgen__Obj_basic_name_comma_list)
# 1748               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("epsilon",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> `Obj_epsilon 
# 641 "build/flxg-tmp\flx_parse.dyp"
(
           ( () ):'dypgen__Obj_epsilon)
# 1758               "build/flxg-tmp\flx_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])],

([
  ("__dypgen_layout",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_String "//";Dyp.RE_Star (Dyp.RE_Name "not_newline")];Dyp.RE_Alt [Dyp.RE_Name "newline";Dyp.RE_Eof_char]]));
  ("HASH_LINE",(Dyp.RE_String "#line"));
  ("__dypgen_layout",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_String "#include";Dyp.RE_Star (Dyp.RE_Name "not_newline")];Dyp.RE_Alt [Dyp.RE_Name "newline";Dyp.RE_Eof_char]]));
  ("__dypgen_layout",(Dyp.RE_String "/*"));
  ("__dypgen_layout",(Dyp.RE_Seq [Dyp.RE_Name "newline";Dyp.RE_String "@"]));
  ("INTEGER",(Dyp.RE_Plus (Dyp.RE_Name "digit")));
  ("STRING",(Dyp.RE_Name "qstring"));
  ("STRING",(Dyp.RE_Name "qqqstring"));
  ("STRING",(Dyp.RE_Name "dstring"));
  ("STRING",(Dyp.RE_Name "dddstring"));
  ("NAME",(Dyp.RE_Name "identifier"));
  ("__dypgen_layout",(Dyp.RE_Plus (Dyp.RE_Name "white")));
  ("__dypgen_layout",(Dyp.RE_Name "newline"));
  ("ENDMARKER",(Dyp.RE_Eof_char));
  ("ERRORTOKEN",(Dyp.RE_Char_set [('\000','ÿ')]))],
[
  9,((fun lexbuf -> `Obj___dypgen_layout
# 193 "build/flxg-tmp\flx_parse.dyp"
(
                                       (
      Flx_parse_srcref.incr_lineno lexbuf
  ):'dypgen__Obj___dypgen_layout)
# 1785               "build/flxg-tmp\flx_parse.ml"
));
  3,((fun lexbuf -> `Obj_HASH_LINE
# 197 "build/flxg-tmp\flx_parse.dyp"
(
                        (
     lexbuf
  ):'dypgen__Obj_HASH_LINE)
# 1793               "build/flxg-tmp\flx_parse.ml"
));
  9,((fun lexbuf -> `Obj___dypgen_layout
# 204 "build/flxg-tmp\flx_parse.dyp"
(
                                              (
      Flx_parse_srcref.incr_lineno lexbuf
  ):'dypgen__Obj___dypgen_layout)
# 1801               "build/flxg-tmp\flx_parse.ml"
));
  9,((fun lexbuf -> `Obj___dypgen_layout
# 209 "build/flxg-tmp\flx_parse.dyp"
(
         ( parse_C_comment 1 lexbuf ):'dypgen__Obj___dypgen_layout)
# 1807               "build/flxg-tmp\flx_parse.ml"
));
  9,((fun lexbuf -> `Obj___dypgen_layout
# 211 "build/flxg-tmp\flx_parse.dyp"
(
                ( Flx_parse_srcref.incr_lineno lexbuf; parse_fdoc_comment lexbuf ):'dypgen__Obj___dypgen_layout)
# 1813               "build/flxg-tmp\flx_parse.ml"
));
  4,((fun lexbuf -> `Obj_INTEGER
# 213 "build/flxg-tmp\flx_parse.dyp"
(
                   (
      let s = lexeme lexbuf in
      int_of_string s
  ):'dypgen__Obj_INTEGER)
# 1822               "build/flxg-tmp\flx_parse.ml"
));
  7,((fun lexbuf -> `Obj_STRING
# 219 "build/flxg-tmp\flx_parse.dyp"
(
                   ( 
    let s = lexeme lexbuf in
    Flx_parse_srcref.adjust_lineno lexbuf s;
    let m = String.length s in
    String.sub s 1 (m-2)
  ):'dypgen__Obj_STRING)
# 1833               "build/flxg-tmp\flx_parse.ml"
));
  7,((fun lexbuf -> `Obj_STRING
# 226 "build/flxg-tmp\flx_parse.dyp"
(
                       ( 
    let s = lexeme lexbuf in
    Flx_parse_srcref.adjust_lineno lexbuf s;
    let m = String.length s in
    String.sub s 3 (m-3)
  ):'dypgen__Obj_STRING)
# 1844               "build/flxg-tmp\flx_parse.ml"
));
  7,((fun lexbuf -> `Obj_STRING
# 233 "build/flxg-tmp\flx_parse.dyp"
(
                  (
    let s = lexeme lexbuf in
    Flx_parse_srcref.adjust_lineno lexbuf s;
    let m = String.length s in
    String.sub s 1 (m-2)
  ):'dypgen__Obj_STRING)
# 1855               "build/flxg-tmp\flx_parse.ml"
));
  7,((fun lexbuf -> `Obj_STRING
# 240 "build/flxg-tmp\flx_parse.dyp"
(
                    (
    let s = lexeme lexbuf in
    Flx_parse_srcref.adjust_lineno lexbuf s;
    let m = String.length s in
    String.sub s 3 (m-3)
  ):'dypgen__Obj_STRING)
# 1866               "build/flxg-tmp\flx_parse.ml"
));
  5,((fun lexbuf -> `Obj_NAME
# 247 "build/flxg-tmp\flx_parse.dyp"
(
                    ( Flx_utf.utf8_to_ucn (lexeme lexbuf) ):'dypgen__Obj_NAME)
# 1872               "build/flxg-tmp\flx_parse.ml"
));
  9,((fun lexbuf -> `Obj___dypgen_layout
# 250 "build/flxg-tmp\flx_parse.dyp"
(
           ( () ):'dypgen__Obj___dypgen_layout)
# 1878               "build/flxg-tmp\flx_parse.ml"
));
  9,((fun lexbuf -> `Obj___dypgen_layout
# 253 "build/flxg-tmp\flx_parse.dyp"
(
            ( Flx_parse_srcref.incr_lineno lexbuf ):'dypgen__Obj___dypgen_layout)
# 1884               "build/flxg-tmp\flx_parse.ml"
));
  1,((fun lexbuf -> let _ = (
# 257 "build/flxg-tmp\flx_parse.dyp"
                   
# 1889               "build/flxg-tmp\flx_parse.ml"
) in `Obj_ENDMARKER));
  2,((fun lexbuf -> `Obj_ERRORTOKEN
# 259 "build/flxg-tmp\flx_parse.dyp"
(
                 ( lexeme lexbuf ):'dypgen__Obj_ERRORTOKEN)
# 1895               "build/flxg-tmp\flx_parse.ml"
))]),

[("parse_C_comment",([
    (Dyp.RE_String "/*");
    (Dyp.RE_Name "newline");
    (Dyp.RE_String "*/");
    (Dyp.RE_Char_set [('\000','ÿ')])],[(fun __dypgen_av_list lexbuf -> (match __dypgen_av_list with [(`Lex_parse_C_comment_Arg_count (count:'dypgen__Lex_parse_C_comment_Arg_count))] -> `Lex_parse_C_comment
# 179 "build/flxg-tmp\flx_parse.dyp"
(
          ( parse_C_comment (count+1) lexbuf ):'dypgen__Lex_parse_C_comment)
# 1906               "build/flxg-tmp\flx_parse.ml"
  | _ -> failwith "lexing: bad action variable list when calling lexer user action"));(fun __dypgen_av_list lexbuf -> (match __dypgen_av_list with [(`Lex_parse_C_comment_Arg_count (count:'dypgen__Lex_parse_C_comment_Arg_count))] -> `Lex_parse_C_comment
# 180 "build/flxg-tmp\flx_parse.dyp"
(
          ( Flx_parse_srcref.incr_lineno lexbuf; parse_C_comment count lexbuf ):'dypgen__Lex_parse_C_comment)
# 1911               "build/flxg-tmp\flx_parse.ml"
  | _ -> failwith "lexing: bad action variable list when calling lexer user action"));(fun __dypgen_av_list lexbuf -> (match __dypgen_av_list with [(`Lex_parse_C_comment_Arg_count (count:'dypgen__Lex_parse_C_comment_Arg_count))] -> `Lex_parse_C_comment
# 181 "build/flxg-tmp\flx_parse.dyp"
(
          ( if count = 1 then () else parse_C_comment (count - 1) lexbuf ):'dypgen__Lex_parse_C_comment)
# 1916               "build/flxg-tmp\flx_parse.ml"
  | _ -> failwith "lexing: bad action variable list when calling lexer user action"));(fun __dypgen_av_list lexbuf -> (match __dypgen_av_list with [(`Lex_parse_C_comment_Arg_count (count:'dypgen__Lex_parse_C_comment_Arg_count))] -> `Lex_parse_C_comment
# 182 "build/flxg-tmp\flx_parse.dyp"
(
          ( parse_C_comment count lexbuf ):'dypgen__Lex_parse_C_comment)
# 1921               "build/flxg-tmp\flx_parse.ml"
  | _ -> failwith "lexing: bad action variable list when calling lexer user action"))]));("parse_fdoc_comment",([
    (Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "newline";Dyp.RE_String "@felix"];Dyp.RE_Star (Dyp.RE_Name "white")];Dyp.RE_Name "newline"]);
    (Dyp.RE_Name "newline");
    (Dyp.RE_Eof_char);
    (Dyp.RE_Char_set [('\000','ÿ')])],[(fun __dypgen_av_list lexbuf -> (match __dypgen_av_list with [] -> `Lex_parse_fdoc_comment
# 185 "build/flxg-tmp\flx_parse.dyp"
(
                                   ( Flx_parse_srcref.incr_lineno lexbuf; Flx_parse_srcref.incr_lineno lexbuf; ):'dypgen__Lex_parse_fdoc_comment)
# 1930               "build/flxg-tmp\flx_parse.ml"
  | _ -> failwith "lexing: bad action variable list when calling lexer user action"));(fun __dypgen_av_list lexbuf -> (match __dypgen_av_list with [] -> `Lex_parse_fdoc_comment
# 186 "build/flxg-tmp\flx_parse.dyp"
(
          ( Flx_parse_srcref.incr_lineno lexbuf; parse_fdoc_comment lexbuf ):'dypgen__Lex_parse_fdoc_comment)
# 1935               "build/flxg-tmp\flx_parse.ml"
  | _ -> failwith "lexing: bad action variable list when calling lexer user action"));(fun __dypgen_av_list lexbuf -> (match __dypgen_av_list with [] -> `Lex_parse_fdoc_comment
# 187 "build/flxg-tmp\flx_parse.dyp"
(
          ( ):'dypgen__Lex_parse_fdoc_comment)
# 1940               "build/flxg-tmp\flx_parse.ml"
  | _ -> failwith "lexing: bad action variable list when calling lexer user action"));(fun __dypgen_av_list lexbuf -> (match __dypgen_av_list with [] -> `Lex_parse_fdoc_comment
# 188 "build/flxg-tmp\flx_parse.dyp"
(
          ( parse_fdoc_comment lexbuf ):'dypgen__Lex_parse_fdoc_comment)
# 1945               "build/flxg-tmp\flx_parse.ml"
  | _ -> failwith "lexing: bad action variable list when calling lexer user action"))]))]

let __dypgen_regexp_decl = [
  ("quote",(Dyp.RE_Char '\''));
  ("dquote",(Dyp.RE_Char '"'));
  ("slosh",(Dyp.RE_Char '\\'));
  ("hash",(Dyp.RE_Char '#'));
  ("linefeed",(Dyp.RE_Char '\n'));
  ("tab",(Dyp.RE_Char '\t'));
  ("space",(Dyp.RE_Char ' '));
  ("formfeed",(Dyp.RE_Char '\012'));
  ("vtab",(Dyp.RE_Char '\011'));
  ("carriage_return",(Dyp.RE_Char '\r'));
  ("underscore",(Dyp.RE_Char '_'));
  ("bindigit",(Dyp.RE_Char_set [('0','1')]));
  ("octdigit",(Dyp.RE_Char_set [('0','7')]));
  ("digit",(Dyp.RE_Char_set [('0','9')]));
  ("hexdigit",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "digit";Dyp.RE_Char_set [('A','F')]];Dyp.RE_Char_set [('a','f')]]));
  ("lower",(Dyp.RE_Char_set [('a','z')]));
  ("upper",(Dyp.RE_Char_set [('A','Z')]));
  ("letter",(Dyp.RE_Alt [Dyp.RE_Name "lower";Dyp.RE_Name "upper"]));
  ("hichar",(Dyp.RE_Char_set [('\128','ÿ')]));
  ("white",(Dyp.RE_Alt [Dyp.RE_Name "space";Dyp.RE_Name "tab"]));
  ("form_control",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "linefeed";Dyp.RE_Name "carriage_return"];Dyp.RE_Name "vtab"];Dyp.RE_Name "formfeed"]));
  ("newline_prefix",(Dyp.RE_Alt [Dyp.RE_Name "linefeed";Dyp.RE_Name "carriage_return"]));
  ("newline",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "formfeed";Dyp.RE_Name "linefeed"];Dyp.RE_Seq [Dyp.RE_Name "carriage_return";Dyp.RE_Name "linefeed"]]));
  ("hash",(Dyp.RE_Char '#'));
  ("ordinary",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "letter";Dyp.RE_Name "digit"];Dyp.RE_Name "hichar"];Dyp.RE_Char '!'];Dyp.RE_Char '$'];Dyp.RE_Char '%'];Dyp.RE_Char '&'];Dyp.RE_Char '('];Dyp.RE_Char ')'];Dyp.RE_Char '*'];Dyp.RE_Char '+'];Dyp.RE_Char ','];Dyp.RE_Char '-'];Dyp.RE_Char '.'];Dyp.RE_Char '/'];Dyp.RE_Char ':'];Dyp.RE_Char ';'];Dyp.RE_Char '<'];Dyp.RE_Char '='];Dyp.RE_Char '>'];Dyp.RE_Char '?'];Dyp.RE_Char '@'];Dyp.RE_Char '['];Dyp.RE_Char ']'];Dyp.RE_Char '^'];Dyp.RE_Char '_'];Dyp.RE_Char '`'];Dyp.RE_Char '{'];Dyp.RE_Char '|'];Dyp.RE_Char '}'];Dyp.RE_Char '~']));
  ("printable",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "ordinary";Dyp.RE_Name "quote"];Dyp.RE_Name "dquote"];Dyp.RE_Name "slosh"];Dyp.RE_Name "hash"]));
  ("ucn",(Dyp.RE_Alt [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_String "\\u";Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_String "\\U";Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"];Dyp.RE_Name "hexdigit"]]));
  ("prime",(Dyp.RE_Char '\''));
  ("dash",(Dyp.RE_Char '-'));
  ("idletter",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "letter";Dyp.RE_Name "underscore"];Dyp.RE_Name "hichar"];Dyp.RE_Name "ucn"]));
  ("alphnum",(Dyp.RE_Alt [Dyp.RE_Name "idletter";Dyp.RE_Name "digit"]));
  ("innerglyph",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "idletter";Dyp.RE_Name "digit"];Dyp.RE_Name "dash"]));
  ("identifier",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "idletter";Dyp.RE_Star (Dyp.RE_Seq [Dyp.RE_Option (Dyp.RE_Name "innerglyph");Dyp.RE_Plus (Dyp.RE_Alt [Dyp.RE_Name "alphnum";Dyp.RE_Name "prime"])])];Dyp.RE_Star (Dyp.RE_Name "prime")]));
  ("qqq",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "quote";Dyp.RE_Name "quote"];Dyp.RE_Name "quote"]));
  ("ddd",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "dquote";Dyp.RE_Name "dquote"];Dyp.RE_Name "dquote"]));
  ("raw_dddnormal",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "ordinary";Dyp.RE_Name "hash"];Dyp.RE_Name "quote"];Dyp.RE_Name "slosh"];Dyp.RE_Name "white"];Dyp.RE_Name "newline"]));
  ("raw_dddspecial",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "raw_dddnormal";Dyp.RE_Seq [Dyp.RE_Name "dquote";Dyp.RE_Name "raw_dddnormal"]];Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "dquote";Dyp.RE_Name "dquote"];Dyp.RE_Name "raw_dddnormal"]]));
  ("raw_qqqnormal",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "ordinary";Dyp.RE_Name "hash"];Dyp.RE_Name "dquote"];Dyp.RE_Name "slosh"];Dyp.RE_Name "space"];Dyp.RE_Name "newline"]));
  ("raw_qqqspecial",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "raw_qqqnormal";Dyp.RE_Seq [Dyp.RE_Name "quote";Dyp.RE_Name "raw_qqqnormal"]];Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "quote";Dyp.RE_Name "quote"];Dyp.RE_Name "raw_qqqnormal"]]));
  ("qstring",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "quote";Dyp.RE_Star (Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "ordinary";Dyp.RE_Name "hash"];Dyp.RE_Name "dquote"];Dyp.RE_Name "white"];Dyp.RE_Name "slosh"])];Dyp.RE_Name "quote"]));
  ("dstring",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "dquote";Dyp.RE_Star (Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "ordinary";Dyp.RE_Name "hash"];Dyp.RE_Name "quote"];Dyp.RE_Name "white"];Dyp.RE_Name "slosh"])];Dyp.RE_Name "dquote"]));
  ("qqqstring",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "qqq";Dyp.RE_Star (Dyp.RE_Name "raw_qqqspecial")];Dyp.RE_Name "qqq"]));
  ("dddstring",(Dyp.RE_Seq [Dyp.RE_Seq [Dyp.RE_Name "ddd";Dyp.RE_Star (Dyp.RE_Name "raw_dddspecial")];Dyp.RE_Name "ddd"]));
  ("not_hash_or_newline",(Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Alt [Dyp.RE_Name "ordinary";Dyp.RE_Name "quote"];Dyp.RE_Name "dquote"];Dyp.RE_Name "white"];Dyp.RE_Name "slosh"]));
  ("not_newline",(Dyp.RE_Alt [Dyp.RE_Name "not_hash_or_newline";Dyp.RE_Name "hash"]))]

let dyp_merge_Lex_parse_C_comment l =
  match dyp_merge_Lex_parse_C_comment l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Lex_parse_C_comment_Arg_count l =
  match dyp_merge_Lex_parse_C_comment_Arg_count l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Lex_parse_fdoc_comment l =
  match dyp_merge_Lex_parse_fdoc_comment l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Lexeme_matched l =
  match dyp_merge_Lexeme_matched l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_ERRORTOKEN l =
  match dyp_merge_Obj_ERRORTOKEN l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_HASH_LINE l =
  match dyp_merge_Obj_HASH_LINE l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_INTEGER l =
  match dyp_merge_Obj_INTEGER l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_NAME l =
  match dyp_merge_Obj_NAME l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_NONTERMINAL l =
  match dyp_merge_Obj_NONTERMINAL l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_STRING l =
  match dyp_merge_Obj_STRING l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj___dypgen_layout l =
  match dyp_merge_Obj___dypgen_layout l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_action l =
  match dyp_merge_Obj_action l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_basic_name l =
  match dyp_merge_Obj_basic_name l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_basic_name_comma_list l =
  match dyp_merge_Obj_basic_name_comma_list l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_compilation_unit l =
  match dyp_merge_Obj_compilation_unit l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dyalt l =
  match dyp_merge_Obj_dyalt l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dyaltlist l =
  match dyp_merge_Obj_dyaltlist l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dyalts l =
  match dyp_merge_Obj_dyalts l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dypgen__nested_nt_0 l =
  match dyp_merge_Obj_dypgen__nested_nt_0 l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dypgen__nested_nt_1 l =
  match dyp_merge_Obj_dypgen__nested_nt_1 l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dypgen__nested_nt_2 l =
  match dyp_merge_Obj_dypgen__nested_nt_2 l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dypgen__nested_nt_3 l =
  match dyp_merge_Obj_dypgen__nested_nt_3 l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dypgen__nested_nt_4 l =
  match dyp_merge_Obj_dypgen__nested_nt_4 l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dypgen__nested_nt_5 l =
  match dyp_merge_Obj_dypgen__nested_nt_5 l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dyprod l =
  match dyp_merge_Obj_dyprod l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_dyprods l =
  match dyp_merge_Obj_dyprods l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_epsilon l =
  match dyp_merge_Obj_epsilon l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_grammar_init l =
  match dyp_merge_Obj_grammar_init l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_macro_args l =
  match dyp_merge_Obj_macro_args l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_name_list l =
  match dyp_merge_Obj_name_list l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_note l =
  match dyp_merge_Obj_note l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_opt_prio l =
  match dyp_merge_Obj_opt_prio l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_opt_private l =
  match dyp_merge_Obj_opt_private l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_pri l =
  match dyp_merge_Obj_pri l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_prilist l =
  match dyp_merge_Obj_prilist l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_rhs l =
  match dyp_merge_Obj_rhs l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_sexpr l =
  match dyp_merge_Obj_sexpr l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_ssre l =
  match dyp_merge_Obj_ssre l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_sstatement_star l =
  match dyp_merge_Obj_sstatement_star l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_symbol l =
  match dyp_merge_Obj_symbol l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_syntax_init l =
  match dyp_merge_Obj_syntax_init l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_syntax_unit l =
  match dyp_merge_Obj_syntax_unit l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_top_statements l =
  match dyp_merge_Obj_top_statements l with
    | ([],_,_) -> dyp_merge l
    | res -> res

let __dypgen_merge_list = [(fun l -> (
  let f1 (o,gd,ld) = match o with `Lex_parse_C_comment ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Lex_parse_C_comment"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Lex_parse_C_comment l in
  let f2 o = `Lex_parse_C_comment o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Lex_parse_C_comment_Arg_count ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Lex_parse_C_comment_Arg_count"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Lex_parse_C_comment_Arg_count l in
  let f2 o = `Lex_parse_C_comment_Arg_count o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Lex_parse_fdoc_comment ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Lex_parse_fdoc_comment"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Lex_parse_fdoc_comment l in
  let f2 o = `Lex_parse_fdoc_comment o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Lexeme_matched ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Lexeme_matched"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Lexeme_matched l in
  let f2 o = `Lexeme_matched o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_ERRORTOKEN ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_ERRORTOKEN"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_ERRORTOKEN l in
  let f2 o = `Obj_ERRORTOKEN o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_HASH_LINE ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_HASH_LINE"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_HASH_LINE l in
  let f2 o = `Obj_HASH_LINE o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_INTEGER ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_INTEGER"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_INTEGER l in
  let f2 o = `Obj_INTEGER o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_NAME ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_NAME"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_NAME l in
  let f2 o = `Obj_NAME o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_NONTERMINAL ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_NONTERMINAL"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_NONTERMINAL l in
  let f2 o = `Obj_NONTERMINAL o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_STRING ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_STRING"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_STRING l in
  let f2 o = `Obj_STRING o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj___dypgen_layout ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj___dypgen_layout"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj___dypgen_layout l in
  let f2 o = `Obj___dypgen_layout o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_action ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_action"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_action l in
  let f2 o = `Obj_action o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_basic_name ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_basic_name"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_basic_name l in
  let f2 o = `Obj_basic_name o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_basic_name_comma_list ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_basic_name_comma_list"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_basic_name_comma_list l in
  let f2 o = `Obj_basic_name_comma_list o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_compilation_unit ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_compilation_unit"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_compilation_unit l in
  let f2 o = `Obj_compilation_unit o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dyalt ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dyalt"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dyalt l in
  let f2 o = `Obj_dyalt o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dyaltlist ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dyaltlist"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dyaltlist l in
  let f2 o = `Obj_dyaltlist o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dyalts ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dyalts"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dyalts l in
  let f2 o = `Obj_dyalts o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dypgen__nested_nt_0 ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dypgen__nested_nt_0"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dypgen__nested_nt_0 l in
  let f2 o = `Obj_dypgen__nested_nt_0 o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dypgen__nested_nt_1 ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dypgen__nested_nt_1"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dypgen__nested_nt_1 l in
  let f2 o = `Obj_dypgen__nested_nt_1 o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dypgen__nested_nt_2 ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dypgen__nested_nt_2"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dypgen__nested_nt_2 l in
  let f2 o = `Obj_dypgen__nested_nt_2 o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dypgen__nested_nt_3 ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dypgen__nested_nt_3"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dypgen__nested_nt_3 l in
  let f2 o = `Obj_dypgen__nested_nt_3 o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dypgen__nested_nt_4 ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dypgen__nested_nt_4"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dypgen__nested_nt_4 l in
  let f2 o = `Obj_dypgen__nested_nt_4 o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dypgen__nested_nt_5 ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dypgen__nested_nt_5"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dypgen__nested_nt_5 l in
  let f2 o = `Obj_dypgen__nested_nt_5 o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dyprod ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dyprod"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dyprod l in
  let f2 o = `Obj_dyprod o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_dyprods ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_dyprods"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_dyprods l in
  let f2 o = `Obj_dyprods o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_epsilon ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_epsilon"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_epsilon l in
  let f2 o = `Obj_epsilon o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_grammar_init ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_grammar_init"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_grammar_init l in
  let f2 o = `Obj_grammar_init o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_macro_args ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_macro_args"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_macro_args l in
  let f2 o = `Obj_macro_args o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_name_list ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_name_list"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_name_list l in
  let f2 o = `Obj_name_list o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_note ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_note"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_note l in
  let f2 o = `Obj_note o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_opt_prio ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_opt_prio"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_opt_prio l in
  let f2 o = `Obj_opt_prio o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_opt_private ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_opt_private"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_opt_private l in
  let f2 o = `Obj_opt_private o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_pri ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_pri"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_pri l in
  let f2 o = `Obj_pri o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_prilist ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_prilist"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_prilist l in
  let f2 o = `Obj_prilist o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_rhs ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_rhs"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_rhs l in
  let f2 o = `Obj_rhs o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_sexpr ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_sexpr"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_sexpr l in
  let f2 o = `Obj_sexpr o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_ssre ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_ssre"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_ssre l in
  let f2 o = `Obj_ssre o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_sstatement_star ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_sstatement_star"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_sstatement_star l in
  let f2 o = `Obj_sstatement_star o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_symbol ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_symbol"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_symbol l in
  let f2 o = `Obj_symbol o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_syntax_init ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_syntax_init"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_syntax_init l in
  let f2 o = `Obj_syntax_init o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_syntax_unit ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_syntax_unit"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_syntax_unit l in
  let f2 o = `Obj_syntax_unit o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with `Obj_top_statements ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_top_statements"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_top_statements l in
  let f2 o = `Obj_top_statements o in
  (List.map f2 ol, gd, ld)))]



let __dypgen_test_cons () =  [|
  (fun x -> match x with `Lex_parse_C_comment _ -> true | _ -> false);
  (fun x -> match x with `Lex_parse_C_comment_Arg_count _ -> true | _ -> false);
  (fun x -> match x with `Lex_parse_fdoc_comment _ -> true | _ -> false);
  (fun x -> match x with `Lexeme_matched _ -> true | _ -> false);
  (fun x -> match x with `Obj_ERRORTOKEN _ -> true | _ -> false);
  (fun x -> match x with `Obj_HASH_LINE _ -> true | _ -> false);
  (fun x -> match x with `Obj_INTEGER _ -> true | _ -> false);
  (fun x -> match x with `Obj_NAME _ -> true | _ -> false);
  (fun x -> match x with `Obj_NONTERMINAL _ -> true | _ -> false);
  (fun x -> match x with `Obj_STRING _ -> true | _ -> false);
  (fun x -> match x with `Obj___dypgen_layout _ -> true | _ -> false);
  (fun x -> match x with `Obj_action _ -> true | _ -> false);
  (fun x -> match x with `Obj_basic_name _ -> true | _ -> false);
  (fun x -> match x with `Obj_basic_name_comma_list _ -> true | _ -> false);
  (fun x -> match x with `Obj_compilation_unit _ -> true | _ -> false);
  (fun x -> match x with `Obj_dyalt _ -> true | _ -> false);
  (fun x -> match x with `Obj_dyaltlist _ -> true | _ -> false);
  (fun x -> match x with `Obj_dyalts _ -> true | _ -> false);
  (fun x -> match x with `Obj_dypgen__nested_nt_0 _ -> true | _ -> false);
  (fun x -> match x with `Obj_dypgen__nested_nt_1 _ -> true | _ -> false);
  (fun x -> match x with `Obj_dypgen__nested_nt_2 _ -> true | _ -> false);
  (fun x -> match x with `Obj_dypgen__nested_nt_3 _ -> true | _ -> false);
  (fun x -> match x with `Obj_dypgen__nested_nt_4 _ -> true | _ -> false);
  (fun x -> match x with `Obj_dypgen__nested_nt_5 _ -> true | _ -> false);
  (fun x -> match x with `Obj_dyprod _ -> true | _ -> false);
  (fun x -> match x with `Obj_dyprods _ -> true | _ -> false);
  (fun x -> match x with `Obj_epsilon _ -> true | _ -> false);
  (fun x -> match x with `Obj_grammar_init _ -> true | _ -> false);
  (fun x -> match x with `Obj_macro_args _ -> true | _ -> false);
  (fun x -> match x with `Obj_name_list _ -> true | _ -> false);
  (fun x -> match x with `Obj_note _ -> true | _ -> false);
  (fun x -> match x with `Obj_opt_prio _ -> true | _ -> false);
  (fun x -> match x with `Obj_opt_private _ -> true | _ -> false);
  (fun x -> match x with `Obj_pri _ -> true | _ -> false);
  (fun x -> match x with `Obj_prilist _ -> true | _ -> false);
  (fun x -> match x with `Obj_rhs _ -> true | _ -> false);
  (fun x -> match x with `Obj_sexpr _ -> true | _ -> false);
  (fun x -> match x with `Obj_ssre _ -> true | _ -> false);
  (fun x -> match x with `Obj_sstatement_star _ -> true | _ -> false);
  (fun x -> match x with `Obj_symbol _ -> true | _ -> false);
  (fun x -> match x with `Obj_syntax_init _ -> true | _ -> false);
  (fun x -> match x with `Obj_syntax_unit _ -> true | _ -> false);
  (fun x -> match x with `Obj_top_statements _ -> true | _ -> false)|]

let __dypgen_dummy_marker_2 = ()
let pp () = Dyp.make_parser
  __dypgen_ra_list Dyp_priority_data.relations global_data local_data
  (Dyp.Tools.make_nt_cons_map Dyp_symbols_array.nt_cons_list)
  Dyp_symbols_array.entry_points
  
  false 10 false
  
  Dyp_aux_functions.get_token_value
  Dyp_symbols.get_token_name Dyp_symbols.str_token
  global_data_equal local_data_equal (__dypgen_test_cons ())
  Dyp_symbols_array.str_cons
  Dyp_symbols_array.cons_array Dyp_aux_functions.cons_table
  (Dyp.Tools.array_of_list __dypgen_merge_list)
  dypgen_lexbuf_position __dypgen_regexp_decl __dypgen_main_lexer
  __dypgen_aux_lexer Dyp_symbols.ter_string_list
  (fun lexbuf -> `Lexeme_matched (Dyp.lexeme lexbuf))
  true


let __dypgen_dummy_marker_5 = ()

let __dypgen_dummy_marker_3 = ()

let syntax_unit ?(global_data=global_data) ?(local_data=local_data) lexbuf =
  let pf = Dyp.lexparse (pp ()) "syntax_unit" ~global_data:global_data
    ~local_data:local_data ~match_len:dypgen_match_length
    ~keep_data:dypgen_keep_data
    ~use_rule_order:dypgen_use_rule_order
    ~use_all_actions:dypgen_use_all_actions
    ~choose_token:dypgen_choose_token lexbuf in
  let aux1 (o,p) = match o with
    | `Obj_syntax_unit r -> (r,p)
    | _ -> failwith "Wrong type for entry result" in
  List.map aux1 pf

let compilation_unit ?(global_data=global_data) ?(local_data=local_data) lexbuf =
  let pf = Dyp.lexparse (pp ()) "compilation_unit" ~global_data:global_data
    ~local_data:local_data ~match_len:dypgen_match_length
    ~keep_data:dypgen_keep_data
    ~use_rule_order:dypgen_use_rule_order
    ~use_all_actions:dypgen_use_all_actions
    ~choose_token:dypgen_choose_token lexbuf in
  let aux1 (o,p) = match o with
    | `Obj_compilation_unit r -> (r,p)
    | _ -> failwith "Wrong type for entry result" in
  List.map aux1 pf


let __dypgen_dummy_marker_4 = ()


# 647 "build/flxg-tmp\flx_parse.dyp"


let _ = () (* dummy line to improve OCaml error location *)
# 2616               "build/flxg-tmp\flx_parse.ml"
