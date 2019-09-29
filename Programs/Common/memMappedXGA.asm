screenX:		.LONG	0x0
screenY:		.LONG	0x0
screenAdr:		.LONG	0x0
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

;
; putCharXY_mmXGA - Put a character to the screen at a X,Y location
; r8 = X,Y,Character to put to screen
; 	d16..d23 = position Y
;	d8..d15 = position X
;	d0..d7 = character to write
; Registers used:
;	r8 - character to write (after processing)
;	r9 - X location
;	r10 - Y location 
; Globals:
;	screenX, screenY location of the place to put the sprite character
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
; putChar_mmXGA - Put a character to the screen
; r8 = Character to put to screen
; Globals:
;	screenX, screenY location of the place to put the sprite character
;

putChar_mmXGA:
	push	r9
	push	PAR
	lix		DAR,screenX.lower	; X location
	ldl		r8					
	lix		DAR,screenY.lower	; Y location
	ldl		r9					
	sl8		r9,r9
	add		PAR,r8,r9			; PAR points to screen location
	spb		r8					; write character to Display
	pull	PAR
	pull	r9
	pull	PC

;
; setParToCurrentCharLoc_mmXGA - Sets PAR to the current character location
;

setParToCurrentCharLoc_mmXGA:
	push	r8
	push	r9
	lix		DAR,currentSpriteX.lower
	ldl		r8
	lix		DAR,currentSpriteY.lower
	ldl		r9					; currentSpriteY is the next location
	muli	r9,r9,0x40			; 64 chars wide screen
	add		PAR,r8,r9
	pull	r9
	pull	r8
	pull	PC

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

;
; dumpCharSet_xxXGA
; Loaded to
;	https://github.com/douggilliland/R32V2020/wiki/Memory-Mapped-Display#Extended_Character_Set_Bitmaps
; 

; dumpCharSet_xxXGA:
	; lix		r8,0x0
; nextCharDump:
	; bsr		putChar_mmXGA
	; addi	r8,r8,1
	; cmpi	r8,0x100
	; bne		nextCharDump
	; pull 	PC
