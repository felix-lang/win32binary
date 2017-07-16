open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1500167114.6783507;
  build_time = "Sun Jul 16 01:05:14 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
