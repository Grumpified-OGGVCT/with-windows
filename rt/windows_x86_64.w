// rt/windows_x86_64.w -- Windows x86_64 runtime backend.
//
// Implements the rt_* platform boundary through stable Win32 ABI.
// Error convention: negative return = negated GetLastError().
// No EINTR concept on Windows -- no retry loops.
//
// This is a bootstrap-quality backend. Full VEH-based fiber fault handling
// and fiber assembly will be added once the stage chain is established.

extern fn GetCurrentProcessId() -> u32
extern fn ExitProcess(code: u32)
extern fn TerminateProcess(hProcess: i64, code: u32) -> i32
extern fn CreateThread(lpSecurityAttributes: *mut u8, dwStackSize: u64, lpStartAddress: *mut u8, lpParameter: *mut u8, dwCreationFlags: u32, lpThreadId: *mut u32) -> i64
extern fn WaitForSingleObject(hHandle: i64, dwMilliseconds: u32) -> u32
extern fn GetStdHandle(nStdHandle: i32) -> i64
extern fn QueryPerformanceCounter(lpPerformanceCount: *mut i64) -> i32
extern fn QueryPerformanceFrequency(lpFrequency: *mut i64) -> i32
extern fn Sleep(dwMilliseconds: u32)
extern fn VirtualAlloc(lpAddress: *mut u8, dwSize: u64, flAllocationType: u32, flProtect: u32) -> *mut u8
extern fn VirtualFree(lpAddress: *mut u8, dwSize: u64, dwFreeType: u32) -> i32
extern fn GetEnvironmentVariableA(lpName: *const u8, lpBuffer: *mut u8, nSize: u32) -> u32
extern fn GetCurrentDirectoryA(nBufferLength: u32, lpBuffer: *mut u8) -> u32
extern fn CreateFileA(lpFileName: *const u8, dwDesiredAccess: u32, dwShareMode: u32, lpSecurityAttributes: *mut u8, dwCreationDisposition: u32, dwFlagsAndAttributes: u32, hTemplateFile: i64) -> i64
extern fn ReadFile(hFile: i64, lpBuffer: *mut u8, nNumberOfBytesToRead: u32, lpNumberOfBytesRead: *mut u32, lpOverlapped: *mut u8) -> i32
extern fn WriteFile(hFile: i64, lpBuffer: *const u8, nNumberOfBytesToWrite: u32, lpNumberOfBytesWritten: *mut u32, lpOverlapped: *mut u8) -> i32
extern fn SetFilePointerEx(hFile: i64, liDistanceToMove: i64, lpNewFilePointer: *mut i64, dwMoveMethod: u32) -> i32
extern fn GetFileSizeEx(hFile: i64, lpFileSize: *mut i64) -> i32
extern fn CloseHandle(hObject: i64) -> i32
extern fn GetFileAttributesA(lpFileName: *const u8) -> u32
extern fn GetFileAttributesExA(lpFileName: *const u8, fInfoLevelId: i32, lpFileInformation: *mut u8) -> i32
extern fn CreateDirectoryA(lpPathName: *const u8, lpSecurityAttributes: *mut u8) -> i32
extern fn DeleteFileA(lpFileName: *const u8) -> i32
extern fn RemoveDirectoryA(lpPathName: *const u8) -> i32
extern fn MoveFileExA(lpExistingFileName: *const u8, lpNewFileName: *const u8, dwFlags: u32) -> i32
extern fn CreateSymbolicLinkA(lpSymlinkFileName: *const u8, lpTargetFileName: *const u8, dwFlags: u32) -> i32
extern fn SetFileAttributesA(lpFileName: *const u8, dwFileAttributes: u32) -> i32
extern fn FindFirstFileA(lpFileName: *const u8, lpFindFileData: *mut u8) -> i64
extern fn FindNextFileA(hFindFile: i64, lpFindFileData: *mut u8) -> i32
extern fn FindClose(hFindFile: i64) -> i32
extern fn GetSystemInfo(lpSystemInfo: *mut u8)
extern fn GlobalMemoryStatusEx(lpBuffer: *mut u8) -> i32
extern fn GetCommandLineA() -> *const u8
extern fn GetLastError() -> u32
extern fn BCryptGenRandom(hAlgorithm: i64, pbBuffer: *mut u8, cbBuffer: u32, dwFlags: u32) -> i32

extern fn with_alloc(size: i64) -> *mut u8
extern fn with_free(ptr: *mut u8)
extern fn with_memcpy(dst: *mut u8, src: *const u8, len: i64)
extern fn with_memset(dst: *mut u8, val: i32, len: i64)
extern fn with_str_from_cstr(s: *const u8) -> str
extern fn with_str_concat(a: str, b: str) -> str

