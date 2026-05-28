// rt/compat_runtime_windows.w -- compiler-only runtime functions for Windows.
//
// Win32 equivalents for the process/interrupt/stack-limit surface that
// compat_runtime.w provides on POSIX. All exports use the same @[c_export]
// names so the rest of the compiler is none the wiser.
//
// Bootstrap quality: CreateProcessA-based spawn, no job objects yet.

extern fn with_alloc(size: i64) -> *mut u8
extern fn with_free(ptr: *mut u8) -> void
extern fn with_memcpy(dst: *mut u8, src: *const u8, len: i64) -> void
extern fn with_memset(dst: *mut u8, val: i32, len: i64) -> void
extern fn with_clock_nanos() -> i64

extern fn CreateProcessA(lpApplicationName: *const u8, lpCommandLine: *mut u8,
                          lpProcessAttributes: *mut u8, lpThreadAttributes: *mut u8,
                          bInheritHandles: i32, dwCreationFlags: u32, lpEnvironment: *mut u8,
                          lpCurrentDirectory: *const u8, lpStartupInfo: *mut u8,
                          lpProcessInformation: *mut u8) -> i32
extern fn WaitForSingleObject(hHandle: i64, dwMilliseconds: u32) -> u32
extern fn GetExitCodeProcess(hProcess: i64, lpExitCode: *mut u32) -> i32
extern fn TerminateProcess(hProcess: i64, uExitCode: u32) -> i32
extern fn CloseHandle(hObject: i64) -> i32
extern fn CreateFileA(lpFileName: *const u8, dwDesiredAccess: u32, dwShareMode: u32,
                       lpSecurityAttributes: *mut u8, dwCreationDisposition: u32,
                       dwFlagsAndAttributes: u32, hTemplateFile: i64) -> i64
extern fn SetCurrentDirectoryA(lpPathName: *const u8) -> i32
extern fn GetCurrentDirectoryA(nBufferLength: u32, lpBuffer: *mut u8) -> u32
extern fn SetEnvironmentVariableA(lpName: *const u8, lpValue: *const u8) -> i32
extern fn GetLastError() -> u32
extern fn Sleep(dwMilliseconds: u32)
extern fn GetStdHandle(nStdHandle: i32) -> i64
extern fn SetHandleInformation(hObject: i64, dwMask: u32, dwFlags: u32) -> i32
extern fn DuplicateHandle(hSourceProcessHandle: i64, hSourceHandle: i64,
                           hTargetProcessHandle: i64, lpTargetHandle: *mut i64,
                           dwDesiredAccess: u32, bInheritHandle: i32, dwOptions: u32) -> i32
extern fn GetCurrentProcess() -> i64

let INVALID_HANDLE_VALUE: i64 = -1
let GENERIC_READ: u32 = 0x80000000
let GENERIC_WRITE: u32 = 0x40000000
let GENERIC_ALL: u32 = 0x10000000
let FILE_SHARE_READ: u32 = 0x00000001
let FILE_SHARE_WRITE: u32 = 0x00000002
let FILE_SHARE_DELETE: u32 = 0x00000004
let CREATE_NEW: u32 = 1
let CREATE_ALWAYS: u32 = 2
let OPEN_EXISTING: u32 = 3
let OPEN_ALWAYS: u32 = 4
let TRUNCATE_EXISTING: u32 = 5
let FILE_ATTRIBUTE_NORMAL: u32 = 0x80
let STARTF_USESTDHANDLES: u32 = 0x100
let STARTF_USESHOWWINDOW: u32 = 0x01
let INFINITE: u32 = 0xFFFFFFFF
let WAIT_OBJECT_0: u32 = 0
let WAIT_TIMEOUT: u32 = 0x00000102
let WAIT_FAILED: u32 = 0xFFFFFFFF
let HANDLE_FLAG_INHERIT: u32 = 0x00000001
let STD_INPUT_HANDLE: i32 = -10
let STD_OUTPUT_HANDLE: i32 = -11
let STD_ERROR_HANDLE: i32 = -12
let CAPTURE_TIMEOUT_RC: i32 = 124
let ERROR_FILE_NOT_FOUND: u32 = 2
let ERROR_PATH_NOT_FOUND: u32 = 3
let ERROR_ACCESS_DENIED: u32 = 5

