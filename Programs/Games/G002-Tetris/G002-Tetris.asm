; Tetris game
; This program requires a build of R32V2020 that has memory mapped video
; Example: R32V2020_Build_V002_A4_CE6_MMVid 

title: .string "FakeTris 0.01"
; Tetris shapes from
;	https://raw.githubusercontent.com/OneLoneCoder/videos/master/OneLoneCoder_Tetris.cpp
tetrisShape0:	.string "..X...X...X...X."
tetrisShape1:	.string "..X..XX...X....."
tetrisShape2:	.string ".....XX..XX....."
tetrisShape3:	.string "..X..XX..X......"
tetrisShape4:	.string ".X...XX...X....."
tetrisShape5:	.string ".X...X...XX....."
tetrisShape16:	.string "..X...X..XX....."

start:
	bsr		clearScreen_mmXGA
printTitle:
	lix		par,0				; start of screen
	lix		dar,title.lower	; clear the data memory addr pointer
readDataMemory:
	ldbp	r8					; get the character
	cmpi	r8,0
	beq		doneWithPrompt
	bsr		putCharIncrPAR_mmXGA
	bra		readDataMemory
doneWithPrompt:
; Draw the border of the playfield
	bsr		drawPlayfieldBorder
; Draw the first sprite
	lix		r8,0x011F			; location 31,1
	bsr		setSpriteLocation_mmXGA
	lix		r8,0xE2				; circle char for now
	bsr		putSprite_mmXGA		; put sprite on screen
loopProg:
	bsr		checkGetStat_PS2
	andi	r8,r8,0x5F			; upper to lower
	cmpi	r8,0x41				; 'a'
	beq		moveSpriteLeft
	cmpi	r8,0x44				; 'd'
	beq		moveSpriteRight
	bra		loopProg			; not an 'a' or 'd'
moveSpriteLeft:
	lix		DAR,currentSpriteX.lower
	ldl		r9
	cmpi	r9,0x15				; check to see if already at left edge
	beq		loopProg
	lix		r8,0x20				; write out a space to erase sprite
	bsr		putSprite_mmXGA
	subi	PAR,PAR,1			; go left
	lix		r8,0xE2				; circle character (for now)
	ldl		r9
	subi	r9,r9,1
	sdl		r9
	bra		storeToScreen
moveSpriteRight:
	lix		DAR,currentSpriteX.lower
	ldl		r9
	cmpi	r9,0x28				; check to see if already at edge
	beq		loopProg
	lix		r8,0x20				; write out a space to erase sprite
	bsr		putSprite_mmXGA
	addi	PAR,PAR,1			; go right
	lix		r8,0xE2				; circle character (for now)
	ldl		r9
	addi	r9,r9,1
	sdl		r9
storeToScreen:
	bsr		putSprite_mmXGA
	lix		r8,100				; wait for a bit
	bsr		delay_mS
	bra		loopProg

;
; drawBorder - draw the border around the FakeTis window
;

drawPlayfieldBorder:
	push	r8
	push	r9
; Draw upper left corner
	lix		r8,0x0014			; location 20,0
	sl8		r8,r8				; shift over the address
	addi	r8,r8,0xCC			; upper left corner chars
	bsr		putCharXY_mmXGA		; put upper left corner on screen
	addi	PAR,PAR,1			; get ready to draw horizontal line
; Draw top horizontal line
	lix		r9,0x14				; 20 chars wide top line
anotherHorizTop:
	lix		r8,0x83				; horizontal line
	spbp	r8
	subi	r9,r9,1
	bnz		anotherHorizTop
; Draw upper right corner
	lix		r8,0xCD				; upper right corner
	spb		r8
; Draw vertical left side
	lix		r9,0x1E				; 30 rows high
	lix		r8,0x0114			; location 20,1
	sl8		r8,r8
	addi	r8,r8,0x8C			; vertical line left side
	bsr		putCharXY_mmXGA		; put first vertical bar to the screen
anotherLeftVert:
	spb		r8					; write character to the screen
	addi	PAR,PAR,0x40
	subi	r9,r9,1
	bnz		anotherLeftVert
; Draw vertical right side
	lix		r9,0x1E				; 30 rows high
	lix		r8,0x0129			; location 41,1
	sl8		r8,r8
	addi	r8,r8,0x8B			; vertical line right side
	bsr		putCharXY_mmXGA		; put first vertical bar to the screen
anotherLeftVert2:
	spb		r8
	addi	PAR,PAR,0x40
	subi	r9,r9,1
	bnz		anotherLeftVert2
; Draw left bottom corner
	lix		r8,0x1F14			; location 20,31
	sl8		r8,r8				; shift over the address
	addi	r8,r8,0xCB			; lower left corner
	bsr		putCharXY_mmXGA		; put bottom left corner on screen
	addi	PAR,PAR,1			; get ready to draw horizontal line
	lix		r9,0x14				; 20 chars wide
anotherHorizBottom:
	lix		r8,0x84				; horizontal line
	spbp	r8
	subi	r9,r9,1
	bnz		anotherHorizBottom
	lix		r8,0xCE				; upper right corner
	spbp	r8
	
	pull	r9
	pull	r8
	pull	PC
	
#include <..\..\common\MemMappedXGA.asm>
#include <..\..\common\spritesMM.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\timers.asm>
