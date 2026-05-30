// _test_rt2.c — test rt_open/rt_read from windows_platform.c
#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdint.h>
#include <stdio.h>

// Copy-paste from windows_platform.c to test in isolation
typedef struct { const uint8_t *ptr; int64_t len; } with_str;

#define FD_TABLE_SIZE 64
static HANDLE fd_table[FD_TABLE_SIZE];
static volatile LONG fd_table_initialized = 0;

static void win32_init_fd_table(void) {
    LONG was = InterlockedCompareExchange(&fd_table_initialized, 1, 0);
    if (was == 0) {
        fd_table[0] = GetStdHandle(STD_INPUT_HANDLE);
        fd_table[1] = GetStdHandle(STD_OUTPUT_HANDLE);
        fd_table[2] = GetStdHandle(STD_ERROR_HANDLE);
    }
}

static int32_t win32_alloc_fd(HANDLE h) {
    for (int i = 3; i < FD_TABLE_SIZE; i++) {
        if (fd_table[i] == NULL) { fd_table[i] = h; return i; }
    }
    return -1;
}

int32_t rt_open(const uint8_t *path, int32_t flags, int32_t mode) {
    (void)mode;
    win32_init_fd_table();
    DWORD access = GENERIC_READ;
    DWORD disp = OPEN_EXISTING;
    HANDLE h = CreateFileA((const char *)path, access, FILE_SHARE_READ, NULL, disp, FILE_ATTRIBUTE_NORMAL, NULL);
    if (h == INVALID_HANDLE_VALUE) { printf("CreateFileA failed: %d\n", (int)GetLastError()); return -1; }
    int32_t fd = win32_alloc_fd(h);
    printf("rt_open OK: fd=%d, handle=%p\n", fd, h);
    return fd;
}

int main() {
    printf("Testing rt_open('rt/rt_core.w')...\n");
    int fd = rt_open((const uint8_t *)"rt/rt_core.w", 0, 0);
    if (fd >= 0) {
        printf("SUCCESS: opened fd %d\n", fd);
        CloseHandle(fd_table[fd]);
    } else {
        printf("FAILED\n");
    }
    return 0;
}