// STARTUPINFOA field offsets (x64)
let SI_CB: i64 = 0
let SI_RESERVED: i64 = 8
// Skip to dwFlags at offset 60
let SI_DWFLAGS: i64 = 60
let SI_WSHOWWINDOW: i64 = 64
let SI_HSTDINPUT: i64 = 80
let SI_HSTDOUTPUT: i64 = 88
let SI_HSTDERROR: i64 = 96
let SI_SIZE: i64 = 104

// PROCESS_INFORMATION field offsets (x64)
let PI_HPROCESS: i64 = 0
let PI_HTHREAD: i64 = 8
let PI_DWPROCESSID: i64 = 16
let PI_SIZE: i64 = 24

var interrupt_flag: i32 = 0
var last_spawned_handle: i64 = 0
var cmd_buf: [32768]u8 = [0 as u8; 32768]

fn make_str(ptr: *const u8, len: i64) -> str:
    var raw: [2]i64 = [ptr as i64, len]
    let p = &raw as *const str
    unsafe: *p

fn str_to_c_buf(s: str) -> *mut u8:
    let out = with_alloc(s.len() + 1)
    if out as i64 == 0:
        return 0 as *mut u8
    if s.len() > 0:
        let sp = &s as *const *const u8
        let data = unsafe: *sp
        with_memcpy(out, data, s.len())
    unsafe: *((out as i64 + s.len()) as *mut u8) = 0
    out

fn cstr_len(s: *const u8) -> i64:
    if s as i64 == 0:
        return 0
    var len: i64 = 0
    while unsafe: *((s as i64 + len) as *const u8) != 0:
        len = len + 1
    len

fn win_last_error() -> i32:
    GetLastError() as i32

fn store_i64(base: i64, offset: i64, value: i64):
    unsafe: *((base + offset) as *mut i64) = value

fn load_u32(base: i64, offset: i64) -> u32:
    unsafe: *((base + offset) as *const u32)

fn load_i64(base: i64, offset: i64) -> i64:
    unsafe: *((base + offset) as *const i64)

fn store_u32(base: i64, offset: i64, value: u32):
    unsafe: *((base + offset) as *mut u32) = value

fn store_i32(base: i64, offset: i64, value: i32):
    unsafe: *((base + offset) as *mut i32) = value

// Build a command line string from argv blob (NUL-separated).
// Result is a single C string with spaces separating args.
// Uses static buffer; max 32768 bytes (Win32 limit).
fn build_command_line_from_blob(blob: *const u8, len: i64) -> *mut u8:
    if len <= 0:
        var single: [1]u8 = [0 as u8; 1]
        return &single as *mut [1]u8 as *mut u8
    var pos: i64 = 0
    var offset: i64 = 0
    var first = true
    while offset < len and pos < 32760:
        if not first:
            unsafe: *((&cmd_buf as i64 + pos) as *mut u8) = 32
            pos = pos + 1
        first = false
        while offset < len and (unsafe: *((blob as i64 + offset) as *const u8)) != 0:
            let ch = unsafe: *((blob as i64 + offset) as *const u8)
            unsafe: *((&cmd_buf as i64 + pos) as *mut u8) = ch
            pos = pos + 1
            offset = offset + 1
            if pos >= 32760:
                break
        offset = offset + 1
    unsafe: *((&cmd_buf as i64 + pos) as *mut u8) = 0
    &cmd_buf as *mut [32768]u8 as *mut u8

// Extract first arg from blob as the application name.
fn first_arg_from_blob(blob: *const u8, len: i64) -> *const u8:
    if len <= 0:
        return 0 as *const u8
    blob

