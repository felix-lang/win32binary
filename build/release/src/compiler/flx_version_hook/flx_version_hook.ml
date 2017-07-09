open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1499581035.6147256;
  build_time = "Sun Jul  9 06:17:15 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
