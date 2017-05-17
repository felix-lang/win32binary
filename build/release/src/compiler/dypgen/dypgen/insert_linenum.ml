# 1 "src\compiler\dypgen\dypgen\insert_linenum.mll"
 
open Lexing

let buffer = ref ""

let update_loc lexbuf file line absolute chars =
  let pos = lexbuf.lex_curr_p in
  let new_file = match file with
                 | None -> pos.pos_fname
                 | Some s -> s
  in
  lexbuf.lex_curr_p <- { pos with
    pos_fname = new_file;
    pos_lnum = if absolute then line else pos.pos_lnum + line;
    pos_bol = pos.pos_cnum - chars;
  }

# 20 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"
let __ocaml_lex_tables = {
  Lexing.lex_base = 
   "\000\000\001\000\253\255\000\000\002\000\255\255\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\001\000\001\000\
    \001\000\001\000\002\000\000\000\000\000\000\000\002\000\004\000\
    \254\255\005\000\253\255\006\000\254\255\007\000\001\000\000\000\
    \011\000\255\255\009\000\011\000\253\255\254\255\012\000\013\000\
    \255\255\016\000";
  Lexing.lex_backtrk = 
   "\255\255\003\000\255\255\004\000\000\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\001\000\255\255\255\255\001\000\255\255\
    \255\255\255\255\001\000\255\255\255\255\255\255\002\000\000\000\
    \255\255\255\255";
  Lexing.lex_default = 
   "\001\000\001\000\000\000\255\255\255\255\000\000\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\029\000\000\000\255\255\000\000\029\000\255\255\255\255\
    \255\255\000\000\255\255\038\000\000\000\000\000\041\000\255\255\
    \000\000\041\000";
  Lexing.lex_trans = 
   "\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\005\000\255\255\005\000\004\000\255\255\028\000\
    \028\000\028\000\027\000\028\000\034\000\036\000\040\000\040\000\
    \036\000\039\000\040\000\000\000\000\000\039\000\000\000\000\000\
    \006\000\031\000\000\000\003\000\255\255\000\000\000\000\000\000\
    \030\000\000\000\255\255\033\000\000\000\013\000\018\000\000\000\
    \032\000\032\000\032\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\000\000\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\022\000\000\000\000\000\010\000\017\000\023\000\
    \000\000\007\000\015\000\000\000\014\000\021\000\008\000\016\000\
    \019\000\000\000\011\000\009\000\012\000\020\000\024\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
    \002\000\255\255\000\000\000\000\000\000\026\000\000\000\255\255\
    \000\000\000\000\000\000\037\000\255\255\000\000\000\000\000\000\
    \255\255";
  Lexing.lex_check = 
   "\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\000\000\001\000\004\000\000\000\001\000\025\000\
    \027\000\029\000\025\000\034\000\029\000\035\000\038\000\039\000\
    \035\000\038\000\041\000\255\255\255\255\041\000\255\255\255\255\
    \003\000\030\000\255\255\000\000\001\000\255\255\255\255\255\255\
    \025\000\255\255\029\000\032\000\255\255\012\000\017\000\255\255\
    \031\000\031\000\031\000\031\000\031\000\031\000\031\000\031\000\
    \031\000\031\000\255\255\032\000\032\000\032\000\032\000\032\000\
    \032\000\032\000\032\000\032\000\032\000\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\021\000\255\255\255\255\009\000\016\000\022\000\
    \255\255\006\000\014\000\255\255\013\000\020\000\007\000\015\000\
    \018\000\255\255\010\000\008\000\011\000\019\000\023\000\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\255\
    \000\000\001\000\255\255\255\255\255\255\025\000\255\255\029\000\
    \255\255\255\255\255\255\035\000\038\000\255\255\255\255\255\255\
    \041\000";
  Lexing.lex_base_code = 
   "";
  Lexing.lex_backtrk_code = 
   "";
  Lexing.lex_default_code = 
   "";
  Lexing.lex_trans_code = 
   "";
  Lexing.lex_check_code = 
   "";
  Lexing.lex_code = 
   "";
}

let rec insert_linenum lexbuf =
    __ocaml_lex_insert_linenum_rec lexbuf 0
and __ocaml_lex_insert_linenum_rec lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 23 "src\compiler\dypgen\dypgen\insert_linenum.mll"
      ( update_loc lexbuf None 1 false 0;
      insert_linenum lexbuf )
# 137 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | 1 ->
# 26 "src\compiler\dypgen\dypgen\insert_linenum.mll"
      ( let pos = Lexing.lexeme_start_p lexbuf in
      let space = String.make 20 ' ' in
      let str = "# "^(string_of_int (pos.pos_lnum+1)) in
      String.blit str 0 space 0 (String.length str);
      String.blit space 0 !buffer pos.pos_cnum 20;
      insert_linenum lexbuf )
# 147 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | 2 ->
# 32 "src\compiler\dypgen\dypgen\insert_linenum.mll"
        ( let result = !buffer in buffer := ""; result )
# 152 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | 3 ->
# 33 "src\compiler\dypgen\dypgen\insert_linenum.mll"
                        ( insert_linenum lexbuf )
# 157 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | 4 ->
# 34 "src\compiler\dypgen\dypgen\insert_linenum.mll"
      ( insert_linenum lexbuf )
# 162 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_insert_linenum_rec lexbuf __ocaml_lex_state

and replace_filename parser_code fn lexbuf =
    __ocaml_lex_replace_filename_rec parser_code fn lexbuf 25
and __ocaml_lex_replace_filename_rec parser_code fn lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 37 "src\compiler\dypgen\dypgen\insert_linenum.mll"
                        ( rf2 parser_code fn lexbuf )
# 174 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | 1 ->
# 39 "src\compiler\dypgen\dypgen\insert_linenum.mll"
                  ( replace_filename parser_code fn lexbuf )
# 179 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | 2 ->
# 40 "src\compiler\dypgen\dypgen\insert_linenum.mll"
        ( () )
# 184 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_replace_filename_rec parser_code fn lexbuf __ocaml_lex_state

and rf2 parser_code fn lexbuf =
    __ocaml_lex_rf2_rec parser_code fn lexbuf 35
and __ocaml_lex_rf2_rec parser_code fn lexbuf __ocaml_lex_state =
  match Lexing.engine __ocaml_lex_tables __ocaml_lex_state lexbuf with
      | 0 ->
# 44 "src\compiler\dypgen\dypgen\insert_linenum.mll"
      ( let len = String.length fn in
      if String.sub (Lexing.lexeme lexbuf) 0 len = fn then
        let fn2 = fn^".ml     " in
        let pos = Lexing.lexeme_start_p lexbuf in
        String.blit fn2 0 parser_code pos.pos_cnum (len+8);
      replace_filename parser_code fn lexbuf )
# 201 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | 1 ->
# 50 "src\compiler\dypgen\dypgen\insert_linenum.mll"
        ( () )
# 206 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | 2 ->
# 51 "src\compiler\dypgen\dypgen\insert_linenum.mll"
       ( replace_filename parser_code fn lexbuf )
# 211 "build\release\src\compiler\dypgen\dypgen\insert_linenum.ml"

  | __ocaml_lex_state -> lexbuf.Lexing.refill_buff lexbuf; 
      __ocaml_lex_rf2_rec parser_code fn lexbuf __ocaml_lex_state

;;

