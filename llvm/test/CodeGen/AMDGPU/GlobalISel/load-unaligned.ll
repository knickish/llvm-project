; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=gfx900 -mattr=+unaligned-access-mode < %s | FileCheck --check-prefix=GFX9 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=hawaii -mattr=+unaligned-access-mode < %s | FileCheck --check-prefix=GFX7 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=gfx1010 -mattr=+unaligned-access-mode < %s | FileCheck --check-prefix=GFX10 %s
; RUN: llc -global-isel -mtriple=amdgcn-amd-amdpal -mcpu=gfx1100 -mattr=+unaligned-access-mode < %s | FileCheck --check-prefix=GFX11 %s

; Unaligned DS access in available from GFX9 onwards.
; LDS alignment enforcement is controlled by a configuration register:
; SH_MEM_CONFIG.alignment_mode

define <4 x i32> @load_lds_v4i32_align1(ptr addrspace(3) %ptr) {
; GFX9-LABEL: load_lds_v4i32_align1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_read_b128 v[0:3], v0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: load_lds_v4i32_align1:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    ds_read_u8 v1, v0
; GFX7-NEXT:    ds_read_u8 v2, v0 offset:1
; GFX7-NEXT:    ds_read_u8 v3, v0 offset:2
; GFX7-NEXT:    ds_read_u8 v4, v0 offset:3
; GFX7-NEXT:    ds_read_u8 v5, v0 offset:4
; GFX7-NEXT:    ds_read_u8 v6, v0 offset:5
; GFX7-NEXT:    ds_read_u8 v7, v0 offset:6
; GFX7-NEXT:    ds_read_u8 v8, v0 offset:7
; GFX7-NEXT:    s_waitcnt lgkmcnt(6)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 8, v2
; GFX7-NEXT:    v_or_b32_e32 v1, v2, v1
; GFX7-NEXT:    s_waitcnt lgkmcnt(4)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 24, v4
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v3
; GFX7-NEXT:    v_or_b32_e32 v4, v2, v1
; GFX7-NEXT:    s_waitcnt lgkmcnt(2)
; GFX7-NEXT:    v_lshlrev_b32_e32 v1, 8, v6
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 24, v8
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 16, v7
; GFX7-NEXT:    v_or_b32_e32 v1, v1, v5
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v3
; GFX7-NEXT:    v_or_b32_e32 v1, v2, v1
; GFX7-NEXT:    ds_read_u8 v2, v0 offset:8
; GFX7-NEXT:    ds_read_u8 v3, v0 offset:9
; GFX7-NEXT:    ds_read_u8 v5, v0 offset:10
; GFX7-NEXT:    ds_read_u8 v6, v0 offset:11
; GFX7-NEXT:    ds_read_u8 v7, v0 offset:12
; GFX7-NEXT:    ds_read_u8 v8, v0 offset:13
; GFX7-NEXT:    ds_read_u8 v9, v0 offset:14
; GFX7-NEXT:    ds_read_u8 v0, v0 offset:15
; GFX7-NEXT:    s_waitcnt lgkmcnt(6)
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 8, v3
; GFX7-NEXT:    v_or_b32_e32 v2, v3, v2
; GFX7-NEXT:    s_waitcnt lgkmcnt(4)
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 24, v6
; GFX7-NEXT:    v_lshlrev_b32_e32 v5, 16, v5
; GFX7-NEXT:    v_or_b32_e32 v3, v3, v5
; GFX7-NEXT:    v_or_b32_e32 v2, v3, v2
; GFX7-NEXT:    s_waitcnt lgkmcnt(2)
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 8, v8
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    v_lshlrev_b32_e32 v0, 24, v0
; GFX7-NEXT:    v_lshlrev_b32_e32 v5, 16, v9
; GFX7-NEXT:    v_or_b32_e32 v3, v3, v7
; GFX7-NEXT:    v_or_b32_e32 v0, v0, v5
; GFX7-NEXT:    v_or_b32_e32 v3, v0, v3
; GFX7-NEXT:    v_mov_b32_e32 v0, v4
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: load_lds_v4i32_align1:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    v_mov_b32_e32 v2, v0
; GFX10-NEXT:    ds_read2_b32 v[0:1], v0 offset1:1
; GFX10-NEXT:    ds_read2_b32 v[2:3], v2 offset0:2 offset1:3
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: load_lds_v4i32_align1:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    ds_load_b128 v[0:3], v0
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %load = load <4 x i32>, ptr addrspace(3) %ptr, align 1
  ret <4 x i32> %load
}

