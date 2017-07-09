open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1499579174.4568026;
  build_time = "Sun Jul  9 05:46:14 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
