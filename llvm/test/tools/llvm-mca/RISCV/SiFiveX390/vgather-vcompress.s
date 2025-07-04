# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=riscv64 -mcpu=sifive-x390 -instruction-tables=full -iterations=1 < %s | FileCheck %s

# The legal (SEW, LMUL) pairs on sifive-x280 are:
# (e8, mf8) (e8, mf4) (e8, mf2) (e8, m1) (e8, m2) (e8, m4) (e8, m8)
# (e16, mf4) (e16, mf2) (e16, m1) (e16, m2) (e16, m4) (e16, m8)
# (e32, mf2) (e32, m1) (e32, m2) (e32, m4) (e32, m8)
# (e64, m1) (e64, m2) (e64, m4) (e64, m8)

vsetvli zero, zero, e8, mf8, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e8, mf4, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e8, mf2, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e8, m1, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e8, m2, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e8, m4, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e8, m8, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e16, mf4, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e16, mf2, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e16, m1, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e16, m2, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e16, m4, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e16, m8, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e32, mf2, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e32, m1, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e32, m2, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e32, m4, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e32, m8, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e64, m1, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e64, m2, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e64, m4, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24
vsetvli zero, zero, e64, m8, tu, mu
vrgather.vv v8, v16, v24
vrgatherei16.vv v8, v16, v24
vcompress.vm v8, v16, v24

# CHECK:      Resources:
# CHECK-NEXT: [0]   - VLEN1024X300SiFive7FDiv:1
# CHECK-NEXT: [1]   - VLEN1024X300SiFive7IDiv:1
# CHECK-NEXT: [2]   - VLEN1024X300SiFive7PipeA:1
# CHECK-NEXT: [3]   - VLEN1024X300SiFive7PipeAB:2 VLEN1024X300SiFive7PipeA, VLEN1024X300SiFive7PipeB
# CHECK-NEXT: [4]   - VLEN1024X300SiFive7PipeB:1
# CHECK-NEXT: [5]   - VLEN1024X300SiFive7VA1:1
# CHECK-NEXT: [6]   - VLEN1024X300SiFive7VA1OrVA2:2 VLEN1024X300SiFive7VA1, VLEN1024X300SiFive7VA2
# CHECK-NEXT: [7]   - VLEN1024X300SiFive7VA2:1
# CHECK-NEXT: [8]   - VLEN1024X300SiFive7VCQ:1
# CHECK-NEXT: [9]   - VLEN1024X300SiFive7VL:1
# CHECK-NEXT: [10]  - VLEN1024X300SiFive7VS:1

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)
# CHECK-NEXT: [7]: Bypass Latency
# CHECK-NEXT: [8]: Resources (<Name> | <Name>[<ReleaseAtCycle>] | <Name>[<AcquireAtCycle>,<ReleaseAtCycle])
# CHECK-NEXT: [9]: LLVM Opcode Name

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]                                        [9]                        Instructions:
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e8, mf8, tu, mu
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e8, mf4, tu, mu
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e8, mf2, tu, mu
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e8, m1, tu, mu
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e8, m2, tu, mu
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e8, m4, tu, mu
# CHECK-NEXT:  1      515   512.00                       515   VLEN1024X300SiFive7VA1[1,513],VLEN1024X300SiFive7VA1OrVA2[1,513],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      515   512.00                       515   VLEN1024X300SiFive7VA1[1,513],VLEN1024X300SiFive7VA1OrVA2[1,513],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      515   512.00                       515   VLEN1024X300SiFive7VA1[1,513],VLEN1024X300SiFive7VA1OrVA2[1,513],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e8, m8, tu, mu
# CHECK-NEXT:  1      1027  1024.00                      1027  VLEN1024X300SiFive7VA1[1,1025],VLEN1024X300SiFive7VA1OrVA2[1,1025],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      1027  1024.00                      1027  VLEN1024X300SiFive7VA1[1,1025],VLEN1024X300SiFive7VA1OrVA2[1,1025],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      1027  1024.00                      1027  VLEN1024X300SiFive7VA1[1,1025],VLEN1024X300SiFive7VA1OrVA2[1,1025],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, mf4, tu, mu
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, mf2, tu, mu
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, m1, tu, mu
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, m2, tu, mu
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, m4, tu, mu
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e16, m8, tu, mu
# CHECK-NEXT:  1      515   512.00                       515   VLEN1024X300SiFive7VA1[1,513],VLEN1024X300SiFive7VA1OrVA2[1,513],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      515   512.00                       515   VLEN1024X300SiFive7VA1[1,513],VLEN1024X300SiFive7VA1OrVA2[1,513],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      515   512.00                       515   VLEN1024X300SiFive7VA1[1,513],VLEN1024X300SiFive7VA1OrVA2[1,513],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e32, mf2, tu, mu
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e32, m1, tu, mu
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e32, m2, tu, mu
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e32, m4, tu, mu
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e32, m8, tu, mu
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      259   256.00                       259   VLEN1024X300SiFive7VA1[1,257],VLEN1024X300SiFive7VA1OrVA2[1,257],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e64, m1, tu, mu
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      19    16.00                        19    VLEN1024X300SiFive7VA1[1,17],VLEN1024X300SiFive7VA1OrVA2[1,17],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e64, m2, tu, mu
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      35    32.00                        35    VLEN1024X300SiFive7VA1[1,33],VLEN1024X300SiFive7VA1OrVA2[1,33],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e64, m4, tu, mu
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      67    64.00                        67    VLEN1024X300SiFive7VA1[1,65],VLEN1024X300SiFive7VA1OrVA2[1,65],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24
# CHECK-NEXT:  1      3     1.00                  U      1     VLEN1024X300SiFive7PipeA,VLEN1024X300SiFive7PipeAB VSETVLI            vsetvli	zero, zero, e64, m8, tu, mu
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VRGATHER_VV vrgather.vv	v8, v16, v24
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VRGATHEREI16_VV vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  1      131   128.00                       131   VLEN1024X300SiFive7VA1[1,129],VLEN1024X300SiFive7VA1OrVA2[1,129],VLEN1024X300SiFive7VCQ VCOMPRESS_VM vcompress.vm	v8, v16, v24