define <3 x i32> @load_lds_v3i32_align1(ptr addrspace(3) %ptr) {
; GFX9-LABEL: load_lds_v3i32_align1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_read_b96 v[0:2], v0
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: load_lds_v3i32_align1:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    ds_read_u8 v1, v0
; GFX7-NEXT:    ds_read_u8 v2, v0 offset:1
; GFX7-NEXT:    ds_read_u8 v3, v0 offset:2
; GFX7-NEXT:    ds_read_u8 v4, v0 offset:3
; GFX7-NEXT:    ds_read_u8 v5, v0 offset:4
; GFX7-NEXT:    ds_read_u8 v6, v0 offset:5
; GFX7-NEXT:    ds_read_u8 v7, v0 offset:6
; GFX7-NEXT:    ds_read_u8 v8, v0 offset:7
; GFX7-NEXT:    s_waitcnt lgkmcnt(6)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 8, v2
; GFX7-NEXT:    v_or_b32_e32 v1, v2, v1
; GFX7-NEXT:    s_waitcnt lgkmcnt(4)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 24, v4
; GFX7-NEXT:    v_lshlrev_b32_e32 v3, 16, v3
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v3
; GFX7-NEXT:    v_or_b32_e32 v3, v2, v1
; GFX7-NEXT:    s_waitcnt lgkmcnt(2)
; GFX7-NEXT:    v_lshlrev_b32_e32 v1, 8, v6
; GFX7-NEXT:    v_or_b32_e32 v1, v1, v5
; GFX7-NEXT:    s_waitcnt lgkmcnt(1)
; GFX7-NEXT:    v_lshlrev_b32_e32 v4, 16, v7
; GFX7-NEXT:    ds_read_u8 v5, v0 offset:8
; GFX7-NEXT:    ds_read_u8 v6, v0 offset:9
; GFX7-NEXT:    ds_read_u8 v7, v0 offset:10
; GFX7-NEXT:    ds_read_u8 v0, v0 offset:11
; GFX7-NEXT:    s_waitcnt lgkmcnt(4)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 24, v8
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v4
; GFX7-NEXT:    v_or_b32_e32 v1, v2, v1
; GFX7-NEXT:    s_waitcnt lgkmcnt(2)
; GFX7-NEXT:    v_lshlrev_b32_e32 v2, 8, v6
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    v_lshlrev_b32_e32 v0, 24, v0
; GFX7-NEXT:    v_lshlrev_b32_e32 v4, 16, v7
; GFX7-NEXT:    v_or_b32_e32 v2, v2, v5
; GFX7-NEXT:    v_or_b32_e32 v0, v0, v4
; GFX7-NEXT:    v_or_b32_e32 v2, v0, v2
; GFX7-NEXT:    v_mov_b32_e32 v0, v3
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: load_lds_v3i32_align1:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    v_mov_b32_e32 v2, v0
; GFX10-NEXT:    ds_read2_b32 v[0:1], v0 offset1:1
; GFX10-NEXT:    ds_read_b32 v2, v2 offset:8
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: load_lds_v3i32_align1:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    ds_load_b96 v[0:2], v0
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  %load = load <3 x i32>, ptr addrspace(3) %ptr, align 1
  ret <3 x i32> %load
}

