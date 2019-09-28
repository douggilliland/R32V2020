; Read PS/2 keyboard character and put it to the Memory Mapped XGA Screen
; This program requires a build of R32V2020 that has memory mapped video
; Example: R32V2020_Build_V002_A4_CE6_MMVid 

prompt: .string "FakeTris 0.01"

start:
	bsr		clearScreen_mmXGA
	lix		par,0				; start of screen
	lix		dar,prompt.lower	; clear the data memory addr pointer
readDataMemory:
	ldbp	r8					; get the character
	cmpi	r8,0
	beq		doneWithPrompt
	bsr		putChar_mmXGA
	bra		readDataMemory
doneWithPrompt:
	bsr		drawTetrisBorder
loopProg:
	bsr		getChar_PS2
storeToScreen:
	bsr		putChar_mmXGA
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
	bsr		putChar_mmXGA
	lix		r9,0x14				; 20 chars wide
anotherHorizTop:
	lix		r8,0x83				; horizontal line
	bsr		putChar_mmXGA
	subi	r9,r9,1
	bnz		anotherHorizTop
	lix		r8,0xCD				; upper right corner
	bsr		putChar_mmXGA
; vertical left side
	lix		r9,0x1E				; 30 rows high
	lix		r8,0x0114			; location 20,0
	bsr		setScreenLocation_mmXGA	
	lix		r8,0x8C				; vertical line
anotherLeftVert:
	bsr		putChar_mmXGA
	addi	PAR,PAR,0x3F
	subi	r9,r9,1
	bnz		anotherLeftVert
; vertical right side
	lix		r9,0x1E				; 30 rows high
	lix		r8,0x0129			; location 41,1
	bsr		setScreenLocation_mmXGA
	lix		r8,0x8B				; vertical line
anotherLeftVert2:
	bsr		putChar_mmXGA
	addi	PAR,PAR,0x3F
	subi	r9,r9,1
	bnz		anotherLeftVert2
; Draw bottom box
	lix		r8,0x1F14			; location 20,0
	bsr		setScreenLocation_mmXGA
	lix		r8,0xCB				; lower left corner
	bsr		putChar_mmXGA
	lix		r9,0x14				; 20 chars wide
anotherHorizBottom:
	lix		r8,0x84				; horizontal line
	bsr		putChar_mmXGA
	subi	r9,r9,1
	bnz		anotherHorizBottom
	lix		r8,0xCE				; upper right corner
	bsr		putChar_mmXGA
	
	pull	r9
	pull	r8
	pull	PC
	
#include <..\..\common\MemMappedXGA.asm>
#include <..\..\common\ps2.asm>
