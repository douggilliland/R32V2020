screenX:	.long	0
screenY:	.long	0

;
; clearScreen_XGA - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
;

clearScreen_XGA:
	push	PAR
	push	r9
	push	r8
	lix 	par,0x0000	; start of screen character memory
	lix		r8,0x20		; fill with spaces
	lix 	r9,0x800	; loopCount	(2K)
looper:
	spbp 	r8			; put the character to the screen
	subi 	r9,r9,1		; decrement character counter
	bnz		looper		; loop until complete
	pull	r8
	pull	r9
	pull	PAR
	pull	PC

;
; putChar_MemMapXGA - Put a character to the screen and increment the address
; r8 = Character to put to screen
; PAR = set to the current screen location
;

putChar_MemMapXGA:
	spbp	r8			; write character to peripheral bus
	pull	PC

;
; setScreenLocation_XGA - Set PAR to a particular screen location
; r8 - screen location
;	d0-d7 = X coordinate
;	d8-d15 = Y coordinate
;

setScreenLocation_XGA:
	push	r8
	push	r9
	lix		DAR,screenX.lower
	ldlp	r8					; X location
	ldl		r9					; Y location
	muli	PAR,r9,80
	add		PAR,PAR,r8
	pull	r9
	pull	r8
	pull	PC
	