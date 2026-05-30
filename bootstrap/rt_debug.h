// rt_debug.h -- Build-scoped crash diagnostics for the Windows bootstrap.
//
// PURPOSE
//   The bootstrap `with.exe` dies on a hard C0000005 (access violation) with
//   no information. Native faults cannot be seen by rt_* print-tracing because
//   they happen inside pure emitted-C, not inside a platform syscall. This
//   header installs a Vectored Exception Handler that, on any fatal exception,
//   writes a complete, actionable dump and exits deterministically.
//
//   It needs NO external debugger and NO .pdb. Every address is also printed
//   as an RVA (address - module base). Link the program with `/MAP:with.map`
//   and run `resolve-crash.ps1` to turn the backtrace RVAs into function names.
//
// LIFETIME / SUSTAINABILITY
//   This lives entirely in the harness/platform layer. It does not touch the
//   `with` compiler, the runtime semantics, or the emitted C. When the stage
//   chain converges and rt/windows_x86_64.w replaces windows_platform.c, this
//   header is simply dropped -- nothing upstream depends on it.
//
// ENABLE
//   Compiled in only when -DRT_DEBUG is passed. Call rt_debug_install() once at
//   process start; it is wired into rt_store_args (the first rt_* call the
//   compiler makes, per the runtime trace).

#ifndef RT_DEBUG_H
#define RT_DEBUG_H

#ifdef RT_DEBUG

#ifndef WIN32_LEAN_AND_MEAN
#define WIN32_LEAN_AND_MEAN
#endif
#include <windows.h>
#include <stdint.h>
#include <stdio.h>

static uintptr_t rt_dbg_module_base(void) {
    return (uintptr_t)GetModuleHandleW(NULL);
}

static const char *rt_dbg_code_name(DWORD code) {
    switch (code) {
        case EXCEPTION_ACCESS_VIOLATION:      return "ACCESS_VIOLATION";
        case EXCEPTION_STACK_OVERFLOW:        return "STACK_OVERFLOW";
        case EXCEPTION_ILLEGAL_INSTRUCTION:   return "ILLEGAL_INSTRUCTION";
        case EXCEPTION_INT_DIVIDE_BY_ZERO:    return "INT_DIVIDE_BY_ZERO";
        case EXCEPTION_INT_OVERFLOW:          return "INT_OVERFLOW";
        case EXCEPTION_PRIV_INSTRUCTION:      return "PRIV_INSTRUCTION";
        case EXCEPTION_DATATYPE_MISALIGNMENT: return "DATATYPE_MISALIGNMENT";
        case EXCEPTION_IN_PAGE_ERROR:         return "IN_PAGE_ERROR";
        case EXCEPTION_NONCONTINUABLE_EXCEPTION: return "NONCONTINUABLE";
        default:                              return "OTHER";
    }
}

static int rt_dbg_is_fatal(DWORD code) {
    switch (code) {
        case EXCEPTION_ACCESS_VIOLATION:
        case EXCEPTION_STACK_OVERFLOW:
        case EXCEPTION_ILLEGAL_INSTRUCTION:
        case EXCEPTION_INT_DIVIDE_BY_ZERO:
        case EXCEPTION_PRIV_INSTRUCTION:
        case EXCEPTION_DATATYPE_MISALIGNMENT:
        case EXCEPTION_IN_PAGE_ERROR:
        case EXCEPTION_NONCONTINUABLE_EXCEPTION:
            return 1;
        default:
            return 0;
    }
}

