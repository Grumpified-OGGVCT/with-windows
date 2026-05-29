// windows_platform.c -- Bootstrap Windows x86_64 runtime shim.
//
// Provides rt_* symbols for the first Windows bootstrap compile.
// Once the stage chain converges, this is replaced by rt/windows_x86_64.w
// compiled by the self-hosted compiler.
//
// Compile with MSVC:  cl /c /O2 windows_platform.c
// Link with bcrypt.lib for rt_fill_random.

#define WIN32_LEAN_AND_MEAN
#include <windows.h>
#include <stdint.h>
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <process.h>
#include <bcrypt.h>
#pragma comment(lib, "bcrypt.lib")
#include <sys/stat.h>
#include "rt_trace.h"
#include "rt_debug.h"

// with_str layout must match with_runtime.h
typedef struct {
    const uint8_t *ptr;
    int64_t len;
} with_str;

// FD-to-HANDLE mapping table
#define FD_TABLE_SIZE 64
static HANDLE fd_table[FD_TABLE_SIZE];
static volatile LONG fd_table_initialized = 0;

static HANDLE win32_lookup(int32_t fd) {
    if (fd < 0 || fd >= FD_TABLE_SIZE) return INVALID_HANDLE_VALUE;
    return fd_table[fd];
}

static int32_t win32_alloc_fd(HANDLE h) {
    if (h == INVALID_HANDLE_VALUE) return -ERROR_INVALID_PARAMETER;
    for (int i = 3; i < FD_TABLE_SIZE; i++) {
        if (fd_table[i] == NULL) {
            fd_table[i] = h;
            return i;
        }
    }
    CloseHandle(h);
    return -ERROR_NO_SYSTEM_RESOURCES;
}

static void win32_free_fd(int32_t fd) {
    if (fd >= 3 && fd < FD_TABLE_SIZE) {
        fd_table[fd] = NULL;
    }
}

static void win32_init_fd_table(void) {
    LONG was = InterlockedCompareExchange(&fd_table_initialized, 1, 0);
    if (was == 0) {
        fd_table[0] = GetStdHandle(STD_INPUT_HANDLE);
        fd_table[1] = GetStdHandle(STD_OUTPUT_HANDLE);
        fd_table[2] = GetStdHandle(STD_ERROR_HANDLE);
        if (fd_table[0] == INVALID_HANDLE_VALUE) fd_table[0] = NULL;
        if (fd_table[1] == INVALID_HANDLE_VALUE) fd_table[1] = NULL;
        if (fd_table[2] == INVALID_HANDLE_VALUE) fd_table[2] = NULL;
    }
}

// The With fs runtime (rt/rt_core.w) is modeled on POSIX errno semantics:
// e.g. fs_mkdir_component treats -EEXIST (-17) as "already exists, ok".
// Windows APIs report Win32 error codes (ERROR_ALREADY_EXISTS == 183), which
// do NOT match POSIX errno. Returning raw Win32 codes silently breaks every
// errno comparison in the runtime. Translate to POSIX errno so all 22 rt_*
// fs wrappers speak the contract the runtime expects.
static int32_t win32_to_errno(DWORD e) {
    switch (e) {
        case ERROR_SUCCESS:                return 0;
        case ERROR_FILE_NOT_FOUND:         return ENOENT;
        case ERROR_PATH_NOT_FOUND:         return ENOENT;
        case ERROR_TOO_MANY_OPEN_FILES:    return EMFILE;
        case ERROR_ACCESS_DENIED:          return EACCES;
        case ERROR_INVALID_HANDLE:         return EBADF;
        case ERROR_NOT_ENOUGH_MEMORY:      return ENOMEM;
        case ERROR_OUTOFMEMORY:            return ENOMEM;
        case ERROR_INVALID_DRIVE:          return ENOENT;
        case ERROR_WRITE_PROTECT:          return EROFS;
        case ERROR_NOT_SAME_DEVICE:        return EXDEV;
        case ERROR_WRITE_FAULT:            return EIO;
        case ERROR_READ_FAULT:             return EIO;
        case ERROR_SHARING_VIOLATION:      return EACCES;
        case ERROR_LOCK_VIOLATION:         return EACCES;
        case ERROR_HANDLE_DISK_FULL:       return ENOSPC;
        case ERROR_DISK_FULL:              return ENOSPC;
        case ERROR_FILE_EXISTS:            return EEXIST;
        case ERROR_ALREADY_EXISTS:         return EEXIST;
        case ERROR_INVALID_PARAMETER:      return EINVAL;
        case ERROR_DIR_NOT_EMPTY:          return ENOTEMPTY;
        case ERROR_FILENAME_EXCED_RANGE:   return ENAMETOOLONG;
        case ERROR_BUFFER_OVERFLOW:        return ENAMETOOLONG;
        case ERROR_DIRECTORY:              return ENOTDIR;
        case ERROR_PRIVILEGE_NOT_HELD:     return EPERM;
        case ERROR_NEGATIVE_SEEK:          return EINVAL;
        case ERROR_SEEK_ON_DEVICE:         return EINVAL;
        case ERROR_BROKEN_PIPE:            return EPIPE;
        case ERROR_BAD_PATHNAME:           return ENOENT;
        case ERROR_BAD_NETPATH:            return ENOENT;
        case ERROR_INVALID_NAME:           return ENOENT;
        default:                           return EIO;
    }
}

