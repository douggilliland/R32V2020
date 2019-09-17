;--------------------------------------------------------------------
; RingLEDs.asm

; putValueToRingLEDs
; passed r8 - value to send to the ring LEDs

putValueToRingLEDs:
	push	PAR
	push	r8
	lix		PAR,0x4800		; Ring LED address
	spl		r8				; Write out LED bits
	pull	r8
	pull	PAR
	pull	PC
