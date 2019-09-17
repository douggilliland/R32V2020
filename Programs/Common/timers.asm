;--------------------------------------------------------------------
; timers.asm

; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r9

delay_mS:
	push	r9
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_mS
	pull	r9
	pull	PC

;	
; delay_uS - delay for the number of uSecs
; pass mSec delay in r8
; Uses routine uses r9 (saved and restored)
;

delay_uS:
	push	r9
	push	PAR
	lix		PAR,0x3801		; address of the uSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_uS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_uS
	pull	PAR
	pull	r9
	pull	PC

