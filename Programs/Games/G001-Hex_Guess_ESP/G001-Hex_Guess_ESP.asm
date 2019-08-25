;
; G001-Hex_Guess_ESP - Guess a number
; Number hex 0x00-0xff
;

banner:			.string "G001-Hex_Guess_ESP"
keyToStart:		.string "Any key to start"
guessString:	.string "Guess a hex number (0x00-0xFF) : "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "*** Bad number error ***"
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
	bsr		clearANSIScreenAndUART	; clear both screens
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
	bsr		hexToSevenSeg			; convert input string to hex pair (single 8 bit value)
	andi	r8,r8,0xff				; extra mask (probably no longer needed)
	cmp		r8,r15					; check if guess is correct
	beq		guessedIt				; guessed correctly
	blt		tooHighCase				; guess was too high
tooLowCase:
	lix		r8,tooLow.lower			; not equal or high means too low
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	bra		notRightCode			; try again
tooHighCase:
	lix		r8,tooHigh.lower		; guess was too high
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	bra		notRightCode			; try again
guessedIt:
	lix		r8,gotItRight.lower		; guess was correct
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,numberOfGuesses.lower ; print number of guesses
	bsr		printString_ANSI_UART
	addi	r8,r14,0				; printLong needs value in r8
	bsr		printLong
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
; 0x3800 is the Oscillator clock counter
;

randomNumber_8bits:
	push	PAR
	lix		PAR,0x3800
	lpl		r8
	andi	r8,r8,0xff
	pull	PAR
	pull	PC

;
; readToLineBuffer - Reads the UART and fills a buffer with the characters received
; r8 received character - Character received from the UART
; r9 is the input buffer length
; r10 used to test the backspace doesn't go past the start of the buffer
; DAR points to lineBuff current character position
;

readToLineBuffer:
	push	r8
	push	r9
	push	r10
	push	DAR
	lix		DAR,lineBuff.lower	; DAR pointer = start of line buffer
	lix		r9,79				; number of chars in the line buffer
loopReadLine:
	bsr		waitReadPS2_UART		; Get a character from the UART
	bsr		writeANSI_UART		; Echo character back to the UART
	cmpi	r8,0x0D				; check if received char was end of line
	beq		gotEOL
	cmpi	r8,0x7F
	beq		gotBackspace
	sdbp	r8
	add		r9,r9,MINUS1
	bnz		loopReadLine		; Next char would overflow
	; tbd add code for line too long	
gotEOL:
	lix		r8,0x0A				; Echo line feed after CR
	bsr		writeANSI_UART	; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	sdb		r0					; null at end of line read
	bra		doneHandlingLine
gotBackspace:
	add		DAR,DAR,MINUS1
	lix		r10,lineBuff.lower	; r10 pointer = start of line buffer
	cmp		r10,DAR
	bgt		loopReadLine
	addi	DAR,r10,0
	bra		loopReadLine
doneHandlingLine:
	pull	DAR
	pull	r10
	pull	r9
	pull	r8
	pull	PC

readSws:
	push	PAR
	lix		PAR,0x2000	; Switches address
	lpl		r8			; Read switches into r9
	andi	r8,r8,0xfff	; just the switches
	pull	PAR
	pull	PC
	
;
; printANSICode - Send the ANSI Escape Sequence
; r8 - points to the string
; This routine supplies the ESC
;

printANSICode:
	push	r8
	push	r8
	lix		r8,0x1b			; ESC
	bsr		putCharToANSIScreen
	pull	r8
	bsr		printString_ANSI
	pull	r8
	pull	PC

;
; printLong
; r8 contains the long value to print
;

printLong:
	push	r8
	push	r9
	push	r10
	push	r8				; temporarily save r8
	lix		r8,0x30
	bsr		writeANSI_UART
	lix		r8,0x78
	bsr		writeANSI_UART
	pull	r8				; restore r8
	lix		r9,8			; loop counter
doNextPrintLong:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal
	subi	r9,r9,1
	bnz		doNextPrintLong
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; printHexVal
;

printHexVal:
	push	r8
	andi	r8,r8,0xf
	cmpi	r8,9
	blt		printHexLetter
	addi	r8,r8,0x30
	bsr		writeANSI_UART
	bra		donePrintHexVal
