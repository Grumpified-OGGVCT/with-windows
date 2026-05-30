; ModuleID = 'with_module'
source_filename = "with_module"
target datalayout = "e-m:w-p270:32:32-p271:32:32-p272:64:64-i64:64-i128:128-f80:128-n8:16:32:64-S128"
target triple = "x86_64-pc-windows-msvc"

%str = type { ptr, i64 }
%__with.Vec.str = type { ptr, i64, i64, i64 }
%RegexFlags = type { i32, i32 }
%RegexError = type { i32, i32, %str }
%Regex = type { ptr, %str, %str, i32, i32, i32, i32, ptr, ptr, ptr }
%__with.Vec.str.0 = type { ptr, i64, i64, i64 }
%Captures = type { ptr, %str, %__with.Vec.i32 }
%__with.Vec.i32 = type { ptr, i64, i64, i64 }
%__with.Vec.i32.1 = type { ptr, i64, i64, i64 }
%Match = type { %str, i32, i32 }
%__with.Vec.Match = type { ptr, i64, i64, i64 }
%__with.Vec.Match.2 = type { ptr, i64, i64, i64 }
%__with.Vec.Captures = type { ptr, i64, i64, i64 }
%__with.Vec.Captures.3 = type { ptr, i64, i64, i64 }

@__vtable_Vec_Clone = internal constant { ptr } zeroinitializer
@__vtable_VecIter_Iter = internal constant { ptr } zeroinitializer
@__vtable_i32_ToString = internal constant { ptr } { ptr @__dynwrap_i32_to_string }
@__vtable_i64_ToString = internal constant { ptr } { ptr @__dynwrap_i64_to_string }
@__vtable_u32_ToString = internal constant { ptr } { ptr @__dynwrap_u32_to_string }
@__vtable_u64_ToString = internal constant { ptr } { ptr @__dynwrap_u64_to_string }
@__vtable_bool_ToString = internal constant { ptr } { ptr @__dynwrap_bool_to_string }
@__vtable_Vec_IntoIter = internal constant { ptr } zeroinitializer
@__vtable_i32_Eq = internal constant { ptr } { ptr @__dynwrap_i32_eq }
@__vtable_bool_Eq = internal constant { ptr } { ptr @__dynwrap_bool_eq }
@__vtable_i32_Default = internal constant { ptr } { ptr @i32.default }
@__vtable_bool_Default = internal constant { ptr } { ptr @bool.default }
@__vtable_str_Eq = internal constant { ptr } { ptr @__dynwrap_str_eq }
@__vtable_i64_Eq = internal constant { ptr } { ptr @__dynwrap_i64_eq }
@__vtable_i32_Debug = internal constant { ptr } { ptr @__dynwrap_i32_debug_str }
@__vtable_bool_Debug = internal constant { ptr } { ptr @__dynwrap_bool_debug_str }
@__vtable_str_Debug = internal constant { ptr } { ptr @__dynwrap_str_debug_str }
@__vtable_i32_Hash = internal constant { ptr } { ptr @__dynwrap_i32_hash_value }
@__vtable_i64_Hash = internal constant { ptr } { ptr @__dynwrap_i64_hash_value }
@__vtable_bool_Hash = internal constant { ptr } { ptr @__dynwrap_bool_hash_value }
@__vtable_str_Hash = internal constant { ptr } { ptr @__dynwrap_str_hash_value }
@PI = internal constant double 0x400921FB54442D18
@E = internal constant double 0x4005BF0A8B145769
@TAU = internal constant double 0x401921FB54442D17
@REGEX_FLAG_GLOBAL = internal constant i32 1
@0 = private unnamed_addr constant [19 x i8] c"unknown regex flag\00", align 1
@1 = private unnamed_addr constant [40 x i8] c"Regex.clone(): pcre2_code_copy_8 failed\00", align 1
@2 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@3 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@4 = private unnamed_addr constant [24 x i8] c"invalid regex literal: \00", align 1
@5 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@6 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@7 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@8 = private unnamed_addr constant [2 x i8] c"$\00", align 1
@9 = private unnamed_addr constant [2 x i8] c"$\00", align 1
@10 = private unnamed_addr constant [2 x i8] c"$\00", align 1
@11 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@12 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@13 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@14 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@15 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@16 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@17 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@18 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@19 = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@20 = private unnamed_addr constant [5 x i8] c"true\00", align 1
@21 = private unnamed_addr constant [6 x i8] c"false\00", align 1
@22 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@23 = private unnamed_addr constant [2 x i8] c"\22\00", align 1
@24 = private unnamed_addr constant [6 x i8] c"hello\00", align 1

define internal void @fence(i32 %0) !dbg !4 {
entry:
  %1 = alloca i32, align 4, !dbg !7
  %2 = alloca i32, align 4, !dbg !7
  store i32 %0, ptr %1, align 4, !dbg !7
  br label %mir.bb0, !dbg !7

mir.bb0:                                          ; preds = %entry
  store i32 0, ptr %2, align 4, !dbg !7
  ret void, !dbg !7
}

declare void @with_lines_out(ptr, %str)

declare i64 @with_parse_i64(%str)

declare i64 @with_str_len(%str)

declare i32 @with_str_eq(%str, %str)

define internal i64 @string_len(%str %0) !dbg !8 {
entry:
  %1 = alloca i64, align 8, !dbg !9
  %2 = alloca %str, align 8, !dbg !9
  %3 = alloca i64, align 8, !dbg !9
  store %str %0, ptr %2, align 8, !dbg !9
  br label %mir.bb0, !dbg !9

mir.bb0:                                          ; preds = %entry
  %4 = load %str, ptr %2, align 8, !dbg !9
  %5 = call i64 @with_str_len(%str %4), !dbg !9
  store i64 %5, ptr %1, align 8, !dbg !9
  br label %mir.bb1, !dbg !9

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load i64, ptr %1, align 8, !dbg !10
  store i64 %6, ptr %3, align 8, !dbg !10
  %7 = load i64, ptr %3, align 8, !dbg !10
  ret i64 %7, !dbg !10
}

define internal i64 @view_len(ptr %0) !dbg !12 {
entry:
  %1 = alloca ptr, align 8, !dbg !13
  %2 = alloca i64, align 8, !dbg !13
  store ptr %0, ptr %1, align 8, !dbg !13
  br label %mir.bb0, !dbg !13

mir.bb0:                                          ; preds = %entry
  %3 = load ptr, ptr %1, align 8, !dbg !13
  %4 = getelementptr inbounds nuw %str, ptr %3, i32 0, i32 1, !dbg !13
  %5 = load i64, ptr %4, align 8, !dbg !13
  store i64 %5, ptr %2, align 8, !dbg !13
  %6 = load i64, ptr %2, align 8, !dbg !13
  ret i64 %6, !dbg !13
}

define internal i1 @view_is_empty(ptr %0) !dbg !14 {
entry:
  %1 = alloca i1, align 1, !dbg !15
  %2 = alloca ptr, align 8, !dbg !15
  %3 = alloca i1, align 1, !dbg !15
  store ptr %0, ptr %2, align 8, !dbg !15
  br label %mir.bb0, !dbg !15

mir.bb0:                                          ; preds = %entry
  %4 = load ptr, ptr %2, align 8, !dbg !15
  %5 = getelementptr inbounds nuw %str, ptr %4, i32 0, i32 1, !dbg !15
  %6 = load i64, ptr %5, align 8, !dbg !15
  %7 = icmp eq i64 %6, 0, !dbg !15
  store i1 %7, ptr %1, align 1, !dbg !15
  %8 = load i1, ptr %1, align 1, !dbg !15
  store i1 %8, ptr %3, align 1, !dbg !15
  %9 = load i1, ptr %3, align 1, !dbg !15
  ret i1 %9, !dbg !15
}

define internal i1 @view_eq(ptr %0, ptr %1) !dbg !16 {
entry:
  %2 = alloca i1, align 1, !dbg !17
  %3 = alloca ptr, align 8, !dbg !17
  %4 = alloca ptr, align 8, !dbg !17
  %5 = alloca i1, align 1, !dbg !17
  store ptr %0, ptr %4, align 8, !dbg !17
  store ptr %1, ptr %3, align 8, !dbg !17
  br label %mir.bb0, !dbg !17

mir.bb0:                                          ; preds = %entry
  %6 = load ptr, ptr %4, align 8, !dbg !17
  %7 = load ptr, ptr %3, align 8, !dbg !17
  %8 = icmp eq ptr %6, %7, !dbg !17
  store i1 %8, ptr %2, align 1, !dbg !17
  %9 = load i1, ptr %2, align 1, !dbg !17
  store i1 %9, ptr %5, align 1, !dbg !17
  %10 = load i1, ptr %5, align 1, !dbg !17
  ret i1 %10, !dbg !17
}

define internal i1 @string_eq(%str %0, %str %1) !dbg !18 {
entry:
  %2 = alloca i1, align 1, !dbg !19
  %3 = alloca i32, align 4, !dbg !19
  %4 = alloca %str, align 8, !dbg !19
  %5 = alloca %str, align 8, !dbg !19
  %6 = alloca i1, align 1, !dbg !19
  store %str %0, ptr %5, align 8, !dbg !19
  store %str %1, ptr %4, align 8, !dbg !19
  br label %mir.bb0, !dbg !19

mir.bb0:                                          ; preds = %entry
  %7 = load %str, ptr %5, align 8, !dbg !19
  %8 = load %str, ptr %4, align 8, !dbg !19
  %9 = call i32 @with_str_eq(%str %7, %str %8), !dbg !19
  store i32 %9, ptr %3, align 4, !dbg !19
  br label %mir.bb1, !dbg !19

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load i32, ptr %3, align 4, !dbg !20
  %11 = icmp ne i32 %10, 0, !dbg !20
  store i1 %11, ptr %2, align 1, !dbg !20
  %12 = load i1, ptr %2, align 1, !dbg !20
  store i1 %12, ptr %6, align 1, !dbg !20
  %13 = load i1, ptr %6, align 1, !dbg !20
  ret i1 %13, !dbg !20
}

define internal i32 @string_cmp(%str %0, %str %1) !dbg !22 {
entry:
  %2 = alloca i1, align 1, !dbg !23
  %3 = alloca i64, align 8, !dbg !23
  %4 = alloca i32, align 4, !dbg !23
  %5 = alloca i1, align 1, !dbg !23
  %6 = alloca i32, align 4, !dbg !23
  %7 = alloca i32, align 4, !dbg !23
  %8 = alloca i32, align 4, !dbg !23
  %9 = alloca i1, align 1, !dbg !23
  %10 = alloca i32, align 4, !dbg !23
  %11 = alloca i1, align 1, !dbg !23
  %12 = alloca i64, align 8, !dbg !23
  %13 = alloca i64, align 8, !dbg !23
  %14 = alloca i64, align 8, !dbg !23
  %15 = alloca i1, align 1, !dbg !23
  %16 = alloca i64, align 8, !dbg !23
  %17 = alloca i64, align 8, !dbg !23
  %18 = alloca i64, align 8, !dbg !23
  %19 = alloca i64, align 8, !dbg !23
  %20 = alloca %str, align 8, !dbg !23
  %21 = alloca %str, align 8, !dbg !23
  %22 = alloca i32, align 4, !dbg !23
  store %str %0, ptr %21, align 8, !dbg !23
  store %str %1, ptr %20, align 8, !dbg !23
  br label %mir.bb0, !dbg !23

mir.bb0:                                          ; preds = %entry
  %23 = load %str, ptr %21, align 8, !dbg !23
  %24 = extractvalue %str %23, 1, !dbg !23
  store i64 %24, ptr %19, align 8, !dbg !23
  br label %mir.bb1, !dbg !23

mir.bb1:                                          ; preds = %mir.bb0
  %25 = load i64, ptr %19, align 8, !dbg !24
  store i64 %25, ptr %18, align 8, !dbg !24
  %26 = load %str, ptr %20, align 8, !dbg !24
  %27 = extractvalue %str %26, 1, !dbg !24
  store i64 %27, ptr %17, align 8, !dbg !24
  br label %mir.bb2, !dbg !24

mir.bb2:                                          ; preds = %mir.bb1
  %28 = load i64, ptr %17, align 8, !dbg !26
  store i64 %28, ptr %16, align 8, !dbg !26
  %29 = load i64, ptr %18, align 8, !dbg !26
  %30 = load i64, ptr %16, align 8, !dbg !26
  %31 = icmp slt i64 %29, %30, !dbg !26
  store i1 %31, ptr %15, align 1, !dbg !26
  %32 = load i1, ptr %15, align 1, !dbg !26
  br i1 %32, label %mir.bb3, label %mir.bb4, !dbg !26

mir.bb3:                                          ; preds = %mir.bb2
  %33 = load i64, ptr %18, align 8, !dbg !28
  store i64 %33, ptr %14, align 8, !dbg !28
  br label %mir.bb5, !dbg !28

mir.bb4:                                          ; preds = %mir.bb2
  %34 = load i64, ptr %16, align 8, !dbg !30
  store i64 %34, ptr %14, align 8, !dbg !30
  br label %mir.bb5, !dbg !30

mir.bb5:                                          ; preds = %mir.bb4, %mir.bb3
  %35 = load i64, ptr %14, align 8, !dbg !32
  store i64 %35, ptr %13, align 8, !dbg !32
  store i64 0, ptr %12, align 8, !dbg !32
  br label %mir.bb6, !dbg !32

mir.bb6:                                          ; preds = %mir.bb13, %mir.bb5
  %36 = load i64, ptr %12, align 8, !dbg !34
  %37 = load i64, ptr %13, align 8, !dbg !34
  %38 = icmp slt i64 %36, %37, !dbg !34
  store i1 %38, ptr %11, align 1, !dbg !34
  %39 = load i1, ptr %11, align 1, !dbg !34
  br i1 %39, label %mir.bb7, label %mir.bb8, !dbg !34

mir.bb7:                                          ; preds = %mir.bb6
  %40 = load %str, ptr %21, align 8, !dbg !36
  %41 = load i64, ptr %12, align 8, !dbg !36
  %42 = call i32 @with_str_byte_at(%str %40, i64 %41), !dbg !36
  store i32 %42, ptr %10, align 4, !dbg !36
  br label %mir.bb9, !dbg !36

mir.bb8:                                          ; preds = %mir.bb6
  %43 = load i64, ptr %18, align 8, !dbg !38
  %44 = load i64, ptr %16, align 8, !dbg !38
  %45 = icmp slt i64 %43, %44, !dbg !38
  store i1 %45, ptr %9, align 1, !dbg !38
  %46 = load i1, ptr %9, align 1, !dbg !38
  br i1 %46, label %mir.bb15, label %mir.bb16, !dbg !38

mir.bb9:                                          ; preds = %mir.bb7
  %47 = load i32, ptr %10, align 4, !dbg !40
  store i32 %47, ptr %8, align 4, !dbg !40
  %48 = load %str, ptr %20, align 8, !dbg !40
  %49 = load i64, ptr %12, align 8, !dbg !40
  %50 = call i32 @with_str_byte_at(%str %48, i64 %49), !dbg !40
  store i32 %50, ptr %7, align 4, !dbg !40
  br label %mir.bb10, !dbg !40

mir.bb10:                                         ; preds = %mir.bb9
  %51 = load i32, ptr %7, align 4, !dbg !42
  store i32 %51, ptr %6, align 4, !dbg !42
  %52 = load i32, ptr %8, align 4, !dbg !42
  %53 = load i32, ptr %6, align 4, !dbg !42
  %54 = icmp ne i32 %52, %53, !dbg !42
  store i1 %54, ptr %5, align 1, !dbg !42
  %55 = load i1, ptr %5, align 1, !dbg !42
  br i1 %55, label %mir.bb11, label %mir.bb12, !dbg !42

mir.bb11:                                         ; preds = %mir.bb10
  %56 = load i32, ptr %8, align 4, !dbg !44
  %57 = load i32, ptr %6, align 4, !dbg !44
  %58 = sub nsw i32 %56, %57, !dbg !44
  store i32 %58, ptr %4, align 4, !dbg !44
  %59 = load i32, ptr %4, align 4, !dbg !44
  store i32 %59, ptr %22, align 4, !dbg !44
  %60 = load i32, ptr %22, align 4, !dbg !44
  ret i32 %60, !dbg !44

mir.bb12:                                         ; preds = %mir.bb10
  br label %mir.bb13, !dbg !44

mir.bb13:                                         ; preds = %mir.bb14, %mir.bb12
  %61 = load i64, ptr %12, align 8, !dbg !46
  %62 = add nsw i64 %61, 1, !dbg !46
  store i64 %62, ptr %3, align 8, !dbg !46
  %63 = load i64, ptr %3, align 8, !dbg !46
  store i64 %63, ptr %12, align 8, !dbg !46
  br label %mir.bb6, !dbg !46

mir.bb14:                                         ; No predecessors!
  br label %mir.bb13, !dbg !46

mir.bb15:                                         ; preds = %mir.bb8
  store i32 -1, ptr %22, align 4, !dbg !48
  %64 = load i32, ptr %22, align 4, !dbg !48
  ret i32 %64, !dbg !48

mir.bb16:                                         ; preds = %mir.bb8
  br label %mir.bb17, !dbg !48

mir.bb17:                                         ; preds = %mir.bb18, %mir.bb16
  %65 = load i64, ptr %18, align 8, !dbg !50
  %66 = load i64, ptr %16, align 8, !dbg !50
  %67 = icmp sgt i64 %65, %66, !dbg !50
  store i1 %67, ptr %2, align 1, !dbg !50
  %68 = load i1, ptr %2, align 1, !dbg !50
  br i1 %68, label %mir.bb19, label %mir.bb20, !dbg !50

mir.bb18:                                         ; No predecessors!
  br label %mir.bb17, !dbg !50

mir.bb19:                                         ; preds = %mir.bb17
  store i32 1, ptr %22, align 4, !dbg !52
  %69 = load i32, ptr %22, align 4, !dbg !52
  ret i32 %69, !dbg !52

mir.bb20:                                         ; preds = %mir.bb17
  br label %mir.bb21, !dbg !52

mir.bb21:                                         ; preds = %mir.bb22, %mir.bb20
  store i32 0, ptr %22, align 4, !dbg !54
  %70 = load i32, ptr %22, align 4, !dbg !54
  ret i32 %70, !dbg !54

mir.bb22:                                         ; No predecessors!
  br label %mir.bb21, !dbg !54

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !54
}

define internal i1 @is_alpha(i32 %0) !dbg !56 {
entry:
  %1 = alloca i1, align 1, !dbg !57
  %2 = alloca i1, align 1, !dbg !57
  %3 = alloca i1, align 1, !dbg !57
  %4 = alloca i1, align 1, !dbg !57
  %5 = alloca i1, align 1, !dbg !57
  %6 = alloca i1, align 1, !dbg !57
  %7 = alloca i1, align 1, !dbg !57
  %8 = alloca i32, align 4, !dbg !57
  %9 = alloca i1, align 1, !dbg !57
  store i32 %0, ptr %8, align 4, !dbg !57
  br label %mir.bb0, !dbg !57

mir.bb0:                                          ; preds = %entry
  %10 = load i32, ptr %8, align 4, !dbg !57
  %11 = icmp sge i32 %10, 65, !dbg !57
  store i1 %11, ptr %7, align 1, !dbg !57
  %12 = load i1, ptr %7, align 1, !dbg !57
  store i1 %12, ptr %6, align 1, !dbg !57
  %13 = load i1, ptr %6, align 1, !dbg !57
  br i1 %13, label %mir.bb1, label %mir.bb2, !dbg !57

mir.bb1:                                          ; preds = %mir.bb0
  %14 = load i32, ptr %8, align 4, !dbg !58
  %15 = icmp sle i32 %14, 90, !dbg !58
  store i1 %15, ptr %5, align 1, !dbg !58
  %16 = load i1, ptr %5, align 1, !dbg !58
  store i1 %16, ptr %6, align 1, !dbg !58
  br label %mir.bb2, !dbg !58

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %17 = load i1, ptr %6, align 1, !dbg !60
  store i1 %17, ptr %4, align 1, !dbg !60
  %18 = load i1, ptr %4, align 1, !dbg !60
  br i1 %18, label %mir.bb4, label %mir.bb3, !dbg !60

mir.bb3:                                          ; preds = %mir.bb2
  %19 = load i32, ptr %8, align 4, !dbg !62
  %20 = icmp sge i32 %19, 97, !dbg !62
  store i1 %20, ptr %3, align 1, !dbg !62
  %21 = load i1, ptr %3, align 1, !dbg !62
  store i1 %21, ptr %2, align 1, !dbg !62
  %22 = load i1, ptr %2, align 1, !dbg !62
  br i1 %22, label %mir.bb5, label %mir.bb6, !dbg !62

mir.bb4:                                          ; preds = %mir.bb6, %mir.bb2
  %23 = load i1, ptr %4, align 1, !dbg !64
  store i1 %23, ptr %9, align 1, !dbg !64
  %24 = load i1, ptr %9, align 1, !dbg !64
  ret i1 %24, !dbg !64

mir.bb5:                                          ; preds = %mir.bb3
  %25 = load i32, ptr %8, align 4, !dbg !66
  %26 = icmp sle i32 %25, 122, !dbg !66
  store i1 %26, ptr %1, align 1, !dbg !66
  %27 = load i1, ptr %1, align 1, !dbg !66
  store i1 %27, ptr %2, align 1, !dbg !66
  br label %mir.bb6, !dbg !66

mir.bb6:                                          ; preds = %mir.bb5, %mir.bb3
  %28 = load i1, ptr %2, align 1, !dbg !68
  store i1 %28, ptr %4, align 1, !dbg !68
  br label %mir.bb4, !dbg !68

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !68
}

define internal i1 @is_digit(i32 %0) !dbg !70 {
entry:
  %1 = alloca i1, align 1, !dbg !71
  %2 = alloca i1, align 1, !dbg !71
  %3 = alloca i1, align 1, !dbg !71
  %4 = alloca i32, align 4, !dbg !71
  %5 = alloca i1, align 1, !dbg !71
  store i32 %0, ptr %4, align 4, !dbg !71
  br label %mir.bb0, !dbg !71

mir.bb0:                                          ; preds = %entry
  %6 = load i32, ptr %4, align 4, !dbg !71
  %7 = icmp sge i32 %6, 48, !dbg !71
  store i1 %7, ptr %3, align 1, !dbg !71
  %8 = load i1, ptr %3, align 1, !dbg !71
  store i1 %8, ptr %2, align 1, !dbg !71
  %9 = load i1, ptr %2, align 1, !dbg !71
  br i1 %9, label %mir.bb1, label %mir.bb2, !dbg !71

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load i32, ptr %4, align 4, !dbg !72
  %11 = icmp sle i32 %10, 57, !dbg !72
  store i1 %11, ptr %1, align 1, !dbg !72
  %12 = load i1, ptr %1, align 1, !dbg !72
  store i1 %12, ptr %2, align 1, !dbg !72
  br label %mir.bb2, !dbg !72

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %13 = load i1, ptr %2, align 1, !dbg !74
  store i1 %13, ptr %5, align 1, !dbg !74
  %14 = load i1, ptr %5, align 1, !dbg !74
  ret i1 %14, !dbg !74

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !74
}

define internal i1 @is_space(i32 %0) !dbg !76 {
entry:
  %1 = alloca i1, align 1, !dbg !77
  %2 = alloca i1, align 1, !dbg !77
  %3 = alloca i1, align 1, !dbg !77
  %4 = alloca i1, align 1, !dbg !77
  %5 = alloca i1, align 1, !dbg !77
  %6 = alloca i1, align 1, !dbg !77
  %7 = alloca i1, align 1, !dbg !77
  %8 = alloca i1, align 1, !dbg !77
  %9 = alloca i1, align 1, !dbg !77
  %10 = alloca i1, align 1, !dbg !77
  %11 = alloca i1, align 1, !dbg !77
  %12 = alloca i32, align 4, !dbg !77
  %13 = alloca i1, align 1, !dbg !77
  store i32 %0, ptr %12, align 4, !dbg !77
  br label %mir.bb0, !dbg !77

mir.bb0:                                          ; preds = %entry
  %14 = load i32, ptr %12, align 4, !dbg !77
  %15 = icmp eq i32 %14, 32, !dbg !77
  store i1 %15, ptr %11, align 1, !dbg !77
  %16 = load i1, ptr %11, align 1, !dbg !77
  store i1 %16, ptr %10, align 1, !dbg !77
  %17 = load i1, ptr %10, align 1, !dbg !77
  br i1 %17, label %mir.bb2, label %mir.bb1, !dbg !77

mir.bb1:                                          ; preds = %mir.bb0
  %18 = load i32, ptr %12, align 4, !dbg !78
  %19 = icmp eq i32 %18, 9, !dbg !78
  store i1 %19, ptr %9, align 1, !dbg !78
  %20 = load i1, ptr %9, align 1, !dbg !78
  store i1 %20, ptr %10, align 1, !dbg !78
  br label %mir.bb2, !dbg !78

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %21 = load i1, ptr %10, align 1, !dbg !80
  store i1 %21, ptr %8, align 1, !dbg !80
  %22 = load i1, ptr %8, align 1, !dbg !80
  br i1 %22, label %mir.bb4, label %mir.bb3, !dbg !80

mir.bb3:                                          ; preds = %mir.bb2
  %23 = load i32, ptr %12, align 4, !dbg !82
  %24 = icmp eq i32 %23, 10, !dbg !82
  store i1 %24, ptr %7, align 1, !dbg !82
  %25 = load i1, ptr %7, align 1, !dbg !82
  store i1 %25, ptr %8, align 1, !dbg !82
  br label %mir.bb4, !dbg !82

mir.bb4:                                          ; preds = %mir.bb3, %mir.bb2
  %26 = load i1, ptr %8, align 1, !dbg !84
  store i1 %26, ptr %6, align 1, !dbg !84
  %27 = load i1, ptr %6, align 1, !dbg !84
  br i1 %27, label %mir.bb6, label %mir.bb5, !dbg !84

mir.bb5:                                          ; preds = %mir.bb4
  %28 = load i32, ptr %12, align 4, !dbg !86
  %29 = icmp eq i32 %28, 13, !dbg !86
  store i1 %29, ptr %5, align 1, !dbg !86
  %30 = load i1, ptr %5, align 1, !dbg !86
  store i1 %30, ptr %6, align 1, !dbg !86
  br label %mir.bb6, !dbg !86

mir.bb6:                                          ; preds = %mir.bb5, %mir.bb4
  %31 = load i1, ptr %6, align 1, !dbg !88
  store i1 %31, ptr %4, align 1, !dbg !88
  %32 = load i1, ptr %4, align 1, !dbg !88
  br i1 %32, label %mir.bb8, label %mir.bb7, !dbg !88

mir.bb7:                                          ; preds = %mir.bb6
  %33 = load i32, ptr %12, align 4, !dbg !90
  %34 = icmp eq i32 %33, 12, !dbg !90
  store i1 %34, ptr %3, align 1, !dbg !90
  %35 = load i1, ptr %3, align 1, !dbg !90
  store i1 %35, ptr %4, align 1, !dbg !90
  br label %mir.bb8, !dbg !90

mir.bb8:                                          ; preds = %mir.bb7, %mir.bb6
  %36 = load i1, ptr %4, align 1, !dbg !92
  store i1 %36, ptr %2, align 1, !dbg !92
  %37 = load i1, ptr %2, align 1, !dbg !92
  br i1 %37, label %mir.bb10, label %mir.bb9, !dbg !92

mir.bb9:                                          ; preds = %mir.bb8
  %38 = load i32, ptr %12, align 4, !dbg !94
  %39 = icmp eq i32 %38, 11, !dbg !94
  store i1 %39, ptr %1, align 1, !dbg !94
  %40 = load i1, ptr %1, align 1, !dbg !94
  store i1 %40, ptr %2, align 1, !dbg !94
  br label %mir.bb10, !dbg !94

mir.bb10:                                         ; preds = %mir.bb9, %mir.bb8
  %41 = load i1, ptr %2, align 1, !dbg !96
  store i1 %41, ptr %13, align 1, !dbg !96
  %42 = load i1, ptr %13, align 1, !dbg !96
  ret i1 %42, !dbg !96

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !96
}

define internal i1 @is_alnum(i32 %0) !dbg !98 {
entry:
  %1 = alloca i1, align 1, !dbg !99
  %2 = alloca i1, align 1, !dbg !99
  %3 = alloca i1, align 1, !dbg !99
  %4 = alloca i32, align 4, !dbg !99
  %5 = alloca i1, align 1, !dbg !99
  store i32 %0, ptr %4, align 4, !dbg !99
  br label %mir.bb0, !dbg !99

mir.bb0:                                          ; preds = %entry
  %6 = load i32, ptr %4, align 4, !dbg !99
  %7 = call i1 @is_alpha(i32 %6), !dbg !99
  store i1 %7, ptr %3, align 1, !dbg !99
  br label %mir.bb1, !dbg !99

mir.bb1:                                          ; preds = %mir.bb0
  %8 = load i1, ptr %3, align 1, !dbg !100
  store i1 %8, ptr %2, align 1, !dbg !100
  %9 = load i1, ptr %2, align 1, !dbg !100
  br i1 %9, label %mir.bb3, label %mir.bb2, !dbg !100

mir.bb2:                                          ; preds = %mir.bb1
  %10 = load i32, ptr %4, align 4, !dbg !100
  %11 = call i1 @is_digit(i32 %10), !dbg !100
  store i1 %11, ptr %1, align 1, !dbg !100
  br label %mir.bb4, !dbg !100

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb1
  %12 = load i1, ptr %2, align 1, !dbg !102
  store i1 %12, ptr %5, align 1, !dbg !102
  %13 = load i1, ptr %5, align 1, !dbg !102
  ret i1 %13, !dbg !102

mir.bb4:                                          ; preds = %mir.bb2
  %14 = load i1, ptr %1, align 1, !dbg !104
  store i1 %14, ptr %2, align 1, !dbg !104
  br label %mir.bb3, !dbg !104

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !104
}

define internal i1 @is_upper(i32 %0) !dbg !106 {
entry:
  %1 = alloca i1, align 1, !dbg !107
  %2 = alloca i1, align 1, !dbg !107
  %3 = alloca i1, align 1, !dbg !107
  %4 = alloca i32, align 4, !dbg !107
  %5 = alloca i1, align 1, !dbg !107
  store i32 %0, ptr %4, align 4, !dbg !107
  br label %mir.bb0, !dbg !107

mir.bb0:                                          ; preds = %entry
  %6 = load i32, ptr %4, align 4, !dbg !107
  %7 = icmp sge i32 %6, 65, !dbg !107
  store i1 %7, ptr %3, align 1, !dbg !107
  %8 = load i1, ptr %3, align 1, !dbg !107
  store i1 %8, ptr %2, align 1, !dbg !107
  %9 = load i1, ptr %2, align 1, !dbg !107
  br i1 %9, label %mir.bb1, label %mir.bb2, !dbg !107

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load i32, ptr %4, align 4, !dbg !108
  %11 = icmp sle i32 %10, 90, !dbg !108
  store i1 %11, ptr %1, align 1, !dbg !108
  %12 = load i1, ptr %1, align 1, !dbg !108
  store i1 %12, ptr %2, align 1, !dbg !108
  br label %mir.bb2, !dbg !108

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %13 = load i1, ptr %2, align 1, !dbg !110
  store i1 %13, ptr %5, align 1, !dbg !110
  %14 = load i1, ptr %5, align 1, !dbg !110
  ret i1 %14, !dbg !110

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !110
}

define internal i1 @is_lower(i32 %0) !dbg !112 {
entry:
  %1 = alloca i1, align 1, !dbg !113
  %2 = alloca i1, align 1, !dbg !113
  %3 = alloca i1, align 1, !dbg !113
  %4 = alloca i32, align 4, !dbg !113
  %5 = alloca i1, align 1, !dbg !113
  store i32 %0, ptr %4, align 4, !dbg !113
  br label %mir.bb0, !dbg !113

mir.bb0:                                          ; preds = %entry
  %6 = load i32, ptr %4, align 4, !dbg !113
  %7 = icmp sge i32 %6, 97, !dbg !113
  store i1 %7, ptr %3, align 1, !dbg !113
  %8 = load i1, ptr %3, align 1, !dbg !113
  store i1 %8, ptr %2, align 1, !dbg !113
  %9 = load i1, ptr %2, align 1, !dbg !113
  br i1 %9, label %mir.bb1, label %mir.bb2, !dbg !113

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load i32, ptr %4, align 4, !dbg !114
  %11 = icmp sle i32 %10, 122, !dbg !114
  store i1 %11, ptr %1, align 1, !dbg !114
  %12 = load i1, ptr %1, align 1, !dbg !114
  store i1 %12, ptr %2, align 1, !dbg !114
  br label %mir.bb2, !dbg !114

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %13 = load i1, ptr %2, align 1, !dbg !116
  store i1 %13, ptr %5, align 1, !dbg !116
  %14 = load i1, ptr %5, align 1, !dbg !116
  ret i1 %14, !dbg !116

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !116
}

define internal i1 @is_xdigit(i32 %0) !dbg !118 {
entry:
  %1 = alloca i1, align 1, !dbg !119
  %2 = alloca i1, align 1, !dbg !119
  %3 = alloca i1, align 1, !dbg !119
  %4 = alloca i1, align 1, !dbg !119
  %5 = alloca i1, align 1, !dbg !119
  %6 = alloca i1, align 1, !dbg !119
  %7 = alloca i1, align 1, !dbg !119
  %8 = alloca i1, align 1, !dbg !119
  %9 = alloca i1, align 1, !dbg !119
  %10 = alloca i1, align 1, !dbg !119
  %11 = alloca i1, align 1, !dbg !119
  %12 = alloca i32, align 4, !dbg !119
  %13 = alloca i1, align 1, !dbg !119
  store i32 %0, ptr %12, align 4, !dbg !119
  br label %mir.bb0, !dbg !119

mir.bb0:                                          ; preds = %entry
  %14 = load i32, ptr %12, align 4, !dbg !119
  %15 = icmp sge i32 %14, 48, !dbg !119
  store i1 %15, ptr %11, align 1, !dbg !119
  %16 = load i1, ptr %11, align 1, !dbg !119
  store i1 %16, ptr %10, align 1, !dbg !119
  %17 = load i1, ptr %10, align 1, !dbg !119
  br i1 %17, label %mir.bb1, label %mir.bb2, !dbg !119

mir.bb1:                                          ; preds = %mir.bb0
  %18 = load i32, ptr %12, align 4, !dbg !120
  %19 = icmp sle i32 %18, 57, !dbg !120
  store i1 %19, ptr %9, align 1, !dbg !120
  %20 = load i1, ptr %9, align 1, !dbg !120
  store i1 %20, ptr %10, align 1, !dbg !120
  br label %mir.bb2, !dbg !120

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %21 = load i1, ptr %10, align 1, !dbg !122
  store i1 %21, ptr %8, align 1, !dbg !122
  %22 = load i1, ptr %8, align 1, !dbg !122
  br i1 %22, label %mir.bb4, label %mir.bb3, !dbg !122

mir.bb3:                                          ; preds = %mir.bb2
  %23 = load i32, ptr %12, align 4, !dbg !124
  %24 = icmp sge i32 %23, 65, !dbg !124
  store i1 %24, ptr %7, align 1, !dbg !124
  %25 = load i1, ptr %7, align 1, !dbg !124
  store i1 %25, ptr %6, align 1, !dbg !124
  %26 = load i1, ptr %6, align 1, !dbg !124
  br i1 %26, label %mir.bb5, label %mir.bb6, !dbg !124

mir.bb4:                                          ; preds = %mir.bb6, %mir.bb2
  %27 = load i1, ptr %8, align 1, !dbg !126
  store i1 %27, ptr %5, align 1, !dbg !126
  %28 = load i1, ptr %5, align 1, !dbg !126
  br i1 %28, label %mir.bb8, label %mir.bb7, !dbg !126

mir.bb5:                                          ; preds = %mir.bb3
  %29 = load i32, ptr %12, align 4, !dbg !128
  %30 = icmp sle i32 %29, 70, !dbg !128
  store i1 %30, ptr %4, align 1, !dbg !128
  %31 = load i1, ptr %4, align 1, !dbg !128
  store i1 %31, ptr %6, align 1, !dbg !128
  br label %mir.bb6, !dbg !128

mir.bb6:                                          ; preds = %mir.bb5, %mir.bb3
  %32 = load i1, ptr %6, align 1, !dbg !130
  store i1 %32, ptr %8, align 1, !dbg !130
  br label %mir.bb4, !dbg !130

mir.bb7:                                          ; preds = %mir.bb4
  %33 = load i32, ptr %12, align 4, !dbg !132
  %34 = icmp sge i32 %33, 97, !dbg !132
  store i1 %34, ptr %3, align 1, !dbg !132
  %35 = load i1, ptr %3, align 1, !dbg !132
  store i1 %35, ptr %2, align 1, !dbg !132
  %36 = load i1, ptr %2, align 1, !dbg !132
  br i1 %36, label %mir.bb9, label %mir.bb10, !dbg !132

mir.bb8:                                          ; preds = %mir.bb10, %mir.bb4
  %37 = load i1, ptr %5, align 1, !dbg !134
  store i1 %37, ptr %13, align 1, !dbg !134
  %38 = load i1, ptr %13, align 1, !dbg !134
  ret i1 %38, !dbg !134

mir.bb9:                                          ; preds = %mir.bb7
  %39 = load i32, ptr %12, align 4, !dbg !136
  %40 = icmp sle i32 %39, 102, !dbg !136
  store i1 %40, ptr %1, align 1, !dbg !136
  %41 = load i1, ptr %1, align 1, !dbg !136
  store i1 %41, ptr %2, align 1, !dbg !136
  br label %mir.bb10, !dbg !136

mir.bb10:                                         ; preds = %mir.bb9, %mir.bb7
  %42 = load i1, ptr %2, align 1, !dbg !138
  store i1 %42, ptr %5, align 1, !dbg !138
  br label %mir.bb8, !dbg !138

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !138
}

define internal i1 @is_print(i32 %0) !dbg !140 {
entry:
  %1 = alloca i1, align 1, !dbg !141
  %2 = alloca i1, align 1, !dbg !141
  %3 = alloca i1, align 1, !dbg !141
  %4 = alloca i32, align 4, !dbg !141
  %5 = alloca i1, align 1, !dbg !141
  store i32 %0, ptr %4, align 4, !dbg !141
  br label %mir.bb0, !dbg !141

mir.bb0:                                          ; preds = %entry
  %6 = load i32, ptr %4, align 4, !dbg !141
  %7 = icmp sge i32 %6, 32, !dbg !141
  store i1 %7, ptr %3, align 1, !dbg !141
  %8 = load i1, ptr %3, align 1, !dbg !141
  store i1 %8, ptr %2, align 1, !dbg !141
  %9 = load i1, ptr %2, align 1, !dbg !141
  br i1 %9, label %mir.bb1, label %mir.bb2, !dbg !141

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load i32, ptr %4, align 4, !dbg !142
  %11 = icmp sle i32 %10, 126, !dbg !142
  store i1 %11, ptr %1, align 1, !dbg !142
  %12 = load i1, ptr %1, align 1, !dbg !142
  store i1 %12, ptr %2, align 1, !dbg !142
  br label %mir.bb2, !dbg !142

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %13 = load i1, ptr %2, align 1, !dbg !144
  store i1 %13, ptr %5, align 1, !dbg !144
  %14 = load i1, ptr %5, align 1, !dbg !144
  ret i1 %14, !dbg !144

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !144
}

define internal i32 @to_lower(i32 %0) !dbg !146 {
entry:
  %1 = alloca i32, align 4, !dbg !147
  %2 = alloca i32, align 4, !dbg !147
  %3 = alloca i1, align 1, !dbg !147
  %4 = alloca i1, align 1, !dbg !147
  %5 = alloca i1, align 1, !dbg !147
  %6 = alloca i32, align 4, !dbg !147
  %7 = alloca i32, align 4, !dbg !147
  store i32 %0, ptr %6, align 4, !dbg !147
  br label %mir.bb0, !dbg !147

mir.bb0:                                          ; preds = %entry
  %8 = load i32, ptr %6, align 4, !dbg !147
  %9 = icmp sge i32 %8, 65, !dbg !147
  store i1 %9, ptr %5, align 1, !dbg !147
  %10 = load i1, ptr %5, align 1, !dbg !147
  store i1 %10, ptr %4, align 1, !dbg !147
  %11 = load i1, ptr %4, align 1, !dbg !147
  br i1 %11, label %mir.bb1, label %mir.bb2, !dbg !147

mir.bb1:                                          ; preds = %mir.bb0
  %12 = load i32, ptr %6, align 4, !dbg !148
  %13 = icmp sle i32 %12, 90, !dbg !148
  store i1 %13, ptr %3, align 1, !dbg !148
  %14 = load i1, ptr %3, align 1, !dbg !148
  store i1 %14, ptr %4, align 1, !dbg !148
  br label %mir.bb2, !dbg !148

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %15 = load i1, ptr %4, align 1, !dbg !148
  br i1 %15, label %mir.bb3, label %mir.bb4, !dbg !148

mir.bb3:                                          ; preds = %mir.bb2
  %16 = load i32, ptr %6, align 4, !dbg !150
  %17 = add nsw i32 %16, 32, !dbg !150
  store i32 %17, ptr %2, align 4, !dbg !150
  %18 = load i32, ptr %2, align 4, !dbg !150
  store i32 %18, ptr %1, align 4, !dbg !150
  br label %mir.bb5, !dbg !150

mir.bb4:                                          ; preds = %mir.bb2
  %19 = load i32, ptr %6, align 4, !dbg !152
  store i32 %19, ptr %1, align 4, !dbg !152
  br label %mir.bb5, !dbg !152

mir.bb5:                                          ; preds = %mir.bb4, %mir.bb3
  %20 = load i32, ptr %1, align 4, !dbg !154
  store i32 %20, ptr %7, align 4, !dbg !154
  %21 = load i32, ptr %7, align 4, !dbg !154
  ret i32 %21, !dbg !154

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !154
}

define internal i32 @to_upper(i32 %0) !dbg !156 {
entry:
  %1 = alloca i32, align 4, !dbg !157
  %2 = alloca i32, align 4, !dbg !157
  %3 = alloca i1, align 1, !dbg !157
  %4 = alloca i1, align 1, !dbg !157
  %5 = alloca i1, align 1, !dbg !157
  %6 = alloca i32, align 4, !dbg !157
  %7 = alloca i32, align 4, !dbg !157
  store i32 %0, ptr %6, align 4, !dbg !157
  br label %mir.bb0, !dbg !157

mir.bb0:                                          ; preds = %entry
  %8 = load i32, ptr %6, align 4, !dbg !157
  %9 = icmp sge i32 %8, 97, !dbg !157
  store i1 %9, ptr %5, align 1, !dbg !157
  %10 = load i1, ptr %5, align 1, !dbg !157
  store i1 %10, ptr %4, align 1, !dbg !157
  %11 = load i1, ptr %4, align 1, !dbg !157
  br i1 %11, label %mir.bb1, label %mir.bb2, !dbg !157

mir.bb1:                                          ; preds = %mir.bb0
  %12 = load i32, ptr %6, align 4, !dbg !158
  %13 = icmp sle i32 %12, 122, !dbg !158
  store i1 %13, ptr %3, align 1, !dbg !158
  %14 = load i1, ptr %3, align 1, !dbg !158
  store i1 %14, ptr %4, align 1, !dbg !158
  br label %mir.bb2, !dbg !158

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %15 = load i1, ptr %4, align 1, !dbg !158
  br i1 %15, label %mir.bb3, label %mir.bb4, !dbg !158

mir.bb3:                                          ; preds = %mir.bb2
  %16 = load i32, ptr %6, align 4, !dbg !160
  %17 = sub nsw i32 %16, 32, !dbg !160
  store i32 %17, ptr %2, align 4, !dbg !160
  %18 = load i32, ptr %2, align 4, !dbg !160
  store i32 %18, ptr %1, align 4, !dbg !160
  br label %mir.bb5, !dbg !160

mir.bb4:                                          ; preds = %mir.bb2
  %19 = load i32, ptr %6, align 4, !dbg !162
  store i32 %19, ptr %1, align 4, !dbg !162
  br label %mir.bb5, !dbg !162

mir.bb5:                                          ; preds = %mir.bb4, %mir.bb3
  %20 = load i32, ptr %1, align 4, !dbg !164
  store i32 %20, ptr %7, align 4, !dbg !164
  %21 = load i32, ptr %7, align 4, !dbg !164
  ret i32 %21, !dbg !164

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !164
}

define internal i64 @string_to_int(%str %0) !dbg !166 {
entry:
  %1 = alloca i64, align 8, !dbg !167
  %2 = alloca %str, align 8, !dbg !167
  %3 = alloca i64, align 8, !dbg !167
  store %str %0, ptr %2, align 8, !dbg !167
  br label %mir.bb0, !dbg !167

mir.bb0:                                          ; preds = %entry
  %4 = load %str, ptr %2, align 8, !dbg !167
  %5 = call i64 @with_parse_i64(%str %4), !dbg !167
  store i64 %5, ptr %1, align 8, !dbg !167
  br label %mir.bb1, !dbg !167

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load i64, ptr %1, align 8, !dbg !168
  store i64 %6, ptr %3, align 8, !dbg !168
  %7 = load i64, ptr %3, align 8, !dbg !168
  ret i64 %7, !dbg !168
}

define internal %__with.Vec.str @lines(%str %0) !dbg !170 {
entry:
  %1 = alloca ptr, align 8, !dbg !171
  %2 = alloca %__with.Vec.str, align 8, !dbg !171
  %3 = alloca %__with.Vec.str, align 8, !dbg !171
  %4 = alloca %__with.Vec.str, align 8, !dbg !171
  %5 = alloca %str, align 8, !dbg !171
  %6 = alloca %__with.Vec.str, align 8, !dbg !171
  store %str %0, ptr %5, align 8, !dbg !171
  br label %mir.bb0, !dbg !171

mir.bb0:                                          ; preds = %entry
  store %__with.Vec.str zeroinitializer, ptr %4, align 8, !dbg !171
  %7 = getelementptr inbounds nuw %__with.Vec.str, ptr %4, i32 0, i32 0, !dbg !171
  store ptr null, ptr %7, align 8, !dbg !171
  %8 = getelementptr inbounds nuw %__with.Vec.str, ptr %4, i32 0, i32 1, !dbg !171
  store i64 0, ptr %8, align 8, !dbg !171
  %9 = getelementptr inbounds nuw %__with.Vec.str, ptr %4, i32 0, i32 2, !dbg !171
  store i64 0, ptr %9, align 8, !dbg !171
  %10 = getelementptr inbounds nuw %__with.Vec.str, ptr %4, i32 0, i32 3, !dbg !171
  store i64 0, ptr %10, align 8, !dbg !171
  %11 = load %__with.Vec.str, ptr %4, align 8, !dbg !171
  store %__with.Vec.str %11, ptr %3, align 8, !dbg !171
  %12 = load %__with.Vec.str, ptr %3, align 8, !dbg !171
  store %__with.Vec.str %12, ptr %2, align 8, !dbg !171
  store ptr %2, ptr %1, align 8, !dbg !171
  %13 = load ptr, ptr %1, align 8, !dbg !171
  %14 = load %str, ptr %5, align 8, !dbg !171
  call void @with_lines_out(ptr %13, %str %14), !dbg !171
  br label %mir.bb1, !dbg !171

mir.bb1:                                          ; preds = %mir.bb0
  %15 = load %__with.Vec.str, ptr %2, align 8, !dbg !171
  store %__with.Vec.str %15, ptr %6, align 8, !dbg !171
  %16 = load %__with.Vec.str, ptr %6, align 8, !dbg !171
  ret %__with.Vec.str %16, !dbg !171
}

define internal i32 @parse(%str %0) !dbg !172 {
entry:
  %1 = alloca i32, align 4, !dbg !173
  %2 = alloca i64, align 8, !dbg !173
  %3 = alloca i64, align 8, !dbg !173
  %4 = alloca %str, align 8, !dbg !173
  %5 = alloca i32, align 4, !dbg !173
  store %str %0, ptr %4, align 8, !dbg !173
  br label %mir.bb0, !dbg !173

mir.bb0:                                          ; preds = %entry
  %6 = load %str, ptr %4, align 8, !dbg !173
  %7 = call i64 @string_to_int(%str %6), !dbg !173
  store i64 %7, ptr %3, align 8, !dbg !173
  br label %mir.bb1, !dbg !173

mir.bb1:                                          ; preds = %mir.bb0
  %8 = load i64, ptr %3, align 8, !dbg !174
  store i64 %8, ptr %2, align 8, !dbg !174
  %9 = load i64, ptr %2, align 8, !dbg !174
  %10 = trunc i64 %9 to i32, !dbg !174
  store i32 %10, ptr %1, align 4, !dbg !174
  %11 = load i32, ptr %1, align 4, !dbg !174
  store i32 %11, ptr %5, align 4, !dbg !174
  %12 = load i32, ptr %5, align 4, !dbg !174
  ret i32 %12, !dbg !174
}

declare double @sqrt(double)

declare float @sqrtf(float)

declare double @pow(double, double)

declare double @floor(double)

declare double @ceil(double)

declare double @round(double)

declare double @sin(double)

declare double @cos(double)

declare double @tan(double)

declare double @log(double)

declare double @log10(double)

declare double @exp(double)

declare double @fabs(double)

declare double @fmod(double, double)

declare double @asin(double)

declare double @acos(double)

declare double @atan(double)

declare double @atan2(double, double)

define internal i64 @abs64(i64 %0) !dbg !176 {
entry:
  %1 = alloca i64, align 8, !dbg !177
  %2 = alloca i64, align 8, !dbg !177
  %3 = alloca i1, align 1, !dbg !177
  %4 = alloca i64, align 8, !dbg !177
  %5 = alloca i64, align 8, !dbg !177
  store i64 %0, ptr %4, align 8, !dbg !177
  br label %mir.bb0, !dbg !177

mir.bb0:                                          ; preds = %entry
  %6 = load i64, ptr %4, align 8, !dbg !177
  %7 = icmp slt i64 %6, 0, !dbg !177
  store i1 %7, ptr %3, align 1, !dbg !177
  %8 = load i1, ptr %3, align 1, !dbg !177
  br i1 %8, label %mir.bb1, label %mir.bb2, !dbg !177

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load i64, ptr %4, align 8, !dbg !178
  %10 = sub nsw i64 0, %9, !dbg !178
  store i64 %10, ptr %2, align 8, !dbg !178
  %11 = load i64, ptr %2, align 8, !dbg !178
  store i64 %11, ptr %1, align 8, !dbg !178
  br label %mir.bb3, !dbg !178

mir.bb2:                                          ; preds = %mir.bb0
  %12 = load i64, ptr %4, align 8, !dbg !180
  store i64 %12, ptr %1, align 8, !dbg !180
  br label %mir.bb3, !dbg !180

mir.bb3:                                          ; preds = %mir.bb2, %mir.bb1
  %13 = load i64, ptr %1, align 8, !dbg !182
  store i64 %13, ptr %5, align 8, !dbg !182
  %14 = load i64, ptr %5, align 8, !dbg !182
  ret i64 %14, !dbg !182

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !182
}

define internal i64 @min64(i64 %0, i64 %1) !dbg !184 {
entry:
  %2 = alloca i64, align 8, !dbg !185
  %3 = alloca i1, align 1, !dbg !185
  %4 = alloca i64, align 8, !dbg !185
  %5 = alloca i64, align 8, !dbg !185
  %6 = alloca i64, align 8, !dbg !185
  store i64 %0, ptr %5, align 8, !dbg !185
  store i64 %1, ptr %4, align 8, !dbg !185
  br label %mir.bb0, !dbg !185

mir.bb0:                                          ; preds = %entry
  %7 = load i64, ptr %5, align 8, !dbg !185
  %8 = load i64, ptr %4, align 8, !dbg !185
  %9 = icmp slt i64 %7, %8, !dbg !185
  store i1 %9, ptr %3, align 1, !dbg !185
  %10 = load i1, ptr %3, align 1, !dbg !185
  br i1 %10, label %mir.bb1, label %mir.bb2, !dbg !185

mir.bb1:                                          ; preds = %mir.bb0
  %11 = load i64, ptr %5, align 8, !dbg !186
  store i64 %11, ptr %2, align 8, !dbg !186
  br label %mir.bb3, !dbg !186

mir.bb2:                                          ; preds = %mir.bb0
  %12 = load i64, ptr %4, align 8, !dbg !188
  store i64 %12, ptr %2, align 8, !dbg !188
  br label %mir.bb3, !dbg !188

mir.bb3:                                          ; preds = %mir.bb2, %mir.bb1
  %13 = load i64, ptr %2, align 8, !dbg !190
  store i64 %13, ptr %6, align 8, !dbg !190
  %14 = load i64, ptr %6, align 8, !dbg !190
  ret i64 %14, !dbg !190

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !190
}

define internal i64 @max64(i64 %0, i64 %1) !dbg !192 {
entry:
  %2 = alloca i64, align 8, !dbg !193
  %3 = alloca i1, align 1, !dbg !193
  %4 = alloca i64, align 8, !dbg !193
  %5 = alloca i64, align 8, !dbg !193
  %6 = alloca i64, align 8, !dbg !193
  store i64 %0, ptr %5, align 8, !dbg !193
  store i64 %1, ptr %4, align 8, !dbg !193
  br label %mir.bb0, !dbg !193

mir.bb0:                                          ; preds = %entry
  %7 = load i64, ptr %5, align 8, !dbg !193
  %8 = load i64, ptr %4, align 8, !dbg !193
  %9 = icmp sgt i64 %7, %8, !dbg !193
  store i1 %9, ptr %3, align 1, !dbg !193
  %10 = load i1, ptr %3, align 1, !dbg !193
  br i1 %10, label %mir.bb1, label %mir.bb2, !dbg !193

mir.bb1:                                          ; preds = %mir.bb0
  %11 = load i64, ptr %5, align 8, !dbg !194
  store i64 %11, ptr %2, align 8, !dbg !194
  br label %mir.bb3, !dbg !194

mir.bb2:                                          ; preds = %mir.bb0
  %12 = load i64, ptr %4, align 8, !dbg !196
  store i64 %12, ptr %2, align 8, !dbg !196
  br label %mir.bb3, !dbg !196

mir.bb3:                                          ; preds = %mir.bb2, %mir.bb1
  %13 = load i64, ptr %2, align 8, !dbg !198
  store i64 %13, ptr %6, align 8, !dbg !198
  %14 = load i64, ptr %6, align 8, !dbg !198
  ret i64 %14, !dbg !198

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !198
}

define internal float @sqrt_f32(float %0) !dbg !200 {
entry:
  %1 = alloca float, align 4, !dbg !201
  %2 = alloca float, align 4, !dbg !201
  %3 = alloca float, align 4, !dbg !201
  store float %0, ptr %2, align 4, !dbg !201
  br label %mir.bb0, !dbg !201

mir.bb0:                                          ; preds = %entry
  %4 = load float, ptr %2, align 4, !dbg !201
  %5 = call float @sqrtf(float %4), !dbg !201
  store float %5, ptr %1, align 4, !dbg !201
  br label %mir.bb1, !dbg !201

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load float, ptr %1, align 4, !dbg !202
  store float %6, ptr %3, align 4, !dbg !202
  %7 = load float, ptr %3, align 4, !dbg !202
  ret float %7, !dbg !202
}

define internal double @sqrt_f64(double %0) !dbg !204 {
entry:
  %1 = alloca double, align 8, !dbg !205
  %2 = alloca double, align 8, !dbg !205
  %3 = alloca double, align 8, !dbg !205
  store double %0, ptr %2, align 8, !dbg !205
  br label %mir.bb0, !dbg !205

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !205
  %5 = call double @llvm.sqrt.f64(double %4), !dbg !205
  store double %5, ptr %1, align 8, !dbg !205
  br label %mir.bb1, !dbg !205

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !206
  store double %6, ptr %3, align 8, !dbg !206
  %7 = load double, ptr %3, align 8, !dbg !206
  ret double %7, !dbg !206
}

define internal double @pow_f64(double %0, double %1) !dbg !208 {
entry:
  %2 = alloca double, align 8, !dbg !209
  %3 = alloca double, align 8, !dbg !209
  %4 = alloca double, align 8, !dbg !209
  %5 = alloca double, align 8, !dbg !209
  store double %0, ptr %4, align 8, !dbg !209
  store double %1, ptr %3, align 8, !dbg !209
  br label %mir.bb0, !dbg !209

mir.bb0:                                          ; preds = %entry
  %6 = load double, ptr %4, align 8, !dbg !209
  %7 = load double, ptr %3, align 8, !dbg !209
  %8 = call double @llvm.pow.f64(double %6, double %7), !dbg !209
  store double %8, ptr %2, align 8, !dbg !209
  br label %mir.bb1, !dbg !209

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load double, ptr %2, align 8, !dbg !210
  store double %9, ptr %5, align 8, !dbg !210
  %10 = load double, ptr %5, align 8, !dbg !210
  ret double %10, !dbg !210
}

define internal double @floor_f64(double %0) !dbg !212 {
entry:
  %1 = alloca double, align 8, !dbg !213
  %2 = alloca double, align 8, !dbg !213
  %3 = alloca double, align 8, !dbg !213
  store double %0, ptr %2, align 8, !dbg !213
  br label %mir.bb0, !dbg !213

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !213
  %5 = call double @llvm.floor.f64(double %4), !dbg !213
  store double %5, ptr %1, align 8, !dbg !213
  br label %mir.bb1, !dbg !213

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !214
  store double %6, ptr %3, align 8, !dbg !214
  %7 = load double, ptr %3, align 8, !dbg !214
  ret double %7, !dbg !214
}

define internal double @ceil_f64(double %0) !dbg !216 {
entry:
  %1 = alloca double, align 8, !dbg !217
  %2 = alloca double, align 8, !dbg !217
  %3 = alloca double, align 8, !dbg !217
  store double %0, ptr %2, align 8, !dbg !217
  br label %mir.bb0, !dbg !217

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !217
  %5 = call double @llvm.ceil.f64(double %4), !dbg !217
  store double %5, ptr %1, align 8, !dbg !217
  br label %mir.bb1, !dbg !217

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !218
  store double %6, ptr %3, align 8, !dbg !218
  %7 = load double, ptr %3, align 8, !dbg !218
  ret double %7, !dbg !218
}

define internal double @round_f64(double %0) !dbg !220 {
entry:
  %1 = alloca double, align 8, !dbg !221
  %2 = alloca double, align 8, !dbg !221
  %3 = alloca double, align 8, !dbg !221
  store double %0, ptr %2, align 8, !dbg !221
  br label %mir.bb0, !dbg !221

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !221
  %5 = call double @llvm.round.f64(double %4), !dbg !221
  store double %5, ptr %1, align 8, !dbg !221
  br label %mir.bb1, !dbg !221

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !222
  store double %6, ptr %3, align 8, !dbg !222
  %7 = load double, ptr %3, align 8, !dbg !222
  ret double %7, !dbg !222
}

define internal double @sin_f64(double %0) !dbg !224 {
entry:
  %1 = alloca double, align 8, !dbg !225
  %2 = alloca double, align 8, !dbg !225
  %3 = alloca double, align 8, !dbg !225
  store double %0, ptr %2, align 8, !dbg !225
  br label %mir.bb0, !dbg !225

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !225
  %5 = call double @llvm.sin.f64(double %4), !dbg !225
  store double %5, ptr %1, align 8, !dbg !225
  br label %mir.bb1, !dbg !225

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !226
  store double %6, ptr %3, align 8, !dbg !226
  %7 = load double, ptr %3, align 8, !dbg !226
  ret double %7, !dbg !226
}

define internal double @cos_f64(double %0) !dbg !228 {
entry:
  %1 = alloca double, align 8, !dbg !229
  %2 = alloca double, align 8, !dbg !229
  %3 = alloca double, align 8, !dbg !229
  store double %0, ptr %2, align 8, !dbg !229
  br label %mir.bb0, !dbg !229

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !229
  %5 = call double @llvm.cos.f64(double %4), !dbg !229
  store double %5, ptr %1, align 8, !dbg !229
  br label %mir.bb1, !dbg !229

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !230
  store double %6, ptr %3, align 8, !dbg !230
  %7 = load double, ptr %3, align 8, !dbg !230
  ret double %7, !dbg !230
}

define internal double @tan_f64(double %0) !dbg !232 {
entry:
  %1 = alloca double, align 8, !dbg !233
  %2 = alloca double, align 8, !dbg !233
  %3 = alloca double, align 8, !dbg !233
  store double %0, ptr %2, align 8, !dbg !233
  br label %mir.bb0, !dbg !233

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !233
  %5 = call double @tan(double %4), !dbg !233
  store double %5, ptr %1, align 8, !dbg !233
  br label %mir.bb1, !dbg !233

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !234
  store double %6, ptr %3, align 8, !dbg !234
  %7 = load double, ptr %3, align 8, !dbg !234
  ret double %7, !dbg !234
}

define internal double @log_f64(double %0) !dbg !236 {
entry:
  %1 = alloca double, align 8, !dbg !237
  %2 = alloca double, align 8, !dbg !237
  %3 = alloca double, align 8, !dbg !237
  store double %0, ptr %2, align 8, !dbg !237
  br label %mir.bb0, !dbg !237

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !237
  %5 = call double @llvm.log.f64(double %4), !dbg !237
  store double %5, ptr %1, align 8, !dbg !237
  br label %mir.bb1, !dbg !237

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !238
  store double %6, ptr %3, align 8, !dbg !238
  %7 = load double, ptr %3, align 8, !dbg !238
  ret double %7, !dbg !238
}

define internal double @log10_f64(double %0) !dbg !240 {
entry:
  %1 = alloca double, align 8, !dbg !241
  %2 = alloca double, align 8, !dbg !241
  %3 = alloca double, align 8, !dbg !241
  store double %0, ptr %2, align 8, !dbg !241
  br label %mir.bb0, !dbg !241

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !241
  %5 = call double @llvm.log10.f64(double %4), !dbg !241
  store double %5, ptr %1, align 8, !dbg !241
  br label %mir.bb1, !dbg !241

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !242
  store double %6, ptr %3, align 8, !dbg !242
  %7 = load double, ptr %3, align 8, !dbg !242
  ret double %7, !dbg !242
}

define internal double @exp_f64(double %0) !dbg !244 {
entry:
  %1 = alloca double, align 8, !dbg !245
  %2 = alloca double, align 8, !dbg !245
  %3 = alloca double, align 8, !dbg !245
  store double %0, ptr %2, align 8, !dbg !245
  br label %mir.bb0, !dbg !245

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !245
  %5 = call double @llvm.exp.f64(double %4), !dbg !245
  store double %5, ptr %1, align 8, !dbg !245
  br label %mir.bb1, !dbg !245

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !246
  store double %6, ptr %3, align 8, !dbg !246
  %7 = load double, ptr %3, align 8, !dbg !246
  ret double %7, !dbg !246
}

define internal double @fabs_f64(double %0) !dbg !248 {
entry:
  %1 = alloca double, align 8, !dbg !249
  %2 = alloca double, align 8, !dbg !249
  %3 = alloca double, align 8, !dbg !249
  store double %0, ptr %2, align 8, !dbg !249
  br label %mir.bb0, !dbg !249

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !249
  %5 = call double @llvm.fabs.f64(double %4), !dbg !249
  store double %5, ptr %1, align 8, !dbg !249
  br label %mir.bb1, !dbg !249

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !250
  store double %6, ptr %3, align 8, !dbg !250
  %7 = load double, ptr %3, align 8, !dbg !250
  ret double %7, !dbg !250
}

define internal double @fmod_f64(double %0, double %1) !dbg !252 {
entry:
  %2 = alloca double, align 8, !dbg !253
  %3 = alloca double, align 8, !dbg !253
  %4 = alloca double, align 8, !dbg !253
  %5 = alloca double, align 8, !dbg !253
  store double %0, ptr %4, align 8, !dbg !253
  store double %1, ptr %3, align 8, !dbg !253
  br label %mir.bb0, !dbg !253

mir.bb0:                                          ; preds = %entry
  %6 = load double, ptr %4, align 8, !dbg !253
  %7 = load double, ptr %3, align 8, !dbg !253
  %8 = call double @fmod(double %6, double %7), !dbg !253
  store double %8, ptr %2, align 8, !dbg !253
  br label %mir.bb1, !dbg !253

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load double, ptr %2, align 8, !dbg !254
  store double %9, ptr %5, align 8, !dbg !254
  %10 = load double, ptr %5, align 8, !dbg !254
  ret double %10, !dbg !254
}

define internal double @asin_f64(double %0) !dbg !256 {
entry:
  %1 = alloca double, align 8, !dbg !257
  %2 = alloca double, align 8, !dbg !257
  %3 = alloca double, align 8, !dbg !257
  store double %0, ptr %2, align 8, !dbg !257
  br label %mir.bb0, !dbg !257

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !257
  %5 = call double @asin(double %4), !dbg !257
  store double %5, ptr %1, align 8, !dbg !257
  br label %mir.bb1, !dbg !257

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !258
  store double %6, ptr %3, align 8, !dbg !258
  %7 = load double, ptr %3, align 8, !dbg !258
  ret double %7, !dbg !258
}

define internal double @acos_f64(double %0) !dbg !260 {
entry:
  %1 = alloca double, align 8, !dbg !261
  %2 = alloca double, align 8, !dbg !261
  %3 = alloca double, align 8, !dbg !261
  store double %0, ptr %2, align 8, !dbg !261
  br label %mir.bb0, !dbg !261

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !261
  %5 = call double @acos(double %4), !dbg !261
  store double %5, ptr %1, align 8, !dbg !261
  br label %mir.bb1, !dbg !261

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !262
  store double %6, ptr %3, align 8, !dbg !262
  %7 = load double, ptr %3, align 8, !dbg !262
  ret double %7, !dbg !262
}

define internal double @atan_f64(double %0) !dbg !264 {
entry:
  %1 = alloca double, align 8, !dbg !265
  %2 = alloca double, align 8, !dbg !265
  %3 = alloca double, align 8, !dbg !265
  store double %0, ptr %2, align 8, !dbg !265
  br label %mir.bb0, !dbg !265

mir.bb0:                                          ; preds = %entry
  %4 = load double, ptr %2, align 8, !dbg !265
  %5 = call double @atan(double %4), !dbg !265
  store double %5, ptr %1, align 8, !dbg !265
  br label %mir.bb1, !dbg !265

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load double, ptr %1, align 8, !dbg !266
  store double %6, ptr %3, align 8, !dbg !266
  %7 = load double, ptr %3, align 8, !dbg !266
  ret double %7, !dbg !266
}

define internal double @atan2_f64(double %0, double %1) !dbg !268 {
entry:
  %2 = alloca double, align 8, !dbg !269
  %3 = alloca double, align 8, !dbg !269
  %4 = alloca double, align 8, !dbg !269
  %5 = alloca double, align 8, !dbg !269
  store double %0, ptr %4, align 8, !dbg !269
  store double %1, ptr %3, align 8, !dbg !269
  br label %mir.bb0, !dbg !269

mir.bb0:                                          ; preds = %entry
  %6 = load double, ptr %4, align 8, !dbg !269
  %7 = load double, ptr %3, align 8, !dbg !269
  %8 = call double @atan2(double %6, double %7), !dbg !269
  store double %8, ptr %2, align 8, !dbg !269
  br label %mir.bb1, !dbg !269

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load double, ptr %2, align 8, !dbg !270
  store double %9, ptr %5, align 8, !dbg !270
  %10 = load double, ptr %5, align 8, !dbg !270
  ret double %10, !dbg !270
}

declare void @with_println_str(%str)

declare void @with_println_i32(i32)

declare void @with_println_i64(i64)

declare void @with_println_bool(i1)

declare void @with_print_str(%str)

declare void @with_eprint(%str)

declare void @with_write(%str)

declare void @with_ewrite(%str)

declare void @with_panic(%str, %str, i32)

declare %str @with_i32_to_str(i32)

declare %str @with_i64_to_str(i64)

declare %str @with_fmt_u32(i32)

declare %str @with_fmt_u64(i64)

declare %str @with_bool_to_str(i1)

define internal void @print(%str %0) !dbg !272 {
entry:
  %1 = alloca %str, align 8, !dbg !273
  %2 = alloca i32, align 4, !dbg !273
  store %str %0, ptr %1, align 8, !dbg !273
  br label %mir.bb0, !dbg !273

mir.bb0:                                          ; preds = %entry
  %3 = load %str, ptr %1, align 8, !dbg !273
  call void @with_println_str(%str %3), !dbg !273
  br label %mir.bb1, !dbg !273

mir.bb1:                                          ; preds = %mir.bb0
  ret void, !dbg !273
}

define internal void @eprint(%str %0) !dbg !274 {
entry:
  %1 = alloca %str, align 8, !dbg !275
  %2 = alloca i32, align 4, !dbg !275
  store %str %0, ptr %1, align 8, !dbg !275
  br label %mir.bb0, !dbg !275

mir.bb0:                                          ; preds = %entry
  %3 = load %str, ptr %1, align 8, !dbg !275
  call void @with_eprint(%str %3), !dbg !275
  br label %mir.bb1, !dbg !275

mir.bb1:                                          ; preds = %mir.bb0
  ret void, !dbg !275
}

define internal void @write(%str %0) !dbg !276 {
entry:
  %1 = alloca %str, align 8, !dbg !277
  %2 = alloca i32, align 4, !dbg !277
  store %str %0, ptr %1, align 8, !dbg !277
  br label %mir.bb0, !dbg !277

mir.bb0:                                          ; preds = %entry
  %3 = load %str, ptr %1, align 8, !dbg !277
  call void @with_write(%str %3), !dbg !277
  br label %mir.bb1, !dbg !277

mir.bb1:                                          ; preds = %mir.bb0
  ret void, !dbg !277
}

define internal void @ewrite(%str %0) !dbg !278 {
entry:
  %1 = alloca %str, align 8, !dbg !279
  %2 = alloca i32, align 4, !dbg !279
  store %str %0, ptr %1, align 8, !dbg !279
  br label %mir.bb0, !dbg !279

mir.bb0:                                          ; preds = %entry
  %3 = load %str, ptr %1, align 8, !dbg !279
  call void @with_ewrite(%str %3), !dbg !279
  br label %mir.bb1, !dbg !279

mir.bb1:                                          ; preds = %mir.bb0
  ret void, !dbg !279
}

define internal void @print_i32(i32 %0) !dbg !280 {
entry:
  %1 = alloca i32, align 4, !dbg !281
  %2 = alloca i32, align 4, !dbg !281
  store i32 %0, ptr %1, align 4, !dbg !281
  br label %mir.bb0, !dbg !281

mir.bb0:                                          ; preds = %entry
  %3 = load i32, ptr %1, align 4, !dbg !281
  call void @with_println_i32(i32 %3), !dbg !281
  br label %mir.bb1, !dbg !281

mir.bb1:                                          ; preds = %mir.bb0
  ret void, !dbg !281
}

define internal void @print_i64(i64 %0) !dbg !282 {
entry:
  %1 = alloca i64, align 8, !dbg !283
  %2 = alloca i32, align 4, !dbg !283
  store i64 %0, ptr %1, align 8, !dbg !283
  br label %mir.bb0, !dbg !283

mir.bb0:                                          ; preds = %entry
  %3 = load i64, ptr %1, align 8, !dbg !283
  call void @with_println_i64(i64 %3), !dbg !283
  br label %mir.bb1, !dbg !283

mir.bb1:                                          ; preds = %mir.bb0
  ret void, !dbg !283
}

define internal void @print_bool(i1 %0) !dbg !284 {
entry:
  %1 = alloca i1, align 1, !dbg !285
  %2 = alloca i32, align 4, !dbg !285
  store i1 %0, ptr %1, align 1, !dbg !285
  br label %mir.bb0, !dbg !285

mir.bb0:                                          ; preds = %entry
  %3 = load i1, ptr %1, align 1, !dbg !285
  call void @with_println_bool(i1 %3), !dbg !285
  br label %mir.bb1, !dbg !285

mir.bb1:                                          ; preds = %mir.bb0
  ret void, !dbg !285
}

define internal void @assert(i1 %0, %str %1, %str %2) !dbg !286 {
entry:
  %3 = alloca i1, align 1, !dbg !287
  %4 = alloca %str, align 8, !dbg !287
  %5 = alloca %str, align 8, !dbg !287
  %6 = alloca i1, align 1, !dbg !287
  %7 = alloca i32, align 4, !dbg !287
  store i1 %0, ptr %6, align 1, !dbg !287
  store %str %1, ptr %5, align 8, !dbg !287
  store %str %2, ptr %4, align 8, !dbg !287
  br label %mir.bb0, !dbg !287

mir.bb0:                                          ; preds = %entry
  %8 = load i1, ptr %6, align 1, !dbg !287
  %9 = xor i1 %8, true, !dbg !287
  store i1 %9, ptr %3, align 1, !dbg !287
  %10 = load i1, ptr %3, align 1, !dbg !287
  br i1 %10, label %mir.bb1, label %mir.bb2, !dbg !287

mir.bb1:                                          ; preds = %mir.bb0
  %11 = load %str, ptr %5, align 8, !dbg !287
  %12 = load %str, ptr %4, align 8, !dbg !287
  call void @with_panic(%str %11, %str %12, i32 0), !dbg !287
  br label %mir.bb4, !dbg !287

mir.bb2:                                          ; preds = %mir.bb0
  br label %mir.bb3, !dbg !287

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb2
  ret void, !dbg !287

mir.bb4:                                          ; preds = %mir.bb1
  br label %mir.bb3, !dbg !287

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !287
}

define internal void @require(i1 %0, %str %1, %str %2) !dbg !288 {
entry:
  %3 = alloca i1, align 1, !dbg !289
  %4 = alloca %str, align 8, !dbg !289
  %5 = alloca %str, align 8, !dbg !289
  %6 = alloca i1, align 1, !dbg !289
  %7 = alloca i32, align 4, !dbg !289
  store i1 %0, ptr %6, align 1, !dbg !289
  store %str %1, ptr %5, align 8, !dbg !289
  store %str %2, ptr %4, align 8, !dbg !289
  br label %mir.bb0, !dbg !289

mir.bb0:                                          ; preds = %entry
  %8 = load i1, ptr %6, align 1, !dbg !289
  %9 = xor i1 %8, true, !dbg !289
  store i1 %9, ptr %3, align 1, !dbg !289
  %10 = load i1, ptr %3, align 1, !dbg !289
  br i1 %10, label %mir.bb1, label %mir.bb2, !dbg !289

mir.bb1:                                          ; preds = %mir.bb0
  %11 = load %str, ptr %5, align 8, !dbg !289
  %12 = load %str, ptr %4, align 8, !dbg !289
  call void @with_panic(%str %11, %str %12, i32 0), !dbg !289
  br label %mir.bb4, !dbg !289

mir.bb2:                                          ; preds = %mir.bb0
  br label %mir.bb3, !dbg !289

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb2
  ret void, !dbg !289

mir.bb4:                                          ; preds = %mir.bb1
  br label %mir.bb3, !dbg !289

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !289
}

define internal void @check(i1 %0, %str %1, %str %2) !dbg !290 {
entry:
  %3 = alloca i1, align 1, !dbg !291
  %4 = alloca %str, align 8, !dbg !291
  %5 = alloca %str, align 8, !dbg !291
  %6 = alloca i1, align 1, !dbg !291
  %7 = alloca i32, align 4, !dbg !291
  store i1 %0, ptr %6, align 1, !dbg !291
  store %str %1, ptr %5, align 8, !dbg !291
  store %str %2, ptr %4, align 8, !dbg !291
  br label %mir.bb0, !dbg !291

mir.bb0:                                          ; preds = %entry
  %8 = load i1, ptr %6, align 1, !dbg !291
  %9 = xor i1 %8, true, !dbg !291
  store i1 %9, ptr %3, align 1, !dbg !291
  %10 = load i1, ptr %3, align 1, !dbg !291
  br i1 %10, label %mir.bb1, label %mir.bb2, !dbg !291

mir.bb1:                                          ; preds = %mir.bb0
  %11 = load %str, ptr %5, align 8, !dbg !291
  %12 = load %str, ptr %4, align 8, !dbg !291
  call void @with_panic(%str %11, %str %12, i32 0), !dbg !291
  br label %mir.bb4, !dbg !291

mir.bb2:                                          ; preds = %mir.bb0
  br label %mir.bb3, !dbg !291

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb2
  ret void, !dbg !291

mir.bb4:                                          ; preds = %mir.bb1
  br label %mir.bb3, !dbg !291

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !291
}

define internal %str @i32.to_string(ptr %0) !dbg !292 {
entry:
  %1 = alloca %str, align 8, !dbg !293
  %2 = alloca i64, align 8, !dbg !293
  %3 = alloca ptr, align 8, !dbg !293
  %4 = alloca %str, align 8, !dbg !293
  store ptr %0, ptr %3, align 8, !dbg !293
  br label %mir.bb0, !dbg !293

mir.bb0:                                          ; preds = %entry
  %5 = load ptr, ptr %3, align 8, !dbg !293
  %6 = load i32, ptr %5, align 4, !dbg !293
  %7 = sext i32 %6 to i64, !dbg !293
  store i64 %7, ptr %2, align 8, !dbg !293
  %8 = load i64, ptr %2, align 8, !dbg !293
  %9 = call %str @with_i64_to_str(i64 %8), !dbg !293
  store %str %9, ptr %1, align 8, !dbg !293
  br label %mir.bb1, !dbg !293

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load %str, ptr %1, align 8, !dbg !294
  store %str %10, ptr %4, align 8, !dbg !294
  %11 = load %str, ptr %4, align 8, !dbg !294
  ret %str %11, !dbg !294
}

define internal %str @i64.to_string(ptr %0) !dbg !296 {
entry:
  %1 = alloca %str, align 8, !dbg !297
  %2 = alloca ptr, align 8, !dbg !297
  %3 = alloca %str, align 8, !dbg !297
  store ptr %0, ptr %2, align 8, !dbg !297
  br label %mir.bb0, !dbg !297

mir.bb0:                                          ; preds = %entry
  %4 = load ptr, ptr %2, align 8, !dbg !297
  %5 = load i64, ptr %4, align 8, !dbg !297
  %6 = call %str @with_i64_to_str(i64 %5), !dbg !297
  store %str %6, ptr %1, align 8, !dbg !297
  br label %mir.bb1, !dbg !297

mir.bb1:                                          ; preds = %mir.bb0
  %7 = load %str, ptr %1, align 8, !dbg !298
  store %str %7, ptr %3, align 8, !dbg !298
  %8 = load %str, ptr %3, align 8, !dbg !298
  ret %str %8, !dbg !298
}

define internal %str @u32.to_string(ptr %0) !dbg !300 {
entry:
  %1 = alloca %str, align 8, !dbg !301
  %2 = alloca ptr, align 8, !dbg !301
  %3 = alloca %str, align 8, !dbg !301
  store ptr %0, ptr %2, align 8, !dbg !301
  br label %mir.bb0, !dbg !301

mir.bb0:                                          ; preds = %entry
  %4 = load ptr, ptr %2, align 8, !dbg !301
  %5 = load i32, ptr %4, align 4, !dbg !301
  %6 = call %str @with_fmt_u32(i32 %5), !dbg !301
  store %str %6, ptr %1, align 8, !dbg !301
  br label %mir.bb1, !dbg !301

mir.bb1:                                          ; preds = %mir.bb0
  %7 = load %str, ptr %1, align 8, !dbg !302
  store %str %7, ptr %3, align 8, !dbg !302
  %8 = load %str, ptr %3, align 8, !dbg !302
  ret %str %8, !dbg !302
}

define internal %str @u64.to_string(ptr %0) !dbg !304 {
entry:
  %1 = alloca %str, align 8, !dbg !305
  %2 = alloca ptr, align 8, !dbg !305
  %3 = alloca %str, align 8, !dbg !305
  store ptr %0, ptr %2, align 8, !dbg !305
  br label %mir.bb0, !dbg !305

mir.bb0:                                          ; preds = %entry
  %4 = load ptr, ptr %2, align 8, !dbg !305
  %5 = load i64, ptr %4, align 8, !dbg !305
  %6 = call %str @with_fmt_u64(i64 %5), !dbg !305
  store %str %6, ptr %1, align 8, !dbg !305
  br label %mir.bb1, !dbg !305

mir.bb1:                                          ; preds = %mir.bb0
  %7 = load %str, ptr %1, align 8, !dbg !306
  store %str %7, ptr %3, align 8, !dbg !306
  %8 = load %str, ptr %3, align 8, !dbg !306
  ret %str %8, !dbg !306
}

define internal %str @bool.to_string(ptr %0) !dbg !308 {
entry:
  %1 = alloca %str, align 8, !dbg !309
  %2 = alloca ptr, align 8, !dbg !309
  %3 = alloca %str, align 8, !dbg !309
  store ptr %0, ptr %2, align 8, !dbg !309
  br label %mir.bb0, !dbg !309

mir.bb0:                                          ; preds = %entry
  %4 = load ptr, ptr %2, align 8, !dbg !309
  %5 = load i1, ptr %4, align 1, !dbg !309
  %6 = call %str @with_bool_to_str(i1 %5), !dbg !309
  store %str %6, ptr %1, align 8, !dbg !309
  br label %mir.bb1, !dbg !309

mir.bb1:                                          ; preds = %mir.bb0
  %7 = load %str, ptr %1, align 8, !dbg !310
  store %str %7, ptr %3, align 8, !dbg !310
  %8 = load %str, ptr %3, align 8, !dbg !310
  ret %str %8, !dbg !310
}

define internal %str @int_to_string(i64 %0) !dbg !312 {
entry:
  %1 = alloca %str, align 8, !dbg !313
  %2 = alloca i64, align 8, !dbg !313
  %3 = alloca %str, align 8, !dbg !313
  store i64 %0, ptr %2, align 8, !dbg !313
  br label %mir.bb0, !dbg !313

mir.bb0:                                          ; preds = %entry
  %4 = load i64, ptr %2, align 8, !dbg !313
  %5 = call %str @with_i64_to_str(i64 %4), !dbg !313
  store %str %5, ptr %1, align 8, !dbg !313
  br label %mir.bb1, !dbg !313

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load %str, ptr %1, align 8, !dbg !314
  store %str %6, ptr %3, align 8, !dbg !314
  %7 = load %str, ptr %3, align 8, !dbg !314
  ret %str %7, !dbg !314
}

declare %str @with_str_slice(%str, i64, i64)

declare %str @str_from_byte(i32)

declare %str @with_regex_error_message(i32)

declare ptr @with_regex_compile(%str, i32, ptr, ptr)

declare ptr @with_regex_code_copy(ptr)

declare void @with_regex_code_free(ptr)

declare i32 @with_regex_capture_count(ptr)

declare ptr @with_regex_match_spans_alloc(ptr, %str, ptr)

declare ptr @with_regex_match_spans_alloc_at(ptr, %str, i32, ptr)

declare i32 @with_regex_capture_name_count(ptr)

declare %str @with_regex_capture_name_at(ptr, i32)

declare i32 @with_regex_group_name_to_index(ptr, %str)

declare %str @with_regex_substitute(ptr, %str, %str, i32)

declare void @with_free(ptr)

define internal %RegexFlags @regex_make_flags(i32 %0, i32 %1) !dbg !316 {
entry:
  %2 = alloca %RegexFlags, align 8, !dbg !317
  %3 = alloca %RegexFlags, align 8, !dbg !317
  %4 = alloca i32, align 4, !dbg !317
  %5 = alloca i32, align 4, !dbg !317
  %6 = alloca %RegexFlags, align 8, !dbg !317
  store i32 %0, ptr %5, align 4, !dbg !317
  store i32 %1, ptr %4, align 4, !dbg !317
  br label %mir.bb0, !dbg !317

mir.bb0:                                          ; preds = %entry
  store %RegexFlags zeroinitializer, ptr %3, align 4, !dbg !317
  %7 = load i32, ptr %5, align 4, !dbg !317
  %8 = getelementptr inbounds nuw %RegexFlags, ptr %3, i32 0, i32 0, !dbg !317
  store i32 %7, ptr %8, align 4, !dbg !317
  %9 = load i32, ptr %4, align 4, !dbg !317
  %10 = getelementptr inbounds nuw %RegexFlags, ptr %3, i32 0, i32 1, !dbg !317
  store i32 %9, ptr %10, align 4, !dbg !317
  %11 = load %RegexFlags, ptr %3, align 4, !dbg !317
  store %RegexFlags %11, ptr %2, align 4, !dbg !317
  %12 = load %RegexFlags, ptr %2, align 4, !dbg !317
  store %RegexFlags %12, ptr %6, align 4, !dbg !317
  %13 = load %RegexFlags, ptr %6, align 4, !dbg !317
  ret %RegexFlags %13, !dbg !317
}

define internal %str @regex_error_message(i32 %0) !dbg !318 {
entry:
  %1 = alloca %str, align 8, !dbg !319
  %2 = alloca i32, align 4, !dbg !319
  %3 = alloca %str, align 8, !dbg !319
  store i32 %0, ptr %2, align 4, !dbg !319
  br label %mir.bb0, !dbg !319

mir.bb0:                                          ; preds = %entry
  %4 = load i32, ptr %2, align 4, !dbg !319
  %5 = call %str @with_regex_error_message(i32 %4), !dbg !319
  store %str %5, ptr %1, align 8, !dbg !319
  br label %mir.bb1, !dbg !319

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load %str, ptr %1, align 8, !dbg !320
  store %str %6, ptr %3, align 8, !dbg !320
  %7 = load %str, ptr %3, align 8, !dbg !320
  ret %str %7, !dbg !320
}

define internal { i32, [24 x i8] } @regex_compile_flags(%str %0) !dbg !322 {
entry:
  %1 = alloca { i32, [24 x i8] }, align 8, !dbg !323
  %2 = alloca { i32, [24 x i8] }, align 8, !dbg !323
  %3 = alloca { i32, [24 x i8] }, align 8, !dbg !323
  %4 = alloca { i32, [24 x i8] }, align 8, !dbg !323
  %5 = alloca %RegexError, align 8, !dbg !323
  %6 = alloca %RegexError, align 8, !dbg !323
  %7 = alloca i32, align 4, !dbg !323
  %8 = alloca i32, align 4, !dbg !323
  %9 = alloca i32, align 4, !dbg !323
  %10 = alloca i1, align 1, !dbg !323
  %11 = alloca i32, align 4, !dbg !323
  %12 = alloca i1, align 1, !dbg !323
  %13 = alloca i32, align 4, !dbg !323
  %14 = alloca i1, align 1, !dbg !323
  %15 = alloca i32, align 4, !dbg !323
  %16 = alloca i1, align 1, !dbg !323
  %17 = alloca i32, align 4, !dbg !323
  %18 = alloca i1, align 1, !dbg !323
  %19 = alloca i32, align 4, !dbg !323
  %20 = alloca i64, align 8, !dbg !323
  %21 = alloca i1, align 1, !dbg !323
  %22 = alloca i32, align 4, !dbg !323
  %23 = alloca i1, align 1, !dbg !323
  %24 = alloca i32, align 4, !dbg !323
  %25 = alloca i1, align 1, !dbg !323
  %26 = alloca %RegexFlags, align 8, !dbg !323
  %27 = alloca i32, align 4, !dbg !323
  %28 = alloca i64, align 8, !dbg !323
  %29 = alloca i64, align 8, !dbg !323
  %30 = alloca i32, align 4, !dbg !323
  %31 = alloca i32, align 4, !dbg !323
  %32 = alloca %str, align 8, !dbg !323
  %33 = alloca { i32, [24 x i8] }, align 8, !dbg !323
  store %str %0, ptr %32, align 8, !dbg !323
  br label %mir.bb0, !dbg !323

mir.bb0:                                          ; preds = %entry
  store i32 0, ptr %31, align 4, !dbg !323
  store i32 0, ptr %30, align 4, !dbg !323
  store i64 0, ptr %29, align 8, !dbg !323
  br label %mir.bb1, !dbg !323

mir.bb1:                                          ; preds = %mir.bb8, %mir.bb0
  %34 = load %str, ptr %32, align 8, !dbg !323
  %35 = extractvalue %str %34, 1, !dbg !323
  store i64 %35, ptr %28, align 8, !dbg !323
  br label %mir.bb4, !dbg !323

mir.bb2:                                          ; preds = %mir.bb4
  %36 = load %str, ptr %32, align 8, !dbg !324
  %37 = load i64, ptr %29, align 8, !dbg !324
  %38 = call i32 @with_str_byte_at(%str %36, i64 %37), !dbg !324
  store i32 %38, ptr %27, align 4, !dbg !324
  br label %mir.bb5, !dbg !324

mir.bb3:                                          ; preds = %mir.bb4
  %39 = load i32, ptr %31, align 4, !dbg !324
  %40 = load i32, ptr %30, align 4, !dbg !324
  %41 = call %RegexFlags @regex_make_flags(i32 %39, i32 %40), !dbg !324
  store %RegexFlags %41, ptr %26, align 4, !dbg !324
  br label %mir.bb28, !dbg !324

mir.bb4:                                          ; preds = %mir.bb1
  %42 = load i64, ptr %29, align 8, !dbg !326
  %43 = load i64, ptr %28, align 8, !dbg !326
  %44 = icmp slt i64 %42, %43, !dbg !326
  store i1 %44, ptr %25, align 1, !dbg !326
  %45 = load i1, ptr %25, align 1, !dbg !326
  br i1 %45, label %mir.bb2, label %mir.bb3, !dbg !326

mir.bb5:                                          ; preds = %mir.bb2
  %46 = load i32, ptr %27, align 4, !dbg !328
  store i32 %46, ptr %24, align 4, !dbg !328
  %47 = load i32, ptr %24, align 4, !dbg !328
  %48 = icmp eq i32 %47, 103, !dbg !328
  store i1 %48, ptr %23, align 1, !dbg !328
  %49 = load i1, ptr %23, align 1, !dbg !328
  br i1 %49, label %mir.bb6, label %mir.bb7, !dbg !328

mir.bb6:                                          ; preds = %mir.bb5
  %50 = load i32, ptr %30, align 4, !dbg !330
  %51 = or i32 %50, 1, !dbg !330
  store i32 %51, ptr %22, align 4, !dbg !330
  %52 = load i32, ptr %22, align 4, !dbg !330
  store i32 %52, ptr %30, align 4, !dbg !330
  br label %mir.bb8, !dbg !330

mir.bb7:                                          ; preds = %mir.bb5
  %53 = load i32, ptr %24, align 4, !dbg !332
  %54 = icmp eq i32 %53, 105, !dbg !332
  store i1 %54, ptr %21, align 1, !dbg !332
  %55 = load i1, ptr %21, align 1, !dbg !332
  br i1 %55, label %mir.bb9, label %mir.bb10, !dbg !332

mir.bb8:                                          ; preds = %mir.bb11, %mir.bb6
  %56 = load i64, ptr %29, align 8, !dbg !334
  %57 = add nsw i64 %56, 1, !dbg !334
  store i64 %57, ptr %20, align 8, !dbg !334
  %58 = load i64, ptr %20, align 8, !dbg !334
  store i64 %58, ptr %29, align 8, !dbg !334
  br label %mir.bb1, !dbg !334

mir.bb9:                                          ; preds = %mir.bb7
  %59 = load i32, ptr %31, align 4, !dbg !336
  %60 = or i32 %59, 8, !dbg !336
  store i32 %60, ptr %19, align 4, !dbg !336
  %61 = load i32, ptr %19, align 4, !dbg !336
  store i32 %61, ptr %31, align 4, !dbg !336
  br label %mir.bb11, !dbg !336

mir.bb10:                                         ; preds = %mir.bb7
  %62 = load i32, ptr %24, align 4, !dbg !338
  %63 = icmp eq i32 %62, 109, !dbg !338
  store i1 %63, ptr %18, align 1, !dbg !338
  %64 = load i1, ptr %18, align 1, !dbg !338
  br i1 %64, label %mir.bb12, label %mir.bb13, !dbg !338

mir.bb11:                                         ; preds = %mir.bb14, %mir.bb9
  br label %mir.bb8, !dbg !338

mir.bb12:                                         ; preds = %mir.bb10
  %65 = load i32, ptr %31, align 4, !dbg !340
  %66 = or i32 %65, 1024, !dbg !340
  store i32 %66, ptr %17, align 4, !dbg !340
  %67 = load i32, ptr %17, align 4, !dbg !340
  store i32 %67, ptr %31, align 4, !dbg !340
  br label %mir.bb14, !dbg !340

mir.bb13:                                         ; preds = %mir.bb10
  %68 = load i32, ptr %24, align 4, !dbg !342
  %69 = icmp eq i32 %68, 115, !dbg !342
  store i1 %69, ptr %16, align 1, !dbg !342
  %70 = load i1, ptr %16, align 1, !dbg !342
  br i1 %70, label %mir.bb15, label %mir.bb16, !dbg !342

mir.bb14:                                         ; preds = %mir.bb17, %mir.bb12
  br label %mir.bb11, !dbg !342

mir.bb15:                                         ; preds = %mir.bb13
  %71 = load i32, ptr %31, align 4, !dbg !344
  %72 = or i32 %71, 32, !dbg !344
  store i32 %72, ptr %15, align 4, !dbg !344
  %73 = load i32, ptr %15, align 4, !dbg !344
  store i32 %73, ptr %31, align 4, !dbg !344
  br label %mir.bb17, !dbg !344

mir.bb16:                                         ; preds = %mir.bb13
  %74 = load i32, ptr %24, align 4, !dbg !346
  %75 = icmp eq i32 %74, 120, !dbg !346
  store i1 %75, ptr %14, align 1, !dbg !346
  %76 = load i1, ptr %14, align 1, !dbg !346
  br i1 %76, label %mir.bb18, label %mir.bb19, !dbg !346

mir.bb17:                                         ; preds = %mir.bb20, %mir.bb15
  br label %mir.bb14, !dbg !346

mir.bb18:                                         ; preds = %mir.bb16
  %77 = load i32, ptr %31, align 4, !dbg !348
  %78 = or i32 %77, 128, !dbg !348
  store i32 %78, ptr %13, align 4, !dbg !348
  %79 = load i32, ptr %13, align 4, !dbg !348
  store i32 %79, ptr %31, align 4, !dbg !348
  br label %mir.bb20, !dbg !348

mir.bb19:                                         ; preds = %mir.bb16
  %80 = load i32, ptr %24, align 4, !dbg !350
  %81 = icmp eq i32 %80, 85, !dbg !350
  store i1 %81, ptr %12, align 1, !dbg !350
  %82 = load i1, ptr %12, align 1, !dbg !350
  br i1 %82, label %mir.bb21, label %mir.bb22, !dbg !350

mir.bb20:                                         ; preds = %mir.bb23, %mir.bb18
  br label %mir.bb17, !dbg !350

mir.bb21:                                         ; preds = %mir.bb19
  %83 = load i32, ptr %31, align 4, !dbg !352
  %84 = or i32 %83, 262144, !dbg !352
  store i32 %84, ptr %11, align 4, !dbg !352
  %85 = load i32, ptr %11, align 4, !dbg !352
  store i32 %85, ptr %31, align 4, !dbg !352
  br label %mir.bb23, !dbg !352

mir.bb22:                                         ; preds = %mir.bb19
  %86 = load i32, ptr %24, align 4, !dbg !354
  %87 = icmp eq i32 %86, 117, !dbg !354
  store i1 %87, ptr %10, align 1, !dbg !354
  %88 = load i1, ptr %10, align 1, !dbg !354
  br i1 %88, label %mir.bb24, label %mir.bb25, !dbg !354

mir.bb23:                                         ; preds = %mir.bb26, %mir.bb21
  br label %mir.bb20, !dbg !354

mir.bb24:                                         ; preds = %mir.bb22
  %89 = load i32, ptr %31, align 4, !dbg !356
  %90 = or i32 %89, 524288, !dbg !356
  store i32 %90, ptr %9, align 4, !dbg !356
  %91 = load i32, ptr %9, align 4, !dbg !356
  %92 = or i32 %91, 131072, !dbg !356
  store i32 %92, ptr %8, align 4, !dbg !356
  %93 = load i32, ptr %8, align 4, !dbg !356
  store i32 %93, ptr %31, align 4, !dbg !356
  br label %mir.bb26, !dbg !356

mir.bb25:                                         ; preds = %mir.bb22
  %94 = load i64, ptr %29, align 8, !dbg !358
  %95 = trunc i64 %94 to i32, !dbg !358
  store i32 %95, ptr %7, align 4, !dbg !358
  store %RegexError zeroinitializer, ptr %6, align 8, !dbg !358
  %96 = getelementptr inbounds nuw %RegexError, ptr %6, i32 0, i32 0, !dbg !358
  store i32 -1000, ptr %96, align 4, !dbg !358
  %97 = load i32, ptr %7, align 4, !dbg !358
  %98 = getelementptr inbounds nuw %RegexError, ptr %6, i32 0, i32 1, !dbg !358
  store i32 %97, ptr %98, align 4, !dbg !358
  %99 = alloca %str, align 8, !dbg !358
  %100 = getelementptr inbounds nuw %str, ptr %99, i32 0, i32 0, !dbg !358
  store ptr @0, ptr %100, align 8, !dbg !358
  %101 = getelementptr inbounds nuw %str, ptr %99, i32 0, i32 1, !dbg !358
  store i64 18, ptr %101, align 8, !dbg !358
  %102 = load %str, ptr %99, align 8, !dbg !358
  %103 = getelementptr inbounds nuw %RegexError, ptr %6, i32 0, i32 2, !dbg !358
  store %str %102, ptr %103, align 8, !dbg !358
  %104 = load %RegexError, ptr %6, align 8, !dbg !358
  store %RegexError %104, ptr %5, align 8, !dbg !358
  store { i32, [24 x i8] } zeroinitializer, ptr %4, align 4, !dbg !358
  %105 = getelementptr inbounds nuw { i32, [24 x i8] }, ptr %4, i32 0, i32 0, !dbg !358
  store i32 1, ptr %105, align 4, !dbg !358
  %106 = getelementptr inbounds nuw { i32, [24 x i8] }, ptr %4, i32 0, i32 1, !dbg !358
  %107 = load %RegexError, ptr %5, align 8, !dbg !358
  store %RegexError %107, ptr %106, align 8, !dbg !358
  %108 = load { i32, [24 x i8] }, ptr %4, align 4, !dbg !358
  store { i32, [24 x i8] } %108, ptr %3, align 4, !dbg !358
  %109 = load { i32, [24 x i8] }, ptr %3, align 4, !dbg !358
  store { i32, [24 x i8] } %109, ptr %33, align 4, !dbg !358
  %110 = load { i32, [24 x i8] }, ptr %33, align 4, !dbg !358
  ret { i32, [24 x i8] } %110, !dbg !358

mir.bb26:                                         ; preds = %mir.bb27, %mir.bb24
  br label %mir.bb23, !dbg !358

mir.bb27:                                         ; No predecessors!
  br label %mir.bb26, !dbg !358

mir.bb28:                                         ; preds = %mir.bb3
  store { i32, [24 x i8] } zeroinitializer, ptr %2, align 4, !dbg !360
  %111 = getelementptr inbounds nuw { i32, [24 x i8] }, ptr %2, i32 0, i32 0, !dbg !360
  store i32 0, ptr %111, align 4, !dbg !360
  %112 = getelementptr inbounds nuw { i32, [24 x i8] }, ptr %2, i32 0, i32 1, !dbg !360
  %113 = load %RegexFlags, ptr %26, align 4, !dbg !360
  store %RegexFlags %113, ptr %112, align 4, !dbg !360
  %114 = load { i32, [24 x i8] }, ptr %2, align 4, !dbg !360
  store { i32, [24 x i8] } %114, ptr %1, align 4, !dbg !360
  %115 = load { i32, [24 x i8] }, ptr %1, align 4, !dbg !360
  store { i32, [24 x i8] } %115, ptr %33, align 4, !dbg !360
  %116 = load { i32, [24 x i8] }, ptr %33, align 4, !dbg !360
  ret { i32, [24 x i8] } %116, !dbg !360

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !360
}

define internal %Regex @Regex.clone(ptr %0) !dbg !362 {
entry:
  %1 = alloca %Regex, align 8, !dbg !363
  %2 = alloca %Regex, align 8, !dbg !363
  %3 = alloca i1, align 1, !dbg !363
  %4 = alloca i64, align 8, !dbg !363
  %5 = alloca ptr, align 8, !dbg !363
  %6 = alloca ptr, align 8, !dbg !363
  %7 = alloca ptr, align 8, !dbg !363
  %8 = alloca %Regex, align 8, !dbg !363
  store ptr %0, ptr %7, align 8, !dbg !363
  br label %mir.bb0, !dbg !363

mir.bb0:                                          ; preds = %entry
  %9 = load ptr, ptr %7, align 8, !dbg !363
  %10 = getelementptr inbounds nuw %Regex, ptr %9, i32 0, i32 0, !dbg !363
  %11 = load ptr, ptr %10, align 8, !dbg !363
  %12 = call ptr @with_regex_code_copy(ptr %11), !dbg !363
  store ptr %12, ptr %6, align 8, !dbg !363
  br label %mir.bb1, !dbg !363

mir.bb1:                                          ; preds = %mir.bb0
  %13 = load ptr, ptr %6, align 8, !dbg !364
  store ptr %13, ptr %5, align 8, !dbg !364
  %14 = load ptr, ptr %5, align 8, !dbg !364
  %15 = ptrtoint ptr %14 to i64, !dbg !364
  store i64 %15, ptr %4, align 8, !dbg !364
  %16 = load i64, ptr %4, align 8, !dbg !364
  %17 = icmp eq i64 %16, 0, !dbg !364
  store i1 %17, ptr %3, align 1, !dbg !364
  %18 = load i1, ptr %3, align 1, !dbg !364
  br i1 %18, label %mir.bb2, label %mir.bb3, !dbg !364

mir.bb2:                                          ; preds = %mir.bb1
  %19 = alloca %str, align 8, !dbg !364
  %20 = getelementptr inbounds nuw %str, ptr %19, i32 0, i32 0, !dbg !364
  store ptr @1, ptr %20, align 8, !dbg !364
  %21 = getelementptr inbounds nuw %str, ptr %19, i32 0, i32 1, !dbg !364
  store i64 39, ptr %21, align 8, !dbg !364
  %22 = load %str, ptr %19, align 8, !dbg !364
  %23 = alloca %str, align 8, !dbg !364
  %24 = getelementptr inbounds nuw %str, ptr %23, i32 0, i32 0, !dbg !364
  store ptr @2, ptr %24, align 8, !dbg !364
  %25 = getelementptr inbounds nuw %str, ptr %23, i32 0, i32 1, !dbg !364
  store i64 0, ptr %25, align 8, !dbg !364
  %26 = load %str, ptr %23, align 8, !dbg !364
  call void @with_panic(%str %22, %str %26, i32 0), !dbg !364
  br label %mir.bb5, !dbg !364

mir.bb3:                                          ; preds = %mir.bb1
  br label %mir.bb4, !dbg !364

mir.bb4:                                          ; preds = %mir.bb5, %mir.bb3
  store %Regex zeroinitializer, ptr %2, align 8, !dbg !366
  %27 = load ptr, ptr %5, align 8, !dbg !366
  %28 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 0, !dbg !366
  store ptr %27, ptr %28, align 8, !dbg !366
  %29 = load ptr, ptr %7, align 8, !dbg !366
  %30 = getelementptr inbounds nuw %Regex, ptr %29, i32 0, i32 1, !dbg !366
  %31 = load %str, ptr %30, align 8, !dbg !366
  %32 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 1, !dbg !366
  store %str %31, ptr %32, align 8, !dbg !366
  %33 = load ptr, ptr %7, align 8, !dbg !366
  %34 = getelementptr inbounds nuw %Regex, ptr %33, i32 0, i32 2, !dbg !366
  %35 = load %str, ptr %34, align 8, !dbg !366
  %36 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 2, !dbg !366
  store %str %35, ptr %36, align 8, !dbg !366
  %37 = load ptr, ptr %7, align 8, !dbg !366
  %38 = getelementptr inbounds nuw %Regex, ptr %37, i32 0, i32 3, !dbg !366
  %39 = load i32, ptr %38, align 4, !dbg !366
  %40 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 3, !dbg !366
  store i32 %39, ptr %40, align 4, !dbg !366
  %41 = load ptr, ptr %7, align 8, !dbg !366
  %42 = getelementptr inbounds nuw %Regex, ptr %41, i32 0, i32 4, !dbg !366
  %43 = load i32, ptr %42, align 4, !dbg !366
  %44 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 4, !dbg !366
  store i32 %43, ptr %44, align 4, !dbg !366
  %45 = load ptr, ptr %7, align 8, !dbg !366
  %46 = getelementptr inbounds nuw %Regex, ptr %45, i32 0, i32 5, !dbg !366
  %47 = load i32, ptr %46, align 4, !dbg !366
  %48 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 5, !dbg !366
  store i32 %47, ptr %48, align 4, !dbg !366
  %49 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 6, !dbg !366
  store i32 1, ptr %49, align 4, !dbg !366
  %50 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 7, !dbg !366
  store ptr null, ptr %50, align 8, !dbg !366
  %51 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 8, !dbg !366
  store ptr null, ptr %51, align 8, !dbg !366
  %52 = getelementptr inbounds nuw %Regex, ptr %2, i32 0, i32 9, !dbg !366
  store ptr null, ptr %52, align 8, !dbg !366
  %53 = load %Regex, ptr %2, align 8, !dbg !366
  store %Regex %53, ptr %1, align 8, !dbg !366
  %54 = load %Regex, ptr %1, align 8, !dbg !366
  store %Regex %54, ptr %8, align 8, !dbg !366
  %55 = load %Regex, ptr %8, align 8, !dbg !366
  ret %Regex %55, !dbg !366

mir.bb5:                                          ; preds = %mir.bb2
  br label %mir.bb4, !dbg !366

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !366
}

define internal void @Regex.drop(ptr %0) !dbg !368 {
entry:
  %1 = alloca i1, align 1, !dbg !369
  %2 = alloca i64, align 8, !dbg !369
  %3 = alloca i1, align 1, !dbg !369
  %4 = alloca i1, align 1, !dbg !369
  %5 = alloca ptr, align 8, !dbg !369
  %6 = alloca i32, align 4, !dbg !369
  store ptr %0, ptr %5, align 8, !dbg !369
  br label %mir.bb0, !dbg !369

mir.bb0:                                          ; preds = %entry
  %7 = load ptr, ptr %5, align 8, !dbg !369
  %8 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 6, !dbg !369
  %9 = load i32, ptr %8, align 4, !dbg !369
  %10 = icmp ne i32 %9, 0, !dbg !369
  store i1 %10, ptr %4, align 1, !dbg !369
  %11 = load i1, ptr %4, align 1, !dbg !369
  store i1 %11, ptr %3, align 1, !dbg !369
  %12 = load i1, ptr %3, align 1, !dbg !369
  br i1 %12, label %mir.bb1, label %mir.bb2, !dbg !369

mir.bb1:                                          ; preds = %mir.bb0
  %13 = load ptr, ptr %5, align 8, !dbg !370
  %14 = getelementptr inbounds nuw %Regex, ptr %13, i32 0, i32 0, !dbg !370
  %15 = load ptr, ptr %14, align 8, !dbg !370
  %16 = ptrtoint ptr %15 to i64, !dbg !370
  store i64 %16, ptr %2, align 8, !dbg !370
  %17 = load i64, ptr %2, align 8, !dbg !370
  %18 = icmp ne i64 %17, 0, !dbg !370
  store i1 %18, ptr %1, align 1, !dbg !370
  %19 = load i1, ptr %1, align 1, !dbg !370
  store i1 %19, ptr %3, align 1, !dbg !370
  br label %mir.bb2, !dbg !370

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %20 = load i1, ptr %3, align 1, !dbg !370
  br i1 %20, label %mir.bb3, label %mir.bb4, !dbg !370

mir.bb3:                                          ; preds = %mir.bb2
  %21 = load ptr, ptr %5, align 8, !dbg !370
  %22 = getelementptr inbounds nuw %Regex, ptr %21, i32 0, i32 0, !dbg !370
  %23 = load ptr, ptr %22, align 8, !dbg !370
  call void @with_regex_code_free(ptr %23), !dbg !370
  br label %mir.bb6, !dbg !370

mir.bb4:                                          ; preds = %mir.bb2
  br label %mir.bb5, !dbg !370

mir.bb5:                                          ; preds = %mir.bb6, %mir.bb4
  ret void, !dbg !370

mir.bb6:                                          ; preds = %mir.bb3
  br label %mir.bb5, !dbg !370

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !370
}

define internal i1 @Regex.is_global(ptr %0) !dbg !372 {
entry:
  %1 = alloca i1, align 1, !dbg !373
  %2 = alloca i32, align 4, !dbg !373
  %3 = alloca ptr, align 8, !dbg !373
  %4 = alloca i1, align 1, !dbg !373
  store ptr %0, ptr %3, align 8, !dbg !373
  br label %mir.bb0, !dbg !373

mir.bb0:                                          ; preds = %entry
  %5 = load ptr, ptr %3, align 8, !dbg !373
  %6 = getelementptr inbounds nuw %Regex, ptr %5, i32 0, i32 4, !dbg !373
  %7 = load i32, ptr %6, align 4, !dbg !373
  %8 = and i32 %7, 1, !dbg !373
  store i32 %8, ptr %2, align 4, !dbg !373
  %9 = load i32, ptr %2, align 4, !dbg !373
  %10 = icmp ne i32 %9, 0, !dbg !373
  store i1 %10, ptr %1, align 1, !dbg !373
  %11 = load i1, ptr %1, align 1, !dbg !373
  store i1 %11, ptr %4, align 1, !dbg !373
  %12 = load i1, ptr %4, align 1, !dbg !373
  ret i1 %12, !dbg !373
}

define internal { i32, [80 x i8] } @Regex.compile(%str %0) !dbg !374 {
entry:
  %1 = alloca { i32, [80 x i8] }, align 8, !dbg !375
  %2 = alloca %str, align 8, !dbg !375
  %3 = alloca { i32, [80 x i8] }, align 8, !dbg !375
  store %str %0, ptr %2, align 8, !dbg !375
  br label %mir.bb0, !dbg !375

mir.bb0:                                          ; preds = %entry
  %4 = load %str, ptr %2, align 8, !dbg !375
  %5 = alloca %str, align 8, !dbg !375
  %6 = getelementptr inbounds nuw %str, ptr %5, i32 0, i32 0, !dbg !375
  store ptr @3, ptr %6, align 8, !dbg !375
  %7 = getelementptr inbounds nuw %str, ptr %5, i32 0, i32 1, !dbg !375
  store i64 0, ptr %7, align 8, !dbg !375
  %8 = load %str, ptr %5, align 8, !dbg !375
  %9 = call { i32, [80 x i8] } @Regex.compile_flags(%str %4, %str %8), !dbg !375
  store { i32, [80 x i8] } %9, ptr %1, align 4, !dbg !375
  br label %mir.bb1, !dbg !375

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load { i32, [80 x i8] }, ptr %1, align 4, !dbg !376
  store { i32, [80 x i8] } %10, ptr %3, align 4, !dbg !376
  %11 = load { i32, [80 x i8] }, ptr %3, align 4, !dbg !376
  ret { i32, [80 x i8] } %11, !dbg !376
}

define internal { i32, [80 x i8] } @Regex.compile_flags(%str %0, %str %1) !dbg !378 {
entry:
  %2 = alloca { i32, [80 x i8] }, align 8, !dbg !379
  %3 = alloca { i32, [80 x i8] }, align 8, !dbg !379
  %4 = alloca { i32, [80 x i8] }, align 8, !dbg !379
  %5 = alloca { i32, [80 x i8] }, align 8, !dbg !379
  %6 = alloca %Regex, align 8, !dbg !379
  %7 = alloca %Regex, align 8, !dbg !379
  %8 = alloca { i32, [80 x i8] }, align 8, !dbg !379
  %9 = alloca { i32, [80 x i8] }, align 8, !dbg !379
  %10 = alloca %RegexError, align 8, !dbg !379
  %11 = alloca %RegexError, align 8, !dbg !379
  %12 = alloca i32, align 4, !dbg !379
  %13 = alloca %str, align 8, !dbg !379
  %14 = alloca i1, align 1, !dbg !379
  %15 = alloca i64, align 8, !dbg !379
  %16 = alloca ptr, align 8, !dbg !379
  %17 = alloca i32, align 4, !dbg !379
  %18 = alloca ptr, align 8, !dbg !379
  %19 = alloca ptr, align 8, !dbg !379
  %20 = alloca ptr, align 8, !dbg !379
  %21 = alloca i32, align 4, !dbg !379
  %22 = alloca i32, align 4, !dbg !379
  %23 = alloca %RegexFlags, align 8, !dbg !379
  %24 = alloca %RegexError, align 8, !dbg !379
  %25 = alloca { i32, [80 x i8] }, align 8, !dbg !379
  %26 = alloca i32, align 4, !dbg !379
  %27 = alloca { i32, [24 x i8] }, align 8, !dbg !379
  %28 = alloca { i32, [24 x i8] }, align 8, !dbg !379
  %29 = alloca %str, align 8, !dbg !379
  %30 = alloca %str, align 8, !dbg !379
  %31 = alloca { i32, [80 x i8] }, align 8, !dbg !379
  store %str %0, ptr %30, align 8, !dbg !379
  store %str %1, ptr %29, align 8, !dbg !379
  br label %mir.bb0, !dbg !379

mir.bb0:                                          ; preds = %entry
  %32 = load %str, ptr %29, align 8, !dbg !379
  %33 = call { i32, [24 x i8] } @regex_compile_flags(%str %32), !dbg !379
  store { i32, [24 x i8] } %33, ptr %28, align 4, !dbg !379
  br label %mir.bb1, !dbg !379

mir.bb1:                                          ; preds = %mir.bb0
  %34 = load { i32, [24 x i8] }, ptr %28, align 4, !dbg !380
  store { i32, [24 x i8] } %34, ptr %27, align 4, !dbg !380
  %35 = load { i32, [24 x i8] }, ptr %27, align 4, !dbg !380
  %36 = extractvalue { i32, [24 x i8] } %35, 0, !dbg !380
  store i32 %36, ptr %26, align 4, !dbg !380
  %37 = load i32, ptr %26, align 4, !dbg !380
  switch i32 %37, label %mir.bb4 [
    i32 0, label %mir.bb3
  ], !dbg !380

mir.bb2:                                          ; preds = %mir.bb12, %mir.bb11, %mir.bb4
  %38 = load { i32, [80 x i8] }, ptr %25, align 4, !dbg !382
  store { i32, [80 x i8] } %38, ptr %31, align 4, !dbg !382
  %39 = load { i32, [80 x i8] }, ptr %31, align 4, !dbg !382
  ret { i32, [80 x i8] } %39, !dbg !382

mir.bb3:                                          ; preds = %mir.bb1
  %40 = getelementptr inbounds nuw { i32, [24 x i8] }, ptr %27, i32 0, i32 1, !dbg !384
  %41 = getelementptr inbounds nuw { %RegexFlags }, ptr %40, i32 0, i32 0, !dbg !384
  %42 = load %RegexFlags, ptr %41, align 4, !dbg !384
  store %RegexFlags %42, ptr %23, align 4, !dbg !384
  store i32 0, ptr %22, align 4, !dbg !384
  store i32 0, ptr %21, align 4, !dbg !384
  store ptr %22, ptr %20, align 8, !dbg !384
  store ptr %21, ptr %19, align 8, !dbg !384
  %43 = load %str, ptr %30, align 8, !dbg !384
  %44 = getelementptr inbounds nuw %RegexFlags, ptr %23, i32 0, i32 0, !dbg !384
  %45 = load i32, ptr %44, align 4, !dbg !384
  %46 = load ptr, ptr %20, align 8, !dbg !384
  %47 = load ptr, ptr %19, align 8, !dbg !384
  %48 = call ptr @with_regex_compile(%str %43, i32 %45, ptr %46, ptr %47), !dbg !384
  store ptr %48, ptr %18, align 8, !dbg !384
  br label %mir.bb5, !dbg !384

mir.bb4:                                          ; preds = %mir.bb1
  %49 = load { i32, [24 x i8] }, ptr %27, align 4, !dbg !384
  %50 = extractvalue { i32, [24 x i8] } %49, 0, !dbg !384
  store i32 %50, ptr %17, align 4, !dbg !384
  %51 = load i32, ptr %17, align 4, !dbg !384
  switch i32 %51, label %mir.bb2 [
    i32 1, label %mir.bb12
  ], !dbg !384

mir.bb5:                                          ; preds = %mir.bb3
  %52 = load ptr, ptr %18, align 8, !dbg !386
  store ptr %52, ptr %16, align 8, !dbg !386
  %53 = load ptr, ptr %16, align 8, !dbg !386
  %54 = ptrtoint ptr %53 to i64, !dbg !386
  store i64 %54, ptr %15, align 8, !dbg !386
  %55 = load i64, ptr %15, align 8, !dbg !386
  %56 = icmp eq i64 %55, 0, !dbg !386
  store i1 %56, ptr %14, align 1, !dbg !386
  %57 = load i1, ptr %14, align 1, !dbg !386
  br i1 %57, label %mir.bb6, label %mir.bb7, !dbg !386

mir.bb6:                                          ; preds = %mir.bb5
  %58 = load i32, ptr %22, align 4, !dbg !386
  %59 = call %str @regex_error_message(i32 %58), !dbg !386
  store %str %59, ptr %13, align 8, !dbg !386
  br label %mir.bb9, !dbg !386

mir.bb7:                                          ; preds = %mir.bb5
  br label %mir.bb8, !dbg !386

mir.bb8:                                          ; preds = %mir.bb10, %mir.bb7
  %60 = load ptr, ptr %16, align 8, !dbg !386
  %61 = call i32 @with_regex_capture_count(ptr %60), !dbg !386
  store i32 %61, ptr %12, align 4, !dbg !386
  br label %mir.bb11, !dbg !386

mir.bb9:                                          ; preds = %mir.bb6
  store %RegexError zeroinitializer, ptr %11, align 8, !dbg !388
  %62 = load i32, ptr %22, align 4, !dbg !388
  %63 = getelementptr inbounds nuw %RegexError, ptr %11, i32 0, i32 0, !dbg !388
  store i32 %62, ptr %63, align 4, !dbg !388
  %64 = load i32, ptr %21, align 4, !dbg !388
  %65 = getelementptr inbounds nuw %RegexError, ptr %11, i32 0, i32 1, !dbg !388
  store i32 %64, ptr %65, align 4, !dbg !388
  %66 = load %str, ptr %13, align 8, !dbg !388
  %67 = getelementptr inbounds nuw %RegexError, ptr %11, i32 0, i32 2, !dbg !388
  store %str %66, ptr %67, align 8, !dbg !388
  %68 = load %RegexError, ptr %11, align 8, !dbg !388
  store %RegexError %68, ptr %10, align 8, !dbg !388
  store { i32, [80 x i8] } zeroinitializer, ptr %9, align 4, !dbg !388
  %69 = getelementptr inbounds nuw { i32, [80 x i8] }, ptr %9, i32 0, i32 0, !dbg !388
  store i32 1, ptr %69, align 4, !dbg !388
  %70 = getelementptr inbounds nuw { i32, [80 x i8] }, ptr %9, i32 0, i32 1, !dbg !388
  %71 = load %RegexError, ptr %10, align 8, !dbg !388
  store %RegexError %71, ptr %70, align 8, !dbg !388
  %72 = load { i32, [80 x i8] }, ptr %9, align 4, !dbg !388
  store { i32, [80 x i8] } %72, ptr %8, align 4, !dbg !388
  %73 = load { i32, [80 x i8] }, ptr %8, align 4, !dbg !388
  store { i32, [80 x i8] } %73, ptr %31, align 4, !dbg !388
  %74 = load { i32, [80 x i8] }, ptr %31, align 4, !dbg !388
  ret { i32, [80 x i8] } %74, !dbg !388

mir.bb10:                                         ; No predecessors!
  br label %mir.bb8, !dbg !388

mir.bb11:                                         ; preds = %mir.bb8
  store %Regex zeroinitializer, ptr %7, align 8, !dbg !390
  %75 = load ptr, ptr %16, align 8, !dbg !390
  %76 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 0, !dbg !390
  store ptr %75, ptr %76, align 8, !dbg !390
  %77 = load %str, ptr %30, align 8, !dbg !390
  %78 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 1, !dbg !390
  store %str %77, ptr %78, align 8, !dbg !390
  %79 = load %str, ptr %29, align 8, !dbg !390
  %80 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 2, !dbg !390
  store %str %79, ptr %80, align 8, !dbg !390
  %81 = getelementptr inbounds nuw %RegexFlags, ptr %23, i32 0, i32 0, !dbg !390
  %82 = load i32, ptr %81, align 4, !dbg !390
  %83 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 3, !dbg !390
  store i32 %82, ptr %83, align 4, !dbg !390
  %84 = getelementptr inbounds nuw %RegexFlags, ptr %23, i32 0, i32 1, !dbg !390
  %85 = load i32, ptr %84, align 4, !dbg !390
  %86 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 4, !dbg !390
  store i32 %85, ptr %86, align 4, !dbg !390
  %87 = load i32, ptr %12, align 4, !dbg !390
  %88 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 5, !dbg !390
  store i32 %87, ptr %88, align 4, !dbg !390
  %89 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 6, !dbg !390
  store i32 1, ptr %89, align 4, !dbg !390
  %90 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 7, !dbg !390
  store ptr null, ptr %90, align 8, !dbg !390
  %91 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 8, !dbg !390
  store ptr null, ptr %91, align 8, !dbg !390
  %92 = getelementptr inbounds nuw %Regex, ptr %7, i32 0, i32 9, !dbg !390
  store ptr null, ptr %92, align 8, !dbg !390
  %93 = load %Regex, ptr %7, align 8, !dbg !390
  store %Regex %93, ptr %6, align 8, !dbg !390
  store { i32, [80 x i8] } zeroinitializer, ptr %5, align 4, !dbg !390
  %94 = getelementptr inbounds nuw { i32, [80 x i8] }, ptr %5, i32 0, i32 0, !dbg !390
  store i32 0, ptr %94, align 4, !dbg !390
  %95 = getelementptr inbounds nuw { i32, [80 x i8] }, ptr %5, i32 0, i32 1, !dbg !390
  %96 = load %Regex, ptr %6, align 8, !dbg !390
  store %Regex %96, ptr %95, align 8, !dbg !390
  %97 = load { i32, [80 x i8] }, ptr %5, align 4, !dbg !390
  store { i32, [80 x i8] } %97, ptr %4, align 4, !dbg !390
  %98 = load { i32, [80 x i8] }, ptr %4, align 4, !dbg !390
  store { i32, [80 x i8] } %98, ptr %25, align 4, !dbg !390
  br label %mir.bb2, !dbg !390

mir.bb12:                                         ; preds = %mir.bb4
  %99 = getelementptr inbounds nuw { i32, [24 x i8] }, ptr %27, i32 0, i32 1, !dbg !392
  %100 = getelementptr inbounds nuw { %RegexError }, ptr %99, i32 0, i32 0, !dbg !392
  %101 = load %RegexError, ptr %100, align 8, !dbg !392
  store %RegexError %101, ptr %24, align 8, !dbg !392
  store { i32, [80 x i8] } zeroinitializer, ptr %3, align 4, !dbg !392
  %102 = getelementptr inbounds nuw { i32, [80 x i8] }, ptr %3, i32 0, i32 0, !dbg !392
  store i32 1, ptr %102, align 4, !dbg !392
  %103 = getelementptr inbounds nuw { i32, [80 x i8] }, ptr %3, i32 0, i32 1, !dbg !392
  %104 = load %RegexError, ptr %24, align 8, !dbg !392
  store %RegexError %104, ptr %103, align 8, !dbg !392
  %105 = load { i32, [80 x i8] }, ptr %3, align 4, !dbg !392
  store { i32, [80 x i8] } %105, ptr %2, align 4, !dbg !392
  %106 = load { i32, [80 x i8] }, ptr %2, align 4, !dbg !392
  store { i32, [80 x i8] } %106, ptr %25, align 4, !dbg !392
  br label %mir.bb2, !dbg !392

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !392
}

define internal ptr @Regex.__literal_code(ptr %0, %str %1, i32 %2) !dbg !394 {
entry:
  %3 = alloca %str, align 8, !dbg !395
  %4 = alloca %str, align 8, !dbg !395
  %5 = alloca i1, align 1, !dbg !395
  %6 = alloca i64, align 8, !dbg !395
  %7 = alloca ptr, align 8, !dbg !395
  %8 = alloca ptr, align 8, !dbg !395
  %9 = alloca ptr, align 8, !dbg !395
  %10 = alloca ptr, align 8, !dbg !395
  %11 = alloca i32, align 4, !dbg !395
  %12 = alloca i32, align 4, !dbg !395
  %13 = alloca i1, align 1, !dbg !395
  %14 = alloca i64, align 8, !dbg !395
  %15 = alloca ptr, align 8, !dbg !395
  %16 = alloca i1, align 1, !dbg !395
  %17 = alloca i64, align 8, !dbg !395
  %18 = alloca i32, align 4, !dbg !395
  %19 = alloca %str, align 8, !dbg !395
  %20 = alloca ptr, align 8, !dbg !395
  %21 = alloca ptr, align 8, !dbg !395
  store ptr %0, ptr %20, align 8, !dbg !395
  store %str %1, ptr %19, align 8, !dbg !395
  store i32 %2, ptr %18, align 4, !dbg !395
  br label %mir.bb0, !dbg !395

mir.bb0:                                          ; preds = %entry
  %22 = load ptr, ptr %20, align 8, !dbg !395
  %23 = ptrtoint ptr %22 to i64, !dbg !395
  store i64 %23, ptr %17, align 8, !dbg !395
  %24 = load i64, ptr %17, align 8, !dbg !395
  %25 = icmp eq i64 %24, 0, !dbg !395
  store i1 %25, ptr %16, align 1, !dbg !395
  %26 = load i1, ptr %16, align 1, !dbg !395
  br i1 %26, label %mir.bb1, label %mir.bb2, !dbg !395

mir.bb1:                                          ; preds = %mir.bb0
  store ptr null, ptr %21, align 8, !dbg !396
  %27 = load ptr, ptr %21, align 8, !dbg !396
  ret ptr %27, !dbg !396

mir.bb2:                                          ; preds = %mir.bb0
  br label %mir.bb3, !dbg !396

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb2
  %28 = load ptr, ptr %20, align 8, !dbg !398
  %29 = load ptr, ptr %28, align 8, !dbg !398
  store ptr %29, ptr %15, align 8, !dbg !398
  %30 = load ptr, ptr %15, align 8, !dbg !398
  %31 = ptrtoint ptr %30 to i64, !dbg !398
  store i64 %31, ptr %14, align 8, !dbg !398
  %32 = load i64, ptr %14, align 8, !dbg !398
  %33 = icmp ne i64 %32, 0, !dbg !398
  store i1 %33, ptr %13, align 1, !dbg !398
  %34 = load i1, ptr %13, align 1, !dbg !398
  br i1 %34, label %mir.bb5, label %mir.bb6, !dbg !398

mir.bb4:                                          ; No predecessors!
  br label %mir.bb3, !dbg !398

mir.bb5:                                          ; preds = %mir.bb3
  %35 = load ptr, ptr %15, align 8, !dbg !400
  store ptr %35, ptr %21, align 8, !dbg !400
  %36 = load ptr, ptr %21, align 8, !dbg !400
  ret ptr %36, !dbg !400

mir.bb6:                                          ; preds = %mir.bb3
  br label %mir.bb7, !dbg !400

mir.bb7:                                          ; preds = %mir.bb8, %mir.bb6
  store i32 0, ptr %12, align 4, !dbg !402
  store i32 0, ptr %11, align 4, !dbg !402
  store ptr %12, ptr %10, align 8, !dbg !402
  store ptr %11, ptr %9, align 8, !dbg !402
  %37 = load %str, ptr %19, align 8, !dbg !402
  %38 = load i32, ptr %18, align 4, !dbg !402
  %39 = load ptr, ptr %10, align 8, !dbg !402
  %40 = load ptr, ptr %9, align 8, !dbg !402
  %41 = call ptr @with_regex_compile(%str %37, i32 %38, ptr %39, ptr %40), !dbg !402
  store ptr %41, ptr %8, align 8, !dbg !402
  br label %mir.bb9, !dbg !402

mir.bb8:                                          ; No predecessors!
  br label %mir.bb7, !dbg !402

mir.bb9:                                          ; preds = %mir.bb7
  %42 = load ptr, ptr %8, align 8, !dbg !404
  store ptr %42, ptr %7, align 8, !dbg !404
  %43 = load ptr, ptr %7, align 8, !dbg !404
  %44 = ptrtoint ptr %43 to i64, !dbg !404
  store i64 %44, ptr %6, align 8, !dbg !404
  %45 = load i64, ptr %6, align 8, !dbg !404
  %46 = icmp eq i64 %45, 0, !dbg !404
  store i1 %46, ptr %5, align 1, !dbg !404
  %47 = load i1, ptr %5, align 1, !dbg !404
  br i1 %47, label %mir.bb10, label %mir.bb11, !dbg !404

mir.bb10:                                         ; preds = %mir.bb9
  %48 = load i32, ptr %12, align 4, !dbg !404
  %49 = call %str @regex_error_message(i32 %48), !dbg !404
  store %str %49, ptr %4, align 8, !dbg !404
  br label %mir.bb13, !dbg !404

mir.bb11:                                         ; preds = %mir.bb9
  br label %mir.bb12, !dbg !404

mir.bb12:                                         ; preds = %mir.bb15, %mir.bb11
  %50 = load ptr, ptr %20, align 8, !dbg !406
  %51 = load ptr, ptr %7, align 8, !dbg !406
  store ptr %51, ptr %50, align 8, !dbg !406
  %52 = load ptr, ptr %7, align 8, !dbg !406
  store ptr %52, ptr %21, align 8, !dbg !406
  %53 = load ptr, ptr %21, align 8, !dbg !406
  ret ptr %53, !dbg !406

mir.bb13:                                         ; preds = %mir.bb10
  %54 = alloca %str, align 8, !dbg !408
  %55 = getelementptr inbounds nuw %str, ptr %54, i32 0, i32 0, !dbg !408
  store ptr @4, ptr %55, align 8, !dbg !408
  %56 = getelementptr inbounds nuw %str, ptr %54, i32 0, i32 1, !dbg !408
  store i64 23, ptr %56, align 8, !dbg !408
  %57 = load %str, ptr %54, align 8, !dbg !408
  %58 = load %str, ptr %4, align 8, !dbg !408
  %59 = call %str @with_str_concat(%str %57, %str %58), !dbg !408
  store %str %59, ptr %3, align 8, !dbg !408
  %60 = load %str, ptr %3, align 8, !dbg !408
  %61 = alloca %str, align 8, !dbg !408
  %62 = getelementptr inbounds nuw %str, ptr %61, i32 0, i32 0, !dbg !408
  store ptr @5, ptr %62, align 8, !dbg !408
  %63 = getelementptr inbounds nuw %str, ptr %61, i32 0, i32 1, !dbg !408
  store i64 0, ptr %63, align 8, !dbg !408
  %64 = load %str, ptr %61, align 8, !dbg !408
  call void @with_panic(%str %60, %str %64, i32 0), !dbg !408
  br label %mir.bb14, !dbg !408

mir.bb14:                                         ; preds = %mir.bb13
  store ptr null, ptr %21, align 8, !dbg !410
  %65 = load ptr, ptr %21, align 8, !dbg !410
  ret ptr %65, !dbg !410

mir.bb15:                                         ; No predecessors!
  br label %mir.bb12, !dbg !410

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !410
}

define internal %str @Regex.pattern(ptr %0) !dbg !412 {
entry:
  %1 = alloca ptr, align 8, !dbg !413
  %2 = alloca %str, align 8, !dbg !413
  store ptr %0, ptr %1, align 8, !dbg !413
  br label %mir.bb0, !dbg !413

mir.bb0:                                          ; preds = %entry
  %3 = load ptr, ptr %1, align 8, !dbg !413
  %4 = getelementptr inbounds nuw %Regex, ptr %3, i32 0, i32 1, !dbg !413
  %5 = load %str, ptr %4, align 8, !dbg !413
  store %str %5, ptr %2, align 8, !dbg !413
  %6 = load %str, ptr %2, align 8, !dbg !413
  ret %str %6, !dbg !413
}

define internal i32 @Regex.num_captures(ptr %0) !dbg !414 {
entry:
  %1 = alloca ptr, align 8, !dbg !415
  %2 = alloca i32, align 4, !dbg !415
  store ptr %0, ptr %1, align 8, !dbg !415
  br label %mir.bb0, !dbg !415

mir.bb0:                                          ; preds = %entry
  %3 = load ptr, ptr %1, align 8, !dbg !415
  %4 = getelementptr inbounds nuw %Regex, ptr %3, i32 0, i32 5, !dbg !415
  %5 = load i32, ptr %4, align 4, !dbg !415
  store i32 %5, ptr %2, align 4, !dbg !415
  %6 = load i32, ptr %2, align 4, !dbg !415
  ret i32 %6, !dbg !415
}

define internal { i32, i32 } @Regex.capture_index(ptr %0, %str %1) !dbg !416 {
entry:
  %2 = alloca { i32, i32 }, align 8, !dbg !417
  %3 = alloca { i32, i32 }, align 8, !dbg !417
  %4 = alloca { i32, i32 }, align 8, !dbg !417
  %5 = alloca { i32, i32 }, align 8, !dbg !417
  %6 = alloca i1, align 1, !dbg !417
  %7 = alloca i32, align 4, !dbg !417
  %8 = alloca i32, align 4, !dbg !417
  %9 = alloca { i32, i32 }, align 8, !dbg !417
  %10 = alloca { i32, i32 }, align 8, !dbg !417
  %11 = alloca i1, align 1, !dbg !417
  %12 = alloca i64, align 8, !dbg !417
  %13 = alloca %str, align 8, !dbg !417
  %14 = alloca ptr, align 8, !dbg !417
  %15 = alloca { i32, i32 }, align 8, !dbg !417
  store ptr %0, ptr %14, align 8, !dbg !417
  store %str %1, ptr %13, align 8, !dbg !417
  br label %mir.bb0, !dbg !417

mir.bb0:                                          ; preds = %entry
  %16 = load ptr, ptr %14, align 8, !dbg !417
  %17 = getelementptr inbounds nuw %Regex, ptr %16, i32 0, i32 0, !dbg !417
  %18 = load ptr, ptr %17, align 8, !dbg !417
  %19 = ptrtoint ptr %18 to i64, !dbg !417
  store i64 %19, ptr %12, align 8, !dbg !417
  %20 = load i64, ptr %12, align 8, !dbg !417
  %21 = icmp eq i64 %20, 0, !dbg !417
  store i1 %21, ptr %11, align 1, !dbg !417
  %22 = load i1, ptr %11, align 1, !dbg !417
  br i1 %22, label %mir.bb1, label %mir.bb2, !dbg !417

mir.bb1:                                          ; preds = %mir.bb0
  store { i32, i32 } zeroinitializer, ptr %10, align 4, !dbg !417
  %23 = getelementptr inbounds nuw { i32, i32 }, ptr %10, i32 0, i32 0, !dbg !417
  store i32 1, ptr %23, align 4, !dbg !417
  %24 = load { i32, i32 }, ptr %10, align 4, !dbg !417
  store { i32, i32 } %24, ptr %9, align 4, !dbg !417
  %25 = load { i32, i32 }, ptr %9, align 4, !dbg !417
  store { i32, i32 } %25, ptr %15, align 4, !dbg !417
  %26 = load { i32, i32 }, ptr %15, align 4, !dbg !417
  ret { i32, i32 } %26, !dbg !417

mir.bb2:                                          ; preds = %mir.bb0
  br label %mir.bb3, !dbg !417

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb2
  %27 = load ptr, ptr %14, align 8, !dbg !418
  %28 = getelementptr inbounds nuw %Regex, ptr %27, i32 0, i32 0, !dbg !418
  %29 = load ptr, ptr %28, align 8, !dbg !418
  %30 = load %str, ptr %13, align 8, !dbg !418
  %31 = call i32 @with_regex_group_name_to_index(ptr %29, %str %30), !dbg !418
  store i32 %31, ptr %8, align 4, !dbg !418
  br label %mir.bb5, !dbg !418

mir.bb4:                                          ; No predecessors!
  br label %mir.bb3, !dbg !418

mir.bb5:                                          ; preds = %mir.bb3
  %32 = load i32, ptr %8, align 4, !dbg !420
  store i32 %32, ptr %7, align 4, !dbg !420
  %33 = load i32, ptr %7, align 4, !dbg !420
  %34 = icmp slt i32 %33, 0, !dbg !420
  store i1 %34, ptr %6, align 1, !dbg !420
  %35 = load i1, ptr %6, align 1, !dbg !420
  br i1 %35, label %mir.bb6, label %mir.bb7, !dbg !420

mir.bb6:                                          ; preds = %mir.bb5
  store { i32, i32 } zeroinitializer, ptr %5, align 4, !dbg !420
  %36 = getelementptr inbounds nuw { i32, i32 }, ptr %5, i32 0, i32 0, !dbg !420
  store i32 1, ptr %36, align 4, !dbg !420
  %37 = load { i32, i32 }, ptr %5, align 4, !dbg !420
  store { i32, i32 } %37, ptr %4, align 4, !dbg !420
  %38 = load { i32, i32 }, ptr %4, align 4, !dbg !420
  store { i32, i32 } %38, ptr %15, align 4, !dbg !420
  %39 = load { i32, i32 }, ptr %15, align 4, !dbg !420
  ret { i32, i32 } %39, !dbg !420

mir.bb7:                                          ; preds = %mir.bb5
  br label %mir.bb8, !dbg !420

mir.bb8:                                          ; preds = %mir.bb9, %mir.bb7
  store { i32, i32 } zeroinitializer, ptr %3, align 4, !dbg !422
  %40 = getelementptr inbounds nuw { i32, i32 }, ptr %3, i32 0, i32 0, !dbg !422
  store i32 0, ptr %40, align 4, !dbg !422
  %41 = getelementptr inbounds nuw { i32, i32 }, ptr %3, i32 0, i32 1, !dbg !422
  %42 = load i32, ptr %7, align 4, !dbg !422
  store i32 %42, ptr %41, align 4, !dbg !422
  %43 = load { i32, i32 }, ptr %3, align 4, !dbg !422
  store { i32, i32 } %43, ptr %2, align 4, !dbg !422
  %44 = load { i32, i32 }, ptr %2, align 4, !dbg !422
  store { i32, i32 } %44, ptr %15, align 4, !dbg !422
  %45 = load { i32, i32 }, ptr %15, align 4, !dbg !422
  ret { i32, i32 } %45, !dbg !422

mir.bb9:                                          ; No predecessors!
  br label %mir.bb8, !dbg !422

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !422
}

define internal %__with.Vec.str @Regex.capture_names(ptr %0) !dbg !424 {
entry:
  %1 = alloca i32, align 4, !dbg !425
  %2 = alloca %str, align 8, !dbg !425
  %3 = alloca i1, align 1, !dbg !425
  %4 = alloca i32, align 4, !dbg !425
  %5 = alloca i32, align 4, !dbg !425
  %6 = alloca i32, align 4, !dbg !425
  %7 = alloca i1, align 1, !dbg !425
  %8 = alloca i64, align 8, !dbg !425
  %9 = alloca %__with.Vec.str, align 8, !dbg !425
  %10 = alloca %__with.Vec.str.0, align 8, !dbg !425
  %11 = alloca %__with.Vec.str.0, align 8, !dbg !425
  %12 = alloca ptr, align 8, !dbg !425
  %13 = alloca %__with.Vec.str, align 8, !dbg !425
  store ptr %0, ptr %12, align 8, !dbg !425
  br label %mir.bb0, !dbg !425

mir.bb0:                                          ; preds = %entry
  %14 = alloca %__with.Vec.str.0, align 8, !dbg !425
  store %__with.Vec.str.0 zeroinitializer, ptr %14, align 8, !dbg !425
  call void @with_vec_new_out(ptr %14, i64 16), !dbg !425
  %15 = load %__with.Vec.str.0, ptr %14, align 8, !dbg !425
  store %__with.Vec.str.0 %15, ptr %11, align 8, !dbg !425
  br label %mir.bb1, !dbg !425

mir.bb1:                                          ; preds = %mir.bb0
  %16 = load %__with.Vec.str.0, ptr %11, align 8, !dbg !426
  store %__with.Vec.str.0 %16, ptr %10, align 8, !dbg !426
  %17 = load %__with.Vec.str, ptr %10, align 8, !dbg !426
  store %__with.Vec.str %17, ptr %9, align 8, !dbg !426
  %18 = load ptr, ptr %12, align 8, !dbg !426
  %19 = getelementptr inbounds nuw %Regex, ptr %18, i32 0, i32 0, !dbg !426
  %20 = load ptr, ptr %19, align 8, !dbg !426
  %21 = ptrtoint ptr %20 to i64, !dbg !426
  store i64 %21, ptr %8, align 8, !dbg !426
  %22 = load i64, ptr %8, align 8, !dbg !426
  %23 = icmp eq i64 %22, 0, !dbg !426
  store i1 %23, ptr %7, align 1, !dbg !426
  %24 = load i1, ptr %7, align 1, !dbg !426
  br i1 %24, label %mir.bb2, label %mir.bb3, !dbg !426

mir.bb2:                                          ; preds = %mir.bb1
  %25 = load %__with.Vec.str, ptr %9, align 8, !dbg !428
  store %__with.Vec.str %25, ptr %13, align 8, !dbg !428
  %26 = load %__with.Vec.str, ptr %13, align 8, !dbg !428
  ret %__with.Vec.str %26, !dbg !428

mir.bb3:                                          ; preds = %mir.bb1
  br label %mir.bb4, !dbg !428

mir.bb4:                                          ; preds = %mir.bb5, %mir.bb3
  %27 = load ptr, ptr %12, align 8, !dbg !430
  %28 = getelementptr inbounds nuw %Regex, ptr %27, i32 0, i32 0, !dbg !430
  %29 = load ptr, ptr %28, align 8, !dbg !430
  %30 = call i32 @with_regex_capture_name_count(ptr %29), !dbg !430
  store i32 %30, ptr %6, align 4, !dbg !430
  br label %mir.bb6, !dbg !430

mir.bb5:                                          ; No predecessors!
  br label %mir.bb4, !dbg !430

mir.bb6:                                          ; preds = %mir.bb4
  %31 = load i32, ptr %6, align 4, !dbg !432
  store i32 %31, ptr %5, align 4, !dbg !432
  store i32 0, ptr %4, align 4, !dbg !432
  br label %mir.bb7, !dbg !432

mir.bb7:                                          ; preds = %mir.bb11, %mir.bb6
  %32 = load i32, ptr %4, align 4, !dbg !434
  %33 = load i32, ptr %5, align 4, !dbg !434
  %34 = icmp slt i32 %32, %33, !dbg !434
  store i1 %34, ptr %3, align 1, !dbg !434
  %35 = load i1, ptr %3, align 1, !dbg !434
  br i1 %35, label %mir.bb8, label %mir.bb9, !dbg !434

mir.bb8:                                          ; preds = %mir.bb7
  %36 = load ptr, ptr %12, align 8, !dbg !434
  %37 = getelementptr inbounds nuw %Regex, ptr %36, i32 0, i32 0, !dbg !434
  %38 = load ptr, ptr %37, align 8, !dbg !434
  %39 = load i32, ptr %4, align 4, !dbg !434
  %40 = call %str @with_regex_capture_name_at(ptr %38, i32 %39), !dbg !434
  store %str %40, ptr %2, align 8, !dbg !434
  br label %mir.bb10, !dbg !434

mir.bb9:                                          ; preds = %mir.bb7
  %41 = load %__with.Vec.str, ptr %9, align 8, !dbg !434
  store %__with.Vec.str %41, ptr %13, align 8, !dbg !434
  %42 = load %__with.Vec.str, ptr %13, align 8, !dbg !434
  ret %__with.Vec.str %42, !dbg !434

mir.bb10:                                         ; preds = %mir.bb8
  %43 = load %str, ptr %2, align 8, !dbg !434
  %44 = alloca %str, align 8, !dbg !434
  store %str %43, ptr %44, align 8, !dbg !434
  call void @with_vec_push(ptr %9, ptr %44), !dbg !434
  br label %mir.bb11, !dbg !434

mir.bb11:                                         ; preds = %mir.bb10
  %45 = load i32, ptr %4, align 4, !dbg !436
  %46 = add nsw i32 %45, 1, !dbg !436
  store i32 %46, ptr %1, align 4, !dbg !436
  %47 = load i32, ptr %1, align 4, !dbg !436
  store i32 %47, ptr %4, align 4, !dbg !436
  br label %mir.bb7, !dbg !436

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !436
}

define internal { i32, %Captures } @Regex.captures(ptr %0, %str %1) !dbg !438 {
entry:
  %2 = alloca { i32, %Captures }, align 8, !dbg !439
  %3 = alloca %str, align 8, !dbg !439
  %4 = alloca ptr, align 8, !dbg !439
  %5 = alloca { i32, %Captures }, align 8, !dbg !439
  store ptr %0, ptr %4, align 8, !dbg !439
  store %str %1, ptr %3, align 8, !dbg !439
  br label %mir.bb0, !dbg !439

mir.bb0:                                          ; preds = %entry
  %6 = load ptr, ptr %4, align 8, !dbg !439
  %7 = load %str, ptr %3, align 8, !dbg !439
  %8 = call { i32, %Captures } @Regex.captures_at(ptr %6, %str %7, i32 0), !dbg !439
  store { i32, %Captures } %8, ptr %2, align 8, !dbg !439
  br label %mir.bb1, !dbg !439

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load { i32, %Captures }, ptr %2, align 8, !dbg !440
  store { i32, %Captures } %9, ptr %5, align 8, !dbg !440
  %10 = load { i32, %Captures }, ptr %5, align 8, !dbg !440
  ret { i32, %Captures } %10, !dbg !440
}

define internal { i32, %Captures } @Regex.captures_at(ptr %0, %str %1, i32 %2) !dbg !442 {
entry:
  %3 = alloca { i32, %Captures }, align 8, !dbg !443
  %4 = alloca { i32, %Captures }, align 8, !dbg !443
  %5 = alloca %Captures, align 8, !dbg !443
  %6 = alloca %Captures, align 8, !dbg !443
  %7 = alloca i32, align 4, !dbg !443
  %8 = alloca ptr, align 8, !dbg !443
  %9 = alloca ptr, align 8, !dbg !443
  %10 = alloca ptr, align 8, !dbg !443
  %11 = alloca i64, align 8, !dbg !443
  %12 = alloca i64, align 8, !dbg !443
  %13 = alloca i64, align 8, !dbg !443
  %14 = alloca i64, align 8, !dbg !443
  %15 = alloca i1, align 1, !dbg !443
  %16 = alloca i32, align 4, !dbg !443
  %17 = alloca %__with.Vec.i32, align 8, !dbg !443
  %18 = alloca %__with.Vec.i32.1, align 8, !dbg !443
  %19 = alloca %__with.Vec.i32.1, align 8, !dbg !443
  %20 = alloca { i32, %Captures }, align 8, !dbg !443
  %21 = alloca { i32, %Captures }, align 8, !dbg !443
  %22 = alloca i1, align 1, !dbg !443
  %23 = alloca i1, align 1, !dbg !443
  %24 = alloca i1, align 1, !dbg !443
  %25 = alloca i64, align 8, !dbg !443
  %26 = alloca ptr, align 8, !dbg !443
  %27 = alloca ptr, align 8, !dbg !443
  %28 = alloca ptr, align 8, !dbg !443
  %29 = alloca i32, align 4, !dbg !443
  %30 = alloca { i32, %Captures }, align 8, !dbg !443
  %31 = alloca { i32, %Captures }, align 8, !dbg !443
  %32 = alloca i1, align 1, !dbg !443
  %33 = alloca i64, align 8, !dbg !443
  %34 = alloca i32, align 4, !dbg !443
  %35 = alloca %str, align 8, !dbg !443
  %36 = alloca ptr, align 8, !dbg !443
  %37 = alloca { i32, %Captures }, align 8, !dbg !443
  store ptr %0, ptr %36, align 8, !dbg !443
  store %str %1, ptr %35, align 8, !dbg !443
  store i32 %2, ptr %34, align 4, !dbg !443
  br label %mir.bb0, !dbg !443

mir.bb0:                                          ; preds = %entry
  %38 = load ptr, ptr %36, align 8, !dbg !443
  %39 = getelementptr inbounds nuw %Regex, ptr %38, i32 0, i32 0, !dbg !443
  %40 = load ptr, ptr %39, align 8, !dbg !443
  %41 = ptrtoint ptr %40 to i64, !dbg !443
  store i64 %41, ptr %33, align 8, !dbg !443
  %42 = load i64, ptr %33, align 8, !dbg !443
  %43 = icmp eq i64 %42, 0, !dbg !443
  store i1 %43, ptr %32, align 1, !dbg !443
  %44 = load i1, ptr %32, align 1, !dbg !443
  br i1 %44, label %mir.bb1, label %mir.bb2, !dbg !443

mir.bb1:                                          ; preds = %mir.bb0
  store { i32, %Captures } zeroinitializer, ptr %31, align 8, !dbg !443
  %45 = getelementptr inbounds nuw { i32, %Captures }, ptr %31, i32 0, i32 0, !dbg !443
  store i32 1, ptr %45, align 4, !dbg !443
  %46 = load { i32, %Captures }, ptr %31, align 8, !dbg !443
  store { i32, %Captures } %46, ptr %30, align 8, !dbg !443
  %47 = load { i32, %Captures }, ptr %30, align 8, !dbg !443
  store { i32, %Captures } %47, ptr %37, align 8, !dbg !443
  %48 = load { i32, %Captures }, ptr %37, align 8, !dbg !443
  ret { i32, %Captures } %48, !dbg !443

mir.bb2:                                          ; preds = %mir.bb0
  br label %mir.bb3, !dbg !443

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb2
  store i32 0, ptr %29, align 4, !dbg !444
  store ptr %29, ptr %28, align 8, !dbg !444
  %49 = load ptr, ptr %36, align 8, !dbg !444
  %50 = getelementptr inbounds nuw %Regex, ptr %49, i32 0, i32 0, !dbg !444
  %51 = load ptr, ptr %50, align 8, !dbg !444
  %52 = load %str, ptr %35, align 8, !dbg !444
  %53 = load i32, ptr %34, align 4, !dbg !444
  %54 = load ptr, ptr %28, align 8, !dbg !444
  %55 = call ptr @with_regex_match_spans_alloc_at(ptr %51, %str %52, i32 %53, ptr %54), !dbg !444
  store ptr %55, ptr %27, align 8, !dbg !444
  br label %mir.bb5, !dbg !444

mir.bb4:                                          ; No predecessors!
  br label %mir.bb3, !dbg !444

mir.bb5:                                          ; preds = %mir.bb3
  %56 = load ptr, ptr %27, align 8, !dbg !446
  store ptr %56, ptr %26, align 8, !dbg !446
  %57 = load ptr, ptr %26, align 8, !dbg !446
  %58 = ptrtoint ptr %57 to i64, !dbg !446
  store i64 %58, ptr %25, align 8, !dbg !446
  %59 = load i64, ptr %25, align 8, !dbg !446
  %60 = icmp eq i64 %59, 0, !dbg !446
  store i1 %60, ptr %24, align 1, !dbg !446
  %61 = load i1, ptr %24, align 1, !dbg !446
  store i1 %61, ptr %23, align 1, !dbg !446
  %62 = load i1, ptr %23, align 1, !dbg !446
  br i1 %62, label %mir.bb7, label %mir.bb6, !dbg !446

mir.bb6:                                          ; preds = %mir.bb5
  %63 = load i32, ptr %29, align 4, !dbg !448
  %64 = icmp sle i32 %63, 0, !dbg !448
  store i1 %64, ptr %22, align 1, !dbg !448
  %65 = load i1, ptr %22, align 1, !dbg !448
  store i1 %65, ptr %23, align 1, !dbg !448
  br label %mir.bb7, !dbg !448

mir.bb7:                                          ; preds = %mir.bb6, %mir.bb5
  %66 = load i1, ptr %23, align 1, !dbg !448
  br i1 %66, label %mir.bb8, label %mir.bb9, !dbg !448

mir.bb8:                                          ; preds = %mir.bb7
  store { i32, %Captures } zeroinitializer, ptr %21, align 8, !dbg !448
  %67 = getelementptr inbounds nuw { i32, %Captures }, ptr %21, i32 0, i32 0, !dbg !448
  store i32 1, ptr %67, align 4, !dbg !448
  %68 = load { i32, %Captures }, ptr %21, align 8, !dbg !448
  store { i32, %Captures } %68, ptr %20, align 8, !dbg !448
  %69 = load { i32, %Captures }, ptr %20, align 8, !dbg !448
  store { i32, %Captures } %69, ptr %37, align 8, !dbg !448
  %70 = load { i32, %Captures }, ptr %37, align 8, !dbg !448
  ret { i32, %Captures } %70, !dbg !448

mir.bb9:                                          ; preds = %mir.bb7
  br label %mir.bb10, !dbg !448

mir.bb10:                                         ; preds = %mir.bb11, %mir.bb9
  %71 = alloca %__with.Vec.i32.1, align 8, !dbg !450
  store %__with.Vec.i32.1 zeroinitializer, ptr %71, align 8, !dbg !450
  call void @with_vec_new_out(ptr %71, i64 4), !dbg !450
  %72 = load %__with.Vec.i32.1, ptr %71, align 8, !dbg !450
  store %__with.Vec.i32.1 %72, ptr %19, align 8, !dbg !450
  br label %mir.bb12, !dbg !450

mir.bb11:                                         ; No predecessors!
  br label %mir.bb10, !dbg !450

mir.bb12:                                         ; preds = %mir.bb10
  %73 = load %__with.Vec.i32.1, ptr %19, align 8, !dbg !452
  store %__with.Vec.i32.1 %73, ptr %18, align 8, !dbg !452
  %74 = load %__with.Vec.i32, ptr %18, align 8, !dbg !452
  store %__with.Vec.i32 %74, ptr %17, align 8, !dbg !452
  store i32 0, ptr %16, align 4, !dbg !452
  br label %mir.bb13, !dbg !452

mir.bb13:                                         ; preds = %mir.bb16, %mir.bb12
  %75 = load i32, ptr %16, align 4, !dbg !454
  %76 = load i32, ptr %29, align 4, !dbg !454
  %77 = icmp slt i32 %75, %76, !dbg !454
  store i1 %77, ptr %15, align 1, !dbg !454
  %78 = load i1, ptr %15, align 1, !dbg !454
  br i1 %78, label %mir.bb14, label %mir.bb15, !dbg !454

mir.bb14:                                         ; preds = %mir.bb13
  %79 = load ptr, ptr %26, align 8, !dbg !456
  %80 = ptrtoint ptr %79 to i64, !dbg !456
  store i64 %80, ptr %14, align 8, !dbg !456
  %81 = load i32, ptr %16, align 4, !dbg !456
  %82 = sext i32 %81 to i64, !dbg !456
  store i64 %82, ptr %13, align 8, !dbg !456
  %83 = load i64, ptr %13, align 8, !dbg !456
  %84 = mul nsw i64 %83, 4, !dbg !456
  store i64 %84, ptr %12, align 8, !dbg !456
  %85 = load i64, ptr %14, align 8, !dbg !456
  %86 = load i64, ptr %12, align 8, !dbg !456
  %87 = add nsw i64 %85, %86, !dbg !456
  store i64 %87, ptr %11, align 8, !dbg !456
  %88 = load i64, ptr %11, align 8, !dbg !456
  %89 = inttoptr i64 %88 to ptr, !dbg !456
  store ptr %89, ptr %10, align 8, !dbg !456
  %90 = load ptr, ptr %10, align 8, !dbg !456
  store ptr %90, ptr %9, align 8, !dbg !456
  %91 = load ptr, ptr %9, align 8, !dbg !456
  %92 = load i32, ptr %91, align 4, !dbg !456
  %93 = alloca i32, align 4, !dbg !456
  store i32 %92, ptr %93, align 4, !dbg !456
  call void @with_vec_push(ptr %17, ptr %93), !dbg !456
  br label %mir.bb16, !dbg !456

mir.bb15:                                         ; preds = %mir.bb13
  %94 = load ptr, ptr %26, align 8, !dbg !458
  store ptr %94, ptr %8, align 8, !dbg !458
  %95 = load ptr, ptr %8, align 8, !dbg !458
  call void @with_free(ptr %95), !dbg !458
  br label %mir.bb17, !dbg !458

mir.bb16:                                         ; preds = %mir.bb14
  %96 = load i32, ptr %16, align 4, !dbg !460
  %97 = add nsw i32 %96, 1, !dbg !460
  store i32 %97, ptr %7, align 4, !dbg !460
  %98 = load i32, ptr %7, align 4, !dbg !460
  store i32 %98, ptr %16, align 4, !dbg !460
  br label %mir.bb13, !dbg !460

mir.bb17:                                         ; preds = %mir.bb15
  store %Captures zeroinitializer, ptr %6, align 8, !dbg !462
  %99 = load ptr, ptr %36, align 8, !dbg !462
  %100 = getelementptr inbounds nuw %Regex, ptr %99, i32 0, i32 0, !dbg !462
  %101 = load ptr, ptr %100, align 8, !dbg !462
  %102 = getelementptr inbounds nuw %Captures, ptr %6, i32 0, i32 0, !dbg !462
  store ptr %101, ptr %102, align 8, !dbg !462
  %103 = load %str, ptr %35, align 8, !dbg !462
  %104 = getelementptr inbounds nuw %Captures, ptr %6, i32 0, i32 1, !dbg !462
  store %str %103, ptr %104, align 8, !dbg !462
  %105 = load %__with.Vec.i32, ptr %17, align 8, !dbg !462
  %106 = getelementptr inbounds nuw %Captures, ptr %6, i32 0, i32 2, !dbg !462
  store %__with.Vec.i32 %105, ptr %106, align 8, !dbg !462
  %107 = load %Captures, ptr %6, align 8, !dbg !462
  store %Captures %107, ptr %5, align 8, !dbg !462
  store { i32, %Captures } zeroinitializer, ptr %4, align 8, !dbg !462
  %108 = getelementptr inbounds nuw { i32, %Captures }, ptr %4, i32 0, i32 0, !dbg !462
  store i32 0, ptr %108, align 4, !dbg !462
  %109 = getelementptr inbounds nuw { i32, %Captures }, ptr %4, i32 0, i32 1, !dbg !462
  %110 = load %Captures, ptr %5, align 8, !dbg !462
  store %Captures %110, ptr %109, align 8, !dbg !462
  %111 = load { i32, %Captures }, ptr %4, align 8, !dbg !462
  store { i32, %Captures } %111, ptr %3, align 8, !dbg !462
  %112 = load { i32, %Captures }, ptr %3, align 8, !dbg !462
  store { i32, %Captures } %112, ptr %37, align 8, !dbg !462
  %113 = load { i32, %Captures }, ptr %37, align 8, !dbg !462
  ret { i32, %Captures } %113, !dbg !462

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !462
}

define internal i1 @Regex.is_match(ptr %0, %str %1) !dbg !464 {
entry:
  %2 = alloca i1, align 1, !dbg !465
  %3 = alloca { i32, %Captures }, align 8, !dbg !465
  %4 = alloca %str, align 8, !dbg !465
  %5 = alloca ptr, align 8, !dbg !465
  %6 = alloca i1, align 1, !dbg !465
  store ptr %0, ptr %5, align 8, !dbg !465
  store %str %1, ptr %4, align 8, !dbg !465
  br label %mir.bb0, !dbg !465

mir.bb0:                                          ; preds = %entry
  %7 = load ptr, ptr %5, align 8, !dbg !465
  %8 = load %str, ptr %4, align 8, !dbg !465
  %9 = call { i32, %Captures } @Regex.captures(ptr %7, %str %8), !dbg !465
  store { i32, %Captures } %9, ptr %3, align 8, !dbg !465
  br label %mir.bb1, !dbg !465

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load { i32, %Captures }, ptr %3, align 8, !dbg !465
  %11 = extractvalue { i32, %Captures } %10, 0, !dbg !465
  %12 = icmp eq i32 %11, 0, !dbg !465
  store i1 %12, ptr %2, align 1, !dbg !465
  br label %mir.bb2, !dbg !465

mir.bb2:                                          ; preds = %mir.bb1
  %13 = load i1, ptr %2, align 1, !dbg !466
  store i1 %13, ptr %6, align 1, !dbg !466
  %14 = load i1, ptr %6, align 1, !dbg !466
  ret i1 %14, !dbg !466
}

define internal { i32, %Captures } @Regex.captures_match_op(ptr %0, %str %1) !dbg !468 {
entry:
  %2 = alloca { i32, %Captures }, align 8, !dbg !469
  %3 = alloca { i32, %Captures }, align 8, !dbg !469
  %4 = alloca { i32, %Captures }, align 8, !dbg !469
  %5 = alloca { i32, %Captures }, align 8, !dbg !469
  %6 = alloca i32, align 4, !dbg !469
  %7 = alloca i32, align 4, !dbg !469
  %8 = alloca i32, align 4, !dbg !469
  %9 = alloca i64, align 8, !dbg !469
  %10 = alloca i1, align 1, !dbg !469
  %11 = alloca i32, align 4, !dbg !469
  %12 = alloca { i32, %Captures }, align 8, !dbg !469
  %13 = alloca { i32, %Captures }, align 8, !dbg !469
  %14 = alloca i64, align 8, !dbg !469
  %15 = alloca i32, align 4, !dbg !469
  %16 = alloca i1, align 1, !dbg !469
  %17 = alloca %Match, align 8, !dbg !469
  %18 = alloca { i32, %Captures }, align 8, !dbg !469
  %19 = alloca i32, align 4, !dbg !469
  %20 = alloca { i32, %Match }, align 8, !dbg !469
  %21 = alloca i32, align 4, !dbg !469
  %22 = alloca { i32, %Match }, align 8, !dbg !469
  %23 = alloca { i32, %Captures }, align 8, !dbg !469
  %24 = alloca %Captures, align 8, !dbg !469
  %25 = alloca i32, align 4, !dbg !469
  %26 = alloca { i32, %Captures }, align 8, !dbg !469
  %27 = alloca { i32, %Captures }, align 8, !dbg !469
  %28 = alloca i32, align 4, !dbg !469
  %29 = alloca i1, align 1, !dbg !469
  %30 = alloca i1, align 1, !dbg !469
  %31 = alloca i1, align 1, !dbg !469
  %32 = alloca i64, align 8, !dbg !469
  %33 = alloca i64, align 8, !dbg !469
  %34 = alloca i64, align 8, !dbg !469
  %35 = alloca i64, align 8, !dbg !469
  %36 = alloca ptr, align 8, !dbg !469
  %37 = alloca ptr, align 8, !dbg !469
  %38 = alloca ptr, align 8, !dbg !469
  %39 = alloca { i32, %Captures }, align 8, !dbg !469
  %40 = alloca i1, align 1, !dbg !469
  %41 = alloca i64, align 8, !dbg !469
  %42 = alloca i1, align 1, !dbg !469
  %43 = alloca i1, align 1, !dbg !469
  %44 = alloca i64, align 8, !dbg !469
  %45 = alloca i1, align 1, !dbg !469
  %46 = alloca i1, align 1, !dbg !469
  %47 = alloca i64, align 8, !dbg !469
  %48 = alloca i1, align 1, !dbg !469
  %49 = alloca i1, align 1, !dbg !469
  %50 = alloca i1, align 1, !dbg !469
  %51 = alloca %str, align 8, !dbg !469
  %52 = alloca ptr, align 8, !dbg !469
  %53 = alloca { i32, %Captures }, align 8, !dbg !469
  store ptr %0, ptr %52, align 8, !dbg !469
  store %str %1, ptr %51, align 8, !dbg !469
  br label %mir.bb0, !dbg !469

mir.bb0:                                          ; preds = %entry
  %54 = load ptr, ptr %52, align 8, !dbg !469
  %55 = call i1 @Regex.is_global(ptr %54), !dbg !469
  store i1 %55, ptr %50, align 1, !dbg !469
  br label %mir.bb1, !dbg !469

mir.bb1:                                          ; preds = %mir.bb0
  %56 = load i1, ptr %50, align 1, !dbg !470
  %57 = xor i1 %56, true, !dbg !470
  store i1 %57, ptr %49, align 1, !dbg !470
  %58 = load i1, ptr %49, align 1, !dbg !470
  store i1 %58, ptr %48, align 1, !dbg !470
  %59 = load i1, ptr %48, align 1, !dbg !470
  br i1 %59, label %mir.bb3, label %mir.bb2, !dbg !470

mir.bb2:                                          ; preds = %mir.bb1
  %60 = load ptr, ptr %52, align 8, !dbg !472
  %61 = getelementptr inbounds nuw %Regex, ptr %60, i32 0, i32 7, !dbg !472
  %62 = load ptr, ptr %61, align 8, !dbg !472
  %63 = ptrtoint ptr %62 to i64, !dbg !472
  store i64 %63, ptr %47, align 8, !dbg !472
  %64 = load i64, ptr %47, align 8, !dbg !472
  %65 = icmp eq i64 %64, 0, !dbg !472
  store i1 %65, ptr %46, align 1, !dbg !472
  %66 = load i1, ptr %46, align 1, !dbg !472
  store i1 %66, ptr %48, align 1, !dbg !472
  br label %mir.bb3, !dbg !472

mir.bb3:                                          ; preds = %mir.bb2, %mir.bb1
  %67 = load i1, ptr %48, align 1, !dbg !474
  store i1 %67, ptr %45, align 1, !dbg !474
  %68 = load i1, ptr %45, align 1, !dbg !474
  br i1 %68, label %mir.bb5, label %mir.bb4, !dbg !474

mir.bb4:                                          ; preds = %mir.bb3
  %69 = load ptr, ptr %52, align 8, !dbg !476
  %70 = getelementptr inbounds nuw %Regex, ptr %69, i32 0, i32 8, !dbg !476
  %71 = load ptr, ptr %70, align 8, !dbg !476
  %72 = ptrtoint ptr %71 to i64, !dbg !476
  store i64 %72, ptr %44, align 8, !dbg !476
  %73 = load i64, ptr %44, align 8, !dbg !476
  %74 = icmp eq i64 %73, 0, !dbg !476
  store i1 %74, ptr %43, align 1, !dbg !476
  %75 = load i1, ptr %43, align 1, !dbg !476
  store i1 %75, ptr %45, align 1, !dbg !476
  br label %mir.bb5, !dbg !476

mir.bb5:                                          ; preds = %mir.bb4, %mir.bb3
  %76 = load i1, ptr %45, align 1, !dbg !478
  store i1 %76, ptr %42, align 1, !dbg !478
  %77 = load i1, ptr %42, align 1, !dbg !478
  br i1 %77, label %mir.bb7, label %mir.bb6, !dbg !478

mir.bb6:                                          ; preds = %mir.bb5
  %78 = load ptr, ptr %52, align 8, !dbg !480
  %79 = getelementptr inbounds nuw %Regex, ptr %78, i32 0, i32 9, !dbg !480
  %80 = load ptr, ptr %79, align 8, !dbg !480
  %81 = ptrtoint ptr %80 to i64, !dbg !480
  store i64 %81, ptr %41, align 8, !dbg !480
  %82 = load i64, ptr %41, align 8, !dbg !480
  %83 = icmp eq i64 %82, 0, !dbg !480
  store i1 %83, ptr %40, align 1, !dbg !480
  %84 = load i1, ptr %40, align 1, !dbg !480
  store i1 %84, ptr %42, align 1, !dbg !480
  br label %mir.bb7, !dbg !480

mir.bb7:                                          ; preds = %mir.bb6, %mir.bb5
  %85 = load i1, ptr %42, align 1, !dbg !480
  br i1 %85, label %mir.bb8, label %mir.bb9, !dbg !480

mir.bb8:                                          ; preds = %mir.bb7
  %86 = load ptr, ptr %52, align 8, !dbg !480
  %87 = load %str, ptr %51, align 8, !dbg !480
  %88 = call { i32, %Captures } @Regex.captures(ptr %86, %str %87), !dbg !480
  store { i32, %Captures } %88, ptr %39, align 8, !dbg !480
  br label %mir.bb11, !dbg !480

mir.bb9:                                          ; preds = %mir.bb7
  br label %mir.bb10, !dbg !480

mir.bb10:                                         ; preds = %mir.bb12, %mir.bb9
  store ptr %51, ptr %38, align 8, !dbg !482
  %89 = load ptr, ptr %38, align 8, !dbg !482
  store ptr %89, ptr %37, align 8, !dbg !482
  %90 = load ptr, ptr %37, align 8, !dbg !482
  store ptr %90, ptr %36, align 8, !dbg !482
  %91 = load ptr, ptr %36, align 8, !dbg !482
  %92 = load ptr, ptr %91, align 8, !dbg !482
  %93 = ptrtoint ptr %92 to i64, !dbg !482
  store i64 %93, ptr %35, align 8, !dbg !482
  %94 = load i64, ptr %35, align 8, !dbg !482
  store i64 %94, ptr %34, align 8, !dbg !482
  %95 = load %str, ptr %51, align 8, !dbg !482
  %96 = extractvalue %str %95, 1, !dbg !482
  store i64 %96, ptr %33, align 8, !dbg !482
  br label %mir.bb13, !dbg !482

mir.bb11:                                         ; preds = %mir.bb8
  %97 = load { i32, %Captures }, ptr %39, align 8, !dbg !484
  store { i32, %Captures } %97, ptr %53, align 8, !dbg !484
  %98 = load { i32, %Captures }, ptr %53, align 8, !dbg !484
  ret { i32, %Captures } %98, !dbg !484

mir.bb12:                                         ; No predecessors!
  br label %mir.bb10, !dbg !484

mir.bb13:                                         ; preds = %mir.bb10
  %99 = load i64, ptr %33, align 8, !dbg !486
  store i64 %99, ptr %32, align 8, !dbg !486
  %100 = load ptr, ptr %52, align 8, !dbg !486
  %101 = getelementptr inbounds nuw %Regex, ptr %100, i32 0, i32 8, !dbg !486
  %102 = load ptr, ptr %101, align 8, !dbg !486
  %103 = load i64, ptr %102, align 8, !dbg !486
  %104 = load i64, ptr %34, align 8, !dbg !486
  %105 = icmp ne i64 %103, %104, !dbg !486
  store i1 %105, ptr %31, align 1, !dbg !486
  %106 = load i1, ptr %31, align 1, !dbg !486
  store i1 %106, ptr %30, align 1, !dbg !486
  %107 = load i1, ptr %30, align 1, !dbg !486
  br i1 %107, label %mir.bb15, label %mir.bb14, !dbg !486

mir.bb14:                                         ; preds = %mir.bb13
  %108 = load ptr, ptr %52, align 8, !dbg !488
  %109 = getelementptr inbounds nuw %Regex, ptr %108, i32 0, i32 9, !dbg !488
  %110 = load ptr, ptr %109, align 8, !dbg !488
  %111 = load i64, ptr %110, align 8, !dbg !488
  %112 = load i64, ptr %32, align 8, !dbg !488
  %113 = icmp ne i64 %111, %112, !dbg !488
  store i1 %113, ptr %29, align 1, !dbg !488
  %114 = load i1, ptr %29, align 1, !dbg !488
  store i1 %114, ptr %30, align 1, !dbg !488
  br label %mir.bb15, !dbg !488

mir.bb15:                                         ; preds = %mir.bb14, %mir.bb13
  %115 = load i1, ptr %30, align 1, !dbg !488
  br i1 %115, label %mir.bb16, label %mir.bb17, !dbg !488

mir.bb16:                                         ; preds = %mir.bb15
  %116 = load ptr, ptr %52, align 8, !dbg !490
  %117 = getelementptr inbounds nuw %Regex, ptr %116, i32 0, i32 8, !dbg !490
  %118 = load ptr, ptr %117, align 8, !dbg !490
  %119 = load i64, ptr %34, align 8, !dbg !490
  store i64 %119, ptr %118, align 8, !dbg !490
  %120 = load ptr, ptr %52, align 8, !dbg !490
  %121 = getelementptr inbounds nuw %Regex, ptr %120, i32 0, i32 9, !dbg !490
  %122 = load ptr, ptr %121, align 8, !dbg !490
  %123 = load i64, ptr %32, align 8, !dbg !490
  store i64 %123, ptr %122, align 8, !dbg !490
  %124 = load ptr, ptr %52, align 8, !dbg !490
  %125 = getelementptr inbounds nuw %Regex, ptr %124, i32 0, i32 7, !dbg !490
  %126 = load ptr, ptr %125, align 8, !dbg !490
  store i32 0, ptr %126, align 4, !dbg !490
  br label %mir.bb18, !dbg !490

mir.bb17:                                         ; preds = %mir.bb15
  br label %mir.bb18, !dbg !490

mir.bb18:                                         ; preds = %mir.bb17, %mir.bb16
  %127 = load ptr, ptr %52, align 8, !dbg !492
  %128 = getelementptr inbounds nuw %Regex, ptr %127, i32 0, i32 7, !dbg !492
  %129 = load ptr, ptr %128, align 8, !dbg !492
  %130 = load i32, ptr %129, align 4, !dbg !492
  store i32 %130, ptr %28, align 4, !dbg !492
  %131 = load ptr, ptr %52, align 8, !dbg !492
  %132 = load %str, ptr %51, align 8, !dbg !492
  %133 = load i32, ptr %28, align 4, !dbg !492
  %134 = call { i32, %Captures } @Regex.captures_at(ptr %131, %str %132, i32 %133), !dbg !492
  store { i32, %Captures } %134, ptr %27, align 8, !dbg !492
  br label %mir.bb19, !dbg !492

mir.bb19:                                         ; preds = %mir.bb18
  %135 = load { i32, %Captures }, ptr %27, align 8, !dbg !494
  store { i32, %Captures } %135, ptr %26, align 8, !dbg !494
  %136 = load { i32, %Captures }, ptr %26, align 8, !dbg !494
  %137 = extractvalue { i32, %Captures } %136, 0, !dbg !494
  store i32 %137, ptr %25, align 4, !dbg !494
  %138 = load i32, ptr %25, align 4, !dbg !494
  switch i32 %138, label %mir.bb22 [
    i32 0, label %mir.bb21
  ], !dbg !494

mir.bb20:                                         ; preds = %mir.bb36, %mir.bb24, %mir.bb22
  %139 = load { i32, %Captures }, ptr %23, align 8, !dbg !494
  store { i32, %Captures } %139, ptr %53, align 8, !dbg !494
  %140 = load { i32, %Captures }, ptr %53, align 8, !dbg !494
  ret { i32, %Captures } %140, !dbg !494

mir.bb21:                                         ; preds = %mir.bb19
  %141 = getelementptr inbounds nuw { i32, %Captures }, ptr %26, i32 0, i32 1, !dbg !496
  %142 = getelementptr inbounds nuw { %Captures }, ptr %141, i32 0, i32 0, !dbg !496
  %143 = load %Captures, ptr %142, align 8, !dbg !496
  store %Captures %143, ptr %24, align 8, !dbg !496
  %144 = load %Captures, ptr %24, align 8, !dbg !496
  %145 = call { i32, %Match } @Captures.get(ptr %24, i32 0), !dbg !496
  store { i32, %Match } %145, ptr %22, align 8, !dbg !496
  br label %mir.bb23, !dbg !496

mir.bb22:                                         ; preds = %mir.bb19
  %146 = load { i32, %Captures }, ptr %26, align 8, !dbg !496
  %147 = extractvalue { i32, %Captures } %146, 0, !dbg !496
  store i32 %147, ptr %21, align 4, !dbg !496
  %148 = load i32, ptr %21, align 4, !dbg !496
  switch i32 %148, label %mir.bb20 [
    i32 1, label %mir.bb36
  ], !dbg !496

mir.bb23:                                         ; preds = %mir.bb21
  %149 = load { i32, %Match }, ptr %22, align 8, !dbg !498
  store { i32, %Match } %149, ptr %20, align 8, !dbg !498
  %150 = load { i32, %Match }, ptr %20, align 8, !dbg !498
  %151 = extractvalue { i32, %Match } %150, 0, !dbg !498
  store i32 %151, ptr %19, align 4, !dbg !498
  %152 = load i32, ptr %19, align 4, !dbg !498
  switch i32 %152, label %mir.bb26 [
    i32 0, label %mir.bb25
  ], !dbg !498

mir.bb24:                                         ; preds = %mir.bb35, %mir.bb29, %mir.bb26
  %153 = load { i32, %Captures }, ptr %18, align 8, !dbg !500
  store { i32, %Captures } %153, ptr %23, align 8, !dbg !500
  br label %mir.bb20, !dbg !500

mir.bb25:                                         ; preds = %mir.bb23
  %154 = getelementptr inbounds nuw { i32, %Match }, ptr %20, i32 0, i32 1, !dbg !502
  %155 = getelementptr inbounds nuw { %Match }, ptr %154, i32 0, i32 0, !dbg !502
  %156 = load %Match, ptr %155, align 8, !dbg !502
  store %Match %156, ptr %17, align 8, !dbg !502
  %157 = getelementptr inbounds nuw %Match, ptr %17, i32 0, i32 2, !dbg !502
  %158 = load i32, ptr %157, align 4, !dbg !502
  %159 = getelementptr inbounds nuw %Match, ptr %17, i32 0, i32 1, !dbg !502
  %160 = load i32, ptr %159, align 4, !dbg !502
  %161 = icmp eq i32 %158, %160, !dbg !502
  store i1 %161, ptr %16, align 1, !dbg !502
  %162 = load i1, ptr %16, align 1, !dbg !502
  br i1 %162, label %mir.bb27, label %mir.bb28, !dbg !502

mir.bb26:                                         ; preds = %mir.bb23
  %163 = load { i32, %Match }, ptr %20, align 8, !dbg !502
  %164 = extractvalue { i32, %Match } %163, 0, !dbg !502
  store i32 %164, ptr %15, align 4, !dbg !502
  %165 = load i32, ptr %15, align 4, !dbg !502
  switch i32 %165, label %mir.bb24 [
    i32 1, label %mir.bb35
  ], !dbg !502

mir.bb27:                                         ; preds = %mir.bb25
  %166 = load %str, ptr %51, align 8, !dbg !502
  %167 = extractvalue %str %166, 1, !dbg !502
  store i64 %167, ptr %14, align 8, !dbg !502
  br label %mir.bb30, !dbg !502

mir.bb28:                                         ; preds = %mir.bb25
  %168 = load ptr, ptr %52, align 8, !dbg !504
  %169 = getelementptr inbounds nuw %Regex, ptr %168, i32 0, i32 7, !dbg !504
  %170 = load ptr, ptr %169, align 8, !dbg !504
  %171 = getelementptr inbounds nuw %Match, ptr %17, i32 0, i32 2, !dbg !504
  %172 = load i32, ptr %171, align 4, !dbg !504
  store i32 %172, ptr %170, align 4, !dbg !504
  br label %mir.bb29, !dbg !504

mir.bb29:                                         ; preds = %mir.bb33, %mir.bb28
  store { i32, %Captures } zeroinitializer, ptr %13, align 8, !dbg !506
  %173 = getelementptr inbounds nuw { i32, %Captures }, ptr %13, i32 0, i32 0, !dbg !506
  store i32 0, ptr %173, align 4, !dbg !506
  %174 = getelementptr inbounds nuw { i32, %Captures }, ptr %13, i32 0, i32 1, !dbg !506
  %175 = load %Captures, ptr %24, align 8, !dbg !506
  store %Captures %175, ptr %174, align 8, !dbg !506
  %176 = load { i32, %Captures }, ptr %13, align 8, !dbg !506
  store { i32, %Captures } %176, ptr %12, align 8, !dbg !506
  %177 = load { i32, %Captures }, ptr %12, align 8, !dbg !506
  store { i32, %Captures } %177, ptr %18, align 8, !dbg !506
  br label %mir.bb24, !dbg !506

mir.bb30:                                         ; preds = %mir.bb27
  %178 = load i64, ptr %14, align 8, !dbg !508
  %179 = trunc i64 %178 to i32, !dbg !508
  store i32 %179, ptr %11, align 4, !dbg !508
  %180 = getelementptr inbounds nuw %Match, ptr %17, i32 0, i32 2, !dbg !508
  %181 = load i32, ptr %180, align 4, !dbg !508
  %182 = load i32, ptr %11, align 4, !dbg !508
  %183 = icmp sge i32 %181, %182, !dbg !508
  store i1 %183, ptr %10, align 1, !dbg !508
  %184 = load i1, ptr %10, align 1, !dbg !508
  br i1 %184, label %mir.bb31, label %mir.bb32, !dbg !508

mir.bb31:                                         ; preds = %mir.bb30
  %185 = load %str, ptr %51, align 8, !dbg !508
  %186 = extractvalue %str %185, 1, !dbg !508
  store i64 %186, ptr %9, align 8, !dbg !508
  br label %mir.bb34, !dbg !508

mir.bb32:                                         ; preds = %mir.bb30
  %187 = getelementptr inbounds nuw %Match, ptr %17, i32 0, i32 2, !dbg !510
  %188 = load i32, ptr %187, align 4, !dbg !510
  %189 = add nsw i32 %188, 1, !dbg !510
  store i32 %189, ptr %8, align 4, !dbg !510
  %190 = load ptr, ptr %52, align 8, !dbg !510
  %191 = getelementptr inbounds nuw %Regex, ptr %190, i32 0, i32 7, !dbg !510
  %192 = load ptr, ptr %191, align 8, !dbg !510
  %193 = load i32, ptr %8, align 4, !dbg !510
  store i32 %193, ptr %192, align 4, !dbg !510
  br label %mir.bb33, !dbg !510

mir.bb33:                                         ; preds = %mir.bb34, %mir.bb32
  br label %mir.bb29, !dbg !510

mir.bb34:                                         ; preds = %mir.bb31
  %194 = load i64, ptr %9, align 8, !dbg !512
  %195 = trunc i64 %194 to i32, !dbg !512
  store i32 %195, ptr %7, align 4, !dbg !512
  %196 = load i32, ptr %7, align 4, !dbg !512
  %197 = add nsw i32 %196, 1, !dbg !512
  store i32 %197, ptr %6, align 4, !dbg !512
  %198 = load ptr, ptr %52, align 8, !dbg !512
  %199 = getelementptr inbounds nuw %Regex, ptr %198, i32 0, i32 7, !dbg !512
  %200 = load ptr, ptr %199, align 8, !dbg !512
  %201 = load i32, ptr %6, align 4, !dbg !512
  store i32 %201, ptr %200, align 4, !dbg !512
  br label %mir.bb33, !dbg !512

mir.bb35:                                         ; preds = %mir.bb26
  %202 = load ptr, ptr %52, align 8, !dbg !514
  %203 = getelementptr inbounds nuw %Regex, ptr %202, i32 0, i32 7, !dbg !514
  %204 = load ptr, ptr %203, align 8, !dbg !514
  store i32 0, ptr %204, align 4, !dbg !514
  store { i32, %Captures } zeroinitializer, ptr %5, align 8, !dbg !514
  %205 = getelementptr inbounds nuw { i32, %Captures }, ptr %5, i32 0, i32 0, !dbg !514
  store i32 1, ptr %205, align 4, !dbg !514
  %206 = load { i32, %Captures }, ptr %5, align 8, !dbg !514
  store { i32, %Captures } %206, ptr %4, align 8, !dbg !514
  %207 = load { i32, %Captures }, ptr %4, align 8, !dbg !514
  store { i32, %Captures } %207, ptr %18, align 8, !dbg !514
  br label %mir.bb24, !dbg !514

mir.bb36:                                         ; preds = %mir.bb22
  %208 = load ptr, ptr %52, align 8, !dbg !516
  %209 = getelementptr inbounds nuw %Regex, ptr %208, i32 0, i32 7, !dbg !516
  %210 = load ptr, ptr %209, align 8, !dbg !516
  store i32 0, ptr %210, align 4, !dbg !516
  store { i32, %Captures } zeroinitializer, ptr %3, align 8, !dbg !516
  %211 = getelementptr inbounds nuw { i32, %Captures }, ptr %3, i32 0, i32 0, !dbg !516
  store i32 1, ptr %211, align 4, !dbg !516
  %212 = load { i32, %Captures }, ptr %3, align 8, !dbg !516
  store { i32, %Captures } %212, ptr %2, align 8, !dbg !516
  %213 = load { i32, %Captures }, ptr %2, align 8, !dbg !516
  store { i32, %Captures } %213, ptr %23, align 8, !dbg !516
  br label %mir.bb20, !dbg !516

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !516
}

define internal { i32, %Match } @Regex.find(ptr %0, %str %1) !dbg !518 {
entry:
  %2 = alloca { i32, %Match }, align 8, !dbg !519
  %3 = alloca %str, align 8, !dbg !519
  %4 = alloca ptr, align 8, !dbg !519
  %5 = alloca { i32, %Match }, align 8, !dbg !519
  store ptr %0, ptr %4, align 8, !dbg !519
  store %str %1, ptr %3, align 8, !dbg !519
  br label %mir.bb0, !dbg !519

mir.bb0:                                          ; preds = %entry
  %6 = load ptr, ptr %4, align 8, !dbg !519
  %7 = load %str, ptr %3, align 8, !dbg !519
  %8 = call { i32, %Match } @Regex.find_at(ptr %6, %str %7, i32 0), !dbg !519
  store { i32, %Match } %8, ptr %2, align 8, !dbg !519
  br label %mir.bb1, !dbg !519

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load { i32, %Match }, ptr %2, align 8, !dbg !520
  store { i32, %Match } %9, ptr %5, align 8, !dbg !520
  %10 = load { i32, %Match }, ptr %5, align 8, !dbg !520
  ret { i32, %Match } %10, !dbg !520
}

define internal { i32, %Match } @Regex.find_at(ptr %0, %str %1, i32 %2) !dbg !522 {
entry:
  %3 = alloca { i32, %Match }, align 8, !dbg !523
  %4 = alloca { i32, %Match }, align 8, !dbg !523
  %5 = alloca i32, align 4, !dbg !523
  %6 = alloca { i32, %Match }, align 8, !dbg !523
  %7 = alloca %Captures, align 8, !dbg !523
  %8 = alloca { i32, %Match }, align 8, !dbg !523
  %9 = alloca i32, align 4, !dbg !523
  %10 = alloca { i32, %Captures }, align 8, !dbg !523
  %11 = alloca { i32, %Captures }, align 8, !dbg !523
  %12 = alloca i32, align 4, !dbg !523
  %13 = alloca %str, align 8, !dbg !523
  %14 = alloca ptr, align 8, !dbg !523
  %15 = alloca { i32, %Match }, align 8, !dbg !523
  store ptr %0, ptr %14, align 8, !dbg !523
  store %str %1, ptr %13, align 8, !dbg !523
  store i32 %2, ptr %12, align 4, !dbg !523
  br label %mir.bb0, !dbg !523

mir.bb0:                                          ; preds = %entry
  %16 = load ptr, ptr %14, align 8, !dbg !523
  %17 = load %str, ptr %13, align 8, !dbg !523
  %18 = load i32, ptr %12, align 4, !dbg !523
  %19 = call { i32, %Captures } @Regex.captures_at(ptr %16, %str %17, i32 %18), !dbg !523
  store { i32, %Captures } %19, ptr %11, align 8, !dbg !523
  br label %mir.bb1, !dbg !523

mir.bb1:                                          ; preds = %mir.bb0
  %20 = load { i32, %Captures }, ptr %11, align 8, !dbg !524
  store { i32, %Captures } %20, ptr %10, align 8, !dbg !524
  %21 = load { i32, %Captures }, ptr %10, align 8, !dbg !524
  %22 = extractvalue { i32, %Captures } %21, 0, !dbg !524
  store i32 %22, ptr %9, align 4, !dbg !524
  %23 = load i32, ptr %9, align 4, !dbg !524
  switch i32 %23, label %mir.bb4 [
    i32 0, label %mir.bb3
  ], !dbg !524

mir.bb2:                                          ; preds = %mir.bb6, %mir.bb5, %mir.bb4
  %24 = load { i32, %Match }, ptr %8, align 8, !dbg !526
  store { i32, %Match } %24, ptr %15, align 8, !dbg !526
  %25 = load { i32, %Match }, ptr %15, align 8, !dbg !526
  ret { i32, %Match } %25, !dbg !526

mir.bb3:                                          ; preds = %mir.bb1
  %26 = getelementptr inbounds nuw { i32, %Captures }, ptr %10, i32 0, i32 1, !dbg !528
  %27 = getelementptr inbounds nuw { %Captures }, ptr %26, i32 0, i32 0, !dbg !528
  %28 = load %Captures, ptr %27, align 8, !dbg !528
  store %Captures %28, ptr %7, align 8, !dbg !528
  %29 = load %Captures, ptr %7, align 8, !dbg !528
  %30 = call { i32, %Match } @Captures.get(ptr %7, i32 0), !dbg !528
  store { i32, %Match } %30, ptr %6, align 8, !dbg !528
  br label %mir.bb5, !dbg !528

mir.bb4:                                          ; preds = %mir.bb1
  %31 = load { i32, %Captures }, ptr %10, align 8, !dbg !528
  %32 = extractvalue { i32, %Captures } %31, 0, !dbg !528
  store i32 %32, ptr %5, align 4, !dbg !528
  %33 = load i32, ptr %5, align 4, !dbg !528
  switch i32 %33, label %mir.bb2 [
    i32 1, label %mir.bb6
  ], !dbg !528

mir.bb5:                                          ; preds = %mir.bb3
  %34 = load { i32, %Match }, ptr %6, align 8, !dbg !530
  store { i32, %Match } %34, ptr %8, align 8, !dbg !530
  br label %mir.bb2, !dbg !530

mir.bb6:                                          ; preds = %mir.bb4
  store { i32, %Match } zeroinitializer, ptr %4, align 8, !dbg !530
  %35 = getelementptr inbounds nuw { i32, %Match }, ptr %4, i32 0, i32 0, !dbg !530
  store i32 1, ptr %35, align 4, !dbg !530
  %36 = load { i32, %Match }, ptr %4, align 8, !dbg !530
  store { i32, %Match } %36, ptr %3, align 8, !dbg !530
  %37 = load { i32, %Match }, ptr %3, align 8, !dbg !530
  store { i32, %Match } %37, ptr %8, align 8, !dbg !530
  br label %mir.bb2, !dbg !530

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !530
}

define internal %__with.Vec.Match @Regex.find_all(ptr %0, %str %1) !dbg !532 {
entry:
  %2 = alloca i32, align 4, !dbg !533
  %3 = alloca i1, align 1, !dbg !533
  %4 = alloca i32, align 4, !dbg !533
  %5 = alloca i32, align 4, !dbg !533
  %6 = alloca i32, align 4, !dbg !533
  %7 = alloca i64, align 8, !dbg !533
  %8 = alloca i1, align 1, !dbg !533
  %9 = alloca i32, align 4, !dbg !533
  %10 = alloca %Match, align 8, !dbg !533
  %11 = alloca i32, align 4, !dbg !533
  %12 = alloca { i32, %Match }, align 8, !dbg !533
  %13 = alloca i1, align 1, !dbg !533
  %14 = alloca i32, align 4, !dbg !533
  %15 = alloca { i32, %Match }, align 8, !dbg !533
  %16 = alloca i64, align 8, !dbg !533
  %17 = alloca i32, align 4, !dbg !533
  %18 = alloca %__with.Vec.Match, align 8, !dbg !533
  %19 = alloca %__with.Vec.Match.2, align 8, !dbg !533
  %20 = alloca %__with.Vec.Match.2, align 8, !dbg !533
  %21 = alloca %str, align 8, !dbg !533
  %22 = alloca ptr, align 8, !dbg !533
  %23 = alloca %__with.Vec.Match, align 8, !dbg !533
  store ptr %0, ptr %22, align 8, !dbg !533
  store %str %1, ptr %21, align 8, !dbg !533
  br label %mir.bb0, !dbg !533

mir.bb0:                                          ; preds = %entry
  %24 = alloca %__with.Vec.Match.2, align 8, !dbg !533
  store %__with.Vec.Match.2 zeroinitializer, ptr %24, align 8, !dbg !533
  call void @with_vec_new_out(ptr %24, i64 24), !dbg !533
  %25 = load %__with.Vec.Match.2, ptr %24, align 8, !dbg !533
  store %__with.Vec.Match.2 %25, ptr %20, align 8, !dbg !533
  br label %mir.bb1, !dbg !533

mir.bb1:                                          ; preds = %mir.bb0
  %26 = load %__with.Vec.Match.2, ptr %20, align 8, !dbg !534
  store %__with.Vec.Match.2 %26, ptr %19, align 8, !dbg !534
  %27 = load %__with.Vec.Match, ptr %19, align 8, !dbg !534
  store %__with.Vec.Match %27, ptr %18, align 8, !dbg !534
  store i32 0, ptr %17, align 4, !dbg !534
  br label %mir.bb2, !dbg !534

mir.bb2:                                          ; preds = %mir.bb7, %mir.bb1
  %28 = load %str, ptr %21, align 8, !dbg !534
  %29 = extractvalue %str %28, 1, !dbg !534
  store i64 %29, ptr %16, align 8, !dbg !534
  br label %mir.bb5, !dbg !534

mir.bb3:                                          ; preds = %mir.bb5
  %30 = load ptr, ptr %22, align 8, !dbg !534
  %31 = load %str, ptr %21, align 8, !dbg !534
  %32 = load i32, ptr %17, align 4, !dbg !534
  %33 = call { i32, %Match } @Regex.find_at(ptr %30, %str %31, i32 %32), !dbg !534
  store { i32, %Match } %33, ptr %15, align 8, !dbg !534
  br label %mir.bb6, !dbg !534

mir.bb4:                                          ; preds = %mir.bb19, %mir.bb15, %mir.bb5
  %34 = load %__with.Vec.Match, ptr %18, align 8, !dbg !534
  store %__with.Vec.Match %34, ptr %23, align 8, !dbg !534
  %35 = load %__with.Vec.Match, ptr %23, align 8, !dbg !534
  ret %__with.Vec.Match %35, !dbg !534

mir.bb5:                                          ; preds = %mir.bb2
  %36 = load i64, ptr %16, align 8, !dbg !536
  %37 = trunc i64 %36 to i32, !dbg !536
  store i32 %37, ptr %14, align 4, !dbg !536
  %38 = load i32, ptr %17, align 4, !dbg !536
  %39 = load i32, ptr %14, align 4, !dbg !536
  %40 = icmp sle i32 %38, %39, !dbg !536
  store i1 %40, ptr %13, align 1, !dbg !536
  %41 = load i1, ptr %13, align 1, !dbg !536
  br i1 %41, label %mir.bb3, label %mir.bb4, !dbg !536

mir.bb6:                                          ; preds = %mir.bb3
  %42 = load { i32, %Match }, ptr %15, align 8, !dbg !538
  store { i32, %Match } %42, ptr %12, align 8, !dbg !538
  %43 = load { i32, %Match }, ptr %12, align 8, !dbg !538
  %44 = extractvalue { i32, %Match } %43, 0, !dbg !538
  store i32 %44, ptr %11, align 4, !dbg !538
  %45 = load i32, ptr %11, align 4, !dbg !538
  switch i32 %45, label %mir.bb9 [
    i32 0, label %mir.bb8
  ], !dbg !538

mir.bb7:                                          ; preds = %mir.bb20, %mir.bb13, %mir.bb9
  br label %mir.bb2, !dbg !538

mir.bb8:                                          ; preds = %mir.bb6
  %46 = getelementptr inbounds nuw { i32, %Match }, ptr %12, i32 0, i32 1, !dbg !540
  %47 = getelementptr inbounds nuw { %Match }, ptr %46, i32 0, i32 0, !dbg !540
  %48 = load %Match, ptr %47, align 8, !dbg !540
  store %Match %48, ptr %10, align 8, !dbg !540
  %49 = load %Match, ptr %10, align 8, !dbg !540
  %50 = alloca %Match, align 8, !dbg !540
  store %Match %49, ptr %50, align 8, !dbg !540
  call void @with_vec_push(ptr %18, ptr %50), !dbg !540
  br label %mir.bb10, !dbg !540

mir.bb9:                                          ; preds = %mir.bb6
  %51 = load { i32, %Match }, ptr %12, align 8, !dbg !540
  %52 = extractvalue { i32, %Match } %51, 0, !dbg !540
  store i32 %52, ptr %9, align 4, !dbg !540
  %53 = load i32, ptr %9, align 4, !dbg !540
  switch i32 %53, label %mir.bb7 [
    i32 1, label %mir.bb19
  ], !dbg !540

mir.bb10:                                         ; preds = %mir.bb8
  %54 = getelementptr inbounds nuw %Match, ptr %10, i32 0, i32 2, !dbg !542
  %55 = load i32, ptr %54, align 4, !dbg !542
  %56 = getelementptr inbounds nuw %Match, ptr %10, i32 0, i32 1, !dbg !542
  %57 = load i32, ptr %56, align 4, !dbg !542
  %58 = icmp eq i32 %55, %57, !dbg !542
  store i1 %58, ptr %8, align 1, !dbg !542
  %59 = load i1, ptr %8, align 1, !dbg !542
  br i1 %59, label %mir.bb11, label %mir.bb12, !dbg !542

mir.bb11:                                         ; preds = %mir.bb10
  %60 = load %str, ptr %21, align 8, !dbg !542
  %61 = extractvalue %str %60, 1, !dbg !542
  store i64 %61, ptr %7, align 8, !dbg !542
  br label %mir.bb14, !dbg !542

mir.bb12:                                         ; preds = %mir.bb10
  %62 = getelementptr inbounds nuw %Match, ptr %10, i32 0, i32 2, !dbg !544
  %63 = load i32, ptr %62, align 4, !dbg !544
  store i32 %63, ptr %17, align 4, !dbg !544
  %64 = getelementptr inbounds nuw %Match, ptr %10, i32 0, i32 2, !dbg !544
  %65 = load i32, ptr %64, align 4, !dbg !544
  store i32 %65, ptr %6, align 4, !dbg !544
  br label %mir.bb13, !dbg !544

mir.bb13:                                         ; preds = %mir.bb17, %mir.bb12
  %66 = load i32, ptr %6, align 4, !dbg !546
  store i32 %66, ptr %5, align 4, !dbg !546
  br label %mir.bb7, !dbg !546

mir.bb14:                                         ; preds = %mir.bb11
  %67 = load i64, ptr %7, align 8, !dbg !548
  %68 = trunc i64 %67 to i32, !dbg !548
  store i32 %68, ptr %4, align 4, !dbg !548
  %69 = getelementptr inbounds nuw %Match, ptr %10, i32 0, i32 2, !dbg !548
  %70 = load i32, ptr %69, align 4, !dbg !548
  %71 = load i32, ptr %4, align 4, !dbg !548
  %72 = icmp sge i32 %70, %71, !dbg !548
  store i1 %72, ptr %3, align 1, !dbg !548
  %73 = load i1, ptr %3, align 1, !dbg !548
  br i1 %73, label %mir.bb15, label %mir.bb16, !dbg !548

mir.bb15:                                         ; preds = %mir.bb14
  br label %mir.bb4, !dbg !548

mir.bb16:                                         ; preds = %mir.bb14
  br label %mir.bb17, !dbg !548

mir.bb17:                                         ; preds = %mir.bb18, %mir.bb16
  %74 = getelementptr inbounds nuw %Match, ptr %10, i32 0, i32 2, !dbg !550
  %75 = load i32, ptr %74, align 4, !dbg !550
  %76 = add nsw i32 %75, 1, !dbg !550
  store i32 %76, ptr %2, align 4, !dbg !550
  %77 = load i32, ptr %2, align 4, !dbg !550
  store i32 %77, ptr %17, align 4, !dbg !550
  %78 = load i32, ptr %2, align 4, !dbg !550
  store i32 %78, ptr %6, align 4, !dbg !550
  br label %mir.bb13, !dbg !550

mir.bb18:                                         ; No predecessors!
  br label %mir.bb17, !dbg !550

mir.bb19:                                         ; preds = %mir.bb9
  br label %mir.bb4, !dbg !550

mir.bb20:                                         ; No predecessors!
  store i32 0, ptr %5, align 4, !dbg !552
  br label %mir.bb7, !dbg !552

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !552
}

define internal %__with.Vec.Captures @Regex.captures_all(ptr %0, %str %1) !dbg !554 {
entry:
  %2 = alloca i32, align 4, !dbg !555
  %3 = alloca i1, align 1, !dbg !555
  %4 = alloca i32, align 4, !dbg !555
  %5 = alloca i32, align 4, !dbg !555
  %6 = alloca i64, align 8, !dbg !555
  %7 = alloca i1, align 1, !dbg !555
  %8 = alloca i32, align 4, !dbg !555
  %9 = alloca %Match, align 8, !dbg !555
  %10 = alloca i32, align 4, !dbg !555
  %11 = alloca i32, align 4, !dbg !555
  %12 = alloca i32, align 4, !dbg !555
  %13 = alloca { i32, %Match }, align 8, !dbg !555
  %14 = alloca i32, align 4, !dbg !555
  %15 = alloca { i32, %Match }, align 8, !dbg !555
  %16 = alloca i32, align 4, !dbg !555
  %17 = alloca { i32, %Captures }, align 8, !dbg !555
  %18 = alloca i1, align 1, !dbg !555
  %19 = alloca i32, align 4, !dbg !555
  %20 = alloca %Captures, align 8, !dbg !555
  %21 = alloca { i32, %Captures }, align 8, !dbg !555
  %22 = alloca i64, align 8, !dbg !555
  %23 = alloca i32, align 4, !dbg !555
  %24 = alloca %__with.Vec.Captures, align 8, !dbg !555
  %25 = alloca %__with.Vec.Captures.3, align 8, !dbg !555
  %26 = alloca %__with.Vec.Captures.3, align 8, !dbg !555
  %27 = alloca %str, align 8, !dbg !555
  %28 = alloca ptr, align 8, !dbg !555
  %29 = alloca %__with.Vec.Captures, align 8, !dbg !555
  store ptr %0, ptr %28, align 8, !dbg !555
  store %str %1, ptr %27, align 8, !dbg !555
  br label %mir.bb0, !dbg !555

mir.bb0:                                          ; preds = %entry
  %30 = alloca %__with.Vec.Captures.3, align 8, !dbg !555
  store %__with.Vec.Captures.3 zeroinitializer, ptr %30, align 8, !dbg !555
  call void @with_vec_new_out(ptr %30, i64 56), !dbg !555
  %31 = load %__with.Vec.Captures.3, ptr %30, align 8, !dbg !555
  store %__with.Vec.Captures.3 %31, ptr %26, align 8, !dbg !555
  br label %mir.bb1, !dbg !555

mir.bb1:                                          ; preds = %mir.bb0
  %32 = load %__with.Vec.Captures.3, ptr %26, align 8, !dbg !556
  store %__with.Vec.Captures.3 %32, ptr %25, align 8, !dbg !556
  %33 = load %__with.Vec.Captures, ptr %25, align 8, !dbg !556
  store %__with.Vec.Captures %33, ptr %24, align 8, !dbg !556
  store i32 0, ptr %23, align 4, !dbg !556
  br label %mir.bb2, !dbg !556

mir.bb2:                                          ; preds = %mir.bb7, %mir.bb1
  %34 = load %str, ptr %27, align 8, !dbg !556
  %35 = extractvalue %str %34, 1, !dbg !556
  store i64 %35, ptr %22, align 8, !dbg !556
  br label %mir.bb5, !dbg !556

mir.bb3:                                          ; preds = %mir.bb5
  %36 = load ptr, ptr %28, align 8, !dbg !556
  %37 = load %str, ptr %27, align 8, !dbg !556
  %38 = load i32, ptr %23, align 4, !dbg !556
  %39 = call { i32, %Captures } @Regex.captures_at(ptr %36, %str %37, i32 %38), !dbg !556
  store { i32, %Captures } %39, ptr %21, align 8, !dbg !556
  br label %mir.bb6, !dbg !556

mir.bb4:                                          ; preds = %mir.bb25, %mir.bb23, %mir.bb19, %mir.bb5
  %40 = load %__with.Vec.Captures, ptr %24, align 8, !dbg !556
  store %__with.Vec.Captures %40, ptr %29, align 8, !dbg !556
  %41 = load %__with.Vec.Captures, ptr %29, align 8, !dbg !556
  ret %__with.Vec.Captures %41, !dbg !556

mir.bb5:                                          ; preds = %mir.bb2
  %42 = load i64, ptr %22, align 8, !dbg !558
  %43 = trunc i64 %42 to i32, !dbg !558
  store i32 %43, ptr %19, align 4, !dbg !558
  %44 = load i32, ptr %23, align 4, !dbg !558
  %45 = load i32, ptr %19, align 4, !dbg !558
  %46 = icmp sle i32 %44, %45, !dbg !558
  store i1 %46, ptr %18, align 1, !dbg !558
  %47 = load i1, ptr %18, align 1, !dbg !558
  br i1 %47, label %mir.bb3, label %mir.bb4, !dbg !558

mir.bb6:                                          ; preds = %mir.bb3
  %48 = load { i32, %Captures }, ptr %21, align 8, !dbg !560
  store { i32, %Captures } %48, ptr %17, align 8, !dbg !560
  %49 = load { i32, %Captures }, ptr %17, align 8, !dbg !560
  %50 = extractvalue { i32, %Captures } %49, 0, !dbg !560
  store i32 %50, ptr %16, align 4, !dbg !560
  %51 = load i32, ptr %16, align 4, !dbg !560
  switch i32 %51, label %mir.bb9 [
    i32 0, label %mir.bb8
  ], !dbg !560

mir.bb7:                                          ; preds = %mir.bb26, %mir.bb11, %mir.bb9
  br label %mir.bb2, !dbg !560

mir.bb8:                                          ; preds = %mir.bb6
  %52 = getelementptr inbounds nuw { i32, %Captures }, ptr %17, i32 0, i32 1, !dbg !562
  %53 = getelementptr inbounds nuw { %Captures }, ptr %52, i32 0, i32 0, !dbg !562
  %54 = load %Captures, ptr %53, align 8, !dbg !562
  store %Captures %54, ptr %20, align 8, !dbg !562
  %55 = load %Captures, ptr %20, align 8, !dbg !562
  %56 = call { i32, %Match } @Captures.get(ptr %20, i32 0), !dbg !562
  store { i32, %Match } %56, ptr %15, align 8, !dbg !562
  br label %mir.bb10, !dbg !562

mir.bb9:                                          ; preds = %mir.bb6
  %57 = load { i32, %Captures }, ptr %17, align 8, !dbg !562
  %58 = extractvalue { i32, %Captures } %57, 0, !dbg !562
  store i32 %58, ptr %14, align 4, !dbg !562
  %59 = load i32, ptr %14, align 4, !dbg !562
  switch i32 %59, label %mir.bb7 [
    i32 1, label %mir.bb25
  ], !dbg !562

mir.bb10:                                         ; preds = %mir.bb8
  %60 = load { i32, %Match }, ptr %15, align 8, !dbg !564
  store { i32, %Match } %60, ptr %13, align 8, !dbg !564
  %61 = load { i32, %Match }, ptr %13, align 8, !dbg !564
  %62 = extractvalue { i32, %Match } %61, 0, !dbg !564
  store i32 %62, ptr %12, align 4, !dbg !564
  %63 = load i32, ptr %12, align 4, !dbg !564
  switch i32 %63, label %mir.bb13 [
    i32 0, label %mir.bb12
  ], !dbg !564

mir.bb11:                                         ; preds = %mir.bb24, %mir.bb17, %mir.bb13
  %64 = load i32, ptr %11, align 4, !dbg !566
  store i32 %64, ptr %10, align 4, !dbg !566
  br label %mir.bb7, !dbg !566

mir.bb12:                                         ; preds = %mir.bb10
  %65 = getelementptr inbounds nuw { i32, %Match }, ptr %13, i32 0, i32 1, !dbg !568
  %66 = getelementptr inbounds nuw { %Match }, ptr %65, i32 0, i32 0, !dbg !568
  %67 = load %Match, ptr %66, align 8, !dbg !568
  store %Match %67, ptr %9, align 8, !dbg !568
  %68 = load %Captures, ptr %20, align 8, !dbg !568
  %69 = alloca %Captures, align 8, !dbg !568
  store %Captures %68, ptr %69, align 8, !dbg !568
  call void @with_vec_push(ptr %24, ptr %69), !dbg !568
  br label %mir.bb14, !dbg !568

mir.bb13:                                         ; preds = %mir.bb10
  %70 = load { i32, %Match }, ptr %13, align 8, !dbg !568
  %71 = extractvalue { i32, %Match } %70, 0, !dbg !568
  store i32 %71, ptr %8, align 4, !dbg !568
  %72 = load i32, ptr %8, align 4, !dbg !568
  switch i32 %72, label %mir.bb11 [
    i32 1, label %mir.bb23
  ], !dbg !568

mir.bb14:                                         ; preds = %mir.bb12
  %73 = getelementptr inbounds nuw %Match, ptr %9, i32 0, i32 2, !dbg !570
  %74 = load i32, ptr %73, align 4, !dbg !570
  %75 = getelementptr inbounds nuw %Match, ptr %9, i32 0, i32 1, !dbg !570
  %76 = load i32, ptr %75, align 4, !dbg !570
  %77 = icmp eq i32 %74, %76, !dbg !570
  store i1 %77, ptr %7, align 1, !dbg !570
  %78 = load i1, ptr %7, align 1, !dbg !570
  br i1 %78, label %mir.bb15, label %mir.bb16, !dbg !570

mir.bb15:                                         ; preds = %mir.bb14
  %79 = load %str, ptr %27, align 8, !dbg !570
  %80 = extractvalue %str %79, 1, !dbg !570
  store i64 %80, ptr %6, align 8, !dbg !570
  br label %mir.bb18, !dbg !570

mir.bb16:                                         ; preds = %mir.bb14
  %81 = getelementptr inbounds nuw %Match, ptr %9, i32 0, i32 2, !dbg !572
  %82 = load i32, ptr %81, align 4, !dbg !572
  store i32 %82, ptr %23, align 4, !dbg !572
  %83 = getelementptr inbounds nuw %Match, ptr %9, i32 0, i32 2, !dbg !572
  %84 = load i32, ptr %83, align 4, !dbg !572
  store i32 %84, ptr %5, align 4, !dbg !572
  br label %mir.bb17, !dbg !572

mir.bb17:                                         ; preds = %mir.bb21, %mir.bb16
  %85 = load i32, ptr %5, align 4, !dbg !574
  store i32 %85, ptr %11, align 4, !dbg !574
  br label %mir.bb11, !dbg !574

mir.bb18:                                         ; preds = %mir.bb15
  %86 = load i64, ptr %6, align 8, !dbg !576
  %87 = trunc i64 %86 to i32, !dbg !576
  store i32 %87, ptr %4, align 4, !dbg !576
  %88 = getelementptr inbounds nuw %Match, ptr %9, i32 0, i32 2, !dbg !576
  %89 = load i32, ptr %88, align 4, !dbg !576
  %90 = load i32, ptr %4, align 4, !dbg !576
  %91 = icmp sge i32 %89, %90, !dbg !576
  store i1 %91, ptr %3, align 1, !dbg !576
  %92 = load i1, ptr %3, align 1, !dbg !576
  br i1 %92, label %mir.bb19, label %mir.bb20, !dbg !576

mir.bb19:                                         ; preds = %mir.bb18
  br label %mir.bb4, !dbg !576

mir.bb20:                                         ; preds = %mir.bb18
  br label %mir.bb21, !dbg !576

mir.bb21:                                         ; preds = %mir.bb22, %mir.bb20
  %93 = getelementptr inbounds nuw %Match, ptr %9, i32 0, i32 2, !dbg !578
  %94 = load i32, ptr %93, align 4, !dbg !578
  %95 = add nsw i32 %94, 1, !dbg !578
  store i32 %95, ptr %2, align 4, !dbg !578
  %96 = load i32, ptr %2, align 4, !dbg !578
  store i32 %96, ptr %23, align 4, !dbg !578
  %97 = load i32, ptr %2, align 4, !dbg !578
  store i32 %97, ptr %5, align 4, !dbg !578
  br label %mir.bb17, !dbg !578

mir.bb22:                                         ; No predecessors!
  br label %mir.bb21, !dbg !578

mir.bb23:                                         ; preds = %mir.bb13
  br label %mir.bb4, !dbg !578

mir.bb24:                                         ; No predecessors!
  store i32 0, ptr %11, align 4, !dbg !580
  br label %mir.bb11, !dbg !580

mir.bb25:                                         ; preds = %mir.bb9
  br label %mir.bb4, !dbg !580

mir.bb26:                                         ; No predecessors!
  store i32 0, ptr %10, align 4, !dbg !582
  br label %mir.bb7, !dbg !582

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !582
}

define internal %str @regex_expand_numbered_capture(ptr %0, %str %1, i64 %2, i64 %3) !dbg !584 {
entry:
  %4 = alloca i32, align 4, !dbg !585
  %5 = alloca %Match, align 8, !dbg !585
  %6 = alloca %str, align 8, !dbg !585
  %7 = alloca i32, align 4, !dbg !585
  %8 = alloca { i32, %Match }, align 8, !dbg !585
  %9 = alloca i64, align 8, !dbg !585
  %10 = alloca i32, align 4, !dbg !585
  %11 = alloca i32, align 4, !dbg !585
  %12 = alloca { i32, %Match }, align 8, !dbg !585
  %13 = alloca i32, align 4, !dbg !585
  %14 = alloca i32, align 4, !dbg !585
  %15 = alloca i1, align 1, !dbg !585
  %16 = alloca i64, align 8, !dbg !585
  %17 = alloca i32, align 4, !dbg !585
  %18 = alloca i64, align 8, !dbg !585
  %19 = alloca i64, align 8, !dbg !585
  %20 = alloca %str, align 8, !dbg !585
  %21 = alloca ptr, align 8, !dbg !585
  %22 = alloca %str, align 8, !dbg !585
  store ptr %0, ptr %21, align 8, !dbg !585
  store %str %1, ptr %20, align 8, !dbg !585
  store i64 %2, ptr %19, align 8, !dbg !585
  store i64 %3, ptr %18, align 8, !dbg !585
  br label %mir.bb0, !dbg !585

mir.bb0:                                          ; preds = %entry
  store i32 0, ptr %17, align 4, !dbg !585
  %23 = load i64, ptr %19, align 8, !dbg !585
  store i64 %23, ptr %16, align 8, !dbg !585
  br label %mir.bb1, !dbg !585

mir.bb1:                                          ; preds = %mir.bb4, %mir.bb0
  %24 = load i64, ptr %16, align 8, !dbg !586
  %25 = load i64, ptr %18, align 8, !dbg !586
  %26 = icmp slt i64 %24, %25, !dbg !586
  store i1 %26, ptr %15, align 1, !dbg !586
  %27 = load i1, ptr %15, align 1, !dbg !586
  br i1 %27, label %mir.bb2, label %mir.bb3, !dbg !586

mir.bb2:                                          ; preds = %mir.bb1
  %28 = load i32, ptr %17, align 4, !dbg !588
  %29 = mul nsw i32 %28, 10, !dbg !588
  store i32 %29, ptr %14, align 4, !dbg !588
  %30 = load %str, ptr %20, align 8, !dbg !588
  %31 = load i64, ptr %16, align 8, !dbg !588
  %32 = call i32 @with_str_byte_at(%str %30, i64 %31), !dbg !588
  store i32 %32, ptr %13, align 4, !dbg !588
  br label %mir.bb4, !dbg !588

mir.bb3:                                          ; preds = %mir.bb1
  %33 = load ptr, ptr %21, align 8, !dbg !588
  %34 = load i32, ptr %17, align 4, !dbg !588
  %35 = call { i32, %Match } @Captures.get(ptr %33, i32 %34), !dbg !588
  store { i32, %Match } %35, ptr %12, align 8, !dbg !588
  br label %mir.bb5, !dbg !588

mir.bb4:                                          ; preds = %mir.bb2
  %36 = load i32, ptr %13, align 4, !dbg !590
  %37 = sub nsw i32 %36, 48, !dbg !590
  store i32 %37, ptr %11, align 4, !dbg !590
  %38 = load i32, ptr %14, align 4, !dbg !590
  %39 = load i32, ptr %11, align 4, !dbg !590
  %40 = add nsw i32 %38, %39, !dbg !590
  store i32 %40, ptr %10, align 4, !dbg !590
  %41 = load i32, ptr %10, align 4, !dbg !590
  store i32 %41, ptr %17, align 4, !dbg !590
  %42 = load i64, ptr %16, align 8, !dbg !590
  %43 = add nsw i64 %42, 1, !dbg !590
  store i64 %43, ptr %9, align 8, !dbg !590
  %44 = load i64, ptr %9, align 8, !dbg !590
  store i64 %44, ptr %16, align 8, !dbg !590
  br label %mir.bb1, !dbg !590

mir.bb5:                                          ; preds = %mir.bb3
  %45 = load { i32, %Match }, ptr %12, align 8, !dbg !592
  store { i32, %Match } %45, ptr %8, align 8, !dbg !592
  %46 = load { i32, %Match }, ptr %8, align 8, !dbg !592
  %47 = extractvalue { i32, %Match } %46, 0, !dbg !592
  store i32 %47, ptr %7, align 4, !dbg !592
  %48 = load i32, ptr %7, align 4, !dbg !592
  switch i32 %48, label %mir.bb8 [
    i32 0, label %mir.bb7
  ], !dbg !592

mir.bb6:                                          ; preds = %mir.bb9, %mir.bb8, %mir.bb7
  %49 = load %str, ptr %6, align 8, !dbg !594
  store %str %49, ptr %22, align 8, !dbg !594
  %50 = load %str, ptr %22, align 8, !dbg !594
  ret %str %50, !dbg !594

mir.bb7:                                          ; preds = %mir.bb5
  %51 = getelementptr inbounds nuw { i32, %Match }, ptr %8, i32 0, i32 1, !dbg !596
  %52 = getelementptr inbounds nuw { %Match }, ptr %51, i32 0, i32 0, !dbg !596
  %53 = load %Match, ptr %52, align 8, !dbg !596
  store %Match %53, ptr %5, align 8, !dbg !596
  %54 = getelementptr inbounds nuw %Match, ptr %5, i32 0, i32 0, !dbg !596
  %55 = load %str, ptr %54, align 8, !dbg !596
  store %str %55, ptr %6, align 8, !dbg !596
  br label %mir.bb6, !dbg !596

mir.bb8:                                          ; preds = %mir.bb5
  %56 = load { i32, %Match }, ptr %8, align 8, !dbg !596
  %57 = extractvalue { i32, %Match } %56, 0, !dbg !596
  store i32 %57, ptr %4, align 4, !dbg !596
  %58 = load i32, ptr %4, align 4, !dbg !596
  switch i32 %58, label %mir.bb6 [
    i32 1, label %mir.bb9
  ], !dbg !596

mir.bb9:                                          ; preds = %mir.bb8
  %59 = alloca %str, align 8, !dbg !598
  %60 = getelementptr inbounds nuw %str, ptr %59, i32 0, i32 0, !dbg !598
  store ptr @6, ptr %60, align 8, !dbg !598
  %61 = getelementptr inbounds nuw %str, ptr %59, i32 0, i32 1, !dbg !598
  store i64 0, ptr %61, align 8, !dbg !598
  %62 = load %str, ptr %59, align 8, !dbg !598
  store %str %62, ptr %6, align 8, !dbg !598
  br label %mir.bb6, !dbg !598

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !598
}

define internal i1 @regex_is_name_start(i32 %0) !dbg !600 {
entry:
  %1 = alloca i1, align 1, !dbg !601
  %2 = alloca i1, align 1, !dbg !601
  %3 = alloca i1, align 1, !dbg !601
  %4 = alloca i1, align 1, !dbg !601
  %5 = alloca i1, align 1, !dbg !601
  %6 = alloca i1, align 1, !dbg !601
  %7 = alloca i1, align 1, !dbg !601
  %8 = alloca i1, align 1, !dbg !601
  %9 = alloca i1, align 1, !dbg !601
  %10 = alloca i32, align 4, !dbg !601
  %11 = alloca i1, align 1, !dbg !601
  store i32 %0, ptr %10, align 4, !dbg !601
  br label %mir.bb0, !dbg !601

mir.bb0:                                          ; preds = %entry
  %12 = load i32, ptr %10, align 4, !dbg !601
  %13 = icmp sge i32 %12, 65, !dbg !601
  store i1 %13, ptr %9, align 1, !dbg !601
  %14 = load i1, ptr %9, align 1, !dbg !601
  store i1 %14, ptr %8, align 1, !dbg !601
  %15 = load i1, ptr %8, align 1, !dbg !601
  br i1 %15, label %mir.bb1, label %mir.bb2, !dbg !601

mir.bb1:                                          ; preds = %mir.bb0
  %16 = load i32, ptr %10, align 4, !dbg !602
  %17 = icmp sle i32 %16, 90, !dbg !602
  store i1 %17, ptr %7, align 1, !dbg !602
  %18 = load i1, ptr %7, align 1, !dbg !602
  store i1 %18, ptr %8, align 1, !dbg !602
  br label %mir.bb2, !dbg !602

mir.bb2:                                          ; preds = %mir.bb1, %mir.bb0
  %19 = load i1, ptr %8, align 1, !dbg !604
  store i1 %19, ptr %6, align 1, !dbg !604
  %20 = load i1, ptr %6, align 1, !dbg !604
  br i1 %20, label %mir.bb4, label %mir.bb3, !dbg !604

mir.bb3:                                          ; preds = %mir.bb2
  %21 = load i32, ptr %10, align 4, !dbg !606
  %22 = icmp sge i32 %21, 97, !dbg !606
  store i1 %22, ptr %5, align 1, !dbg !606
  %23 = load i1, ptr %5, align 1, !dbg !606
  store i1 %23, ptr %4, align 1, !dbg !606
  %24 = load i1, ptr %4, align 1, !dbg !606
  br i1 %24, label %mir.bb5, label %mir.bb6, !dbg !606

mir.bb4:                                          ; preds = %mir.bb6, %mir.bb2
  %25 = load i1, ptr %6, align 1, !dbg !608
  store i1 %25, ptr %3, align 1, !dbg !608
  %26 = load i1, ptr %3, align 1, !dbg !608
  br i1 %26, label %mir.bb8, label %mir.bb7, !dbg !608

mir.bb5:                                          ; preds = %mir.bb3
  %27 = load i32, ptr %10, align 4, !dbg !610
  %28 = icmp sle i32 %27, 122, !dbg !610
  store i1 %28, ptr %2, align 1, !dbg !610
  %29 = load i1, ptr %2, align 1, !dbg !610
  store i1 %29, ptr %4, align 1, !dbg !610
  br label %mir.bb6, !dbg !610

mir.bb6:                                          ; preds = %mir.bb5, %mir.bb3
  %30 = load i1, ptr %4, align 1, !dbg !612
  store i1 %30, ptr %6, align 1, !dbg !612
  br label %mir.bb4, !dbg !612

mir.bb7:                                          ; preds = %mir.bb4
  %31 = load i32, ptr %10, align 4, !dbg !614
  %32 = icmp eq i32 %31, 95, !dbg !614
  store i1 %32, ptr %1, align 1, !dbg !614
  %33 = load i1, ptr %1, align 1, !dbg !614
  store i1 %33, ptr %3, align 1, !dbg !614
  br label %mir.bb8, !dbg !614

mir.bb8:                                          ; preds = %mir.bb7, %mir.bb4
  %34 = load i1, ptr %3, align 1, !dbg !616
  store i1 %34, ptr %11, align 1, !dbg !616
  %35 = load i1, ptr %11, align 1, !dbg !616
  ret i1 %35, !dbg !616

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !616
}

define internal i1 @regex_is_name_continue(i32 %0) !dbg !618 {
entry:
  %1 = alloca i1, align 1, !dbg !619
  %2 = alloca i1, align 1, !dbg !619
  %3 = alloca i1, align 1, !dbg !619
  %4 = alloca i1, align 1, !dbg !619
  %5 = alloca i1, align 1, !dbg !619
  %6 = alloca i32, align 4, !dbg !619
  %7 = alloca i1, align 1, !dbg !619
  store i32 %0, ptr %6, align 4, !dbg !619
  br label %mir.bb0, !dbg !619

mir.bb0:                                          ; preds = %entry
  %8 = load i32, ptr %6, align 4, !dbg !619
  %9 = call i1 @regex_is_name_start(i32 %8), !dbg !619
  store i1 %9, ptr %5, align 1, !dbg !619
  br label %mir.bb1, !dbg !619

mir.bb1:                                          ; preds = %mir.bb0
  %10 = load i1, ptr %5, align 1, !dbg !620
  store i1 %10, ptr %4, align 1, !dbg !620
  %11 = load i1, ptr %4, align 1, !dbg !620
  br i1 %11, label %mir.bb3, label %mir.bb2, !dbg !620

mir.bb2:                                          ; preds = %mir.bb1
  %12 = load i32, ptr %6, align 4, !dbg !622
  %13 = icmp sge i32 %12, 48, !dbg !622
  store i1 %13, ptr %3, align 1, !dbg !622
  %14 = load i1, ptr %3, align 1, !dbg !622
  store i1 %14, ptr %2, align 1, !dbg !622
  %15 = load i1, ptr %2, align 1, !dbg !622
  br i1 %15, label %mir.bb4, label %mir.bb5, !dbg !622

mir.bb3:                                          ; preds = %mir.bb5, %mir.bb1
  %16 = load i1, ptr %4, align 1, !dbg !624
  store i1 %16, ptr %7, align 1, !dbg !624
  %17 = load i1, ptr %7, align 1, !dbg !624
  ret i1 %17, !dbg !624

mir.bb4:                                          ; preds = %mir.bb2
  %18 = load i32, ptr %6, align 4, !dbg !626
  %19 = icmp sle i32 %18, 57, !dbg !626
  store i1 %19, ptr %1, align 1, !dbg !626
  %20 = load i1, ptr %1, align 1, !dbg !626
  store i1 %20, ptr %2, align 1, !dbg !626
  br label %mir.bb5, !dbg !626

mir.bb5:                                          ; preds = %mir.bb4, %mir.bb2
  %21 = load i1, ptr %2, align 1, !dbg !628
  store i1 %21, ptr %4, align 1, !dbg !628
  br label %mir.bb3, !dbg !628

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !628
}

define internal %str @regex_expand_replacement(ptr %0, %str %1) !dbg !630 {
entry:
  %2 = alloca i32, align 4, !dbg !631
  %3 = alloca %str, align 8, !dbg !631
  %4 = alloca %str, align 8, !dbg !631
  %5 = alloca %Match, align 8, !dbg !631
  %6 = alloca i32, align 4, !dbg !631
  %7 = alloca { i32, %Match }, align 8, !dbg !631
  %8 = alloca { i32, %Match }, align 8, !dbg !631
  %9 = alloca %str, align 8, !dbg !631
  %10 = alloca i1, align 1, !dbg !631
  %11 = alloca i32, align 4, !dbg !631
  %12 = alloca i1, align 1, !dbg !631
  %13 = alloca i1, align 1, !dbg !631
  %14 = alloca %str, align 8, !dbg !631
  %15 = alloca i64, align 8, !dbg !631
  %16 = alloca i64, align 8, !dbg !631
  %17 = alloca i64, align 8, !dbg !631
  %18 = alloca %str, align 8, !dbg !631
  %19 = alloca i64, align 8, !dbg !631
  %20 = alloca i64, align 8, !dbg !631
  %21 = alloca i64, align 8, !dbg !631
  %22 = alloca i32, align 4, !dbg !631
  %23 = alloca %str, align 8, !dbg !631
  %24 = alloca %str, align 8, !dbg !631
  %25 = alloca %Match, align 8, !dbg !631
  %26 = alloca i64, align 8, !dbg !631
  %27 = alloca i32, align 4, !dbg !631
  %28 = alloca { i32, %Match }, align 8, !dbg !631
  %29 = alloca { i32, %Match }, align 8, !dbg !631
  %30 = alloca %str, align 8, !dbg !631
  %31 = alloca %str, align 8, !dbg !631
  %32 = alloca i64, align 8, !dbg !631
  %33 = alloca i1, align 1, !dbg !631
  %34 = alloca i1, align 1, !dbg !631
  %35 = alloca i32, align 4, !dbg !631
  %36 = alloca i1, align 1, !dbg !631
  %37 = alloca i1, align 1, !dbg !631
  %38 = alloca i64, align 8, !dbg !631
  %39 = alloca i64, align 8, !dbg !631
  %40 = alloca i64, align 8, !dbg !631
  %41 = alloca i1, align 1, !dbg !631
  %42 = alloca i64, align 8, !dbg !631
  %43 = alloca i64, align 8, !dbg !631
  %44 = alloca %str, align 8, !dbg !631
  %45 = alloca i1, align 1, !dbg !631
  %46 = alloca i32, align 4, !dbg !631
  %47 = alloca i1, align 1, !dbg !631
  %48 = alloca i1, align 1, !dbg !631
  %49 = alloca i32, align 4, !dbg !631
  %50 = alloca i1, align 1, !dbg !631
  %51 = alloca i1, align 1, !dbg !631
  %52 = alloca %str, align 8, !dbg !631
  %53 = alloca i64, align 8, !dbg !631
  %54 = alloca i64, align 8, !dbg !631
  %55 = alloca i1, align 1, !dbg !631
  %56 = alloca i64, align 8, !dbg !631
  %57 = alloca i64, align 8, !dbg !631
  %58 = alloca i64, align 8, !dbg !631
  %59 = alloca i1, align 1, !dbg !631
  %60 = alloca i1, align 1, !dbg !631
  %61 = alloca i1, align 1, !dbg !631
  %62 = alloca i64, align 8, !dbg !631
  %63 = alloca %str, align 8, !dbg !631
  %64 = alloca i1, align 1, !dbg !631
  %65 = alloca i32, align 4, !dbg !631
  %66 = alloca i32, align 4, !dbg !631
  %67 = alloca i64, align 8, !dbg !631
  %68 = alloca i64, align 8, !dbg !631
  %69 = alloca %str, align 8, !dbg !631
  %70 = alloca i1, align 1, !dbg !631
  %71 = alloca i64, align 8, !dbg !631
  %72 = alloca %str, align 8, !dbg !631
  %73 = alloca i64, align 8, !dbg !631
  %74 = alloca i64, align 8, !dbg !631
  %75 = alloca %str, align 8, !dbg !631
  %76 = alloca i1, align 1, !dbg !631
  %77 = alloca i32, align 4, !dbg !631
  %78 = alloca i1, align 1, !dbg !631
  %79 = alloca i32, align 4, !dbg !631
  %80 = alloca i64, align 8, !dbg !631
  %81 = alloca i64, align 8, !dbg !631
  %82 = alloca %str, align 8, !dbg !631
  %83 = alloca %str, align 8, !dbg !631
  %84 = alloca ptr, align 8, !dbg !631
  %85 = alloca %str, align 8, !dbg !631
  store ptr %0, ptr %84, align 8, !dbg !631
  store %str %1, ptr %83, align 8, !dbg !631
  br label %mir.bb0, !dbg !631

mir.bb0:                                          ; preds = %entry
  %86 = alloca %str, align 8, !dbg !631
  %87 = getelementptr inbounds nuw %str, ptr %86, i32 0, i32 0, !dbg !631
  store ptr @7, ptr %87, align 8, !dbg !631
  %88 = getelementptr inbounds nuw %str, ptr %86, i32 0, i32 1, !dbg !631
  store i64 0, ptr %88, align 8, !dbg !631
  %89 = load %str, ptr %86, align 8, !dbg !631
  store %str %89, ptr %82, align 8, !dbg !631
  store i64 0, ptr %81, align 8, !dbg !631
  br label %mir.bb1, !dbg !631

mir.bb1:                                          ; preds = %mir.bb73, %mir.bb62, %mir.bb54, %mir.bb36, %mir.bb17, %mir.bb12, %mir.bb9, %mir.bb0
  %90 = load %str, ptr %83, align 8, !dbg !631
  %91 = extractvalue %str %90, 1, !dbg !631
  store i64 %91, ptr %80, align 8, !dbg !631
  br label %mir.bb4, !dbg !631

mir.bb2:                                          ; preds = %mir.bb4
  %92 = load %str, ptr %83, align 8, !dbg !632
  %93 = load i64, ptr %81, align 8, !dbg !632
  %94 = call i32 @with_str_byte_at(%str %92, i64 %93), !dbg !632
  store i32 %94, ptr %79, align 4, !dbg !632
  br label %mir.bb5, !dbg !632

mir.bb3:                                          ; preds = %mir.bb4
  %95 = load %str, ptr %82, align 8, !dbg !634
  store %str %95, ptr %85, align 8, !dbg !634
  %96 = load %str, ptr %85, align 8, !dbg !634
  ret %str %96, !dbg !634

mir.bb4:                                          ; preds = %mir.bb1
  %97 = load i64, ptr %81, align 8, !dbg !636
  %98 = load i64, ptr %80, align 8, !dbg !636
  %99 = icmp slt i64 %97, %98, !dbg !636
  store i1 %99, ptr %78, align 1, !dbg !636
  %100 = load i1, ptr %78, align 1, !dbg !636
  br i1 %100, label %mir.bb2, label %mir.bb3, !dbg !636

mir.bb5:                                          ; preds = %mir.bb2
  %101 = load i32, ptr %79, align 4, !dbg !638
  store i32 %101, ptr %77, align 4, !dbg !638
  %102 = load i32, ptr %77, align 4, !dbg !638
  %103 = icmp ne i32 %102, 36, !dbg !638
  store i1 %103, ptr %76, align 1, !dbg !638
  %104 = load i1, ptr %76, align 1, !dbg !638
  br i1 %104, label %mir.bb6, label %mir.bb7, !dbg !638

mir.bb6:                                          ; preds = %mir.bb5
  %105 = load i32, ptr %77, align 4, !dbg !638
  %106 = call %str @str_from_byte(i32 %105), !dbg !638
  store %str %106, ptr %75, align 8, !dbg !638
  br label %mir.bb9, !dbg !638

mir.bb7:                                          ; preds = %mir.bb5
  br label %mir.bb8, !dbg !638

mir.bb8:                                          ; preds = %mir.bb10, %mir.bb7
  %107 = load i64, ptr %81, align 8, !dbg !640
  %108 = add nsw i64 %107, 1, !dbg !640
  store i64 %108, ptr %74, align 8, !dbg !640
  %109 = load %str, ptr %83, align 8, !dbg !640
  %110 = extractvalue %str %109, 1, !dbg !640
  store i64 %110, ptr %73, align 8, !dbg !640
  br label %mir.bb11, !dbg !640

mir.bb9:                                          ; preds = %mir.bb6
  %111 = load %str, ptr %82, align 8, !dbg !642
  %112 = load %str, ptr %75, align 8, !dbg !642
  %113 = call %str @with_str_concat(%str %111, %str %112), !dbg !642
  store %str %113, ptr %72, align 8, !dbg !642
  %114 = load %str, ptr %72, align 8, !dbg !642
  store %str %114, ptr %82, align 8, !dbg !642
  %115 = load i64, ptr %81, align 8, !dbg !642
  %116 = add nsw i64 %115, 1, !dbg !642
  store i64 %116, ptr %71, align 8, !dbg !642
  %117 = load i64, ptr %71, align 8, !dbg !642
  store i64 %117, ptr %81, align 8, !dbg !642
  br label %mir.bb1, !dbg !642

mir.bb10:                                         ; No predecessors!
  br label %mir.bb8, !dbg !642

mir.bb11:                                         ; preds = %mir.bb8
  %118 = load i64, ptr %74, align 8, !dbg !644
  %119 = load i64, ptr %73, align 8, !dbg !644
  %120 = icmp sge i64 %118, %119, !dbg !644
  store i1 %120, ptr %70, align 1, !dbg !644
  %121 = load i1, ptr %70, align 1, !dbg !644
  br i1 %121, label %mir.bb12, label %mir.bb13, !dbg !644

mir.bb12:                                         ; preds = %mir.bb11
  %122 = load %str, ptr %82, align 8, !dbg !646
  %123 = alloca %str, align 8, !dbg !646
  %124 = getelementptr inbounds nuw %str, ptr %123, i32 0, i32 0, !dbg !646
  store ptr @8, ptr %124, align 8, !dbg !646
  %125 = getelementptr inbounds nuw %str, ptr %123, i32 0, i32 1, !dbg !646
  store i64 1, ptr %125, align 8, !dbg !646
  %126 = load %str, ptr %123, align 8, !dbg !646
  %127 = call %str @with_str_concat(%str %122, %str %126), !dbg !646
  store %str %127, ptr %69, align 8, !dbg !646
  %128 = load %str, ptr %69, align 8, !dbg !646
  store %str %128, ptr %82, align 8, !dbg !646
  %129 = load i64, ptr %81, align 8, !dbg !646
  %130 = add nsw i64 %129, 1, !dbg !646
  store i64 %130, ptr %68, align 8, !dbg !646
  %131 = load i64, ptr %68, align 8, !dbg !646
  store i64 %131, ptr %81, align 8, !dbg !646
  br label %mir.bb1, !dbg !646

mir.bb13:                                         ; preds = %mir.bb11
  br label %mir.bb14, !dbg !646

mir.bb14:                                         ; preds = %mir.bb15, %mir.bb13
  %132 = load i64, ptr %81, align 8, !dbg !648
  %133 = add nsw i64 %132, 1, !dbg !648
  store i64 %133, ptr %67, align 8, !dbg !648
  %134 = load %str, ptr %83, align 8, !dbg !648
  %135 = load i64, ptr %67, align 8, !dbg !648
  %136 = call i32 @with_str_byte_at(%str %134, i64 %135), !dbg !648
  store i32 %136, ptr %66, align 4, !dbg !648
  br label %mir.bb16, !dbg !648

mir.bb15:                                         ; No predecessors!
  br label %mir.bb14, !dbg !648

mir.bb16:                                         ; preds = %mir.bb14
  %137 = load i32, ptr %66, align 4, !dbg !650
  store i32 %137, ptr %65, align 4, !dbg !650
  %138 = load i32, ptr %65, align 4, !dbg !650
  %139 = icmp eq i32 %138, 36, !dbg !650
  store i1 %139, ptr %64, align 1, !dbg !650
  %140 = load i1, ptr %64, align 1, !dbg !650
  br i1 %140, label %mir.bb17, label %mir.bb18, !dbg !650

mir.bb17:                                         ; preds = %mir.bb16
  %141 = load %str, ptr %82, align 8, !dbg !652
  %142 = alloca %str, align 8, !dbg !652
  %143 = getelementptr inbounds nuw %str, ptr %142, i32 0, i32 0, !dbg !652
  store ptr @9, ptr %143, align 8, !dbg !652
  %144 = getelementptr inbounds nuw %str, ptr %142, i32 0, i32 1, !dbg !652
  store i64 1, ptr %144, align 8, !dbg !652
  %145 = load %str, ptr %142, align 8, !dbg !652
  %146 = call %str @with_str_concat(%str %141, %str %145), !dbg !652
  store %str %146, ptr %63, align 8, !dbg !652
  %147 = load %str, ptr %63, align 8, !dbg !652
  store %str %147, ptr %82, align 8, !dbg !652
  %148 = load i64, ptr %81, align 8, !dbg !652
  %149 = add nsw i64 %148, 2, !dbg !652
  store i64 %149, ptr %62, align 8, !dbg !652
  %150 = load i64, ptr %62, align 8, !dbg !652
  store i64 %150, ptr %81, align 8, !dbg !652
  br label %mir.bb1, !dbg !652

mir.bb18:                                         ; preds = %mir.bb16
  br label %mir.bb19, !dbg !652

mir.bb19:                                         ; preds = %mir.bb20, %mir.bb18
  %151 = load i32, ptr %65, align 4, !dbg !654
  %152 = icmp sge i32 %151, 48, !dbg !654
  store i1 %152, ptr %61, align 1, !dbg !654
  %153 = load i1, ptr %61, align 1, !dbg !654
  store i1 %153, ptr %60, align 1, !dbg !654
  %154 = load i1, ptr %60, align 1, !dbg !654
  br i1 %154, label %mir.bb21, label %mir.bb22, !dbg !654

mir.bb20:                                         ; No predecessors!
  br label %mir.bb19, !dbg !654

mir.bb21:                                         ; preds = %mir.bb19
  %155 = load i32, ptr %65, align 4, !dbg !656
  %156 = icmp sle i32 %155, 57, !dbg !656
  store i1 %156, ptr %59, align 1, !dbg !656
  %157 = load i1, ptr %59, align 1, !dbg !656
  store i1 %157, ptr %60, align 1, !dbg !656
  br label %mir.bb22, !dbg !656

mir.bb22:                                         ; preds = %mir.bb21, %mir.bb19
  %158 = load i1, ptr %60, align 1, !dbg !656
  br i1 %158, label %mir.bb23, label %mir.bb24, !dbg !656

mir.bb23:                                         ; preds = %mir.bb22
  %159 = load i64, ptr %81, align 8, !dbg !658
  %160 = add nsw i64 %159, 1, !dbg !658
  store i64 %160, ptr %58, align 8, !dbg !658
  %161 = load i64, ptr %58, align 8, !dbg !658
  store i64 %161, ptr %57, align 8, !dbg !658
  %162 = load i64, ptr %57, align 8, !dbg !658
  store i64 %162, ptr %56, align 8, !dbg !658
  br label %mir.bb26, !dbg !658

mir.bb24:                                         ; preds = %mir.bb22
  br label %mir.bb25, !dbg !658

mir.bb25:                                         ; preds = %mir.bb37, %mir.bb24
  %163 = load i32, ptr %65, align 4, !dbg !660
  %164 = icmp eq i32 %163, 123, !dbg !660
  store i1 %164, ptr %55, align 1, !dbg !660
  %165 = load i1, ptr %55, align 1, !dbg !660
  br i1 %165, label %mir.bb38, label %mir.bb39, !dbg !660

mir.bb26:                                         ; preds = %mir.bb27, %mir.bb23
  %166 = load %str, ptr %83, align 8, !dbg !660
  %167 = extractvalue %str %166, 1, !dbg !660
  store i64 %167, ptr %54, align 8, !dbg !660
  br label %mir.bb29, !dbg !660

mir.bb27:                                         ; preds = %mir.bb34
  %168 = load i64, ptr %56, align 8, !dbg !662
  %169 = add nsw i64 %168, 1, !dbg !662
  store i64 %169, ptr %53, align 8, !dbg !662
  %170 = load i64, ptr %53, align 8, !dbg !662
  store i64 %170, ptr %56, align 8, !dbg !662
  br label %mir.bb26, !dbg !662

mir.bb28:                                         ; preds = %mir.bb34
  %171 = load ptr, ptr %84, align 8, !dbg !662
  %172 = load %str, ptr %83, align 8, !dbg !662
  %173 = load i64, ptr %57, align 8, !dbg !662
  %174 = load i64, ptr %56, align 8, !dbg !662
  %175 = call %str @regex_expand_numbered_capture(ptr %171, %str %172, i64 %173, i64 %174), !dbg !662
  store %str %175, ptr %52, align 8, !dbg !662
  br label %mir.bb36, !dbg !662

mir.bb29:                                         ; preds = %mir.bb26
  %176 = load i64, ptr %56, align 8, !dbg !664
  %177 = load i64, ptr %54, align 8, !dbg !664
  %178 = icmp slt i64 %176, %177, !dbg !664
  store i1 %178, ptr %51, align 1, !dbg !664
  %179 = load i1, ptr %51, align 1, !dbg !664
  store i1 %179, ptr %50, align 1, !dbg !664
  %180 = load i1, ptr %50, align 1, !dbg !664
  br i1 %180, label %mir.bb30, label %mir.bb31, !dbg !664

mir.bb30:                                         ; preds = %mir.bb29
  %181 = load %str, ptr %83, align 8, !dbg !664
  %182 = load i64, ptr %56, align 8, !dbg !664
  %183 = call i32 @with_str_byte_at(%str %181, i64 %182), !dbg !664
  store i32 %183, ptr %49, align 4, !dbg !664
  br label %mir.bb32, !dbg !664

mir.bb31:                                         ; preds = %mir.bb32, %mir.bb29
  %184 = load i1, ptr %50, align 1, !dbg !666
  store i1 %184, ptr %48, align 1, !dbg !666
  %185 = load i1, ptr %48, align 1, !dbg !666
  br i1 %185, label %mir.bb33, label %mir.bb34, !dbg !666

mir.bb32:                                         ; preds = %mir.bb30
  %186 = load i32, ptr %49, align 4, !dbg !668
  %187 = icmp sge i32 %186, 48, !dbg !668
  store i1 %187, ptr %47, align 1, !dbg !668
  %188 = load i1, ptr %47, align 1, !dbg !668
  store i1 %188, ptr %50, align 1, !dbg !668
  br label %mir.bb31, !dbg !668

mir.bb33:                                         ; preds = %mir.bb31
  %189 = load %str, ptr %83, align 8, !dbg !668
  %190 = load i64, ptr %56, align 8, !dbg !668
  %191 = call i32 @with_str_byte_at(%str %189, i64 %190), !dbg !668
  store i32 %191, ptr %46, align 4, !dbg !668
  br label %mir.bb35, !dbg !668

mir.bb34:                                         ; preds = %mir.bb35, %mir.bb31
  %192 = load i1, ptr %48, align 1, !dbg !668
  br i1 %192, label %mir.bb27, label %mir.bb28, !dbg !668

mir.bb35:                                         ; preds = %mir.bb33
  %193 = load i32, ptr %46, align 4, !dbg !670
  %194 = icmp sle i32 %193, 57, !dbg !670
  store i1 %194, ptr %45, align 1, !dbg !670
  %195 = load i1, ptr %45, align 1, !dbg !670
  store i1 %195, ptr %48, align 1, !dbg !670
  br label %mir.bb34, !dbg !670

mir.bb36:                                         ; preds = %mir.bb28
  %196 = load %str, ptr %82, align 8, !dbg !672
  %197 = load %str, ptr %52, align 8, !dbg !672
  %198 = call %str @with_str_concat(%str %196, %str %197), !dbg !672
  store %str %198, ptr %44, align 8, !dbg !672
  %199 = load %str, ptr %44, align 8, !dbg !672
  store %str %199, ptr %82, align 8, !dbg !672
  %200 = load i64, ptr %56, align 8, !dbg !672
  store i64 %200, ptr %81, align 8, !dbg !672
  br label %mir.bb1, !dbg !672

mir.bb37:                                         ; No predecessors!
  br label %mir.bb25, !dbg !672

mir.bb38:                                         ; preds = %mir.bb25
  %201 = load i64, ptr %81, align 8, !dbg !674
  %202 = add nsw i64 %201, 2, !dbg !674
  store i64 %202, ptr %43, align 8, !dbg !674
  %203 = load i64, ptr %43, align 8, !dbg !674
  store i64 %203, ptr %42, align 8, !dbg !674
  br label %mir.bb41, !dbg !674

mir.bb39:                                         ; preds = %mir.bb25
  br label %mir.bb40, !dbg !674

mir.bb40:                                         ; preds = %mir.bb51, %mir.bb39
  %204 = load i32, ptr %65, align 4, !dbg !674
  %205 = call i1 @regex_is_name_start(i32 %204), !dbg !674
  store i1 %205, ptr %41, align 1, !dbg !674
  br label %mir.bb59, !dbg !674

mir.bb41:                                         ; preds = %mir.bb42, %mir.bb38
  %206 = load %str, ptr %83, align 8, !dbg !674
  %207 = extractvalue %str %206, 1, !dbg !674
  store i64 %207, ptr %40, align 8, !dbg !674
  br label %mir.bb44, !dbg !674

mir.bb42:                                         ; preds = %mir.bb46
  %208 = load i64, ptr %42, align 8, !dbg !676
  %209 = add nsw i64 %208, 1, !dbg !676
  store i64 %209, ptr %39, align 8, !dbg !676
  %210 = load i64, ptr %39, align 8, !dbg !676
  store i64 %210, ptr %42, align 8, !dbg !676
  br label %mir.bb41, !dbg !676

mir.bb43:                                         ; preds = %mir.bb46
  %211 = load %str, ptr %83, align 8, !dbg !676
  %212 = extractvalue %str %211, 1, !dbg !676
  store i64 %212, ptr %38, align 8, !dbg !676
  br label %mir.bb48, !dbg !676

mir.bb44:                                         ; preds = %mir.bb41
  %213 = load i64, ptr %42, align 8, !dbg !678
  %214 = load i64, ptr %40, align 8, !dbg !678
  %215 = icmp slt i64 %213, %214, !dbg !678
  store i1 %215, ptr %37, align 1, !dbg !678
  %216 = load i1, ptr %37, align 1, !dbg !678
  store i1 %216, ptr %36, align 1, !dbg !678
  %217 = load i1, ptr %36, align 1, !dbg !678
  br i1 %217, label %mir.bb45, label %mir.bb46, !dbg !678

mir.bb45:                                         ; preds = %mir.bb44
  %218 = load %str, ptr %83, align 8, !dbg !678
  %219 = load i64, ptr %42, align 8, !dbg !678
  %220 = call i32 @with_str_byte_at(%str %218, i64 %219), !dbg !678
  store i32 %220, ptr %35, align 4, !dbg !678
  br label %mir.bb47, !dbg !678

mir.bb46:                                         ; preds = %mir.bb47, %mir.bb44
  %221 = load i1, ptr %36, align 1, !dbg !678
  br i1 %221, label %mir.bb42, label %mir.bb43, !dbg !678

mir.bb47:                                         ; preds = %mir.bb45
  %222 = load i32, ptr %35, align 4, !dbg !680
  %223 = icmp ne i32 %222, 125, !dbg !680
  store i1 %223, ptr %34, align 1, !dbg !680
  %224 = load i1, ptr %34, align 1, !dbg !680
  store i1 %224, ptr %36, align 1, !dbg !680
  br label %mir.bb46, !dbg !680

mir.bb48:                                         ; preds = %mir.bb43
  %225 = load i64, ptr %42, align 8, !dbg !682
  %226 = load i64, ptr %38, align 8, !dbg !682
  %227 = icmp slt i64 %225, %226, !dbg !682
  store i1 %227, ptr %33, align 1, !dbg !682
  %228 = load i1, ptr %33, align 1, !dbg !682
  br i1 %228, label %mir.bb49, label %mir.bb50, !dbg !682

mir.bb49:                                         ; preds = %mir.bb48
  %229 = load i64, ptr %81, align 8, !dbg !684
  %230 = add nsw i64 %229, 2, !dbg !684
  store i64 %230, ptr %32, align 8, !dbg !684
  %231 = load %str, ptr %83, align 8, !dbg !684
  %232 = load i64, ptr %32, align 8, !dbg !684
  %233 = load i64, ptr %42, align 8, !dbg !684
  %234 = call %str @with_str_slice(%str %231, i64 %232, i64 %233), !dbg !684
  store %str %234, ptr %31, align 8, !dbg !684
  br label %mir.bb52, !dbg !684

mir.bb50:                                         ; preds = %mir.bb48
  br label %mir.bb51, !dbg !684

mir.bb51:                                         ; preds = %mir.bb58, %mir.bb50
  br label %mir.bb40, !dbg !684

mir.bb52:                                         ; preds = %mir.bb49
  %235 = load %str, ptr %31, align 8, !dbg !686
  store %str %235, ptr %30, align 8, !dbg !686
  %236 = load ptr, ptr %84, align 8, !dbg !686
  %237 = load %str, ptr %30, align 8, !dbg !686
  %238 = call { i32, %Match } @Captures.name(ptr %236, %str %237), !dbg !686
  store { i32, %Match } %238, ptr %29, align 8, !dbg !686
  br label %mir.bb53, !dbg !686

mir.bb53:                                         ; preds = %mir.bb52
  %239 = load { i32, %Match }, ptr %29, align 8, !dbg !688
  store { i32, %Match } %239, ptr %28, align 8, !dbg !688
  %240 = load { i32, %Match }, ptr %28, align 8, !dbg !688
  %241 = extractvalue { i32, %Match } %240, 0, !dbg !688
  store i32 %241, ptr %27, align 4, !dbg !688
  %242 = load i32, ptr %27, align 4, !dbg !688
  switch i32 %242, label %mir.bb56 [
    i32 0, label %mir.bb55
  ], !dbg !688

mir.bb54:                                         ; preds = %mir.bb57, %mir.bb56, %mir.bb55
  %243 = load i64, ptr %42, align 8, !dbg !690
  %244 = add nsw i64 %243, 1, !dbg !690
  store i64 %244, ptr %26, align 8, !dbg !690
  %245 = load i64, ptr %26, align 8, !dbg !690
  store i64 %245, ptr %81, align 8, !dbg !690
  br label %mir.bb1, !dbg !690

mir.bb55:                                         ; preds = %mir.bb53
  %246 = getelementptr inbounds nuw { i32, %Match }, ptr %28, i32 0, i32 1, !dbg !692
  %247 = getelementptr inbounds nuw { %Match }, ptr %246, i32 0, i32 0, !dbg !692
  %248 = load %Match, ptr %247, align 8, !dbg !692
  store %Match %248, ptr %25, align 8, !dbg !692
  %249 = load %str, ptr %82, align 8, !dbg !692
  %250 = getelementptr inbounds nuw %Match, ptr %25, i32 0, i32 0, !dbg !692
  %251 = load %str, ptr %250, align 8, !dbg !692
  %252 = call %str @with_str_concat(%str %249, %str %251), !dbg !692
  store %str %252, ptr %24, align 8, !dbg !692
  %253 = load %str, ptr %24, align 8, !dbg !692
  store %str %253, ptr %82, align 8, !dbg !692
  %254 = load %str, ptr %24, align 8, !dbg !692
  store %str %254, ptr %23, align 8, !dbg !692
  br label %mir.bb54, !dbg !692

mir.bb56:                                         ; preds = %mir.bb53
  %255 = load { i32, %Match }, ptr %28, align 8, !dbg !692
  %256 = extractvalue { i32, %Match } %255, 0, !dbg !692
  store i32 %256, ptr %22, align 4, !dbg !692
  %257 = load i32, ptr %22, align 4, !dbg !692
  switch i32 %257, label %mir.bb54 [
    i32 1, label %mir.bb57
  ], !dbg !692

mir.bb57:                                         ; preds = %mir.bb56
  store i32 0, ptr %23, align 4, !dbg !694
  br label %mir.bb54, !dbg !694

mir.bb58:                                         ; No predecessors!
  br label %mir.bb51, !dbg !694

mir.bb59:                                         ; preds = %mir.bb40
  %258 = load i1, ptr %41, align 1, !dbg !694
  br i1 %258, label %mir.bb60, label %mir.bb61, !dbg !694

mir.bb60:                                         ; preds = %mir.bb59
  %259 = load i64, ptr %81, align 8, !dbg !696
  %260 = add nsw i64 %259, 1, !dbg !696
  store i64 %260, ptr %21, align 8, !dbg !696
  %261 = load i64, ptr %21, align 8, !dbg !696
  store i64 %261, ptr %20, align 8, !dbg !696
  %262 = load i64, ptr %20, align 8, !dbg !696
  store i64 %262, ptr %19, align 8, !dbg !696
  br label %mir.bb63, !dbg !696

mir.bb61:                                         ; preds = %mir.bb59
  br label %mir.bb62, !dbg !696

mir.bb62:                                         ; preds = %mir.bb77, %mir.bb61
  %263 = load %str, ptr %82, align 8, !dbg !698
  %264 = alloca %str, align 8, !dbg !698
  %265 = getelementptr inbounds nuw %str, ptr %264, i32 0, i32 0, !dbg !698
  store ptr @10, ptr %265, align 8, !dbg !698
  %266 = getelementptr inbounds nuw %str, ptr %264, i32 0, i32 1, !dbg !698
  store i64 1, ptr %266, align 8, !dbg !698
  %267 = load %str, ptr %264, align 8, !dbg !698
  %268 = call %str @with_str_concat(%str %263, %str %267), !dbg !698
  store %str %268, ptr %18, align 8, !dbg !698
  %269 = load %str, ptr %18, align 8, !dbg !698
  store %str %269, ptr %82, align 8, !dbg !698
  %270 = load i64, ptr %81, align 8, !dbg !698
  %271 = add nsw i64 %270, 1, !dbg !698
  store i64 %271, ptr %17, align 8, !dbg !698
  %272 = load i64, ptr %17, align 8, !dbg !698
  store i64 %272, ptr %81, align 8, !dbg !698
  br label %mir.bb1, !dbg !698

mir.bb63:                                         ; preds = %mir.bb64, %mir.bb60
  %273 = load %str, ptr %83, align 8, !dbg !698
  %274 = extractvalue %str %273, 1, !dbg !698
  store i64 %274, ptr %16, align 8, !dbg !698
  br label %mir.bb66, !dbg !698

mir.bb64:                                         ; preds = %mir.bb68
  %275 = load i64, ptr %19, align 8, !dbg !700
  %276 = add nsw i64 %275, 1, !dbg !700
  store i64 %276, ptr %15, align 8, !dbg !700
  %277 = load i64, ptr %15, align 8, !dbg !700
  store i64 %277, ptr %19, align 8, !dbg !700
  br label %mir.bb63, !dbg !700

mir.bb65:                                         ; preds = %mir.bb68
  %278 = load %str, ptr %83, align 8, !dbg !702
  %279 = load i64, ptr %20, align 8, !dbg !702
  %280 = load i64, ptr %19, align 8, !dbg !702
  %281 = call %str @with_str_slice(%str %278, i64 %279, i64 %280), !dbg !702
  store %str %281, ptr %14, align 8, !dbg !702
  br label %mir.bb71, !dbg !702

mir.bb66:                                         ; preds = %mir.bb63
  %282 = load i64, ptr %19, align 8, !dbg !704
  %283 = load i64, ptr %16, align 8, !dbg !704
  %284 = icmp slt i64 %282, %283, !dbg !704
  store i1 %284, ptr %13, align 1, !dbg !704
  %285 = load i1, ptr %13, align 1, !dbg !704
  store i1 %285, ptr %12, align 1, !dbg !704
  %286 = load i1, ptr %12, align 1, !dbg !704
  br i1 %286, label %mir.bb67, label %mir.bb68, !dbg !704

mir.bb67:                                         ; preds = %mir.bb66
  %287 = load %str, ptr %83, align 8, !dbg !704
  %288 = load i64, ptr %19, align 8, !dbg !704
  %289 = call i32 @with_str_byte_at(%str %287, i64 %288), !dbg !704
  store i32 %289, ptr %11, align 4, !dbg !704
  br label %mir.bb69, !dbg !704

mir.bb68:                                         ; preds = %mir.bb70, %mir.bb66
  %290 = load i1, ptr %12, align 1, !dbg !704
  br i1 %290, label %mir.bb64, label %mir.bb65, !dbg !704

mir.bb69:                                         ; preds = %mir.bb67
  %291 = load i32, ptr %11, align 4, !dbg !704
  %292 = call i1 @regex_is_name_continue(i32 %291), !dbg !704
  store i1 %292, ptr %10, align 1, !dbg !704
  br label %mir.bb70, !dbg !704

mir.bb70:                                         ; preds = %mir.bb69
  %293 = load i1, ptr %10, align 1, !dbg !706
  store i1 %293, ptr %12, align 1, !dbg !706
  br label %mir.bb68, !dbg !706

mir.bb71:                                         ; preds = %mir.bb65
  %294 = load %str, ptr %14, align 8, !dbg !708
  store %str %294, ptr %9, align 8, !dbg !708
  %295 = load ptr, ptr %84, align 8, !dbg !708
  %296 = load %str, ptr %9, align 8, !dbg !708
  %297 = call { i32, %Match } @Captures.name(ptr %295, %str %296), !dbg !708
  store { i32, %Match } %297, ptr %8, align 8, !dbg !708
  br label %mir.bb72, !dbg !708

mir.bb72:                                         ; preds = %mir.bb71
  %298 = load { i32, %Match }, ptr %8, align 8, !dbg !710
  store { i32, %Match } %298, ptr %7, align 8, !dbg !710
  %299 = load { i32, %Match }, ptr %7, align 8, !dbg !710
  %300 = extractvalue { i32, %Match } %299, 0, !dbg !710
  store i32 %300, ptr %6, align 4, !dbg !710
  %301 = load i32, ptr %6, align 4, !dbg !710
  switch i32 %301, label %mir.bb75 [
    i32 0, label %mir.bb74
  ], !dbg !710

mir.bb73:                                         ; preds = %mir.bb76, %mir.bb75, %mir.bb74
  %302 = load i64, ptr %19, align 8, !dbg !712
  store i64 %302, ptr %81, align 8, !dbg !712
  br label %mir.bb1, !dbg !712

mir.bb74:                                         ; preds = %mir.bb72
  %303 = getelementptr inbounds nuw { i32, %Match }, ptr %7, i32 0, i32 1, !dbg !714
  %304 = getelementptr inbounds nuw { %Match }, ptr %303, i32 0, i32 0, !dbg !714
  %305 = load %Match, ptr %304, align 8, !dbg !714
  store %Match %305, ptr %5, align 8, !dbg !714
  %306 = load %str, ptr %82, align 8, !dbg !714
  %307 = getelementptr inbounds nuw %Match, ptr %5, i32 0, i32 0, !dbg !714
  %308 = load %str, ptr %307, align 8, !dbg !714
  %309 = call %str @with_str_concat(%str %306, %str %308), !dbg !714
  store %str %309, ptr %4, align 8, !dbg !714
  %310 = load %str, ptr %4, align 8, !dbg !714
  store %str %310, ptr %82, align 8, !dbg !714
  %311 = load %str, ptr %4, align 8, !dbg !714
  store %str %311, ptr %3, align 8, !dbg !714
  br label %mir.bb73, !dbg !714

mir.bb75:                                         ; preds = %mir.bb72
  %312 = load { i32, %Match }, ptr %7, align 8, !dbg !714
  %313 = extractvalue { i32, %Match } %312, 0, !dbg !714
  store i32 %313, ptr %2, align 4, !dbg !714
  %314 = load i32, ptr %2, align 4, !dbg !714
  switch i32 %314, label %mir.bb73 [
    i32 1, label %mir.bb76
  ], !dbg !714

mir.bb76:                                         ; preds = %mir.bb75
  store i32 0, ptr %3, align 4, !dbg !716
  br label %mir.bb73, !dbg !716

mir.bb77:                                         ; No predecessors!
  br label %mir.bb62, !dbg !716

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !716
}

define internal %str @Regex.replace_impl(ptr %0, %str %1, %str %2, i1 %3) !dbg !718 {
entry:
  %4 = alloca %str, align 8, !dbg !719
  %5 = alloca %str, align 8, !dbg !719
  %6 = alloca i64, align 8, !dbg !719
  %7 = alloca i64, align 8, !dbg !719
  %8 = alloca %str, align 8, !dbg !719
  %9 = alloca %str, align 8, !dbg !719
  %10 = alloca i64, align 8, !dbg !719
  %11 = alloca i64, align 8, !dbg !719
  %12 = alloca i32, align 4, !dbg !719
  %13 = alloca %str, align 8, !dbg !719
  %14 = alloca i32, align 4, !dbg !719
  %15 = alloca i32, align 4, !dbg !719
  %16 = alloca i32, align 4, !dbg !719
  %17 = alloca %str, align 8, !dbg !719
  %18 = alloca i64, align 8, !dbg !719
  %19 = alloca i64, align 8, !dbg !719
  %20 = alloca i64, align 8, !dbg !719
  %21 = alloca i64, align 8, !dbg !719
  %22 = alloca i1, align 1, !dbg !719
  %23 = alloca i32, align 4, !dbg !719
  %24 = alloca i32, align 4, !dbg !719
  %25 = alloca i64, align 8, !dbg !719
  %26 = alloca %str, align 8, !dbg !719
  %27 = alloca %str, align 8, !dbg !719
  %28 = alloca i1, align 1, !dbg !719
  %29 = alloca i64, align 8, !dbg !719
  %30 = alloca i64, align 8, !dbg !719
  %31 = alloca i1, align 1, !dbg !719
  %32 = alloca %str, align 8, !dbg !719
  %33 = alloca %str, align 8, !dbg !719
  %34 = alloca ptr, align 8, !dbg !719
  %35 = alloca %str, align 8, !dbg !719
  %36 = alloca i32, align 4, !dbg !719
  %37 = alloca %str, align 8, !dbg !719
  %38 = alloca i64, align 8, !dbg !719
  %39 = alloca i64, align 8, !dbg !719
  %40 = alloca %Match, align 8, !dbg !719
  %41 = alloca i32, align 4, !dbg !719
  %42 = alloca i32, align 4, !dbg !719
  %43 = alloca i32, align 4, !dbg !719
  %44 = alloca { i32, %Match }, align 8, !dbg !719
  %45 = alloca i32, align 4, !dbg !719
  %46 = alloca { i32, %Match }, align 8, !dbg !719
  %47 = alloca i32, align 4, !dbg !719
  %48 = alloca { i32, %Captures }, align 8, !dbg !719
  %49 = alloca i1, align 1, !dbg !719
  %50 = alloca i32, align 4, !dbg !719
  %51 = alloca %Captures, align 8, !dbg !719
  %52 = alloca { i32, %Captures }, align 8, !dbg !719
  %53 = alloca i64, align 8, !dbg !719
  %54 = alloca i32, align 4, !dbg !719
  %55 = alloca %str, align 8, !dbg !719
  %56 = alloca i1, align 1, !dbg !719
  %57 = alloca %str, align 8, !dbg !719
  %58 = alloca %str, align 8, !dbg !719
  %59 = alloca ptr, align 8, !dbg !719
  %60 = alloca %str, align 8, !dbg !719
  store ptr %0, ptr %59, align 8, !dbg !719
  store %str %1, ptr %58, align 8, !dbg !719
  store %str %2, ptr %57, align 8, !dbg !719
  store i1 %3, ptr %56, align 1, !dbg !719
  br label %mir.bb0, !dbg !719

mir.bb0:                                          ; preds = %entry
  %61 = alloca %str, align 8, !dbg !719
  %62 = getelementptr inbounds nuw %str, ptr %61, i32 0, i32 0, !dbg !719
  store ptr @11, ptr %62, align 8, !dbg !719
  %63 = getelementptr inbounds nuw %str, ptr %61, i32 0, i32 1, !dbg !719
  store i64 0, ptr %63, align 8, !dbg !719
  %64 = load %str, ptr %61, align 8, !dbg !719
  store %str %64, ptr %55, align 8, !dbg !719
  store i32 0, ptr %54, align 4, !dbg !719
  br label %mir.bb1, !dbg !719

mir.bb1:                                          ; preds = %mir.bb6, %mir.bb0
  %65 = load %str, ptr %58, align 8, !dbg !719
  %66 = extractvalue %str %65, 1, !dbg !719
  store i64 %66, ptr %53, align 8, !dbg !719
  br label %mir.bb4, !dbg !719

mir.bb2:                                          ; preds = %mir.bb4
  %67 = load ptr, ptr %59, align 8, !dbg !719
  %68 = load %str, ptr %58, align 8, !dbg !719
  %69 = load i32, ptr %54, align 4, !dbg !719
  %70 = call { i32, %Captures } @Regex.captures_at(ptr %67, %str %68, i32 %69), !dbg !719
  store { i32, %Captures } %70, ptr %52, align 8, !dbg !719
  br label %mir.bb5, !dbg !719

mir.bb3:                                          ; preds = %mir.bb36, %mir.bb32, %mir.bb19, %mir.bb4
  %71 = load %str, ptr %55, align 8, !dbg !719
  store %str %71, ptr %60, align 8, !dbg !719
  %72 = load %str, ptr %60, align 8, !dbg !719
  ret %str %72, !dbg !719

mir.bb4:                                          ; preds = %mir.bb1
  %73 = load i64, ptr %53, align 8, !dbg !720
  %74 = trunc i64 %73 to i32, !dbg !720
  store i32 %74, ptr %50, align 4, !dbg !720
  %75 = load i32, ptr %54, align 4, !dbg !720
  %76 = load i32, ptr %50, align 4, !dbg !720
  %77 = icmp sle i32 %75, %76, !dbg !720
  store i1 %77, ptr %49, align 1, !dbg !720
  %78 = load i1, ptr %49, align 1, !dbg !720
  br i1 %78, label %mir.bb2, label %mir.bb3, !dbg !720

mir.bb5:                                          ; preds = %mir.bb2
  %79 = load { i32, %Captures }, ptr %52, align 8, !dbg !722
  store { i32, %Captures } %79, ptr %48, align 8, !dbg !722
  %80 = load { i32, %Captures }, ptr %48, align 8, !dbg !722
  %81 = extractvalue { i32, %Captures } %80, 0, !dbg !722
  store i32 %81, ptr %47, align 4, !dbg !722
  %82 = load i32, ptr %47, align 4, !dbg !722
  switch i32 %82, label %mir.bb8 [
    i32 0, label %mir.bb7
  ], !dbg !722

mir.bb6:                                          ; preds = %mir.bb37, %mir.bb10, %mir.bb8
  br label %mir.bb1, !dbg !722

mir.bb7:                                          ; preds = %mir.bb5
  %83 = getelementptr inbounds nuw { i32, %Captures }, ptr %48, i32 0, i32 1, !dbg !724
  %84 = getelementptr inbounds nuw { %Captures }, ptr %83, i32 0, i32 0, !dbg !724
  %85 = load %Captures, ptr %84, align 8, !dbg !724
  store %Captures %85, ptr %51, align 8, !dbg !724
  %86 = load %Captures, ptr %51, align 8, !dbg !724
  %87 = call { i32, %Match } @Captures.get(ptr %51, i32 0), !dbg !724
  store { i32, %Match } %87, ptr %46, align 8, !dbg !724
  br label %mir.bb9, !dbg !724

mir.bb8:                                          ; preds = %mir.bb5
  %88 = load { i32, %Captures }, ptr %48, align 8, !dbg !724
  %89 = extractvalue { i32, %Captures } %88, 0, !dbg !724
  store i32 %89, ptr %45, align 4, !dbg !724
  %90 = load i32, ptr %45, align 4, !dbg !724
  switch i32 %90, label %mir.bb6 [
    i32 1, label %mir.bb34
  ], !dbg !724

mir.bb9:                                          ; preds = %mir.bb7
  %91 = load { i32, %Match }, ptr %46, align 8, !dbg !726
  store { i32, %Match } %91, ptr %44, align 8, !dbg !726
  %92 = load { i32, %Match }, ptr %44, align 8, !dbg !726
  %93 = extractvalue { i32, %Match } %92, 0, !dbg !726
  store i32 %93, ptr %43, align 4, !dbg !726
  %94 = load i32, ptr %43, align 4, !dbg !726
  switch i32 %94, label %mir.bb12 [
    i32 0, label %mir.bb11
  ], !dbg !726

mir.bb10:                                         ; preds = %mir.bb33, %mir.bb23, %mir.bb12
  %95 = load i32, ptr %42, align 4, !dbg !728
  store i32 %95, ptr %41, align 4, !dbg !728
  br label %mir.bb6, !dbg !728

mir.bb11:                                         ; preds = %mir.bb9
  %96 = getelementptr inbounds nuw { i32, %Match }, ptr %44, i32 0, i32 1, !dbg !730
  %97 = getelementptr inbounds nuw { %Match }, ptr %96, i32 0, i32 0, !dbg !730
  %98 = load %Match, ptr %97, align 8, !dbg !730
  store %Match %98, ptr %40, align 8, !dbg !730
  %99 = load i32, ptr %54, align 4, !dbg !730
  %100 = sext i32 %99 to i64, !dbg !730
  store i64 %100, ptr %39, align 8, !dbg !730
  %101 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 1, !dbg !730
  %102 = load i32, ptr %101, align 4, !dbg !730
  %103 = sext i32 %102 to i64, !dbg !730
  store i64 %103, ptr %38, align 8, !dbg !730
  %104 = load %str, ptr %58, align 8, !dbg !730
  %105 = load i64, ptr %39, align 8, !dbg !730
  %106 = load i64, ptr %38, align 8, !dbg !730
  %107 = call %str @with_str_slice(%str %104, i64 %105, i64 %106), !dbg !730
  store %str %107, ptr %37, align 8, !dbg !730
  br label %mir.bb13, !dbg !730

mir.bb12:                                         ; preds = %mir.bb9
  %108 = load { i32, %Match }, ptr %44, align 8, !dbg !730
  %109 = extractvalue { i32, %Match } %108, 0, !dbg !730
  store i32 %109, ptr %36, align 4, !dbg !730
  %110 = load i32, ptr %36, align 4, !dbg !730
  switch i32 %110, label %mir.bb10 [
    i32 1, label %mir.bb30
  ], !dbg !730

mir.bb13:                                         ; preds = %mir.bb11
  %111 = load %str, ptr %55, align 8, !dbg !732
  %112 = load %str, ptr %37, align 8, !dbg !732
  %113 = call %str @with_str_concat(%str %111, %str %112), !dbg !732
  store %str %113, ptr %35, align 8, !dbg !732
  store ptr %51, ptr %34, align 8, !dbg !732
  %114 = load ptr, ptr %34, align 8, !dbg !732
  %115 = load %str, ptr %57, align 8, !dbg !732
  %116 = call %str @regex_expand_replacement(ptr %114, %str %115), !dbg !732
  store %str %116, ptr %33, align 8, !dbg !732
  br label %mir.bb14, !dbg !732

mir.bb14:                                         ; preds = %mir.bb13
  %117 = load %str, ptr %35, align 8, !dbg !734
  %118 = load %str, ptr %33, align 8, !dbg !734
  %119 = call %str @with_str_concat(%str %117, %str %118), !dbg !734
  store %str %119, ptr %32, align 8, !dbg !734
  %120 = load %str, ptr %32, align 8, !dbg !734
  store %str %120, ptr %55, align 8, !dbg !734
  %121 = load i1, ptr %56, align 1, !dbg !734
  %122 = xor i1 %121, true, !dbg !734
  store i1 %122, ptr %31, align 1, !dbg !734
  %123 = load i1, ptr %31, align 1, !dbg !734
  br i1 %123, label %mir.bb15, label %mir.bb16, !dbg !734

mir.bb15:                                         ; preds = %mir.bb14
  %124 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 2, !dbg !736
  %125 = load i32, ptr %124, align 4, !dbg !736
  %126 = sext i32 %125 to i64, !dbg !736
  store i64 %126, ptr %30, align 8, !dbg !736
  %127 = load %str, ptr %58, align 8, !dbg !736
  %128 = extractvalue %str %127, 1, !dbg !736
  store i64 %128, ptr %29, align 8, !dbg !736
  br label %mir.bb18, !dbg !736

mir.bb16:                                         ; preds = %mir.bb14
  br label %mir.bb17, !dbg !736

mir.bb17:                                         ; preds = %mir.bb20, %mir.bb16
  %129 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 2, !dbg !738
  %130 = load i32, ptr %129, align 4, !dbg !738
  %131 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 1, !dbg !738
  %132 = load i32, ptr %131, align 4, !dbg !738
  %133 = icmp eq i32 %130, %132, !dbg !738
  store i1 %133, ptr %28, align 1, !dbg !738
  %134 = load i1, ptr %28, align 1, !dbg !738
  br i1 %134, label %mir.bb21, label %mir.bb22, !dbg !738

mir.bb18:                                         ; preds = %mir.bb15
  %135 = load %str, ptr %58, align 8, !dbg !738
  %136 = load i64, ptr %30, align 8, !dbg !738
  %137 = load i64, ptr %29, align 8, !dbg !738
  %138 = call %str @with_str_slice(%str %135, i64 %136, i64 %137), !dbg !738
  store %str %138, ptr %27, align 8, !dbg !738
  br label %mir.bb19, !dbg !738

mir.bb19:                                         ; preds = %mir.bb18
  %139 = load %str, ptr %55, align 8, !dbg !740
  %140 = load %str, ptr %27, align 8, !dbg !740
  %141 = call %str @with_str_concat(%str %139, %str %140), !dbg !740
  store %str %141, ptr %26, align 8, !dbg !740
  %142 = load %str, ptr %26, align 8, !dbg !740
  store %str %142, ptr %55, align 8, !dbg !740
  br label %mir.bb3, !dbg !740

mir.bb20:                                         ; No predecessors!
  br label %mir.bb17, !dbg !740

mir.bb21:                                         ; preds = %mir.bb17
  %143 = load %str, ptr %58, align 8, !dbg !740
  %144 = extractvalue %str %143, 1, !dbg !740
  store i64 %144, ptr %25, align 8, !dbg !740
  br label %mir.bb24, !dbg !740

mir.bb22:                                         ; preds = %mir.bb17
  %145 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 2, !dbg !742
  %146 = load i32, ptr %145, align 4, !dbg !742
  store i32 %146, ptr %54, align 4, !dbg !742
  %147 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 2, !dbg !742
  %148 = load i32, ptr %147, align 4, !dbg !742
  store i32 %148, ptr %24, align 4, !dbg !742
  br label %mir.bb23, !dbg !742

mir.bb23:                                         ; preds = %mir.bb27, %mir.bb22
  %149 = load i32, ptr %24, align 4, !dbg !744
  store i32 %149, ptr %42, align 4, !dbg !744
  br label %mir.bb10, !dbg !744

mir.bb24:                                         ; preds = %mir.bb21
  %150 = load i64, ptr %25, align 8, !dbg !746
  %151 = trunc i64 %150 to i32, !dbg !746
  store i32 %151, ptr %23, align 4, !dbg !746
  %152 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 2, !dbg !746
  %153 = load i32, ptr %152, align 4, !dbg !746
  %154 = load i32, ptr %23, align 4, !dbg !746
  %155 = icmp sge i32 %153, %154, !dbg !746
  store i1 %155, ptr %22, align 1, !dbg !746
  %156 = load i1, ptr %22, align 1, !dbg !746
  br i1 %156, label %mir.bb25, label %mir.bb26, !dbg !746

mir.bb25:                                         ; preds = %mir.bb24
  %157 = load %str, ptr %58, align 8, !dbg !746
  %158 = extractvalue %str %157, 1, !dbg !746
  store i64 %158, ptr %21, align 8, !dbg !746
  br label %mir.bb28, !dbg !746

mir.bb26:                                         ; preds = %mir.bb24
  %159 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 1, !dbg !748
  %160 = load i32, ptr %159, align 4, !dbg !748
  %161 = sext i32 %160 to i64, !dbg !748
  store i64 %161, ptr %20, align 8, !dbg !748
  %162 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 1, !dbg !748
  %163 = load i32, ptr %162, align 4, !dbg !748
  %164 = sext i32 %163 to i64, !dbg !748
  store i64 %164, ptr %19, align 8, !dbg !748
  %165 = load i64, ptr %19, align 8, !dbg !748
  %166 = add nsw i64 %165, 1, !dbg !748
  store i64 %166, ptr %18, align 8, !dbg !748
  %167 = load %str, ptr %58, align 8, !dbg !748
  %168 = load i64, ptr %20, align 8, !dbg !748
  %169 = load i64, ptr %18, align 8, !dbg !748
  %170 = call %str @with_str_slice(%str %167, i64 %168, i64 %169), !dbg !748
  store %str %170, ptr %17, align 8, !dbg !748
  br label %mir.bb29, !dbg !748

mir.bb27:                                         ; preds = %mir.bb29, %mir.bb28
  %171 = load i32, ptr %16, align 4, !dbg !750
  store i32 %171, ptr %24, align 4, !dbg !750
  br label %mir.bb23, !dbg !750

mir.bb28:                                         ; preds = %mir.bb25
  %172 = load i64, ptr %21, align 8, !dbg !752
  %173 = trunc i64 %172 to i32, !dbg !752
  store i32 %173, ptr %15, align 4, !dbg !752
  %174 = load i32, ptr %15, align 4, !dbg !752
  %175 = add nsw i32 %174, 1, !dbg !752
  store i32 %175, ptr %14, align 4, !dbg !752
  %176 = load i32, ptr %14, align 4, !dbg !752
  store i32 %176, ptr %54, align 4, !dbg !752
  %177 = load i32, ptr %14, align 4, !dbg !752
  store i32 %177, ptr %16, align 4, !dbg !752
  br label %mir.bb27, !dbg !752

mir.bb29:                                         ; preds = %mir.bb26
  %178 = load %str, ptr %55, align 8, !dbg !754
  %179 = load %str, ptr %17, align 8, !dbg !754
  %180 = call %str @with_str_concat(%str %178, %str %179), !dbg !754
  store %str %180, ptr %13, align 8, !dbg !754
  %181 = load %str, ptr %13, align 8, !dbg !754
  store %str %181, ptr %55, align 8, !dbg !754
  %182 = getelementptr inbounds nuw %Match, ptr %40, i32 0, i32 1, !dbg !754
  %183 = load i32, ptr %182, align 4, !dbg !754
  %184 = add nsw i32 %183, 1, !dbg !754
  store i32 %184, ptr %12, align 4, !dbg !754
  %185 = load i32, ptr %12, align 4, !dbg !754
  store i32 %185, ptr %54, align 4, !dbg !754
  %186 = load i32, ptr %12, align 4, !dbg !754
  store i32 %186, ptr %16, align 4, !dbg !754
  br label %mir.bb27, !dbg !754

mir.bb30:                                         ; preds = %mir.bb12
  %187 = load i32, ptr %54, align 4, !dbg !756
  %188 = sext i32 %187 to i64, !dbg !756
  store i64 %188, ptr %11, align 8, !dbg !756
  %189 = load %str, ptr %58, align 8, !dbg !756
  %190 = extractvalue %str %189, 1, !dbg !756
  store i64 %190, ptr %10, align 8, !dbg !756
  br label %mir.bb31, !dbg !756

mir.bb31:                                         ; preds = %mir.bb30
  %191 = load %str, ptr %58, align 8, !dbg !756
  %192 = load i64, ptr %11, align 8, !dbg !756
  %193 = load i64, ptr %10, align 8, !dbg !756
  %194 = call %str @with_str_slice(%str %191, i64 %192, i64 %193), !dbg !756
  store %str %194, ptr %9, align 8, !dbg !756
  br label %mir.bb32, !dbg !756

mir.bb32:                                         ; preds = %mir.bb31
  %195 = load %str, ptr %55, align 8, !dbg !758
  %196 = load %str, ptr %9, align 8, !dbg !758
  %197 = call %str @with_str_concat(%str %195, %str %196), !dbg !758
  store %str %197, ptr %8, align 8, !dbg !758
  %198 = load %str, ptr %8, align 8, !dbg !758
  store %str %198, ptr %55, align 8, !dbg !758
  br label %mir.bb3, !dbg !758

mir.bb33:                                         ; No predecessors!
  store i32 0, ptr %42, align 4, !dbg !760
  br label %mir.bb10, !dbg !760

mir.bb34:                                         ; preds = %mir.bb8
  %199 = load i32, ptr %54, align 4, !dbg !762
  %200 = sext i32 %199 to i64, !dbg !762
  store i64 %200, ptr %7, align 8, !dbg !762
  %201 = load %str, ptr %58, align 8, !dbg !762
  %202 = extractvalue %str %201, 1, !dbg !762
  store i64 %202, ptr %6, align 8, !dbg !762
  br label %mir.bb35, !dbg !762

mir.bb35:                                         ; preds = %mir.bb34
  %203 = load %str, ptr %58, align 8, !dbg !762
  %204 = load i64, ptr %7, align 8, !dbg !762
  %205 = load i64, ptr %6, align 8, !dbg !762
  %206 = call %str @with_str_slice(%str %203, i64 %204, i64 %205), !dbg !762
  store %str %206, ptr %5, align 8, !dbg !762
  br label %mir.bb36, !dbg !762

mir.bb36:                                         ; preds = %mir.bb35
  %207 = load %str, ptr %55, align 8, !dbg !764
  %208 = load %str, ptr %5, align 8, !dbg !764
  %209 = call %str @with_str_concat(%str %207, %str %208), !dbg !764
  store %str %209, ptr %4, align 8, !dbg !764
  %210 = load %str, ptr %4, align 8, !dbg !764
  store %str %210, ptr %55, align 8, !dbg !764
  br label %mir.bb3, !dbg !764

mir.bb37:                                         ; No predecessors!
  store i32 0, ptr %41, align 4, !dbg !766
  br label %mir.bb6, !dbg !766

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !766
}

define internal %str @Regex.replace(ptr %0, %str %1, %str %2) !dbg !768 {
entry:
  %3 = alloca %str, align 8, !dbg !769
  %4 = alloca i32, align 4, !dbg !769
  %5 = alloca i1, align 1, !dbg !769
  %6 = alloca %str, align 8, !dbg !769
  %7 = alloca %str, align 8, !dbg !769
  %8 = alloca ptr, align 8, !dbg !769
  %9 = alloca %str, align 8, !dbg !769
  store ptr %0, ptr %8, align 8, !dbg !769
  store %str %1, ptr %7, align 8, !dbg !769
  store %str %2, ptr %6, align 8, !dbg !769
  br label %mir.bb0, !dbg !769

mir.bb0:                                          ; preds = %entry
  %10 = load ptr, ptr %8, align 8, !dbg !769
  %11 = call i1 @Regex.is_global(ptr %10), !dbg !769
  store i1 %11, ptr %5, align 1, !dbg !769
  br label %mir.bb1, !dbg !769

mir.bb1:                                          ; preds = %mir.bb0
  %12 = load i1, ptr %5, align 1, !dbg !769
  br i1 %12, label %mir.bb2, label %mir.bb3, !dbg !769

mir.bb2:                                          ; preds = %mir.bb1
  store i32 1, ptr %4, align 4, !dbg !770
  br label %mir.bb4, !dbg !770

mir.bb3:                                          ; preds = %mir.bb1
  store i32 0, ptr %4, align 4, !dbg !772
  br label %mir.bb4, !dbg !772

mir.bb4:                                          ; preds = %mir.bb3, %mir.bb2
  %13 = load ptr, ptr %8, align 8, !dbg !772
  %14 = getelementptr inbounds nuw %Regex, ptr %13, i32 0, i32 0, !dbg !772
  %15 = load ptr, ptr %14, align 8, !dbg !772
  %16 = load %str, ptr %7, align 8, !dbg !772
  %17 = load %str, ptr %6, align 8, !dbg !772
  %18 = load i32, ptr %4, align 4, !dbg !772
  %19 = call %str @with_regex_substitute(ptr %15, %str %16, %str %17, i32 %18), !dbg !772
  store %str %19, ptr %3, align 8, !dbg !772
  br label %mir.bb5, !dbg !772

mir.bb5:                                          ; preds = %mir.bb4
  %20 = load %str, ptr %3, align 8, !dbg !774
  store %str %20, ptr %9, align 8, !dbg !774
  %21 = load %str, ptr %9, align 8, !dbg !774
  ret %str %21, !dbg !774

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !774
}

define internal %str @Regex.replace_all(ptr %0, %str %1, %str %2) !dbg !776 {
entry:
  %3 = alloca %str, align 8, !dbg !777
  %4 = alloca %str, align 8, !dbg !777
  %5 = alloca %str, align 8, !dbg !777
  %6 = alloca ptr, align 8, !dbg !777
  %7 = alloca %str, align 8, !dbg !777
  store ptr %0, ptr %6, align 8, !dbg !777
  store %str %1, ptr %5, align 8, !dbg !777
  store %str %2, ptr %4, align 8, !dbg !777
  br label %mir.bb0, !dbg !777

mir.bb0:                                          ; preds = %entry
  %8 = load ptr, ptr %6, align 8, !dbg !777
  %9 = getelementptr inbounds nuw %Regex, ptr %8, i32 0, i32 0, !dbg !777
  %10 = load ptr, ptr %9, align 8, !dbg !777
  %11 = load %str, ptr %5, align 8, !dbg !777
  %12 = load %str, ptr %4, align 8, !dbg !777
  %13 = call %str @with_regex_substitute(ptr %10, %str %11, %str %12, i32 1), !dbg !777
  store %str %13, ptr %3, align 8, !dbg !777
  br label %mir.bb1, !dbg !777

mir.bb1:                                          ; preds = %mir.bb0
  %14 = load %str, ptr %3, align 8, !dbg !778
  store %str %14, ptr %7, align 8, !dbg !778
  %15 = load %str, ptr %7, align 8, !dbg !778
  ret %str %15, !dbg !778
}

define internal %str @Regex.replace_fn(ptr %0, %str %1, { ptr, ptr } %2) !dbg !780 {
entry:
  %3 = alloca i32, align 4, !dbg !781
  %4 = alloca %str, align 8, !dbg !781
  %5 = alloca %str, align 8, !dbg !781
  %6 = alloca i64, align 8, !dbg !781
  %7 = alloca i64, align 8, !dbg !781
  %8 = alloca %str, align 8, !dbg !781
  %9 = alloca %str, align 8, !dbg !781
  %10 = alloca ptr, align 8, !dbg !781
  %11 = alloca %str, align 8, !dbg !781
  %12 = alloca i32, align 4, !dbg !781
  %13 = alloca %str, align 8, !dbg !781
  %14 = alloca i64, align 8, !dbg !781
  %15 = alloca i64, align 8, !dbg !781
  %16 = alloca %Match, align 8, !dbg !781
  %17 = alloca i32, align 4, !dbg !781
  %18 = alloca i32, align 4, !dbg !781
  %19 = alloca { i32, %Match }, align 8, !dbg !781
  %20 = alloca i32, align 4, !dbg !781
  %21 = alloca { i32, %Match }, align 8, !dbg !781
  %22 = alloca i32, align 4, !dbg !781
  %23 = alloca { i32, %Captures }, align 8, !dbg !781
  %24 = alloca i1, align 1, !dbg !781
  %25 = alloca i32, align 4, !dbg !781
  %26 = alloca %Captures, align 8, !dbg !781
  %27 = alloca { i32, %Captures }, align 8, !dbg !781
  %28 = alloca i64, align 8, !dbg !781
  %29 = alloca i32, align 4, !dbg !781
  %30 = alloca %str, align 8, !dbg !781
  %31 = alloca { ptr, ptr }, align 8, !dbg !781
  %32 = alloca %str, align 8, !dbg !781
  %33 = alloca ptr, align 8, !dbg !781
  %34 = alloca %str, align 8, !dbg !781
  store ptr %0, ptr %33, align 8, !dbg !781
  store %str %1, ptr %32, align 8, !dbg !781
  store { ptr, ptr } %2, ptr %31, align 8, !dbg !781
  br label %mir.bb0, !dbg !781

mir.bb0:                                          ; preds = %entry
  %35 = alloca %str, align 8, !dbg !781
  %36 = getelementptr inbounds nuw %str, ptr %35, i32 0, i32 0, !dbg !781
  store ptr @12, ptr %36, align 8, !dbg !781
  %37 = getelementptr inbounds nuw %str, ptr %35, i32 0, i32 1, !dbg !781
  store i64 0, ptr %37, align 8, !dbg !781
  %38 = load %str, ptr %35, align 8, !dbg !781
  store %str %38, ptr %30, align 8, !dbg !781
  store i32 0, ptr %29, align 4, !dbg !781
  br label %mir.bb1, !dbg !781

mir.bb1:                                          ; preds = %mir.bb6, %mir.bb0
  %39 = load %str, ptr %32, align 8, !dbg !781
  %40 = extractvalue %str %39, 1, !dbg !781
  store i64 %40, ptr %28, align 8, !dbg !781
  br label %mir.bb4, !dbg !781

mir.bb2:                                          ; preds = %mir.bb4
  %41 = load ptr, ptr %33, align 8, !dbg !781
  %42 = load %str, ptr %32, align 8, !dbg !781
  %43 = load i32, ptr %29, align 4, !dbg !781
  %44 = call { i32, %Captures } @Regex.captures_at(ptr %41, %str %42, i32 %43), !dbg !781
  store { i32, %Captures } %44, ptr %27, align 8, !dbg !781
  br label %mir.bb5, !dbg !781

mir.bb3:                                          ; preds = %mir.bb20, %mir.bb18, %mir.bb4
  %45 = load %str, ptr %32, align 8, !dbg !781
  store %str %45, ptr %34, align 8, !dbg !781
  %46 = load %str, ptr %34, align 8, !dbg !781
  ret %str %46, !dbg !781

mir.bb4:                                          ; preds = %mir.bb1
  %47 = load i64, ptr %28, align 8, !dbg !782
  %48 = trunc i64 %47 to i32, !dbg !782
  store i32 %48, ptr %25, align 4, !dbg !782
  %49 = load i32, ptr %29, align 4, !dbg !782
  %50 = load i32, ptr %25, align 4, !dbg !782
  %51 = icmp sle i32 %49, %50, !dbg !782
  store i1 %51, ptr %24, align 1, !dbg !782
  %52 = load i1, ptr %24, align 1, !dbg !782
  br i1 %52, label %mir.bb2, label %mir.bb3, !dbg !782

mir.bb5:                                          ; preds = %mir.bb2
  %53 = load { i32, %Captures }, ptr %27, align 8, !dbg !784
  store { i32, %Captures } %53, ptr %23, align 8, !dbg !784
  %54 = load { i32, %Captures }, ptr %23, align 8, !dbg !784
  %55 = extractvalue { i32, %Captures } %54, 0, !dbg !784
  store i32 %55, ptr %22, align 4, !dbg !784
  %56 = load i32, ptr %22, align 4, !dbg !784
  switch i32 %56, label %mir.bb8 [
    i32 0, label %mir.bb7
  ], !dbg !784

mir.bb6:                                          ; preds = %mir.bb21, %mir.bb10, %mir.bb8
  br label %mir.bb1, !dbg !784

mir.bb7:                                          ; preds = %mir.bb5
  %57 = getelementptr inbounds nuw { i32, %Captures }, ptr %23, i32 0, i32 1, !dbg !786
  %58 = getelementptr inbounds nuw { %Captures }, ptr %57, i32 0, i32 0, !dbg !786
  %59 = load %Captures, ptr %58, align 8, !dbg !786
  store %Captures %59, ptr %26, align 8, !dbg !786
  %60 = load %Captures, ptr %26, align 8, !dbg !786
  %61 = call { i32, %Match } @Captures.get(ptr %26, i32 0), !dbg !786
  store { i32, %Match } %61, ptr %21, align 8, !dbg !786
  br label %mir.bb9, !dbg !786

mir.bb8:                                          ; preds = %mir.bb5
  %62 = load { i32, %Captures }, ptr %23, align 8, !dbg !786
  %63 = extractvalue { i32, %Captures } %62, 0, !dbg !786
  store i32 %63, ptr %20, align 4, !dbg !786
  %64 = load i32, ptr %20, align 4, !dbg !786
  switch i32 %64, label %mir.bb6 [
    i32 1, label %mir.bb20
  ], !dbg !786

mir.bb9:                                          ; preds = %mir.bb7
  %65 = load { i32, %Match }, ptr %21, align 8, !dbg !788
  store { i32, %Match } %65, ptr %19, align 8, !dbg !788
  %66 = load { i32, %Match }, ptr %19, align 8, !dbg !788
  %67 = extractvalue { i32, %Match } %66, 0, !dbg !788
  store i32 %67, ptr %18, align 4, !dbg !788
  %68 = load i32, ptr %18, align 4, !dbg !788
  switch i32 %68, label %mir.bb12 [
    i32 0, label %mir.bb11
  ], !dbg !788

mir.bb10:                                         ; preds = %mir.bb19, %mir.bb17, %mir.bb12
  store i32 undef, ptr %17, align 4, !dbg !790
  br label %mir.bb6, !dbg !790

mir.bb11:                                         ; preds = %mir.bb9
  %69 = getelementptr inbounds nuw { i32, %Match }, ptr %19, i32 0, i32 1, !dbg !792
  %70 = getelementptr inbounds nuw { %Match }, ptr %69, i32 0, i32 0, !dbg !792
  %71 = load %Match, ptr %70, align 8, !dbg !792
  store %Match %71, ptr %16, align 8, !dbg !792
  %72 = load i32, ptr %29, align 4, !dbg !792
  %73 = sext i32 %72 to i64, !dbg !792
  store i64 %73, ptr %15, align 8, !dbg !792
  %74 = getelementptr inbounds nuw %Match, ptr %16, i32 0, i32 1, !dbg !792
  %75 = load i32, ptr %74, align 4, !dbg !792
  %76 = sext i32 %75 to i64, !dbg !792
  store i64 %76, ptr %14, align 8, !dbg !792
  %77 = load %str, ptr %32, align 8, !dbg !792
  %78 = load i64, ptr %15, align 8, !dbg !792
  %79 = load i64, ptr %14, align 8, !dbg !792
  %80 = call %str @with_str_slice(%str %77, i64 %78, i64 %79), !dbg !792
  store %str %80, ptr %13, align 8, !dbg !792
  br label %mir.bb13, !dbg !792

mir.bb12:                                         ; preds = %mir.bb9
  %81 = load { i32, %Match }, ptr %19, align 8, !dbg !792
  %82 = extractvalue { i32, %Match } %81, 0, !dbg !792
  store i32 %82, ptr %12, align 4, !dbg !792
  %83 = load i32, ptr %12, align 4, !dbg !792
  switch i32 %83, label %mir.bb10 [
    i32 1, label %mir.bb18
  ], !dbg !792

mir.bb13:                                         ; preds = %mir.bb11
  %84 = load %str, ptr %30, align 8, !dbg !794
  %85 = load %str, ptr %13, align 8, !dbg !794
  %86 = call %str @with_str_concat(%str %84, %str %85), !dbg !794
  store %str %86, ptr %11, align 8, !dbg !794
  store ptr %26, ptr %10, align 8, !dbg !794
  %87 = load { ptr, ptr }, ptr %31, align 8, !dbg !794
  %88 = extractvalue { ptr, ptr } %87, 0, !dbg !794
  %89 = extractvalue { ptr, ptr } %87, 1, !dbg !794
  %90 = load ptr, ptr %10, align 8, !dbg !794
  %91 = call %str %88(ptr %89, ptr %90), !dbg !794
  store %str %91, ptr %9, align 8, !dbg !794
  br label %mir.bb14, !dbg !794

mir.bb14:                                         ; preds = %mir.bb13
  %92 = load %str, ptr %11, align 8, !dbg !796
  %93 = load %str, ptr %9, align 8, !dbg !796
  %94 = call %str @with_str_concat(%str %92, %str %93), !dbg !796
  store %str %94, ptr %8, align 8, !dbg !796
  %95 = load %str, ptr %8, align 8, !dbg !796
  store %str %95, ptr %30, align 8, !dbg !796
  %96 = getelementptr inbounds nuw %Match, ptr %16, i32 0, i32 2, !dbg !796
  %97 = load i32, ptr %96, align 4, !dbg !796
  %98 = sext i32 %97 to i64, !dbg !796
  store i64 %98, ptr %7, align 8, !dbg !796
  %99 = load %str, ptr %32, align 8, !dbg !796
  %100 = extractvalue %str %99, 1, !dbg !796
  store i64 %100, ptr %6, align 8, !dbg !796
  br label %mir.bb15, !dbg !796

mir.bb15:                                         ; preds = %mir.bb14
  %101 = load %str, ptr %32, align 8, !dbg !796
  %102 = load i64, ptr %7, align 8, !dbg !796
  %103 = load i64, ptr %6, align 8, !dbg !796
  %104 = call %str @with_str_slice(%str %101, i64 %102, i64 %103), !dbg !796
  store %str %104, ptr %5, align 8, !dbg !796
  br label %mir.bb16, !dbg !796

mir.bb16:                                         ; preds = %mir.bb15
  %105 = load %str, ptr %30, align 8, !dbg !798
  %106 = load %str, ptr %5, align 8, !dbg !798
  %107 = call %str @with_str_concat(%str %105, %str %106), !dbg !798
  store %str %107, ptr %4, align 8, !dbg !798
  %108 = load %str, ptr %4, align 8, !dbg !798
  store %str %108, ptr %30, align 8, !dbg !798
  %109 = load %str, ptr %30, align 8, !dbg !798
  store %str %109, ptr %34, align 8, !dbg !798
  %110 = load %str, ptr %34, align 8, !dbg !798
  ret %str %110, !dbg !798

mir.bb17:                                         ; No predecessors!
  store i32 0, ptr %3, align 4, !dbg !800
  br label %mir.bb10, !dbg !800

mir.bb18:                                         ; preds = %mir.bb12
  br label %mir.bb3, !dbg !800

mir.bb19:                                         ; No predecessors!
  store i32 0, ptr %3, align 4, !dbg !802
  br label %mir.bb10, !dbg !802

mir.bb20:                                         ; preds = %mir.bb8
  br label %mir.bb3, !dbg !802

mir.bb21:                                         ; No predecessors!
  store i32 0, ptr %17, align 4, !dbg !804
  br label %mir.bb6, !dbg !804

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !804
}

define internal %str @Regex.replace_all_fn(ptr %0, %str %1, { ptr, ptr } %2) !dbg !806 {
entry:
  %3 = alloca %str, align 8, !dbg !807
  %4 = alloca %str, align 8, !dbg !807
  %5 = alloca i64, align 8, !dbg !807
  %6 = alloca i64, align 8, !dbg !807
  %7 = alloca %str, align 8, !dbg !807
  %8 = alloca %str, align 8, !dbg !807
  %9 = alloca i64, align 8, !dbg !807
  %10 = alloca i64, align 8, !dbg !807
  %11 = alloca i32, align 4, !dbg !807
  %12 = alloca %str, align 8, !dbg !807
  %13 = alloca i32, align 4, !dbg !807
  %14 = alloca i32, align 4, !dbg !807
  %15 = alloca i32, align 4, !dbg !807
  %16 = alloca %str, align 8, !dbg !807
  %17 = alloca i64, align 8, !dbg !807
  %18 = alloca i64, align 8, !dbg !807
  %19 = alloca i64, align 8, !dbg !807
  %20 = alloca i64, align 8, !dbg !807
  %21 = alloca i1, align 1, !dbg !807
  %22 = alloca i32, align 4, !dbg !807
  %23 = alloca i32, align 4, !dbg !807
  %24 = alloca i64, align 8, !dbg !807
  %25 = alloca i1, align 1, !dbg !807
  %26 = alloca %str, align 8, !dbg !807
  %27 = alloca %str, align 8, !dbg !807
  %28 = alloca ptr, align 8, !dbg !807
  %29 = alloca %str, align 8, !dbg !807
  %30 = alloca i32, align 4, !dbg !807
  %31 = alloca %str, align 8, !dbg !807
  %32 = alloca i64, align 8, !dbg !807
  %33 = alloca i64, align 8, !dbg !807
  %34 = alloca %Match, align 8, !dbg !807
  %35 = alloca i32, align 4, !dbg !807
  %36 = alloca i32, align 4, !dbg !807
  %37 = alloca i32, align 4, !dbg !807
  %38 = alloca { i32, %Match }, align 8, !dbg !807
  %39 = alloca i32, align 4, !dbg !807
  %40 = alloca { i32, %Match }, align 8, !dbg !807
  %41 = alloca i32, align 4, !dbg !807
  %42 = alloca { i32, %Captures }, align 8, !dbg !807
  %43 = alloca i1, align 1, !dbg !807
  %44 = alloca i32, align 4, !dbg !807
  %45 = alloca %Captures, align 8, !dbg !807
  %46 = alloca { i32, %Captures }, align 8, !dbg !807
  %47 = alloca i64, align 8, !dbg !807
  %48 = alloca i32, align 4, !dbg !807
  %49 = alloca %str, align 8, !dbg !807
  %50 = alloca { ptr, ptr }, align 8, !dbg !807
  %51 = alloca %str, align 8, !dbg !807
  %52 = alloca ptr, align 8, !dbg !807
  %53 = alloca %str, align 8, !dbg !807
  store ptr %0, ptr %52, align 8, !dbg !807
  store %str %1, ptr %51, align 8, !dbg !807
  store { ptr, ptr } %2, ptr %50, align 8, !dbg !807
  br label %mir.bb0, !dbg !807

mir.bb0:                                          ; preds = %entry
  %54 = alloca %str, align 8, !dbg !807
  %55 = getelementptr inbounds nuw %str, ptr %54, i32 0, i32 0, !dbg !807
  store ptr @13, ptr %55, align 8, !dbg !807
  %56 = getelementptr inbounds nuw %str, ptr %54, i32 0, i32 1, !dbg !807
  store i64 0, ptr %56, align 8, !dbg !807
  %57 = load %str, ptr %54, align 8, !dbg !807
  store %str %57, ptr %49, align 8, !dbg !807
  store i32 0, ptr %48, align 4, !dbg !807
  br label %mir.bb1, !dbg !807

mir.bb1:                                          ; preds = %mir.bb6, %mir.bb0
  %58 = load %str, ptr %51, align 8, !dbg !807
  %59 = extractvalue %str %58, 1, !dbg !807
  store i64 %59, ptr %47, align 8, !dbg !807
  br label %mir.bb4, !dbg !807

mir.bb2:                                          ; preds = %mir.bb4
  %60 = load ptr, ptr %52, align 8, !dbg !807
  %61 = load %str, ptr %51, align 8, !dbg !807
  %62 = load i32, ptr %48, align 4, !dbg !807
  %63 = call { i32, %Captures } @Regex.captures_at(ptr %60, %str %61, i32 %62), !dbg !807
  store { i32, %Captures } %63, ptr %46, align 8, !dbg !807
  br label %mir.bb5, !dbg !807

mir.bb3:                                          ; preds = %mir.bb4
  %64 = load %str, ptr %49, align 8, !dbg !807
  store %str %64, ptr %53, align 8, !dbg !807
  %65 = load %str, ptr %53, align 8, !dbg !807
  ret %str %65, !dbg !807

mir.bb4:                                          ; preds = %mir.bb1
  %66 = load i64, ptr %47, align 8, !dbg !808
  %67 = trunc i64 %66 to i32, !dbg !808
  store i32 %67, ptr %44, align 4, !dbg !808
  %68 = load i32, ptr %48, align 4, !dbg !808
  %69 = load i32, ptr %44, align 4, !dbg !808
  %70 = icmp sle i32 %68, %69, !dbg !808
  store i1 %70, ptr %43, align 1, !dbg !808
  %71 = load i1, ptr %43, align 1, !dbg !808
  br i1 %71, label %mir.bb2, label %mir.bb3, !dbg !808

mir.bb5:                                          ; preds = %mir.bb2
  %72 = load { i32, %Captures }, ptr %46, align 8, !dbg !810
  store { i32, %Captures } %72, ptr %42, align 8, !dbg !810
  %73 = load { i32, %Captures }, ptr %42, align 8, !dbg !810
  %74 = extractvalue { i32, %Captures } %73, 0, !dbg !810
  store i32 %74, ptr %41, align 4, !dbg !810
  %75 = load i32, ptr %41, align 4, !dbg !810
  switch i32 %75, label %mir.bb8 [
    i32 0, label %mir.bb7
  ], !dbg !810

mir.bb6:                                          ; preds = %mir.bb31, %mir.bb10, %mir.bb8
  br label %mir.bb1, !dbg !810

mir.bb7:                                          ; preds = %mir.bb5
  %76 = getelementptr inbounds nuw { i32, %Captures }, ptr %42, i32 0, i32 1, !dbg !812
  %77 = getelementptr inbounds nuw { %Captures }, ptr %76, i32 0, i32 0, !dbg !812
  %78 = load %Captures, ptr %77, align 8, !dbg !812
  store %Captures %78, ptr %45, align 8, !dbg !812
  %79 = load %Captures, ptr %45, align 8, !dbg !812
  %80 = call { i32, %Match } @Captures.get(ptr %45, i32 0), !dbg !812
  store { i32, %Match } %80, ptr %40, align 8, !dbg !812
  br label %mir.bb9, !dbg !812

mir.bb8:                                          ; preds = %mir.bb5
  %81 = load { i32, %Captures }, ptr %42, align 8, !dbg !812
  %82 = extractvalue { i32, %Captures } %81, 0, !dbg !812
  store i32 %82, ptr %39, align 4, !dbg !812
  %83 = load i32, ptr %39, align 4, !dbg !812
  switch i32 %83, label %mir.bb6 [
    i32 1, label %mir.bb28
  ], !dbg !812

mir.bb9:                                          ; preds = %mir.bb7
  %84 = load { i32, %Match }, ptr %40, align 8, !dbg !814
  store { i32, %Match } %84, ptr %38, align 8, !dbg !814
  %85 = load { i32, %Match }, ptr %38, align 8, !dbg !814
  %86 = extractvalue { i32, %Match } %85, 0, !dbg !814
  store i32 %86, ptr %37, align 4, !dbg !814
  %87 = load i32, ptr %37, align 4, !dbg !814
  switch i32 %87, label %mir.bb12 [
    i32 0, label %mir.bb11
  ], !dbg !814

mir.bb10:                                         ; preds = %mir.bb27, %mir.bb17, %mir.bb12
  %88 = load i32, ptr %36, align 4, !dbg !816
  store i32 %88, ptr %35, align 4, !dbg !816
  br label %mir.bb6, !dbg !816

mir.bb11:                                         ; preds = %mir.bb9
  %89 = getelementptr inbounds nuw { i32, %Match }, ptr %38, i32 0, i32 1, !dbg !818
  %90 = getelementptr inbounds nuw { %Match }, ptr %89, i32 0, i32 0, !dbg !818
  %91 = load %Match, ptr %90, align 8, !dbg !818
  store %Match %91, ptr %34, align 8, !dbg !818
  %92 = load i32, ptr %48, align 4, !dbg !818
  %93 = sext i32 %92 to i64, !dbg !818
  store i64 %93, ptr %33, align 8, !dbg !818
  %94 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 1, !dbg !818
  %95 = load i32, ptr %94, align 4, !dbg !818
  %96 = sext i32 %95 to i64, !dbg !818
  store i64 %96, ptr %32, align 8, !dbg !818
  %97 = load %str, ptr %51, align 8, !dbg !818
  %98 = load i64, ptr %33, align 8, !dbg !818
  %99 = load i64, ptr %32, align 8, !dbg !818
  %100 = call %str @with_str_slice(%str %97, i64 %98, i64 %99), !dbg !818
  store %str %100, ptr %31, align 8, !dbg !818
  br label %mir.bb13, !dbg !818

mir.bb12:                                         ; preds = %mir.bb9
  %101 = load { i32, %Match }, ptr %38, align 8, !dbg !818
  %102 = extractvalue { i32, %Match } %101, 0, !dbg !818
  store i32 %102, ptr %30, align 4, !dbg !818
  %103 = load i32, ptr %30, align 4, !dbg !818
  switch i32 %103, label %mir.bb10 [
    i32 1, label %mir.bb24
  ], !dbg !818

mir.bb13:                                         ; preds = %mir.bb11
  %104 = load %str, ptr %49, align 8, !dbg !820
  %105 = load %str, ptr %31, align 8, !dbg !820
  %106 = call %str @with_str_concat(%str %104, %str %105), !dbg !820
  store %str %106, ptr %29, align 8, !dbg !820
  store ptr %45, ptr %28, align 8, !dbg !820
  %107 = load { ptr, ptr }, ptr %50, align 8, !dbg !820
  %108 = extractvalue { ptr, ptr } %107, 0, !dbg !820
  %109 = extractvalue { ptr, ptr } %107, 1, !dbg !820
  %110 = load ptr, ptr %28, align 8, !dbg !820
  %111 = call %str %108(ptr %109, ptr %110), !dbg !820
  store %str %111, ptr %27, align 8, !dbg !820
  br label %mir.bb14, !dbg !820

mir.bb14:                                         ; preds = %mir.bb13
  %112 = load %str, ptr %29, align 8, !dbg !822
  %113 = load %str, ptr %27, align 8, !dbg !822
  %114 = call %str @with_str_concat(%str %112, %str %113), !dbg !822
  store %str %114, ptr %26, align 8, !dbg !822
  %115 = load %str, ptr %26, align 8, !dbg !822
  store %str %115, ptr %49, align 8, !dbg !822
  %116 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 2, !dbg !822
  %117 = load i32, ptr %116, align 4, !dbg !822
  %118 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 1, !dbg !822
  %119 = load i32, ptr %118, align 4, !dbg !822
  %120 = icmp eq i32 %117, %119, !dbg !822
  store i1 %120, ptr %25, align 1, !dbg !822
  %121 = load i1, ptr %25, align 1, !dbg !822
  br i1 %121, label %mir.bb15, label %mir.bb16, !dbg !822

mir.bb15:                                         ; preds = %mir.bb14
  %122 = load %str, ptr %51, align 8, !dbg !822
  %123 = extractvalue %str %122, 1, !dbg !822
  store i64 %123, ptr %24, align 8, !dbg !822
  br label %mir.bb18, !dbg !822

mir.bb16:                                         ; preds = %mir.bb14
  %124 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 2, !dbg !824
  %125 = load i32, ptr %124, align 4, !dbg !824
  store i32 %125, ptr %48, align 4, !dbg !824
  %126 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 2, !dbg !824
  %127 = load i32, ptr %126, align 4, !dbg !824
  store i32 %127, ptr %23, align 4, !dbg !824
  br label %mir.bb17, !dbg !824

mir.bb17:                                         ; preds = %mir.bb21, %mir.bb16
  %128 = load i32, ptr %23, align 4, !dbg !826
  store i32 %128, ptr %36, align 4, !dbg !826
  br label %mir.bb10, !dbg !826

mir.bb18:                                         ; preds = %mir.bb15
  %129 = load i64, ptr %24, align 8, !dbg !828
  %130 = trunc i64 %129 to i32, !dbg !828
  store i32 %130, ptr %22, align 4, !dbg !828
  %131 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 2, !dbg !828
  %132 = load i32, ptr %131, align 4, !dbg !828
  %133 = load i32, ptr %22, align 4, !dbg !828
  %134 = icmp sge i32 %132, %133, !dbg !828
  store i1 %134, ptr %21, align 1, !dbg !828
  %135 = load i1, ptr %21, align 1, !dbg !828
  br i1 %135, label %mir.bb19, label %mir.bb20, !dbg !828

mir.bb19:                                         ; preds = %mir.bb18
  %136 = load %str, ptr %51, align 8, !dbg !828
  %137 = extractvalue %str %136, 1, !dbg !828
  store i64 %137, ptr %20, align 8, !dbg !828
  br label %mir.bb22, !dbg !828

mir.bb20:                                         ; preds = %mir.bb18
  %138 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 1, !dbg !830
  %139 = load i32, ptr %138, align 4, !dbg !830
  %140 = sext i32 %139 to i64, !dbg !830
  store i64 %140, ptr %19, align 8, !dbg !830
  %141 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 1, !dbg !830
  %142 = load i32, ptr %141, align 4, !dbg !830
  %143 = sext i32 %142 to i64, !dbg !830
  store i64 %143, ptr %18, align 8, !dbg !830
  %144 = load i64, ptr %18, align 8, !dbg !830
  %145 = add nsw i64 %144, 1, !dbg !830
  store i64 %145, ptr %17, align 8, !dbg !830
  %146 = load %str, ptr %51, align 8, !dbg !830
  %147 = load i64, ptr %19, align 8, !dbg !830
  %148 = load i64, ptr %17, align 8, !dbg !830
  %149 = call %str @with_str_slice(%str %146, i64 %147, i64 %148), !dbg !830
  store %str %149, ptr %16, align 8, !dbg !830
  br label %mir.bb23, !dbg !830

mir.bb21:                                         ; preds = %mir.bb23, %mir.bb22
  %150 = load i32, ptr %15, align 4, !dbg !832
  store i32 %150, ptr %23, align 4, !dbg !832
  br label %mir.bb17, !dbg !832

mir.bb22:                                         ; preds = %mir.bb19
  %151 = load i64, ptr %20, align 8, !dbg !834
  %152 = trunc i64 %151 to i32, !dbg !834
  store i32 %152, ptr %14, align 4, !dbg !834
  %153 = load i32, ptr %14, align 4, !dbg !834
  %154 = add nsw i32 %153, 1, !dbg !834
  store i32 %154, ptr %13, align 4, !dbg !834
  %155 = load i32, ptr %13, align 4, !dbg !834
  store i32 %155, ptr %48, align 4, !dbg !834
  %156 = load i32, ptr %13, align 4, !dbg !834
  store i32 %156, ptr %15, align 4, !dbg !834
  br label %mir.bb21, !dbg !834

mir.bb23:                                         ; preds = %mir.bb20
  %157 = load %str, ptr %49, align 8, !dbg !836
  %158 = load %str, ptr %16, align 8, !dbg !836
  %159 = call %str @with_str_concat(%str %157, %str %158), !dbg !836
  store %str %159, ptr %12, align 8, !dbg !836
  %160 = load %str, ptr %12, align 8, !dbg !836
  store %str %160, ptr %49, align 8, !dbg !836
  %161 = getelementptr inbounds nuw %Match, ptr %34, i32 0, i32 1, !dbg !836
  %162 = load i32, ptr %161, align 4, !dbg !836
  %163 = add nsw i32 %162, 1, !dbg !836
  store i32 %163, ptr %11, align 4, !dbg !836
  %164 = load i32, ptr %11, align 4, !dbg !836
  store i32 %164, ptr %48, align 4, !dbg !836
  %165 = load i32, ptr %11, align 4, !dbg !836
  store i32 %165, ptr %15, align 4, !dbg !836
  br label %mir.bb21, !dbg !836

mir.bb24:                                         ; preds = %mir.bb12
  %166 = load i32, ptr %48, align 4, !dbg !838
  %167 = sext i32 %166 to i64, !dbg !838
  store i64 %167, ptr %10, align 8, !dbg !838
  %168 = load %str, ptr %51, align 8, !dbg !838
  %169 = extractvalue %str %168, 1, !dbg !838
  store i64 %169, ptr %9, align 8, !dbg !838
  br label %mir.bb25, !dbg !838

mir.bb25:                                         ; preds = %mir.bb24
  %170 = load %str, ptr %51, align 8, !dbg !838
  %171 = load i64, ptr %10, align 8, !dbg !838
  %172 = load i64, ptr %9, align 8, !dbg !838
  %173 = call %str @with_str_slice(%str %170, i64 %171, i64 %172), !dbg !838
  store %str %173, ptr %8, align 8, !dbg !838
  br label %mir.bb26, !dbg !838

mir.bb26:                                         ; preds = %mir.bb25
  %174 = load %str, ptr %49, align 8, !dbg !840
  %175 = load %str, ptr %8, align 8, !dbg !840
  %176 = call %str @with_str_concat(%str %174, %str %175), !dbg !840
  store %str %176, ptr %7, align 8, !dbg !840
  %177 = load %str, ptr %7, align 8, !dbg !840
  store %str %177, ptr %49, align 8, !dbg !840
  %178 = load %str, ptr %49, align 8, !dbg !840
  store %str %178, ptr %53, align 8, !dbg !840
  %179 = load %str, ptr %53, align 8, !dbg !840
  ret %str %179, !dbg !840

mir.bb27:                                         ; No predecessors!
  store i32 0, ptr %36, align 4, !dbg !842
  br label %mir.bb10, !dbg !842

mir.bb28:                                         ; preds = %mir.bb8
  %180 = load i32, ptr %48, align 4, !dbg !844
  %181 = sext i32 %180 to i64, !dbg !844
  store i64 %181, ptr %6, align 8, !dbg !844
  %182 = load %str, ptr %51, align 8, !dbg !844
  %183 = extractvalue %str %182, 1, !dbg !844
  store i64 %183, ptr %5, align 8, !dbg !844
  br label %mir.bb29, !dbg !844

mir.bb29:                                         ; preds = %mir.bb28
  %184 = load %str, ptr %51, align 8, !dbg !844
  %185 = load i64, ptr %6, align 8, !dbg !844
  %186 = load i64, ptr %5, align 8, !dbg !844
  %187 = call %str @with_str_slice(%str %184, i64 %185, i64 %186), !dbg !844
  store %str %187, ptr %4, align 8, !dbg !844
  br label %mir.bb30, !dbg !844

mir.bb30:                                         ; preds = %mir.bb29
  %188 = load %str, ptr %49, align 8, !dbg !846
  %189 = load %str, ptr %4, align 8, !dbg !846
  %190 = call %str @with_str_concat(%str %188, %str %189), !dbg !846
  store %str %190, ptr %3, align 8, !dbg !846
  %191 = load %str, ptr %3, align 8, !dbg !846
  store %str %191, ptr %49, align 8, !dbg !846
  %192 = load %str, ptr %49, align 8, !dbg !846
  store %str %192, ptr %53, align 8, !dbg !846
  %193 = load %str, ptr %53, align 8, !dbg !846
  ret %str %193, !dbg !846

mir.bb31:                                         ; No predecessors!
  store i32 0, ptr %35, align 4, !dbg !848
  br label %mir.bb6, !dbg !848

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !848
}

define internal %__with.Vec.str @Regex.split(ptr %0, %str %1) !dbg !850 {
entry:
  %2 = alloca %__with.Vec.str, align 8, !dbg !851
  %3 = alloca %str, align 8, !dbg !851
  %4 = alloca ptr, align 8, !dbg !851
  %5 = alloca %__with.Vec.str, align 8, !dbg !851
  store ptr %0, ptr %4, align 8, !dbg !851
  store %str %1, ptr %3, align 8, !dbg !851
  br label %mir.bb0, !dbg !851

mir.bb0:                                          ; preds = %entry
  %6 = load ptr, ptr %4, align 8, !dbg !851
  %7 = load %str, ptr %3, align 8, !dbg !851
  %8 = call %__with.Vec.str @Regex.splitn(ptr %6, %str %7, i32 0), !dbg !851
  store %__with.Vec.str %8, ptr %2, align 8, !dbg !851
  br label %mir.bb1, !dbg !851

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load %__with.Vec.str, ptr %2, align 8, !dbg !852
  store %__with.Vec.str %9, ptr %5, align 8, !dbg !852
  %10 = load %__with.Vec.str, ptr %5, align 8, !dbg !852
  ret %__with.Vec.str %10, !dbg !852
}

define internal %__with.Vec.str @Regex.splitn(ptr %0, %str %1, i32 %2) !dbg !854 {
entry:
  %3 = alloca %str, align 8, !dbg !855
  %4 = alloca i64, align 8, !dbg !855
  %5 = alloca i64, align 8, !dbg !855
  %6 = alloca i32, align 4, !dbg !855
  %7 = alloca i32, align 4, !dbg !855
  %8 = alloca i32, align 4, !dbg !855
  %9 = alloca i32, align 4, !dbg !855
  %10 = alloca i64, align 8, !dbg !855
  %11 = alloca i1, align 1, !dbg !855
  %12 = alloca i32, align 4, !dbg !855
  %13 = alloca i32, align 4, !dbg !855
  %14 = alloca i32, align 4, !dbg !855
  %15 = alloca i64, align 8, !dbg !855
  %16 = alloca i1, align 1, !dbg !855
  %17 = alloca i32, align 4, !dbg !855
  %18 = alloca %str, align 8, !dbg !855
  %19 = alloca i64, align 8, !dbg !855
  %20 = alloca i64, align 8, !dbg !855
  %21 = alloca %Match, align 8, !dbg !855
  %22 = alloca i32, align 4, !dbg !855
  %23 = alloca { i32, %Match }, align 8, !dbg !855
  %24 = alloca %str, align 8, !dbg !855
  %25 = alloca { i32, %Match }, align 8, !dbg !855
  %26 = alloca i64, align 8, !dbg !855
  %27 = alloca i64, align 8, !dbg !855
  %28 = alloca i1, align 1, !dbg !855
  %29 = alloca i32, align 4, !dbg !855
  %30 = alloca i32, align 4, !dbg !855
  %31 = alloca i64, align 8, !dbg !855
  %32 = alloca i1, align 1, !dbg !855
  %33 = alloca i32, align 4, !dbg !855
  %34 = alloca i1, align 1, !dbg !855
  %35 = alloca i1, align 1, !dbg !855
  %36 = alloca i64, align 8, !dbg !855
  %37 = alloca i32, align 4, !dbg !855
  %38 = alloca %__with.Vec.str, align 8, !dbg !855
  %39 = alloca %__with.Vec.str.0, align 8, !dbg !855
  %40 = alloca %__with.Vec.str.0, align 8, !dbg !855
  %41 = alloca i32, align 4, !dbg !855
  %42 = alloca %str, align 8, !dbg !855
  %43 = alloca ptr, align 8, !dbg !855
  %44 = alloca %__with.Vec.str, align 8, !dbg !855
  store ptr %0, ptr %43, align 8, !dbg !855
  store %str %1, ptr %42, align 8, !dbg !855
  store i32 %2, ptr %41, align 4, !dbg !855
  br label %mir.bb0, !dbg !855

mir.bb0:                                          ; preds = %entry
  %45 = alloca %__with.Vec.str.0, align 8, !dbg !855
  store %__with.Vec.str.0 zeroinitializer, ptr %45, align 8, !dbg !855
  call void @with_vec_new_out(ptr %45, i64 16), !dbg !855
  %46 = load %__with.Vec.str.0, ptr %45, align 8, !dbg !855
  store %__with.Vec.str.0 %46, ptr %40, align 8, !dbg !855
  br label %mir.bb1, !dbg !855

mir.bb1:                                          ; preds = %mir.bb0
  %47 = load %__with.Vec.str.0, ptr %40, align 8, !dbg !856
  store %__with.Vec.str.0 %47, ptr %39, align 8, !dbg !856
  %48 = load %__with.Vec.str, ptr %39, align 8, !dbg !856
  store %__with.Vec.str %48, ptr %38, align 8, !dbg !856
  store i32 0, ptr %37, align 4, !dbg !856
  br label %mir.bb2, !dbg !856

mir.bb2:                                          ; preds = %mir.bb17, %mir.bb1
  %49 = load %str, ptr %42, align 8, !dbg !856
  %50 = extractvalue %str %49, 1, !dbg !856
  store i64 %50, ptr %36, align 8, !dbg !856
  br label %mir.bb5, !dbg !856

mir.bb3:                                          ; preds = %mir.bb5
  %51 = load i32, ptr %41, align 4, !dbg !858
  %52 = icmp sgt i32 %51, 0, !dbg !858
  store i1 %52, ptr %35, align 1, !dbg !858
  %53 = load i1, ptr %35, align 1, !dbg !858
  store i1 %53, ptr %34, align 1, !dbg !858
  %54 = load i1, ptr %34, align 1, !dbg !858
  br i1 %54, label %mir.bb6, label %mir.bb7, !dbg !858

mir.bb4:                                          ; preds = %mir.bb33, %mir.bb5
  %55 = load %__with.Vec.str, ptr %38, align 8, !dbg !858
  store %__with.Vec.str %55, ptr %44, align 8, !dbg !858
  %56 = load %__with.Vec.str, ptr %44, align 8, !dbg !858
  ret %__with.Vec.str %56, !dbg !858

mir.bb5:                                          ; preds = %mir.bb2
  %57 = load i64, ptr %36, align 8, !dbg !860
  %58 = trunc i64 %57 to i32, !dbg !860
  store i32 %58, ptr %33, align 4, !dbg !860
  %59 = load i32, ptr %37, align 4, !dbg !860
  %60 = load i32, ptr %33, align 4, !dbg !860
  %61 = icmp sle i32 %59, %60, !dbg !860
  store i1 %61, ptr %32, align 1, !dbg !860
  %62 = load i1, ptr %32, align 1, !dbg !860
  br i1 %62, label %mir.bb3, label %mir.bb4, !dbg !860

mir.bb6:                                          ; preds = %mir.bb3
  %63 = call i64 @with_vec_len(ptr %38), !dbg !860
  store i64 %63, ptr %31, align 8, !dbg !860
  br label %mir.bb8, !dbg !860

mir.bb7:                                          ; preds = %mir.bb8, %mir.bb3
  %64 = load i1, ptr %34, align 1, !dbg !860
  br i1 %64, label %mir.bb9, label %mir.bb10, !dbg !860

mir.bb8:                                          ; preds = %mir.bb6
  %65 = load i64, ptr %31, align 8, !dbg !862
  %66 = trunc i64 %65 to i32, !dbg !862
  store i32 %66, ptr %30, align 4, !dbg !862
  %67 = load i32, ptr %41, align 4, !dbg !862
  %68 = sub nsw i32 %67, 1, !dbg !862
  store i32 %68, ptr %29, align 4, !dbg !862
  %69 = load i32, ptr %30, align 4, !dbg !862
  %70 = load i32, ptr %29, align 4, !dbg !862
  %71 = icmp sge i32 %69, %70, !dbg !862
  store i1 %71, ptr %28, align 1, !dbg !862
  %72 = load i1, ptr %28, align 1, !dbg !862
  store i1 %72, ptr %34, align 1, !dbg !862
  br label %mir.bb7, !dbg !862

mir.bb9:                                          ; preds = %mir.bb7
  %73 = load i32, ptr %37, align 4, !dbg !864
  %74 = sext i32 %73 to i64, !dbg !864
  store i64 %74, ptr %27, align 8, !dbg !864
  %75 = load %str, ptr %42, align 8, !dbg !864
  %76 = extractvalue %str %75, 1, !dbg !864
  store i64 %76, ptr %26, align 8, !dbg !864
  br label %mir.bb12, !dbg !864

mir.bb10:                                         ; preds = %mir.bb7
  br label %mir.bb11, !dbg !864

mir.bb11:                                         ; preds = %mir.bb15, %mir.bb10
  %77 = load ptr, ptr %43, align 8, !dbg !864
  %78 = load %str, ptr %42, align 8, !dbg !864
  %79 = load i32, ptr %37, align 4, !dbg !864
  %80 = call { i32, %Match } @Regex.find_at(ptr %77, %str %78, i32 %79), !dbg !864
  store { i32, %Match } %80, ptr %25, align 8, !dbg !864
  br label %mir.bb16, !dbg !864

mir.bb12:                                         ; preds = %mir.bb9
  %81 = load %str, ptr %42, align 8, !dbg !864
  %82 = load i64, ptr %27, align 8, !dbg !864
  %83 = load i64, ptr %26, align 8, !dbg !864
  %84 = call %str @with_str_slice(%str %81, i64 %82, i64 %83), !dbg !864
  store %str %84, ptr %24, align 8, !dbg !864
  br label %mir.bb13, !dbg !864

mir.bb13:                                         ; preds = %mir.bb12
  %85 = load %str, ptr %24, align 8, !dbg !864
  %86 = alloca %str, align 8, !dbg !864
  store %str %85, ptr %86, align 8, !dbg !864
  call void @with_vec_push(ptr %38, ptr %86), !dbg !864
  br label %mir.bb14, !dbg !864

mir.bb14:                                         ; preds = %mir.bb13
  %87 = load %__with.Vec.str, ptr %38, align 8, !dbg !866
  store %__with.Vec.str %87, ptr %44, align 8, !dbg !866
  %88 = load %__with.Vec.str, ptr %44, align 8, !dbg !866
  ret %__with.Vec.str %88, !dbg !866

mir.bb15:                                         ; No predecessors!
  br label %mir.bb11, !dbg !866

mir.bb16:                                         ; preds = %mir.bb11
  %89 = load { i32, %Match }, ptr %25, align 8, !dbg !868
  store { i32, %Match } %89, ptr %23, align 8, !dbg !868
  %90 = load { i32, %Match }, ptr %23, align 8, !dbg !868
  %91 = extractvalue { i32, %Match } %90, 0, !dbg !868
  store i32 %91, ptr %22, align 4, !dbg !868
  %92 = load i32, ptr %22, align 4, !dbg !868
  switch i32 %92, label %mir.bb19 [
    i32 0, label %mir.bb18
  ], !dbg !868

mir.bb17:                                         ; preds = %mir.bb34, %mir.bb24, %mir.bb19
  br label %mir.bb2, !dbg !868

mir.bb18:                                         ; preds = %mir.bb16
  %93 = getelementptr inbounds nuw { i32, %Match }, ptr %23, i32 0, i32 1, !dbg !870
  %94 = getelementptr inbounds nuw { %Match }, ptr %93, i32 0, i32 0, !dbg !870
  %95 = load %Match, ptr %94, align 8, !dbg !870
  store %Match %95, ptr %21, align 8, !dbg !870
  %96 = load i32, ptr %37, align 4, !dbg !870
  %97 = sext i32 %96 to i64, !dbg !870
  store i64 %97, ptr %20, align 8, !dbg !870
  %98 = getelementptr inbounds nuw %Match, ptr %21, i32 0, i32 1, !dbg !870
  %99 = load i32, ptr %98, align 4, !dbg !870
  %100 = sext i32 %99 to i64, !dbg !870
  store i64 %100, ptr %19, align 8, !dbg !870
  %101 = load %str, ptr %42, align 8, !dbg !870
  %102 = load i64, ptr %20, align 8, !dbg !870
  %103 = load i64, ptr %19, align 8, !dbg !870
  %104 = call %str @with_str_slice(%str %101, i64 %102, i64 %103), !dbg !870
  store %str %104, ptr %18, align 8, !dbg !870
  br label %mir.bb20, !dbg !870

mir.bb19:                                         ; preds = %mir.bb16
  %105 = load { i32, %Match }, ptr %23, align 8, !dbg !870
  %106 = extractvalue { i32, %Match } %105, 0, !dbg !870
  store i32 %106, ptr %17, align 4, !dbg !870
  %107 = load i32, ptr %17, align 4, !dbg !870
  switch i32 %107, label %mir.bb17 [
    i32 1, label %mir.bb30
  ], !dbg !870

mir.bb20:                                         ; preds = %mir.bb18
  %108 = load %str, ptr %18, align 8, !dbg !870
  %109 = alloca %str, align 8, !dbg !870
  store %str %108, ptr %109, align 8, !dbg !870
  call void @with_vec_push(ptr %38, ptr %109), !dbg !870
  br label %mir.bb21, !dbg !870

mir.bb21:                                         ; preds = %mir.bb20
  %110 = getelementptr inbounds nuw %Match, ptr %21, i32 0, i32 2, !dbg !872
  %111 = load i32, ptr %110, align 4, !dbg !872
  %112 = getelementptr inbounds nuw %Match, ptr %21, i32 0, i32 1, !dbg !872
  %113 = load i32, ptr %112, align 4, !dbg !872
  %114 = icmp eq i32 %111, %113, !dbg !872
  store i1 %114, ptr %16, align 1, !dbg !872
  %115 = load i1, ptr %16, align 1, !dbg !872
  br i1 %115, label %mir.bb22, label %mir.bb23, !dbg !872

mir.bb22:                                         ; preds = %mir.bb21
  %116 = load %str, ptr %42, align 8, !dbg !872
  %117 = extractvalue %str %116, 1, !dbg !872
  store i64 %117, ptr %15, align 8, !dbg !872
  br label %mir.bb25, !dbg !872

mir.bb23:                                         ; preds = %mir.bb21
  %118 = getelementptr inbounds nuw %Match, ptr %21, i32 0, i32 2, !dbg !874
  %119 = load i32, ptr %118, align 4, !dbg !874
  store i32 %119, ptr %37, align 4, !dbg !874
  %120 = getelementptr inbounds nuw %Match, ptr %21, i32 0, i32 2, !dbg !874
  %121 = load i32, ptr %120, align 4, !dbg !874
  store i32 %121, ptr %14, align 4, !dbg !874
  br label %mir.bb24, !dbg !874

mir.bb24:                                         ; preds = %mir.bb28, %mir.bb23
  %122 = load i32, ptr %14, align 4, !dbg !876
  store i32 %122, ptr %13, align 4, !dbg !876
  br label %mir.bb17, !dbg !876

mir.bb25:                                         ; preds = %mir.bb22
  %123 = load i64, ptr %15, align 8, !dbg !878
  %124 = trunc i64 %123 to i32, !dbg !878
  store i32 %124, ptr %12, align 4, !dbg !878
  %125 = getelementptr inbounds nuw %Match, ptr %21, i32 0, i32 2, !dbg !878
  %126 = load i32, ptr %125, align 4, !dbg !878
  %127 = load i32, ptr %12, align 4, !dbg !878
  %128 = icmp sge i32 %126, %127, !dbg !878
  store i1 %128, ptr %11, align 1, !dbg !878
  %129 = load i1, ptr %11, align 1, !dbg !878
  br i1 %129, label %mir.bb26, label %mir.bb27, !dbg !878

mir.bb26:                                         ; preds = %mir.bb25
  %130 = load %str, ptr %42, align 8, !dbg !878
  %131 = extractvalue %str %130, 1, !dbg !878
  store i64 %131, ptr %10, align 8, !dbg !878
  br label %mir.bb29, !dbg !878

mir.bb27:                                         ; preds = %mir.bb25
  %132 = getelementptr inbounds nuw %Match, ptr %21, i32 0, i32 1, !dbg !880
  %133 = load i32, ptr %132, align 4, !dbg !880
  %134 = add nsw i32 %133, 1, !dbg !880
  store i32 %134, ptr %9, align 4, !dbg !880
  %135 = load i32, ptr %9, align 4, !dbg !880
  store i32 %135, ptr %37, align 4, !dbg !880
  %136 = load i32, ptr %9, align 4, !dbg !880
  store i32 %136, ptr %8, align 4, !dbg !880
  br label %mir.bb28, !dbg !880

mir.bb28:                                         ; preds = %mir.bb29, %mir.bb27
  %137 = load i32, ptr %8, align 4, !dbg !882
  store i32 %137, ptr %14, align 4, !dbg !882
  br label %mir.bb24, !dbg !882

mir.bb29:                                         ; preds = %mir.bb26
  %138 = load i64, ptr %10, align 8, !dbg !884
  %139 = trunc i64 %138 to i32, !dbg !884
  store i32 %139, ptr %7, align 4, !dbg !884
  %140 = load i32, ptr %7, align 4, !dbg !884
  %141 = add nsw i32 %140, 1, !dbg !884
  store i32 %141, ptr %6, align 4, !dbg !884
  %142 = load i32, ptr %6, align 4, !dbg !884
  store i32 %142, ptr %37, align 4, !dbg !884
  %143 = load i32, ptr %6, align 4, !dbg !884
  store i32 %143, ptr %8, align 4, !dbg !884
  br label %mir.bb28, !dbg !884

mir.bb30:                                         ; preds = %mir.bb19
  %144 = load i32, ptr %37, align 4, !dbg !886
  %145 = sext i32 %144 to i64, !dbg !886
  store i64 %145, ptr %5, align 8, !dbg !886
  %146 = load %str, ptr %42, align 8, !dbg !886
  %147 = extractvalue %str %146, 1, !dbg !886
  store i64 %147, ptr %4, align 8, !dbg !886
  br label %mir.bb31, !dbg !886

mir.bb31:                                         ; preds = %mir.bb30
  %148 = load %str, ptr %42, align 8, !dbg !886
  %149 = load i64, ptr %5, align 8, !dbg !886
  %150 = load i64, ptr %4, align 8, !dbg !886
  %151 = call %str @with_str_slice(%str %148, i64 %149, i64 %150), !dbg !886
  store %str %151, ptr %3, align 8, !dbg !886
  br label %mir.bb32, !dbg !886

mir.bb32:                                         ; preds = %mir.bb31
  %152 = load %str, ptr %3, align 8, !dbg !886
  %153 = alloca %str, align 8, !dbg !886
  store %str %152, ptr %153, align 8, !dbg !886
  call void @with_vec_push(ptr %38, ptr %153), !dbg !886
  br label %mir.bb33, !dbg !886

mir.bb33:                                         ; preds = %mir.bb32
  br label %mir.bb4, !dbg !886

mir.bb34:                                         ; No predecessors!
  store i32 0, ptr %13, align 4, !dbg !888
  br label %mir.bb17, !dbg !888

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !888
}

define internal { i32, %Match } @Captures.get(ptr %0, i32 %1) !dbg !890 {
entry:
  %2 = alloca { i32, %Match }, align 8, !dbg !891
  %3 = alloca { i32, %Match }, align 8, !dbg !891
  %4 = alloca %Match, align 8, !dbg !891
  %5 = alloca %Match, align 8, !dbg !891
  %6 = alloca %str, align 8, !dbg !891
  %7 = alloca i64, align 8, !dbg !891
  %8 = alloca i64, align 8, !dbg !891
  %9 = alloca { i32, %Match }, align 8, !dbg !891
  %10 = alloca { i32, %Match }, align 8, !dbg !891
  %11 = alloca i1, align 1, !dbg !891
  %12 = alloca i1, align 1, !dbg !891
  %13 = alloca i1, align 1, !dbg !891
  %14 = alloca i32, align 4, !dbg !891
  %15 = alloca i32, align 4, !dbg !891
  %16 = alloca i64, align 8, !dbg !891
  %17 = alloca i32, align 4, !dbg !891
  %18 = alloca i32, align 4, !dbg !891
  %19 = alloca i32, align 4, !dbg !891
  %20 = alloca i64, align 8, !dbg !891
  %21 = alloca { i32, %Match }, align 8, !dbg !891
  %22 = alloca { i32, %Match }, align 8, !dbg !891
  %23 = alloca i1, align 1, !dbg !891
  %24 = alloca i32, align 4, !dbg !891
  %25 = alloca i64, align 8, !dbg !891
  %26 = alloca i32, align 4, !dbg !891
  %27 = alloca i1, align 1, !dbg !891
  %28 = alloca i1, align 1, !dbg !891
  %29 = alloca i32, align 4, !dbg !891
  %30 = alloca i32, align 4, !dbg !891
  %31 = alloca i32, align 4, !dbg !891
  %32 = alloca ptr, align 8, !dbg !891
  %33 = alloca { i32, %Match }, align 8, !dbg !891
  store ptr %0, ptr %32, align 8, !dbg !891
  store i32 %1, ptr %31, align 4, !dbg !891
  br label %mir.bb0, !dbg !891

mir.bb0:                                          ; preds = %entry
  %34 = load i32, ptr %31, align 4, !dbg !891
  %35 = mul nsw i32 %34, 2, !dbg !891
  store i32 %35, ptr %30, align 4, !dbg !891
  %36 = load i32, ptr %30, align 4, !dbg !891
  store i32 %36, ptr %29, align 4, !dbg !891
  %37 = load i32, ptr %29, align 4, !dbg !891
  %38 = icmp slt i32 %37, 0, !dbg !891
  store i1 %38, ptr %28, align 1, !dbg !891
  %39 = load i1, ptr %28, align 1, !dbg !891
  store i1 %39, ptr %27, align 1, !dbg !891
  %40 = load i1, ptr %27, align 1, !dbg !891
  br i1 %40, label %mir.bb2, label %mir.bb1, !dbg !891

mir.bb1:                                          ; preds = %mir.bb0
  %41 = load i32, ptr %29, align 4, !dbg !892
  %42 = add nsw i32 %41, 1, !dbg !892
  store i32 %42, ptr %26, align 4, !dbg !892
  %43 = load ptr, ptr %32, align 8, !dbg !892
  %44 = getelementptr inbounds nuw %Captures, ptr %43, i32 0, i32 2, !dbg !892
  %45 = call i64 @with_vec_len(ptr %44), !dbg !892
  store i64 %45, ptr %25, align 8, !dbg !892
  br label %mir.bb3, !dbg !892

mir.bb2:                                          ; preds = %mir.bb3, %mir.bb0
  %46 = load i1, ptr %27, align 1, !dbg !892
  br i1 %46, label %mir.bb4, label %mir.bb5, !dbg !892

mir.bb3:                                          ; preds = %mir.bb1
  %47 = load i64, ptr %25, align 8, !dbg !894
  %48 = trunc i64 %47 to i32, !dbg !894
  store i32 %48, ptr %24, align 4, !dbg !894
  %49 = load i32, ptr %26, align 4, !dbg !894
  %50 = load i32, ptr %24, align 4, !dbg !894
  %51 = icmp sge i32 %49, %50, !dbg !894
  store i1 %51, ptr %23, align 1, !dbg !894
  %52 = load i1, ptr %23, align 1, !dbg !894
  store i1 %52, ptr %27, align 1, !dbg !894
  br label %mir.bb2, !dbg !894

mir.bb4:                                          ; preds = %mir.bb2
  store { i32, %Match } zeroinitializer, ptr %22, align 8, !dbg !894
  %53 = getelementptr inbounds nuw { i32, %Match }, ptr %22, i32 0, i32 0, !dbg !894
  store i32 1, ptr %53, align 4, !dbg !894
  %54 = load { i32, %Match }, ptr %22, align 8, !dbg !894
  store { i32, %Match } %54, ptr %21, align 8, !dbg !894
  %55 = load { i32, %Match }, ptr %21, align 8, !dbg !894
  store { i32, %Match } %55, ptr %33, align 8, !dbg !894
  %56 = load { i32, %Match }, ptr %33, align 8, !dbg !894
  ret { i32, %Match } %56, !dbg !894

mir.bb5:                                          ; preds = %mir.bb2
  br label %mir.bb6, !dbg !894

mir.bb6:                                          ; preds = %mir.bb7, %mir.bb5
  %57 = load i32, ptr %29, align 4, !dbg !896
  %58 = sext i32 %57 to i64, !dbg !896
  store i64 %58, ptr %20, align 8, !dbg !896
  %59 = load ptr, ptr %32, align 8, !dbg !896
  %60 = getelementptr inbounds nuw %Captures, ptr %59, i32 0, i32 2, !dbg !896
  %61 = load i64, ptr %20, align 8, !dbg !896
  %62 = call ptr @with_vec_get_ptr(ptr %60, i64 %61), !dbg !896
  %63 = load i32, ptr %62, align 4, !dbg !896
  store i32 %63, ptr %19, align 4, !dbg !896
  br label %mir.bb8, !dbg !896

mir.bb7:                                          ; No predecessors!
  br label %mir.bb6, !dbg !896

mir.bb8:                                          ; preds = %mir.bb6
  %64 = load i32, ptr %19, align 4, !dbg !898
  store i32 %64, ptr %18, align 4, !dbg !898
  %65 = load i32, ptr %29, align 4, !dbg !898
  %66 = add nsw i32 %65, 1, !dbg !898
  store i32 %66, ptr %17, align 4, !dbg !898
  %67 = load i32, ptr %17, align 4, !dbg !898
  %68 = sext i32 %67 to i64, !dbg !898
  store i64 %68, ptr %16, align 8, !dbg !898
  %69 = load ptr, ptr %32, align 8, !dbg !898
  %70 = getelementptr inbounds nuw %Captures, ptr %69, i32 0, i32 2, !dbg !898
  %71 = load i64, ptr %16, align 8, !dbg !898
  %72 = call ptr @with_vec_get_ptr(ptr %70, i64 %71), !dbg !898
  %73 = load i32, ptr %72, align 4, !dbg !898
  store i32 %73, ptr %15, align 4, !dbg !898
  br label %mir.bb9, !dbg !898

mir.bb9:                                          ; preds = %mir.bb8
  %74 = load i32, ptr %15, align 4, !dbg !900
  store i32 %74, ptr %14, align 4, !dbg !900
  %75 = load i32, ptr %18, align 4, !dbg !900
  %76 = icmp slt i32 %75, 0, !dbg !900
  store i1 %76, ptr %13, align 1, !dbg !900
  %77 = load i1, ptr %13, align 1, !dbg !900
  store i1 %77, ptr %12, align 1, !dbg !900
  %78 = load i1, ptr %12, align 1, !dbg !900
  br i1 %78, label %mir.bb11, label %mir.bb10, !dbg !900

mir.bb10:                                         ; preds = %mir.bb9
  %79 = load i32, ptr %14, align 4, !dbg !902
  %80 = icmp slt i32 %79, 0, !dbg !902
  store i1 %80, ptr %11, align 1, !dbg !902
  %81 = load i1, ptr %11, align 1, !dbg !902
  store i1 %81, ptr %12, align 1, !dbg !902
  br label %mir.bb11, !dbg !902

mir.bb11:                                         ; preds = %mir.bb10, %mir.bb9
  %82 = load i1, ptr %12, align 1, !dbg !902
  br i1 %82, label %mir.bb12, label %mir.bb13, !dbg !902

mir.bb12:                                         ; preds = %mir.bb11
  store { i32, %Match } zeroinitializer, ptr %10, align 8, !dbg !902
  %83 = getelementptr inbounds nuw { i32, %Match }, ptr %10, i32 0, i32 0, !dbg !902
  store i32 1, ptr %83, align 4, !dbg !902
  %84 = load { i32, %Match }, ptr %10, align 8, !dbg !902
  store { i32, %Match } %84, ptr %9, align 8, !dbg !902
  %85 = load { i32, %Match }, ptr %9, align 8, !dbg !902
  store { i32, %Match } %85, ptr %33, align 8, !dbg !902
  %86 = load { i32, %Match }, ptr %33, align 8, !dbg !902
  ret { i32, %Match } %86, !dbg !902

mir.bb13:                                         ; preds = %mir.bb11
  br label %mir.bb14, !dbg !902

mir.bb14:                                         ; preds = %mir.bb15, %mir.bb13
  %87 = load i32, ptr %18, align 4, !dbg !904
  %88 = sext i32 %87 to i64, !dbg !904
  store i64 %88, ptr %8, align 8, !dbg !904
  %89 = load i32, ptr %14, align 4, !dbg !904
  %90 = sext i32 %89 to i64, !dbg !904
  store i64 %90, ptr %7, align 8, !dbg !904
  %91 = load ptr, ptr %32, align 8, !dbg !904
  %92 = getelementptr inbounds nuw %Captures, ptr %91, i32 0, i32 1, !dbg !904
  %93 = load %str, ptr %92, align 8, !dbg !904
  %94 = load i64, ptr %8, align 8, !dbg !904
  %95 = load i64, ptr %7, align 8, !dbg !904
  %96 = call %str @with_str_slice(%str %93, i64 %94, i64 %95), !dbg !904
  store %str %96, ptr %6, align 8, !dbg !904
  br label %mir.bb16, !dbg !904

mir.bb15:                                         ; No predecessors!
  br label %mir.bb14, !dbg !904

mir.bb16:                                         ; preds = %mir.bb14
  store %Match zeroinitializer, ptr %5, align 8, !dbg !906
  %97 = load %str, ptr %6, align 8, !dbg !906
  %98 = getelementptr inbounds nuw %Match, ptr %5, i32 0, i32 0, !dbg !906
  store %str %97, ptr %98, align 8, !dbg !906
  %99 = load i32, ptr %18, align 4, !dbg !906
  %100 = getelementptr inbounds nuw %Match, ptr %5, i32 0, i32 1, !dbg !906
  store i32 %99, ptr %100, align 4, !dbg !906
  %101 = load i32, ptr %14, align 4, !dbg !906
  %102 = getelementptr inbounds nuw %Match, ptr %5, i32 0, i32 2, !dbg !906
  store i32 %101, ptr %102, align 4, !dbg !906
  %103 = load %Match, ptr %5, align 8, !dbg !906
  store %Match %103, ptr %4, align 8, !dbg !906
  store { i32, %Match } zeroinitializer, ptr %3, align 8, !dbg !906
  %104 = getelementptr inbounds nuw { i32, %Match }, ptr %3, i32 0, i32 0, !dbg !906
  store i32 0, ptr %104, align 4, !dbg !906
  %105 = getelementptr inbounds nuw { i32, %Match }, ptr %3, i32 0, i32 1, !dbg !906
  %106 = load %Match, ptr %4, align 8, !dbg !906
  store %Match %106, ptr %105, align 8, !dbg !906
  %107 = load { i32, %Match }, ptr %3, align 8, !dbg !906
  store { i32, %Match } %107, ptr %2, align 8, !dbg !906
  %108 = load { i32, %Match }, ptr %2, align 8, !dbg !906
  store { i32, %Match } %108, ptr %33, align 8, !dbg !906
  %109 = load { i32, %Match }, ptr %33, align 8, !dbg !906
  ret { i32, %Match } %109, !dbg !906

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !906
}

define internal i32 @Captures.len(ptr %0) !dbg !908 {
entry:
  %1 = alloca i32, align 4, !dbg !909
  %2 = alloca i32, align 4, !dbg !909
  %3 = alloca i64, align 8, !dbg !909
  %4 = alloca ptr, align 8, !dbg !909
  %5 = alloca i32, align 4, !dbg !909
  store ptr %0, ptr %4, align 8, !dbg !909
  br label %mir.bb0, !dbg !909

mir.bb0:                                          ; preds = %entry
  %6 = load ptr, ptr %4, align 8, !dbg !909
  %7 = getelementptr inbounds nuw %Captures, ptr %6, i32 0, i32 2, !dbg !909
  %8 = call i64 @with_vec_len(ptr %7), !dbg !909
  store i64 %8, ptr %3, align 8, !dbg !909
  br label %mir.bb1, !dbg !909

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load i64, ptr %3, align 8, !dbg !910
  %10 = trunc i64 %9 to i32, !dbg !910
  store i32 %10, ptr %2, align 4, !dbg !910
  %11 = load i32, ptr %2, align 4, !dbg !910
  %12 = sdiv i32 %11, 2, !dbg !910
  store i32 %12, ptr %1, align 4, !dbg !910
  %13 = load i32, ptr %1, align 4, !dbg !910
  store i32 %13, ptr %5, align 4, !dbg !910
  %14 = load i32, ptr %5, align 4, !dbg !910
  ret i32 %14, !dbg !910
}

define internal { i32, %Match } @Captures.by_name(ptr %0, %str %1) !dbg !912 {
entry:
  %2 = alloca { i32, %Match }, align 8, !dbg !913
  %3 = alloca { i32, %Match }, align 8, !dbg !913
  %4 = alloca { i32, %Match }, align 8, !dbg !913
  %5 = alloca i1, align 1, !dbg !913
  %6 = alloca i32, align 4, !dbg !913
  %7 = alloca i32, align 4, !dbg !913
  %8 = alloca { i32, %Match }, align 8, !dbg !913
  %9 = alloca { i32, %Match }, align 8, !dbg !913
  %10 = alloca i1, align 1, !dbg !913
  %11 = alloca i64, align 8, !dbg !913
  %12 = alloca %str, align 8, !dbg !913
  %13 = alloca ptr, align 8, !dbg !913
  %14 = alloca { i32, %Match }, align 8, !dbg !913
  store ptr %0, ptr %13, align 8, !dbg !913
  store %str %1, ptr %12, align 8, !dbg !913
  br label %mir.bb0, !dbg !913

mir.bb0:                                          ; preds = %entry
  %15 = load ptr, ptr %13, align 8, !dbg !913
  %16 = getelementptr inbounds nuw %Captures, ptr %15, i32 0, i32 0, !dbg !913
  %17 = load ptr, ptr %16, align 8, !dbg !913
  %18 = ptrtoint ptr %17 to i64, !dbg !913
  store i64 %18, ptr %11, align 8, !dbg !913
  %19 = load i64, ptr %11, align 8, !dbg !913
  %20 = icmp eq i64 %19, 0, !dbg !913
  store i1 %20, ptr %10, align 1, !dbg !913
  %21 = load i1, ptr %10, align 1, !dbg !913
  br i1 %21, label %mir.bb1, label %mir.bb2, !dbg !913

mir.bb1:                                          ; preds = %mir.bb0
  store { i32, %Match } zeroinitializer, ptr %9, align 8, !dbg !913
  %22 = getelementptr inbounds nuw { i32, %Match }, ptr %9, i32 0, i32 0, !dbg !913
  store i32 1, ptr %22, align 4, !dbg !913
  %23 = load { i32, %Match }, ptr %9, align 8, !dbg !913
  store { i32, %Match } %23, ptr %8, align 8, !dbg !913
  %24 = load { i32, %Match }, ptr %8, align 8, !dbg !913
  store { i32, %Match } %24, ptr %14, align 8, !dbg !913
  %25 = load { i32, %Match }, ptr %14, align 8, !dbg !913
  ret { i32, %Match } %25, !dbg !913

mir.bb2:                                          ; preds = %mir.bb0
  br label %mir.bb3, !dbg !913

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb2
  %26 = load ptr, ptr %13, align 8, !dbg !914
  %27 = getelementptr inbounds nuw %Captures, ptr %26, i32 0, i32 0, !dbg !914
  %28 = load ptr, ptr %27, align 8, !dbg !914
  %29 = load %str, ptr %12, align 8, !dbg !914
  %30 = call i32 @with_regex_group_name_to_index(ptr %28, %str %29), !dbg !914
  store i32 %30, ptr %7, align 4, !dbg !914
  br label %mir.bb5, !dbg !914

mir.bb4:                                          ; No predecessors!
  br label %mir.bb3, !dbg !914

mir.bb5:                                          ; preds = %mir.bb3
  %31 = load i32, ptr %7, align 4, !dbg !916
  store i32 %31, ptr %6, align 4, !dbg !916
  %32 = load i32, ptr %6, align 4, !dbg !916
  %33 = icmp slt i32 %32, 0, !dbg !916
  store i1 %33, ptr %5, align 1, !dbg !916
  %34 = load i1, ptr %5, align 1, !dbg !916
  br i1 %34, label %mir.bb6, label %mir.bb7, !dbg !916

mir.bb6:                                          ; preds = %mir.bb5
  store { i32, %Match } zeroinitializer, ptr %4, align 8, !dbg !916
  %35 = getelementptr inbounds nuw { i32, %Match }, ptr %4, i32 0, i32 0, !dbg !916
  store i32 1, ptr %35, align 4, !dbg !916
  %36 = load { i32, %Match }, ptr %4, align 8, !dbg !916
  store { i32, %Match } %36, ptr %3, align 8, !dbg !916
  %37 = load { i32, %Match }, ptr %3, align 8, !dbg !916
  store { i32, %Match } %37, ptr %14, align 8, !dbg !916
  %38 = load { i32, %Match }, ptr %14, align 8, !dbg !916
  ret { i32, %Match } %38, !dbg !916

mir.bb7:                                          ; preds = %mir.bb5
  br label %mir.bb8, !dbg !916

mir.bb8:                                          ; preds = %mir.bb9, %mir.bb7
  %39 = load ptr, ptr %13, align 8, !dbg !916
  %40 = load i32, ptr %6, align 4, !dbg !916
  %41 = call { i32, %Match } @Captures.get(ptr %39, i32 %40), !dbg !916
  store { i32, %Match } %41, ptr %2, align 8, !dbg !916
  br label %mir.bb10, !dbg !916

mir.bb9:                                          ; No predecessors!
  br label %mir.bb8, !dbg !916

mir.bb10:                                         ; preds = %mir.bb8
  %42 = load { i32, %Match }, ptr %2, align 8, !dbg !918
  store { i32, %Match } %42, ptr %14, align 8, !dbg !918
  %43 = load { i32, %Match }, ptr %14, align 8, !dbg !918
  ret { i32, %Match } %43, !dbg !918

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !918
}

define internal { i32, %Match } @Captures.name(ptr %0, %str %1) !dbg !920 {
entry:
  %2 = alloca { i32, %Match }, align 8, !dbg !921
  %3 = alloca %str, align 8, !dbg !921
  %4 = alloca ptr, align 8, !dbg !921
  %5 = alloca { i32, %Match }, align 8, !dbg !921
  store ptr %0, ptr %4, align 8, !dbg !921
  store %str %1, ptr %3, align 8, !dbg !921
  br label %mir.bb0, !dbg !921

mir.bb0:                                          ; preds = %entry
  %6 = load ptr, ptr %4, align 8, !dbg !921
  %7 = load %str, ptr %3, align 8, !dbg !921
  %8 = call { i32, %Match } @Captures.by_name(ptr %6, %str %7), !dbg !921
  store { i32, %Match } %8, ptr %2, align 8, !dbg !921
  br label %mir.bb1, !dbg !921

mir.bb1:                                          ; preds = %mir.bb0
  %9 = load { i32, %Match }, ptr %2, align 8, !dbg !922
  store { i32, %Match } %9, ptr %5, align 8, !dbg !922
  %10 = load { i32, %Match }, ptr %5, align 8, !dbg !922
  ret { i32, %Match } %10, !dbg !922
}

define internal %str @Captures.text(ptr %0, i32 %1) !dbg !924 {
entry:
  %2 = alloca i32, align 4, !dbg !925
  %3 = alloca %Match, align 8, !dbg !925
  %4 = alloca %str, align 8, !dbg !925
  %5 = alloca i32, align 4, !dbg !925
  %6 = alloca { i32, %Match }, align 8, !dbg !925
  %7 = alloca { i32, %Match }, align 8, !dbg !925
  %8 = alloca i32, align 4, !dbg !925
  %9 = alloca ptr, align 8, !dbg !925
  %10 = alloca %str, align 8, !dbg !925
  store ptr %0, ptr %9, align 8, !dbg !925
  store i32 %1, ptr %8, align 4, !dbg !925
  br label %mir.bb0, !dbg !925

mir.bb0:                                          ; preds = %entry
  %11 = load ptr, ptr %9, align 8, !dbg !925
  %12 = load i32, ptr %8, align 4, !dbg !925
  %13 = call { i32, %Match } @Captures.get(ptr %11, i32 %12), !dbg !925
  store { i32, %Match } %13, ptr %7, align 8, !dbg !925
  br label %mir.bb1, !dbg !925

mir.bb1:                                          ; preds = %mir.bb0
  %14 = load { i32, %Match }, ptr %7, align 8, !dbg !926
  store { i32, %Match } %14, ptr %6, align 8, !dbg !926
  %15 = load { i32, %Match }, ptr %6, align 8, !dbg !926
  %16 = extractvalue { i32, %Match } %15, 0, !dbg !926
  store i32 %16, ptr %5, align 4, !dbg !926
  %17 = load i32, ptr %5, align 4, !dbg !926
  switch i32 %17, label %mir.bb4 [
    i32 0, label %mir.bb3
  ], !dbg !926

mir.bb2:                                          ; preds = %mir.bb5, %mir.bb4, %mir.bb3
  %18 = load %str, ptr %4, align 8, !dbg !928
  store %str %18, ptr %10, align 8, !dbg !928
  %19 = load %str, ptr %10, align 8, !dbg !928
  ret %str %19, !dbg !928

mir.bb3:                                          ; preds = %mir.bb1
  %20 = getelementptr inbounds nuw { i32, %Match }, ptr %6, i32 0, i32 1, !dbg !930
  %21 = getelementptr inbounds nuw { %Match }, ptr %20, i32 0, i32 0, !dbg !930
  %22 = load %Match, ptr %21, align 8, !dbg !930
  store %Match %22, ptr %3, align 8, !dbg !930
  %23 = getelementptr inbounds nuw %Match, ptr %3, i32 0, i32 0, !dbg !930
  %24 = load %str, ptr %23, align 8, !dbg !930
  store %str %24, ptr %4, align 8, !dbg !930
  br label %mir.bb2, !dbg !930

mir.bb4:                                          ; preds = %mir.bb1
  %25 = load { i32, %Match }, ptr %6, align 8, !dbg !930
  %26 = extractvalue { i32, %Match } %25, 0, !dbg !930
  store i32 %26, ptr %2, align 4, !dbg !930
  %27 = load i32, ptr %2, align 4, !dbg !930
  switch i32 %27, label %mir.bb2 [
    i32 1, label %mir.bb5
  ], !dbg !930

mir.bb5:                                          ; preds = %mir.bb4
  %28 = alloca %str, align 8, !dbg !932
  %29 = getelementptr inbounds nuw %str, ptr %28, i32 0, i32 0, !dbg !932
  store ptr @14, ptr %29, align 8, !dbg !932
  %30 = getelementptr inbounds nuw %str, ptr %28, i32 0, i32 1, !dbg !932
  store i64 0, ptr %30, align 8, !dbg !932
  %31 = load %str, ptr %28, align 8, !dbg !932
  store %str %31, ptr %4, align 8, !dbg !932
  br label %mir.bb2, !dbg !932

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !932
}

define internal %str @Captures.name_text(ptr %0, %str %1) !dbg !934 {
entry:
  %2 = alloca i32, align 4, !dbg !935
  %3 = alloca %Match, align 8, !dbg !935
  %4 = alloca %str, align 8, !dbg !935
  %5 = alloca i32, align 4, !dbg !935
  %6 = alloca { i32, %Match }, align 8, !dbg !935
  %7 = alloca %str, align 8, !dbg !935
  %8 = alloca { i32, %Match }, align 8, !dbg !935
  %9 = alloca %str, align 8, !dbg !935
  %10 = alloca %str, align 8, !dbg !935
  %11 = alloca i64, align 8, !dbg !935
  %12 = alloca i1, align 1, !dbg !935
  %13 = alloca i32, align 4, !dbg !935
  %14 = alloca i1, align 1, !dbg !935
  %15 = alloca i1, align 1, !dbg !935
  %16 = alloca i64, align 8, !dbg !935
  %17 = alloca %str, align 8, !dbg !935
  %18 = alloca ptr, align 8, !dbg !935
  %19 = alloca %str, align 8, !dbg !935
  store ptr %0, ptr %18, align 8, !dbg !935
  store %str %1, ptr %17, align 8, !dbg !935
  br label %mir.bb0, !dbg !935

mir.bb0:                                          ; preds = %entry
  %20 = load %str, ptr %17, align 8, !dbg !935
  %21 = extractvalue %str %20, 1, !dbg !935
  store i64 %21, ptr %16, align 8, !dbg !935
  br label %mir.bb1, !dbg !935

mir.bb1:                                          ; preds = %mir.bb0
  %22 = load i64, ptr %16, align 8, !dbg !936
  %23 = icmp sgt i64 %22, 0, !dbg !936
  store i1 %23, ptr %15, align 1, !dbg !936
  %24 = load i1, ptr %15, align 1, !dbg !936
  store i1 %24, ptr %14, align 1, !dbg !936
  %25 = load i1, ptr %14, align 1, !dbg !936
  br i1 %25, label %mir.bb2, label %mir.bb3, !dbg !936

mir.bb2:                                          ; preds = %mir.bb1
  %26 = load %str, ptr %17, align 8, !dbg !936
  %27 = call i32 @with_str_byte_at(%str %26, i64 0), !dbg !936
  store i32 %27, ptr %13, align 4, !dbg !936
  br label %mir.bb4, !dbg !936

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb1
  %28 = load i1, ptr %14, align 1, !dbg !936
  br i1 %28, label %mir.bb5, label %mir.bb6, !dbg !936

mir.bb4:                                          ; preds = %mir.bb2
  %29 = load i32, ptr %13, align 4, !dbg !938
  %30 = icmp eq i32 %29, 36, !dbg !938
  store i1 %30, ptr %12, align 1, !dbg !938
  %31 = load i1, ptr %12, align 1, !dbg !938
  store i1 %31, ptr %14, align 1, !dbg !938
  br label %mir.bb3, !dbg !938

mir.bb5:                                          ; preds = %mir.bb3
  %32 = load %str, ptr %17, align 8, !dbg !938
  %33 = extractvalue %str %32, 1, !dbg !938
  store i64 %33, ptr %11, align 8, !dbg !938
  br label %mir.bb8, !dbg !938

mir.bb6:                                          ; preds = %mir.bb3
  %34 = load %str, ptr %17, align 8, !dbg !940
  store %str %34, ptr %10, align 8, !dbg !940
  br label %mir.bb7, !dbg !940

mir.bb7:                                          ; preds = %mir.bb9, %mir.bb6
  %35 = load %str, ptr %10, align 8, !dbg !942
  store %str %35, ptr %9, align 8, !dbg !942
  %36 = load ptr, ptr %18, align 8, !dbg !942
  %37 = load %str, ptr %9, align 8, !dbg !942
  %38 = call { i32, %Match } @Captures.name(ptr %36, %str %37), !dbg !942
  store { i32, %Match } %38, ptr %8, align 8, !dbg !942
  br label %mir.bb10, !dbg !942

mir.bb8:                                          ; preds = %mir.bb5
  %39 = load %str, ptr %17, align 8, !dbg !942
  %40 = load i64, ptr %11, align 8, !dbg !942
  %41 = call %str @with_str_slice(%str %39, i64 1, i64 %40), !dbg !942
  store %str %41, ptr %7, align 8, !dbg !942
  br label %mir.bb9, !dbg !942

mir.bb9:                                          ; preds = %mir.bb8
  %42 = load %str, ptr %7, align 8, !dbg !944
  store %str %42, ptr %10, align 8, !dbg !944
  br label %mir.bb7, !dbg !944

mir.bb10:                                         ; preds = %mir.bb7
  %43 = load { i32, %Match }, ptr %8, align 8, !dbg !946
  store { i32, %Match } %43, ptr %6, align 8, !dbg !946
  %44 = load { i32, %Match }, ptr %6, align 8, !dbg !946
  %45 = extractvalue { i32, %Match } %44, 0, !dbg !946
  store i32 %45, ptr %5, align 4, !dbg !946
  %46 = load i32, ptr %5, align 4, !dbg !946
  switch i32 %46, label %mir.bb13 [
    i32 0, label %mir.bb12
  ], !dbg !946

mir.bb11:                                         ; preds = %mir.bb14, %mir.bb13, %mir.bb12
  %47 = load %str, ptr %4, align 8, !dbg !948
  store %str %47, ptr %19, align 8, !dbg !948
  %48 = load %str, ptr %19, align 8, !dbg !948
  ret %str %48, !dbg !948

mir.bb12:                                         ; preds = %mir.bb10
  %49 = getelementptr inbounds nuw { i32, %Match }, ptr %6, i32 0, i32 1, !dbg !950
  %50 = getelementptr inbounds nuw { %Match }, ptr %49, i32 0, i32 0, !dbg !950
  %51 = load %Match, ptr %50, align 8, !dbg !950
  store %Match %51, ptr %3, align 8, !dbg !950
  %52 = getelementptr inbounds nuw %Match, ptr %3, i32 0, i32 0, !dbg !950
  %53 = load %str, ptr %52, align 8, !dbg !950
  store %str %53, ptr %4, align 8, !dbg !950
  br label %mir.bb11, !dbg !950

mir.bb13:                                         ; preds = %mir.bb10
  %54 = load { i32, %Match }, ptr %6, align 8, !dbg !950
  %55 = extractvalue { i32, %Match } %54, 0, !dbg !950
  store i32 %55, ptr %2, align 4, !dbg !950
  %56 = load i32, ptr %2, align 4, !dbg !950
  switch i32 %56, label %mir.bb11 [
    i32 1, label %mir.bb14
  ], !dbg !950

mir.bb14:                                         ; preds = %mir.bb13
  %57 = alloca %str, align 8, !dbg !952
  %58 = getelementptr inbounds nuw %str, ptr %57, i32 0, i32 0, !dbg !952
  store ptr @15, ptr %58, align 8, !dbg !952
  %59 = getelementptr inbounds nuw %str, ptr %57, i32 0, i32 1, !dbg !952
  store i64 0, ptr %59, align 8, !dbg !952
  %60 = load %str, ptr %57, align 8, !dbg !952
  store %str %60, ptr %4, align 8, !dbg !952
  br label %mir.bb11, !dbg !952

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !952
}

define internal %str @Regex.capture_text(ptr %0, %str %1, i32 %2) !dbg !954 {
entry:
  %3 = alloca i32, align 4, !dbg !955
  %4 = alloca %Match, align 8, !dbg !955
  %5 = alloca %str, align 8, !dbg !955
  %6 = alloca i32, align 4, !dbg !955
  %7 = alloca { i32, %Match }, align 8, !dbg !955
  %8 = alloca i32, align 4, !dbg !955
  %9 = alloca { i32, %Match }, align 8, !dbg !955
  %10 = alloca %Captures, align 8, !dbg !955
  %11 = alloca %str, align 8, !dbg !955
  %12 = alloca i32, align 4, !dbg !955
  %13 = alloca { i32, %Captures }, align 8, !dbg !955
  %14 = alloca { i32, %Captures }, align 8, !dbg !955
  %15 = alloca i32, align 4, !dbg !955
  %16 = alloca %str, align 8, !dbg !955
  %17 = alloca ptr, align 8, !dbg !955
  %18 = alloca %str, align 8, !dbg !955
  store ptr %0, ptr %17, align 8, !dbg !955
  store %str %1, ptr %16, align 8, !dbg !955
  store i32 %2, ptr %15, align 4, !dbg !955
  br label %mir.bb0, !dbg !955

mir.bb0:                                          ; preds = %entry
  %19 = load ptr, ptr %17, align 8, !dbg !955
  %20 = load %str, ptr %16, align 8, !dbg !955
  %21 = call { i32, %Captures } @Regex.captures(ptr %19, %str %20), !dbg !955
  store { i32, %Captures } %21, ptr %14, align 8, !dbg !955
  br label %mir.bb1, !dbg !955

mir.bb1:                                          ; preds = %mir.bb0
  %22 = load { i32, %Captures }, ptr %14, align 8, !dbg !956
  store { i32, %Captures } %22, ptr %13, align 8, !dbg !956
  %23 = load { i32, %Captures }, ptr %13, align 8, !dbg !956
  %24 = extractvalue { i32, %Captures } %23, 0, !dbg !956
  store i32 %24, ptr %12, align 4, !dbg !956
  %25 = load i32, ptr %12, align 4, !dbg !956
  switch i32 %25, label %mir.bb4 [
    i32 0, label %mir.bb3
  ], !dbg !956

mir.bb2:                                          ; preds = %mir.bb10, %mir.bb6, %mir.bb4
  %26 = load %str, ptr %11, align 8, !dbg !958
  store %str %26, ptr %18, align 8, !dbg !958
  %27 = load %str, ptr %18, align 8, !dbg !958
  ret %str %27, !dbg !958

mir.bb3:                                          ; preds = %mir.bb1
  %28 = getelementptr inbounds nuw { i32, %Captures }, ptr %13, i32 0, i32 1, !dbg !960
  %29 = getelementptr inbounds nuw { %Captures }, ptr %28, i32 0, i32 0, !dbg !960
  %30 = load %Captures, ptr %29, align 8, !dbg !960
  store %Captures %30, ptr %10, align 8, !dbg !960
  %31 = load %Captures, ptr %10, align 8, !dbg !960
  %32 = load i32, ptr %15, align 4, !dbg !960
  %33 = call { i32, %Match } @Captures.get(ptr %10, i32 %32), !dbg !960
  store { i32, %Match } %33, ptr %9, align 8, !dbg !960
  br label %mir.bb5, !dbg !960

mir.bb4:                                          ; preds = %mir.bb1
  %34 = load { i32, %Captures }, ptr %13, align 8, !dbg !960
  %35 = extractvalue { i32, %Captures } %34, 0, !dbg !960
  store i32 %35, ptr %8, align 4, !dbg !960
  %36 = load i32, ptr %8, align 4, !dbg !960
  switch i32 %36, label %mir.bb2 [
    i32 1, label %mir.bb10
  ], !dbg !960

mir.bb5:                                          ; preds = %mir.bb3
  %37 = load { i32, %Match }, ptr %9, align 8, !dbg !962
  store { i32, %Match } %37, ptr %7, align 8, !dbg !962
  %38 = load { i32, %Match }, ptr %7, align 8, !dbg !962
  %39 = extractvalue { i32, %Match } %38, 0, !dbg !962
  store i32 %39, ptr %6, align 4, !dbg !962
  %40 = load i32, ptr %6, align 4, !dbg !962
  switch i32 %40, label %mir.bb8 [
    i32 0, label %mir.bb7
  ], !dbg !962

mir.bb6:                                          ; preds = %mir.bb9, %mir.bb8, %mir.bb7
  %41 = load %str, ptr %5, align 8, !dbg !964
  store %str %41, ptr %11, align 8, !dbg !964
  br label %mir.bb2, !dbg !964

mir.bb7:                                          ; preds = %mir.bb5
  %42 = getelementptr inbounds nuw { i32, %Match }, ptr %7, i32 0, i32 1, !dbg !966
  %43 = getelementptr inbounds nuw { %Match }, ptr %42, i32 0, i32 0, !dbg !966
  %44 = load %Match, ptr %43, align 8, !dbg !966
  store %Match %44, ptr %4, align 8, !dbg !966
  %45 = getelementptr inbounds nuw %Match, ptr %4, i32 0, i32 0, !dbg !966
  %46 = load %str, ptr %45, align 8, !dbg !966
  store %str %46, ptr %5, align 8, !dbg !966
  br label %mir.bb6, !dbg !966

mir.bb8:                                          ; preds = %mir.bb5
  %47 = load { i32, %Match }, ptr %7, align 8, !dbg !966
  %48 = extractvalue { i32, %Match } %47, 0, !dbg !966
  store i32 %48, ptr %3, align 4, !dbg !966
  %49 = load i32, ptr %3, align 4, !dbg !966
  switch i32 %49, label %mir.bb6 [
    i32 1, label %mir.bb9
  ], !dbg !966

mir.bb9:                                          ; preds = %mir.bb8
  %50 = alloca %str, align 8, !dbg !968
  %51 = getelementptr inbounds nuw %str, ptr %50, i32 0, i32 0, !dbg !968
  store ptr @16, ptr %51, align 8, !dbg !968
  %52 = getelementptr inbounds nuw %str, ptr %50, i32 0, i32 1, !dbg !968
  store i64 0, ptr %52, align 8, !dbg !968
  %53 = load %str, ptr %50, align 8, !dbg !968
  store %str %53, ptr %5, align 8, !dbg !968
  br label %mir.bb6, !dbg !968

mir.bb10:                                         ; preds = %mir.bb4
  %54 = alloca %str, align 8, !dbg !970
  %55 = getelementptr inbounds nuw %str, ptr %54, i32 0, i32 0, !dbg !970
  store ptr @17, ptr %55, align 8, !dbg !970
  %56 = getelementptr inbounds nuw %str, ptr %54, i32 0, i32 1, !dbg !970
  store i64 0, ptr %56, align 8, !dbg !970
  %57 = load %str, ptr %54, align 8, !dbg !970
  store %str %57, ptr %11, align 8, !dbg !970
  br label %mir.bb2, !dbg !970

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !970
}

define internal %str @Regex.capture_name_text(ptr %0, %str %1, %str %2) !dbg !972 {
entry:
  %3 = alloca i32, align 4, !dbg !973
  %4 = alloca %Match, align 8, !dbg !973
  %5 = alloca %str, align 8, !dbg !973
  %6 = alloca i32, align 4, !dbg !973
  %7 = alloca { i32, %Match }, align 8, !dbg !973
  %8 = alloca i32, align 4, !dbg !973
  %9 = alloca { i32, %Match }, align 8, !dbg !973
  %10 = alloca %str, align 8, !dbg !973
  %11 = alloca %Captures, align 8, !dbg !973
  %12 = alloca i32, align 4, !dbg !973
  %13 = alloca { i32, %Captures }, align 8, !dbg !973
  %14 = alloca %str, align 8, !dbg !973
  %15 = alloca { i32, %Captures }, align 8, !dbg !973
  %16 = alloca %str, align 8, !dbg !973
  %17 = alloca %str, align 8, !dbg !973
  %18 = alloca i64, align 8, !dbg !973
  %19 = alloca i1, align 1, !dbg !973
  %20 = alloca i32, align 4, !dbg !973
  %21 = alloca i1, align 1, !dbg !973
  %22 = alloca i1, align 1, !dbg !973
  %23 = alloca i64, align 8, !dbg !973
  %24 = alloca %str, align 8, !dbg !973
  %25 = alloca %str, align 8, !dbg !973
  %26 = alloca ptr, align 8, !dbg !973
  %27 = alloca %str, align 8, !dbg !973
  store ptr %0, ptr %26, align 8, !dbg !973
  store %str %1, ptr %25, align 8, !dbg !973
  store %str %2, ptr %24, align 8, !dbg !973
  br label %mir.bb0, !dbg !973

mir.bb0:                                          ; preds = %entry
  %28 = load %str, ptr %24, align 8, !dbg !973
  %29 = extractvalue %str %28, 1, !dbg !973
  store i64 %29, ptr %23, align 8, !dbg !973
  br label %mir.bb1, !dbg !973

mir.bb1:                                          ; preds = %mir.bb0
  %30 = load i64, ptr %23, align 8, !dbg !974
  %31 = icmp sgt i64 %30, 0, !dbg !974
  store i1 %31, ptr %22, align 1, !dbg !974
  %32 = load i1, ptr %22, align 1, !dbg !974
  store i1 %32, ptr %21, align 1, !dbg !974
  %33 = load i1, ptr %21, align 1, !dbg !974
  br i1 %33, label %mir.bb2, label %mir.bb3, !dbg !974

mir.bb2:                                          ; preds = %mir.bb1
  %34 = load %str, ptr %24, align 8, !dbg !974
  %35 = call i32 @with_str_byte_at(%str %34, i64 0), !dbg !974
  store i32 %35, ptr %20, align 4, !dbg !974
  br label %mir.bb4, !dbg !974

mir.bb3:                                          ; preds = %mir.bb4, %mir.bb1
  %36 = load i1, ptr %21, align 1, !dbg !974
  br i1 %36, label %mir.bb5, label %mir.bb6, !dbg !974

mir.bb4:                                          ; preds = %mir.bb2
  %37 = load i32, ptr %20, align 4, !dbg !976
  %38 = icmp eq i32 %37, 36, !dbg !976
  store i1 %38, ptr %19, align 1, !dbg !976
  %39 = load i1, ptr %19, align 1, !dbg !976
  store i1 %39, ptr %21, align 1, !dbg !976
  br label %mir.bb3, !dbg !976

mir.bb5:                                          ; preds = %mir.bb3
  %40 = load %str, ptr %24, align 8, !dbg !976
  %41 = extractvalue %str %40, 1, !dbg !976
  store i64 %41, ptr %18, align 8, !dbg !976
  br label %mir.bb8, !dbg !976

mir.bb6:                                          ; preds = %mir.bb3
  %42 = load %str, ptr %24, align 8, !dbg !978
  store %str %42, ptr %17, align 8, !dbg !978
  br label %mir.bb7, !dbg !978

mir.bb7:                                          ; preds = %mir.bb9, %mir.bb6
  %43 = load %str, ptr %17, align 8, !dbg !980
  store %str %43, ptr %16, align 8, !dbg !980
  %44 = load ptr, ptr %26, align 8, !dbg !980
  %45 = load %str, ptr %25, align 8, !dbg !980
  %46 = call { i32, %Captures } @Regex.captures(ptr %44, %str %45), !dbg !980
  store { i32, %Captures } %46, ptr %15, align 8, !dbg !980
  br label %mir.bb10, !dbg !980

mir.bb8:                                          ; preds = %mir.bb5
  %47 = load %str, ptr %24, align 8, !dbg !980
  %48 = load i64, ptr %18, align 8, !dbg !980
  %49 = call %str @with_str_slice(%str %47, i64 1, i64 %48), !dbg !980
  store %str %49, ptr %14, align 8, !dbg !980
  br label %mir.bb9, !dbg !980

mir.bb9:                                          ; preds = %mir.bb8
  %50 = load %str, ptr %14, align 8, !dbg !982
  store %str %50, ptr %17, align 8, !dbg !982
  br label %mir.bb7, !dbg !982

mir.bb10:                                         ; preds = %mir.bb7
  %51 = load { i32, %Captures }, ptr %15, align 8, !dbg !984
  store { i32, %Captures } %51, ptr %13, align 8, !dbg !984
  %52 = load { i32, %Captures }, ptr %13, align 8, !dbg !984
  %53 = extractvalue { i32, %Captures } %52, 0, !dbg !984
  store i32 %53, ptr %12, align 4, !dbg !984
  %54 = load i32, ptr %12, align 4, !dbg !984
  switch i32 %54, label %mir.bb13 [
    i32 0, label %mir.bb12
  ], !dbg !984

mir.bb11:                                         ; preds = %mir.bb19, %mir.bb15, %mir.bb13
  %55 = load %str, ptr %10, align 8, !dbg !984
  store %str %55, ptr %27, align 8, !dbg !984
  %56 = load %str, ptr %27, align 8, !dbg !984
  ret %str %56, !dbg !984

mir.bb12:                                         ; preds = %mir.bb10
  %57 = getelementptr inbounds nuw { i32, %Captures }, ptr %13, i32 0, i32 1, !dbg !986
  %58 = getelementptr inbounds nuw { %Captures }, ptr %57, i32 0, i32 0, !dbg !986
  %59 = load %Captures, ptr %58, align 8, !dbg !986
  store %Captures %59, ptr %11, align 8, !dbg !986
  %60 = load %Captures, ptr %11, align 8, !dbg !986
  %61 = load %str, ptr %16, align 8, !dbg !986
  %62 = call { i32, %Match } @Captures.name(ptr %11, %str %61), !dbg !986
  store { i32, %Match } %62, ptr %9, align 8, !dbg !986
  br label %mir.bb14, !dbg !986

mir.bb13:                                         ; preds = %mir.bb10
  %63 = load { i32, %Captures }, ptr %13, align 8, !dbg !986
  %64 = extractvalue { i32, %Captures } %63, 0, !dbg !986
  store i32 %64, ptr %8, align 4, !dbg !986
  %65 = load i32, ptr %8, align 4, !dbg !986
  switch i32 %65, label %mir.bb11 [
    i32 1, label %mir.bb19
  ], !dbg !986

mir.bb14:                                         ; preds = %mir.bb12
  %66 = load { i32, %Match }, ptr %9, align 8, !dbg !988
  store { i32, %Match } %66, ptr %7, align 8, !dbg !988
  %67 = load { i32, %Match }, ptr %7, align 8, !dbg !988
  %68 = extractvalue { i32, %Match } %67, 0, !dbg !988
  store i32 %68, ptr %6, align 4, !dbg !988
  %69 = load i32, ptr %6, align 4, !dbg !988
  switch i32 %69, label %mir.bb17 [
    i32 0, label %mir.bb16
  ], !dbg !988

mir.bb15:                                         ; preds = %mir.bb18, %mir.bb17, %mir.bb16
  %70 = load %str, ptr %5, align 8, !dbg !990
  store %str %70, ptr %10, align 8, !dbg !990
  br label %mir.bb11, !dbg !990

mir.bb16:                                         ; preds = %mir.bb14
  %71 = getelementptr inbounds nuw { i32, %Match }, ptr %7, i32 0, i32 1, !dbg !992
  %72 = getelementptr inbounds nuw { %Match }, ptr %71, i32 0, i32 0, !dbg !992
  %73 = load %Match, ptr %72, align 8, !dbg !992
  store %Match %73, ptr %4, align 8, !dbg !992
  %74 = getelementptr inbounds nuw %Match, ptr %4, i32 0, i32 0, !dbg !992
  %75 = load %str, ptr %74, align 8, !dbg !992
  store %str %75, ptr %5, align 8, !dbg !992
  br label %mir.bb15, !dbg !992

mir.bb17:                                         ; preds = %mir.bb14
  %76 = load { i32, %Match }, ptr %7, align 8, !dbg !992
  %77 = extractvalue { i32, %Match } %76, 0, !dbg !992
  store i32 %77, ptr %3, align 4, !dbg !992
  %78 = load i32, ptr %3, align 4, !dbg !992
  switch i32 %78, label %mir.bb15 [
    i32 1, label %mir.bb18
  ], !dbg !992

mir.bb18:                                         ; preds = %mir.bb17
  %79 = alloca %str, align 8, !dbg !994
  %80 = getelementptr inbounds nuw %str, ptr %79, i32 0, i32 0, !dbg !994
  store ptr @18, ptr %80, align 8, !dbg !994
  %81 = getelementptr inbounds nuw %str, ptr %79, i32 0, i32 1, !dbg !994
  store i64 0, ptr %81, align 8, !dbg !994
  %82 = load %str, ptr %79, align 8, !dbg !994
  store %str %82, ptr %5, align 8, !dbg !994
  br label %mir.bb15, !dbg !994

mir.bb19:                                         ; preds = %mir.bb13
  %83 = alloca %str, align 8, !dbg !996
  %84 = getelementptr inbounds nuw %str, ptr %83, i32 0, i32 0, !dbg !996
  store ptr @19, ptr %84, align 8, !dbg !996
  %85 = getelementptr inbounds nuw %str, ptr %83, i32 0, i32 1, !dbg !996
  store i64 0, ptr %85, align 8, !dbg !996
  %86 = load %str, ptr %83, align 8, !dbg !996
  store %str %86, ptr %10, align 8, !dbg !996
  br label %mir.bb11, !dbg !996

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !996
}

define internal i1 @i32.eq(i32 %0, i32 %1) !dbg !998 {
entry:
  %2 = alloca i1, align 1, !dbg !999
  %3 = alloca i32, align 4, !dbg !999
  %4 = alloca i32, align 4, !dbg !999
  %5 = alloca i1, align 1, !dbg !999
  store i32 %0, ptr %4, align 4, !dbg !999
  store i32 %1, ptr %3, align 4, !dbg !999
  br label %mir.bb0, !dbg !999

mir.bb0:                                          ; preds = %entry
  %6 = load i32, ptr %4, align 4, !dbg !999
  %7 = load i32, ptr %3, align 4, !dbg !999
  %8 = icmp eq i32 %6, %7, !dbg !999
  store i1 %8, ptr %2, align 1, !dbg !999
  %9 = load i1, ptr %2, align 1, !dbg !999
  store i1 %9, ptr %5, align 1, !dbg !999
  %10 = load i1, ptr %5, align 1, !dbg !999
  ret i1 %10, !dbg !999
}

define internal i1 @bool.eq(i1 %0, i1 %1) !dbg !1000 {
entry:
  %2 = alloca i1, align 1, !dbg !1001
  %3 = alloca i1, align 1, !dbg !1001
  %4 = alloca i1, align 1, !dbg !1001
  %5 = alloca i1, align 1, !dbg !1001
  store i1 %0, ptr %4, align 1, !dbg !1001
  store i1 %1, ptr %3, align 1, !dbg !1001
  br label %mir.bb0, !dbg !1001

mir.bb0:                                          ; preds = %entry
  %6 = load i1, ptr %4, align 1, !dbg !1001
  %7 = load i1, ptr %3, align 1, !dbg !1001
  %8 = icmp eq i1 %6, %7, !dbg !1001
  store i1 %8, ptr %2, align 1, !dbg !1001
  %9 = load i1, ptr %2, align 1, !dbg !1001
  store i1 %9, ptr %5, align 1, !dbg !1001
  %10 = load i1, ptr %5, align 1, !dbg !1001
  ret i1 %10, !dbg !1001
}

define internal i32 @i32.default() !dbg !1002 {
entry:
  %0 = alloca i32, align 4, !dbg !1003
  br label %mir.bb0, !dbg !1003

mir.bb0:                                          ; preds = %entry
  store i32 0, ptr %0, align 4, !dbg !1003
  %1 = load i32, ptr %0, align 4, !dbg !1003
  ret i32 %1, !dbg !1003
}

define internal i1 @bool.default() !dbg !1004 {
entry:
  %0 = alloca i1, align 1, !dbg !1005
  br label %mir.bb0, !dbg !1005

mir.bb0:                                          ; preds = %entry
  store i1 false, ptr %0, align 1, !dbg !1005
  %1 = load i1, ptr %0, align 1, !dbg !1005
  ret i1 %1, !dbg !1005
}

define internal i1 @str.eq(%str %0, %str %1) !dbg !1006 {
entry:
  %2 = alloca i1, align 1, !dbg !1007
  %3 = alloca %str, align 8, !dbg !1007
  %4 = alloca %str, align 8, !dbg !1007
  %5 = alloca i1, align 1, !dbg !1007
  store %str %0, ptr %4, align 8, !dbg !1007
  store %str %1, ptr %3, align 8, !dbg !1007
  br label %mir.bb0, !dbg !1007

mir.bb0:                                          ; preds = %entry
  %6 = load %str, ptr %4, align 8, !dbg !1007
  %7 = load %str, ptr %3, align 8, !dbg !1007
  %8 = call i32 @with_str_eq(%str %6, %str %7), !dbg !1007
  %9 = icmp ne i32 %8, 0, !dbg !1007
  store i1 %9, ptr %2, align 1, !dbg !1007
  %10 = load i1, ptr %2, align 1, !dbg !1007
  store i1 %10, ptr %5, align 1, !dbg !1007
  %11 = load i1, ptr %5, align 1, !dbg !1007
  ret i1 %11, !dbg !1007
}

define internal i1 @i64.eq(i64 %0, i64 %1) !dbg !1008 {
entry:
  %2 = alloca i1, align 1, !dbg !1009
  %3 = alloca i64, align 8, !dbg !1009
  %4 = alloca i64, align 8, !dbg !1009
  %5 = alloca i1, align 1, !dbg !1009
  store i64 %0, ptr %4, align 8, !dbg !1009
  store i64 %1, ptr %3, align 8, !dbg !1009
  br label %mir.bb0, !dbg !1009

mir.bb0:                                          ; preds = %entry
  %6 = load i64, ptr %4, align 8, !dbg !1009
  %7 = load i64, ptr %3, align 8, !dbg !1009
  %8 = icmp eq i64 %6, %7, !dbg !1009
  store i1 %8, ptr %2, align 1, !dbg !1009
  %9 = load i1, ptr %2, align 1, !dbg !1009
  store i1 %9, ptr %5, align 1, !dbg !1009
  %10 = load i1, ptr %5, align 1, !dbg !1009
  ret i1 %10, !dbg !1009
}

define internal %str @i32.debug_str(i32 %0) !dbg !1010 {
entry:
  %1 = alloca %str, align 8, !dbg !1011
  %2 = alloca i32, align 4, !dbg !1011
  %3 = alloca %str, align 8, !dbg !1011
  store i32 %0, ptr %2, align 4, !dbg !1011
  br label %mir.bb0, !dbg !1011

mir.bb0:                                          ; preds = %entry
  %4 = load i32, ptr %2, align 4, !dbg !1011
  %5 = call %str @with_i32_to_str(i32 %4), !dbg !1011
  store %str %5, ptr %1, align 8, !dbg !1011
  br label %mir.bb1, !dbg !1011

mir.bb1:                                          ; preds = %mir.bb0
  %6 = load %str, ptr %1, align 8, !dbg !1012
  store %str %6, ptr %3, align 8, !dbg !1012
  %7 = load %str, ptr %3, align 8, !dbg !1012
  ret %str %7, !dbg !1012
}

define internal %str @bool.debug_str(i1 %0) !dbg !1014 {
entry:
  %1 = alloca %str, align 8, !dbg !1015
  %2 = alloca i1, align 1, !dbg !1015
  %3 = alloca %str, align 8, !dbg !1015
  store i1 %0, ptr %2, align 1, !dbg !1015
  br label %mir.bb0, !dbg !1015

mir.bb0:                                          ; preds = %entry
  %4 = load i1, ptr %2, align 1, !dbg !1015
  br i1 %4, label %mir.bb1, label %mir.bb2, !dbg !1015

mir.bb1:                                          ; preds = %mir.bb0
  %5 = alloca %str, align 8, !dbg !1016
  %6 = getelementptr inbounds nuw %str, ptr %5, i32 0, i32 0, !dbg !1016
  store ptr @20, ptr %6, align 8, !dbg !1016
  %7 = getelementptr inbounds nuw %str, ptr %5, i32 0, i32 1, !dbg !1016
  store i64 4, ptr %7, align 8, !dbg !1016
  %8 = load %str, ptr %5, align 8, !dbg !1016
  store %str %8, ptr %1, align 8, !dbg !1016
  br label %mir.bb3, !dbg !1016

mir.bb2:                                          ; preds = %mir.bb0
  %9 = alloca %str, align 8, !dbg !1018
  %10 = getelementptr inbounds nuw %str, ptr %9, i32 0, i32 0, !dbg !1018
  store ptr @21, ptr %10, align 8, !dbg !1018
  %11 = getelementptr inbounds nuw %str, ptr %9, i32 0, i32 1, !dbg !1018
  store i64 5, ptr %11, align 8, !dbg !1018
  %12 = load %str, ptr %9, align 8, !dbg !1018
  store %str %12, ptr %1, align 8, !dbg !1018
  br label %mir.bb3, !dbg !1018

mir.bb3:                                          ; preds = %mir.bb2, %mir.bb1
  %13 = load %str, ptr %1, align 8, !dbg !1020
  store %str %13, ptr %3, align 8, !dbg !1020
  %14 = load %str, ptr %3, align 8, !dbg !1020
  ret %str %14, !dbg !1020

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !1020
}

define internal %str @str.debug_str(%str %0) !dbg !1022 {
entry:
  %1 = alloca %str, align 8, !dbg !1023
  %2 = alloca %str, align 8, !dbg !1023
  %3 = alloca %str, align 8, !dbg !1023
  %4 = alloca %str, align 8, !dbg !1023
  store %str %0, ptr %3, align 8, !dbg !1023
  br label %mir.bb0, !dbg !1023

mir.bb0:                                          ; preds = %entry
  %5 = alloca %str, align 8, !dbg !1023
  %6 = getelementptr inbounds nuw %str, ptr %5, i32 0, i32 0, !dbg !1023
  store ptr @22, ptr %6, align 8, !dbg !1023
  %7 = getelementptr inbounds nuw %str, ptr %5, i32 0, i32 1, !dbg !1023
  store i64 1, ptr %7, align 8, !dbg !1023
  %8 = load %str, ptr %5, align 8, !dbg !1023
  %9 = load %str, ptr %3, align 8, !dbg !1023
  %10 = call %str @with_str_concat(%str %8, %str %9), !dbg !1023
  store %str %10, ptr %2, align 8, !dbg !1023
  %11 = load %str, ptr %2, align 8, !dbg !1023
  %12 = alloca %str, align 8, !dbg !1023
  %13 = getelementptr inbounds nuw %str, ptr %12, i32 0, i32 0, !dbg !1023
  store ptr @23, ptr %13, align 8, !dbg !1023
  %14 = getelementptr inbounds nuw %str, ptr %12, i32 0, i32 1, !dbg !1023
  store i64 1, ptr %14, align 8, !dbg !1023
  %15 = load %str, ptr %12, align 8, !dbg !1023
  %16 = call %str @with_str_concat(%str %11, %str %15), !dbg !1023
  store %str %16, ptr %1, align 8, !dbg !1023
  %17 = load %str, ptr %1, align 8, !dbg !1023
  store %str %17, ptr %4, align 8, !dbg !1023
  %18 = load %str, ptr %4, align 8, !dbg !1023
  ret %str %18, !dbg !1023
}

define internal i64 @i32.hash_value(i32 %0) !dbg !1024 {
entry:
  %1 = alloca i64, align 8, !dbg !1025
  %2 = alloca i64, align 8, !dbg !1025
  %3 = alloca i64, align 8, !dbg !1025
  %4 = alloca i32, align 4, !dbg !1025
  %5 = alloca i64, align 8, !dbg !1025
  store i32 %0, ptr %4, align 4, !dbg !1025
  br label %mir.bb0, !dbg !1025

mir.bb0:                                          ; preds = %entry
  store i64 4953163356653287321, ptr %3, align 8, !dbg !1025
  %6 = load i32, ptr %4, align 4, !dbg !1025
  %7 = sext i32 %6 to i64, !dbg !1025
  store i64 %7, ptr %2, align 8, !dbg !1025
  %8 = load i64, ptr %3, align 8, !dbg !1025
  %9 = load i64, ptr %2, align 8, !dbg !1025
  %10 = xor i64 %8, %9, !dbg !1025
  store i64 %10, ptr %1, align 8, !dbg !1025
  %11 = load i64, ptr %1, align 8, !dbg !1025
  store i64 %11, ptr %5, align 8, !dbg !1025
  %12 = load i64, ptr %5, align 8, !dbg !1025
  ret i64 %12, !dbg !1025
}

define internal i64 @i64.hash_value(i64 %0) !dbg !1026 {
entry:
  %1 = alloca i64, align 8, !dbg !1027
  %2 = alloca i64, align 8, !dbg !1027
  %3 = alloca i64, align 8, !dbg !1027
  %4 = alloca i64, align 8, !dbg !1027
  store i64 %0, ptr %3, align 8, !dbg !1027
  br label %mir.bb0, !dbg !1027

mir.bb0:                                          ; preds = %entry
  store i64 4953163356653287321, ptr %2, align 8, !dbg !1027
  %5 = load i64, ptr %2, align 8, !dbg !1027
  %6 = load i64, ptr %3, align 8, !dbg !1027
  %7 = xor i64 %5, %6, !dbg !1027
  store i64 %7, ptr %1, align 8, !dbg !1027
  %8 = load i64, ptr %1, align 8, !dbg !1027
  store i64 %8, ptr %4, align 8, !dbg !1027
  %9 = load i64, ptr %4, align 8, !dbg !1027
  ret i64 %9, !dbg !1027
}

define internal i64 @bool.hash_value(i1 %0) !dbg !1028 {
entry:
  %1 = alloca i64, align 8, !dbg !1029
  %2 = alloca i1, align 1, !dbg !1029
  %3 = alloca i64, align 8, !dbg !1029
  store i1 %0, ptr %2, align 1, !dbg !1029
  br label %mir.bb0, !dbg !1029

mir.bb0:                                          ; preds = %entry
  %4 = load i1, ptr %2, align 1, !dbg !1029
  br i1 %4, label %mir.bb1, label %mir.bb2, !dbg !1029

mir.bb1:                                          ; preds = %mir.bb0
  store i64 1, ptr %1, align 8, !dbg !1030
  br label %mir.bb3, !dbg !1030

mir.bb2:                                          ; preds = %mir.bb0
  store i64 0, ptr %1, align 8, !dbg !1032
  br label %mir.bb3, !dbg !1032

mir.bb3:                                          ; preds = %mir.bb2, %mir.bb1
  %5 = load i64, ptr %1, align 8, !dbg !1034
  store i64 %5, ptr %3, align 8, !dbg !1034
  %6 = load i64, ptr %3, align 8, !dbg !1034
  ret i64 %6, !dbg !1034

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !1034
}

define internal i64 @str.hash_value(%str %0) !dbg !1036 {
entry:
  %1 = alloca i1, align 1, !dbg !1037
  %2 = alloca i64, align 8, !dbg !1037
  %3 = alloca i64, align 8, !dbg !1037
  %4 = alloca i64, align 8, !dbg !1037
  %5 = alloca i64, align 8, !dbg !1037
  %6 = alloca i64, align 8, !dbg !1037
  %7 = alloca i64, align 8, !dbg !1037
  %8 = alloca i64, align 8, !dbg !1037
  %9 = alloca %str, align 8, !dbg !1037
  %10 = alloca i64, align 8, !dbg !1037
  store %str %0, ptr %9, align 8, !dbg !1037
  br label %mir.bb0, !dbg !1037

mir.bb0:                                          ; preds = %entry
  store i64 1469598103934665603, ptr %8, align 8, !dbg !1037
  store i64 0, ptr %7, align 8, !dbg !1037
  br label %mir.bb1, !dbg !1037

mir.bb1:                                          ; preds = %mir.bb2, %mir.bb0
  %11 = load %str, ptr %9, align 8, !dbg !1037
  %12 = extractvalue %str %11, 1, !dbg !1037
  store i64 %12, ptr %6, align 8, !dbg !1037
  br label %mir.bb4, !dbg !1037

mir.bb2:                                          ; preds = %mir.bb4
  %13 = load i64, ptr %8, align 8, !dbg !1038
  %14 = mul i64 %13, 1099511628211, !dbg !1038
  store i64 %14, ptr %5, align 8, !dbg !1038
  %15 = load i64, ptr %7, align 8, !dbg !1038
  store i64 %15, ptr %4, align 8, !dbg !1038
  %16 = load i64, ptr %5, align 8, !dbg !1038
  %17 = load i64, ptr %4, align 8, !dbg !1038
  %18 = getelementptr inbounds nuw %str, ptr %9, i32 0, i32 0, !dbg !1038
  %19 = load ptr, ptr %18, align 8, !dbg !1038
  %20 = getelementptr i8, ptr %19, i64 %17, !dbg !1038
  %21 = load i8, ptr %20, align 1, !dbg !1038
  %22 = sext i8 %21 to i64, !dbg !1038
  %23 = xor i64 %16, %22, !dbg !1038
  store i64 %23, ptr %3, align 8, !dbg !1038
  %24 = load i64, ptr %3, align 8, !dbg !1038
  store i64 %24, ptr %8, align 8, !dbg !1038
  %25 = load i64, ptr %7, align 8, !dbg !1038
  %26 = add nsw i64 %25, 1, !dbg !1038
  store i64 %26, ptr %2, align 8, !dbg !1038
  %27 = load i64, ptr %2, align 8, !dbg !1038
  store i64 %27, ptr %7, align 8, !dbg !1038
  br label %mir.bb1, !dbg !1038

mir.bb3:                                          ; preds = %mir.bb4
  %28 = load i64, ptr %8, align 8, !dbg !1040
  store i64 %28, ptr %10, align 8, !dbg !1040
  %29 = load i64, ptr %10, align 8, !dbg !1040
  ret i64 %29, !dbg !1040

mir.bb4:                                          ; preds = %mir.bb1
  %30 = load i64, ptr %7, align 8, !dbg !1042
  %31 = load i64, ptr %6, align 8, !dbg !1042
  %32 = icmp slt i64 %30, %31, !dbg !1042
  store i1 %32, ptr %1, align 1, !dbg !1042
  %33 = load i1, ptr %1, align 1, !dbg !1042
  br i1 %33, label %mir.bb2, label %mir.bb3, !dbg !1042

mir.default.unreachable:                          ; No predecessors!
  unreachable, !dbg !1042
}

define void @__with_main() !dbg !1044 {
entry:
  %0 = alloca i32, align 4
  br label %mir.bb0

mir.bb0:                                          ; preds = %entry
  call void @print_i32(i32 42), !dbg !1045
  br label %mir.bb1, !dbg !1045

mir.bb1:                                          ; preds = %mir.bb0
  %1 = alloca %str, align 8, !dbg !1046
  %2 = getelementptr inbounds nuw %str, ptr %1, i32 0, i32 0, !dbg !1046
  store ptr @24, ptr %2, align 8, !dbg !1046
  %3 = getelementptr inbounds nuw %str, ptr %1, i32 0, i32 1, !dbg !1046
  store i64 5, ptr %3, align 8, !dbg !1046
  %4 = load %str, ptr %1, align 8, !dbg !1046
  call void @print(%str %4), !dbg !1046
  br label %mir.bb2, !dbg !1046

mir.bb2:                                          ; preds = %mir.bb1
  ret void, !dbg !1046
}

define internal %str @__dynwrap_i32_to_string(ptr %0) {
entry:
  %1 = call %str @i32.to_string(ptr %0)
  ret %str %1
}

define internal %str @__dynwrap_i64_to_string(ptr %0) {
entry:
  %1 = call %str @i64.to_string(ptr %0)
  ret %str %1
}

define internal %str @__dynwrap_u32_to_string(ptr %0) {
entry:
  %1 = call %str @u32.to_string(ptr %0)
  ret %str %1
}

define internal %str @__dynwrap_u64_to_string(ptr %0) {
entry:
  %1 = call %str @u64.to_string(ptr %0)
  ret %str %1
}

define internal %str @__dynwrap_bool_to_string(ptr %0) {
entry:
  %1 = call %str @bool.to_string(ptr %0)
  ret %str %1
}

define internal i1 @__dynwrap_i32_eq(ptr %0, i32 %1) {
entry:
  %2 = load i32, ptr %0, align 4
  %3 = call i1 @i32.eq(i32 %2, i32 %1)
  ret i1 %3
}

define internal i1 @__dynwrap_bool_eq(ptr %0, i1 %1) {
entry:
  %2 = load i1, ptr %0, align 1
  %3 = call i1 @bool.eq(i1 %2, i1 %1)
  ret i1 %3
}

define internal i1 @__dynwrap_str_eq(ptr %0, %str %1) {
entry:
  %2 = load %str, ptr %0, align 8
  %3 = call i1 @str.eq(%str %2, %str %1)
  ret i1 %3
}

define internal i1 @__dynwrap_i64_eq(ptr %0, i64 %1) {
entry:
  %2 = load i64, ptr %0, align 8
  %3 = call i1 @i64.eq(i64 %2, i64 %1)
  ret i1 %3
}

define internal %str @__dynwrap_i32_debug_str(ptr %0) {
entry:
  %1 = load i32, ptr %0, align 4
  %2 = call %str @i32.debug_str(i32 %1)
  ret %str %2
}

define internal %str @__dynwrap_bool_debug_str(ptr %0) {
entry:
  %1 = load i1, ptr %0, align 1
  %2 = call %str @bool.debug_str(i1 %1)
  ret %str %2
}

define internal %str @__dynwrap_str_debug_str(ptr %0) {
entry:
  %1 = load %str, ptr %0, align 8
  %2 = call %str @str.debug_str(%str %1)
  ret %str %2
}

define internal i64 @__dynwrap_i32_hash_value(ptr %0) {
entry:
  %1 = load i32, ptr %0, align 4
  %2 = call i64 @i32.hash_value(i32 %1)
  ret i64 %2
}

define internal i64 @__dynwrap_i64_hash_value(ptr %0) {
entry:
  %1 = load i64, ptr %0, align 8
  %2 = call i64 @i64.hash_value(i64 %1)
  ret i64 %2
}

define internal i64 @__dynwrap_bool_hash_value(ptr %0) {
entry:
  %1 = load i1, ptr %0, align 1
  %2 = call i64 @bool.hash_value(i1 %1)
  ret i64 %2
}

define internal i64 @__dynwrap_str_hash_value(ptr %0) {
entry:
  %1 = load %str, ptr %0, align 8
  %2 = call i64 @str.hash_value(%str %1)
  ret i64 %2
}

declare i32 @with_str_byte_at(%str, i64)

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sqrt.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.pow.f64(double, double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.floor.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.ceil.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.round.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.sin.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.cos.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.log.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.log10.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.exp.f64(double) #0

; Function Attrs: nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none)
declare double @llvm.fabs.f64(double) #0

declare %str @with_str_concat(%str, %str)

declare void @with_vec_new_out(ptr, i64)

declare void @with_vec_push(ptr, ptr)

declare i64 @with_vec_len(ptr)

declare ptr @with_vec_get_ptr(ptr, i64)

define i32 @main(i32 %0, ptr %1) {
entry:
  call void @with_runtime_set_argv(i32 %0, ptr %1)
  call void @with_runtime_init()
  call void @__with_main()
  call void @with_runtime_run()
  call void @with_runtime_shutdown()
  ret i32 0
}

declare void @with_runtime_set_argv(i32, ptr)

declare void @with_runtime_init()

declare void @with_runtime_run()

declare void @with_runtime_shutdown()

attributes #0 = { nocallback nocreateundeforpoison nofree nosync nounwind speculatable willreturn memory(none) }

!llvm.module.flags = !{!0, !1}
!llvm.dbg.cu = !{!2}

!0 = !{i32 2, !"Debug Info Version", i32 3}
!1 = !{i32 2, !"Dwarf Version", i32 5}
!2 = distinct !DICompileUnit(language: DW_LANG_C, file: !3, producer: "with", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, splitDebugInlining: false)
!3 = !DIFile(filename: "_test_abi.w", directory: ".")
!4 = distinct !DISubprogram(name: "fence", linkageName: "fence", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!5 = !DISubroutineType(types: !6)
!6 = !{}
!7 = !DILocation(line: 4, column: 1, scope: !4)
!8 = distinct !DISubprogram(name: "string_len", linkageName: "string_len", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!9 = !DILocation(line: 4, column: 1, scope: !8)
!10 = !DILocation(line: 4, column: 1, scope: !11)
!11 = distinct !DILexicalBlock(scope: !8, file: !3, line: 4, column: 1)
!12 = distinct !DISubprogram(name: "view_len", linkageName: "view_len", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!13 = !DILocation(line: 4, column: 1, scope: !12)
!14 = distinct !DISubprogram(name: "view_is_empty", linkageName: "view_is_empty", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!15 = !DILocation(line: 4, column: 1, scope: !14)
!16 = distinct !DISubprogram(name: "view_eq", linkageName: "view_eq", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!17 = !DILocation(line: 4, column: 1, scope: !16)
!18 = distinct !DISubprogram(name: "string_eq", linkageName: "string_eq", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!19 = !DILocation(line: 4, column: 1, scope: !18)
!20 = !DILocation(line: 4, column: 1, scope: !21)
!21 = distinct !DILexicalBlock(scope: !18, file: !3, line: 4, column: 1)
!22 = distinct !DISubprogram(name: "string_cmp", linkageName: "string_cmp", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!23 = !DILocation(line: 4, column: 1, scope: !22)
!24 = !DILocation(line: 4, column: 1, scope: !25)
!25 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!26 = !DILocation(line: 4, column: 1, scope: !27)
!27 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!28 = !DILocation(line: 4, column: 1, scope: !29)
!29 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!30 = !DILocation(line: 4, column: 1, scope: !31)
!31 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!32 = !DILocation(line: 4, column: 1, scope: !33)
!33 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!34 = !DILocation(line: 4, column: 1, scope: !35)
!35 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!36 = !DILocation(line: 4, column: 1, scope: !37)
!37 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!38 = !DILocation(line: 4, column: 1, scope: !39)
!39 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!40 = !DILocation(line: 4, column: 1, scope: !41)
!41 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!42 = !DILocation(line: 4, column: 1, scope: !43)
!43 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!44 = !DILocation(line: 4, column: 1, scope: !45)
!45 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!46 = !DILocation(line: 4, column: 1, scope: !47)
!47 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!48 = !DILocation(line: 4, column: 1, scope: !49)
!49 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!50 = !DILocation(line: 4, column: 1, scope: !51)
!51 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!52 = !DILocation(line: 4, column: 1, scope: !53)
!53 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!54 = !DILocation(line: 4, column: 1, scope: !55)
!55 = distinct !DILexicalBlock(scope: !22, file: !3, line: 4, column: 1)
!56 = distinct !DISubprogram(name: "is_alpha", linkageName: "is_alpha", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!57 = !DILocation(line: 4, column: 1, scope: !56)
!58 = !DILocation(line: 4, column: 1, scope: !59)
!59 = distinct !DILexicalBlock(scope: !56, file: !3, line: 4, column: 1)
!60 = !DILocation(line: 4, column: 1, scope: !61)
!61 = distinct !DILexicalBlock(scope: !56, file: !3, line: 4, column: 1)
!62 = !DILocation(line: 4, column: 1, scope: !63)
!63 = distinct !DILexicalBlock(scope: !56, file: !3, line: 4, column: 1)
!64 = !DILocation(line: 4, column: 1, scope: !65)
!65 = distinct !DILexicalBlock(scope: !56, file: !3, line: 4, column: 1)
!66 = !DILocation(line: 4, column: 1, scope: !67)
!67 = distinct !DILexicalBlock(scope: !56, file: !3, line: 4, column: 1)
!68 = !DILocation(line: 4, column: 1, scope: !69)
!69 = distinct !DILexicalBlock(scope: !56, file: !3, line: 4, column: 1)
!70 = distinct !DISubprogram(name: "is_digit", linkageName: "is_digit", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!71 = !DILocation(line: 4, column: 1, scope: !70)
!72 = !DILocation(line: 4, column: 1, scope: !73)
!73 = distinct !DILexicalBlock(scope: !70, file: !3, line: 4, column: 1)
!74 = !DILocation(line: 4, column: 1, scope: !75)
!75 = distinct !DILexicalBlock(scope: !70, file: !3, line: 4, column: 1)
!76 = distinct !DISubprogram(name: "is_space", linkageName: "is_space", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!77 = !DILocation(line: 4, column: 1, scope: !76)
!78 = !DILocation(line: 4, column: 1, scope: !79)
!79 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!80 = !DILocation(line: 4, column: 1, scope: !81)
!81 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!82 = !DILocation(line: 4, column: 1, scope: !83)
!83 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!84 = !DILocation(line: 4, column: 1, scope: !85)
!85 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!86 = !DILocation(line: 4, column: 1, scope: !87)
!87 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!88 = !DILocation(line: 4, column: 1, scope: !89)
!89 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!90 = !DILocation(line: 4, column: 1, scope: !91)
!91 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!92 = !DILocation(line: 4, column: 1, scope: !93)
!93 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!94 = !DILocation(line: 4, column: 1, scope: !95)
!95 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!96 = !DILocation(line: 4, column: 1, scope: !97)
!97 = distinct !DILexicalBlock(scope: !76, file: !3, line: 4, column: 1)
!98 = distinct !DISubprogram(name: "is_alnum", linkageName: "is_alnum", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!99 = !DILocation(line: 4, column: 1, scope: !98)
!100 = !DILocation(line: 4, column: 1, scope: !101)
!101 = distinct !DILexicalBlock(scope: !98, file: !3, line: 4, column: 1)
!102 = !DILocation(line: 4, column: 1, scope: !103)
!103 = distinct !DILexicalBlock(scope: !98, file: !3, line: 4, column: 1)
!104 = !DILocation(line: 4, column: 1, scope: !105)
!105 = distinct !DILexicalBlock(scope: !98, file: !3, line: 4, column: 1)
!106 = distinct !DISubprogram(name: "is_upper", linkageName: "is_upper", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!107 = !DILocation(line: 4, column: 1, scope: !106)
!108 = !DILocation(line: 4, column: 1, scope: !109)
!109 = distinct !DILexicalBlock(scope: !106, file: !3, line: 4, column: 1)
!110 = !DILocation(line: 4, column: 1, scope: !111)
!111 = distinct !DILexicalBlock(scope: !106, file: !3, line: 4, column: 1)
!112 = distinct !DISubprogram(name: "is_lower", linkageName: "is_lower", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!113 = !DILocation(line: 4, column: 1, scope: !112)
!114 = !DILocation(line: 4, column: 1, scope: !115)
!115 = distinct !DILexicalBlock(scope: !112, file: !3, line: 4, column: 1)
!116 = !DILocation(line: 4, column: 1, scope: !117)
!117 = distinct !DILexicalBlock(scope: !112, file: !3, line: 4, column: 1)
!118 = distinct !DISubprogram(name: "is_xdigit", linkageName: "is_xdigit", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!119 = !DILocation(line: 4, column: 1, scope: !118)
!120 = !DILocation(line: 4, column: 1, scope: !121)
!121 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!122 = !DILocation(line: 4, column: 1, scope: !123)
!123 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!124 = !DILocation(line: 4, column: 1, scope: !125)
!125 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!126 = !DILocation(line: 4, column: 1, scope: !127)
!127 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!128 = !DILocation(line: 4, column: 1, scope: !129)
!129 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!130 = !DILocation(line: 4, column: 1, scope: !131)
!131 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!132 = !DILocation(line: 4, column: 1, scope: !133)
!133 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!134 = !DILocation(line: 4, column: 1, scope: !135)
!135 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!136 = !DILocation(line: 4, column: 1, scope: !137)
!137 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!138 = !DILocation(line: 4, column: 1, scope: !139)
!139 = distinct !DILexicalBlock(scope: !118, file: !3, line: 4, column: 1)
!140 = distinct !DISubprogram(name: "is_print", linkageName: "is_print", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!141 = !DILocation(line: 4, column: 1, scope: !140)
!142 = !DILocation(line: 4, column: 1, scope: !143)
!143 = distinct !DILexicalBlock(scope: !140, file: !3, line: 4, column: 1)
!144 = !DILocation(line: 4, column: 1, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !3, line: 4, column: 1)
!146 = distinct !DISubprogram(name: "to_lower", linkageName: "to_lower", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!147 = !DILocation(line: 4, column: 1, scope: !146)
!148 = !DILocation(line: 4, column: 1, scope: !149)
!149 = distinct !DILexicalBlock(scope: !146, file: !3, line: 4, column: 1)
!150 = !DILocation(line: 4, column: 1, scope: !151)
!151 = distinct !DILexicalBlock(scope: !146, file: !3, line: 4, column: 1)
!152 = !DILocation(line: 4, column: 1, scope: !153)
!153 = distinct !DILexicalBlock(scope: !146, file: !3, line: 4, column: 1)
!154 = !DILocation(line: 4, column: 1, scope: !155)
!155 = distinct !DILexicalBlock(scope: !146, file: !3, line: 4, column: 1)
!156 = distinct !DISubprogram(name: "to_upper", linkageName: "to_upper", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!157 = !DILocation(line: 4, column: 1, scope: !156)
!158 = !DILocation(line: 4, column: 1, scope: !159)
!159 = distinct !DILexicalBlock(scope: !156, file: !3, line: 4, column: 1)
!160 = !DILocation(line: 4, column: 1, scope: !161)
!161 = distinct !DILexicalBlock(scope: !156, file: !3, line: 4, column: 1)
!162 = !DILocation(line: 4, column: 1, scope: !163)
!163 = distinct !DILexicalBlock(scope: !156, file: !3, line: 4, column: 1)
!164 = !DILocation(line: 4, column: 1, scope: !165)
!165 = distinct !DILexicalBlock(scope: !156, file: !3, line: 4, column: 1)
!166 = distinct !DISubprogram(name: "string_to_int", linkageName: "string_to_int", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!167 = !DILocation(line: 4, column: 1, scope: !166)
!168 = !DILocation(line: 4, column: 1, scope: !169)
!169 = distinct !DILexicalBlock(scope: !166, file: !3, line: 4, column: 1)
!170 = distinct !DISubprogram(name: "lines", linkageName: "lines", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!171 = !DILocation(line: 4, column: 1, scope: !170)
!172 = distinct !DISubprogram(name: "parse", linkageName: "parse", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!173 = !DILocation(line: 4, column: 1, scope: !172)
!174 = !DILocation(line: 4, column: 1, scope: !175)
!175 = distinct !DILexicalBlock(scope: !172, file: !3, line: 4, column: 1)
!176 = distinct !DISubprogram(name: "abs64", linkageName: "abs64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!177 = !DILocation(line: 4, column: 1, scope: !176)
!178 = !DILocation(line: 4, column: 1, scope: !179)
!179 = distinct !DILexicalBlock(scope: !176, file: !3, line: 4, column: 1)
!180 = !DILocation(line: 4, column: 1, scope: !181)
!181 = distinct !DILexicalBlock(scope: !176, file: !3, line: 4, column: 1)
!182 = !DILocation(line: 4, column: 1, scope: !183)
!183 = distinct !DILexicalBlock(scope: !176, file: !3, line: 4, column: 1)
!184 = distinct !DISubprogram(name: "min64", linkageName: "min64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!185 = !DILocation(line: 4, column: 1, scope: !184)
!186 = !DILocation(line: 4, column: 1, scope: !187)
!187 = distinct !DILexicalBlock(scope: !184, file: !3, line: 4, column: 1)
!188 = !DILocation(line: 4, column: 1, scope: !189)
!189 = distinct !DILexicalBlock(scope: !184, file: !3, line: 4, column: 1)
!190 = !DILocation(line: 4, column: 1, scope: !191)
!191 = distinct !DILexicalBlock(scope: !184, file: !3, line: 4, column: 1)
!192 = distinct !DISubprogram(name: "max64", linkageName: "max64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!193 = !DILocation(line: 4, column: 1, scope: !192)
!194 = !DILocation(line: 4, column: 1, scope: !195)
!195 = distinct !DILexicalBlock(scope: !192, file: !3, line: 4, column: 1)
!196 = !DILocation(line: 4, column: 1, scope: !197)
!197 = distinct !DILexicalBlock(scope: !192, file: !3, line: 4, column: 1)
!198 = !DILocation(line: 4, column: 1, scope: !199)
!199 = distinct !DILexicalBlock(scope: !192, file: !3, line: 4, column: 1)
!200 = distinct !DISubprogram(name: "sqrt_f32", linkageName: "sqrt_f32", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!201 = !DILocation(line: 4, column: 1, scope: !200)
!202 = !DILocation(line: 4, column: 1, scope: !203)
!203 = distinct !DILexicalBlock(scope: !200, file: !3, line: 4, column: 1)
!204 = distinct !DISubprogram(name: "sqrt_f64", linkageName: "sqrt_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!205 = !DILocation(line: 4, column: 1, scope: !204)
!206 = !DILocation(line: 4, column: 1, scope: !207)
!207 = distinct !DILexicalBlock(scope: !204, file: !3, line: 4, column: 1)
!208 = distinct !DISubprogram(name: "pow_f64", linkageName: "pow_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!209 = !DILocation(line: 4, column: 1, scope: !208)
!210 = !DILocation(line: 4, column: 1, scope: !211)
!211 = distinct !DILexicalBlock(scope: !208, file: !3, line: 4, column: 1)
!212 = distinct !DISubprogram(name: "floor_f64", linkageName: "floor_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!213 = !DILocation(line: 4, column: 1, scope: !212)
!214 = !DILocation(line: 4, column: 1, scope: !215)
!215 = distinct !DILexicalBlock(scope: !212, file: !3, line: 4, column: 1)
!216 = distinct !DISubprogram(name: "ceil_f64", linkageName: "ceil_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!217 = !DILocation(line: 4, column: 1, scope: !216)
!218 = !DILocation(line: 4, column: 1, scope: !219)
!219 = distinct !DILexicalBlock(scope: !216, file: !3, line: 4, column: 1)
!220 = distinct !DISubprogram(name: "round_f64", linkageName: "round_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!221 = !DILocation(line: 4, column: 1, scope: !220)
!222 = !DILocation(line: 4, column: 1, scope: !223)
!223 = distinct !DILexicalBlock(scope: !220, file: !3, line: 4, column: 1)
!224 = distinct !DISubprogram(name: "sin_f64", linkageName: "sin_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!225 = !DILocation(line: 4, column: 1, scope: !224)
!226 = !DILocation(line: 4, column: 1, scope: !227)
!227 = distinct !DILexicalBlock(scope: !224, file: !3, line: 4, column: 1)
!228 = distinct !DISubprogram(name: "cos_f64", linkageName: "cos_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!229 = !DILocation(line: 4, column: 1, scope: !228)
!230 = !DILocation(line: 4, column: 1, scope: !231)
!231 = distinct !DILexicalBlock(scope: !228, file: !3, line: 4, column: 1)
!232 = distinct !DISubprogram(name: "tan_f64", linkageName: "tan_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!233 = !DILocation(line: 4, column: 1, scope: !232)
!234 = !DILocation(line: 4, column: 1, scope: !235)
!235 = distinct !DILexicalBlock(scope: !232, file: !3, line: 4, column: 1)
!236 = distinct !DISubprogram(name: "log_f64", linkageName: "log_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!237 = !DILocation(line: 4, column: 1, scope: !236)
!238 = !DILocation(line: 4, column: 1, scope: !239)
!239 = distinct !DILexicalBlock(scope: !236, file: !3, line: 4, column: 1)
!240 = distinct !DISubprogram(name: "log10_f64", linkageName: "log10_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!241 = !DILocation(line: 4, column: 1, scope: !240)
!242 = !DILocation(line: 4, column: 1, scope: !243)
!243 = distinct !DILexicalBlock(scope: !240, file: !3, line: 4, column: 1)
!244 = distinct !DISubprogram(name: "exp_f64", linkageName: "exp_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!245 = !DILocation(line: 4, column: 1, scope: !244)
!246 = !DILocation(line: 4, column: 1, scope: !247)
!247 = distinct !DILexicalBlock(scope: !244, file: !3, line: 4, column: 1)
!248 = distinct !DISubprogram(name: "fabs_f64", linkageName: "fabs_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!249 = !DILocation(line: 4, column: 1, scope: !248)
!250 = !DILocation(line: 4, column: 1, scope: !251)
!251 = distinct !DILexicalBlock(scope: !248, file: !3, line: 4, column: 1)
!252 = distinct !DISubprogram(name: "fmod_f64", linkageName: "fmod_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!253 = !DILocation(line: 4, column: 1, scope: !252)
!254 = !DILocation(line: 4, column: 1, scope: !255)
!255 = distinct !DILexicalBlock(scope: !252, file: !3, line: 4, column: 1)
!256 = distinct !DISubprogram(name: "asin_f64", linkageName: "asin_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!257 = !DILocation(line: 4, column: 1, scope: !256)
!258 = !DILocation(line: 4, column: 1, scope: !259)
!259 = distinct !DILexicalBlock(scope: !256, file: !3, line: 4, column: 1)
!260 = distinct !DISubprogram(name: "acos_f64", linkageName: "acos_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!261 = !DILocation(line: 4, column: 1, scope: !260)
!262 = !DILocation(line: 4, column: 1, scope: !263)
!263 = distinct !DILexicalBlock(scope: !260, file: !3, line: 4, column: 1)
!264 = distinct !DISubprogram(name: "atan_f64", linkageName: "atan_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!265 = !DILocation(line: 4, column: 1, scope: !264)
!266 = !DILocation(line: 4, column: 1, scope: !267)
!267 = distinct !DILexicalBlock(scope: !264, file: !3, line: 4, column: 1)
!268 = distinct !DISubprogram(name: "atan2_f64", linkageName: "atan2_f64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!269 = !DILocation(line: 4, column: 1, scope: !268)
!270 = !DILocation(line: 4, column: 1, scope: !271)
!271 = distinct !DILexicalBlock(scope: !268, file: !3, line: 4, column: 1)
!272 = distinct !DISubprogram(name: "print", linkageName: "print", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!273 = !DILocation(line: 4, column: 1, scope: !272)
!274 = distinct !DISubprogram(name: "eprint", linkageName: "eprint", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!275 = !DILocation(line: 4, column: 1, scope: !274)
!276 = distinct !DISubprogram(name: "write", linkageName: "write", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!277 = !DILocation(line: 4, column: 1, scope: !276)
!278 = distinct !DISubprogram(name: "ewrite", linkageName: "ewrite", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!279 = !DILocation(line: 4, column: 1, scope: !278)
!280 = distinct !DISubprogram(name: "print_i32", linkageName: "print_i32", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!281 = !DILocation(line: 4, column: 1, scope: !280)
!282 = distinct !DISubprogram(name: "print_i64", linkageName: "print_i64", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!283 = !DILocation(line: 4, column: 1, scope: !282)
!284 = distinct !DISubprogram(name: "print_bool", linkageName: "print_bool", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!285 = !DILocation(line: 4, column: 1, scope: !284)
!286 = distinct !DISubprogram(name: "assert", linkageName: "assert", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!287 = !DILocation(line: 4, column: 1, scope: !286)
!288 = distinct !DISubprogram(name: "require", linkageName: "require", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!289 = !DILocation(line: 4, column: 1, scope: !288)
!290 = distinct !DISubprogram(name: "check", linkageName: "check", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!291 = !DILocation(line: 4, column: 1, scope: !290)
!292 = distinct !DISubprogram(name: "i32.to_string", linkageName: "i32.to_string", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!293 = !DILocation(line: 4, column: 1, scope: !292)
!294 = !DILocation(line: 4, column: 1, scope: !295)
!295 = distinct !DILexicalBlock(scope: !292, file: !3, line: 4, column: 1)
!296 = distinct !DISubprogram(name: "i64.to_string", linkageName: "i64.to_string", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!297 = !DILocation(line: 4, column: 1, scope: !296)
!298 = !DILocation(line: 4, column: 1, scope: !299)
!299 = distinct !DILexicalBlock(scope: !296, file: !3, line: 4, column: 1)
!300 = distinct !DISubprogram(name: "u32.to_string", linkageName: "u32.to_string", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!301 = !DILocation(line: 4, column: 1, scope: !300)
!302 = !DILocation(line: 4, column: 1, scope: !303)
!303 = distinct !DILexicalBlock(scope: !300, file: !3, line: 4, column: 1)
!304 = distinct !DISubprogram(name: "u64.to_string", linkageName: "u64.to_string", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!305 = !DILocation(line: 4, column: 1, scope: !304)
!306 = !DILocation(line: 4, column: 1, scope: !307)
!307 = distinct !DILexicalBlock(scope: !304, file: !3, line: 4, column: 1)
!308 = distinct !DISubprogram(name: "bool.to_string", linkageName: "bool.to_string", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!309 = !DILocation(line: 4, column: 1, scope: !308)
!310 = !DILocation(line: 4, column: 1, scope: !311)
!311 = distinct !DILexicalBlock(scope: !308, file: !3, line: 4, column: 1)
!312 = distinct !DISubprogram(name: "int_to_string", linkageName: "int_to_string", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!313 = !DILocation(line: 4, column: 1, scope: !312)
!314 = !DILocation(line: 4, column: 1, scope: !315)
!315 = distinct !DILexicalBlock(scope: !312, file: !3, line: 4, column: 1)
!316 = distinct !DISubprogram(name: "regex_make_flags", linkageName: "regex_make_flags", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!317 = !DILocation(line: 4, column: 1, scope: !316)
!318 = distinct !DISubprogram(name: "regex_error_message", linkageName: "regex_error_message", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!319 = !DILocation(line: 4, column: 1, scope: !318)
!320 = !DILocation(line: 4, column: 1, scope: !321)
!321 = distinct !DILexicalBlock(scope: !318, file: !3, line: 4, column: 1)
!322 = distinct !DISubprogram(name: "regex_compile_flags", linkageName: "regex_compile_flags", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!323 = !DILocation(line: 4, column: 1, scope: !322)
!324 = !DILocation(line: 4, column: 1, scope: !325)
!325 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!326 = !DILocation(line: 4, column: 1, scope: !327)
!327 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!328 = !DILocation(line: 4, column: 1, scope: !329)
!329 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!330 = !DILocation(line: 4, column: 1, scope: !331)
!331 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!332 = !DILocation(line: 4, column: 1, scope: !333)
!333 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!334 = !DILocation(line: 4, column: 1, scope: !335)
!335 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!336 = !DILocation(line: 4, column: 1, scope: !337)
!337 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!338 = !DILocation(line: 4, column: 1, scope: !339)
!339 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!340 = !DILocation(line: 4, column: 1, scope: !341)
!341 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!342 = !DILocation(line: 4, column: 1, scope: !343)
!343 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!344 = !DILocation(line: 4, column: 1, scope: !345)
!345 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!346 = !DILocation(line: 4, column: 1, scope: !347)
!347 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!348 = !DILocation(line: 4, column: 1, scope: !349)
!349 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!350 = !DILocation(line: 4, column: 1, scope: !351)
!351 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!352 = !DILocation(line: 4, column: 1, scope: !353)
!353 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!354 = !DILocation(line: 4, column: 1, scope: !355)
!355 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!356 = !DILocation(line: 4, column: 1, scope: !357)
!357 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!358 = !DILocation(line: 4, column: 1, scope: !359)
!359 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!360 = !DILocation(line: 4, column: 1, scope: !361)
!361 = distinct !DILexicalBlock(scope: !322, file: !3, line: 4, column: 1)
!362 = distinct !DISubprogram(name: "Regex.clone", linkageName: "Regex.clone", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!363 = !DILocation(line: 4, column: 1, scope: !362)
!364 = !DILocation(line: 4, column: 1, scope: !365)
!365 = distinct !DILexicalBlock(scope: !362, file: !3, line: 4, column: 1)
!366 = !DILocation(line: 4, column: 1, scope: !367)
!367 = distinct !DILexicalBlock(scope: !362, file: !3, line: 4, column: 1)
!368 = distinct !DISubprogram(name: "Regex.drop", linkageName: "Regex.drop", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!369 = !DILocation(line: 4, column: 1, scope: !368)
!370 = !DILocation(line: 4, column: 1, scope: !371)
!371 = distinct !DILexicalBlock(scope: !368, file: !3, line: 4, column: 1)
!372 = distinct !DISubprogram(name: "Regex.is_global", linkageName: "Regex.is_global", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!373 = !DILocation(line: 4, column: 1, scope: !372)
!374 = distinct !DISubprogram(name: "Regex.compile", linkageName: "Regex.compile", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!375 = !DILocation(line: 4, column: 1, scope: !374)
!376 = !DILocation(line: 4, column: 1, scope: !377)
!377 = distinct !DILexicalBlock(scope: !374, file: !3, line: 4, column: 1)
!378 = distinct !DISubprogram(name: "Regex.compile_flags", linkageName: "Regex.compile_flags", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!379 = !DILocation(line: 4, column: 1, scope: !378)
!380 = !DILocation(line: 4, column: 1, scope: !381)
!381 = distinct !DILexicalBlock(scope: !378, file: !3, line: 4, column: 1)
!382 = !DILocation(line: 4, column: 1, scope: !383)
!383 = distinct !DILexicalBlock(scope: !378, file: !3, line: 4, column: 1)
!384 = !DILocation(line: 4, column: 1, scope: !385)
!385 = distinct !DILexicalBlock(scope: !378, file: !3, line: 4, column: 1)
!386 = !DILocation(line: 4, column: 1, scope: !387)
!387 = distinct !DILexicalBlock(scope: !378, file: !3, line: 4, column: 1)
!388 = !DILocation(line: 4, column: 1, scope: !389)
!389 = distinct !DILexicalBlock(scope: !378, file: !3, line: 4, column: 1)
!390 = !DILocation(line: 4, column: 1, scope: !391)
!391 = distinct !DILexicalBlock(scope: !378, file: !3, line: 4, column: 1)
!392 = !DILocation(line: 4, column: 1, scope: !393)
!393 = distinct !DILexicalBlock(scope: !378, file: !3, line: 4, column: 1)
!394 = distinct !DISubprogram(name: "Regex.__literal_code", linkageName: "Regex.__literal_code", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!395 = !DILocation(line: 4, column: 1, scope: !394)
!396 = !DILocation(line: 4, column: 1, scope: !397)
!397 = distinct !DILexicalBlock(scope: !394, file: !3, line: 4, column: 1)
!398 = !DILocation(line: 4, column: 1, scope: !399)
!399 = distinct !DILexicalBlock(scope: !394, file: !3, line: 4, column: 1)
!400 = !DILocation(line: 4, column: 1, scope: !401)
!401 = distinct !DILexicalBlock(scope: !394, file: !3, line: 4, column: 1)
!402 = !DILocation(line: 4, column: 1, scope: !403)
!403 = distinct !DILexicalBlock(scope: !394, file: !3, line: 4, column: 1)
!404 = !DILocation(line: 4, column: 1, scope: !405)
!405 = distinct !DILexicalBlock(scope: !394, file: !3, line: 4, column: 1)
!406 = !DILocation(line: 4, column: 1, scope: !407)
!407 = distinct !DILexicalBlock(scope: !394, file: !3, line: 4, column: 1)
!408 = !DILocation(line: 4, column: 1, scope: !409)
!409 = distinct !DILexicalBlock(scope: !394, file: !3, line: 4, column: 1)
!410 = !DILocation(line: 4, column: 1, scope: !411)
!411 = distinct !DILexicalBlock(scope: !394, file: !3, line: 4, column: 1)
!412 = distinct !DISubprogram(name: "Regex.pattern", linkageName: "Regex.pattern", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!413 = !DILocation(line: 4, column: 1, scope: !412)
!414 = distinct !DISubprogram(name: "Regex.num_captures", linkageName: "Regex.num_captures", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!415 = !DILocation(line: 4, column: 1, scope: !414)
!416 = distinct !DISubprogram(name: "Regex.capture_index", linkageName: "Regex.capture_index", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!417 = !DILocation(line: 4, column: 1, scope: !416)
!418 = !DILocation(line: 4, column: 1, scope: !419)
!419 = distinct !DILexicalBlock(scope: !416, file: !3, line: 4, column: 1)
!420 = !DILocation(line: 4, column: 1, scope: !421)
!421 = distinct !DILexicalBlock(scope: !416, file: !3, line: 4, column: 1)
!422 = !DILocation(line: 4, column: 1, scope: !423)
!423 = distinct !DILexicalBlock(scope: !416, file: !3, line: 4, column: 1)
!424 = distinct !DISubprogram(name: "Regex.capture_names", linkageName: "Regex.capture_names", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!425 = !DILocation(line: 4, column: 1, scope: !424)
!426 = !DILocation(line: 4, column: 1, scope: !427)
!427 = distinct !DILexicalBlock(scope: !424, file: !3, line: 4, column: 1)
!428 = !DILocation(line: 4, column: 1, scope: !429)
!429 = distinct !DILexicalBlock(scope: !424, file: !3, line: 4, column: 1)
!430 = !DILocation(line: 4, column: 1, scope: !431)
!431 = distinct !DILexicalBlock(scope: !424, file: !3, line: 4, column: 1)
!432 = !DILocation(line: 4, column: 1, scope: !433)
!433 = distinct !DILexicalBlock(scope: !424, file: !3, line: 4, column: 1)
!434 = !DILocation(line: 4, column: 1, scope: !435)
!435 = distinct !DILexicalBlock(scope: !424, file: !3, line: 4, column: 1)
!436 = !DILocation(line: 4, column: 1, scope: !437)
!437 = distinct !DILexicalBlock(scope: !424, file: !3, line: 4, column: 1)
!438 = distinct !DISubprogram(name: "Regex.captures", linkageName: "Regex.captures", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!439 = !DILocation(line: 4, column: 1, scope: !438)
!440 = !DILocation(line: 4, column: 1, scope: !441)
!441 = distinct !DILexicalBlock(scope: !438, file: !3, line: 4, column: 1)
!442 = distinct !DISubprogram(name: "Regex.captures_at", linkageName: "Regex.captures_at", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!443 = !DILocation(line: 4, column: 1, scope: !442)
!444 = !DILocation(line: 4, column: 1, scope: !445)
!445 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!446 = !DILocation(line: 4, column: 1, scope: !447)
!447 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!448 = !DILocation(line: 4, column: 1, scope: !449)
!449 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!450 = !DILocation(line: 4, column: 1, scope: !451)
!451 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!452 = !DILocation(line: 4, column: 1, scope: !453)
!453 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!454 = !DILocation(line: 4, column: 1, scope: !455)
!455 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!456 = !DILocation(line: 4, column: 1, scope: !457)
!457 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!458 = !DILocation(line: 4, column: 1, scope: !459)
!459 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!460 = !DILocation(line: 4, column: 1, scope: !461)
!461 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!462 = !DILocation(line: 4, column: 1, scope: !463)
!463 = distinct !DILexicalBlock(scope: !442, file: !3, line: 4, column: 1)
!464 = distinct !DISubprogram(name: "Regex.is_match", linkageName: "Regex.is_match", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!465 = !DILocation(line: 4, column: 1, scope: !464)
!466 = !DILocation(line: 4, column: 1, scope: !467)
!467 = distinct !DILexicalBlock(scope: !464, file: !3, line: 4, column: 1)
!468 = distinct !DISubprogram(name: "Regex.captures_match_op", linkageName: "Regex.captures_match_op", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!469 = !DILocation(line: 4, column: 1, scope: !468)
!470 = !DILocation(line: 4, column: 1, scope: !471)
!471 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!472 = !DILocation(line: 4, column: 1, scope: !473)
!473 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!474 = !DILocation(line: 4, column: 1, scope: !475)
!475 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!476 = !DILocation(line: 4, column: 1, scope: !477)
!477 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!478 = !DILocation(line: 4, column: 1, scope: !479)
!479 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!480 = !DILocation(line: 4, column: 1, scope: !481)
!481 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!482 = !DILocation(line: 4, column: 1, scope: !483)
!483 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!484 = !DILocation(line: 4, column: 1, scope: !485)
!485 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!486 = !DILocation(line: 4, column: 1, scope: !487)
!487 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!488 = !DILocation(line: 4, column: 1, scope: !489)
!489 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!490 = !DILocation(line: 4, column: 1, scope: !491)
!491 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!492 = !DILocation(line: 4, column: 1, scope: !493)
!493 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!494 = !DILocation(line: 4, column: 1, scope: !495)
!495 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!496 = !DILocation(line: 4, column: 1, scope: !497)
!497 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!498 = !DILocation(line: 4, column: 1, scope: !499)
!499 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!500 = !DILocation(line: 4, column: 1, scope: !501)
!501 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!502 = !DILocation(line: 4, column: 1, scope: !503)
!503 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!504 = !DILocation(line: 4, column: 1, scope: !505)
!505 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!506 = !DILocation(line: 4, column: 1, scope: !507)
!507 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!508 = !DILocation(line: 4, column: 1, scope: !509)
!509 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!510 = !DILocation(line: 4, column: 1, scope: !511)
!511 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!512 = !DILocation(line: 4, column: 1, scope: !513)
!513 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!514 = !DILocation(line: 4, column: 1, scope: !515)
!515 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!516 = !DILocation(line: 4, column: 1, scope: !517)
!517 = distinct !DILexicalBlock(scope: !468, file: !3, line: 4, column: 1)
!518 = distinct !DISubprogram(name: "Regex.find", linkageName: "Regex.find", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!519 = !DILocation(line: 4, column: 1, scope: !518)
!520 = !DILocation(line: 4, column: 1, scope: !521)
!521 = distinct !DILexicalBlock(scope: !518, file: !3, line: 4, column: 1)
!522 = distinct !DISubprogram(name: "Regex.find_at", linkageName: "Regex.find_at", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!523 = !DILocation(line: 4, column: 1, scope: !522)
!524 = !DILocation(line: 4, column: 1, scope: !525)
!525 = distinct !DILexicalBlock(scope: !522, file: !3, line: 4, column: 1)
!526 = !DILocation(line: 4, column: 1, scope: !527)
!527 = distinct !DILexicalBlock(scope: !522, file: !3, line: 4, column: 1)
!528 = !DILocation(line: 4, column: 1, scope: !529)
!529 = distinct !DILexicalBlock(scope: !522, file: !3, line: 4, column: 1)
!530 = !DILocation(line: 4, column: 1, scope: !531)
!531 = distinct !DILexicalBlock(scope: !522, file: !3, line: 4, column: 1)
!532 = distinct !DISubprogram(name: "Regex.find_all", linkageName: "Regex.find_all", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!533 = !DILocation(line: 4, column: 1, scope: !532)
!534 = !DILocation(line: 4, column: 1, scope: !535)
!535 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!536 = !DILocation(line: 4, column: 1, scope: !537)
!537 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!538 = !DILocation(line: 4, column: 1, scope: !539)
!539 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!540 = !DILocation(line: 4, column: 1, scope: !541)
!541 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!542 = !DILocation(line: 4, column: 1, scope: !543)
!543 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!544 = !DILocation(line: 4, column: 1, scope: !545)
!545 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!546 = !DILocation(line: 4, column: 1, scope: !547)
!547 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!548 = !DILocation(line: 4, column: 1, scope: !549)
!549 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!550 = !DILocation(line: 4, column: 1, scope: !551)
!551 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!552 = !DILocation(line: 4, column: 1, scope: !553)
!553 = distinct !DILexicalBlock(scope: !532, file: !3, line: 4, column: 1)
!554 = distinct !DISubprogram(name: "Regex.captures_all", linkageName: "Regex.captures_all", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!555 = !DILocation(line: 4, column: 1, scope: !554)
!556 = !DILocation(line: 4, column: 1, scope: !557)
!557 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!558 = !DILocation(line: 4, column: 1, scope: !559)
!559 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!560 = !DILocation(line: 4, column: 1, scope: !561)
!561 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!562 = !DILocation(line: 4, column: 1, scope: !563)
!563 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!564 = !DILocation(line: 4, column: 1, scope: !565)
!565 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!566 = !DILocation(line: 4, column: 1, scope: !567)
!567 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!568 = !DILocation(line: 4, column: 1, scope: !569)
!569 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!570 = !DILocation(line: 4, column: 1, scope: !571)
!571 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!572 = !DILocation(line: 4, column: 1, scope: !573)
!573 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!574 = !DILocation(line: 4, column: 1, scope: !575)
!575 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!576 = !DILocation(line: 4, column: 1, scope: !577)
!577 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!578 = !DILocation(line: 4, column: 1, scope: !579)
!579 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!580 = !DILocation(line: 4, column: 1, scope: !581)
!581 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!582 = !DILocation(line: 4, column: 1, scope: !583)
!583 = distinct !DILexicalBlock(scope: !554, file: !3, line: 4, column: 1)
!584 = distinct !DISubprogram(name: "regex_expand_numbered_capture", linkageName: "regex_expand_numbered_capture", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!585 = !DILocation(line: 4, column: 1, scope: !584)
!586 = !DILocation(line: 4, column: 1, scope: !587)
!587 = distinct !DILexicalBlock(scope: !584, file: !3, line: 4, column: 1)
!588 = !DILocation(line: 4, column: 1, scope: !589)
!589 = distinct !DILexicalBlock(scope: !584, file: !3, line: 4, column: 1)
!590 = !DILocation(line: 4, column: 1, scope: !591)
!591 = distinct !DILexicalBlock(scope: !584, file: !3, line: 4, column: 1)
!592 = !DILocation(line: 4, column: 1, scope: !593)
!593 = distinct !DILexicalBlock(scope: !584, file: !3, line: 4, column: 1)
!594 = !DILocation(line: 4, column: 1, scope: !595)
!595 = distinct !DILexicalBlock(scope: !584, file: !3, line: 4, column: 1)
!596 = !DILocation(line: 4, column: 1, scope: !597)
!597 = distinct !DILexicalBlock(scope: !584, file: !3, line: 4, column: 1)
!598 = !DILocation(line: 4, column: 1, scope: !599)
!599 = distinct !DILexicalBlock(scope: !584, file: !3, line: 4, column: 1)
!600 = distinct !DISubprogram(name: "regex_is_name_start", linkageName: "regex_is_name_start", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!601 = !DILocation(line: 4, column: 1, scope: !600)
!602 = !DILocation(line: 4, column: 1, scope: !603)
!603 = distinct !DILexicalBlock(scope: !600, file: !3, line: 4, column: 1)
!604 = !DILocation(line: 4, column: 1, scope: !605)
!605 = distinct !DILexicalBlock(scope: !600, file: !3, line: 4, column: 1)
!606 = !DILocation(line: 4, column: 1, scope: !607)
!607 = distinct !DILexicalBlock(scope: !600, file: !3, line: 4, column: 1)
!608 = !DILocation(line: 4, column: 1, scope: !609)
!609 = distinct !DILexicalBlock(scope: !600, file: !3, line: 4, column: 1)
!610 = !DILocation(line: 4, column: 1, scope: !611)
!611 = distinct !DILexicalBlock(scope: !600, file: !3, line: 4, column: 1)
!612 = !DILocation(line: 4, column: 1, scope: !613)
!613 = distinct !DILexicalBlock(scope: !600, file: !3, line: 4, column: 1)
!614 = !DILocation(line: 4, column: 1, scope: !615)
!615 = distinct !DILexicalBlock(scope: !600, file: !3, line: 4, column: 1)
!616 = !DILocation(line: 4, column: 1, scope: !617)
!617 = distinct !DILexicalBlock(scope: !600, file: !3, line: 4, column: 1)
!618 = distinct !DISubprogram(name: "regex_is_name_continue", linkageName: "regex_is_name_continue", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!619 = !DILocation(line: 4, column: 1, scope: !618)
!620 = !DILocation(line: 4, column: 1, scope: !621)
!621 = distinct !DILexicalBlock(scope: !618, file: !3, line: 4, column: 1)
!622 = !DILocation(line: 4, column: 1, scope: !623)
!623 = distinct !DILexicalBlock(scope: !618, file: !3, line: 4, column: 1)
!624 = !DILocation(line: 4, column: 1, scope: !625)
!625 = distinct !DILexicalBlock(scope: !618, file: !3, line: 4, column: 1)
!626 = !DILocation(line: 4, column: 1, scope: !627)
!627 = distinct !DILexicalBlock(scope: !618, file: !3, line: 4, column: 1)
!628 = !DILocation(line: 4, column: 1, scope: !629)
!629 = distinct !DILexicalBlock(scope: !618, file: !3, line: 4, column: 1)
!630 = distinct !DISubprogram(name: "regex_expand_replacement", linkageName: "regex_expand_replacement", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!631 = !DILocation(line: 4, column: 1, scope: !630)
!632 = !DILocation(line: 4, column: 1, scope: !633)
!633 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!634 = !DILocation(line: 4, column: 1, scope: !635)
!635 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!636 = !DILocation(line: 4, column: 1, scope: !637)
!637 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!638 = !DILocation(line: 4, column: 1, scope: !639)
!639 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!640 = !DILocation(line: 4, column: 1, scope: !641)
!641 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!642 = !DILocation(line: 4, column: 1, scope: !643)
!643 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!644 = !DILocation(line: 4, column: 1, scope: !645)
!645 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!646 = !DILocation(line: 4, column: 1, scope: !647)
!647 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!648 = !DILocation(line: 4, column: 1, scope: !649)
!649 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!650 = !DILocation(line: 4, column: 1, scope: !651)
!651 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!652 = !DILocation(line: 4, column: 1, scope: !653)
!653 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!654 = !DILocation(line: 4, column: 1, scope: !655)
!655 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!656 = !DILocation(line: 4, column: 1, scope: !657)
!657 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!658 = !DILocation(line: 4, column: 1, scope: !659)
!659 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!660 = !DILocation(line: 4, column: 1, scope: !661)
!661 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!662 = !DILocation(line: 4, column: 1, scope: !663)
!663 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!664 = !DILocation(line: 4, column: 1, scope: !665)
!665 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!666 = !DILocation(line: 4, column: 1, scope: !667)
!667 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!668 = !DILocation(line: 4, column: 1, scope: !669)
!669 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!670 = !DILocation(line: 4, column: 1, scope: !671)
!671 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!672 = !DILocation(line: 4, column: 1, scope: !673)
!673 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!674 = !DILocation(line: 4, column: 1, scope: !675)
!675 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!676 = !DILocation(line: 4, column: 1, scope: !677)
!677 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!678 = !DILocation(line: 4, column: 1, scope: !679)
!679 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!680 = !DILocation(line: 4, column: 1, scope: !681)
!681 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!682 = !DILocation(line: 4, column: 1, scope: !683)
!683 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!684 = !DILocation(line: 4, column: 1, scope: !685)
!685 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!686 = !DILocation(line: 4, column: 1, scope: !687)
!687 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!688 = !DILocation(line: 4, column: 1, scope: !689)
!689 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!690 = !DILocation(line: 4, column: 1, scope: !691)
!691 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!692 = !DILocation(line: 4, column: 1, scope: !693)
!693 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!694 = !DILocation(line: 4, column: 1, scope: !695)
!695 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!696 = !DILocation(line: 4, column: 1, scope: !697)
!697 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!698 = !DILocation(line: 4, column: 1, scope: !699)
!699 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!700 = !DILocation(line: 4, column: 1, scope: !701)
!701 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!702 = !DILocation(line: 4, column: 1, scope: !703)
!703 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!704 = !DILocation(line: 4, column: 1, scope: !705)
!705 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!706 = !DILocation(line: 4, column: 1, scope: !707)
!707 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!708 = !DILocation(line: 4, column: 1, scope: !709)
!709 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!710 = !DILocation(line: 4, column: 1, scope: !711)
!711 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!712 = !DILocation(line: 4, column: 1, scope: !713)
!713 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!714 = !DILocation(line: 4, column: 1, scope: !715)
!715 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!716 = !DILocation(line: 4, column: 1, scope: !717)
!717 = distinct !DILexicalBlock(scope: !630, file: !3, line: 4, column: 1)
!718 = distinct !DISubprogram(name: "Regex.replace_impl", linkageName: "Regex.replace_impl", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!719 = !DILocation(line: 4, column: 1, scope: !718)
!720 = !DILocation(line: 4, column: 1, scope: !721)
!721 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!722 = !DILocation(line: 4, column: 1, scope: !723)
!723 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!724 = !DILocation(line: 4, column: 1, scope: !725)
!725 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!726 = !DILocation(line: 4, column: 1, scope: !727)
!727 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!728 = !DILocation(line: 4, column: 1, scope: !729)
!729 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!730 = !DILocation(line: 4, column: 1, scope: !731)
!731 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!732 = !DILocation(line: 4, column: 1, scope: !733)
!733 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!734 = !DILocation(line: 4, column: 1, scope: !735)
!735 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!736 = !DILocation(line: 4, column: 1, scope: !737)
!737 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!738 = !DILocation(line: 4, column: 1, scope: !739)
!739 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!740 = !DILocation(line: 4, column: 1, scope: !741)
!741 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!742 = !DILocation(line: 4, column: 1, scope: !743)
!743 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!744 = !DILocation(line: 4, column: 1, scope: !745)
!745 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!746 = !DILocation(line: 4, column: 1, scope: !747)
!747 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!748 = !DILocation(line: 4, column: 1, scope: !749)
!749 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!750 = !DILocation(line: 4, column: 1, scope: !751)
!751 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!752 = !DILocation(line: 4, column: 1, scope: !753)
!753 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!754 = !DILocation(line: 4, column: 1, scope: !755)
!755 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!756 = !DILocation(line: 4, column: 1, scope: !757)
!757 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!758 = !DILocation(line: 4, column: 1, scope: !759)
!759 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!760 = !DILocation(line: 4, column: 1, scope: !761)
!761 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!762 = !DILocation(line: 4, column: 1, scope: !763)
!763 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!764 = !DILocation(line: 4, column: 1, scope: !765)
!765 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!766 = !DILocation(line: 4, column: 1, scope: !767)
!767 = distinct !DILexicalBlock(scope: !718, file: !3, line: 4, column: 1)
!768 = distinct !DISubprogram(name: "Regex.replace", linkageName: "Regex.replace", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!769 = !DILocation(line: 4, column: 1, scope: !768)
!770 = !DILocation(line: 4, column: 1, scope: !771)
!771 = distinct !DILexicalBlock(scope: !768, file: !3, line: 4, column: 1)
!772 = !DILocation(line: 4, column: 1, scope: !773)
!773 = distinct !DILexicalBlock(scope: !768, file: !3, line: 4, column: 1)
!774 = !DILocation(line: 4, column: 1, scope: !775)
!775 = distinct !DILexicalBlock(scope: !768, file: !3, line: 4, column: 1)
!776 = distinct !DISubprogram(name: "Regex.replace_all", linkageName: "Regex.replace_all", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!777 = !DILocation(line: 4, column: 1, scope: !776)
!778 = !DILocation(line: 4, column: 1, scope: !779)
!779 = distinct !DILexicalBlock(scope: !776, file: !3, line: 4, column: 1)
!780 = distinct !DISubprogram(name: "Regex.replace_fn", linkageName: "Regex.replace_fn", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!781 = !DILocation(line: 4, column: 1, scope: !780)
!782 = !DILocation(line: 4, column: 1, scope: !783)
!783 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!784 = !DILocation(line: 4, column: 1, scope: !785)
!785 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!786 = !DILocation(line: 4, column: 1, scope: !787)
!787 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!788 = !DILocation(line: 4, column: 1, scope: !789)
!789 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!790 = !DILocation(line: 4, column: 1, scope: !791)
!791 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!792 = !DILocation(line: 4, column: 1, scope: !793)
!793 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!794 = !DILocation(line: 4, column: 1, scope: !795)
!795 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!796 = !DILocation(line: 4, column: 1, scope: !797)
!797 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!798 = !DILocation(line: 4, column: 1, scope: !799)
!799 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!800 = !DILocation(line: 4, column: 1, scope: !801)
!801 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!802 = !DILocation(line: 4, column: 1, scope: !803)
!803 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!804 = !DILocation(line: 4, column: 1, scope: !805)
!805 = distinct !DILexicalBlock(scope: !780, file: !3, line: 4, column: 1)
!806 = distinct !DISubprogram(name: "Regex.replace_all_fn", linkageName: "Regex.replace_all_fn", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!807 = !DILocation(line: 4, column: 1, scope: !806)
!808 = !DILocation(line: 4, column: 1, scope: !809)
!809 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!810 = !DILocation(line: 4, column: 1, scope: !811)
!811 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!812 = !DILocation(line: 4, column: 1, scope: !813)
!813 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!814 = !DILocation(line: 4, column: 1, scope: !815)
!815 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!816 = !DILocation(line: 4, column: 1, scope: !817)
!817 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!818 = !DILocation(line: 4, column: 1, scope: !819)
!819 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!820 = !DILocation(line: 4, column: 1, scope: !821)
!821 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!822 = !DILocation(line: 4, column: 1, scope: !823)
!823 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!824 = !DILocation(line: 4, column: 1, scope: !825)
!825 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!826 = !DILocation(line: 4, column: 1, scope: !827)
!827 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!828 = !DILocation(line: 4, column: 1, scope: !829)
!829 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!830 = !DILocation(line: 4, column: 1, scope: !831)
!831 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!832 = !DILocation(line: 4, column: 1, scope: !833)
!833 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!834 = !DILocation(line: 4, column: 1, scope: !835)
!835 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!836 = !DILocation(line: 4, column: 1, scope: !837)
!837 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!838 = !DILocation(line: 4, column: 1, scope: !839)
!839 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!840 = !DILocation(line: 4, column: 1, scope: !841)
!841 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!842 = !DILocation(line: 4, column: 1, scope: !843)
!843 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!844 = !DILocation(line: 4, column: 1, scope: !845)
!845 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!846 = !DILocation(line: 4, column: 1, scope: !847)
!847 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!848 = !DILocation(line: 4, column: 1, scope: !849)
!849 = distinct !DILexicalBlock(scope: !806, file: !3, line: 4, column: 1)
!850 = distinct !DISubprogram(name: "Regex.split", linkageName: "Regex.split", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!851 = !DILocation(line: 4, column: 1, scope: !850)
!852 = !DILocation(line: 4, column: 1, scope: !853)
!853 = distinct !DILexicalBlock(scope: !850, file: !3, line: 4, column: 1)
!854 = distinct !DISubprogram(name: "Regex.splitn", linkageName: "Regex.splitn", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!855 = !DILocation(line: 4, column: 1, scope: !854)
!856 = !DILocation(line: 4, column: 1, scope: !857)
!857 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!858 = !DILocation(line: 4, column: 1, scope: !859)
!859 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!860 = !DILocation(line: 4, column: 1, scope: !861)
!861 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!862 = !DILocation(line: 4, column: 1, scope: !863)
!863 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!864 = !DILocation(line: 4, column: 1, scope: !865)
!865 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!866 = !DILocation(line: 4, column: 1, scope: !867)
!867 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!868 = !DILocation(line: 4, column: 1, scope: !869)
!869 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!870 = !DILocation(line: 4, column: 1, scope: !871)
!871 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!872 = !DILocation(line: 4, column: 1, scope: !873)
!873 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!874 = !DILocation(line: 4, column: 1, scope: !875)
!875 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!876 = !DILocation(line: 4, column: 1, scope: !877)
!877 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!878 = !DILocation(line: 4, column: 1, scope: !879)
!879 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!880 = !DILocation(line: 4, column: 1, scope: !881)
!881 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!882 = !DILocation(line: 4, column: 1, scope: !883)
!883 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!884 = !DILocation(line: 4, column: 1, scope: !885)
!885 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!886 = !DILocation(line: 4, column: 1, scope: !887)
!887 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!888 = !DILocation(line: 4, column: 1, scope: !889)
!889 = distinct !DILexicalBlock(scope: !854, file: !3, line: 4, column: 1)
!890 = distinct !DISubprogram(name: "Captures.get", linkageName: "Captures.get", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!891 = !DILocation(line: 4, column: 1, scope: !890)
!892 = !DILocation(line: 4, column: 1, scope: !893)
!893 = distinct !DILexicalBlock(scope: !890, file: !3, line: 4, column: 1)
!894 = !DILocation(line: 4, column: 1, scope: !895)
!895 = distinct !DILexicalBlock(scope: !890, file: !3, line: 4, column: 1)
!896 = !DILocation(line: 4, column: 1, scope: !897)
!897 = distinct !DILexicalBlock(scope: !890, file: !3, line: 4, column: 1)
!898 = !DILocation(line: 4, column: 1, scope: !899)
!899 = distinct !DILexicalBlock(scope: !890, file: !3, line: 4, column: 1)
!900 = !DILocation(line: 4, column: 1, scope: !901)
!901 = distinct !DILexicalBlock(scope: !890, file: !3, line: 4, column: 1)
!902 = !DILocation(line: 4, column: 1, scope: !903)
!903 = distinct !DILexicalBlock(scope: !890, file: !3, line: 4, column: 1)
!904 = !DILocation(line: 4, column: 1, scope: !905)
!905 = distinct !DILexicalBlock(scope: !890, file: !3, line: 4, column: 1)
!906 = !DILocation(line: 4, column: 1, scope: !907)
!907 = distinct !DILexicalBlock(scope: !890, file: !3, line: 4, column: 1)
!908 = distinct !DISubprogram(name: "Captures.len", linkageName: "Captures.len", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!909 = !DILocation(line: 4, column: 1, scope: !908)
!910 = !DILocation(line: 4, column: 1, scope: !911)
!911 = distinct !DILexicalBlock(scope: !908, file: !3, line: 4, column: 1)
!912 = distinct !DISubprogram(name: "Captures.by_name", linkageName: "Captures.by_name", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!913 = !DILocation(line: 4, column: 1, scope: !912)
!914 = !DILocation(line: 4, column: 1, scope: !915)
!915 = distinct !DILexicalBlock(scope: !912, file: !3, line: 4, column: 1)
!916 = !DILocation(line: 4, column: 1, scope: !917)
!917 = distinct !DILexicalBlock(scope: !912, file: !3, line: 4, column: 1)
!918 = !DILocation(line: 4, column: 1, scope: !919)
!919 = distinct !DILexicalBlock(scope: !912, file: !3, line: 4, column: 1)
!920 = distinct !DISubprogram(name: "Captures.name", linkageName: "Captures.name", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!921 = !DILocation(line: 4, column: 1, scope: !920)
!922 = !DILocation(line: 4, column: 1, scope: !923)
!923 = distinct !DILexicalBlock(scope: !920, file: !3, line: 4, column: 1)
!924 = distinct !DISubprogram(name: "Captures.text", linkageName: "Captures.text", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!925 = !DILocation(line: 4, column: 1, scope: !924)
!926 = !DILocation(line: 4, column: 1, scope: !927)
!927 = distinct !DILexicalBlock(scope: !924, file: !3, line: 4, column: 1)
!928 = !DILocation(line: 4, column: 1, scope: !929)
!929 = distinct !DILexicalBlock(scope: !924, file: !3, line: 4, column: 1)
!930 = !DILocation(line: 4, column: 1, scope: !931)
!931 = distinct !DILexicalBlock(scope: !924, file: !3, line: 4, column: 1)
!932 = !DILocation(line: 4, column: 1, scope: !933)
!933 = distinct !DILexicalBlock(scope: !924, file: !3, line: 4, column: 1)
!934 = distinct !DISubprogram(name: "Captures.name_text", linkageName: "Captures.name_text", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!935 = !DILocation(line: 4, column: 1, scope: !934)
!936 = !DILocation(line: 4, column: 1, scope: !937)
!937 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!938 = !DILocation(line: 4, column: 1, scope: !939)
!939 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!940 = !DILocation(line: 4, column: 1, scope: !941)
!941 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!942 = !DILocation(line: 4, column: 1, scope: !943)
!943 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!944 = !DILocation(line: 4, column: 1, scope: !945)
!945 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!946 = !DILocation(line: 4, column: 1, scope: !947)
!947 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!948 = !DILocation(line: 4, column: 1, scope: !949)
!949 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!950 = !DILocation(line: 4, column: 1, scope: !951)
!951 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!952 = !DILocation(line: 4, column: 1, scope: !953)
!953 = distinct !DILexicalBlock(scope: !934, file: !3, line: 4, column: 1)
!954 = distinct !DISubprogram(name: "Regex.capture_text", linkageName: "Regex.capture_text", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!955 = !DILocation(line: 4, column: 1, scope: !954)
!956 = !DILocation(line: 4, column: 1, scope: !957)
!957 = distinct !DILexicalBlock(scope: !954, file: !3, line: 4, column: 1)
!958 = !DILocation(line: 4, column: 1, scope: !959)
!959 = distinct !DILexicalBlock(scope: !954, file: !3, line: 4, column: 1)
!960 = !DILocation(line: 4, column: 1, scope: !961)
!961 = distinct !DILexicalBlock(scope: !954, file: !3, line: 4, column: 1)
!962 = !DILocation(line: 4, column: 1, scope: !963)
!963 = distinct !DILexicalBlock(scope: !954, file: !3, line: 4, column: 1)
!964 = !DILocation(line: 4, column: 1, scope: !965)
!965 = distinct !DILexicalBlock(scope: !954, file: !3, line: 4, column: 1)
!966 = !DILocation(line: 4, column: 1, scope: !967)
!967 = distinct !DILexicalBlock(scope: !954, file: !3, line: 4, column: 1)
!968 = !DILocation(line: 4, column: 1, scope: !969)
!969 = distinct !DILexicalBlock(scope: !954, file: !3, line: 4, column: 1)
!970 = !DILocation(line: 4, column: 1, scope: !971)
!971 = distinct !DILexicalBlock(scope: !954, file: !3, line: 4, column: 1)
!972 = distinct !DISubprogram(name: "Regex.capture_name_text", linkageName: "Regex.capture_name_text", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!973 = !DILocation(line: 4, column: 1, scope: !972)
!974 = !DILocation(line: 4, column: 1, scope: !975)
!975 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!976 = !DILocation(line: 4, column: 1, scope: !977)
!977 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!978 = !DILocation(line: 4, column: 1, scope: !979)
!979 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!980 = !DILocation(line: 4, column: 1, scope: !981)
!981 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!982 = !DILocation(line: 4, column: 1, scope: !983)
!983 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!984 = !DILocation(line: 4, column: 1, scope: !985)
!985 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!986 = !DILocation(line: 4, column: 1, scope: !987)
!987 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!988 = !DILocation(line: 4, column: 1, scope: !989)
!989 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!990 = !DILocation(line: 4, column: 1, scope: !991)
!991 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!992 = !DILocation(line: 4, column: 1, scope: !993)
!993 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!994 = !DILocation(line: 4, column: 1, scope: !995)
!995 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!996 = !DILocation(line: 4, column: 1, scope: !997)
!997 = distinct !DILexicalBlock(scope: !972, file: !3, line: 4, column: 1)
!998 = distinct !DISubprogram(name: "i32.eq", linkageName: "i32.eq", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!999 = !DILocation(line: 4, column: 1, scope: !998)
!1000 = distinct !DISubprogram(name: "bool.eq", linkageName: "bool.eq", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1001 = !DILocation(line: 4, column: 1, scope: !1000)
!1002 = distinct !DISubprogram(name: "i32.default", linkageName: "i32.default", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1003 = !DILocation(line: 4, column: 1, scope: !1002)
!1004 = distinct !DISubprogram(name: "bool.default", linkageName: "bool.default", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1005 = !DILocation(line: 4, column: 1, scope: !1004)
!1006 = distinct !DISubprogram(name: "str.eq", linkageName: "str.eq", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1007 = !DILocation(line: 4, column: 1, scope: !1006)
!1008 = distinct !DISubprogram(name: "i64.eq", linkageName: "i64.eq", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1009 = !DILocation(line: 4, column: 1, scope: !1008)
!1010 = distinct !DISubprogram(name: "i32.debug_str", linkageName: "i32.debug_str", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1011 = !DILocation(line: 4, column: 1, scope: !1010)
!1012 = !DILocation(line: 4, column: 1, scope: !1013)
!1013 = distinct !DILexicalBlock(scope: !1010, file: !3, line: 4, column: 1)
!1014 = distinct !DISubprogram(name: "bool.debug_str", linkageName: "bool.debug_str", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1015 = !DILocation(line: 4, column: 1, scope: !1014)
!1016 = !DILocation(line: 4, column: 1, scope: !1017)
!1017 = distinct !DILexicalBlock(scope: !1014, file: !3, line: 4, column: 1)
!1018 = !DILocation(line: 4, column: 1, scope: !1019)
!1019 = distinct !DILexicalBlock(scope: !1014, file: !3, line: 4, column: 1)
!1020 = !DILocation(line: 4, column: 1, scope: !1021)
!1021 = distinct !DILexicalBlock(scope: !1014, file: !3, line: 4, column: 1)
!1022 = distinct !DISubprogram(name: "str.debug_str", linkageName: "str.debug_str", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1023 = !DILocation(line: 4, column: 1, scope: !1022)
!1024 = distinct !DISubprogram(name: "i32.hash_value", linkageName: "i32.hash_value", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1025 = !DILocation(line: 4, column: 1, scope: !1024)
!1026 = distinct !DISubprogram(name: "i64.hash_value", linkageName: "i64.hash_value", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1027 = !DILocation(line: 4, column: 1, scope: !1026)
!1028 = distinct !DISubprogram(name: "bool.hash_value", linkageName: "bool.hash_value", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1029 = !DILocation(line: 4, column: 1, scope: !1028)
!1030 = !DILocation(line: 4, column: 1, scope: !1031)
!1031 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 4, column: 1)
!1032 = !DILocation(line: 4, column: 1, scope: !1033)
!1033 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 4, column: 1)
!1034 = !DILocation(line: 4, column: 1, scope: !1035)
!1035 = distinct !DILexicalBlock(scope: !1028, file: !3, line: 4, column: 1)
!1036 = distinct !DISubprogram(name: "str.hash_value", linkageName: "str.hash_value", scope: !3, file: !3, line: 4, type: !5, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !2)
!1037 = !DILocation(line: 4, column: 1, scope: !1036)
!1038 = !DILocation(line: 4, column: 1, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !1036, file: !3, line: 4, column: 1)
!1040 = !DILocation(line: 4, column: 1, scope: !1041)
!1041 = distinct !DILexicalBlock(scope: !1036, file: !3, line: 4, column: 1)
!1042 = !DILocation(line: 4, column: 1, scope: !1043)
!1043 = distinct !DILexicalBlock(scope: !1036, file: !3, line: 4, column: 1)
!1044 = distinct !DISubprogram(name: "main", linkageName: "main", scope: !3, file: !3, line: 1, type: !5, scopeLine: 1, spFlags: DISPFlagDefinition, unit: !2)
!1045 = !DILocation(line: 2, column: 15, scope: !1044)
!1046 = !DILocation(line: 3, column: 11, scope: !1044)
