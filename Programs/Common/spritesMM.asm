; Sprites handler

spritesStartHere:	.string "Sprites"
currentSpriteX:	.LONG	0x0
currentSpriteY:	.LONG	0x0
spriteMemLoc:	.LONG	0x0

;
; putSprite_mmXGA - Put a sprite character to the screen
; r8 = Sprite to put to screen
; Globals:
;	currentSpriteX, currentSpriteY location of the place to put the character
;

putSprite_mmXGA:
	push	r9
	push	r10
	push	PAR
	push	DAR
	lix		DAR,currentSpriteX.lower
	ldl		r9					; X location
	lix		DAR,currentSpriteY.lower
	ldl		r10					; Y location
	muli	r10,r10,0x40		; 64 column offset
	add		PAR,r10,r9			; PAR points to screen location
	spb		r8					; write character to Display
	lix		DAR,spriteMemLoc.lower
	sdl		PAR
	pull	DAR
	pull	PAR
	pull	r10
	pull	r9
	pull	PC

;
; setSpriteLocation_mmXGA
; Sets the variables currentSpriteX and currentSpriteY in data memory
; r8 - screen location
;	d0-d7 = X coordinate
;	d8-d15 = Y coordinate
;

setSpriteLocation_mmXGA:
	push	DAR
	push	r9
	sr8		r9,r8
	andi	r9,r9,0x00ff		; Y
	andi	r8,r8,0x00ff		; X
	lix		DAR,currentSpriteX.lower
	sdl		r8					; X location
	lix		DAR,currentSpriteY.lower
	sdl		r9					; Y location
	pull	r9
	pull	DAR
	pull	PC
	