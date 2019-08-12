;
; P001-ANSI-Speed_Test - Test the speed of the ANSI display hardware
;
; Tests include
;	1 - Character write speed (no scroll)
;	2 - Screen clear speed
;	3 - Screen scroll speed
;

prompt:			.string "ANSI Speed Test "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "Syntax error"
runningString:	.string "Running..."
serialOverflow:	.string "Serial port overflow"
;
; Read a line from the UART and parse the line
;

main:
	bsr		clearANSIScreenAndUART
	lix		r8,prompt.lower
	bsr		printLine
	bsr		getLine
	bsr		callTests
	bra		main

;
; getLine - Reads the UART and fills a buffer with the characters received
; r8 received character - Character received from the UART
; r9 is the input buffer length
; r10 used to test the backspace doesn't go past the start of the buffer
; DAR points to lineBuff current character position
;

getLine:
	push	r8
	push	r9
	push	r10
	push	DAR
	lix		DAR,lineBuff.lower	; DAR pointer = start of line buffer
	lix		r9,79				; max number of chars in the line buffer
loopReadLine:
	bsr		waitReadPS2_UART	; Get a character from the PS/2 or UART
	bsr		writeANSI_UART		; Echo character back to the ANSI Display and UART
	cmpi	r8,0x0D				; check if received char was end of line
	beq		gotEOL
	cmpi	r8,0x7F
	beq		gotBackspace
	sdbp	r8
	subi	r9,r9,1
	bnz		loopReadLine		; Next char would overflow
	lix		r8,serialOverflow.lower
	bsr		writeANSI_UART		; Put the character to the screen
	bra		doneHandlingLine
gotEOL:
	lix		r8,0x0A				; Echo line feed after CR
	bsr		writeANSI_UART		; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	sdb		r0					; null at end of line read
	bra		doneHandlingLine
gotBackspace:
	subi	DAR,DAR,1
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

;
; callTests - 
; line is in lineBuff
;	1 - Character write speed
;	2 - Screen fill speed
;	3 - Screen clear speed
;	4 - Screen scroll speed
; Uses r8 for the command
;

callTests:
	push	r8
	lix		r8,lineBuff.lower
	bsr		hexToSevenSeg
; testCharWriteSpeed
	cmpi	r8,0x01
	bne		skipTo2
	bsr		testCharWriteSpeed
	bra		doneTests
; testScreenClearSpeed
skipTo2:
	cmpi	r8,0x02
	bne		skipTo3
	bsr		testScreenClearSpeed
	bra		doneTests
; testScreenScrollSpeed
skipTo3:
	cmpi	r8,0x03
	bne		skipToEnd
	bsr		testScreenScrollSpeed
	bra		doneTests
; testScreenScrollSpeed
skipToEnd:
	push	r8
	lix		r8,syntaxError.lower
	bsr		printString
	pull	r8
doneTests:
	lix		r8,2000
	bsr		delay_mS
	pull	r8
	pull	PC
	
;
; testCharWriteSpeed - Test Char Write Speed
; Use microsecond counter - 0x3801 is microsecond counter
; Measured 0xAAB = 2731 uS for 1999 chars or 1.36 uS/char or 731K chars/sec
;

testCharWriteSpeed:
	push	PAR
	push	r8
	push	r9
	push	r10
	bsr		clearANSIScreen
	lix		r8,500		; Delay for 500 mS to give the screen time to clear
	bsr		delay_mS
	lix		r10,1999	; print 1999 characters
	lix		PAR,0x3801	; microsecond counter
	lpl		r9			; read the counter
	lix		r8,0x31		; char to print is '1'
anotherCharTest:
	bsr		putCharToANSIScreen
	subi	r10,r10,1
	bnz		anotherCharTest
	lix		PAR,0x3801	; microsecond counter
	lpl		r8			; read the counter
	sub		r8,r9,r8	; How many microseconds to clear screen?
	bsr		wr7Seg8Dig	; put number of microseconds out to 7 seg display
	pull	r10
	pull	r9
	pull	r8
	pull	PAR
	pull	PC
	
;
; testScreenFillSpeed - Test Screen Fill Speed
;

testScreenFillSpeed:
	push	PAR
	push	r8
	
	pull	r8
	pull	PAR
	pull	PC
	
;
; testScreenClearSpeed - Test Screen Clear Speed
; 1000 screen clears take 0x1894E = 100,686 uS
;	100.7 uS to clear the screen
;

testScreenClearSpeed:
	push	PAR
	push	r8
	push	r9
	push	r10
	lix		r8,500		; Delay for 500 mS to give the screen time to clear
	bsr		delay_mS
	lix		r10,1000	; clear screen 1000 times
	lix		PAR,0x3801	; microsecond counter
	lpl		r9			; read the counter
clearAgain:
	bsr		clearANSIScreen
	subi	r10,r10,1
	bnz		clearAgain
	lix		PAR,0x3801	; microsecond counter
	lpl		r8			; read the counter
	sub		r8,r9,r8	; How many microseconds to clear screen?
	bsr		wr7Seg8Dig	; put number of microseconds out to 7 seg display
	pull	r10
	pull	r9
	pull	r8
	pull	PAR
	pull	PC
	
;
; testScreenScrollSpeed - Test Screen Scroll Speed
; 1000 lines in 0x0F69 secs = 3,945 uS
;	 3.945 uS to scroll screen
;

testScreenScrollSpeed:
	push	PAR
	push	r8
	push	r9
	push	r10
	lix		r8,0x0A				; Line Feed
	lix		r10,26
