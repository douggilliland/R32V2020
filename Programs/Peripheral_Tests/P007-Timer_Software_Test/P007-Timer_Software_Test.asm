; Made the SevenSegLEDs update every 1 second
; Non-blocking, polled timer

versionString:	.string "R32V2020 > "		; here to prevent an empty data file
start:
	lix		r8,1000
	bsr		setTimer_mS
	lix		r9,0
incCounter:
	addi	r8,r9,0
	bsr 	wr7Seg8Dig
waitUntilDone:
	bsr		checkForCountReached_mS
	cmpi	r8,0x1
	bne		waitUntilDone
	addi	r9,r9,1
	bra		incCounter

#include <..\..\common\timers.asm>
#include <..\..\common\SevenSegLEDs.asm>
