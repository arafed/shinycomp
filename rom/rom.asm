;;  	Memory map
;; 	$0000 - $7FFF	RAM
;;  	$e000 - $FDFF	ROM

.setcpu "65816"
.feature string_escapes

	.segment "CODE"
	.asciiz "ANDREW"

reset:
	clc
	xce
	rep #$30

loop:
	jmp loop

.segment "RODATA"

.segment "IRQB_VEC"
	.word reset
.segment "RESET_VEC"
	.word reset
.segment "NMIB_VEC"
	.word reset
.segment "ABORT_VEC"
	.word reset
.segment "BRK_VEC"
	.word reset
.segment "COP_VEC"
	.word reset

