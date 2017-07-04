open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1499207547.3514562;
  build_time = "Tue Jul  4 22:32:27 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
