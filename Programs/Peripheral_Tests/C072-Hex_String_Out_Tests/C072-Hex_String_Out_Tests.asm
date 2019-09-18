;
; C072-Hex_String_Out_Tests - Send out a hex long as a string of 8 hex digitsRead
;

prompt:			.string "R32V2020> "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
lineEnd:		.long 0x00
syntaxError:	.string "Syntax error... "

;
; Read UART character and put it to the ANSI VGA Display
; Turn the first two characters into a hex 8-bit value
;

main:
	bsr		clearScreen_ANSI
	lix		r8,prompt.lower
	bsr		printString_ANSI
	liu		r8,0xDEAD
	lil		r8,0xBABA
	bsr		printLong_ANSI
	liu		r8,0x1234
	lil		r8,0xABCD
	bsr		printLong_ANSI
	hcf

#include <..\..\common\ps2.asm>
#include <..\..\common\uart.asm>
#include <..\..\common\ANSI_uart_io.asm>
#include <..\..\common\timers.asm>
#include <..\..\common\SevenSegLEDs.asm>
#include <..\..\common\buzzer.asm>
#include <..\..\common\music.asm>
#include <..\..\common\ANSIScreen.asm>
