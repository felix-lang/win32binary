open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1500509211.054029;
  build_time = "Thu Jul 20 00:06:51 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
