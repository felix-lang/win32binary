open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1498358331.9352577;
  build_time = "Sun Jun 25 02:38:51 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
