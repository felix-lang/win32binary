open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1498745568.1041603;
  build_time = "Thu Jun 29 14:12:48 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
