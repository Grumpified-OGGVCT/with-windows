// rt_trace.h — Build-scoped runtime tracer for Windows bootstrap debugging.
// 
// Usage: compile with -DRT_TRACE to enable tracing.
// Output goes to with_trace.log in the current directory.
// 
// Each rt_* entry/exit is logged with timestamp, thread id, args, and rc.
// The log file is flushed on every write so the last entry before a crash is preserved.

#ifndef RT_TRACE_H
#define RT_TRACE_H

#ifdef RT_TRACE

#include <stdio.h>
#include <windows.h>
#include <time.h>

static FILE *rt_trace_fp = NULL;
static volatile LONG rt_trace_lock = 0;

static void rt_trace_init(void) {
    if (!rt_trace_fp) {
        rt_trace_fp = fopen("with_trace.log", "w");
        if (rt_trace_fp) {
            setvbuf(rt_trace_fp, NULL, _IONBF, 0); // unbuffered
            fprintf(rt_trace_fp, "# with.exe runtime trace\n");
            fprintf(rt_trace_fp, "# pid=%lu tid=%lu\n", 
                    GetCurrentProcessId(), GetCurrentThreadId());
        }
    }
}

static int64_t rt_trace_now_us(void) {
    LARGE_INTEGER freq, ctr;
    static LARGE_INTEGER base = {0};
    if (base.QuadPart == 0) {
        QueryPerformanceFrequency(&freq);
        QueryPerformanceCounter(&base);
    }
    QueryPerformanceCounter(&ctr);
    QueryPerformanceFrequency(&freq);
    return ((ctr.QuadPart - base.QuadPart) * 1000000LL) / freq.QuadPart;
}

#define RT_TRACE_ENTER(fmt, ...) do { \
    rt_trace_init(); \
    if (rt_trace_fp) { \
        while (InterlockedExchange(&rt_trace_lock, 1)) Sleep(0); \
        fprintf(rt_trace_fp, "[%10lld] [%5lu] > " fmt "\n", rt_trace_now_us(), GetCurrentThreadId(), ##__VA_ARGS__); \
        fflush(rt_trace_fp); \
        InterlockedExchange(&rt_trace_lock, 0); \
    } \
} while(0)

#define RT_TRACE_EXIT(fmt, ...) do { \
    if (rt_trace_fp) { \
        while (InterlockedExchange(&rt_trace_lock, 1)) Sleep(0); \
        fprintf(rt_trace_fp, "[%10lld] [%5lu] < " fmt "\n", rt_trace_now_us(), GetCurrentThreadId(), ##__VA_ARGS__); \
        fflush(rt_trace_fp); \
        InterlockedExchange(&rt_trace_lock, 0); \
    } \
} while(0)

#define RT_TRACE_MSG(fmt, ...) do { \
    rt_trace_init(); \
    if (rt_trace_fp) { \
        while (InterlockedExchange(&rt_trace_lock, 1)) Sleep(0); \
        fprintf(rt_trace_fp, "[%10lld] [%5lu]   " fmt "\n", rt_trace_now_us(), GetCurrentThreadId(), ##__VA_ARGS__); \
        fflush(rt_trace_fp); \
        InterlockedExchange(&rt_trace_lock, 0); \
    } \
} while(0)

#else
#define RT_TRACE_ENTER(fmt, ...) do {} while(0)
#define RT_TRACE_EXIT(fmt, ...)  do {} while(0)
#define RT_TRACE_MSG(fmt, ...)   do {} while(0)
#endif

#endif // RT_TRACE_H
