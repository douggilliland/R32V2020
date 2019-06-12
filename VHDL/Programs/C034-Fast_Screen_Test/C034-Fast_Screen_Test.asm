; Fast Screen test
start:
	add	SAR,r0,r0	; Initialize Stack Pointer (used for return address)
	sss	r7			; push the call address -1
	bra	clearScreen
	sss	r7			; push the call address -1
	bra	fastFillScreen
stopHere:
	nop
	bra	start

; fastFillScreen - Fills the screen with test pattern
fastFillScreen:
	add par,r0,r0	; start of screen character memory
	lix	r8,0x0		; start with 0x0
	lix r9,0x800	; loopCount	(1K minus 1)
	lix	r10,0xff
looperFast:
	spb r8			; put the character to the screen
	add	par,par,r1	; Increment screen pointer
	add	r8,r8,r1	; increment the character to the screen
	and	r8,r8,r10	; make sure 8-bits only
	add r9,r9,r2	; decrement character counter
	bnz	looperFast	; loop until complete
	lss	r9			; load calling address
	add	r9,r9,r1	; skip the call
	add	r7,r9,r1	; jump to the next address (rts)

;
; clearScreen - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Return address (-1) is on the stack - need to increment before return
;

clearScreen:
	add par,r0,r0	; start of screen character memory
	lix	r8,0x0020	; fill with spaces
	lix r9,0x7FE	; loopCount	(1K minus 1)
looper:
	spb r8			; put the character to the screen
	add	par,par,r1	; Increment screen pointer
	add r9,r9,r2	; decrement character counter
	bne	looper		; loop until complete
	lss	r9			; load calling address
	add	r9,r9,r1	; skip the call
	add	r7,r9,r1	; jump to the next address (rts)

;
; putChar - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putChar:
	spb	r8			; write character to peripheral bus
	add	par,par,r1	; Go to the next character position	
	lss	r9			; load calling address
	add	r9,r9,r1	; inc by 1 to skip the call
	add	r7,r9,r1	; jump to the next address (rts)
	