; ModuleID = '01_hello.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

@.str = private unnamed_addr constant [13 x i8] c"Hello world\0A\00", align 1
@c = common global i32 0, align 4
@.str1 = private unnamed_addr constant [9 x i8] c"n/2: %d\0A\00", align 1

; Function Attrs: nounwind uwtable
define void @print_hello() #0 {
  %1 = call i32 @puts(i8* getelementptr inbounds ([13 x i8]* @.str, i32 0, i32 0))
  ret void
}

declare i32 @puts(i8*) #1

; Function Attrs: nounwind uwtable
define void @print_str_some(i8* %s) #0 {
  %1 = alloca i8*, align 8
  store i8* %s, i8** %1, align 8
  store i32 0, i32* @c, align 4
  br label %2

; <label>:2                                       ; preds = %15, %0
  %3 = load i8** %1, align 8
  %4 = load i8* %3, align 1
  %5 = sext i8 %4 to i32
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %7, label %13

; <label>:7                                       ; preds = %2
  %8 = load i8** %1, align 8
  %9 = getelementptr inbounds i8* %8, i64 1
  %10 = load i8* %9, align 1
  %11 = sext i8 %10 to i32
  %12 = icmp ne i32 %11, 0
  br label %13

; <label>:13                                      ; preds = %7, %2
  %14 = phi i1 [ false, %2 ], [ %12, %7 ]
  br i1 %14, label %15, label %24

; <label>:15                                      ; preds = %13
  %16 = load i8** %1, align 8
  %17 = load i8* %16, align 1
  %18 = sext i8 %17 to i32
  %19 = call i32 @putchar(i32 %18)
  %20 = load i8** %1, align 8
  %21 = getelementptr inbounds i8* %20, i64 2
  store i8* %21, i8** %1, align 8
  %22 = load i32* @c, align 4
  %23 = add nsw i32 %22, 1
  store i32 %23, i32* @c, align 4
  br label %2

; <label>:24                                      ; preds = %13
  ret void
}

declare i32 @putchar(i32) #1

; Function Attrs: nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i8**, align 8
  store i32 0, i32* %1
  store i32 %argc, i32* %2, align 4
  store i8** %argv, i8*** %3, align 8
  %4 = load i32* %2, align 4
  %5 = icmp sle i32 %4, 1
  br i1 %5, label %6, label %7

; <label>:6                                       ; preds = %0
  call void @print_hello()
  br label %11

; <label>:7                                       ; preds = %0
  %8 = load i8*** %3, align 8
  %9 = getelementptr inbounds i8** %8, i64 1
  %10 = load i8** %9, align 8
  call void @print_str_some(i8* %10)
  br label %11

; <label>:11                                      ; preds = %7, %6
  %12 = load i32* @c, align 4
  %13 = call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([9 x i8]* @.str1, i32 0, i32 0), i32 %12)
  ret i32 0
}

declare i32 @printf(i8*, ...) #1

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = metadata !{metadata !"clang version 3.5.0 (tags/RELEASE_350/final)"}
