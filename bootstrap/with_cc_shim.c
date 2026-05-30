/* with_cc_shim.c -- Windows link driver shim for the With self-hosting compiler.
 *
 * WHY THIS EXISTS
 * ---------------
 * src/compiler/Link.w drives the final link by spawning a POSIX-style C driver
 * named "cc" with a gcc/clang command line:
 *
 *     cc <user.o> <extras...> -o <bin> -l<lib>...
 *
 * That model is incomplete for Windows in several ways (all in WITH proper,
 * Link.w):
 *   1. There is no "cc" on Windows; the driver name is hardcoded.
 *   2. make_link_command emits no Windows branch -- no Win32 import libs
 *      (bcrypt for BCryptGenRandom, ws2_32 for gethostname, ...).
 *   3. link_stage_make_archive writes single-object .a archives whose symbol
 *      index lld-link does not fully honor, so some members are never pulled
 *      (e.g. with_fiber_await from fiber_stubs).
 *   4. The dead-code elimination it relies on elsewhere (-Wl,--gc-sections,
 *      GNU semantics) cannot be reproduced with COFF + lld-link, which reports
 *      undefined symbols before any /OPT:REF GC runs.
 *
 * Rather than fight clang's driver with env hacks, this shim is a deterministic
 * link driver we fully control. It is installed as the "cc" the compiler spawns.
 * It ignores Link.w's archive/-l bookkeeping and instead links the user object
 * directly against the complete set of Windows COFF runtime objects (verified to
 * have no duplicate symbols) plus the Win32 import libs, via lld-link.
 *
 * This is a HARNESS bridge. The proper fix is a Windows link path in Link.w
 * (clang/lld-link driver, Win32 libs, COFF-correct archives). That is WITH
 * proper and is left for the maintainer; see docs notes.
 *
 * Runtime object directory: env WITH_RT_LIB, else "out\\lib".
 * lld-link must be on PATH; MSVC LIB must be set (vcvars) for the import libs.
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <process.h>

int main(int argc, char **argv) {
    const char *userobj = NULL;
    const char *out = NULL;

    for (int i = 1; i < argc; i++) {
        if (strcmp(argv[i], "-o") == 0 && i + 1 < argc) { out = argv[++i]; continue; }
        if (!userobj) {
            size_t n = strlen(argv[i]);
            if (n > 2 && strcmp(argv[i] + n - 2, ".o") == 0) userobj = argv[i];
        }
    }
    if (!userobj || !out) {
        fprintf(stderr, "with-cc: could not determine user object / output from args\n");
        for (int i = 0; i < argc; i++) fprintf(stderr, "  argv[%d]=%s\n", i, argv[i]);
        return 2;
    }

    const char *rtdir = getenv("WITH_RT_LIB");
    if (!rtdir || !*rtdir) rtdir = "out\\lib";

    /* Complete Windows runtime object set for a pure-With program. Verified
     * (llvm-nm) to define no overlapping symbols, so direct linking is safe and
     * every symbol rt_core may reference (regex, fiber await, panic) is present. */
    static const char *mods[] = {
        "rt_core.o", "rt_windows_x86_64.o", "panic_runtime.o",
        "regex_runtime.o", "compat_runtime.o", "fiber_stubs.o",
    };
    enum { NMODS = (int)(sizeof(mods) / sizeof(mods[0])) };

    static char rtpaths[NMODS][1024];
    for (int i = 0; i < NMODS; i++)
        snprintf(rtpaths[i], sizeof(rtpaths[i]), "%s\\%s", rtdir, mods[i]);

    char outarg[1100];
    snprintf(outarg, sizeof(outarg), "/OUT:%s", out);

    const char *libs[] = {
        "kernel32.lib", "user32.lib", "bcrypt.lib", "ws2_32.lib",
        "advapi32.lib", "shell32.lib", "ole32.lib", "ntdll.lib",
        "libcmt.lib", "libvcruntime.lib", "libucrt.lib", "oldnames.lib",
    };
    enum { NLIBS = (int)(sizeof(libs) / sizeof(libs[0])) };

    const char *args[8 + NMODS + NLIBS + 4];
    int a = 0;
    args[a++] = "lld-link";
    args[a++] = "/nologo";
    args[a++] = "/SUBSYSTEM:CONSOLE";
    args[a++] = outarg;
    args[a++] = userobj;
    for (int i = 0; i < NMODS; i++) args[a++] = rtpaths[i];
    for (int i = 0; i < NLIBS; i++) args[a++] = libs[i];
    args[a] = NULL;

    intptr_t rc = _spawnvp(_P_WAIT, "lld-link", args);
    if (rc == -1) {
        perror("with-cc: failed to spawn lld-link");
        return 3;
    }
    return (int)rc;
}
