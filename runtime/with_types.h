#ifndef WITH_TYPES_ONLY_H
#define WITH_TYPES_ONLY_H
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

// Core With types — using emitted C internal pointer types
typedef struct { const uint8_t *ptr; int64_t len; } with_str;
typedef struct { void *ptr; int64_t len; int64_t cap; int64_t elem_size; } with_vec;
typedef struct { bool has_value; int32_t value; } with_option_i32;
typedef struct { bool has_value; int64_t value; } with_option_i64;
typedef struct { bool has_value; with_str value; } with_option_str;
#define WITH_STR_LIT(s) ((with_str){(const uint8_t*)(s), (int64_t)(sizeof(s) - 1)})
#define with_len(v) ((v).len)
#define with_is_empty(v) (((v).len == 0) ? 1 : 0)

// String — matches emitted C types (uint8_t*)
with_str with_str_concat(with_str a, with_str b);
int32_t with_str_eq(with_str a, with_str b);
with_str with_str_clone(with_str s);
int64_t with_str_len(with_str s);
int32_t with_str_byte_at(with_str s, int64_t index);
with_str with_str_slice(with_str s, int64_t start, int64_t end);
with_str with_str_substr(with_str s, int64_t start, int64_t len);
int32_t with_str_starts_with(with_str s, with_str prefix);
int32_t with_str_ends_with(with_str s, with_str suffix);
int32_t with_str_contains(with_str haystack, with_str needle);
int64_t with_str_index_of(with_str haystack, with_str needle);
with_str with_str_trim(with_str s);
with_str with_str_to_upper(with_str s);
with_str with_str_to_lower(with_str s);
with_str with_str_repeat(with_str s, int64_t n);
with_str with_str_replace(with_str s, with_str old, with_str new_s);
with_str with_str_from_cstr(const uint8_t *s);
with_str with_str_from_bytes(const uint8_t *s, int64_t len);
with_str with_str_from_byte(int32_t b);
int64_t with_str_hash(with_str s);
with_str with_i32_to_str(int32_t n);
with_str with_i64_to_str(int64_t n);
with_str with_bool_to_str(int32_t b);
int64_t with_parse_i64(with_str s);
double with_parse_float(with_str s);
void with_assert(int32_t cond, with_str msg);
void with_panic(with_str msg, with_str file, int32_t line);

// I/O
void with_print_str(with_str s);
void with_println_str(with_str s);
void with_println_i32(int32_t n);
void with_println_i64(int64_t n);
void with_println_bool(int32_t b);
void with_write(with_str s);
void with_eprint(with_str s);
void with_ewrite(with_str s);
void with_eprintln(with_str s);
with_str with_read_line_stdin(void);
with_str with_read_bytes_stdin(int32_t count);
void with_write_stdout(with_str s);
void with_flush_stdout(void);
void with_lines_out(void *out, with_str s);

// Formatting
with_str with_fmt_i32(int32_t n);
with_str with_fmt_i64(int64_t n);
with_str with_fmt_u32(uint32_t n);
with_str with_fmt_u64(uint64_t n);
with_str with_fmt_bool(int32_t b);
with_str with_fmt_f64(double n);
with_str with_fmt_str(with_str s);
with_str with_fmt_str_debug(with_str s);
with_str with_fmt_int_spec(int64_t val, int32_t is_unsigned, int64_t flags, int32_t width, int32_t precision, int32_t mode);
with_str with_fmt_f64_spec(double val, int64_t flags, int32_t width, int32_t precision, int32_t mode);
with_str with_fmt_str_spec(with_str val, int64_t flags, int32_t width, int32_t precision);
uint8_t *with_fmt_buf_new(void);
void with_fmt_buf_write_str(uint8_t *fb, with_str s);
void with_fmt_buf_write_i64_spec(uint8_t *fb, int64_t val, int32_t is_unsigned, int64_t flags, int32_t width, int32_t precision, int32_t mode);
void with_fmt_buf_write_f64_spec(uint8_t *fb, double val, int64_t flags, int32_t width, int32_t precision, int32_t mode);
void with_fmt_buf_write_str_spec(uint8_t *fb, with_str val, int64_t flags, int32_t width, int32_t precision);
with_str with_fmt_buf_finish(uint8_t *fb);