// Fill STARTUPINFOA struct.
fn fill_startupinfo(si: *mut u8, stdin_h: i64, stdout_h: i64, stderr_h: i64):
    with_memset(si, 0, SI_SIZE as i32)
    store_u32(si as i64, SI_CB, SI_SIZE as u32)
    var dwFlags: u32 = 0
    if stdin_h != INVALID_HANDLE_VALUE:
        store_i64(si as i64, SI_HSTDINPUT, stdin_h)
        dwFlags = dwFlags | STARTF_USESTDHANDLES
    if stdout_h != INVALID_HANDLE_VALUE:
        store_i64(si as i64, SI_HSTDOUTPUT, stdout_h)
        dwFlags = dwFlags | STARTF_USESTDHANDLES
    if stderr_h != INVALID_HANDLE_VALUE:
        store_i64(si as i64, SI_HSTDERROR, stderr_h)
        dwFlags = dwFlags | STARTF_USESTDHANDLES
    store_u32(si as i64, SI_DWFLAGS, dwFlags)
    store_u32(si as i64, SI_WSHOWWINDOW, 0)

fn create_file_for_redirect(path: *const u8, is_write: i32) -> i64:
    if is_write != 0:
        CreateFileA(path, GENERIC_WRITE, FILE_SHARE_READ, 0 as *mut u8, CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, 0)
    else:
        CreateFileA(path, GENERIC_READ, FILE_SHARE_READ, 0 as *mut u8, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0)

fn win32_close(h: i64):
    if h != INVALID_HANDLE_VALUE and h != 0:
        CloseHandle(h)

// Wait for a child process handle.
fn wait_for_process_timeout(hProcess: i64, hThread: i64, timeout_ms: i32) -> i32:
    let timeout = if timeout_ms < 0: INFINITE else: timeout_ms as u32
    let rc = WaitForSingleObject(hProcess, timeout)
    if rc == WAIT_OBJECT_0:
        var exit_code: u32 = 0
        GetExitCodeProcess(hProcess, &raw mut exit_code)
        win32_close(hProcess)
        win32_close(hThread)
        return exit_code as i32
    if rc == WAIT_TIMEOUT:
        TerminateProcess(hProcess, CAPTURE_TIMEOUT_RC as u32)
        var exit_code: u32 = 0
        GetExitCodeProcess(hProcess, &raw mut exit_code)
        win32_close(hProcess)
        win32_close(hThread)
        return CAPTURE_TIMEOUT_RC
    win32_close(hProcess)
    win32_close(hThread)
    return -win_last_error()

fn run_binary_direct(path: *const u8) -> i32:
    var si: [104]u8 = [0 as u8; 104]
    fill_startupinfo(&si as *mut [104]u8 as *mut u8, INVALID_HANDLE_VALUE, INVALID_HANDLE_VALUE, INVALID_HANDLE_VALUE)
    var pi: [24]u8 = [0 as u8; 24]
    let cmd = str_to_c_buf(make_str(path, cstr_len(path)))
    let app = str_to_c_buf(make_str(path, cstr_len(path)))
    let ok = CreateProcessA(app, cmd, 0 as *mut u8, 0 as *mut u8, 0, 0, 0 as *mut u8, 0 as *const u8,
                            &si as *mut [104]u8 as *mut u8, &pi as *mut [24]u8 as *mut u8)
    if ok == 0:
        return -win_last_error()
    let hProcess = load_i64(&pi as i64, PI_HPROCESS)
    let hThread = load_i64(&pi as i64, PI_HTHREAD)
    wait_for_process_timeout(hProcess, hThread, -1)

fn run_argv_direct_cwd(blob: *const u8, len: i64, cwd: *const u8) -> i32:
    let app = first_arg_from_blob(blob, len)
    let cmd_line = build_command_line_from_blob(blob, len)
    var si: [104]u8 = [0 as u8; 104]
    fill_startupinfo(&si as *mut [104]u8 as *mut u8, INVALID_HANDLE_VALUE, INVALID_HANDLE_VALUE, INVALID_HANDLE_VALUE)
    var pi: [24]u8 = [0 as u8; 24]
    let ok = CreateProcessA(app, cmd_line, 0 as *mut u8, 0 as *mut u8, 0, 0, 0 as *mut u8, cwd,
                            &si as *mut [104]u8 as *mut u8, &pi as *mut [24]u8 as *mut u8)
    if ok == 0:
        return -win_last_error()
    let hProcess = load_i64(&pi as i64, PI_HPROCESS)
    let hThread = load_i64(&pi as i64, PI_HTHREAD)
    wait_for_process_timeout(hProcess, hThread, -1)

