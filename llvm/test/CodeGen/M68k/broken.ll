declare double @_ZN17compiler_builtins4math4libm4sqrt4sqrt17h7154aca851991118E(double %x)
declare i64 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$7to_bits17h01f3ad30ea6b0a45E"(double %x)
declare double @"_ZN4core3f6421_$LT$impl$u20$f64$GT$9from_bits17h5f5b77896340e585E"(i64)
declare void @_ZN4core9panicking11panic_const24panic_const_sub_overflow17h5f47e435bc55ffd4E(ptr align 2 )
declare double @_ZN17compiler_builtins4math4libm4acos1r17hb612c55a432e88daE(double)
@alloc_840ece3cf33f08cbdf710011adfa4e9c = private unnamed_addr constant <{ [118 x i8] }> <{ [118 x i8] c"/home/user/.cargo/registry/src/index.crates.io-6f17d22bba15001f/compiler_builtins-0.1.138/src/../libm/src/math/acos.rs" }>, align 1
@alloc_c3406326b65d623c1a63db26e4c67db0 = private unnamed_addr constant <{ ptr, [12 x i8] }> <{ ptr @alloc_840ece3cf33f08cbdf710011adfa4e9c, [12 x i8] c"\00\00\00v\00\00\00O\00\00\00\0D" }>, align 2