// Win32 constants.
let INVALID_HANDLE_VALUE: i64 = -1
let STD_INPUT_HANDLE: i32 = -10
let STD_OUTPUT_HANDLE: i32 = -11
let STD_ERROR_HANDLE: i32 = -12
let GENERIC_READ: u32 = 0x80000000
let GENERIC_WRITE: u32 = 0x40000000
let FILE_SHARE_READ: u32 = 0x00000001
let FILE_SHARE_WRITE: u32 = 0x00000002
let CREATE_NEW: u32 = 1
let CREATE_ALWAYS: u32 = 2
let OPEN_EXISTING: u32 = 3
let OPEN_ALWAYS: u32 = 4
let TRUNCATE_EXISTING: u32 = 5
let FILE_ATTRIBUTE_NORMAL: u32 = 0x80
let FILE_ATTRIBUTE_DIRECTORY: u32 = 0x10
let FILE_ATTRIBUTE_REPARSE_POINT: u32 = 0x400
let MEM_COMMIT: u32 = 0x1000
let MEM_RESERVE: u32 = 0x2000
let MEM_RELEASE: u32 = 0x8000
let PAGE_READWRITE: u32 = 0x04
let PAGE_EXECUTE_READWRITE: u32 = 0x40
let FILE_BEGIN: u32 = 0
let FILE_CURRENT: u32 = 1
let FILE_END: u32 = 2
let INFINITE: u32 = 0xFFFFFFFF
let WAIT_OBJECT_0: u32 = 0
let WAIT_TIMEOUT: u32 = 0x102
let WAIT_FAILED: u32 = 0xFFFFFFFF
let ERROR_FILE_NOT_FOUND: u32 = 2
let ERROR_PATH_NOT_FOUND: u32 = 3
let ERROR_ACCESS_DENIED: u32 = 5
let ERROR_ALREADY_EXISTS: u32 = 183
let ERROR_FILE_EXISTS: u32 = 80
let ERROR_INVALID_PARAMETER: u32 = 87
let FILE_ATTRIBUTE_READONLY: u32 = 0x1
let BCRYPT_USE_SYSTEM_PREFERRED_RNG: u32 = 0x00000002
let F_OK: i32 = 0
let R_OK: i32 = 4
let W_OK: i32 = 2
let X_OK: i32 = 1
let MAX_PATH: u32 = 260

// GetFileAttributesExA InfoLevel.
let GetFileExInfoStandard: i32 = 0

// WIN32_FIND_DATAA layout (first fields):
//   dwFileAttributes: u32 (offset 0)
//   ftCreationTime:   FILETIME (offset 4)
//   ftLastAccessTime: FILETIME (offset 12)
//   ftLastWriteTime:  FILETIME (offset 20)
//   nFileSizeHigh:    u32 (offset 28)
//   nFileSizeLow:     u32 (offset 32)
//   dwReserved0:      u32 (offset 36)
//   dwReserved1:      u32 (offset 40)
//   cFileName:        [260]u8 (offset 44)
let WIN32_FIND_DATA_ATTR_OFFSET: i64 = 0
let WIN32_FIND_DATA_SIZE_HIGH_OFFSET: i64 = 28
let WIN32_FIND_DATA_SIZE_LOW_OFFSET: i64 = 32
let WIN32_FIND_DATA_NAME_OFFSET: i64 = 44

// WIN32_FILE_ATTRIBUTE_DATA layout:
//   dwFileAttributes:     u32 (offset 0)
//   ftCreationTime:       FILETIME (offset 4)
//   ftLastAcessTime:      FILETIME (offset 12)
//   ftLastWriteTime:      FILETIME (offset 20)
//   nFileSizeHigh:        u32 (offset 28)
//   nFileSizeLow:         u32 (offset 32)
let FILE_ATTRIBUTE_DATA_SIZE_HIGH: i64 = 28
let FILE_ATTRIBUTE_DATA_SIZE_LOW: i64 = 32
let FILE_ATTRIBUTE_DATA_ATTR: i64 = 0
let FILE_ATTRIBUTE_DATA_MTIME_LOW: i64 = 20
let FILE_ATTRIBUTE_DATA_MTIME_HIGH: i64 = 24

// SYSTEM_INFO layout (we only need dwPageSize and dwNumberOfProcessors):
//   dwOemId:              u32 (offset 0)
//   dwPageSize:           u32 (offset 4)
//   lpMinimumApplicationAddress: *mut u8 (offset 8)
//   lpMaximumApplicationAddress: *mut u8 (offset 16)
//   dwActiveProcessorMask:      u64 (offset 24)
//   dwNumberOfProcessors:       u32 (offset 32)
//   dwProcessorType:          u32 (offset 36)
//   dwAllocationGranularity:  u32 (offset 40)
//   wProcessorLevel:          u16 (offset 44)
//   wProcessorRevision:       u16 (offset 46)
let SYSTEM_INFO_PAGE_SIZE_OFFSET: i64 = 4
let SYSTEM_INFO_CORES_OFFSET: i64 = 32

type RtStatBuf:
    size: i64      // offset 0
    is_dir: i32     // offset 8
    is_file: i32    // offset 12
    modified_ns: i64 // offset 16

type RtSysInfo:
    cpu_cores: i32
    memory_total: i64
    page_size: i64

// FD-to-HANDLE mapping table.
let FD_TABLE_SIZE: i32 = 64
var fd_table: [64]i64 = [0 as i64; 64]
// Tracks whether fd 0/1/2 have been mapped to their std handles. The table is
// initialized lazily on first use (see win32_lookup_fd) so that stdout/stderr
// work for any program from its first write -- previously the table was only
// filled as a side effect of the first rt_getenv call, so a program that wrote
// output before reading an env var silently produced nothing.
var fd_table_initialized: i32 = 0

// Static buffer for GetEnvironmentVariableA fallback.
var env_buf: [8192]u8 = [0 as u8; 8192]
var env_buf_initialized: i32 = 0

