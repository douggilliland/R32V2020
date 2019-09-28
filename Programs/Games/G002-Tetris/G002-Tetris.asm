; Read PS/2 keyboard character and put it to the Memory Mapped XGA Screen
; This program requires a build of R32V2020 that has memory mapped video
; Example: R32V2020_Build_V002_A4_CE6_MMVid 

prompt: .string "R32V2020"

start:
	bsr		clearScreen_XGA
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
	
#include <..\..\common\MemMappedXGA.asm>
#include <..\..\common\ps2.asm>
