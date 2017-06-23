open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1498214611.1874595;
  build_time = "Fri Jun 23 10:43:31 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