static int32_t win32_last_error(void) {
    return win32_to_errno(GetLastError());
}

static int64_t cstr_len(const uint8_t *s) {
    if (!s) return 0;
    int64_t len = 0;
    while (s[len] != 0) len++;
    return len;
}

static with_str rt_owned_str(const char *s) {
    size_t len = strlen(s);
    char *out = (char *)malloc(len == 0 ? 1 : len);
    if (len != 0 && out != NULL) memcpy(out, s, len);
    return (with_str){ .ptr = (uint8_t *)out, .len = (int64_t)len };
}

static int rt_errno(void) {
    DWORD err = GetLastError();
    return err == 0 ? EIO : win32_to_errno(err);
}

// ── I/O ────────────────────────────────────────────────────────────

__declspec(dllexport) int64_t rt_write(int32_t fd, const uint8_t *buf, uint64_t len) {
    RT_TRACE_ENTER("rt_write(fd=%d, len=%llu)", fd, (unsigned long long)len);
    win32_init_fd_table();
    if (len == 0) { RT_TRACE_EXIT("rt_write -> 0 (len=0)"); return 0; }
    if (len > 0x7fffffff) len = 0x7fffffff;
    HANDLE h = win32_lookup(fd);
    if (h == INVALID_HANDLE_VALUE || h == NULL) { RT_TRACE_EXIT("rt_write -> -INVALID_PARAM"); return -(int64_t)ERROR_INVALID_PARAMETER; }
    DWORD written = 0;
    if (!WriteFile(h, buf, (DWORD)len, &written, NULL)) {
        int64_t rc = -(int64_t)win32_last_error();
        RT_TRACE_EXIT("rt_write -> %lld (WriteFile failed)", (long long)rc);
        return rc;
    }
    RT_TRACE_EXIT("rt_write -> %lld", (long long)written);
    return (int64_t)written;
}

__declspec(dllexport) int64_t rt_read(int32_t fd, uint8_t *buf, uint64_t len) {
    RT_TRACE_ENTER("rt_read(fd=%d, len=%llu)", fd, (unsigned long long)len);
    win32_init_fd_table();
    if (len == 0) { RT_TRACE_EXIT("rt_read -> 0 (len=0)"); return 0; }
    if (len > 0x7fffffff) len = 0x7fffffff;
    HANDLE h = win32_lookup(fd);
    if (h == INVALID_HANDLE_VALUE || h == NULL) { RT_TRACE_EXIT("rt_read -> -INVALID_PARAM"); return -(int64_t)ERROR_INVALID_PARAMETER; }
    DWORD read_n = 0;
    if (!ReadFile(h, buf, (DWORD)len, &read_n, NULL)) {
        int64_t rc = -(int64_t)win32_last_error();
        RT_TRACE_EXIT("rt_read -> %lld (ReadFile failed)", (long long)rc);
        return rc;
    }
    RT_TRACE_EXIT("rt_read -> %lld", (long long)read_n);
    return (int64_t)read_n;
}