# CHECK:      Resources:
# CHECK-NEXT: [0]   - VLEN1024X300SiFive7FDiv
# CHECK-NEXT: [1]   - VLEN1024X300SiFive7IDiv
# CHECK-NEXT: [2]   - VLEN1024X300SiFive7PipeA
# CHECK-NEXT: [3]   - VLEN1024X300SiFive7PipeB
# CHECK-NEXT: [4]   - VLEN1024X300SiFive7VA1
# CHECK-NEXT: [5]   - VLEN1024X300SiFive7VA2
# CHECK-NEXT: [6]   - VLEN1024X300SiFive7VCQ
# CHECK-NEXT: [7]   - VLEN1024X300SiFive7VL
# CHECK-NEXT: [8]   - VLEN1024X300SiFive7VS

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]
# CHECK-NEXT:  -      -     22.00   -     11394.00  -   66.00   -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    Instructions:
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e8, mf8, tu, mu
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e8, mf4, tu, mu
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e8, mf2, tu, mu
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e8, m1, tu, mu
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e8, m2, tu, mu
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e8, m4, tu, mu
# CHECK-NEXT:  -      -      -      -     513.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     513.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     513.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e8, m8, tu, mu
# CHECK-NEXT:  -      -      -      -     1025.00  -    1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     1025.00  -    1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     1025.00  -    1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, mf4, tu, mu
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, mf2, tu, mu
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, m1, tu, mu
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, m2, tu, mu
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, m4, tu, mu
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e16, m8, tu, mu
# CHECK-NEXT:  -      -      -      -     513.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     513.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     513.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e32, mf2, tu, mu
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e32, m1, tu, mu
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e32, m2, tu, mu
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e32, m4, tu, mu
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e32, m8, tu, mu
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     257.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e64, m1, tu, mu
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     17.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e64, m2, tu, mu
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     33.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e64, m4, tu, mu
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     65.00   -     1.00    -      -     vcompress.vm	v8, v16, v24
# CHECK-NEXT:  -      -     1.00    -      -      -      -      -      -     vsetvli	zero, zero, e64, m8, tu, mu
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vrgather.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vrgatherei16.vv	v8, v16, v24
# CHECK-NEXT:  -      -      -      -     129.00  -     1.00    -      -     vcompress.vm	v8, v16, v24
