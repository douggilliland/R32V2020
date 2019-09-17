;--------------------------------------------------------------------
; buzzer.asm

;
; makeBuzz - Make the buzzer buzz
;

makeBuzz:
	push	r8
	lix		r8,0			; first note is 0
	bsr 	setNote
	bsr		enableBuzzer
	lix		r8,250			; count for 1 Sec
	bsr		delay_mS		; call delay_ms
	bsr		disableBuzzer
	pull	r8
	pull	PC
;
; enableBuzzer
;

enableBuzzer:
	push	r8
	push	PAR
	lix		PAR,0x2800
	lpl		r8
	ori		r8,r8,0x10
	spl		r8
	pull	PAR
	pull	r8
	pull	PC

;
; disableBuzzer
;

disableBuzzer:
	push	r8
	push	PAR
	lix		r9,0xffef		; Buzzer Disable line
	lix		PAR,0x2800
	lpl		r8
	andi	r8,r8,0xffef
	spl		r8
	pull	PAR
	pull	r8
	pull	PC
	