printHexLetter:
	addi	r8,r8,0x37		; 'A' - 10
	bsr		writeANSI_UART
donePrintHexVal:
	pull	r8
	pull	PC

; hexToSevenSeg - Convert a two ASCII digit value into a hex byte
; Passed: r8 points to the start of the hex string
; Returned: r8 contains the hex value of the string
; Put the byte to the Seven Segment Display
;

hexToSevenSeg:
	push	r9
	push	DAR
	push	PAR
	lix		r9,0
	add		DAR,r8,ZERO		; Address of lineBuff (passed into this routine)
	ldbp	r8
	bsr		asciiToHex
	andi	r8,r8,0xf
	or		r9,r9,r8
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	ldb		r8
	bsr		asciiToHex
	andi	r8,r8,0xf
	or		r9,r9,r8
	lix		PAR,0x3000		; seven segment display
	spl		r9
	add		r8,r9,ZERO
	pull	PAR
	pull	DAR
	pull	r9
	pull	PC

;
; asciiToHex - Convert a single ASCII hex character into a nibble
; Make conversion case insensitive
; Character to convert is passed in r8
;	'0' = 0x30
;	'9' = 0x39
;	'A' = 0x41
;	'F' = 0x46
;	'a' = 0x61
;	'f' = 0x66
; Result is returned in r8
;	0x0-0xf - Legal Values
;	'DEAD' - Not hex character
;

asciiToHex:
	cmpi	r8,0x66			; past 'f'
	blt		a2h_Error
	cmpi	r8,0x30			; below '0'
	bgt		a2h_Error
	cmpi	r8,0x3A			; '0' - '9'
	bgt		gotDigit
	cmpi	r8,0x41			; ':' - '@'
	bgt		a2h_Error
	cmpi	r8,0x47			; 'A' - 'F'
	blt		gotUpperLetter
	cmpi	r8,0x61			; 'G' - 'tick'
	blt		a2h_Error
; Lower case letter
	subi	r8,r8,0x57
	bra		doneConvA2H
; number 0-9
gotDigit:
	subi	r8,r8,0x30
	bra		doneConvA2H
; A-F
gotUpperLetter:
	subi	r8,r8,0x37
	bra		doneConvA2H
a2h_Error:
	lix		r8,syntaxError.lower
	bsr		newLine_ANSI_UART
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,0xDEAD
doneConvA2H:
	pull	PC

;
; waitGetCharFromUART
; returns character received in r8
; function is blocking until a character is received from the UART
;

waitGetCharFromUART:
	push	PAR
	lix		PAR,0x1800	; UART Status
waitUartRxStat:
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x1
	bez 	waitUartRxStat
	lix 	PAR,0x1801
	lpl		r8
	pull	PAR
	pull	PC

;
; putCharToUART - Put a character to the UART
; passed character in r8 is sent out the UART
;

putCharToUART:
	push	r9
	push	PAR
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitUartTxStat
	lix 	PAR,0x1801
	spl		r8			; echo the character
	pull	PAR
	pull	r9
	pull	PC
	
;
; printString_ANSI_UART - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString_ANSI_UART:
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextChar:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr			; done if null
	bsr		writeANSI_UART	; write out the character
	bra		nextChar
donePrStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; printString_ANSI - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString_ANSI:
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextCharANSI:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrANSIStr		; done if null
	bsr		putCharToANSIScreen	; write out the character
	bra		nextCharANSI
donePrANSIStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; printLinebuffer_ANSI_UART - Print a screen to the current screen position with CRLF at the end
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printLinebuffer_ANSI_UART:
	push	r8					; save r8
	push	DAR
	addi	DAR,r8,0x0			; set the start of the string
nextChar2:
	ldbp	r8					; get the character
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr2			; done if null
	bsr		printString_ANSI	; write out the character
	bra		nextChar2
donePrStr2:
	bsr		newLine_ANSI_UART
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; newLine_ANSI_UART - Print out a newLine_ANSI_UART (CR-LF)
;

newLine_ANSI_UART:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		writeANSI_UART	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		writeANSI_UART		; Echo character back to the UART
	pull	r8
	pull	PC

;
; newLine_ANSI - Print out a newLine_ANSI (CR-LF)
;

newLine_ANSI:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		putCharToANSIScreen	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		putCharToANSIScreen	; Echo character back to the UART
	pull	r8
	pull	PC

