;
; C071-Hex_String_Tests - Read a line from the UART serial input
; Convert the character pair at the start of the string to hex byte
; Display the hex code on the Seven Segment Display
;

prompt:			.string "R32V2020> "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
lineEnd:		.long 0x00
syntaxError:	.string "Syntax error"

;
; Read UART character and put it to the ANSI VGA Display
;

main:
	bsr		clearScreen_ANSI
	lix		r8,prompt.lower
	bsr		printString_ANSI
loopRead:
	bsr		readToLineBuffer
	lix		r8,lineBuff.lower	; DAR pointer = start of line buffer
	bsr		hexToSevenSeg		; 
	bra		loopRead
	
#include <..\..\common\uart.asm>
#include <..\..\common\ANSIScreen.asm>
#include <..\..\common\ANSI_UART_io.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\timers.asm>
#include <..\..\common\SevenSegLEDs.asm>
#include <..\..\common\buzzer.asm>
#include <..\..\common\music.asm>
#include <..\..\common\bufferedIO.asm>