// Vec — matches emitted C internal types (uint8_t*)
int64_t with_vec_new_out(uint8_t *out, int64_t elem_size);
int64_t with_vec_new(int64_t elem_size);
int64_t with_vec_push(uint8_t *v, uint8_t *elem);
uint8_t *with_vec_get_ptr(uint8_t *v, int64_t index);
int64_t with_vec_len(uint8_t *v);
int64_t with_vec_clear(uint8_t *v);
int64_t with_vec_push_i32(uint8_t *v, int32_t val);
int32_t with_vec_get_i32(uint8_t *v, int64_t index);
int64_t with_vec_push_i64(uint8_t *v, int64_t val);
int64_t with_vec_get_i64(uint8_t *v, int64_t index);
int64_t with_vec_push_str(uint8_t *v, with_str val);
with_str with_vec_get_str(uint8_t *v, int64_t index);
int64_t with_vec_push_bool(uint8_t *v, int32_t val);
int32_t with_vec_get_bool(uint8_t *v, int64_t index);
void with_vec_set_i32(uint8_t *v, int64_t index, int32_t val);
void with_vec_set_i64(uint8_t *v, int64_t index, int64_t val);
void with_vec_remove(uint8_t *v, int64_t index);
with_str with_vec_str_join(uint8_t *v, with_str sep);
with_option_i32 with_vec_pop_i32(uint8_t *v);

// HashMap — opaque handles, use void*
void *with_hashmap_new(int64_t key_size, int64_t val_size);
void with_hashmap_insert(void *handle, const void *key, const void *val, int64_t is_str_key);
int64_t with_hashmap_get(void *handle, const void *key, void *out_val, int64_t is_str_key);
int64_t with_hashmap_contains(void *handle, const void *key, int64_t is_str_key);
int64_t with_hashmap_remove(void *handle, const void *key, void *out_val, int64_t is_str_key);
int64_t with_hashmap_len(void *handle);
void with_hashmap_clear(void *handle);
int64_t with_hashmap_increment(void *handle, const void *key, int64_t delta);

// Memory — matches emitted C types (uint8_t* return, uint8_t* params)
uint8_t *with_alloc(int64_t size);
uint8_t *with_alloc_zeroed(int64_t count, int64_t size);
uint8_t *with_realloc(uint8_t *ptr, int64_t old_size, int64_t new_size);
void with_free(uint8_t *ptr);
void with_free_sized(uint8_t *ptr, int64_t size);
uint8_t *with_memcpy(uint8_t *dst, uint8_t *src, int64_t n);
uint8_t *with_memmove(uint8_t *dst, uint8_t *src, int64_t n);
uint8_t *with_memset(uint8_t *ptr, int32_t c, int64_t n);
int32_t with_memcmp(uint8_t *a, uint8_t *b, int64_t n);

// File I/O
with_str with_fs_read_file(with_str path);
int32_t with_fs_file_exists(with_str path);
int32_t with_fs_write_file(with_str path, with_str data);
int32_t with_fs_mkdir_p(with_str path);
int32_t with_fs_mkdir(with_str path);
int32_t with_fs_is_dir(with_str path);
int32_t with_fs_remove_file(with_str path);
int32_t with_fs_chmod(with_str path, int32_t mode);
int32_t with_fs_rename_file(with_str old_path, with_str new_path);
int32_t with_fs_create_dir(with_str path);
int32_t with_fs_remove_dir(with_str path);
int32_t with_fs_remove_tree(with_str path);
int32_t with_fs_copy_tree(with_str src, with_str dst);
int32_t with_fs_symlink(with_str target, with_str link_path);
with_str with_fs_list_files(with_str path);

// Process / Env
int32_t with_arg_count(void);
with_str with_arg_at(int32_t idx);
void with_runtime_set_argv(int32_t argc, uint8_t **argv);
void with_install_interrupt_handlers(void);
int32_t with_interrupt_requested(void);
int32_t with_getpid(void);
int32_t with_process_alive(int32_t pid);
with_str with_getenv_str(with_str name);
int32_t with_setenv_str(with_str name, with_str value);
void with_fill_random(uint8_t *buf, int64_t len);
int32_t with_raise(int32_t sig);

