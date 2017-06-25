open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1498415504.8352368;
  build_time = "Sun Jun 25 18:31:44 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
