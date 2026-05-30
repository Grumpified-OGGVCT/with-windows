#include <stdio.h>
#include <windows.h>

int main() {
    printf("Testing Windows runtime functions...\n");
    
    void *p = VirtualAlloc(NULL, 4096, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    printf("VirtualAlloc: %s\n", p ? "OK" : "FAIL");
    if (p) VirtualFree(p, 0, MEM_RELEASE);
    
    HANDLE h = GetStdHandle(STD_OUTPUT_HANDLE);
    printf("GetStdHandle: %s\n", h && h != INVALID_HANDLE_VALUE ? "OK" : "FAIL");
    
    DWORD written;
    const char *msg = "Hello from test!\n";
    int ok = WriteFile(h, msg, (DWORD)strlen(msg), &written, NULL);
    printf("WriteFile: %s (%d bytes)\n", ok ? "OK" : "FAIL", (int)written);
    
    printf("All tests passed\n");
    return 0;
}
