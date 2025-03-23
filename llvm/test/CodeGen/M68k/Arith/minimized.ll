; RUN: llc < %s -mtriple=m68k-linux | FileCheck %s

define double @_ZN17compiler_builtins4math4libm4acos4acos17h992bdeffd748092eE() {
start:
  %_58 = call double null(double 0.000000e+00)
  %_60 = load double, ptr null, align 8
  %_57 = fmul double 0.000000e+00, %_60
  store double %_57, ptr null, align 8
  ret double 0.000000e+00
}
