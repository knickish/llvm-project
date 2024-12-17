	.text
	.file	"xgot.ll"
	.globl	ReadFuncPtr                     ; -- Begin function ReadFuncPtr
	.p2align	1
	.type	ReadFuncPtr,@function
ReadFuncPtr:                            ; @ReadFuncPtr
	.cfi_startproc
; %bb.0:                                ; %entry
	suba.l	#4, %sp                         ; encoding: [0x9f,0xfc,0x00,0x00,0x00,0x04]
	.cfi_def_cfa_offset -8
	move.l	(0,%pc), %a0                    ; encoding: [0x20,0x7a,0x00,0x00]
	jsr	(%a0)                           ; encoding: [0x4e,0x90]
.Lfunc_end0:
	.size	ReadFuncPtr, .Lfunc_end0-ReadFuncPtr
	.cfi_endproc
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
