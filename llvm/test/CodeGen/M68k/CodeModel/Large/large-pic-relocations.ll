; RUN: llc < %s -mtriple=m68k-unknown-linux-gnu -mcpu=M68020 \
; RUN:   -relocation-model=pic -code-model=large -verify-machineinstrs \
; RUN:   -filetype=obj -o - | llvm-readobj -r - | FileCheck %s
;
; CHECK:      R_68K_GOTPCREL32 _GLOBAL_OFFSET_TABLE_
; CHECK-NEXT: R_68K_GOTOFF32 data
; CHECK-NEXT: R_68K_PLT32 external_callee
; CHECK-NEXT: R_68K_GOTPCREL32 nonlazy_callee
; CHECK:      R_68K_PLT32 external_callee

target triple = "m68k-unknown-linux-gnu"

@data = external global i32

declare void @external_callee()
declare void @nonlazy_callee() #0

define i32 @test() {
  %value = load i32, ptr @data
  call void @external_callee()
  call void @nonlazy_callee()
  ret i32 %value
}

define void @tail_call() {
  musttail call void @external_callee()
  ret void
}

attributes #0 = { nonlazybind }
