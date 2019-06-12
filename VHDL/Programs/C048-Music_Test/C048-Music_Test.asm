; Music Test
secsCount:	.long 0x0

;
; Test code
;
	lix	r9,0x100		; 8-bit notes
	lix	r8,0			; first note is 0
	bsr setNote
	bsr	enableBuzzer
nextNote:
	pss	r8				; save the counter
	lix	r8,10			; count for 100 mSec
	bsr	delay_mS		; call delay_ms
	pus	r8				; restore r8
	add	r8,r8,ONE
	bsr setNote
	cmp	r8,r9
	bne	nextNote
	bsr	disableBuzzer
loopForever:
	bra	loopForever

; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Uses routine uses r9

delay_mS:
	pss	r9 
	pss	r8
	pss	PAR
	lix	r9,50000	; Count for 50,000 counts = 1 mSec count
	mul	r8,r8,r9	; total number of clocks to count
	lix	PAR,0x3800	; address of the elapsed time counter
	lpl	r9			; read the peripheral counter into r9
	add	r8,r9,r8	; terminal counter to wait until is in r8
loop_delay_mS:
	lpl	r9			; check the elapsed time counter
	cmp	r9,r8
	bgt	loop_delay_mS
	pus	PAR
	pus	r8
	pus	r9
	pus	PC

;
; setNote - Set the note
; pass note in r8
;

setNote:
	pss	r8
	pss	PAR
	liu	PAR,0x0000
	lil	PAR,0x4000
	spl	r8
	pus	PAR
	pus	r8
	pus	PC

;
; enableBuzzer
;

enableBuzzer:
	pss	r9
	pss	r8
	pss	PAR
	lix	r9,0x0010		; Buzzer Enable line
	liu	PAR,0x0000
	lil	PAR,0x2800
	lpl	r8
	or	r8,r8,r9
	spl	r8
	pus	PAR
	pus	r8
	pus	r9
	pus	PC

;
; disableBuzzer
;

disableBuzzer:
	pss	r9
	pss	r8
	pss	PAR
	lix	r9,0xffef		; Buzzer Disable line
	liu	PAR,0x0000
	lil	PAR,0x2800
	lpl	r8
	and	r8,r8,r9
	spl	r8
	pus	PAR
	pus	r8
	pus	r9
	pus	PC
