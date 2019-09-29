; Tetris game
; This program requires a build of R32V2020 that has memory mapped video
; Example: R32V2020_Build_V002_A4_CE6_MMVid 

title: 	.string "FakeTris 0.01"
score:	.string "Score : "
scoreValue:	.long	0x0

start:
	bsr		clearScreen_mmXGA
; Print the title
	lix		r8,0x0000			; Upper left corner of screen
	bsr		setScreenCharLoc_mmXGA
	lix		r8,title.lower		; clear the data memory addr pointer
	bsr		printString_mmXGA
; Print the score string
	lix		r8,0x0200			; Two lines down on left side of screen
	bsr		setScreenCharLoc_mmXGA
	lix		r8,score.lower		; clear the data memory addr pointer
	bsr		printString_mmXGA
; Print the initial score value
	bsr		printScore_tetris
; Draw the border of the playfield
	bsr		drawPlayfieldBorder
; Get the new tetris char
	bsr		pickNewTetrisSymbol
; Draw the first sprite
	lix		r8,0x011f			; location 31,1
	bsr		setSpriteLocation_mmXGA
	lix		r8,0xE2				; circle char for now
	bsr		putSprite_mmXGA		; put sprite on screen
	lix		r8,1000
	bra		setTimer_mS
	lix		DAR,scoreValue.lower
	lix		r8,0x0
	sdl		r8
loopProg:
	bsr		checkForCountReached_mS
	cmpi	r8,1
	beq		newScore
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

sot:			.string "SoT"
randoNumber:	.long	0x0
currentTetrisSprite:	.string	"UUUUUUUUUUUUUUUU"
; Tetris shapes drawn from
;	https://raw.githubusercontent.com/OneLoneCoder/videos/master/OneLoneCoder_Tetris.cpp
tetrisShape0:	.string "..X...X...X...X."
tetrisShape1:	.string "..X..XX...X....."
tetrisShape2:	.string ".....XX..XX....."
tetrisShape3:	.string "..X..XX..X......"
tetrisShape4:	.string ".X...XX...X....."
tetrisShape5:	.string ".X...X...XX....."
tetrisShape6:	.string "..X...X..XX....."
eot:			.string "EnT"

;
; pickNewTetrisSymbol
; Pick a new random tetris symbol (0-6)
; Nothing passed
; Nothing returned
; Uses a bunch of registers
; Globals
;	currentTetrisSprite - populated with 16 chars representing tetris char
;

pickNewTetrisSymbol:
	push	r8
	push	r9
	push	r10
	push	r11
	push	DAR
getNewRando:
	bsr		randomNumber_8bits
	andi	r8,r8,0x07					; random from 0-7
	cmpi	r8,0x07
	beq		getNewRando
	muli	r8,r8,0x10					; offset to tetrisChar (in longs)
	lix		r9,tetrisShape0.lower		; Base tetris shape
	add		r8,r8,r9					; r8 points to the start of the selected tetris shape
	lix		DAR,randoNumber.lower		; save the offset to the tetris char selected by random number
	sdl		r8
	lix		r11,0x10						; copy 16 bytes
	lix		r9,currentTetrisSprite.lower	; r9 points to the destination
; copy the tetris shape that was selected to currentTetrisSprite
loopNextTetrisChar:
	addi	DAR,r8,0x0
	ldbp	r10							; r10 is the current 4 characters
	addi	r8,DAR,0					; save updated src pointer to next 4 bytes into r8
	addi	DAR,r9,0x0
	sdbp	r10
	addi	r9,DAR,0					; save updated dst pointer to next 4 bytes into r9
	subi	r11,r11,0x1
	bnz		loopNextTetrisChar
doneMovingTetrisChar:
	pull	DAR
	pull	r11
	pull	r10
	pull	r9
	pull	r8
	pull	PC

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
	
;
; printScore_tetris
;

printScore_tetris:
	push	DAR
	push	r8
	lix		r8,0x0208			; print the score at 8,2
	bsr		setScreenCharLoc_mmXGA
	lix		DAR,scoreValue.lower
	ldl		r8
	bsr		printLong_mmXGA
	pull	r8
	pull	DAR
	pull	PC
	
;
; printScore_tetris
;

newScore:
	push	DAR
	push	r8
	lix		DAR,scoreValue.lower
	ldl		r8
	addi	r8,r8,1
	sdl		r8
	bsr		printScore_tetris
	pull	r8
	pull	DAR
	pull	PC
	
#include <..\..\common\MemMappedXGA.asm>
#include <..\..\common\spritesMM.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\timers.asm>