@[c_export("rt_store_args")]
pub fn store_args(argc_val: i32, argv_val: *const *const u8):
    rt_argc = argc_val
    rt_argv_raw = argv_val as i64

@[c_export("rt_fill_random")]
pub fn rt_fill_random_impl(buf: *mut u8, len: u64):
    // Use BCryptGenRandom. Requires bcrypt.lib at link time.
    let rc = BCryptGenRandom(0, buf, len as u32, BCRYPT_USE_SYSTEM_PREFERRED_RNG)
    if rc != 0:
        // Fallback: fill with zeroes then set first byte to force notice on debug.
        with_memset(buf, 0, len as i64)
        if len > 0:
            unsafe: *buf = 42

@[c_export("rt_libc_stdin")]
pub fn rt_libc_stdin_impl() -> *mut u8:
    let h = GetStdHandle(STD_INPUT_HANDLE)
    if h == INVALID_HANDLE_VALUE or h == 0:
        return 0 as *mut u8
    h as *mut u8

@[c_export("rt_libc_stdout")]
pub fn rt_libc_stdout_impl() -> *mut u8:
    let h = GetStdHandle(STD_OUTPUT_HANDLE)
    if h == INVALID_HANDLE_VALUE or h == 0:
        return 0 as *mut u8
    h as *mut u8

@[c_export("rt_libc_stderr")]
pub fn rt_libc_stderr_impl() -> *mut u8:
    let h = GetStdHandle(STD_ERROR_HANDLE)
    if h == INVALID_HANDLE_VALUE or h == 0:
        return 0 as *mut u8
    h as *mut u8

@[c_export("rt_fiber_page_size")]
pub fn rt_fiber_page_size_impl() -> i64:
    4096

@[c_export("rt_fiber_mmap_flags")]
pub fn rt_fiber_mmap_flags_impl() -> i32:
    0

@[c_export("rt_fiber_fault_addr")]
pub fn rt_fiber_fault_addr_impl(info: *const u8) -> i64:
    // Bootstrap stub: real VEH-based fault addr comes after stage chain.
    0

@[c_export("rt_fiber_reset_signal_handler")]
pub fn rt_fiber_reset_signal_handler_impl(sig: i32):
    // Windows has no POSIX signals. Real implementation uses RemoveVectoredExceptionHandler
    // after stage chain. This stub is safe: no fiber fault recovery in bootstrap.
    let _ = sig

@[c_export("rt_fiber_install_signal_handlers")]
pub fn rt_fiber_install_signal_handlers_impl(alt_stack: *mut u8, alt_stack_size: i64, handler: i64):
    // Windows uses VEH, not signal handlers. alt_stack and handler are ignored here.
    // Real VEH registration will be added after stage chain.
    let _ = alt_stack
    let _ = alt_stack_size
    let _ = handler

// Internal helpers.
fn win32_get_last_error() -> i32:
    GetLastError() as i32

fn win32_alloc_fd(h: i64) -> i32:
    for i in 0..FD_TABLE_SIZE as i32:
        if fd_table[i as i64] == 0:
            fd_table[i as i64] = h
            return i as i32
    return -24

fn win32_lookup_fd(fd: i32) -> i64:
    if fd_table_initialized == 0:
        win32_init_fd_table()
    if fd < 0 or fd >= FD_TABLE_SIZE:
        return INVALID_HANDLE_VALUE
    fd_table[fd as i64]

fn win32_free_fd(fd: i32):
    if fd < 0 or fd >= FD_TABLE_SIZE:
        return
    fd_table[fd as i64] = 0

// Pre-fill fd 0,1,2 with std handles. Idempotent: safe to call from multiple
// lazy-init sites (win32_lookup_fd, rt_getenv).
fn win32_init_fd_table():
    if fd_table_initialized != 0:
        return
    fd_table_initialized = 1
    fd_table[0] = GetStdHandle(STD_INPUT_HANDLE)
    fd_table[1] = GetStdHandle(STD_OUTPUT_HANDLE)
    fd_table[2] = GetStdHandle(STD_ERROR_HANDLE)

@[c_export("rt_write")]
pub fn rt_write_impl(fd: i32, buf: *const u8, len: i64) -> i64:
    if len <= 0:
        return 0
    if len > 0x7fffffff:
        // Truncate single write to ~2GB which is the Win32 DWORD limit.
        return rt_write_impl(fd, buf, 0x7fffffff as i64)
    let h = win32_lookup_fd(fd)
    if h == INVALID_HANDLE_VALUE or h == 0:
        return -(ERROR_INVALID_PARAMETER as i64)
    var written: u32 = 0
    let ok = WriteFile(h, buf, len as u32, &raw mut written, 0 as *mut u8)
    if ok == 0:
        return -(win32_get_last_error() as i64)
    written as i64

@[c_export("rt_read")]
pub fn rt_read_impl(fd: i32, buf: *mut u8, len: i64) -> i64:
    if len <= 0:
        return 0
    if len > 0x7fffffff:
        return rt_read_impl(fd, buf, 0x7fffffff as i64)
    let h = win32_lookup_fd(fd)
    if h == INVALID_HANDLE_VALUE or h == 0:
        return -(ERROR_INVALID_PARAMETER as i64)
    var read_count: u32 = 0
    let ok = ReadFile(h, buf, len as u32, &raw mut read_count, 0 as *mut u8)
    if ok == 0:
        return -(win32_get_last_error() as i64)
    read_count as i64

