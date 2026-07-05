; RUN: llc < %s -mtriple=m68k-linux -verify-machineinstrs | FileCheck %s
; The address of buf + idx must include idx after the bounds check.
; See https://github.com/llvm/llvm-project/issues/200984.

define i8 @gep_low_byte_with_bounds(i32 %idx) {
; CHECK-LABEL: gep_low_byte_with_bounds:
; CHECK:         move.l ({{[0-9]+}},%sp), [[IDX:%d[0-7]]]
; CHECK:         move.l [[IDX]], [[CMP:%d[0-7]]]
; CHECK:         sub.l #9, [[CMP]]
; CHECK:         bhi
; CHECK:         lea ({{[0-9]+}},%sp), [[BASE:%a[0-7]]]
; CHECK:         move.l [[BASE]], [[PTR:%d[0-7]]]
; CHECK:         add.l [[IDX]], [[PTR]]
; CHECK:         rts
entry:
  %buf = alloca i8, align 1
  %inbounds = icmp ult i32 %idx, 10
  br i1 %inbounds, label %ok, label %bad

ok:
  %ptr = getelementptr i8, ptr %buf, i32 %idx
  %addr = ptrtoint ptr %ptr to i32
  %low = trunc i32 %addr to i8
  ret i8 %low

bad:
  unreachable
}
