// posix_stubs.c — minimal POSIX/fiber stubs (no rt_* duplicates)
#include <windows.h>
#include <stdint.h>
#include <stdio.h>
#include <errno.h>
#include <process.h>

// POSIX stubs
int sigaction(int sig, const void *act, void *oldact) { (void)sig; (void)act; (void)oldact; return 0; }
int sigprocmask(int how, const void *set, void *oldset) { (void)how; (void)set; (void)oldset; return 0; }
int kill(int pid, int sig) { (void)pid; (void)sig; errno = ENOSYS; return -1; }
int fork(void) { errno = ENOSYS; return -1; }
int waitpid(int pid, int *status, int options) { (void)pid; (void)status; (void)options; errno = ENOSYS; return -1; }
int setpgid(int pid, int pgid) { (void)pid; (void)pgid; errno = ENOSYS; return -1; }
int setenv(const char *name, const char *value, int overwrite) { (void)overwrite; return SetEnvironmentVariableA(name, value) ? 0 : -1; }
int getrlimit(int resource, void *rlim) { (void)resource; (void)rlim; return 0; }
int setrlimit(int resource, const void *rlim) { (void)resource; (void)rlim; return 0; }
int *__error(void) { return &errno; }
int __open(const char *path, int flags, ...) { (void)path; (void)flags; errno = ENOSYS; return -1; }

// libc stubs (defined in windows_x86_64.obj)
// rt_libc_stdin/out/err and __stdinp/__stdoutp/__stderrp removed — provided by windows_x86_64.obj

// Fiber stubs (not in fiber_runtime.obj)
int32_t with_fiber_in_fiber(void) { return 0; }
void with_fiber_panic_capture(uint8_t *buf, int32_t size) { (void)buf; (void)size; }
int32_t with_runtime_take_panicked_fiber(int32_t *fid, const char **msg, int32_t *len) { (void)fid; (void)msg; (void)len; return 0; }
int32_t with_runtime_fiber_is_completed(int32_t fid) { (void)fid; return 0; }
void with_fiber_yield(void) {}
int32_t with_runtime_take_completed_fiber(int32_t fid, const char **msg, int32_t *mlen, int32_t *cret) { (void)fid; (void)msg; (void)mlen; (void)cret; return 0; }
void with_fiber_set_result(int64_t val) { (void)val; }
void with_runtime_core_init(void) {}
void with_runtime_core_shutdown(void) {}
int32_t with_runtime_core_has_fibers(void) { return 0; }
void with_runtime_core_run_one_step(void) {}
int32_t with_runtime_current_cancel_requested(void) { return 0; }
int32_t with_runtime_request_cancel(int32_t fid) { (void)fid; return 0; }
void with_runtime_current_set_cancelled_return(void) {}
int32_t with_runtime_completed_cancelled_return(int32_t fid) { (void)fid; return 0; }
void with_runtime_current_set_cancel_requested(void) {}
int pthread_self(void) { return (int)GetCurrentThreadId(); }