fn run_argv_direct(blob: *const u8, len: i64) -> i32:
    run_argv_direct_cwd(blob, len, 0 as *const u8)

fn run_argv_capture_cwd(blob: *const u8, len: i64, stdout_path: *const u8, stderr_path: *const u8, timeout_ms: i32, stdin_path: *const u8, cwd: *const u8) -> i32:
    let app = first_arg_from_blob(blob, len)
    let cmd_line = build_command_line_from_blob(blob, len)
    var out_h = INVALID_HANDLE_VALUE
    var err_h = INVALID_HANDLE_VALUE
    var in_h = INVALID_HANDLE_VALUE
    if stdout_path as i64 != 0:
        out_h = create_file_for_redirect(stdout_path, 1)
        if out_h == INVALID_HANDLE_VALUE:
            return -win_last_error()
    if stderr_path as i64 != 0:
        err_h = create_file_for_redirect(stderr_path, 1)
        if err_h == INVALID_HANDLE_VALUE:
            win32_close(out_h)
            return -win_last_error()
    if stdin_path as i64 != 0:
        in_h = create_file_for_redirect(stdin_path, 0)
        if in_h == INVALID_HANDLE_VALUE:
            win32_close(out_h)
            win32_close(err_h)
            return -win_last_error()

    var si: [104]u8 = [0 as u8; 104]
    fill_startupinfo(&si as *mut [104]u8 as *mut u8, in_h, out_h, err_h)
    var pi: [24]u8 = [0 as u8; 24]
    let ok = CreateProcessA(app, cmd_line, 0 as *mut u8, 0 as *mut u8, 1, 0, 0 as *mut u8, cwd,
                            &si as *mut [104]u8 as *mut u8, &pi as *mut [24]u8 as *mut u8)
    if ok == 0:
        win32_close(out_h)
        win32_close(err_h)
        win32_close(in_h)
        return -win_last_error()
    let hProcess = load_i64(&pi as i64, PI_HPROCESS)
    let hThread = load_i64(&pi as i64, PI_HTHREAD)
    let rc = wait_for_process_timeout(hProcess, hThread, timeout_ms)
    win32_close(out_h)
    win32_close(err_h)
    win32_close(in_h)
    rc

fn spawn_argv_capture(blob: *const u8, len: i64, stdout_path: *const u8, stderr_path: *const u8) -> i32:
    let app = first_arg_from_blob(blob, len)
    let cmd_line = build_command_line_from_blob(blob, len)
    var out_h = INVALID_HANDLE_VALUE
    var err_h = INVALID_HANDLE_VALUE
    if stdout_path as i64 != 0:
        out_h = create_file_for_redirect(stdout_path, 1)
        if out_h == INVALID_HANDLE_VALUE:
            return -win_last_error()
    if stderr_path as i64 != 0:
        err_h = create_file_for_redirect(stderr_path, 1)
        if err_h == INVALID_HANDLE_VALUE:
            win32_close(out_h)
            return -win_last_error()

    var si: [104]u8 = [0 as u8; 104]
    fill_startupinfo(&si as *mut [104]u8 as *mut u8, INVALID_HANDLE_VALUE, out_h, err_h)
    var pi: [24]u8 = [0 as u8; 24]
    let ok = CreateProcessA(app, cmd_line, 0 as *mut u8, 0 as *mut u8, 1, 0x00000200, 0 as *mut u8, 0 as *const u8,
                            &si as *mut [104]u8 as *mut u8, &pi as *mut [24]u8 as *mut u8)
    if ok == 0:
        win32_close(out_h)
        win32_close(err_h)
        return -win_last_error()
    let hProcess = load_i64(&pi as i64, PI_HPROCESS)
    let hThread = load_i64(&pi as i64, PI_HTHREAD)
    // Don't wait. Return pid. Close thread handle; keep process handle for wait.
    win32_close(hThread)
    // We need to return pid. PROCESS_INFORMATION has dwProcessId at offset 16.
    let pid = load_u32(&pi as i64, PI_DWPROCESSID) as i32
    // We leak the process handle here; it will be closed when exec_wait is called.
    // Store handle somewhere? No, Windows only needs the HANDLE for wait.
    // The caller gets a pid (process ID), and exec_wait will need a handle.
    // Simplification: return negative handle to encode it?
    // Actually, let's store the handle in a static and return the pid.
    // For bootstrap, assume single outstanding spawn at a time.
    last_spawned_handle = hProcess
    pid

