open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1500639424.7252233;
  build_time = "Fri Jul 21 12:17:04 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
