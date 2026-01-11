	.file	"146213.ll"
	.text
	.globl	float_arg_test                  ; -- Begin function float_arg_test
	.p2align	1
	.type	float_arg_test,@function
float_arg_test:                         ; @float_arg_test
; %bb.0:                                ; %start
	suba.l	#12, %sp
	movem.l	%a2, (8,%sp)                    ; 8-byte Folded Spill
	move.l	#0, (%sp)
	jsr	float_arg
	move.l	(16,%sp), %a2
	move.l	(%a2), %d0
	move.l	%d0, (%sp)
	move.l	#0, (4,%sp)
	jsr	__mulsf3
	move.l	%d0, (%a2)
	moveq	#0, %d0
	movem.l	(8,%sp), %a2                    ; 8-byte Folded Reload
	adda.l	#12, %sp
	rts
.Lfunc_end0:
	.size	float_arg_test, .Lfunc_end0-float_arg_test
                                        ; -- End function
	.globl	double_arg_test                 ; -- Begin function double_arg_test
	.p2align	1
	.type	double_arg_test,@function
double_arg_test:                        ; @double_arg_test
; %bb.0:                                ; %start
	suba.l	#12, %sp
	movem.l	%a2, (8,%sp)                    ; 8-byte Folded Spill
	move.l	#0, (4,%sp)
	move.l	#0, (%sp)
	jsr	double_arg
	move.l	(16,%sp), %a2
	move.l	(%a2), %d0
	move.l	%d0, (%sp)
	move.l	#0, (4,%sp)
	jsr	__mulsf3
	move.l	%d0, (%a2)
	moveq	#0, %d0
	movem.l	(8,%sp), %a2                    ; 8-byte Folded Reload
	adda.l	#12, %sp
	rts
.Lfunc_end1:
	.size	double_arg_test, .Lfunc_end1-double_arg_test
                                        ; -- End function
	.section	".note.GNU-stack","",@progbits
