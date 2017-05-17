#line 27 "C:/projects/felix/src/packages/embed.fdoc"

#ifndef __flx_world_config_H_
#define __flx_world_config_H_

#include "flx_rtl_config.hpp"
#include "flx_gc.hpp"
#include "flx_collector.hpp"
#include "flx_dynlink.hpp"

// for async_sched
#include <list>
#include "flx_async.hpp"
#include "flx_sync.hpp"

namespace flx { namespace run {

class RTL_EXTERN flx_config {
public:
  bool  debug;

  bool debug_threads;
  bool debug_allocations;
  bool debug_collections;
  bool report_collections;
  bool report_gcstats;

  bool debug_driver;
  bool finalise;

  size_t gc_freq;
  size_t min_mem;
  size_t max_mem;
  int gcthreads;

  double free_factor;

  bool allow_collection_anywhere;

  bool static_link;
  char *filename; // expected to live forever
  char **flx_argv;
  int flx_argc;

  // TODO: fn up in macro area
  int init(int argc, char **argv);

// interface for drivers. there's more, create_frame, etc
  create_async_hooker_t *ptr_create_async_hooker=nullptr;

  typedef ::flx::dynlink::flx_dynlink_t *(*link_library_t)(flx_config *c, ::flx::gc::generic::gc_profile_t*);
  typedef void (*init_ptr_create_async_hooker_t)(flx_config *, bool debug_driver);
  typedef int (*get_flx_args_config_t)(int argc, char **argv, flx_config* c);

  link_library_t link_library;
  init_ptr_create_async_hooker_t init_ptr_create_async_hooker;
  get_flx_args_config_t get_flx_args_config;

  flx_config (link_library_t, init_ptr_create_async_hooker_t, get_flx_args_config_t);


};

}} // namespaces
#endif