; compiler_builtins::math::libm::acos::acos
; Function Attrs: nounwind
define internal double @_ZN17compiler_builtins4math4libm4acos4acos17h992bdeffd748092eE(double %x) {
start:
  %lx.dbg.spill = alloca [4 x i8], align 2
  %c.dbg.spill = alloca [8 x i8], align 8
  %df.dbg.spill = alloca [8 x i8], align 8
  %ix.dbg.spill = alloca [4 x i8], align 2
  %hx.dbg.spill = alloca [4 x i8], align 2
  %x1p_120f.dbg.spill = alloca [8 x i8], align 8
  %x.dbg.spill = alloca [8 x i8], align 8
  %s = alloca [8 x i8], align 8
  %w = alloca [8 x i8], align 8
  %z = alloca [8 x i8], align 8
  %_0 = alloca [8 x i8], align 8
  store double %x, ptr %x.dbg.spill, align 8
; call core::f64::<impl f64>::from_bits
  %x1p_120f = call double @"_ZN4core3f6421_$LT$impl$u20$f64$GT$9from_bits17h5f5b77896340e585E"(i64 4066750463515557888)
  store double %x1p_120f, ptr %x1p_120f.dbg.spill, align 8
; call core::f64::<impl f64>::to_bits
  %_10 = call i64 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$7to_bits17h01f3ad30ea6b0a45E"(double %x) 
  %_9 = lshr i64 %_10, 32
  %hx = trunc i64 %_9 to i32
  store i32 %hx, ptr %hx.dbg.spill, align 2
  %ix = and i32 %hx, 2147483647
  store i32 %ix, ptr %ix.dbg.spill, align 2
  %_13 = icmp uge i32 %ix, 1072693248
  br i1 %_13, label %bb4, label %bb12

bb12:                                             ; preds = %start
  %_24 = icmp ult i32 %ix, 1071644672
  br i1 %_24, label %bb13, label %bb14

bb4:                                              ; preds = %start
; call core::f64::<impl f64>::to_bits
  %_15 = call i64 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$7to_bits17h01f3ad30ea6b0a45E"(double %x) 
  %lx = trunc i64 %_15 to i32
  store i32 %lx, ptr %lx.dbg.spill, align 2
  %_18.0 = sub i32 %ix, 1072693248
  %_18.1 = icmp ult i32 %ix, 1072693248
  br i1 %_18.1, label %panic, label %bb6

bb14:                                             ; preds = %bb12
  %_31 = lshr i32 %hx, 31
  %0 = icmp eq i32 %_31, 0
  br i1 %0, label %bb22, label %bb19

bb13:                                             ; preds = %bb12
  %_25 = icmp ule i32 %ix, 1012924416
  br i1 %_25, label %bb15, label %bb16

bb22:                                             ; preds = %bb14
  %_45 = fsub double 1.000000e+00, %x
  %1 = fmul double %_45, 5.000000e-01
  store double %1, ptr %z, align 8
  %_47 = load double, ptr %z, align 8
; call compiler_builtins::math::libm::sqrt::sqrt
  %_46 = call double @_ZN17compiler_builtins4math4libm4sqrt4sqrt17h7154aca851991118E(double %_47)
  store double %_46, ptr %s, align 8
  %_51 = load double, ptr %s, align 8
; call core::f64::<impl f64>::to_bits
  %_50 = call i64 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$7to_bits17h01f3ad30ea6b0a45E"(double %_51)
  %_49 = and i64 %_50, -4294967296
; call core::f64::<impl f64>::from_bits
  %df = call double @"_ZN4core3f6421_$LT$impl$u20$f64$GT$9from_bits17h5f5b77896340e585E"(i64 %_49)
  store double %df, ptr %df.dbg.spill, align 8
  %_53 = load double, ptr %z, align 8
  %_54 = fmul double %df, %df
  %_52 = fsub double %_53, %_54
  %_56 = load double, ptr %s, align 8
  %_55 = fadd double %_56, %df
  %c = fdiv double %_52, %_55
  store double %c, ptr %c.dbg.spill, align 8
  %_59 = load double, ptr %z, align 8
; call compiler_builtins::math::libm::acos::r
  %_58 = call double @_ZN17compiler_builtins4math4libm4acos1r17hb612c55a432e88daE(double %_59)
  %_60 = load double, ptr %s, align 8
  %_57 = fmul double %_58, %_60
  %2 = fadd double %_57, %c
  store double %2, ptr %w, align 8
  %_62 = load double, ptr %w, align 8
  %_61 = fadd double %df, %_62
  %3 = fmul double 2.000000e+00, %_61
  store double %3, ptr %_0, align 8
  br label %bb27

bb19:                                             ; preds = %bb14
  %_34 = fadd double 1.000000e+00, %x
  %4 = fmul double %_34, 5.000000e-01
  store double %4, ptr %z, align 8
  %_36 = load double, ptr %z, align 8
; call compiler_builtins::math::libm::sqrt::sqrt
  %_35 = call double @_ZN17compiler_builtins4math4libm4sqrt4sqrt17h7154aca851991118E(double %_36) 
  store double %_35, ptr %s, align 8
  %_39 = load double, ptr %z, align 8
; call compiler_builtins::math::libm::acos::r
  %_38 = call double @_ZN17compiler_builtins4math4libm4acos1r17hb612c55a432e88daE(double %_39) 
  %_40 = load double, ptr %s, align 8
  %_37 = fmul double %_38, %_40
  %5 = fsub double %_37, 0x3C91A62633145C07
  store double %5, ptr %w, align 8
  %_43 = load double, ptr %s, align 8
  %_44 = load double, ptr %w, align 8
  %_42 = fadd double %_43, %_44
  %_41 = fsub double 0x3FF921FB54442D18, %_42
  %6 = fmul double 2.000000e+00, %_41
  store double %6, ptr %_0, align 8
  br label %bb27

bb27:                                             ; preds = %bb11, %bb9, %bb10, %bb15, %bb16, %bb19, %bb22
  %7 = load double, ptr %_0, align 8
  ret double %7

bb16:                                             ; preds = %bb13
  %_30 = fmul double %x, %x
; call compiler_builtins::math::libm::acos::r
  %_29 = call double @_ZN17compiler_builtins4math4libm4acos1r17hb612c55a432e88daE(double %_30) 
  %_28 = fmul double %x, %_29
  %_27 = fsub double 0x3C91A62633145C07, %_28
  %_26 = fsub double %x, %_27
  %8 = fsub double 0x3FF921FB54442D18, %_26
  store double %8, ptr %_0, align 8
  br label %bb27

bb15:                                             ; preds = %bb13
  %9 = fadd double 0x3FF921FB54442D18, %x1p_120f
  store double %9, ptr %_0, align 8
  br label %bb27

bb6:                                              ; preds = %bb4
  %_16 = or i32 %_18.0, %lx
  %10 = icmp eq i32 %_16, 0
  br i1 %10, label %bb7, label %bb11

panic:                                            ; preds = %bb4
; call core::panicking::panic_const::panic_const_sub_overflow
  call void @_ZN4core9panicking11panic_const24panic_const_sub_overflow17h5f47e435bc55ffd4E(ptr align 2 @alloc_c3406326b65d623c1a63db26e4c67db0) #13
  unreachable

bb7:                                              ; preds = %bb6
  %_19 = lshr i32 %hx, 31
  %11 = icmp eq i32 %_19, 0
  br i1 %11, label %bb10, label %bb9

bb11:                                             ; preds = %bb6
  %_23 = fsub double %x, %x
  %12 = fdiv double 0.000000e+00, %_23
  store double %12, ptr %_0, align 8
  br label %bb27

bb10:                                             ; preds = %bb7
  store double 0.000000e+00, ptr %_0, align 8
  br label %bb27

bb9:                                              ; preds = %bb7
  %13 = fadd double 0x400921FB54442D18, %x1p_120f
  store double %13, ptr %_0, align 8
  br label %bb27
}