__declspec(dllexport) int32_t rt_open(const uint8_t *path, int32_t flags, int32_t mode) {
    RT_TRACE_ENTER("rt_open(path=%.100s, flags=0x%x, mode=0%o)", (const char *)path, flags, mode);
    (void)mode;
    win32_init_fd_table();
    DWORD access = 0;
    int canonical = flags & 3;
    if (canonical == 0) access = GENERIC_READ;
    else if (canonical == 1) access = GENERIC_WRITE;
    else access = GENERIC_READ | GENERIC_WRITE;

    DWORD disposition = OPEN_EXISTING;
    if ((flags & 0x200) != 0 || (flags & 0x400) != 0) {
        if ((flags & 0x400) != 0) disposition = CREATE_ALWAYS;
        else disposition = OPEN_ALWAYS;
    }
    if ((flags & 0x800) != 0) {
        if (disposition == OPEN_EXISTING) disposition = OPEN_ALWAYS;
    }

    HANDLE h = CreateFileA((const char *)path, access, FILE_SHARE_READ | FILE_SHARE_WRITE,
                              NULL, disposition, FILE_ATTRIBUTE_NORMAL, NULL);
    if (h == INVALID_HANDLE_VALUE) { int32_t rc = -win32_last_error(); RT_TRACE_EXIT("rt_open -> %d (CreateFile failed)", rc); return rc; }
    int32_t fd = win32_alloc_fd(h);
    if (fd < 0) { CloseHandle(h); RT_TRACE_EXIT("rt_open -> %d (fd alloc failed)", fd); return -win32_last_error(); }
    if ((flags & 0x800) != 0) {
        LARGE_INTEGER li; li.QuadPart = 0;
        SetFilePointerEx(h, li, NULL, FILE_END);
    }
    RT_TRACE_EXIT("rt_open -> %d", fd);
    return fd;
}

__declspec(dllexport) int32_t rt_close(int32_t fd) {
    win32_init_fd_table();
    if (fd >= 0 && fd < 3) {
        win32_free_fd(fd);
        return 0;
    }
    HANDLE h = win32_lookup(fd);
    if (h == INVALID_HANDLE_VALUE || h == NULL) return -(int32_t)ERROR_INVALID_PARAMETER;
    win32_free_fd(fd);
    if (!CloseHandle(h)) return -win32_last_error();
    return 0;
}

__declspec(dllexport) int64_t rt_seek(int32_t fd, int64_t offset, int32_t whence) {
    win32_init_fd_table();
    HANDLE h = win32_lookup(fd);
    if (h == INVALID_HANDLE_VALUE || h == NULL) return -(int64_t)ERROR_INVALID_PARAMETER;
    DWORD method = FILE_BEGIN;
    if (whence == 1) method = FILE_CURRENT;
    else if (whence == 2) method = FILE_END;
    LARGE_INTEGER dist; dist.QuadPart = offset;
    LARGE_INTEGER newPos;
    if (!SetFilePointerEx(h, dist, &newPos, method)) return -(int64_t)win32_last_error();
    return newPos.QuadPart;
}

// ── Memory ────────────────────────────────────────────────────────

