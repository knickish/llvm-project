// RUN: %clang_cc1 -triple m68k-unknown-unknown -emit-llvm -o - %s | FileCheck %s

__attribute__((m68k_palm)) int foo(short a, char b) {
  return a + b;
}

// CHECK: define m68k_palmcc i32 @foo
