; RUN: llc < %s -mtriple=m68k-linux | FileCheck %s

define i32 @minimized() {
start:
  %_137 = load i32, ptr null, align 2
  %_136 = urem i32 %_137, 65521
  %0 = trunc i32 %_136 to i16
  store i16 %0, ptr null, align 2
  %_140 = load i32, ptr null, align 2
  %_139 = mul i32 %_140, 65521
  ret i32 %_139
}
