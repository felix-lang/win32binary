(* Errors (exceptions) generated by the library.  *)

(* Source location (file, line) *)
type location =
  bytes * int

(* These errors indicate non-fatal run-time errors that should be
   reported, generally interactively.  *)
exception Error of bytes
exception ErrorL of location * bytes