@[c_export("rt_open")]
pub fn rt_open_impl(path: *const u8, flags: i32, mode: i32) -> i32:
    // Bootstrap: only O_RDONLY, O_WRONLY, O_RDWR matter. O_CREAT/O_TRUNC/O_APPEND handled.
    var access: u32 = 0
    let canonical_mode = flags & 3
    if canonical_mode == 0:
        access = GENERIC_READ
    else if canonical_mode == 1:
        access = GENERIC_WRITE
    else:
        access = GENERIC_READ | GENERIC_WRITE

    var disposition: u32 = OPEN_EXISTING
    if (flags & 0x200) != 0 or (flags & 0x400) != 0:
        // O_CREAT or O_TRUNC: create or overwrite.
        if (flags & 0x400) != 0:
            disposition = CREATE_ALWAYS
        else:
            disposition = OPEN_ALWAYS
    if (flags & 0x800) != 0:
        // O_APPEND: open always, then seek to end after open.
        if disposition == OPEN_EXISTING:
            disposition = OPEN_ALWAYS

    let h = CreateFileA(path, access, FILE_SHARE_READ | FILE_SHARE_WRITE, 0 as *mut u8, disposition, FILE_ATTRIBUTE_NORMAL, 0)
    if h == INVALID_HANDLE_VALUE:
        return -win32_get_last_error()
    let fd = win32_alloc_fd(h)
    if fd < 0:
        CloseHandle(h)
        return -24
    if (flags & 0x800) != 0:
        let _seek = SetFilePointerEx(h, 0, 0 as *mut i64, FILE_END)
    fd

@[c_export("rt_close")]
pub fn rt_close_impl(fd: i32) -> i32:
    let h = win32_lookup_fd(fd)
    if h == INVALID_HANDLE_VALUE or h == 0:
        return -(ERROR_INVALID_PARAMETER as i32)
    win32_free_fd(fd)
    if CloseHandle(h) == 0:
        return -win32_get_last_error()
    0

@[c_export("rt_seek")]
pub fn rt_seek_impl(fd: i32, offset: i64, whence: i32) -> i64:
    let h = win32_lookup_fd(fd)
    if h == INVALID_HANDLE_VALUE or h == 0:
        return -(ERROR_INVALID_PARAMETER as i64)
    var method: u32 = FILE_BEGIN
    if whence == 1:
        method = FILE_CURRENT
    else if whence == 2:
        method = FILE_END
    var new_pos: i64 = 0
    let ok = SetFilePointerEx(h, offset, &raw mut new_pos, method)
    if ok == 0:
        return -(win32_get_last_error() as i64)
    new_pos

@[c_export("rt_stat")]
pub fn rt_stat_impl(path: *const u8, out: *mut RtStatBuf) -> i32:
    var attr_data: [36]u8 = [0 as u8; 36]
    let ok = GetFileAttributesExA(path, GetFileExInfoStandard, &attr_data as *mut [36]u8 as *mut u8)
    if ok == 0:
        return -win32_get_last_error()
    let base = &attr_data as i64
    let attrs = unsafe: *((base + FILE_ATTRIBUTE_DATA_ATTR) as *const u32)
    let size_high = unsafe: *((base + FILE_ATTRIBUTE_DATA_SIZE_HIGH) as *const u32)
    let size_low = unsafe: *((base + FILE_ATTRIBUTE_DATA_SIZE_LOW) as *const u32)
    let mtime_low = unsafe: *((base + FILE_ATTRIBUTE_DATA_MTIME_LOW) as *const u32) as u64
    let mtime_high = unsafe: *((base + FILE_ATTRIBUTE_DATA_MTIME_HIGH) as *const u32) as u64
    let mtime = (mtime_high << 32) | mtime_low
    // Convert Win32 FILETIME (100-nanosecond intervals since 1601-01-01) to ns since epoch (1970-01-01).
    let epoch_offset_100ns: u64 = 116444736000000000
    let modified_100ns: u64 = if mtime >= epoch_offset_100ns: mtime - epoch_offset_100ns else: 0
    let modified_ns: i64 = (modified_100ns * 100) as i64

    (unsafe: *out).size = ((size_high as u64) << 32 | (size_low as u64)) as i64
    (unsafe: *out).is_dir = if (attrs & FILE_ATTRIBUTE_DIRECTORY) != 0: 1 else: 0
    (unsafe: *out).is_file = if (attrs & FILE_ATTRIBUTE_DIRECTORY) == 0: 1 else: 0
    (unsafe: *out).modified_ns = modified_ns
    0

@[c_export("rt_chmod")]
pub fn rt_chmod_impl(path: *const u8, mode: i32) -> i32:
    // Windows ACL model is different from POSIX modes. For bootstrap, make
    // file writable if mode has write bit, otherwise make it read-only.
    // This is a best-effort approximation.
    let _ = mode
    let attrs = GetFileAttributesA(path)
    if attrs == 0xFFFFFFFF:
        return -win32_get_last_error() as i32
    // If mode & 0o222, ensure not read-only; if mode & 0o444 but not write, set read-only.
    // Keep it simple: make writable if owner write is set.
    if (mode & 0o200) != 0:
        if (attrs & FILE_ATTRIBUTE_READONLY) != 0:
            let _set = SetFileAttributesA(path, attrs & ~FILE_ATTRIBUTE_READONLY)
    0

