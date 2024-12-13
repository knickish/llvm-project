; RUN: llvm-mc -triple m68k -filetype=obj --position-independent %s -o - \
; RUN:   | llvm-readobj -r - | FileCheck -check-prefix=RELOC %s
; RUN: llvm-mc -triple m68k -show-encoding --position-independent %s -o - \
; RUN:   | FileCheck -check-prefix=INSTR -check-prefix=FIXUP %s
; RUN: llvm-mc -triple m68k -filetype=obj -mattr=+xgot --position-independent %s -o - \
; RUN:   | llvm-readobj -r - | FileCheck -check-prefix=RELOC-XGOT %s
; RUN: llvm-mc -triple m68k -show-encoding -mattr=+xgot --position-independent %s -o - \
; RUN:   | FileCheck -check-prefix=INSTR -check-prefix=FIXUP-XGOT %s

; RUN: llvm-mc -triple m68k --mcpu=M68020 -filetype=obj --position-independent %s -o - \
; RUN:   | llvm-readobj -r - | FileCheck -check-prefix=RELOC32 %s
; RUN: llvm-mc -triple m68k --mcpu=M68020 -show-encoding --position-independent %s -o - \
; RUN:   | FileCheck -check-prefix=INSTR -check-prefix=FIXUP32 %s
; RUN: llvm-mc -triple m68k --mcpu=M68020 -filetype=obj -mattr=+xgot --position-independent %s -o - \
; RUN:   | llvm-readobj -r - | FileCheck -check-prefix=RELOC-XGOT32 %s
; RUN: llvm-mc -triple m68k --mcpu=M68020 -show-encoding -mattr=+xgot --position-independent %s -o - \
; RUN:   | FileCheck -check-prefix=INSTR -check-prefix=FIXUP-XGOT32 %s

; INSTR: move.l  (dst1@GOTOFF,%a5,%d0), %d0
; RELOC: R_68K_GOTOFF8 dst1 0x0
; RELOC32: R_68K_GOTOFF8 dst1 0x0
; RELOC-XGOT: R_68K_GOTOFF8 dst1 0x0
; RELOC-XGO32T: R_68K_GOTOFF8 dst1 0x0
; FIXUP: fixup A - offset: 3, value: dst1@GOTOFF, kind: FK_Data_1
; FIXUP32: fixup A - offset: 3, value: dst1@GOTOFF, kind: FK_Data_1
; FIXUP-XGOT: fixup A - offset: 3, value: dst1@GOTOFF, kind: FK_Data_1
; FIXUP-XGOT32: fixup A - offset: 3, value: dst1@GOTOFF, kind: FK_Data_1
move.l	(dst1@GOTOFF,%a5,%d0), %d0

; INSTR: move.l  (dst2@GOTOFF,%a5), %d0
; RELOC: R_68K_GOTOFF16 dst2 0x0
; RELOC32: R_68K_GOTOFF16 dst2 0x0
; RELOC-XGOT: R_68K_GOTOFF16 dst2 0x0
; RELOC-XGOT32: R_68K_GOTOFF16 dst2 0x0
; FIXUP: fixup A - offset: 2, value: dst2@GOTOFF, kind: FK_Data_2
; FIXUP32: fixup A - offset: 2, value: dst2@GOTOFF, kind: FK_Data_2
; FIXUP-XGOT: fixup A - offset: 2, value: dst2@GOTOFF, kind: FK_Data_2
; FIXUP-XGOT32: fixup A - offset: 2, value: dst2@GOTOFF, kind: FK_Data_2
move.l	(dst2@GOTOFF,%a5), %d0

; INSTR: lea     (dst3@GOTPCREL,%pc), %a5
; RELOC: R_68K_GOTPCREL16 dst3 0x0
; RELOC32: R_68K_GOTPCREL16 dst3 0x0
; RELOC-XGOT: R_68K_GOTPCREL16 dst3 0x0
; RELOC-XGOT32: R_68K_GOTPCREL16 dst3 0x0
; FIXUP: fixup A - offset: 2, value: dst3@GOTPCREL, kind: FK_PCRel_2
; FIXUP32: fixup A - offset: 2, value: dst3@GOTPCREL, kind: FK_PCRel_2
; FIXUP-XGOT: fixup A - offset: 2, value: dst3@GOTPCREL, kind: FK_PCRel_2
; FIXUP-XGOT32: fixup A - offset: 2, value: dst3@GOTPCREL, kind: FK_PCRel_2
lea	(dst3@GOTPCREL,%pc), %a5
