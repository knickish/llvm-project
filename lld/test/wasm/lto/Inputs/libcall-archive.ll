target datalayout = "e-m:e-p:32:32-p10:8:8-p20:8:8-i64:64-n32:64-S128-ni:1:10:20"
target triple = "wasm32-unknown-unknown"

define void @memcpy() #0 {
  ret void
}

define float @acosf(float %x) {
  ret float %x
}

define i128 @__umodti3(i128 %a, i128 %b) {
  ret i128 %a
}

attributes #0 = { "target-features"="-bulk-memory,-bulk-memory-opt" }