@[c_export("rt_getcwd")]
pub fn rt_getcwd_impl(buf: *mut u8, size: i64) -> i32:
    let r = GetCurrentDirectoryA(size as u32, buf)
    if r == 0:
        return -win32_get_last_error() as i32
    0

@[c_export("rt_mmap")]
pub fn rt_mmap_impl(size: i64) -> *mut u8:
    let p = VirtualAlloc(0 as *mut u8, size as u64, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE)
    p

@[c_export("rt_munmap")]
pub fn rt_munmap_impl(ptr: *mut u8, size: i64):
    let _ = VirtualFree(ptr, 0, MEM_RELEASE)

@[c_export("rt_exit")]
pub fn rt_exit_impl(code: i32):
    ExitProcess(code as u32)

var rt_argc: i32 = 0
var rt_argv_raw: i64 = 0

@[c_export("rt_args")]
pub fn rt_args_impl() -> (*const *const u8, i32):
    (rt_argv_raw as *const *const u8, rt_argc)

@[c_export("rt_clock_ns")]
pub fn rt_clock_ns_impl() -> i64:
    var freq: i64 = 0
    var ctr: i64 = 0
    if QueryPerformanceFrequency(&raw mut freq) == 0:
        return 0
    if QueryPerformanceCounter(&raw mut ctr) == 0:
        return 0
    if freq <= 0:
        return 0
    // Convert QPC to nanoseconds: ctr * 1_000_000_000 / freq
    (ctr * 1000000000) / freq

@[c_export("rt_nanosleep")]
pub fn rt_nanosleep_impl(ns: i64) -> i32:
    let ms = ns / 1000000
    if ms <= 0:
        Sleep(0)
        return 0
    if ms > 0x7fffffff:
        Sleep(0xFFFFFFFF)
    else:
        Sleep(ms as u32)
    0

@[c_export("rt_getpid")]
pub fn rt_getpid_impl() -> i32:
    GetCurrentProcessId() as i32

@[c_export("rt_kill")]
pub fn rt_kill_impl(pid: i32, sig: i32) -> i32:
    // Minimal implementation: only support SIGKILL (forcefully terminate).
    // On Windows: open process handle with PROCESS_TERMINATE and call TerminateProcess.
    // For bootstrap, we return -ENOSYS unless it's the self-process.
    if pid == GetCurrentProcessId() as i32 and sig == 9:
        ExitProcess(1)
    -(ERROR_INVALID_PARAMETER as i32)

@[c_export("rt_raise")]
pub fn rt_raise_impl(sig: i32) -> i32:
    // Windows POSIX signals are minimal. No-op for bootstrap.
    let _ = sig
    0

@[c_export("rt_thread_spawn")]
pub fn rt_thread_spawn_impl(start_routine: *mut u8, arg: *mut u8) -> i64:
    var tid: u32 = 0
    let h = CreateThread(0 as *mut u8, 16 * 1024 * 1024, start_routine, arg, 0, &raw mut tid)
    if h == 0:
        return -win32_get_last_error() as i64
    h

@[c_export("rt_thread_join")]
pub fn rt_thread_join_impl(handle: i64) -> i32:
    let rc = WaitForSingleObject(handle, INFINITE)
    if rc == WAIT_OBJECT_0:
        return 0
    -(rc as i32)

@[c_export("rt_mkdir")]
pub fn rt_mkdir_impl(path: *const u8, mode: i32) -> i32:
    let _ = mode
    let r = CreateDirectoryA(path, 0 as *mut u8)
    if r == 0:
        return -win32_get_last_error()
    0

@[c_export("rt_unlink")]
pub fn rt_unlink_impl(path: *const u8) -> i32:
    let r = DeleteFileA(path)
    if r == 0:
        return -win32_get_last_error()
    0

@[c_export("rt_rmdir")]
pub fn rt_rmdir_impl(path: *const u8) -> i32:
    let r = RemoveDirectoryA(path)
    if r == 0:
        return -win32_get_last_error()
    0

@[c_export("rt_rename")]
pub fn rt_rename_impl(old_path: *const u8, new_path: *const u8) -> i32:
    let r = MoveFileExA(old_path, new_path, 0x00000001) // MOVEFILE_REPLACE_EXISTING
    if r == 0:
        return -win32_get_last_error()
    0

@[c_export("rt_symlink")]
pub fn rt_symlink_impl(target: *const u8, link_path: *const u8) -> i32:
    // SYMBOLIC_LINK_FLAG_FILE = 0, SYMBOLIC_LINK_FLAG_DIRECTORY = 1
    // We don't know target type, try file first.
    let r = CreateSymbolicLinkA(link_path, target, 0)
    if r == 0:
        return -win32_get_last_error()
    0

@[c_export("rt_access")]
pub fn rt_access_impl(path: *const u8, mode: i32) -> i32:
    let attrs = GetFileAttributesA(path)
    if attrs == 0xFFFFFFFF:
        return -win32_get_last_error()
    if mode == F_OK:
        return 0
    if (mode & R_OK) != 0:
        if (attrs & FILE_ATTRIBUTE_READONLY) != 0:
            return -(ERROR_ACCESS_DENIED as i32)
    if (mode & W_OK) != 0:
        // On Windows, check if file is read-only.
        if (attrs & FILE_ATTRIBUTE_READONLY) != 0:
            return -(ERROR_ACCESS_DENIED as i32)
    // X_OK is always true on Windows for bootstrap.
    0

