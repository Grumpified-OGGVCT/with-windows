use c_import("windows.h")
use c_import("stdio.h")

extern fn printf(fmt: *const i8, ...) -> i32

fn main:
    let msg = "Hello from c_import on Windows!\n"
    printf(msg as *const i8)
    print_int(42)
