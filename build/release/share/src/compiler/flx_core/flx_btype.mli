open Flx_bid
exception Invalid_int_of_unitsum
type btpattern_t = {
  pattern : t;
  pattern_vars : BidSet.t;
  assignments : (bid_t * t) list;
}
and t = private
    BTYP_hole
  | BTYP_int
  | BTYP_none
  | BTYP_sum of t list
  | BTYP_unitsum of int
  | BTYP_intersect of t list
  | BTYP_union of t list
  | BTYP_inst of bid_t * t list
  | BTYP_tuple of t list
  | BTYP_array of t * t
  | BTYP_record of (string * t) list
  | BTYP_polyrecord of (string * t) list * t
  | BTYP_variant of (string * t) list
  | BTYP_pointer of t
  | BTYP_rref of t
  | BTYP_wref of t
  | BTYP_function of t * t
  | BTYP_effector of t * t * t
  | BTYP_cfunction of t * t
  | BTYP_void
  | BTYP_label
  | BTYP_fix of int * t
  | BTYP_rev of t
  | BTYP_uniq of t
  | BTYP_type of int
  | BTYP_type_tuple of t list
  | BTYP_type_function of (bid_t * t) list * t * t
  | BTYP_type_var of bid_t * t
  | BTYP_type_apply of t * t
  | BTYP_type_map of t * t
  | BTYP_type_match of t * (btpattern_t * t) list
  | BTYP_tuple_cons of t * t
  | BTYP_tuple_snoc of t * t
  | BTYP_type_set of t list
  | BTYP_type_set_union of t list
  | BTYP_type_set_intersection of t list
type overload_result =
    bid_t * t * t * (bid_t * t) list * t list
val trivorder : t -> int option
val istriv : t -> bool
val trivtype : int -> t
val str_of_btype : t -> string
val st : t -> string
val sts : t list -> string

val vhash: string * t -> int
val hash_variants: (string * t) list -> (int * (string * t)) list
val find_vdata: (string * t) list -> int -> string * t
val maybe_find_vdata: (string * t) list -> int -> (string * t) option
val vfind_argtype: (string * t) list -> string -> t
val maybe_vfind_argtype: (string * t) list -> string -> t option
 
exception Free_fixpoint of t
type breqs_t = (bid_t * t list) list
type biface_t =
    BIFACE_export_fun of Flx_srcref.t * bid_t * string
  | BIFACE_export_cfun of Flx_srcref.t * bid_t * string
  | BIFACE_export_python_fun of Flx_srcref.t * bid_t * string
  | BIFACE_export_type of Flx_srcref.t * t * string
  | BIFACE_export_struct of Flx_srcref.t * bid_t
  | BIFACE_export_union of Flx_srcref.t * bid_t * string
  | BIFACE_export_requirement of Flx_srcref.t * breqs_t
val complete_type : t -> bool
val btyp_hole : t
val btyp_label : unit -> t
val btyp_none : unit -> t
val btyp_int : unit -> t
val btyp_void : unit -> t
val btyp_unit : unit -> t
val btyp_bool : unit -> t
val btyp_any : unit -> t
val btyp_sum : t list -> t
val btyp_unitsum : int -> t
val btyp_intersect : t list -> t
val btyp_union : t list -> t
val btyp_inst : bid_t * t list -> t
val btyp_tuple : t list -> t
val btyp_rev : t -> t
val btyp_uniq : t -> t
val btyp_tuple_cons : t -> t -> t
val btyp_tuple_snoc : t -> t -> t
val btyp_array : t * t -> t
val btyp_record : (string * t) list -> t
val btyp_polyrecord : (string * t) list -> t -> t
val btyp_variant : (string * t) list -> t
val btyp_pointer : t -> t
val btyp_rref : t -> t
val btyp_wref : t -> t
val btyp_function : t * t -> t
val btyp_effector : t * t * t -> t
val btyp_cfunction : t * t -> t
val btyp_fix : int -> t -> t
val btyp_type : int -> t
val btyp_type_tuple : t list -> t
val btyp_type_function : (bid_t * t) list * t * t -> t
val btyp_type_var : bid_t * t -> t
val btyp_type_apply : t * t -> t
val btyp_type_map : t * t -> t
val btyp_type_match : t * (btpattern_t * t) list -> t
val btyp_type_set : t list -> t
val btyp_type_set_union : t list -> t
val btyp_type_set_intersection : t list -> t

val bmt: Flx_ast.typecode_t -> t

val unfold : 'a -> t -> t
val is_void : t -> bool
val is_unit : t -> bool
val all_voids : t list -> bool
val all_units : t list -> bool
val is_unitsum : t -> bool
val ipow : int -> int -> int
val int_of_linear_type : 'a -> t -> int
val islinear_type : 'a -> t -> bool
val sizeof_linear_type : 'a -> t -> int
val ncases_of_sum : 'a -> t -> int
val flat_iter :
  ?f_bid:(bid_t -> unit) -> ?f_btype:(t -> unit) -> t -> unit
val iter :
  ?f_bid:(bid_t -> unit) -> ?f_btype:(t -> unit) -> t -> unit
val map :
  ?f_bid:(bid_t -> bid_t) -> ?f_btype:(t -> t) -> t -> t