;
; clearANSIScreenAndUART - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearANSIScreenAndUART:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		writeANSI_UART
	lix		r8,0x5b			; [
	bsr		writeANSI_UART
	lix		r8,0x32			; 2
	bsr		writeANSI_UART
	lix		r8,0x4A			; J
	bsr		writeANSI_UART
	pull	r8
	pull	PC				; rts

;
; putCharToANSIScreen - Put a character to the screen
; Character to put to screen is in r8
;

putCharToANSIScreen:
	push	r9
	push	PAR
	lix		PAR,0x0		; UART Status
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitScreenTxStat
	lix 	PAR,0x1
	spl		r8			; echo the character
	pull	PAR
	pull	r9
	pull	PC
	
;
; makeBuzz - Make the buzzer buzz
;

makeBuzz:
	push	r8
	lix		r8,0			; first note is 0
	bsr 	setNote
	bsr		enableBuzzer
	lix		r8,250			; count for 1 Sec
	bsr		delay_mS		; call delay_ms
	bsr		disableBuzzer
	pull	r8
	pull	PC

;
; setNote - Set the note
; pass note in r8
; returns note
;

setNote:
	push	PAR
	lix		PAR,0x4000
	spl		r8
	pull	PAR
	pull	PC

;
; enableBuzzer
;

enableBuzzer:
	push	r8
	push	PAR
	lix		PAR,0x2800
	lpl		r8
	ori		r8,r8,0x10
	spl		r8
	pull	PAR
	pull	r8
	pull	PC

;
; disableBuzzer
;

disableBuzzer:
	push	r8
	push	PAR
	lix		r9,0xffef		; Buzzer Disable line
	lix		PAR,0x2800
	lpl		r8
	andi	r8,r8,0xffef
	spl		r8
	pull	PAR
	pull	r8
	pull	PC
	
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r9

delay_mS:
	push	r9
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_mS
	pull	r9
	pull	PC

;
; getPS2Char
; returns character received in r8
;

getPS2Char:
	push	r9
	push	PAR
	lix		PAR,0x1000	; PS/2 Status
waitPS2RxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x1
	bez 	waitPS2RxStat
getCharFromPS2:
	lix 	PAR,0x0800
	lpl		r8
	lix		PAR,0x1000	; PS/2 Status
whilePS2RxStat:
	pull	PAR
	pull	r9
	pull	PC

; waitReadPS2_UART
; wait for character from either 
;	the PS/2 keyboard and UART serial
; r8 = read character

waitReadPS2_UART:
	push	PAR
checkCharFromPS2:
	lix		PAR,0x1000	; PS/2 Status
	lpl		r8			; Read Status
	andi	r8,r8,0x1	; =1 when char received
	bez 	checkUARTStat
	lix 	PAR,0x0800	; PS/2 Data
	lpl		r8
	bra		gotPS2Char
checkUARTStat:
	lix		PAR,0x1800	; UART Status
	lpl		r8			; Read Status
	andi 	r8,r8,0x1	; =1 when char received
	bez 	checkCharFromPS2
	lix 	PAR,0x1801	; UART Data
	lpl		r8
gotPS2Char:
	pull	PAR
	pull	PC
	
; checkForCharAndDiscard - Check for a character in UART or PS/2
; Discard the character received
; return whether char was present (1) or no char was present (0)

checkForCharAndDiscard:
	push	PAR
	lix		PAR,0x1000	; PS/2 Status
	lpl		r8			; Read Status
	andi	r8,r8,0x1	; =1 when char received
	bez 	checkUARTStat2
	lix 	PAR,0x0800	; PS/2 Data
	lpl		r8			; throw away char
	lix		r8,0x1
	bra		gotChar
checkUARTStat2:
	lix		PAR,0x1800	; UART Status
	lpl		r8			; Read Status
	andi 	r8,r8,0x1	; =1 when char received
	bez 	noCharReceived
	lix 	PAR,0x1801	; UART Data
	lpl		r8
	lix		r8,1
	bra		gotChar
noCharReceived:
	lix		r8,0
gotChar:
	pull	PAR
	pull	PC

; writeANSI_UART
; write out a character to both 
;	the ANSI screen and the UART

writeANSI_UART:
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	pull	PC