@[c_export("rt_remove_tree")]
pub fn rt_remove_tree_impl(path: *const u8) -> i32:
    let attrs = GetFileAttributesA(path)
    if attrs == 0xFFFFFFFF:
        return -win32_get_last_error()
    if (attrs & FILE_ATTRIBUTE_DIRECTORY) == 0:
        return rt_unlink_impl(path)
    // Recursive delete via FindFirstFileA
    var pattern: [4096]u8 = [0 as u8; 4096]
    let plen = rt_cstr_len(path)
    var i: i64 = 0
    while i < plen:
        unsafe: *((&pattern as i64 + i) as *mut u8) = unsafe: *((path as i64 + i) as *const u8)
        i = i + 1
    // Add backslash wildcard
    unsafe: *((&pattern as i64 + plen) as *mut u8) = 92 // backslash
    unsafe: *((&pattern as i64 + plen + 1) as *mut u8) = 42 // asterisk
    unsafe: *((&pattern as i64 + plen + 2) as *mut u8) = 0

    let hFind = FindFirstFileA(&pattern as *const [4096]u8 as *const u8, (&pattern as i64 + 256) as *mut u8)
    if hFind == INVALID_HANDLE_VALUE or hFind == -1:
        return rt_rmdir_impl(path)
    var rc: i32 = 0
    while true:
        let name_ptr = ((&pattern as i64 + 256) + WIN32_FIND_DATA_NAME_OFFSET) as *const u8
        let first = unsafe: *name_ptr
        if first == 46:
            let second = unsafe: *((name_ptr as i64 + 1) as *const u8)
            if second == 0 or second == 46:
                // Skip . and ..
                let _ = 0
            else:
                rc = rt_remove_subtree(path, name_ptr)
                if rc != 0:
                    break
        else:
            rc = rt_remove_subtree(path, name_ptr)
            if rc != 0:
                break
        let next = FindNextFileA(hFind, (&pattern as i64 + 256) as *mut u8)
        if next == 0:
            break
    FindClose(hFind)
    if rc != 0:
        return rc
    rt_rmdir_impl(path)

fn rt_remove_subtree(parent: *const u8, name: *const u8) -> i32:
    var buf: [4096]u8 = [0 as u8; 4096]
    let parent_len = rt_cstr_len(parent)
    let name_len = rt_cstr_len(name)
    // Join with backslash
    if parent_len + 1 + name_len + 1 > 4096:
        return -1
    var i: i64 = 0
    while i < parent_len:
        unsafe: *((&buf as i64 + i) as *mut u8) = unsafe: *((parent as i64 + i) as *const u8)
        i = i + 1
    unsafe: *((&buf as i64 + parent_len) as *mut u8) = 92
    var j: i64 = 0
    while j < name_len:
        unsafe: *((&buf as i64 + parent_len + 1 + j) as *mut u8) = unsafe: *((name as i64 + j) as *const u8)
        j = j + 1
    unsafe: *((&buf as i64 + parent_len + 1 + name_len) as *mut u8) = 0
    rt_remove_tree_impl(&buf as *const [4096]u8 as *const u8)

@[c_export("rt_copy_tree")]
pub fn rt_copy_tree_impl(src: *const u8, dst: *const u8) -> i32:
    let attrs = GetFileAttributesA(src)
    if attrs == 0xFFFFFFFF:
        return -win32_get_last_error()
    if (attrs & FILE_ATTRIBUTE_DIRECTORY) == 0:
        return rt_copy_file_impl(src, dst)
    let mkdir_rc = CreateDirectoryA(dst, 0 as *mut u8)
    if mkdir_rc == 0:
        let err = GetLastError()
        if err != ERROR_ALREADY_EXISTS:
            return -err as i32
    // Enumerate children
    var pattern: [4096]u8 = [0 as u8; 4096]
    let slen = rt_cstr_len(src)
    var si: i64 = 0
    while si < slen:
        unsafe: *((&pattern as i64 + si) as *mut u8) = unsafe: *((src as i64 + si) as *const u8)
        si = si + 1
    unsafe: *((&pattern as i64 + slen) as *mut u8) = 92
    unsafe: *((&pattern as i64 + slen + 1) as *mut u8) = 42
    unsafe: *((&pattern as i64 + slen + 2) as *mut u8) = 0

    let hFind = FindFirstFileA(&pattern as *const [4096]u8 as *const u8, (&pattern as i64 + 256) as *mut u8)
    if hFind == INVALID_HANDLE_VALUE or hFind == -1:
        return 0
    var rc: i32 = 0
    while true:
        let name_ptr = ((&pattern as i64 + 256) + WIN32_FIND_DATA_NAME_OFFSET) as *const u8
        let first = unsafe: *name_ptr
        if first == 46:
            let second = unsafe: *((name_ptr as i64 + 1) as *const u8)
            if second == 0 or second == 46:
                // skip . and ..
                0
            else:
                rc = rt_copy_subtree(src, dst, name_ptr)
        else:
            rc = rt_copy_subtree(src, dst, name_ptr)
        if rc != 0:
            break
        let next = FindNextFileA(hFind, (&pattern as i64 + 256) as *mut u8)
        if next == 0:
            break
    FindClose(hFind)
    rc