// Exec
int32_t with_exec_argv(with_str args);
int32_t with_exec_argv_cwd(with_str args, with_str cwd);
int32_t with_exec_argv_capture(with_str args, with_str stdout_path, with_str stderr_path, int32_t timeout_ms);
int32_t with_exec_argv_capture_cwd(with_str args, with_str stdout_path, with_str stderr_path, int32_t timeout_ms, with_str cwd);
int32_t with_exec_argv_capture_input(with_str args, with_str stdout_path, with_str stderr_path, int32_t timeout_ms, with_str stdin_path);
int32_t with_exec_argv_capture_spawn(with_str args, with_str stdout_path, with_str stderr_path);
int32_t with_exec_wait(int32_t pid, int32_t timeout_ms);

// Thread / Fiber
int64_t with_thread_spawn(uint8_t *fn_ptr, uint8_t *ctx);
int32_t with_thread_join(int64_t handle);
void with_fiber_await(int32_t fiber_id);
int32_t with_fiber_in_fiber(void);
void with_fiber_panic_capture(uint8_t *buf, int32_t size);
int32_t with_runtime_has_fibers(void);
void with_runtime_core_init(void);
void with_runtime_core_shutdown(void);
int32_t with_runtime_core_has_fibers(void);
void with_runtime_core_run_one_step(void);

// Channel
int64_t with_channel_create(int32_t capacity, int32_t elem_size);
void with_channel_send(int64_t ch_handle, void *value_ptr);
int32_t with_channel_recv(int64_t ch_handle, void *out_ptr);
void with_channel_close(int64_t ch_handle);
void with_channel_destroy(int64_t ch_handle);

// Time
int64_t with_clock_nanos(void);
int64_t with_time_now(void);
int32_t with_nanosleep(int64_t ns);
int32_t with_usleep(int32_t usecs);

// Sysinfo
int32_t with_sysinfo(void *out);
with_str with_sysinfo_os(void);
with_str with_sysinfo_arch(void);
with_str with_sysinfo_hostname(void);

// Regex
with_str with_regex_error_message(int32_t code);
const uint8_t *with_regex_compile(with_str pattern, int32_t options, int32_t *err_code, int32_t *err_offset);
const uint8_t *with_regex_code_copy(const uint8_t *code);
void with_regex_code_free(const uint8_t *code);
int32_t with_regex_capture_count(const uint8_t *code);
const int32_t *with_regex_match_spans_alloc(const uint8_t *code, with_str text, int32_t *out_count);
const int32_t *with_regex_match_spans_alloc_at(const uint8_t *code, with_str text, int32_t start_offset, int32_t *out_count);
int32_t with_regex_capture_name_count(const uint8_t *code);
with_str with_regex_capture_name_at(const uint8_t *code, int32_t index);
int32_t with_regex_group_name_to_index(const uint8_t *code, with_str name);
with_str with_regex_substitute(const uint8_t *code, with_str text, with_str repl, int32_t replace_all);

// CImport
int32_t with_cimport_parse(with_str path, with_str flags);
void with_cimport_dispose(int32_t session);

// Math
int32_t with_clz(int32_t x);
int32_t with_ctz(int32_t x);
int32_t with_popcount(int32_t x);
int32_t with_clzl(int64_t x);
int32_t with_ctzl(int64_t x);
uint16_t with_bswap16(uint16_t x);
uint32_t with_bswap32(uint32_t x);
uint64_t with_bswap64(uint64_t x);

// Codegen loops
void with_codegen_loop_set_break(int32_t idx, int64_t bb);
void with_codegen_loop_set_continue(int32_t idx, int64_t bb);
void with_codegen_loop_set_result(int32_t idx, int64_t value);
int64_t with_codegen_loop_get_break(int32_t idx);
int64_t with_codegen_loop_get_continue(int32_t idx);
int64_t with_codegen_loop_get_result(int32_t idx);

// Misc
void with_runtime_init(void);
void with_runtime_shutdown(void);

#endif
