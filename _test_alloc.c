#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdio.h>
#include <stdint.h>

int main() {
    printf("Testing VirtualAlloc...\n");
    void *p = VirtualAlloc(NULL, 65536, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    printf("VirtualAlloc(64KB): %s (%p)\n", p ? "OK" : "FAIL", p);
    if (p) {
        memset(p, 0xAA, 100);
        printf("  wrote 100 bytes OK\n");
        VirtualFree(p, 0, MEM_RELEASE);
    }
    
    // Test the MEM_TOP_DOWN flag used in windows_platform.c
    void *p2 = VirtualAlloc(NULL, 65536, MEM_COMMIT | MEM_RESERVE | MEM_TOP_DOWN, PAGE_READWRITE);
    printf("VirtualAlloc TOP_DOWN: %s (%p)\n", p2 ? "OK" : "FAIL", p2);
    if (p2) VirtualFree(p2, 0, MEM_RELEASE);
    
    printf("Done.\n");
    return 0;
}
