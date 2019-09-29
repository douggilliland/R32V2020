; Routines that handle output to Memory Mapped XGA display
; Character set
;	https://github.com/douggilliland/R32V2020/wiki/Memory-Mapped-Display#Extended_Character_Set_Bitmaps

memMappedXGAConstants:	.string "MMX"
screenX:		.LONG	0x0
screenY:		.LONG	0x0
;screenAdr:		.LONG	0x0

;
; printString_mmXGA - Print a string to the screen
; String will wrap around to next line if it goes past the right side
; Minimal protection against going off the scree (just won't print)
; r8 points to the string in data memory
; Globals
;	screenX, screenY - print the first character here
;

printString_mmXGA:
	push	r8					; Not required but keeps string pointer the same on return
	push	DAR
	addi	DAR,r8,0x0			; Set DAR to start of the string
	bsr		setParToCurrentCharLoc_mmXGA
printStringGetChar:
	ldbp	r8					; get the character
	cmpi	r8,0
	beq		donePrintingString
	cmpi	PAR,0x0800			; next character would be off the screen so don't print it
	beq		donePrintingString
	spbp	r8
	bra		printStringGetChar
donePrintingString:
	pull	DAR
	pull	r8
	pull	PC

;
; printLong_mmXGA - Print a long to the screen
; r8 - value to print to the screen
;

printLong_mmXGA:
	push	r8
	push	r9
	push	r8				; temporarily save r8
	lix		r8,0x30			; print 0x
	bsr		putChar_mmXGA
	lix		r8,0x78
	bsr		putChar_mmXGA
	pull	r8				; restore r8
	lix		r9,8			; loop counter
doNextprintLong_mmXGA:		; get nibble
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_mmXGA
	subi	r9,r9,1
	bnz		doNextprintLong_mmXGA
	pull	r9
	pull	r8
	pull	PC
	
;
; printHexVal_mmXGA
;

printHexVal_mmXGA:
	push	r8
	andi	r8,r8,0xf
	cmpi	r8,9
	blt		printHexLetter_mmXGA
	addi	r8,r8,0x30
	bsr		putChar_mmXGA
	bra		donePrintHexVal_mmXGA
printHexLetter_mmXGA:
	addi	r8,r8,0x37		; 'A' - 10
	bsr		putChar_mmXGA
donePrintHexVal_mmXGA:
	pull	r8
	pull	PC
	
;
; putChar_mmXGA - Put a character to the screen
; r8 = Character to put to screen
; Globals:
;	screenX, screenY location of the place to put the character
;

putChar_mmXGA:
	push	r9
	push	r10
	push	PAR
	push	DAR
	lix		DAR,screenX.lower	; X location
	ldl		r9
	lix		DAR,screenY.lower	; Y location
	ldl		r10
	muli	r10,r10,0x40
	add		PAR,r10,r9			; PAR points to screen location
	spb		r8					; write character to Display
	lix		DAR,screenX.lower	; X location
	ldl		r9
	addi	r9,r9,1
	; should compare to see if end of line and increment y taking care to not overflow bottom of screen
	sdl		r9
	pull	DAR
	pull	PAR
	pull	r10
	pull	r9
	pull	PC

;
; setParToCurrentCharLoc_mmXGA - Sets PAR to the current character location
; Globals
;	screenX, screenY - print the first character here
;

setParToCurrentCharLoc_mmXGA:
	push	r8
	push	r9
	push	DAR
	lix		DAR,screenX.lower
	ldl		r8
	lix		DAR,screenY.lower
	ldl		r9					; currentSpriteY is the next location
	muli	r9,r9,0x40			; 64 chars wide screen
	add		PAR,r8,r9
	pull	DAR
	pull	r9
	pull	r8
	pull	PC

;
; setScreenCharLoc_mmXGA
; r8 - location
; 	d8..d15 = position Y
;	d8..d7 = position X
;

setScreenCharLoc_mmXGA:
	push	r8
	push	r9
	push	DAR
	sr8		r9,r8
	andi	r9,r9,0x0ff
	andi	r8,r8,0x0ff
	lix		DAR,screenX.lower
	sdl		r8
	lix		DAR,screenY.lower
	sdl		r9
	pull	DAR
	pull	r9
	pull	r8
	pull	PC	

;
; putCharXY_mmXGA - Put a single character to the Memory Mapped XGA screen at a X,Y location
; r8 = X,Y,Character to put to screen
; 	d16..d23 = position Y
;	d8..d15 = position X
;	d0..d7 = character to write
; Registers used:
;	r8 - character to write (after processing)
;	r9 - X location
;	r10 - Y location 
; Globals:
;	screenX, screenY location of the place to put the character
; Leaves PAR at character location
;

putCharXY_mmXGA:
	push	r10
	push	r9
;	push	PAR
	sr8		r9,r8				; r9 has the X location
	andi	r8,r8,0xff			; mask off address bits leaving character
	sr8		r10,r9				; r10 has the Y location
	andi	r10,r10,0xff		; mask off any extra bits
	andi	r9,r9,0xff			; mask off any extra bits
	muli	PAR,r10,0x40
	add		PAR,PAR,r9
	spb		r8					; write character to Display
;	pull	PAR
	pull	r9
	pull	r10
	pull	PC

;
; putCharIncrPAR_mmXGA - Put a character to the screen and increment PAR
; Useful for filling line with stuff
; r8 = Character to put to screen
; PAR = set to the current screen location
;

putCharIncrPAR_mmXGA:
	spbp	r8			; write character to peripheral bus
	pull	PC

;
; clearScreen_mmXGA - "Clear" the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Performance:
;	Loop writes 4 locations in 6 instructions
;	80 nS/instruction * 6 instructions = 480 nS
;	512 times through loop
;	245.76 uS screen clear time
;

clearScreen_mmXGA:
	push	PAR
	push	r9
	push	r8
	lix 	par,0x0000	; start of screen character memory
	lix		r8,0x20		; fill with spaces
	lix 	r9,0x200	; loopCount	(2K)
looper:
	spbp 	r8			; put the character to the screen
	spbp 	r8			; put the character to the screen
	spbp 	r8			; put the character to the screen
	spbp 	r8			; put the character to the screen
	subi 	r9,r9,1		; decrement character counter
	bnz		looper		; loop until complete
	pull	r8
	pull	r9
	pull	PAR
	pull	PC
