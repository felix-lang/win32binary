open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1501051199.30425;
  build_time = "Wed Jul 26 06:39:59 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