fn rt_copy_subtree(src: *const u8, dst: *const u8, name: *const u8) -> i32:
    var sbuf: [4096]u8 = [0 as u8; 4096]
    var dbuf: [4096]u8 = [0 as u8; 4096]
    let slen = rt_cstr_len(src)
    let dlen = rt_cstr_len(dst)
    let nlen = rt_cstr_len(name)
    if slen + 1 + nlen + 1 > 4096 or dlen + 1 + nlen + 1 > 4096:
        return -1
    var i: i64 = 0
    while i < slen:
        unsafe: *((&sbuf as i64 + i) as *mut u8) = unsafe: *((src as i64 + i) as *const u8)
        i = i + 1
    unsafe: *((&sbuf as i64 + slen) as *mut u8) = 92
    var j: i64 = 0
    while j < nlen:
        unsafe: *((&sbuf as i64 + slen + 1 + j) as *mut u8) = unsafe: *((name as i64 + j) as *const u8)
        j = j + 1
    unsafe: *((&sbuf as i64 + slen + 1 + nlen) as *mut u8) = 0

    var k: i64 = 0
    while k < dlen:
        unsafe: *((&dbuf as i64 + k) as *mut u8) = unsafe: *((dst as i64 + k) as *const u8)
        k = k + 1
    unsafe: *((&dbuf as i64 + dlen) as *mut u8) = 92
    var m: i64 = 0
    while m < nlen:
        unsafe: *((&dbuf as i64 + dlen + 1 + m) as *mut u8) = unsafe: *((name as i64 + m) as *const u8)
        m = m + 1
    unsafe: *((&dbuf as i64 + dlen + 1 + nlen) as *mut u8) = 0

    rt_copy_tree_impl(&sbuf as *const [4096]u8 as *const u8, &dbuf as *const [4096]u8 as *const u8)

fn rt_copy_file_impl(src: *const u8, dst: *const u8) -> i32:
    let hIn = CreateFileA(src, GENERIC_READ, FILE_SHARE_READ, 0 as *mut u8, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)
    if hIn == INVALID_HANDLE_VALUE:
        return -win32_get_last_error()
    let hOut = CreateFileA(dst, GENERIC_WRITE, 0, 0 as *mut u8, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0)
    if hOut == INVALID_HANDLE_VALUE:
        let _c = CloseHandle(hIn)
        return -win32_get_last_error()
    var buf: [65536]u8 = [0 as u8; 65536]
    while true:
        var read_n: u32 = 0
        let ok_in = ReadFile(hIn, &buf as *mut [65536]u8 as *mut u8, 65536, &raw mut read_n, 0 as *mut u8)
        if ok_in == 0:
            let _c1 = CloseHandle(hIn)
            let _c2 = CloseHandle(hOut)
            return -win32_get_last_error()
        if read_n == 0:
            break
        var written_n: u32 = 0
        var total_written: u32 = 0
        while total_written < read_n:
            let ok_out = WriteFile(hOut, (&buf as i64 + total_written as i64) as *const u8, read_n - total_written, &raw mut written_n, 0 as *mut u8)
            if ok_out == 0:
                let _c1 = CloseHandle(hIn)
                let _c2 = CloseHandle(hOut)
                return -win32_get_last_error()
            total_written = total_written + written_n
    let _c1 = CloseHandle(hIn)
    let _c2 = CloseHandle(hOut)
    0

@[c_export("rt_list_files")]
pub fn rt_list_files_impl(path: *const u8) -> str:
    if rt_cstr_len(path) + 3 > 4096:
        return rt_empty_str()
    var pattern: [4096]u8 = [0 as u8; 4096]
    let plen = rt_cstr_len(path)
    var i: i64 = 0
    while i < plen:
        unsafe: *((&pattern as i64 + i) as *mut u8) = unsafe: *((path as i64 + i) as *const u8)
        i = i + 1
    unsafe: *((&pattern as i64 + plen) as *mut u8) = 92
    unsafe: *((&pattern as i64 + plen + 1) as *mut u8) = 42
    unsafe: *((&pattern as i64 + plen + 2) as *mut u8) = 0

    let hFind = FindFirstFileA(&pattern as *const [4096]u8 as *const u8, (&pattern as i64 + 256) as *mut u8)
    if hFind == INVALID_HANDLE_VALUE or hFind == -1:
        return rt_empty_str()

    var result = rt_empty_str()
    var first = true
    while true:
        let name_ptr = ((&pattern as i64 + 256) + WIN32_FIND_DATA_NAME_OFFSET) as *const u8
        let entry_first = unsafe: *name_ptr
        if entry_first == 46:
            let second = unsafe: *((name_ptr as i64 + 1) as *const u8)
            if second == 0 or second == 46:
                // skip . and ..
                0
            else:
                result = rt_list_files_append_line(result, name_ptr)
        else:
            // Build full path for recursive listing.
            let name = name_ptr as *const u8
            let nlen = rt_cstr_len(name)
            if plen + 1 + nlen + 1 > 4096:
                result = rt_empty_str()
                break
            var child: [4096]u8 = [0 as u8; 4096]
            var ci: i64 = 0
            while ci < plen:
                unsafe: *((&child as i64 + ci) as *mut u8) = unsafe: *((path as i64 + ci) as *const u8)
                ci = ci + 1
            unsafe: *((&child as i64 + plen) as *mut u8) = 92
            var cj: i64 = 0
            while cj < nlen:
                unsafe: *((&child as i64 + plen + 1 + cj) as *mut u8) = unsafe: *((name as i64 + cj) as *const u8)
                cj = cj + 1
            unsafe: *((&child as i64 + plen + 1 + nlen) as *mut u8) = 0
            let attrs = unsafe: *(((&pattern as i64 + 256) + WIN32_FIND_DATA_ATTR_OFFSET) as *const u32)
            if (attrs & FILE_ATTRIBUTE_DIRECTORY) != 0:
                result = rt_list_files_walk(&child as *const [4096]u8 as *const u8, result)
            else:
                result = rt_list_files_append_line(result, &child as *const [4096]u8 as *const u8)
        let next = FindNextFileA(hFind, (&pattern as i64 + 256) as *mut u8)
        if next == 0:
            break
    FindClose(hFind)
    result

