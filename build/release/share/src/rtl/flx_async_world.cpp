#line 725 "C:/projects/felix/src/packages/embed.fdoc"


#include "flx_world.hpp"
#include "flx_async_world.hpp"
#include "flx_sync.hpp"

using namespace ::flx::rtl;
using namespace ::flx::pthread;

namespace flx { namespace run {

static void prun_pthread_entry(void *data) {
  async_sched *d = (async_sched*)data;
  d->prun(async_sched::block);
  delete d;
}

// SPAWNING A NEW FELIX PTHREAD
// CREATES ITS OWN PRIVATE ASYNC SCHEDULER
// CREATES ITS OWN PRIVATE SYNC SCHEDULER
// SHARES WORLD INCLUDING COLLECTOR
// REGISTERS IN THREAD_CONTROL
void async_sched::do_spawn_pthread()
{
  fthread_t *ftx = *(fthread_t**)ss.request->data;
  if (debug_driver)
    fprintf(stderr, "[prun: spawn_pthread] Spawn pthread %p\n", ftx);
  gcp->collector->add_root(ftx);
  std::list<fthread_t*> *pactive = new std::list<fthread_t*>;
  pactive->push_front(ftx);
  void *data = new async_sched(world,debug_driver, gcp, pactive);
  flx_detached_thread_t dummy;

  if (debug_driver)
    fprintf(stderr, "[prun: spawn_pthread] Starting new pthread, thread counter= %zu\n",
      gcp->collector->get_thread_control()->thread_count());

  {
    ::std::mutex spawner_lock;
    ::std::condition_variable_any spawner_cond;
    bool spawner_flag = false;
    ::std::unique_lock< ::std::mutex> locktite(spawner_lock);
    dummy.init(prun_pthread_entry, data, gcp->collector->get_thread_control(),
      &spawner_lock, &spawner_cond,
      &spawner_flag
    );

    if (debug_driver)
      fprintf(stderr,
        "[prun: spawn_pthread] Thread %p waiting for spawned thread to register itself\n",
        (void*)get_current_native_thread());

    while (!spawner_flag)
      spawner_cond.wait(spawner_lock);

    if (debug_driver)
      fprintf(stderr,
        "[prun: spawn_pthread] Thread %p notes spawned thread has registered itself\n",
        (void*)get_current_native_thread());
  }
}

void async_sched::do_general()
{
  if (debug_driver)
    fprintf(stderr, "[prun: svc_general] from fthread=%p\n", ss.ft);

  if(debug_driver)
    fprintf(stderr, "[prun: svc_general] async=%p, ptr_create_async_hooker=%p\n",
      async,
      world->c->ptr_create_async_hooker)
    ;
  if (!async)
  {
    if(debug_driver)
      fprintf(stderr,"[prun: svc_general] trying to create async system..\n");

    if (world->c->ptr_create_async_hooker == NULL) {
      if(debug_driver)
        fprintf(stderr,"[prun: svc_general] trying to create async hooker..\n");
      world->c->init_ptr_create_async_hooker(world->c,debug_driver);
    }
    // Error out if we don't have the hooker function.
    if (world->c->ptr_create_async_hooker == NULL) {
      fprintf(stderr,
        "[prun: svc_general] Unable to initialise async I/O system: terminating\n");
      exit(1);
    }

    // CREATE A NEW ASYNCHRONOUS EVENT MANAGER
    // DONE ON DEMAND ONLY
    async = (*world->c->ptr_create_async_hooker)(
      gcp->collector->get_thread_control(), // thread_control object
      20000, // bound on resumable thread queue
      50,    // bound on general input job queue
      2,     // number of threads in job pool
      50,    // bound on async fileio job queue
      1      // number of threads doing async fileio
    );
  }
  ++async_count;
  if (debug_driver)
    fprintf(stderr,
       "[prun: svc_general] Async system created: %p, count %zu\n",async,async_count);
  // CHANGED TO USE NEW UNION LAYOUT RULES
  // One less level of indirection for pointers
  // void *dreq =  *(void**)ss.request->data;
  void *dreq =  (void*)ss.request->data;
  if (debug_driver)
    fprintf(stderr, "[prun: svc_general] Request object %p\n", dreq);

  // requests are now ALWAYS considered asynchronous
  // even if the request handler reschedules them immediately
  async->handle_request(dreq, ss.ft);
  if (debug_driver)
    fprintf(stderr, "[prun: svc_general] Request object %p captured fthread %p \n", dreq, ss.ft);
  if (debug_driver)
    fprintf(stderr, "[prun: svc_general] Request object %p\n", dreq);
  ss.ft = 0; // drop current without unrooting
  if(debug_driver)
    fprintf(stderr,"[prun: svc_general] request dispatched..\n");
}


int async_sched::prun(block_flag_t block_flag) {
sync_run:
    // RUN SYNCHRONOUS SCHEDULER
    if (debug_driver)
      fprintf(stderr, "prun: sync_run\n");

    if (debug_driver)
      fprintf(stderr, "prun: Before running: Sync state is %s\n",
        ss.get_fpc_desc());

    sync_sched::fstate_t fs = ss.frun();

    if (debug_driver)
      fprintf(stderr, "prun: After running: Sync state is %s/%s\n",
        ss.get_fstate_desc(fs), ss.get_fpc_desc());

    switch(fs)
    {
      // HANDLE DELEGATED SERVICE REQUESTS
      case sync_sched::delegated:
        if (debug_driver)
          fprintf(stderr, "sync_sched:delegated request %d\n", ss.request->variant);
        switch (ss.request->variant)
        {
          case svc_spawn_pthread: do_spawn_pthread(); goto sync_run;

          case svc_general: do_general(); goto sync_run;

          default:
            fprintf(stderr,
              "prun: Unknown service request code 0x%4x\n", ss.request->variant);
            abort();
        }

      // SCHEDULE ANY ASYNCHRONOUSLY QUEUED FTHREADS
      case sync_sched::blocked: // ran out of active threads - are there any in the async queue?
        if(schedule_queued_fthreads(block_flag)) goto sync_run;
        break;
      default:
        fprintf(stderr, "prun: Unknown frun return status 0x%4x\n", fs);
        abort();
    }

  // TEMPORARILY OUT OF JOBS TO DO
  if (debug_driver)
    fprintf(stderr, "prun: Out of ready jobs, %zu pending\n", async_count);
  return async_count;
}

bool async_sched::schedule_queued_fthreads(block_flag_t block_flag) {
  if (debug_driver) {
    fprintf(stderr,
      "prun: out of active synchronous threads, trying async, pending=%zu\n", async_count);
  }
  int scheduled_some = 0;
  if (async && async_count > 0) {
    if (block_flag==block)
    {
      fthread_t* ftp = async->dequeue();
      if (debug_driver)
        fprintf(stderr, "prun: block mode: Async Retrieving fthread %p\n", ftp);

      ss.push_old(ftp);
      --async_count;
      ++scheduled_some;
    }
    else
    {
      fthread_t* ftp = async->maybe_dequeue();
      while (ftp) {
        if (debug_driver)
          fprintf(stderr, "prun:ret mode: Async Retrieving fthread %p\n", ftp);

        ss.push_old(ftp);
        --async_count;
        ++scheduled_some;
        ftp = async->maybe_dequeue();
      }
    }
  }
  if (debug_driver)
    fprintf(stderr, "prun: Async returning: scheduled %d, pending=%zu\n", scheduled_some, async_count);
  return scheduled_some != 0;
}

void async_sched::external_multi_swrite(::flx::rtl::schannel_t *chan, void *data)
  {
    ss.external_multi_swrite (chan,data);
  }

async_sched::~async_sched() {
  try
  {
    if (debug_driver)
      fprintf(stderr, "prun: Terminating Felix subsystem\n");
    delete async;
    delete active;
  }
  catch (...) { fprintf(stderr, "Unknown exception deleting async!\n"); }
}

}} // namespaces