scrollAgain:
	bsr		putCharToANSIScreen
	subi	r10,r10,1
	bnz		scrollAgain
	lix		r8,500		; Delay for 500 mS to give the screen time to scroll
	bsr		delay_mS
	lix		r8,0x0A				; Line Feed
	lix		r10,1000
	lix		PAR,0x3801	; microsecond counter
	lpl		r9			; read the counter
anotherScroll:
	bsr		putCharToANSIScreen
	subi	r10,r10,1
	bnz		anotherScroll
	lix		PAR,0x3801	; microsecond counter
	lpl		r8			; read the counter
	sub		r8,r9,r8	; How many microseconds to clear screen?
	bsr		wr7Seg8Dig	; put number of microseconds out to 7 seg display
	pull	r10
	pull	r9
	pull	r8
	pull	PAR
	pull	PC
	
; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

wr7Seg8Dig:
	push	PAR
	push	r8
	lix		PAR,0x3000		; Seven Segment LED lines
	spl		r8				; Write out LED bits
	pull	r8
	pull	PAR
	pull	PC
	
;
; readSws
; switches value returned in r8
; switches are high when pressed
; Switches d0-d2 are the pushbutton switches (inverted in FPGA hardware)
; 	Pushbutton switches are debounced
; Switches d3-10 are the DIP switches (not inverted)
;

readSws:
	push	PAR
	lix		PAR,0x2000	; Switches address
	lpl		r8			; Read switches into r9
	andi	r8,r8,0xfff	; just the switches
	pull	PAR
	pull	PC
	

;
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
	addi	DAR,r8,0		; Address of lineBuff (passed into this routine)
	ldbp	r8				; read the first character of the line
	bsr		asciiToHex
	or		r9,r9,r8
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	;add		DAR,DAR,ONE
	ldb		r8				; read the second character of the line
	bsr		asciiToHex
	or		r9,r9,r8
	lix		PAR,0x3000		; seven segment display
	spl		r9
	addi	r8,r9,0
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
	bgt		a2h_Error
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
	bsr		printString
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
; printString - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString:
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextChar:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr			; done if null
	bsr		writeANSI_UART		; write out the character
	bra		nextChar
donePrStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; printLine - Print a screen to the current screen position with CRLF at the end
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printLine:
	push	r8					; save r8
	push	DAR
	addi	DAR,r8,0x0			; set the start of the string
nextChar2:
	ldbp	r8					; get the character
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr2			; done if null
	bsr		writeANSI_UART	; write out the character
	bra		nextChar2
donePrStr2:
	bsr		newLine
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; newLine - Print out a newline (CR-LF)
;

newLine:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		writeANSI_UART	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		writeANSI_UART		; Echo character back to the UART
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
; clearANSIScreenAndUART - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearANSIScreen:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		putCharToANSIScreen
	lix		r8,0x5b			; [
	bsr		putCharToANSIScreen
	lix		r8,0x32			; 2
	bsr		putCharToANSIScreen
	lix		r8,0x4A			; J
	bsr		putCharToANSIScreen
	pull	r8
	pull	PC				; rts

;
; putCharToANSIScreen - Put a character to the screen
; Character to put to screen is in r8
;

putCharToANSIScreen:
	push	r9
	push	PAR
	lix		PAR,0x0		; ANSI Screen Status (UART style)
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitScreenTxStat
	lix 	PAR,0x1		; ANSI Screen Data (UART style)
	spl		r8			; echo the character
	pull	PAR
	pull	r9
	pull	PC
	
;
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r8,r9 (restores r8, r9 when returning)
;

delay_mS:
	push	r8
	push	r9
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_mS
	pull	r9
	pull	r8
	pull	PC

;
; getPS2Char
; returns character received in r8
; Routine uses r8,r9 (restores r8, r9 when returning)
;

getPS2Char:
	push	r8
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
	pull	r8
	pull	PC

;
; waitReadPS2_UART
; wait for character from either 
;	the PS/2 keyboard and UART serial
; r8 = read character
;

waitReadPS2_UART:
	push	PAR
checkCharFromPS2:
	lix		PAR,0x1000			; PS/2 Status
	lpl		r8					; Read Status
	andi	r8,r8,0x1			; =1 when char received
	bez 	checkUARTStat
	lix 	PAR,0x0800			; PS/2 Data
	lpl		r8
	bra		gotPS2Char
checkUARTStat:
	lix		PAR,0x1800			; UART Status
	lpl		r8					; Read Status
	andi 	r8,r8,0x1			; =1 when char received
	bez 	checkCharFromPS2
	lix 	PAR,0x1801			; UART Data
	lpl		r8
gotPS2Char:
	pull	PAR
	pull	PC
	
; checkForCharAndDiscard - Check for a character in UART or PS/2
; Discard the character received
; return whether char was present (1) or no char was present (0)

checkForCharAndDiscard:
	push	PAR
	lix		PAR,0x1000		; PS/2 Status
	lpl		r8				; Read Status
	andi	r8,r8,0x1		; =1 when char received
	bez 	checkUARTStat2
	lix 	PAR,0x0800		; PS/2 Data
	lpl		r8				; throw away char
	lix		r8,0x1
	bra		gotChar
checkUARTStat2:
	lix		PAR,0x1800		; UART Status
	lpl		r8				; Read Status
	andi 	r8,r8,0x1		; =1 when char received
	bez 	noCharReceived
	lix 	PAR,0x1801		; UART Data
	lpl		r8
	lix		r8,1
	bra		gotChar
noCharReceived:
	lix		r8,0
gotChar:
	pull	PAR
	pull	PC

;
; writeANSI_UART
; write out a character to both 
;	the ANSI screen and the UART
;

writeANSI_UART:
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	pull	PC
