
# 1 "build\release\src\compiler\sex\sex_parse.dyp"
        open Sex_token 
let _ = () (* dummy line to improve OCaml error location *)
# 6                  "build\release\src\compiler\sex\sex_parse.ml"
let _ =
  if "20120619" <> Dyp.version
  then (Printf.fprintf stderr
    "version mismatch, dypgen version 20120619 and dyplib version %s\n" Dyp.version;
  exit 2)

type token =
  | INT of (string)
  | ID of (string)
  | SYM of (string)
  | STR of (string)
  | EOF
  | RB
  | LB

module Dyp_symbols =
struct
  let get_token_name t = match t with
    | EOF -> 0
    | ID _ -> 1
    | INT _ -> 2
    | LB -> 3
    | RB -> 4
    | STR _ -> 5
    | SYM _ -> 6
  let str_token t = match t with
    | EOF -> "EOF"
    | ID _ -> "ID"
    | INT _ -> "INT"
    | LB -> "LB"
    | RB -> "RB"
    | STR _ -> "STR"
    | SYM _ -> "SYM"
  let ter_string_list = [
      ("EOF",0);
      ("ID",1);
      ("INT",2);
      ("LB",3);
      ("RB",4);
      ("STR",5);
      ("SYM",6);]
end

type ('dypgen__Obj_sexp, 'dypgen__Obj_sexps) obj =
  | Lexeme_matched of string
  | Obj_EOF
  | Obj_ID of (string)
  | Obj_INT of (string)
  | Obj_LB
  | Obj_RB
  | Obj_STR of (string)
  | Obj_SYM of (string)
  | Obj_sex_parse of (Sex_types.sexp_t)
  | Obj_sexp of 'dypgen__Obj_sexp
  | Obj_sexps of 'dypgen__Obj_sexps

module Dyp_symbols_array =
struct
  let token_name_array =
  [|"EOF";
    "ID";
    "INT";
    "LB";
    "RB";
    "STR";
    "SYM"|]
  let nt_cons_list =
  [
    ("sex_parse",5);
    ("sexp",6);
    ("sexps",7)]
  let str_cons o = match o with
    | Lexeme_matched _ -> "Lexeme_matched"
    | Obj_ID _ -> "Obj_ID"
    | Obj_INT _ -> "Obj_INT"
    | Obj_STR _ -> "Obj_STR"
    | Obj_SYM _ -> "Obj_SYM"
    | Obj_sex_parse _ -> "Obj_sex_parse"
    | Obj_sexp _ -> "Obj_sexp"
    | Obj_sexps _ -> "Obj_sexps"
    | _ -> failwith "str_cons, unexpected constructor"
  let cons_array = [|
    "Lexeme_matched";
    "Obj_ID";
    "Obj_INT";
    "Obj_STR";
    "Obj_SYM";
    "Obj_sex_parse";
    "Obj_sexp";
    "Obj_sexps";
    "";
    "";
    "";
  |]
  let entry_points = [
    "sex_parse";]
end

let dypgen_lexbuf_position lexbuf =
  (lexbuf.Lexing.lex_start_p,lexbuf.Lexing.lex_curr_p)

module Dyp_aux_functions =
struct
  let get_token_value t = match t with
    | EOF -> Obj_EOF
    | ID x -> Obj_ID x
    | INT x -> Obj_INT x
    | LB -> Obj_LB
    | RB -> Obj_RB
    | STR x -> Obj_STR x
    | SYM x -> Obj_SYM x
  let cons_table = Dyp.Tools.hashtbl_of_array Dyp_symbols_array.cons_array
end

module Dyp_priority_data =
struct
  let relations = [
  ]
end

let global_data = ()
let local_data = ()
let global_data_equal = (==)
let local_data_equal = (==)

