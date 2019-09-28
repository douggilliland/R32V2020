screenX:	.LONG	0x0
screenY:	.LONG	0x0
screenAdr:	.LONG	0x0
;
; clearScreen_XGA - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
;

clearScreen_mmXGA:
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

putChar_mmXGA:
	spbp	r8			; write character to peripheral bus
	pull	PC

;
; setScreenLocation_XGA - Set PAR to a particular screen location
; Also sets the variables screenX and screenY
; r8 - screen location
;	d0-d7 = X coordinate
;	d8-d15 = Y coordinate
;

setScreenLocation_mmXGA:
	push	r9
	sr8		r9,r8
	andi	r8,r8,0x00ff
	lix		DAR,screenX.lower
	sdlp	r8					; X location
	sdlp	r9					; Y location
	muli	r9,r9,0x40			; location is Y*63+X
	sdlp	r9					; Y location * 64
	add		PAR,r9,r8
	sdl		PAR					; Y location
	pull	r9
	pull	PC
	
;
; dumpCharSet_xxXGA
;

dumpCharSet_xxXGA:
	lix		r8,0x0
nextCharDump:
	bsr		putChar_mmXGA
	addi	r8,r8,1
	cmpi	r8,0x100
	bne		nextCharDump
	pull 	PC