__declspec(dllexport) uint8_t *rt_mmap(uint64_t size) {
    RT_TRACE_ENTER("rt_mmap(size=%llu)", (unsigned long long)size);
    void *p = VirtualAlloc(NULL, (SIZE_T)size, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
    RT_TRACE_EXIT("rt_mmap -> %p", p);
    return (uint8_t *)p;
}

__declspec(dllexport) void rt_munmap(uint8_t *ptr, uint64_t size) {
    RT_TRACE_ENTER("rt_munmap(ptr=%p, size=%llu)", (void*)ptr, (unsigned long long)size);
    (void)size;
    if (ptr != NULL) VirtualFree(ptr, 0, MEM_RELEASE);
    RT_TRACE_EXIT("rt_munmap -> void");
}

__declspec(dllexport) void rt_exit(int32_t code) {
    RT_TRACE_ENTER("rt_exit(code=%d)", code);
    ExitProcess((UINT)code);
    RT_TRACE_EXIT("rt_exit -> NEVER");
}

// ── Clock / Sleep / PID ──────────────────────────────────────────

__declspec(dllexport) int64_t rt_clock_ns(void) {
    RT_TRACE_ENTER("rt_clock_ns()");
    LARGE_INTEGER freq, ctr;
    if (!QueryPerformanceFrequency(&freq) || freq.QuadPart <= 0) { RT_TRACE_EXIT("rt_clock_ns -> 0 (no freq)"); return 0; }
    if (!QueryPerformanceCounter(&ctr)) { RT_TRACE_EXIT("rt_clock_ns -> 0 (no ctr)"); return 0; }
    /* Split seconds and sub-second remainder to avoid int64 overflow.
       ctr.QuadPart * 1e9 overflows INT64_MAX after only ~920s of uptime
       at a 10 MHz QPC frequency, wrapping the result negative. */
    int64_t secs = ctr.QuadPart / freq.QuadPart;
    int64_t rem  = ctr.QuadPart % freq.QuadPart;
    int64_t ns = secs * 1000000000LL + (rem * 1000000000LL) / freq.QuadPart;
    RT_TRACE_EXIT("rt_clock_ns -> %lld", (long long)ns);
    return ns;
}

__declspec(dllexport) int32_t rt_nanosleep(int64_t ns) {
    int64_t ms = ns / 1000000;
    if (ms <= 0) { Sleep(0); return 0; }
    if (ms > 0x7fffffff) Sleep(0xFFFFFFFF);
    else Sleep((DWORD)ms);
    return 0;
}

__declspec(dllexport) int32_t rt_getpid(void) {
    return (int32_t)GetCurrentProcessId();
}

// ── Env / Args ─────────────────────────────────────────────────────

static int saved_argc = 0;
static const uint8_t * const *saved_argv = NULL;

__declspec(dllexport) void rt_store_args(int32_t argc, const uint8_t * const *argv) {
    rt_debug_install();  // first rt_* call -> earliest safe hook for the crash handler
    RT_TRACE_ENTER("rt_store_args(argc=%d)", argc);
    saved_argc = argc;
    saved_argv = argv;
    RT_TRACE_EXIT("rt_store_args -> void");
}

__declspec(dllexport) const uint8_t *rt_getenv(const uint8_t *name) {
    RT_TRACE_ENTER("rt_getenv(%.100s)", (const char *)name);
    static char env_buf[8192];
    DWORD n = GetEnvironmentVariableA((const char *)name, env_buf, sizeof(env_buf));
    RT_TRACE_EXIT("rt_getenv -> %s", (n > 0 && n <= sizeof(env_buf)) ? env_buf : "(null)");
    if (n == 0 || n > sizeof(env_buf)) return NULL;
    return (const uint8_t *)env_buf;
}

// ── Filesystem ─────────────────────────────────────────────────────

static void set_stat_fields(const WIN32_FILE_ATTRIBUTE_DATA *attr, int64_t *fields) {
    fields[0] = ((int64_t)(attr->nFileSizeHigh) << 32) | (int64_t)(attr->nFileSizeLow);
    fields[1] = (attr->dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) ? 1 : 0;
    fields[2] = (attr->dwFileAttributes & FILE_ATTRIBUTE_DIRECTORY) ? 0 : 1;
    // FILETIME (100-ns intervals since 1601) to ns since epoch (1970)
    const uint64_t EPOCH_OFFSET = 116444736000000000ULL;
    uint64_t ft = ((uint64_t)attr->ftLastWriteTime.dwHighDateTime << 32) | attr->ftLastWriteTime.dwLowDateTime;
    uint64_t ns100 = (ft > EPOCH_OFFSET) ? (ft - EPOCH_OFFSET) : 0;
    fields[3] = (int64_t)(ns100 * 100);
}

__declspec(dllexport) int32_t rt_stat(const uint8_t *path, uint8_t *out) {
    WIN32_FILE_ATTRIBUTE_DATA attr;
    if (!GetFileAttributesExA((const char *)path, GetFileExInfoStandard, &attr))
        return -win32_last_error();
    set_stat_fields(&attr, (int64_t *)out);
    return 0;
}

__declspec(dllexport) int32_t rt_chmod(const uint8_t *path, int32_t mode) {
    (void)mode;
    DWORD attrs = GetFileAttributesA((const char *)path);
    if (attrs == INVALID_FILE_ATTRIBUTES) return -win32_last_error();
    // Best-effort: clear read-only if owner write is set
    if ((mode & 0200) != 0 && (attrs & FILE_ATTRIBUTE_READONLY)) {
        SetFileAttributesA((const char *)path, attrs & ~FILE_ATTRIBUTE_READONLY);
    }
    return 0;
}

__declspec(dllexport) int32_t rt_mkdir(const uint8_t *path, int32_t mode) {
    (void)mode;
    if (!CreateDirectoryA((const char *)path, NULL)) return -win32_last_error();
    return 0;
}

__declspec(dllexport) int32_t rt_unlink(const uint8_t *path) {
    if (!DeleteFileA((const char *)path)) return -win32_last_error();
    return 0;
}

__declspec(dllexport) int32_t rt_rmdir(const uint8_t *path) {
    if (!RemoveDirectoryA((const char *)path)) return -win32_last_error();
    return 0;
}

__declspec(dllexport) int32_t rt_rename(const uint8_t *old_path, const uint8_t *new_path) {
    if (!MoveFileExA((const char *)old_path, (const char *)new_path, MOVEFILE_REPLACE_EXISTING))
        return -win32_last_error();
    return 0;
}

__declspec(dllexport) int32_t rt_symlink(const uint8_t *target, const uint8_t *link_path) {
    DWORD target_attrs = GetFileAttributesA((const char *)target);
    DWORD flags = (target_attrs != INVALID_FILE_ATTRIBUTES &&
                    (target_attrs & FILE_ATTRIBUTE_DIRECTORY)) ? SYMBOLIC_LINK_FLAG_DIRECTORY : 0;
    // Windows requires developer mode or admin for symlinks
    if (!CreateSymbolicLinkA((const char *)link_path, (const char *)target, flags)) {
        if (GetLastError() == ERROR_PRIVILEGE_NOT_HELD) return -EPERM;
        return -win32_last_error();
    }
    return 0;
}

__declspec(dllexport) int32_t rt_access(const uint8_t *path, int32_t mode) {
    DWORD attrs = GetFileAttributesA((const char *)path);
    if (attrs == INVALID_FILE_ATTRIBUTES) return -win32_last_error();
    if (mode == 0) return 0; // F_OK: file exists, we already know
    if ((mode & 2) != 0 && (attrs & FILE_ATTRIBUTE_READONLY)) return -EACCES;
    return 0;
}

// ── Recursive tree ops ─────────────────────────────────────────────

static void path_join(uint8_t *dest, const uint8_t *parent, const uint8_t *name) {
    int64_t plen = cstr_len(parent);
    int64_t nlen = cstr_len(name);
    for (int64_t i = 0; i < plen; i++) dest[i] = parent[i];
    dest[plen] = (uint8_t)'\\';
    for (int64_t i = 0; i < nlen; i++) dest[plen + 1 + i] = name[i];
    dest[plen + 1 + nlen] = 0;
}

static int32_t rt_remove_tree_impl(const uint8_t *path);

static int32_t rt_remove_subtree(const uint8_t *parent, const uint8_t *name) {
    uint8_t child[4096];
    path_join(child, parent, name);
    return rt_remove_tree_impl(child);
}

static int32_t rt_remove_tree_impl(const uint8_t *path) {
    DWORD attrs = GetFileAttributesA((const char *)path);
    if (attrs == INVALID_FILE_ATTRIBUTES) return -win32_last_error();
    if (!(attrs & FILE_ATTRIBUTE_DIRECTORY)) return rt_unlink(path);

    uint8_t pattern[4096];
    int64_t plen = cstr_len(path);
    memcpy(pattern, path, (size_t)plen);
    pattern[plen] = '\\'; pattern[plen+1] = '*'; pattern[plen+2] = 0;

    WIN32_FIND_DATAA fd;
    HANDLE hFind = FindFirstFileA((const char *)pattern, &fd);
    if (hFind == INVALID_HANDLE_VALUE) return rt_rmdir(path);
    int32_t rc = 0;
    do {
        if (fd.cFileName[0] == '.' && (fd.cFileName[1] == 0 ||
             (fd.cFileName[1] == '.' && fd.cFileName[2] == 0))) continue;
        uint8_t child[4096];
        int64_t clen = cstr_len(path);
        memcpy(child, path, (size_t)clen);
        child[clen] = '\\';
        int n = (int)strlen(fd.cFileName);
        for (int i = 0; i <= n; i++) child[clen + 1 + i] = (uint8_t)fd.cFileName[i];
        rc = rt_remove_tree_impl(child);
    } while (rc == 0 && FindNextFileA(hFind, &fd));
    FindClose(hFind);
    if (rc != 0) return rc;
    return rt_rmdir(path);
}

__declspec(dllexport) int32_t rt_remove_tree(const uint8_t *path) {
    return rt_remove_tree_impl(path);
}

static int32_t rt_copy_file_impl(const uint8_t *src, const uint8_t *dst, DWORD attrs) {
    HANDLE hIn = CreateFileA((const char *)src, GENERIC_READ, FILE_SHARE_READ, NULL,
                               OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hIn == INVALID_HANDLE_VALUE) return -win32_last_error();
    HANDLE hOut = CreateFileA((const char *)dst, GENERIC_WRITE, 0, NULL,
                              CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
    if (hOut == INVALID_HANDLE_VALUE) {
        CloseHandle(hIn); return -win32_last_error();
    }
    uint8_t buf[65536];
    DWORD read_n = 0, written_n = 0, total_written = 0;
    while (ReadFile(hIn, buf, sizeof(buf), &read_n, NULL) && read_n > 0) {
        total_written = 0;
        while (total_written < read_n) {
            if (!WriteFile(hOut, buf + total_written, read_n - total_written, &written_n, NULL)) {
                CloseHandle(hIn); CloseHandle(hOut); return -win32_last_error();
            }
            total_written += written_n;
        }
    }
    CloseHandle(hIn);
    CloseHandle(hOut);
    // Preserve attributes: if source was read-only, make destination read-only too
    if (attrs & FILE_ATTRIBUTE_READONLY) {
        SetFileAttributesA((const char *)dst, FILE_ATTRIBUTE_READONLY);
    }
    return 0;
}

static int32_t rt_copy_tree_impl(const uint8_t *src, const uint8_t *dst);

static int32_t rt_copy_subtree(const uint8_t *parent_src, const uint8_t *parent_dst,
                                const uint8_t *name) {
    uint8_t sbuf[4096], dbuf[4096];
    path_join(sbuf, parent_src, name);
    path_join(dbuf, parent_dst, name);
    return rt_copy_tree_impl(sbuf, dbuf);
}

static int32_t rt_copy_tree_impl(const uint8_t *src, const uint8_t *dst) {
    DWORD attrs = GetFileAttributesA((const char *)src);
    if (attrs == INVALID_FILE_ATTRIBUTES) return -win32_last_error();
    if (!(attrs & FILE_ATTRIBUTE_DIRECTORY))
        return rt_copy_file_impl(src, dst, attrs);

    if (!CreateDirectoryA((const char *)dst, NULL)) {
        if (GetLastError() != ERROR_ALREADY_EXISTS) return -win32_last_error();
    }

    uint8_t pattern[4096];
    int64_t slen = cstr_len(src);
    memcpy(pattern, src, (size_t)slen);
    pattern[slen] = '\\'; pattern[slen+1] = '*'; pattern[slen+2] = 0;

    WIN32_FIND_DATAA fd;
    HANDLE hFind = FindFirstFileA((const char *)pattern, &fd);
    if (hFind == INVALID_HANDLE_VALUE) return 0;
    int32_t rc = 0;
    do {
        if (fd.cFileName[0] == '.' && (fd.cFileName[1] == 0 ||
             (fd.cFileName[1] == '.' && fd.cFileName[2] == 0))) continue;
        rc = rt_copy_subtree(src, dst, (const uint8_t *)fd.cFileName);
    } while (rc == 0 && FindNextFileA(hFind, &fd));
    FindClose(hFind);
    return rc;
}

__declspec(dllexport) int32_t rt_copy_tree(const uint8_t *src, const uint8_t *dst) {
    return rt_copy_tree_impl(src, dst);
}

// ── list_files ─────────────────────────────────────────────────────

static int32_t rt_list_files_append(char **buf, size_t *len, size_t *cap, const char *path);

static int32_t rt_list_files_walk(const uint8_t *path, char **buf, size_t *len, size_t *cap) {
    DWORD attrs = GetFileAttributesA((const char *)path);
    if (attrs == INVALID_FILE_ATTRIBUTES) return -win32_last_error();
    if (!(attrs & FILE_ATTRIBUTE_DIRECTORY)) return rt_list_files_append(buf, len, cap, (const char *)path);

    uint8_t pattern[4096];
    int64_t plen = cstr_len(path);
    memcpy(pattern, path, (size_t)plen);
    pattern[plen] = '\\'; pattern[plen+1] = '*'; pattern[plen+2] = 0;

    WIN32_FIND_DATAA fd;
    HANDLE hFind = FindFirstFileA((const char *)pattern, &fd);
    if (hFind == INVALID_HANDLE_VALUE) return -win32_last_error();
    int32_t rc = 0;
    do {
        if (fd.cFileName[0] == '.' && (fd.cFileName[1] == 0 ||
             (fd.cFileName[1] == '.' && fd.cFileName[2] == 0))) continue;
        uint8_t child[4096];
        path_join(child, path, (const uint8_t *)fd.cFileName);
        rc = rt_list_files_walk(child, buf, len, cap);
    } while (rc == 0 && FindNextFileA(hFind, &fd));
    FindClose(hFind);
    return rc;
}

static int32_t rt_list_files_append(char **buf, size_t *len, size_t *cap, const char *path) {
    size_t path_len = strlen(path);
    if (*len + path_len + 1 > *cap) {
        while (*len + path_len + 1 > *cap) *cap *= 2;
        char *next = (char *)realloc(*buf, *cap);
        if (next == NULL) return -(int32_t)ERROR_NOT_ENOUGH_MEMORY;
        *buf = next;
    }
    memcpy(*buf + *len, path, path_len);
    *len += path_len;
    (*buf)[(*len)++] = '\n';
    return 0;
}

__declspec(dllexport) with_str rt_list_files(const uint8_t *path) {
    size_t cap = 256;
    size_t len = 0;
    char *buf = (char *)malloc(cap);
    if (buf == NULL) return rt_owned_str("");
    int32_t rc = rt_list_files_walk(path, &buf, &len, &cap);
    if (rc != 0) { free(buf); return rt_owned_str(""); }
    return (with_str){ .ptr = (uint8_t *)buf, .len = (int64_t)len };
}

// ── Sysinfo ────────────────────────────────────────────────────────

__declspec(dllexport) int32_t rt_sysinfo(uint8_t *out) {
    typedef struct { int32_t cpu_cores; int64_t memory_total; int64_t page_size; } RtSysInfo;
    RtSysInfo *info = (RtSysInfo *)out;
    SYSTEM_INFO si;
    GetSystemInfo(&si);
    MEMORYSTATUSEX ms;
    ms.dwLength = sizeof(ms);
    GlobalMemoryStatusEx(&ms);
    info->cpu_cores = (int32_t)si.dwNumberOfProcessors;
    info->page_size = (int64_t)si.dwPageSize;
    info->memory_total = (int64_t)ms.ullTotalPhys;
    return 0;
}

__declspec(dllexport) with_str rt_sysinfo_os(void) {
    return rt_owned_str("Windows");
}

__declspec(dllexport) with_str rt_sysinfo_arch(void) {
    return rt_owned_str("x86_64");
}

// ── Random ─────────────────────────────────────────────────────────

__declspec(dllexport) void rt_fill_random(uint8_t *buf, uint64_t len) {
    // BCryptGenRandom with BCRYPT_USE_SYSTEM_PREFERRED_RNG
    // Link with bcrypt.lib
    NTSTATUS status = BCryptGenRandom(NULL, buf, (ULONG)len, BCRYPT_USE_SYSTEM_PREFERRED_RNG);
    if (status != 0) {
        memset(buf, 0, (size_t)len);
    }
}

// ── Threading ──────────────────────────────────────────────────────

__declspec(dllexport) int64_t rt_thread_spawn(uint8_t *start_routine, uint8_t *arg) {
    HANDLE h = CreateThread(NULL, 16 * 1024 * 1024,
                            (LPTHREAD_START_ROUTINE)start_routine, arg, 0, NULL);
    if (h == NULL) return -(int64_t)GetLastError();
    return (int64_t)h;
}

__declspec(dllexport) int32_t rt_thread_join(int64_t handle) {
    DWORD rc = WaitForSingleObject((HANDLE)handle, INFINITE);
    if (rc == WAIT_OBJECT_0) {
        CloseHandle((HANDLE)handle);
        return 0;
    }
    return -(int32_t)GetLastError();
}

// ── Signals (stub on Windows) ──────────────────────────────────────

__declspec(dllexport) int32_t rt_kill(int32_t pid, int32_t sig) {
    (void)sig;
    if (pid == 0) return -(int32_t)ERROR_INVALID_PARAMETER;
    HANDLE h = OpenProcess(PROCESS_TERMINATE, FALSE, (DWORD)pid);
    if (h == NULL) return -(int32_t)GetLastError();
    BOOL ok = TerminateProcess(h, 1);
    CloseHandle(h);
    return ok ? 0 : -(int32_t)GetLastError();
}

__declspec(dllexport) int32_t rt_raise(int32_t sig) {
    (void)sig;
    return 0; // No POSIX raise on Windows
}

// ── POSIX shims for the cross-platform compat surface ──────────────
// Process spawning is now provided natively by rt/compat_runtime_windows.w
// (CreateProcessA), so the fork()/waitpid()/setpgid() stubs that previously
// existed only to let the POSIX fork/execv compat_runtime.w *link* on Windows
// have been REMOVED. Those stubs returned ENOSYS, which made with_exec_argv
// (and therefore every build/run/link that spawns the linker) fail silently --
// exactly the "No Silent Fallbacks" anti-pattern in AGENTS.md. Removing them
// means any lingering reference fails loudly at link time instead.
//
// The shims kept below back other POSIX surfaces still emitted by the
// cross-platform modules (signals, rlimit, env, Darwin libc globals).

#include <process.h>
#include <errno.h>

int sigaction(int sig, const void *act, void *oldact) { (void)sig; (void)act; (void)oldact; return 0; }
int sigprocmask(int how, const void *set, void *oldset) { (void)how; (void)set; (void)oldset; return 0; }
int kill(int pid, int sig) { (void)pid; (void)sig; errno = ENOSYS; return -1; }
int setenv(const char *name, const char *value, int overwrite) { (void)overwrite; return SetEnvironmentVariableA(name, value) ? 0 : -1; }
int getrlimit(int resource, void *rlim) { (void)resource; (void)rlim; return 0; }
int setrlimit(int resource, const void *rlim) { (void)resource; (void)rlim; return 0; }
int *__error(void) { return &errno; }
int __open(const char *path, int flags, ...) { (void)path; (void)flags; errno = ENOSYS; return -1; }

void *rt_libc_stdin(void)  { return stdin; }
void *rt_libc_stdout(void) { return stdout; }
void *rt_libc_stderr(void) { return stderr; }

// Darwin stdio global variables (referenced by std.libc module)
void *__stdinp;
void *__stdoutp;
void *__stderrp;

// ── Fiber stubs (for when fiber_stubs.obj isn't linked) ────────────
// fiber_runtime calls these but they're defined in fiber_stubs

int32_t with_fiber_in_fiber(void) { return 0; }
void with_fiber_panic_capture(uint8_t *buf, int32_t size) { (void)buf; (void)size; }
int32_t with_runtime_take_panicked_fiber(int32_t *fid, const char **msg, int32_t *len) { (void)fid; (void)msg; (void)len; return 0; }
void with_runtime_core_init(void) {}
void with_runtime_core_shutdown(void) {}
int32_t with_runtime_core_has_fibers(void) { return 0; }
void with_runtime_core_run_one_step(void) {}
void with_fiber_set_result(int64_t val) { (void)val; }
int32_t with_runtime_fiber_is_completed(int32_t fid) { (void)fid; return 0; }
void with_fiber_yield(void) {}
int32_t with_runtime_take_completed_fiber(int32_t fid, const char **msg, int32_t *mlen, int32_t *cret) { (void)fid; (void)msg; (void)mlen; (void)cret; return 0; }
int32_t with_runtime_current_cancel_requested(void) { return 0; }
int32_t with_runtime_request_cancel(int32_t fid) { (void)fid; return 0; }
void with_runtime_current_set_cancelled_return(void) {}
int32_t with_runtime_completed_cancelled_return(int32_t fid) { (void)fid; return 0; }
void with_runtime_current_set_cancel_requested(void) {}
int pthread_self(void) { return (int)GetCurrentThreadId(); }

// ── Allocator A/B bisection toggle (DIAGNOSTIC, off by default) ────
// The real allocator lives in rt_core.w and is the canonical owner of
// these symbols. This CRT-malloc shim is NOT a fallback: it is an
// explicit, opt-in bisection switch. Build a SECOND binary with
// -DRT_ALLOC_OVERRIDE to swap rt_core's freelist for plain malloc. If
// a crash present in the default build disappears under the toggle,
// the fault is inside rt_core's allocator. The default build must use
// rt_core so the crash handler catches the real fault. Never ship the
// override; it exists only to localize bugs.
#ifdef RT_ALLOC_OVERRIDE

__declspec(dllexport) uint8_t *with_alloc(int64_t size) {
    RT_TRACE_ENTER("with_alloc(size=%lld)", (long long)size);
    void *p = malloc((size_t)(size > 0 ? size : 1));
    RT_TRACE_EXIT("with_alloc -> %p", p);
    return (uint8_t *)p;
}

__declspec(dllexport) uint8_t *with_alloc_zeroed(int64_t count, int64_t size) {
    RT_TRACE_ENTER("with_alloc_zeroed(count=%lld, size=%lld)", (long long)count, (long long)size);
    int64_t total = count * size;
    void *p = calloc((size_t)(total > 0 ? total : 1), 1);
    RT_TRACE_EXIT("with_alloc_zeroed -> %p", p);
    return (uint8_t *)p;
}

__declspec(dllexport) uint8_t *with_realloc(uint8_t *old, int64_t old_size, int64_t new_size) {
    RT_TRACE_ENTER("with_realloc(old=%p, old=%lld, new=%lld)", (void*)old, (long long)old_size, (long long)new_size);
    (void)old_size;
    void *p = realloc(old, (size_t)(new_size > 0 ? new_size : 1));
    RT_TRACE_EXIT("with_realloc -> %p", p);
    return (uint8_t *)p;
}

__declspec(dllexport) void with_free(uint8_t *ptr) {
    RT_TRACE_ENTER("with_free(%p)", (void*)ptr);
    free(ptr);
    RT_TRACE_EXIT("with_free -> void");
}

__declspec(dllexport) void with_free_sized(uint8_t *ptr, int64_t size) {
    RT_TRACE_ENTER("with_free_sized(%p, %lld)", (void*)ptr, (long long)size);
    (void)size;
    free(ptr);
    RT_TRACE_EXIT("with_free_sized -> void");
}

#endif // RT_ALLOC_OVERRIDE
