	.text
	.file	"global-address.ll"
	.globl	folded_offset                   ; -- Begin function folded_offset
	.p2align	1
	.type	folded_offset,@function
folded_offset:                          ; @folded_offset
	.cfi_startproc
; %bb.0:                                ; %entry
	lea	_GLOBAL_OFFSET_TABLE_, %a0      ; encoding: [0x41,0xf9,A,A,A,A]
                                        ;   fixup A - offset: 2, value: _GLOBAL_OFFSET_TABLE_, kind: FK_Data_4
	lea	(0,%pc,%a0), %a0                ; encoding: [0x41,0xfb,0x88,0x00]
	move.l	#VBRTag@GOTOFF, %d0             ; encoding: [0x20,0x3c,A,A,A,A]
                                        ;   fixup A - offset: 2, value: VBRTag@GOTOFF, kind: FK_Data_4
	move.b	(1,%a0,%d0), %d0                ; encoding: [0x10,0x30,0x08,0x01]
	ext.w	%d0                             ; encoding: [0x48,0x80]
	ext.l	%d0                             ; encoding: [0x48,0xc0]
	sub.l	(4,%sp), %d0                    ; encoding: [0x90,0xaf,0x00,0x04]
	seq	%d0                             ; encoding: [0x57,0xc0]
	rts                                     ; encoding: [0x4e,0x75]
.Lfunc_end0:
	.size	folded_offset, .Lfunc_end0-folded_offset
	.cfi_endproc
                                        ; -- End function
	.globl	non_folded_offset               ; -- Begin function non_folded_offset
	.p2align	1
	.type	non_folded_offset,@function
non_folded_offset:                      ; @non_folded_offset
	.cfi_startproc
; %bb.0:                                ; %entry
	lea	_GLOBAL_OFFSET_TABLE_, %a0      ; encoding: [0x41,0xf9,A,A,A,A]
                                        ;   fixup A - offset: 2, value: _GLOBAL_OFFSET_TABLE_, kind: FK_Data_4
	lea	(0,%pc,%a0), %a0                ; encoding: [0x41,0xfb,0x88,0x00]
	move.l	#2147483645, %d0                ; encoding: [0x20,0x3c,0x7f,0xff,0xff,0xfd]
	adda.l	#VBRTag@GOTOFF, %a0             ; encoding: [0xd1,0xfc,A,A,A,A]
                                        ;   fixup A - offset: 2, value: VBRTag@GOTOFF, kind: FK_Data_4
	move.b	(0,%a0,%d0), %d0                ; encoding: [0x10,0x30,0x08,0x00]
	ext.w	%d0                             ; encoding: [0x48,0x80]
	ext.l	%d0                             ; encoding: [0x48,0xc0]
	sub.l	(4,%sp), %d0                    ; encoding: [0x90,0xaf,0x00,0x04]
	seq	%d0                             ; encoding: [0x57,0xc0]
	rts                                     ; encoding: [0x4e,0x75]
.Lfunc_end1:
	.size	non_folded_offset, .Lfunc_end1-non_folded_offset
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