static void rt_dbg_report(FILE *out, EXCEPTION_POINTERS *ep) {
    EXCEPTION_RECORD *er = ep->ExceptionRecord;
    CONTEXT *ctx = ep->ContextRecord;
    uintptr_t base = rt_dbg_module_base();
    uintptr_t rip  = (uintptr_t)er->ExceptionAddress;

    fprintf(out, "\n==== WITH CRASH DUMP ====\n");
    fprintf(out, "exception  : 0x%08lX (%s)\n",
            (unsigned long)er->ExceptionCode, rt_dbg_code_name(er->ExceptionCode));
    fprintf(out, "module_base: 0x%016llX\n", (unsigned long long)base);
    fprintf(out, "fault_addr : 0x%016llX   RVA 0x%llX\n",
            (unsigned long long)rip,
            (unsigned long long)(rip >= base ? rip - base : 0));

    if (er->ExceptionCode == EXCEPTION_ACCESS_VIOLATION && er->NumberParameters >= 2) {
        ULONG_PTR kind = er->ExceptionInformation[0];
        const char *op = kind == 0 ? "READ" : (kind == 1 ? "WRITE" : (kind == 8 ? "EXECUTE" : "?"));
        fprintf(out, "access     : %s @ 0x%016llX\n",
                op, (unsigned long long)er->ExceptionInformation[1]);
    }

#if defined(_M_X64) || defined(__x86_64__)
    if (ctx) {
        fprintf(out, "rax=%016llX rbx=%016llX rcx=%016llX rdx=%016llX\n",
                (unsigned long long)ctx->Rax, (unsigned long long)ctx->Rbx,
                (unsigned long long)ctx->Rcx, (unsigned long long)ctx->Rdx);
        fprintf(out, "rsi=%016llX rdi=%016llX rbp=%016llX rsp=%016llX\n",
                (unsigned long long)ctx->Rsi, (unsigned long long)ctx->Rdi,
                (unsigned long long)ctx->Rbp, (unsigned long long)ctx->Rsp);
        fprintf(out, "r8 =%016llX r9 =%016llX r10=%016llX r11=%016llX\n",
                (unsigned long long)ctx->R8,  (unsigned long long)ctx->R9,
                (unsigned long long)ctx->R10, (unsigned long long)ctx->R11);
        fprintf(out, "r12=%016llX r13=%016llX r14=%016llX r15=%016llX\n",
                (unsigned long long)ctx->R12, (unsigned long long)ctx->R13,
                (unsigned long long)ctx->R14, (unsigned long long)ctx->R15);
    }
#endif

    fprintf(out, "backtrace (resolve RVAs with: pwsh resolve-crash.ps1):\n");
    void *frames[64];
    USHORT n = RtlCaptureStackBackTrace(0, 64, frames, NULL);
    for (USHORT i = 0; i < n; i++) {
        uintptr_t a = (uintptr_t)frames[i];
        fprintf(out, "  #%-2u 0x%016llX   RVA 0x%llX\n",
                (unsigned)i, (unsigned long long)a,
                (unsigned long long)(a >= base ? a - base : 0));
    }
    fprintf(out, "==== END CRASH DUMP ====\n");
    fflush(out);
}

static LONG WINAPI rt_dbg_veh(EXCEPTION_POINTERS *ep) {
    static volatile LONG in_handler = 0;
    DWORD code = ep->ExceptionRecord->ExceptionCode;

    if (!rt_dbg_is_fatal(code)) {
        return EXCEPTION_CONTINUE_SEARCH;
    }
    // Re-entrancy guard: a fault inside the reporter must not loop forever.
    if (InterlockedCompareExchange(&in_handler, 1, 0) != 0) {
        TerminateProcess(GetCurrentProcess(), (UINT)code);
        return EXCEPTION_CONTINUE_SEARCH;
    }

    rt_dbg_report(stderr, ep);
    FILE *f = fopen("with_crash.log", "w");
    if (f) { rt_dbg_report(f, ep); fclose(f); }

    // Deterministic, loud exit. Exit code carries the OS exception code so
    // callers/CI can detect the fault class without parsing the log.
    TerminateProcess(GetCurrentProcess(), (UINT)code);
    return EXCEPTION_CONTINUE_SEARCH;
}

static void rt_debug_install(void) {
    static volatile LONG installed = 0;
    if (InterlockedCompareExchange(&installed, 1, 0) != 0) return;

    // Reserve guard stack so the handler can still run on STACK_OVERFLOW.
    ULONG guarantee = 64 * 1024;
    SetThreadStackGuarantee(&guarantee);

    // 1 == call this handler FIRST, before frame-based (SEH) handlers, so a
    // fault is always captured even if some library would otherwise swallow it.
    AddVectoredExceptionHandler(1, rt_dbg_veh);

    fprintf(stderr, "[rt_debug] crash handler installed (module_base=0x%016llX)\n",
            (unsigned long long)rt_dbg_module_base());
    fflush(stderr);
}

#else  /* RT_DEBUG not defined */

static void rt_debug_install(void) {}

#endif /* RT_DEBUG */

#endif /* RT_DEBUG_H */
