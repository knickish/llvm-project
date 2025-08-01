// NOTE: Assertions have been autogenerated by utils/update_cc_test_checks.py
// REQUIRES: aarch64-registered-target
// RUN: %clang_cc1 -triple aarch64 -target-feature +sme -target-feature +sme2 -target-feature +sve-b16b16 -disable-O0-optnone -Werror -Wall -emit-llvm -o - %s | opt -S -p mem2reg,instcombine,tailcallelim | FileCheck %s
// RUN: %clang_cc1 -triple aarch64 -target-feature +sve -target-feature +sve2 -target-feature +sve-b16b16 -disable-O0-optnone -Werror -Wall -emit-llvm -o - -x c++ %s | opt -S -p mem2reg,instcombine,tailcallelim | FileCheck %s -check-prefix=CPP-CHECK
// RUN: %clang_cc1 -DSVE_OVERLOADED_FORMS -triple aarch64 -target-feature +sve -target-feature +sve2 -target-feature +sve-b16b16 -disable-O0-optnone -Werror -Wall -emit-llvm -o - %s | opt -S -p mem2reg,instcombine,tailcallelim | FileCheck %s
// RUN: %clang_cc1 -DSVE_OVERLOADED_FORMS -triple aarch64 -target-feature +sve -target-feature +sve2 -target-feature +sve-b16b16 -disable-O0-optnone -Werror -Wall -emit-llvm -o - -x c++ %s | opt -S -p mem2reg,instcombine,tailcallelim | FileCheck %s -check-prefix=CPP-CHECK
// RUN: %clang_cc1 -triple aarch64 -target-feature +sve -target-feature +sve2 -target-feature +sve-b16b16 -S -disable-O0-optnone -Werror -Wall -o /dev/null %s
// RUN: %clang_cc1 -triple aarch64 -target-feature +sme -target-feature +sme2 -target-feature +sve-b16b16 -S -disable-O0-optnone -Werror -Wall -o /dev/null %s
#include <arm_sve.h>

#if defined __ARM_FEATURE_SME
#define MODE_ATTR __arm_streaming
#else
#define MODE_ATTR
#endif

#ifdef SVE_OVERLOADED_FORMS
// A simple used,unused... macro, long enough to represent any SVE builtin.
#define SVE_ACLE_FUNC(A1,A2_UNUSED,A3) A1##A3
#else
#define SVE_ACLE_FUNC(A1,A2,A3) A1##A2##A3
#endif

// CHECK-LABEL: @test_svadd_bf16_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> [[OP2:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z17test_svadd_bf16_mu10__SVBool_tu14__SVBfloat16_tS0_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> [[OP2:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP1]]
//
svbfloat16_t test_svadd_bf16_m(svbool_t pg, svbfloat16_t op1, svbfloat16_t op2) MODE_ATTR
{
  return SVE_ACLE_FUNC(svadd, _bf16, _m)(pg, op1, op2);
}

// CHECK-LABEL: @test_svadd_bf16_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = select <vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> zeroinitializer
// CHECK-NEXT:    [[TMP2:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[TMP1]], <vscale x 8 x bfloat> [[OP2:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP2]]
//
// CPP-CHECK-LABEL: @_Z17test_svadd_bf16_zu10__SVBool_tu14__SVBfloat16_tS0_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = select <vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> zeroinitializer
// CPP-CHECK-NEXT:    [[TMP2:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[TMP1]], <vscale x 8 x bfloat> [[OP2:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP2]]
//
svbfloat16_t test_svadd_bf16_z(svbool_t pg, svbfloat16_t op1, svbfloat16_t op2) MODE_ATTR
{
  return SVE_ACLE_FUNC(svadd, _bf16, _z)(pg, op1, op2);
}

// CHECK-LABEL: @test_svadd_bf16_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.u.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> [[OP2:%.*]])
// CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z17test_svadd_bf16_xu10__SVBool_tu14__SVBfloat16_tS0_(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.u.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> [[OP2:%.*]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP1]]
//
svbfloat16_t test_svadd_bf16_x(svbool_t pg, svbfloat16_t op1, svbfloat16_t op2) MODE_ATTR
{
  return SVE_ACLE_FUNC(svadd, _bf16, _x)(pg, op1, op2);
}

