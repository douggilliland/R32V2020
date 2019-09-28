; Read PS/2 keyboard character and put it to the Memory Mapped XGA Screen
; This program requires a build of R32V2020 that has memory mapped video
; Example: R32V2020_Build_V002_A4_CE6_MMVid

prompt: .string "R32V2020"

start:
	bsr		clearScreen
	lix		par,0				; start of screen
	lix		dar,prompt.lower	; clear the data memory addr pointer
readDataMemory:
	ldbp	r8					; get the long again
	cmpi	r8,0
	beq		doneWithPrompt
	bsr		putChar_MemMapXGA
	bra		readDataMemory
doneWithPrompt:
	bsr		getChar_PS2
storeToScreen:
	bsr		putChar_MemMapXGA
	bra		doneWithPrompt
;
; clearScreen - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Return address (-1) is on the stack - need to increment before return
;

clearScreen:
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
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putChar_MemMapXGA:
	spbp	r8			; write character to peripheral bus
	pull	PC
	
#include <..\..\common\ps2.asm>
