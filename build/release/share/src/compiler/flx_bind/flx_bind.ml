open Flx_sym
open Flx_ast
open Flx_bid
open Flx_bind_state

let bind_asms bind_state bsym_table start_counter asms =
(*
print_endline "Flx_bind.bind_asms: Binding asms ..";
*)
  (* Add the symbols to the symtab. *)
  let print_flag = bind_state.syms.Flx_mtypes2.compiler_options.Flx_options.print_flag in
  let counter_ref = bind_state.syms.Flx_mtypes2.counter in
  Flx_symtab.add_asms print_flag counter_ref bind_state.symtab "root" 0 None asms;
(*
print_endline "Flx_bind.bind_asms: Making symbol table done";
*)
(*
  let exes = Flx_symtab.get_init_exes bind_state.symtab in
*)
  let ifaces = Flx_symtab.get_exports bind_state.symtab in
(*
print_endline ("Bind_asms: ifaces = " ^ string_of_int (List.length ifaces));
*)

(*
print_endline "Flx_bind.bind_asms: built symbol table";
*)
(*
print_endline (Flx_symtab.detail bind_state.symtab);
*)
  (* Now, bind all the symbols. *)
  Flx_bbind.bbind bind_state.bbind_state start_counter counter_ref bsym_table;
(*
print_endline "Flx_bind.bind_asms: bbind done";
*)
  (* Bind the interfaces. *)
  bind_state.syms.Flx_mtypes2.bifaces <- bind_state.syms.Flx_mtypes2.bifaces @ List.map
    (Flx_bind_interfaces.bind_interface bind_state.bbind_state bsym_table) ifaces
 
(*
;print_endline ("Flx_bind.bind_asms: " ^string_of_int (List.length bind_state.syms.Flx_mtypes2.bifaces)^ 
" interfaces bound, to state.syms.bifaces")
*)

(** Find the root module's init function index. *)
let find_root_module_init_function_from_sym_table syms =
  (* Look up the root procedure index. *)
  let { Flx_sym.pubmap=pubmap; symdef=symdef } =
    try Flx_sym_table.find syms 0 with Not_found ->
      failwith ("Can't find root entry " ^ Flx_print.string_of_bid 0 ^
        " in symbol table?")
  in

  match symdef with
    | Flx_types.SYMDEF_root p -> None 
    (* | Flx_types.SYMDEF_module p -> p *)
    | _ -> failwith "Expected to find top level module ''"

let find_root_module_init_function_from_bind_state bind_state =
 find_root_module_init_function_from_sym_table bind_state.sym_table