fn run_argv_capture(blob: *const u8, len: i64, stdout_path: *const u8, stderr_path: *const u8, timeout_ms: i32) -> i32:
    run_argv_capture_cwd(blob, len, stdout_path, stderr_path, timeout_ms, 0 as *const u8, 0 as *const u8)

fn run_argv_capture_input(blob: *const u8, len: i64, stdout_path: *const u8, stderr_path: *const u8, timeout_ms: i32, stdin_path: *const u8) -> i32:
    run_argv_capture_cwd(blob, len, stdout_path, stderr_path, timeout_ms, stdin_path, 0 as *const u8)

// Public exports ─────────────────────────────────────────────────────

@[c_export("with_setenv_str")]
pub fn setenv_str(name: str, value: str) -> i32:
    let name_buf = str_to_c_buf(name)
    if name_buf as i64 == 0:
        return -1
    let value_buf = str_to_c_buf(value)
    if value_buf as i64 == 0:
        with_free(name_buf)
        return -1
    let rc = SetEnvironmentVariableA(name_buf as *const u8, value_buf as *const u8)
    with_free(name_buf)
    with_free(value_buf)
    if rc == 0:
        return -win_last_error()
    0

@[c_export("with_install_interrupt_handlers")]
pub fn install_interrupt_handlers():
    // Windows uses Ctrl+C handlers, not POSIX signals.
    // Bootstrap: no-op. Real handler can be added later.
    let _ = 0

@[c_export("with_raise_stack_limit")]
pub fn raise_stack_limit():
    // Windows stack is committed by the linker/PE header.
    // Bootstrap: no-op. A real implementation could use VirtualAlloc to grow the stack.
    let _ = 0

@[c_export("with_interrupt_requested")]
pub fn interrupt_requested() -> i32:
    interrupt_flag

@[c_export("with_exec_binary")]
pub fn exec_binary(path: str) -> i32:
    let buf = str_to_c_buf(path)
    if buf as i64 == 0:
        return -1
    if interrupt_flag != 0:
        with_free(buf)
        return -1
    let rc = run_binary_direct(buf as *const u8)
    with_free(buf)
    rc

@[c_export("with_exec_argv")]
pub fn exec_argv(args: str) -> i32:
    let buf = str_to_c_buf(args)
    if buf as i64 == 0:
        return -1
    if interrupt_flag != 0:
        with_free(buf)
        return -1
    let rc = run_argv_direct(buf as *const u8, args.len())
    with_free(buf)
    rc

@[c_export("with_exec_argv_cwd")]
pub fn exec_argv_cwd(args: str, cwd: str) -> i32:
    let arg_buf = str_to_c_buf(args)
    if arg_buf as i64 == 0:
        return -1
    let cwd_buf = str_to_c_buf(cwd)
    if cwd_buf as i64 == 0:
        with_free(arg_buf)
        return -1
    if interrupt_flag != 0:
        with_free(arg_buf)
        with_free(cwd_buf)
        return -1
    let rc = run_argv_direct_cwd(arg_buf as *const u8, args.len(), cwd_buf as *const u8)
    with_free(arg_buf)
    with_free(cwd_buf)
    rc

@[c_export("with_exec_argv_capture")]
pub fn exec_argv_capture(args: str, stdout_path: str, stderr_path: str, timeout_ms: i32) -> i32:
    let arg_buf = str_to_c_buf(args)
    if arg_buf as i64 == 0:
        return -1
    let out_buf = str_to_c_buf(stdout_path)
    if out_buf as i64 == 0:
        with_free(arg_buf)
        return -1
    let err_buf = str_to_c_buf(stderr_path)
    if err_buf as i64 == 0:
        with_free(arg_buf)
        with_free(out_buf)
        return -1
    if interrupt_flag != 0:
        with_free(arg_buf)
        with_free(out_buf)
        with_free(err_buf)
        return -1
    let rc = run_argv_capture(arg_buf as *const u8, args.len(), out_buf as *const u8, err_buf as *const u8, timeout_ms)
    with_free(arg_buf)
    with_free(out_buf)
    with_free(err_buf)
    rc

