extern "C" void bootflx_create_thread_frame();
extern "C" void bootflx_flx_start();
void* static_create_thread_frame = (void*)bootflx_create_thread_frame;
void* static_flx_start = (void*)bootflx_flx_start;
