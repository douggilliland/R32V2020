; SUB Instruction Test
; Test the SUBtract instruction

rsvd:	.long 0x0

;
; Test code
;
	lix		r10,7
	lix		r9,4
	sub		r8,r9,r10
	bsr		wr7Seg8Dig
loopForever:
	bra		loopForever
	
wr7Seg8Dig:
	push	PAR
	lix		PAR,0x3000		; Seven Segment LED lines
	spl		r8				; Write out LED bits
	pull	PAR
	pull	PC

; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r9

delay_mS:
	push	r8
	push	r9
	push	PAR
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_mS
	pull	PAR
	pull	r9
	pull	r8
	pull	PC
