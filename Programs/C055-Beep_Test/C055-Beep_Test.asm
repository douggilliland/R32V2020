; Beep Test
helloString:	.string "R32V2020 >"

;
; Test code
;

	lix	r8,0			; first note is 0
	bsr setNote
	bsr	enableBuzzer
	lix	r8,1000			; count for 1 Sec
	bsr	delay_mS		; call delay_ms
	bsr	disableBuzzer
loopForever:
	bra	loopForever

;
; setNote - Set the note
; pass note in r8
;

setNote:
	push	r8
	push	PAR
	lix	PAR,0x4000
	spl	r8
	pull	PAR
	pull	r8
	pull	PC

;
; enableBuzzer
;

enableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix	r9,0x0010		; Buzzer Enable line
	lix	PAR,0x2800
	lpl	r8
	or	r8,r8,r9
	spl	r8
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
	lix	r9,0xffef		; Buzzer Disable line
	lix	PAR,0x2800
	lpl	r8
	and	r8,r8,r9
	spl	r8
	pull	PAR
	pull	r8
	pull	r9
	pull	PC
	
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Uses routine uses r9

delay_mS:
	push	r9
	lix	PAR,0x3802		; address of the mSec counter
	lpl	r9				; read the peripheral counter into r9
	add	r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl	r9				; check the elapsed time counter
	cmp	r8,r9
	blt	loop_delay_mS
	pull	r9
	pull	r7
