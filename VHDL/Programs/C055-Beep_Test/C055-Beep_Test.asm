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
	pss	r8
	pss	PAR
	lix	PAR,0x4000
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
	lix	PAR,0x2800
	lpl	r8
	ors	r8,r8,r9
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
	lix	PAR,0x2800
	lpl	r8
	ars	r8,r8,r9
	spl	r8
	pus	PAR
	pus	r8
	pus	r9
	pus	PC
	
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Uses routine uses r9

delay_mS:
	pss	r9
	lix	PAR,0x3802		; address of the mSec counter
	lpl	r9				; read the peripheral counter into r9
	ads	r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl	r9				; check the elapsed time counter
	cmp	r8,r9
	blt	loop_delay_mS
	pus	r9
	pus	r7
