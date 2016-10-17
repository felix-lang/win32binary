open Flx_version
let version_data: version_data_t = 
{
  version_string = "2016.07.12-rc1";
  build_time_float = 1.47668e+09;
  build_time = "1.47668e+09";
}
;;
let set_version () = 
  Flx_version.version_data := version_data
;;
