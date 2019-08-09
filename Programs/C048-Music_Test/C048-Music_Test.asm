; Music Test
; To make sounds write to 8-bit latch with
; 	Most Significant bit is enable sound
; 	Bottom 7 bits are piano key

notes:	.long 0xABA9A7A9
notes1:	.long 0xABABAB00

;
; Test code
;
	lix		DAR,notes.lower
nextNote:
	ldbp	r8
	bsr		wr7Seg8Dig
	bsr 	setNote
	push	r8
	lix		r8,750			; count for 10 mSec
	bsr		delay_mS		; call delay_ms
	pull	r8
	cmp		r8,r0
	beq		looper1
	lix		r8,0
	bsr 	setNote
;	bsr		enableBuzzer
	lix		r8,25			; count for 100 mSec
	bsr		delay_mS		; call delay_ms
;	bsr		disableBuzzer
	bra		nextNote
looper1:
	lix		r8,0
	bsr 	setNote
loopForever:
	bra		loopForever
	
;
; setNote - Set the note
; pass note in r8
;

setNote:
	push	PAR
	lix		PAR,0x4000
	spb		r8
	pull	PAR
	pull	PC

; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

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
;
; enableBuzzer
;

enableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix		r9,0x0010		; Buzzer Enable line
	lix		PAR,0x2800
	lpl		r8
	or		r8,r8,r9
	spl		r8
	pull	PAR
	pull	r8
	pull	r9
	pull	PC

;
; disableBuzzer
;

disableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix		r9,0xffef		; Buzzer Disable line
	lix		PAR,0x2800
	lpl		r8
	and		r8,r8,r9
	spl		r8
	pull	PAR
	pull	r8
	pull	r9
	pull	PC
	