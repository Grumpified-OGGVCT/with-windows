#ifndef WITH_FILTERED_H
#define WITH_FILTERED_H
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>
typedef struct { const uint8_t *ptr; int64_t len; } with_str;
typedef struct { void *ptr; int64_t len; int64_t cap; int64_t elem_size; } with_vec;
typedef struct { bool has_value; int32_t value; } with_option_i32;
typedef struct { bool has_value; int64_t value; } with_option_i64;
typedef struct { bool has_value; with_str value; } with_option_str;
typedef struct Captures Captures;
#define WITH_STR_LIT(s) ((with_str){(const uint8_t*)(s), (int64_t)(sizeof(s) - 1)})
#define with_len(v) ((v).len)
#define with_is_empty(v) (((v).len == 0) ? 1 : 0)
int32_t with_exec_argv_capture_cwd(with_str _1, with_str _2, with_str _3, int32_t _4, with_str _5);
void with_install_interrupt_handlers();
void with_runtime_shutdown();
int8_t* with_regex_compile(with_str _1, int32_t _2, int32_t* _3, int32_t* _4);
with_str with_regex_substitute(uint8_t* code, with_str text, with_str repl, int32_t replace_all);
with_str with_regex_capture_name_at(uint8_t* code, int32_t index);
int32_t with_exec_argv_cwd(with_str _1, with_str _2);
int32_t with_regex_capture_name_count(int8_t* _1);
int32_t with_exec_argv_capture_input(with_str _1, with_str _2, with_str _3, int32_t _4, with_str _5);
int8_t* with_regex_code_copy(int8_t* _1);
int32_t with_setenv_str(with_str _1, with_str _2);
int32_t* with_regex_match_spans_alloc_at(int8_t* _1, with_str _2, int32_t _3, int32_t* _4);
with_str with_regex_error_message(int32_t code);
int32_t with_exec_argv(with_str _1);
int32_t with_exec_argv_capture_spawn(with_str _1, with_str _2, with_str _3);
void with_regex_code_free(int8_t* _1);
int32_t with_exec_argv_capture(with_str _1, with_str _2, with_str _3, int32_t _4);
void with_runtime_init();
int32_t with_exec_binary(with_str _1);
int32_t with_regex_capture_count(int8_t* _1);
int32_t with_interrupt_requested();
void with_raise_stack_limit();
int32_t with_exec_wait(int32_t _1, int32_t _2);
int32_t with_regex_group_name_to_index(int8_t* _1, with_str _2);
#endif
