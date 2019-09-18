;
; P002-Random_Number_Test - Test our random number generator
;

banner:			.string "Random_Number_Test"
keyToStart:		.string "Any key to start"
guessString:	.string "Guess a hex number (0x00-0xFF) : "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "*** Bad number error (at a2h_Error) ***"
tooHigh:		.string "Your guess was too high"
tooLow:			.string "Your guess was too low"
gotItRight:		.string "Congratulations, you got it right"
numberOfGuesses: .string "Number of Guesses : "

;
; Test the random number generator
;

main:
	bsr		clearScreen_ANSI_UART	; clear both screens
	bsr		newLine_ANSI_UART		; UART does not start at the top of the screen
	lix		r8,banner.lower			; print program banner
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART		; start 2 lines down
waitForKeyHit:
	bsr		checkForCharAndDiscard	; returns 1 when key was pressed
	cmpi	r8,0x00					; wait for keypress
	beq		waitForKeyHit
;	bsr		newLine_ANSI_UART		; extra LF to move down
runAgain:
	bsr		randomNumber_8bits		; pull random number from counter
	bsr		printShort_ANSI_UART
	bsr		newLine_ANSI_UART		; start 2 lines down
	bra		waitForKeyHit
;
; randomNumber_8bits - Generate a random number - 8-bit value
; 0x3803 is the Processor Instruction Cycle counter
;

randomNumber_8bits:
	push	PAR
	lix		PAR,0x3803
	lpl		r8
	sr1		r8,r8
	sr1		r8,r8
	andi	r8,r8,0xff
	pull	PAR
	pull	PC

#include <..\..\common\ANSI_UART_io.asm>
#include <..\..\common\switches.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\timers.asm>
#include <..\..\common\buzzer.asm>
#include <..\..\common\music.asm>
#include <..\..\common\ANSIScreen.asm>
#include <..\..\common\UART.asm>
#include <..\..\common\bufferedIO.asm>
