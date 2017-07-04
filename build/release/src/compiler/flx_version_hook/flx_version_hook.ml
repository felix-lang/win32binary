open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1499142772.2330594;
  build_time = "Tue Jul  4 04:32:52 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