define void @store_lds_v4i32_align1(ptr addrspace(3) %out, <4 x i32> %x) {
; GFX9-LABEL: store_lds_v4i32_align1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_write_b128 v0, v[1:4]
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: store_lds_v4i32_align1:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    v_lshrrev_b32_e32 v5, 16, v1
; GFX7-NEXT:    v_bfe_u32 v6, v1, 8, 8
; GFX7-NEXT:    ds_write_b8 v0, v1
; GFX7-NEXT:    ds_write_b8 v0, v6 offset:1
; GFX7-NEXT:    v_lshrrev_b32_e32 v1, 24, v1
; GFX7-NEXT:    ds_write_b8 v0, v5 offset:2
; GFX7-NEXT:    ds_write_b8 v0, v1 offset:3
; GFX7-NEXT:    v_lshrrev_b32_e32 v1, 16, v2
; GFX7-NEXT:    v_bfe_u32 v5, v2, 8, 8
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:4
; GFX7-NEXT:    ds_write_b8 v0, v5 offset:5
; GFX7-NEXT:    v_lshrrev_b32_e32 v2, 24, v2
; GFX7-NEXT:    ds_write_b8 v0, v1 offset:6
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:7
; GFX7-NEXT:    v_bfe_u32 v2, v3, 8, 8
; GFX7-NEXT:    v_lshrrev_b32_e32 v1, 16, v3
; GFX7-NEXT:    ds_write_b8 v0, v3 offset:8
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:9
; GFX7-NEXT:    v_lshrrev_b32_e32 v2, 24, v3
; GFX7-NEXT:    ds_write_b8 v0, v1 offset:10
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:11
; GFX7-NEXT:    v_lshrrev_b32_e32 v1, 16, v4
; GFX7-NEXT:    v_bfe_u32 v2, v4, 8, 8
; GFX7-NEXT:    ds_write_b8 v0, v4 offset:12
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:13
; GFX7-NEXT:    v_lshrrev_b32_e32 v2, 24, v4
; GFX7-NEXT:    ds_write_b8 v0, v1 offset:14
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:15
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: store_lds_v4i32_align1:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    ds_write2_b32 v0, v1, v2 offset1:1
; GFX10-NEXT:    ds_write2_b32 v0, v3, v4 offset0:2 offset1:3
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: store_lds_v4i32_align1:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    ds_store_b128 v0, v[1:4]
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  store <4 x i32> %x, ptr addrspace(3) %out, align 1
  ret void
}

define void @store_lds_v3i32_align1(ptr addrspace(3) %out, <3 x i32> %x) {
; GFX9-LABEL: store_lds_v3i32_align1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX9-NEXT:    ds_write_b96 v0, v[1:3]
; GFX9-NEXT:    s_waitcnt lgkmcnt(0)
; GFX9-NEXT:    s_setpc_b64 s[30:31]
;
; GFX7-LABEL: store_lds_v3i32_align1:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX7-NEXT:    s_mov_b32 m0, -1
; GFX7-NEXT:    v_lshrrev_b32_e32 v4, 16, v1
; GFX7-NEXT:    v_bfe_u32 v5, v1, 8, 8
; GFX7-NEXT:    ds_write_b8 v0, v1
; GFX7-NEXT:    ds_write_b8 v0, v5 offset:1
; GFX7-NEXT:    v_lshrrev_b32_e32 v1, 24, v1
; GFX7-NEXT:    ds_write_b8 v0, v4 offset:2
; GFX7-NEXT:    ds_write_b8 v0, v1 offset:3
; GFX7-NEXT:    v_lshrrev_b32_e32 v1, 16, v2
; GFX7-NEXT:    v_bfe_u32 v4, v2, 8, 8
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:4
; GFX7-NEXT:    ds_write_b8 v0, v4 offset:5
; GFX7-NEXT:    v_lshrrev_b32_e32 v2, 24, v2
; GFX7-NEXT:    ds_write_b8 v0, v1 offset:6
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:7
; GFX7-NEXT:    v_lshrrev_b32_e32 v1, 16, v3
; GFX7-NEXT:    v_bfe_u32 v2, v3, 8, 8
; GFX7-NEXT:    ds_write_b8 v0, v3 offset:8
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:9
; GFX7-NEXT:    v_lshrrev_b32_e32 v2, 24, v3
; GFX7-NEXT:    ds_write_b8 v0, v1 offset:10
; GFX7-NEXT:    ds_write_b8 v0, v2 offset:11
; GFX7-NEXT:    s_waitcnt lgkmcnt(0)
; GFX7-NEXT:    s_setpc_b64 s[30:31]
;
; GFX10-LABEL: store_lds_v3i32_align1:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX10-NEXT:    ds_write2_b32 v0, v1, v2 offset1:1
; GFX10-NEXT:    ds_write_b32 v0, v3 offset:8
; GFX10-NEXT:    s_waitcnt lgkmcnt(0)
; GFX10-NEXT:    s_setpc_b64 s[30:31]
;
; GFX11-LABEL: store_lds_v3i32_align1:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    s_waitcnt vmcnt(0) expcnt(0) lgkmcnt(0)
; GFX11-NEXT:    ds_store_b96 v0, v[1:3]
; GFX11-NEXT:    s_waitcnt lgkmcnt(0)
; GFX11-NEXT:    s_setpc_b64 s[30:31]
  store <3 x i32> %x, ptr addrspace(3) %out, align 1
  ret void
}

