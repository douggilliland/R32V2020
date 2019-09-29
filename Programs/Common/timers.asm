;--------------------------------------------------------------------
; timers.asm

longTimeWait:	.long 0x0
longTimeDelta:	.long 0x0

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
; setTimer_mS - sets a software timer in mSec from the current mSec time
; Non-blocking routine
; Wrap around problem at 2^32 mS (every 4.3 million seconds = 49 days)
; Needs to be checked from checkForCountReached_mS routine
; longTimeWait - global that contains the terminal count time
; r8 is the number of mS until the counter expires
;

setTimer_mS:
	push	r8
	push	r9
	push	DAR
	push	PAR
	lix		DAR,longTimeDelta.lower
	sdl		r8				; keep the delta time - might use it again
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
	lix		DAR,longTimeWait.lower
	sdl		r8
	pull	PAR
	pull	DAR
	pull	r9
	pull	r8
	pull	PC

;
; checkForCountReached_mS
; Presumptively reloads the terminal count for the next cycle
;	Can be over-riden by calling setTimer_mS again
; Returns
; r8 - 0 = Counter is not yet expired
;      1 = Counter is expired
;

checkForCountReached_mS:
	push	r9
	push	DAR
	push	PAR
	lix		DAR,longTimeWait.lower
	ldl		r8
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	cmp		r9,r8
	bgt		returnTimerNotYet
	lix		DAR,longTimeDelta.lower
	ldl		r8				;  See, we did use the delta time again
	add		r8,r8,r9
	lix		DAR,longTimeWait.lower
	sdl		r8
	lix		r8,0x1
	bra		timerDone
returnTimerNotYet:
	lix		r8,0x0
timerDone:
	pull	PAR
	pull	DAR
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

