open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1497948622.3553183;
  build_time = "Tue Jun 20 08:50:22 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
