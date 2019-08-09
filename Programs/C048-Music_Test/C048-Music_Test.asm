; Music Test
; To make sounds write to 8-bit latch with
; 	Most Significant bit is enable sound
; 	Bottom 7 bits are piano key

secsCount:	.long 0x0

;
; Test code
;
	lix		r9,216			; 8-bit notes (0-87)
	lix		r8,0x80			; first note is 0
;	bsr	enableBuzzer
nextNote:
	push	r8				; save the counter
	lix		r8,250			; count for 10 mSec
	bsr		delay_mS		; call delay_ms
	pull	r8				; restore r8
	bsr		wr7Seg8Dig
	bsr 	setNote
	add		r8,r8,ONE
	cmp		r8,r9
	bne		nextNote
	lix		r8,0x0
	bsr 	setNote
loopForever:
	bra		loopForever
	
; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

wr7Seg8Dig:
	push	PAR
	push	r8
	lix		PAR,0x3000		; Seven Segment LED lines
	spl		r8				; Write out LED bits
	pull	r8
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

;
; setNote - Set the note
; pass note in r8
;

setNote:
	push	r8
	push	PAR
	lix		PAR,0x4000
	spl		r8
	pull	PAR
	pull	r8
	pull	PC
