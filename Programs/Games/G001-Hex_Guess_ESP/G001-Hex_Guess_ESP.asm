;
; G001-Hex_Guess_ESP - Guess a number
; Number hex 0x00-0xff
;

banner:			.string "G001-Hex_Guess_ESP"
keyToStart:		.string "Hit any key to start"
guessString:	.string "Guess a hex number (0x00-0xFF) : "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "*** Bad number error (at a2h_Error) ***"
tooHigh:		.string "Your guess was too high"
tooLow:			.string "Your guess was too low"
gotItRight:		.string "Congratulations, you got it right"
numberOfGuesses: .string "Number of Guesses : "

;
; Read a line from the UART and parse the line
; r14 = number of tries
; r15 = random number
;

main:
	bsr		clearScreen_ANSI_UART	; clear both screens
	bsr		newLine_ANSI_UART		; UART does not start at the top of the screen
	lix		r8,banner.lower			; print program banner
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART		; start 2 lines down
	bsr		newLine_ANSI_UART
	lix		r8,keyToStart.lower		; wait for keypress to ensure random number
	bsr		printString_ANSI_UART
	lix		r14,0					; number of tries
waitForKeyHit:
	bsr		checkForCharAndDiscard	; returns 1 when key was pressed
	cmpi	r8,0x00					; wait for keypress
	beq		waitForKeyHit
	bsr		newLine_ANSI_UART		; extra LF to move down
runAgain:
	bsr		randomNumber_8bits		; pull random number from counter
	addi	r15,r8,0				; r15 has the random number
notRightCode:
	addi	r14,r14,1				; increment number of tries
	lix		r8,guessString.lower
	bsr		printString_ANSI_UART
	bsr		readToLineBuffer		; read in the line
	; count add length check here
	lix		r8,lineBuff.lower
	bsr		hexToSevenSeg_ANSI_UART			; convert input string to hex pair (single 8 bit value)
	andi	r8,r8,0xff				; extra mask (probably no longer needed)
	cmp		r8,r15					; check if guess is correct
	beq		guessedIt				; guessed correctly
	blt		tooHighCase				; guess was too high
tooLowCase:
	lix		r8,tooLow.lower			; not equal or high means too low
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	bsr		newLine_ANSI_UART
	bra		notRightCode			; try again
tooHighCase:
	lix		r8,tooHigh.lower		; guess was too high
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	bsr		newLine_ANSI_UART
	bra		notRightCode			; try again
guessedIt:
	lix		r8,gotItRight.lower		; guess was correct
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,numberOfGuesses.lower ; print number of guesses
	bsr		printString_ANSI_UART
	addi	r8,r14,0				; printLongANSI_UART needs value in r8
	bsr		printByte_ANSI_UART
	bsr		newLine_ANSI_UART
endStop:
	bsr		newLine_ANSI_UART
	lix		r8,keyToStart.lower		; wait for keypress to ensure random number
	bsr		printString_ANSI_UART
	lix		r14,0					; number of tries
waitForKeyHit2:
	bsr		checkForCharAndDiscard	; returns 1 when key was pressed
	cmpi	r8,0x00					; wait for keypress
	beq		waitForKeyHit2
	bsr		newLine_ANSI_UART
	bra		runAgain
;
; randomNumber_8bits - Generate a random number - 8-bit value
; 0x3803 is the Processor instruction counter
; The number relies on the delay in the user hitting the key at a random time
;

randomNumber_8bits:
	push	PAR
	lix		PAR,0x3803
	lpl		r8
	andi	r8,r8,0xff
	pull	PAR
	pull	PC
	
; common libraries go here at the end so they get assembled in after the application

#include <..\..\common\bufferedIO.asm>
#include <..\..\common\switches.asm>
#include <..\..\common\uart.asm>
#include <..\..\common\ANSIScreen.asm>
#include <..\..\common\buzzer.asm>
#include <..\..\common\music.asm>
#include <..\..\common\timers.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\ANSI_UART_io.asm>
