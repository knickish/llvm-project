; RUN: llc < %s -mtriple=m68k-linux | FileCheck %s

declare double @test(double)

define double @minimized(ptr %inout) {
start:
  %_58 = call double @test(double 0.000000e+00)
  %_60 = load double, ptr %inout, align 8
  %_57 = fmul double 0.000000e+00, %_60
  store double %_57, ptr %inout, align 8
  ret double 0.000000e+00
}