define amdgpu_ps void @test_s_load_constant_v8i32_align1(ptr addrspace(4) inreg %ptr, ptr addrspace(1) inreg %out) {
; GFX9-LABEL: test_s_load_constant_v8i32_align1:
; GFX9:       ; %bb.0:
; GFX9-NEXT:    v_mov_b32_e32 v8, 0
; GFX9-NEXT:    global_load_dwordx4 v[0:3], v8, s[0:1]
; GFX9-NEXT:    global_load_dwordx4 v[4:7], v8, s[0:1] offset:16
; GFX9-NEXT:    s_waitcnt vmcnt(1)
; GFX9-NEXT:    global_store_dwordx4 v8, v[0:3], s[2:3]
; GFX9-NEXT:    s_waitcnt vmcnt(1)
; GFX9-NEXT:    global_store_dwordx4 v8, v[4:7], s[2:3] offset:16
; GFX9-NEXT:    s_endpgm
;
; GFX7-LABEL: test_s_load_constant_v8i32_align1:
; GFX7:       ; %bb.0:
; GFX7-NEXT:    s_mov_b32 s4, s2
; GFX7-NEXT:    s_mov_b32 s5, s3
; GFX7-NEXT:    s_mov_b32 s2, -1
; GFX7-NEXT:    s_mov_b32 s3, 0xf000
; GFX7-NEXT:    buffer_load_dwordx4 v[0:3], off, s[0:3], 0
; GFX7-NEXT:    buffer_load_dwordx4 v[4:7], off, s[0:3], 0 offset:16
; GFX7-NEXT:    s_mov_b64 s[6:7], s[2:3]
; GFX7-NEXT:    s_waitcnt vmcnt(1)
; GFX7-NEXT:    buffer_store_dwordx4 v[0:3], off, s[4:7], 0
; GFX7-NEXT:    s_waitcnt vmcnt(1)
; GFX7-NEXT:    buffer_store_dwordx4 v[4:7], off, s[4:7], 0 offset:16
; GFX7-NEXT:    s_endpgm
;
; GFX10-LABEL: test_s_load_constant_v8i32_align1:
; GFX10:       ; %bb.0:
; GFX10-NEXT:    v_mov_b32_e32 v8, 0
; GFX10-NEXT:    s_clause 0x1
; GFX10-NEXT:    global_load_dwordx4 v[0:3], v8, s[0:1]
; GFX10-NEXT:    global_load_dwordx4 v[4:7], v8, s[0:1] offset:16
; GFX10-NEXT:    s_waitcnt vmcnt(1)
; GFX10-NEXT:    global_store_dwordx4 v8, v[0:3], s[2:3]
; GFX10-NEXT:    s_waitcnt vmcnt(0)
; GFX10-NEXT:    global_store_dwordx4 v8, v[4:7], s[2:3] offset:16
; GFX10-NEXT:    s_endpgm
;
; GFX11-LABEL: test_s_load_constant_v8i32_align1:
; GFX11:       ; %bb.0:
; GFX11-NEXT:    v_mov_b32_e32 v8, 0
; GFX11-NEXT:    s_clause 0x1
; GFX11-NEXT:    global_load_b128 v[0:3], v8, s[0:1]
; GFX11-NEXT:    global_load_b128 v[4:7], v8, s[0:1] offset:16
; GFX11-NEXT:    s_waitcnt vmcnt(1)
; GFX11-NEXT:    global_store_b128 v8, v[0:3], s[2:3]
; GFX11-NEXT:    s_waitcnt vmcnt(0)
; GFX11-NEXT:    global_store_b128 v8, v[4:7], s[2:3] offset:16
; GFX11-NEXT:    s_endpgm
  %load = load <8 x i32>, ptr addrspace(4) %ptr, align 1
  store <8 x i32> %load, ptr addrspace(1) %out
  ret void
}
