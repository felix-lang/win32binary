open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1500093935.6424458;
  build_time = "Sat Jul 15 04:45:35 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