// CHECK-LABEL: @test_svadd_bf16_n_m(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 8 x bfloat> poison, bfloat [[OP2:%.*]], i64 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 8 x bfloat> [[DOTSPLATINSERT]], <vscale x 8 x bfloat> poison, <vscale x 8 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> [[DOTSPLAT]])
// CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z19test_svadd_bf16_n_mu10__SVBool_tu14__SVBfloat16_tu6__bf16(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 8 x bfloat> poison, bfloat [[OP2:%.*]], i64 0
// CPP-CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 8 x bfloat> [[DOTSPLATINSERT]], <vscale x 8 x bfloat> poison, <vscale x 8 x i32> zeroinitializer
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> [[DOTSPLAT]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP1]]
//
svbfloat16_t test_svadd_bf16_n_m(svbool_t pg, svbfloat16_t op1, bfloat16_t op2) MODE_ATTR
{
  return SVE_ACLE_FUNC(svadd, _n_bf16, _m)(pg, op1, op2);
}

// CHECK-LABEL: @test_svadd_bf16_n_z(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 8 x bfloat> poison, bfloat [[OP2:%.*]], i64 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 8 x bfloat> [[DOTSPLATINSERT]], <vscale x 8 x bfloat> poison, <vscale x 8 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP1:%.*]] = select <vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> zeroinitializer
// CHECK-NEXT:    [[TMP2:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[TMP1]], <vscale x 8 x bfloat> [[DOTSPLAT]])
// CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP2]]
//
// CPP-CHECK-LABEL: @_Z19test_svadd_bf16_n_zu10__SVBool_tu14__SVBfloat16_tu6__bf16(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 8 x bfloat> poison, bfloat [[OP2:%.*]], i64 0
// CPP-CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 8 x bfloat> [[DOTSPLATINSERT]], <vscale x 8 x bfloat> poison, <vscale x 8 x i32> zeroinitializer
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = select <vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> zeroinitializer
// CPP-CHECK-NEXT:    [[TMP2:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[TMP1]], <vscale x 8 x bfloat> [[DOTSPLAT]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP2]]
//
svbfloat16_t test_svadd_bf16_n_z(svbool_t pg, svbfloat16_t op1, bfloat16_t op2) MODE_ATTR
{
   return SVE_ACLE_FUNC(svadd, _n_bf16, _z)(pg, op1, op2);
}

// CHECK-LABEL: @test_svadd_bf16_n_x(
// CHECK-NEXT:  entry:
// CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 8 x bfloat> poison, bfloat [[OP2:%.*]], i64 0
// CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 8 x bfloat> [[DOTSPLATINSERT]], <vscale x 8 x bfloat> poison, <vscale x 8 x i32> zeroinitializer
// CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.u.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> [[DOTSPLAT]])
// CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP1]]
//
// CPP-CHECK-LABEL: @_Z19test_svadd_bf16_n_xu10__SVBool_tu14__SVBfloat16_tu6__bf16(
// CPP-CHECK-NEXT:  entry:
// CPP-CHECK-NEXT:    [[TMP0:%.*]] = tail call <vscale x 8 x i1> @llvm.aarch64.sve.convert.from.svbool.nxv8i1(<vscale x 16 x i1> [[PG:%.*]])
// CPP-CHECK-NEXT:    [[DOTSPLATINSERT:%.*]] = insertelement <vscale x 8 x bfloat> poison, bfloat [[OP2:%.*]], i64 0
// CPP-CHECK-NEXT:    [[DOTSPLAT:%.*]] = shufflevector <vscale x 8 x bfloat> [[DOTSPLATINSERT]], <vscale x 8 x bfloat> poison, <vscale x 8 x i32> zeroinitializer
// CPP-CHECK-NEXT:    [[TMP1:%.*]] = tail call <vscale x 8 x bfloat> @llvm.aarch64.sve.fadd.u.nxv8bf16(<vscale x 8 x i1> [[TMP0]], <vscale x 8 x bfloat> [[OP1:%.*]], <vscale x 8 x bfloat> [[DOTSPLAT]])
// CPP-CHECK-NEXT:    ret <vscale x 8 x bfloat> [[TMP1]]
//
svbfloat16_t test_svadd_bf16_n_x(svbool_t pg, svbfloat16_t op1, bfloat16_t op2) MODE_ATTR
{
   return SVE_ACLE_FUNC(svadd, _n_bf16, _x)(pg, op1, op2);
}