let dyp_merge_Lexeme_matched = Dyp.Tools.keep_zero
let dyp_merge_Obj_ID = Dyp.Tools.keep_zero
let dyp_merge_Obj_INT = Dyp.Tools.keep_zero
let dyp_merge_Obj_STR = Dyp.Tools.keep_zero
let dyp_merge_Obj_SYM = Dyp.Tools.keep_zero
let dyp_merge_Obj_sex_parse = Dyp.Tools.keep_zero
let dyp_merge_Obj_sexp = Dyp.Tools.keep_zero
let dyp_merge_Obj_sexps = Dyp.Tools.keep_zero
let dyp_merge = Dyp.keep_one
let dypgen_match_length = `shortest
let dypgen_choose_token = `first
let dypgen_keep_data = `both
let dypgen_use_rule_order = false
let dypgen_use_all_actions = false

# 2 "build\release\src\compiler\sex\sex_parse.dyp"

open Sex_types

let _ = () (* dummy line to improve OCaml error location *)
# 152                "build\release\src\compiler\sex\sex_parse.ml"
let __dypgen_ra_list, __dypgen_main_lexer, __dypgen_aux_lexer =
[
(("sex_parse",[Dyp.Non_ter ("sexp",Dyp.No_priority );Dyp.Ter "EOF"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [Obj_sexp ( (
(_:'dypgen__Obj_sexp)
# 159                "build\release\src\compiler\sex\sex_parse.ml"
 as _1)); _2] -> Obj_sex_parse 
# 17 "build\release\src\compiler\sex\sex_parse.dyp"
(
                    ( _1 ):(Sex_types.sexp_t))
# 164                "build\release\src\compiler\sex\sex_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sexp",[Dyp.Ter "INT"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [Obj_INT  (
(_:(string))
# 172                "build\release\src\compiler\sex\sex_parse.ml"
 as _1)] -> Obj_sexp 
# 20 "build\release\src\compiler\sex\sex_parse.dyp"
(
        ( Int _1 ):'dypgen__Obj_sexp)
# 177                "build\release\src\compiler\sex\sex_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sexp",[Dyp.Ter "STR"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [Obj_STR  (
(_:(string))
# 185                "build\release\src\compiler\sex\sex_parse.ml"
 as _1)] -> Obj_sexp 
# 21 "build\release\src\compiler\sex\sex_parse.dyp"
(
        ( Str _1 ):'dypgen__Obj_sexp)
# 190                "build\release\src\compiler\sex\sex_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sexp",[Dyp.Ter "SYM"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [Obj_SYM  (
(_:(string))
# 198                "build\release\src\compiler\sex\sex_parse.ml"
 as _1)] -> Obj_sexp 
# 22 "build\release\src\compiler\sex\sex_parse.dyp"
(
        ( Sym _1 ):'dypgen__Obj_sexp)
# 203                "build\release\src\compiler\sex\sex_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sexp",[Dyp.Ter "ID"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [Obj_ID  (
(_:(string))
# 211                "build\release\src\compiler\sex\sex_parse.ml"
 as _1)] -> Obj_sexp 
# 23 "build\release\src\compiler\sex\sex_parse.dyp"
(
        ( Id _1 ):'dypgen__Obj_sexp)
# 216                "build\release\src\compiler\sex\sex_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sexp",[Dyp.Ter "LB";Dyp.Non_ter ("sexps",Dyp.No_priority );Dyp.Ter "RB"],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [ _1;Obj_sexps ( (
(_:'dypgen__Obj_sexps)
# 224                "build\release\src\compiler\sex\sex_parse.ml"
 as _2)); _3] -> Obj_sexp 
# 24 "build\release\src\compiler\sex\sex_parse.dyp"
(
                ( Lst _2 ):'dypgen__Obj_sexp)
# 229                "build\release\src\compiler\sex\sex_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sexps",[Dyp.Non_ter ("sexp",Dyp.No_priority );Dyp.Non_ter ("sexps",Dyp.No_priority )],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [Obj_sexp ( (
(_:'dypgen__Obj_sexp)
# 237                "build\release\src\compiler\sex\sex_parse.ml"
 as _1));Obj_sexps ( (
(_:'dypgen__Obj_sexps)
# 240                "build\release\src\compiler\sex\sex_parse.ml"
 as _2))] -> Obj_sexps 
# 27 "build\release\src\compiler\sex\sex_parse.dyp"
(
               ( _1 :: _2 ):'dypgen__Obj_sexps)
# 245                "build\release\src\compiler\sex\sex_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])
;
(("sexps",[],"default_priority",[]),
Dyp.Dypgen_action (fun __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl ->
(Dyp.Tools.transform_action (fun dyp __dypgen_av_list -> (match (__dypgen_av_list) with [] -> Obj_sexps 
# 28 "build\release\src\compiler\sex\sex_parse.dyp"
(
    ( [] ):'dypgen__Obj_sexps)
# 255                "build\release\src\compiler\sex\sex_parse.ml"
,[] | _ -> raise Dyp.Giveup))) __dypgen_ol __dypgen_pos __dypgen_posl __dypgen_gd __dypgen_ld __dypgen_lld __dypgen_di __dypgen_p __dypgen_nl),
[])],

(["dummy_entry",Dyp.RE_Eof_char],
[0,(fun _ -> Lexeme_matched "")]),

[]

let __dypgen_regexp_decl = []

let dyp_merge_Lexeme_matched l =
  match dyp_merge_Lexeme_matched l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_ID l =
  match dyp_merge_Obj_ID l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_INT l =
  match dyp_merge_Obj_INT l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_STR l =
  match dyp_merge_Obj_STR l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_SYM l =
  match dyp_merge_Obj_SYM l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_sex_parse l =
  match dyp_merge_Obj_sex_parse l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_sexp l =
  match dyp_merge_Obj_sexp l with
    | ([],_,_) -> dyp_merge l
    | res -> res
let dyp_merge_Obj_sexps l =
  match dyp_merge_Obj_sexps l with
    | ([],_,_) -> dyp_merge l
    | res -> res

let __dypgen_merge_list = [(fun l -> (
  let f1 (o,gd,ld) = match o with Lexeme_matched ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Lexeme_matched"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Lexeme_matched l in
  let f2 o = Lexeme_matched o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with Obj_ID ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_ID"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_ID l in
  let f2 o = Obj_ID o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with Obj_INT ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_INT"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_INT l in
  let f2 o = Obj_INT o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with Obj_STR ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_STR"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_STR l in
  let f2 o = Obj_STR o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with Obj_SYM ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_SYM"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_SYM l in
  let f2 o = Obj_SYM o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with Obj_sex_parse ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_sex_parse"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_sex_parse l in
  let f2 o = Obj_sex_parse o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with Obj_sexp ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_sexp"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_sexp l in
  let f2 o = Obj_sexp o in
  (List.map f2 ol, gd, ld)));
(fun l -> (
  let f1 (o,gd,ld) = match o with Obj_sexps ob -> (ob,gd,ld)
    | _ -> failwith "type error, bad obj in dyp_merge_Obj_sexps"
  in
  let l = List.map f1 l in
  let (ol,gd,ld) = dyp_merge_Obj_sexps l in
  let f2 o = Obj_sexps o in
  (List.map f2 ol, gd, ld)))]



let __dypgen_test_cons () =  [|
  (fun x -> match x with Lexeme_matched _ -> true | _ -> false);
  (fun x -> match x with Obj_ID _ -> true | _ -> false);
  (fun x -> match x with Obj_INT _ -> true | _ -> false);
  (fun x -> match x with Obj_STR _ -> true | _ -> false);
  (fun x -> match x with Obj_SYM _ -> true | _ -> false);
  (fun x -> match x with Obj_sex_parse _ -> true | _ -> false);
  (fun x -> match x with Obj_sexp _ -> true | _ -> false);
  (fun x -> match x with Obj_sexps _ -> true | _ -> false)|]

let __dypgen_dummy_marker_2 = ()
let pp () = Dyp.make_parser
  __dypgen_ra_list Dyp_priority_data.relations global_data local_data
  (Dyp.Tools.make_nt_cons_map Dyp_symbols_array.nt_cons_list)
  Dyp_symbols_array.entry_points
  
  false 7 true
  
  Dyp_aux_functions.get_token_value
  Dyp_symbols.get_token_name Dyp_symbols.str_token
  global_data_equal local_data_equal (__dypgen_test_cons ())
  Dyp_symbols_array.str_cons
  Dyp_symbols_array.cons_array Dyp_aux_functions.cons_table
  (Dyp.Tools.array_of_list __dypgen_merge_list)
  dypgen_lexbuf_position __dypgen_regexp_decl __dypgen_main_lexer
  __dypgen_aux_lexer Dyp_symbols.ter_string_list
  (fun lexbuf -> Lexeme_matched (Dyp.lexeme lexbuf))
  false


let __dypgen_dummy_marker_5 = ()

let __dypgen_dummy_marker_3 = ()

let sex_parse ?(global_data=global_data) ?(local_data=local_data) f lexbuf =
  let pf = Dyp.parse (pp ()) "sex_parse" ~global_data:global_data
    ~local_data:local_data ~match_len:dypgen_match_length
    ~keep_data:dypgen_keep_data
    ~use_rule_order:dypgen_use_rule_order
    ~use_all_actions:dypgen_use_all_actions
    ~lexpos:dypgen_lexbuf_position f lexbuf in
  let aux1 (o,p) = match o with
    | Obj_sex_parse r -> (r,p)
    | _ -> failwith "Wrong type for entry result" in
  List.map aux1 pf


let __dypgen_dummy_marker_4 = ()

