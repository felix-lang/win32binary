open Flx_version
let version_data: version_data_t =
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1495037602.1783836;
  build_time = "Wed May 17 16:13:22 2017";
}
;;
let set_version () =
  Flx_version.version_data := version_data
;;
