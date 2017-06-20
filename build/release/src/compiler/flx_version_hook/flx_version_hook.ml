open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1497946761.1734974;
  build_time = "Tue Jun 20 08:19:21 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
