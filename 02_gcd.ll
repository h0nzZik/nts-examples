; ModuleID = '02_gcd.c'
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-redhat-linux-gnu"

; Function Attrs: nounwind uwtable
define i32 @gcd(i32 %a, i32 %b) #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %d = alloca i32, align 4
  store i32 %a, i32* %1, align 4
  store i32 %b, i32* %2, align 4
  br label %3

; <label>:3                                       ; preds = %9, %0
  %4 = load i32* %1, align 4
  %5 = load i32* %2, align 4
  %6 = urem i32 %4, %5
  store i32 %6, i32* %d, align 4
  %7 = load i32* %2, align 4
  store i32 %7, i32* %1, align 4
  %8 = load i32* %d, align 4
  store i32 %8, i32* %2, align 4
  br label %9

; <label>:9                                       ; preds = %3
  %10 = load i32* %2, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %3, label %12

; <label>:12                                      ; preds = %9
  %13 = load i32* %1, align 4
  ret i32 %13
}

; Function Attrs: nounwind uwtable
define i32 @add(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = add nsw i32 1, %2
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define i32 @addu(i32 %x) #0 {
  %1 = alloca i32, align 4
  store i32 %x, i32* %1, align 4
  %2 = load i32* %1, align 4
  %3 = add i32 1, %2
  ret i32 %3
}

; Function Attrs: nounwind uwtable
define zeroext i1 @neg(i1 zeroext %b) #0 {
  %1 = alloca i8, align 1
  %2 = zext i1 %b to i8
  store i8 %2, i8* %1, align 1
  %3 = load i8* %1, align 1
  %4 = trunc i8 %3 to i1
  %5 = xor i1 %4, true
  ret i1 %5
}

attributes #0 = { nounwind uwtable "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "stack-protector-buffer-size"="8" "unsafe-fp-math"="false" "use-soft-float"="false" }

!llvm.ident = !{!0}

!0 = !{ !"clang version 3.5.0 (tags/RELEASE_350/final)"}
