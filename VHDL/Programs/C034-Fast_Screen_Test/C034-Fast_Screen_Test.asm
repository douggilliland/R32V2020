; Fast Screen test
start:
	ads	SAR,r0,r0	; Initialize Stack Pointer (used for return address)
	sss	r7			; push the call address -1
	bra	clearScreen
	sss	r7			; push the call address -1
	bra	fastFillScreen
	bra	start

; fastFillScreen - Fills the screen with test pattern
fastFillScreen:
	ads par,r0,r0	; start of screen character memory
	ads r8,r0,r0	; clear the character
	lil	r8,0x0000	; fill with spaces
	ads r9,r0,r0	; screen count
	lil r9,0x7FE	; loopCount	(1K minus 1)
	ads	r10,r0,r0	; character mask
	lil	r10,0xff
looperFast:
	spb r8			; put the character to the screen
	ads	par,par,r1	; Increment screen pointer
	ads r9,r9,r2	; decrement character counter
	ads	r8,r8,r1	; increment the character to the screen
	ars	r8,r8,r10
	bne	looperFast		; loop until complete
	lss	r9			; load calling address
	ads	r9,r9,r1	; skip the call
	ads	r7,r9,r1	; jump to the next address (rts)

;
; clearScreen - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Return address (-1) is on the stack - need to increment before return
;

clearScreen:
	ads par,r0,r0	; start of screen character memory
	ads r8,r0,r0	; clear the character
	lil	r8,0x0020	; fill with spaces
	ads r9,r0,r0	; screen count
	lil r9,0x7FE	; loopCount	(1K minus 1)
looper:
	spb r8			; put the character to the screen
	ads	par,par,r1	; Increment screen pointer
	ads r9,r9,r2	; decrement character counter
	bne	looper		; loop until complete
	lss	r9			; load calling address
	ads	r9,r9,r1	; skip the call
	ads	r7,r9,r1	; jump to the next address (rts)

;
; putChar - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putChar:
	spb	r8			; write character to peripheral bus
	ads	par,par,r1	; Go to the next character position	
	lss	r9			; load calling address
	ads	r9,r9,r1	; inc by 1 to skip the call
	ads	r7,r9,r1	; jump to the next address (rts)
	