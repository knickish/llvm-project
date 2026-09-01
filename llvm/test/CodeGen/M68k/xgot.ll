; RUN: llc < %s -mtriple=m68k-unknown-linux-gnu -mcpu=M68020 \
; RUN:   -relocation-model=pic -code-model=small -xgot -verify-machineinstrs \
; RUN:   -filetype=obj -o - | llvm-readobj -r - | FileCheck %s --check-prefix=XGOT
; RUN: llc < %s -mtriple=m68k-unknown-linux-gnu -mcpu=M68020 \
; RUN:   -relocation-model=pic -code-model=small -verify-machineinstrs \
; RUN:   -filetype=obj -o - | llvm-readobj -r - | FileCheck %s --check-prefix=DEFAULT
;
; XGOT: R_68K_GOTPCREL32 data
; XGOT: R_68K_PLT32 callee
; XGOT: R_68K_GOTPCREL32 nonlazy
;
; DEFAULT: R_68K_GOTPCREL16 data
; DEFAULT: R_68K_PLT16 callee
; DEFAULT: R_68K_GOTPCREL16 nonlazy

target triple = "m68k-unknown-linux-gnu"

@data = external global i32

declare void @callee()
declare void @nonlazy() #0

define i32 @test() {
  %value = load i32, ptr @data
  call void @callee()
  call void @nonlazy()
  ret i32 %value
}

attributes #0 = { nonlazybind }
