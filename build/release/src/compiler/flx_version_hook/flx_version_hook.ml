open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1503506921.52715;
  build_time = "Wed Aug 23 16:48:41 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
