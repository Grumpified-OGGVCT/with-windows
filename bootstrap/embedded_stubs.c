// embedded_stubs.c — zero-length embedded runtime object stubs for Windows bootstrap

#define EMBED(name) \
    const char with_embedded_##name##_start __attribute__((used, section(".rodata"))) = 0; \
    const char with_embedded_##name##_end __attribute__((used, section(".rodata"))) = 0

EMBED(cimport_stubs_o);
EMBED(compat_runtime_o);
EMBED(panic_runtime_o);
EMBED(regex_runtime_o);
EMBED(fiber_stubs_o);
EMBED(channel_runtime_o);
EMBED(fiber_runtime_o);
EMBED(fiber_o);
EMBED(fiber_asm_o);
EMBED(rt_core_o);
EMBED(rt_windows_x86_64_o);
EMBED(rt_linux_x86_64_o);
EMBED(rt_darwin_aarch64_o);
