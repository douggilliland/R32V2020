; Tetris game
; This program requires a build of R32V2020 that has memory mapped video
; Example: R32V2020_Build_V002_A4_CE6_MMVid 

prompt: .string "FakeTris 0.01"
; Tetris shapes from
;	https://raw.githubusercontent.com/OneLoneCoder/videos/master/OneLoneCoder_Tetris.cpp
tetrisShape0:	.string "..X...X...X...X."
tetrisShape1:	.string "..X..XX...X....."
tetrisShape2:	.string ".....XX..XX....."
tetrisShape3:	.string "..X..XX..X......"
tetrisShape4:	.string ".X...XX...X....."
tetrisShape5:	.string ".X...X...XX....."
tetrisShape16:	.string "..X...X..XX....."
currentCharLocn:	.long 0x0

start:
	bsr		clearScreen_mmXGA
	lix		par,0				; start of screen
	lix		dar,prompt.lower	; clear the data memory addr pointer
readDataMemory:
	ldbp	r8					; get the character
	cmpi	r8,0
	beq		doneWithPrompt
	bsr		putCharIncr_mmXGA
	bra		readDataMemory
doneWithPrompt:
	bsr		drawTetrisBorder
putUpSprite:
	lix		r8,0x011F			; location 20,0
	bsr		setScreenLocation_mmXGA
	lix		r8,0xE2				; circle character (for now)
	bsr		putChar_mmXGA
loopProg:
	bsr		checkGetStat_PS2
	andi	r8,r8,0x5F			; upper to lower
	cmpi	r8,0x41				; 'a'
	beq		moveCharLeft
	cmpi	r8,0x44				; 'd'
	beq		moveCharRight
	bra		loopProg			; not an 'a' or 'd'
moveCharLeft:
	bsr		setParToCurrentCharLoc_mmXGA
	lix		r8,0x20				; write out a space
	bsr		putChar_mmXGA
	subi	PAR,PAR,1			; go right
	lix		r8,0xE2				; circle character (for now)
	lix		DAR,screenX.lower
	ldl		r9
	subi	r9,r9,1
	sdl		r9
	bra		storeToScreen
moveCharRight:
	bsr		setParToCurrentCharLoc_mmXGA
	lix		r8,0x20				; write out a space
	bsr		putChar_mmXGA
	addi	PAR,PAR,1			; got left
	lix		r8,0xE2				; circle character (for now)
	lix		DAR,screenX.lower
	ldl		r9
	addi	r9,r9,1
	sdl		r9
storeToScreen:
	bsr		putChar_mmXGA
	lix		r8,200				; wait for a bit
	bsr		delay_mS
	bra		loopProg

;
; drawBorder - draw the border around the FakeTis window
;

drawTetrisBorder:
	push	r8
	push	r9
	lix		r8,0x0014			; location 20,0
	bsr		setScreenLocation_mmXGA
	lix		r8,0xCC				; upper left corner
	bsr		putCharIncr_mmXGA
	lix		r9,0x14				; 20 chars wide
anotherHorizTop:
	lix		r8,0x83				; horizontal line
	bsr		putCharIncr_mmXGA
	subi	r9,r9,1
	bnz		anotherHorizTop
	lix		r8,0xCD				; upper right corner
	bsr		putCharIncr_mmXGA
; vertical left side
	lix		r9,0x1E				; 30 rows high
	lix		r8,0x0114			; location 20,0
	bsr		setScreenLocation_mmXGA	
	lix		r8,0x8C				; vertical line
anotherLeftVert:
	bsr		putCharIncr_mmXGA
	addi	PAR,PAR,0x3F
	subi	r9,r9,1
	bnz		anotherLeftVert
; vertical right side
	lix		r9,0x1E				; 30 rows high
	lix		r8,0x0129			; location 41,1
	bsr		setScreenLocation_mmXGA
	lix		r8,0x8B				; vertical line
anotherLeftVert2:
	bsr		putCharIncr_mmXGA
	addi	PAR,PAR,0x3F
	subi	r9,r9,1
	bnz		anotherLeftVert2
; Draw bottom box
	lix		r8,0x1F14			; location 20,0
	bsr		setScreenLocation_mmXGA
	lix		r8,0xCB				; lower left corner
	bsr		putCharIncr_mmXGA
	lix		r9,0x14				; 20 chars wide
anotherHorizBottom:
	lix		r8,0x84				; horizontal line
	bsr		putCharIncr_mmXGA
	subi	r9,r9,1
	bnz		anotherHorizBottom
	lix		r8,0xCE				; upper right corner
	bsr		putCharIncr_mmXGA
	
	pull	r9
	pull	r8
	pull	PC
	
#include <..\..\common\MemMappedXGA.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\timers.asm>
