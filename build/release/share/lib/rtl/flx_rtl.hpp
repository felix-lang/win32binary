#line 509 "C:/projects/felix/src/packages/rtl.fdoc"
#ifndef __FLX_RTL_H__
#define __FLX_RTL_H__

#include "flx_rtl_config.hpp"
#include "flx_exceptions.hpp"
#include "flx_gc.hpp"
#include "flx_serialisers.hpp"
#include "flx_rtl_shapes.hpp"
#include "flx_compiler_support_headers.hpp"
#include "flx_compiler_support_bodies.hpp"
#include "flx_continuation.hpp"

#include <string>
#include <functional>

namespace flx { namespace rtl {

typedef void *void_pointer;

// ********************************************************
// Compact Linear Type
// ********************************************************

typedef int cl_t;

// ********************************************************
// Felix system classes
// ********************************************************

// MOVED TO flx_exceptions
//struct RTL_EXTERN con_t;     // continuation
struct RTL_EXTERN jump_address_t;     // label variable type
struct RTL_EXTERN fthread_t; // f-thread
struct RTL_EXTERN _uctor_;   // union constructor
struct RTL_EXTERN _variant_;   // variant constructor
struct RTL_EXTERN schannel_t;   // synchronous channel type
struct RTL_EXTERN slist_t;   // singly linked list of void*
struct RTL_EXTERN slist_node_t;   // singly linked list of void*

// MOVE THIS TO RTL AND PROVIDE SUITABLE RTTI SO GC KNOWS ABOUT THE FRAME POINTER
struct RTL_EXTERN jump_address_t
{
  con_t *target_frame;
  FLX_LOCAL_LABEL_VARIABLE_TYPE local_pc;

  jump_address_t (con_t *tf, FLX_LOCAL_LABEL_VARIABLE_TYPE lpc) :
    target_frame (tf), local_pc (lpc)
  {}
  jump_address_t () : target_frame (0), local_pc(0) {}
  jump_address_t (con_t *tf) : target_frame(tf), local_pc(0) {}
  // default copy constructor and assignment
};


// ********************************************************
/// SLIST. singly linked lists: SHARABLE and COPYABLE
/// SLIST manages pointers to memory managed by the collector
// ********************************************************

struct RTL_EXTERN slist_node_t {
  slist_node_t *next;
  void *data;
  slist_node_t(slist_node_t *n, void *d) : next(n), data(d) {}
};


struct RTL_EXTERN slist_t {
  slist_t(){} // hack
  gc::generic::gc_profile_t *gcp;
  struct slist_node_t *head;

  slist_t (gc::generic::gc_profile_t*); ///< create empty list

  void push(void *data);                ///< push a gc pointer
  void *pop();                          ///< pop a gc pointer
  bool isempty()const;
};

// ********************************************************
/// FTHREAD. Felix threads
// ********************************************************

struct RTL_EXTERN fthread_t // fthread abstraction
{
  con_t *cc;                    ///< current continuation

  fthread_t();                  ///< dead thread, suitable for assignment
  fthread_t(con_t*);            ///< make thread from a continuation
  _uctor_ *run();               ///< run until dead or driver service request
  void kill();                  ///< kill by detaching the continuation
  _uctor_ *get_svc()const;      ///< get current service request of waiting thread
private: // uncopyable
  fthread_t(fthread_t const&) = delete;
  void operator=(fthread_t const&) = delete;
};

// ********************************************************
/// SCHANNEL. Synchronous channels
// ********************************************************

struct RTL_EXTERN schannel_t
{
  slist_t *waiting_to_read;             ///< fthreads waiting for a writer
  slist_t *waiting_to_write;            ///< fthreads waiting for a reader
  schannel_t(gc::generic::gc_profile_t*);
  void push_reader(fthread_t *);        ///< add a reader
  fthread_t *pop_reader();              ///< pop a reader, NULL if none
  void push_writer(fthread_t *);        ///< add a writer
  fthread_t *pop_writer();              ///< pop a writer, NULL if none
private: // uncopyable
  schannel_t(schannel_t const&) = delete;
  void operator= (schannel_t const&) = delete;
};

// ********************************************************
/// VARIANTS. Felix union type
/// note: non-polymorphic, so ctor can be inline
// ********************************************************

struct RTL_EXTERN _uctor_
{
  int variant;  ///< Variant code
  void *data;   ///< Heap variant constructor data
  _uctor_() : variant(-1), data(0) {}
  _uctor_(int i, void *d) : variant(i), data(d) {}
  _uctor_(int *a, _uctor_ x) : variant(a[x.variant]), data(x.data) {}
};

RTL_EXTERN char const *describe_service_call(int);

// ********************************************************
/// VARIANTS. Felix variant type
/// note: non-polymorphic, so ctor can be inline
// ********************************************************

struct RTL_EXTERN _variant_
{
  char const *vname;  ///< Variant code
  void *vdata;   ///< Heap variant constructor data
  _variant_() : vname(""), vdata(0) {}
  _variant_(char const *n, void *d) : vname(n), vdata(d) {}
};


// ********************************************************
// SERVICE REQUEST CODE
// THESE VALUES MUST SYNCH WITH THE STANDARD LIBRARY
// ********************************************************

enum svc_t               // what the dispatch should do
{                        // when the resume callback returns
  svc_yield = 0,
  svc_get_fthread=1,
  svc_read=2,
  svc_general=3,               // temporary hack by RF
  svc_reserved1=4,
  svc_spawn_pthread=5,
  svc_spawn_detached=6,        // schedule fthread and invoke
  svc_sread=7,                 // synchronous read
  svc_swrite=8,                // synchronous write
  svc_kill=9,                  // kill fthread
  svc_swait =10,
  svc_multi_swrite=11,         // multi-write
  svc_schedule_detached=12,    // schedule fthread (continue)
  svc_end
};

struct readreq_t {
  schannel_t *chan;
  void *variable;
};

struct flx_trace_t
{
  size_t count;
  int enable_trace;
};

extern RTL_EXTERN int flx_enable_trace;

RTL_EXTERN void flx_trace(flx_trace_t* tr,flx_range_srcref_t sr, char const *file, int line, char const *msg);

}} // namespaces

#endif
