#line 917 "C:/projects/felix/src/packages/rtl-threads.fdoc"
#include "pthread_waitable_bool.hpp"

namespace flx { namespace pthread {

waitable_bool::waitable_bool()
  : finished(false)
{
  // nothing
}

// can be called from any thread
void
waitable_bool::wait_until_true()
{
  ::std::unique_lock< ::std::mutex> locker(cv_lock);

  // wait for the wakeup to say it's finished
  while(!finished)
  {
    finished_cond.wait(cv_lock);
  }
}

void
waitable_bool::signal_true()
{
  { // the mutex is required for the memory barrier..
    ::std::unique_lock< ::std::mutex> locker(cv_lock);
    finished = true;
  }
  finished_cond.notify_all();
  // do absolutely NOTHING here as a typical use of this class is to
  // wait for a thread exit and then destruct its resources, which could
  // very well include this object. boom.
}

} }