@[c_export("with_exec_argv_capture_input")]
pub fn exec_argv_capture_input(args: str, stdout_path: str, stderr_path: str, timeout_ms: i32, stdin_path: str) -> i32:
    let arg_buf = str_to_c_buf(args)
    if arg_buf as i64 == 0:
        return -1
    let out_buf = str_to_c_buf(stdout_path)
    if out_buf as i64 == 0:
        with_free(arg_buf)
        return -1
    let err_buf = str_to_c_buf(stderr_path)
    if err_buf as i64 == 0:
        with_free(arg_buf)
        with_free(out_buf)
        return -1
    let in_buf = str_to_c_buf(stdin_path)
    if in_buf as i64 == 0:
        with_free(arg_buf)
        with_free(out_buf)
        with_free(err_buf)
        return -1
    if interrupt_flag != 0:
        with_free(arg_buf)
        with_free(out_buf)
        with_free(err_buf)
        with_free(in_buf)
        return -1
    let rc = run_argv_capture_input(arg_buf as *const u8, args.len(), out_buf as *const u8, err_buf as *const u8, timeout_ms, in_buf as *const u8)
    with_free(arg_buf)
    with_free(out_buf)
    with_free(err_buf)
    with_free(in_buf)
    rc

@[c_export("with_exec_argv_capture_cwd")]
pub fn exec_argv_capture_cwd(args: str, stdout_path: str, stderr_path: str, timeout_ms: i32, cwd: str) -> i32:
    let arg_buf = str_to_c_buf(args)
    if arg_buf as i64 == 0:
        return -1
    let out_buf = str_to_c_buf(stdout_path)
    if out_buf as i64 == 0:
        with_free(arg_buf)
        return -1
    let err_buf = str_to_c_buf(stderr_path)
    if err_buf as i64 == 0:
        with_free(arg_buf)
        with_free(out_buf)
        return -1
    let cwd_buf = str_to_c_buf(cwd)
    if cwd_buf as i64 == 0:
        with_free(arg_buf)
        with_free(out_buf)
        with_free(err_buf)
        return -1
    if interrupt_flag != 0:
        with_free(arg_buf)
        with_free(out_buf)
        with_free(err_buf)
        with_free(cwd_buf)
        return -1
    let rc = run_argv_capture_cwd(arg_buf as *const u8, args.len(), out_buf as *const u8, err_buf as *const u8, timeout_ms, 0 as *const u8, cwd_buf as *const u8)
    with_free(arg_buf)
    with_free(out_buf)
    with_free(err_buf)
    with_free(cwd_buf)
    rc

@[c_export("with_exec_argv_capture_spawn")]
pub fn exec_argv_capture_spawn(args: str, stdout_path: str, stderr_path: str) -> i32:
    let arg_buf = str_to_c_buf(args)
    if arg_buf as i64 == 0:
        return -1
    let out_buf = str_to_c_buf(stdout_path)
    if out_buf as i64 == 0:
        with_free(arg_buf)
        return -1
    let err_buf = str_to_c_buf(stderr_path)
    if err_buf as i64 == 0:
        with_free(arg_buf)
        with_free(out_buf)
        return -1
    if interrupt_flag != 0:
        with_free(arg_buf)
        with_free(out_buf)
        with_free(err_buf)
        return -1
    let pid = spawn_argv_capture(arg_buf as *const u8, args.len(), out_buf as *const u8, err_buf as *const u8)
    with_free(arg_buf)
    with_free(out_buf)
    with_free(err_buf)
    pid

@[c_export("with_exec_wait")]
pub fn exec_wait(pid: i32, timeout_ms: i32) -> i32:
    if pid <= 0:
        return -1
    // For bootstrap, open a handle from pid using OpenProcess.
    // We need to keep track of handles. Use the last_spawned_handle static from spawn.
    let hProcess = last_spawned_handle
    if hProcess == 0 or hProcess == INVALID_HANDLE_VALUE:
        return -1
    last_spawned_handle = 0
    let rc = wait_for_process_timeout(hProcess, INVALID_HANDLE_VALUE, timeout_ms)
    rc
