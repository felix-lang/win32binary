#line 692 "C:/cygwin64/home/skaller/felix/src/packages/rtl-threads.fdoc"
#include "pthread_monitor.hpp"
#include <string.h>       // strerror
#include <assert.h>
#include <thread>
#include <atomic>

using namespace std;

#define NQFENCE ::std::memory_order_seq_cst
#define DQFENCE ::std::memory_order_seq_cst


namespace flx { namespace pthread {

monitor_t::monitor_t(thread_control_base_t *tc_) : tc(tc_), data(0) {}
monitor_t::~monitor_t() { }

static void sleep(thread_control_base_t *tc, size_t ns)
{
  assert(tc);
  tc->yield();
  //::std::this_thread::sleep_for(::std::chrono::nanoseconds(ns));
  ::std::this_thread::yield();
}

void
monitor_t::enqueue(void* elt)
{
  // wrap user data up with a flag so this thread
  // can wait until our user data elt is consumed
  monitor_data_t monitor_data (elt);
  monitor_data_t *p = &monitor_data;

  // swap user data into the monitor
  // note we might get back a value some other thread put there
  // in which case we keep swapping until we get a NULL
  // which means we no longer have any data to put into the monitor
  while ( (p = ::std::atomic_exchange_explicit(&data, p, NQFENCE))) sleep (tc,1);

  // wait for the *original* data to be consumed
  // note that some other thread may have swapped that data
  // into its own space and will be trying as above to swap it
  // into the monitor for a NULL.
  while (!monitor_data.flag.load()) sleep(tc,1);
}

void*
monitor_t::dequeue()
{
  monitor_data_t *p = 0;

  // Swap NULL into the monitor until we get a non-NULL value back.
  while ( !(p = ::std::atomic_exchange_explicit (&data, p, DQFENCE))) sleep(tc,1);

  // grab the user data
  void *elt = p->user_data;

  // signal that we have the data
  p->flag.store(true);
  // the writer that was originally responsible for putting
  // the data we read into the monitor may now proceed
  return elt; // return data
}

}}