fn rt_list_files_walk(path: *const u8, out: str) -> str:
    if rt_cstr_len(path) + 3 > 4096:
        return out
    var pattern: [4096]u8 = [0 as u8; 4096]
    let plen = rt_cstr_len(path)
    var i: i64 = 0
    while i < plen:
        unsafe: *((&pattern as i64 + i) as *mut u8) = unsafe: *((path as i64 + i) as *const u8)
        i = i + 1
    unsafe: *((&pattern as i64 + plen) as *mut u8) = 92
    unsafe: *((&pattern as i64 + plen + 1) as *mut u8) = 42
    unsafe: *((&pattern as i64 + plen + 2) as *mut u8) = 0

    let hFind = FindFirstFileA(&pattern as *const [4096]u8 as *const u8, (&pattern as i64 + 256) as *mut u8)
    if hFind == INVALID_HANDLE_VALUE or hFind == -1:
        return out

    var result = out
    while true:
        let name_ptr = ((&pattern as i64 + 256) + WIN32_FIND_DATA_NAME_OFFSET) as *const u8
        let entry_first = unsafe: *name_ptr
        if entry_first == 46:
            let second = unsafe: *((name_ptr as i64 + 1) as *const u8)
            if second == 0 or second == 46:
                // skip . and ..
                0
            else:
                result = rt_list_files_append_line(result, name_ptr)
        else:
            result = rt_list_files_append_line(result, name_ptr)
        let next = FindNextFileA(hFind, (&pattern as i64 + 256) as *mut u8)
        if next == 0:
            break
    FindClose(hFind)
    result

@[c_export("rt_sysinfo")]
pub fn rt_sysinfo_impl(out: *mut RtSysInfo) -> i32:
    var info: [48]u8 = [0 as u8; 48]
    GetSystemInfo(&info as *mut [48]u8 as *mut u8)
    let page_size = unsafe: *((&info as i64 + SYSTEM_INFO_PAGE_SIZE_OFFSET) as *const u32) as i64
    let cores = unsafe: *((&info as i64 + SYSTEM_INFO_CORES_OFFSET) as *const u32) as i32

    // MEMORYSTATUSEX: dwLength(8) + dwMemoryLoad(4) + ullTotalPhys(8) + ...
    var memstat: [64]u8 = [0 as u8; 64]
    unsafe: *((&memstat as i64) as *mut u32) = 64
    let memok = GlobalMemoryStatusEx(&memstat as *mut [64]u8 as *mut u8)
    let total: i64 = if memok != 0:
        unsafe: *(((&memstat as i64) + 8) as *const i64)
    else:
        0

    (unsafe: *out).cpu_cores = if cores > 0: cores else: 1
    (unsafe: *out).page_size = if page_size > 0: page_size else: 4096
    (unsafe: *out).memory_total = total
    0

@[c_export("rt_sysinfo_os")]
pub fn rt_sysinfo_os_impl() -> str:
    with_str_from_cstr("Windows" as *const u8)

@[c_export("rt_sysinfo_arch")]
pub fn rt_sysinfo_arch_impl() -> str:
    with_str_from_cstr("x86_64" as *const u8)

@[c_export("rt_getenv")]
pub fn rt_getenv_impl(name: *const u8) -> *const u8:
    // We cannot return directly because GetEnvironmentVariableA needs a buffer.
    // Use a static buffer. Limit: 8KB per call, overwrites previous.
    // This is acceptable for bootstrap.
    if env_buf_initialized == 0:
        env_buf_initialized = 1
        win32_init_fd_table()
    let n = GetEnvironmentVariableA(name, &env_buf as *mut [8192]u8 as *mut u8, 8192)
    if n == 0:
        return 0 as *const u8
    if n > 8192:
        return 0 as *const u8
    &env_buf as *const [8192]u8 as *const u8

// String helpers.
fn rt_cstr_len(s: *const u8) -> i64:
    if s as i64 == 0:
        return 0
    var len: i64 = 0
    while unsafe: *((s as i64 + len) as *const u8) != 0:
        len = len + 1
    len

fn rt_empty_str() -> str:
    var empty: [1]u8 = [0 as u8; 1]
    with_str_from_cstr(&empty as *const [1]u8 as *const u8)

fn rt_newline_str() -> str:
    var newline: [2]u8 = [10 as u8, 0 as u8]
    with_str_from_cstr(&newline as *const [2]u8 as *const u8)

fn rt_list_files_append_line(out: str, path: *const u8) -> str:
    with_str_concat(with_str_concat(out, with_str_from_cstr(path)), rt_newline_str())
