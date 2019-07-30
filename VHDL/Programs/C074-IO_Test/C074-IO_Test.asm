;
; C074-IO_Test - Read a line from the UART serial input
; Echo line to the serial port and to the screen
; Parse the line
;

prompt:			.string "R32V2020> "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "Syntax error"
runningString:	.string "Running..."
menuItem_01:	.string "01-Ring LED Test      "
menuItem_02:	.string "02-7 Segment LED Test "
menuItem_03:	.string "03-Pushbutton Test    "
menuItem_04:	.string "04-DIP Switch Test    "
menuItem_05:	.string "05-ANSI Screen Test   "
menuItem_06:	.string "06-Serial Port Test   "
menuItem_07:	.string "07-MCP23008 I2C Test  "
menuItem_08:	.string "08-MCP4231 SPI Test   "
menuItem_09:	.string "09-PS/2 Keyboard Test "

;
; Read a line from the UART and parse the line
;

main:
	bsr		clearScreen
	bsr		printMenu
	bsr		getLine
	bsr		parseLine
	bra		main

;
; printMenu - Print the menu
;

printMenu:
	push	r8
	lix		r8,menuItem_01.lower
	bsr		printString
	lix		r8,menuItem_02.lower
	bsr		printString
	lix		r8,menuItem_03.lower
	bsr		printLine
	lix		r8,menuItem_04.lower
	bsr		printString
	lix		r8,menuItem_05.lower
	bsr		printString
	lix		r8,menuItem_06.lower
	bsr		printLine
	lix		r8,menuItem_07.lower
	bsr		printString
	lix		r8,menuItem_08.lower
	bsr		printLine
	lix		r8,menuItem_09.lower
	bsr		printLine
	lix		r8,prompt.lower
	bsr		printString
	pull	r8
	pull	PC

;
; getLine - Reads the UART and fills a buffer with the characters received
; r8 received character - Character received from the UART
; r9 is constant - ENTER key on keyboard
; r10 is the input buffer length
; r11 is the BACK key on keyboard
; r12 used to test the backspace doesn't go past the start of the buffer
; DAR points to lineBuff current character position
;

getLine:
	push	r8
	push	r9
	push	r10
	push	r11
	push	r12
	push	DAR
	lix		DAR,lineBuff.lower	; DAR pointer = start of line buffer
	lix		r11,0x7F			; BACK key - rubout
	lix		r10,79				; number of chars in the line buffer
	lix		r9,0x0D				; ENTER key - ends the line
loopReadLine:
	bsr		waitGetCharFromUART	; Get a character from the UART
	bsr		putCharToANSIScreen	; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	cmp		r8,r9				; check if received char was end of line
	beq		gotEOL
	cmp		r8,r11
	beq		gotBackspace
	sdb		r8
	add		DAR,DAR,ONE			; increment to next long in buffer
	add		r10,r10,MINUS1
	bnz		loopReadLine		; Next char would overflow
	; tbd add code for line too long	
gotEOL:
	lix		r8,0x0A				; Echo line feed after CR
	bsr		putCharToANSIScreen	; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	sdb		r0					; null at end of line read
	bra		doneHandlingLine
gotBackspace:
	add		DAR,DAR,MINUS1
	lix		r12,lineBuff.lower	; r12 pointer = start of line buffer
	cmp		r12,DAR
	bgt		loopReadLine
	add		DAR,r12,r0
	bra		loopReadLine
doneHandlingLine:
	pull	DAR
	pull	r12
	pull	r11
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; parseLine - 
; line is in lineBuff
;

parseLine:
	push	r8
	push	r9
	push	DAR
	lix		r8,lineBuff.lower
	bsr		hexToSevenSeg
; Check to see if the command is 0x01
	lix		r9,0x01
	cmp		r8,r9
	bne		skipTo2
	bsr		testRoutine1
	bra		doneTests
; Check to see if the command is 0x02
skipTo2:
	lix		r9,0x02
	cmp		r8,r9
	bne		skipTo3
	bsr		testRoutine2
	bra		doneTests
; Check to see if the command is 0x03
skipTo3:
	lix		r9,0x03
	cmp		r8,r9
	bne		skipTo4
	bsr		testRoutine3
	bra		doneTests
; Check to see if the command is 0x04
skipTo4:
	lix		r9,0x04
	cmp		r8,r9
	bne		skipTo5
	bsr		testRoutine4
	bra		doneTests
; Check to see if the command is 0x05
skipTo5:
	lix		r9,0x05
	cmp		r8,r9
	bne		skipTo6
	bsr		testRoutine5
	bra		doneTests
skipTo6:
	lix		r9,0x06
	cmp		r8,r9
	bne		skipTo7
	bsr		testRoutine6
	bra		doneTests
skipTo7:
	lix		r9,0x07
	cmp		r8,r9
	bne		skipTo8
	bsr		testRoutine7
	bra		doneTests
skipTo8:
	lix		r9,0x08
	cmp		r8,r9
	bne		skipTo9
	bsr		testRoutine8
	bra		doneTests
skipTo9:
	lix		r9,0x09
	cmp		r8,r9
	bne		skipToA
	bsr		testRoutine9
	bra		doneTests
skipToA:
	push	r8
	lix		r8,syntaxError.lower
	bsr		printString
	pull	r8
doneTests:
	lix		r8,2000
	bsr		delay_mS
	pull	DAR
	pull	r9
	pull	r8
	pull	PC
	
; Test Ring LEDs

testRoutine1:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_01.lower
	bsr		printLine
	lix		r9,0x1000			; ring has been circled
reload:
	lix		r8,1
loopLEDRing:
	bsr		putValueToRingLEDs	; put the switches to the 7 Segment LED
	push	r8
	lix		r8,250				; wait for 1 second
	bsr		delay_mS
	pull	r8
	sl1		r8,r8
	cmp		r8,r9
	bne		loopLEDRing
	;bra		reload
	lix		r8,0
	bsr		putValueToRingLEDs	; put the switches to the 7 Segment LED
	pull	r9
	pull	r8
	pull	PC
	
; putValueToRingLEDs
; passed r8 - value to send to the ring LEDs

putValueToRingLEDs:
	push	PAR
	push	r8
	lix		PAR,0x4800		; Ring LED address
	spl		r8				; Write out LED bits
	pull	r8
	pull	PAR
	pull	PC

testRoutine2:
	push	r8
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_02.lower
	bsr		printLine
	liu		r8,0x1234
	lil		r8,0x5678
	bsr		wr7Seg8Dig
	lix		r8,2000
	bsr		delay_mS
	liu		r8,0xABCD
	lil		r8,0xEF12
	bsr		wr7Seg8Dig
	lix		r8,2000
	bsr		delay_mS
	lix		r8,0x0
	bsr		wr7Seg8Dig
	pull	r8
	pull	PC
	
; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

wr7Seg8Dig:
	push	PAR
	push	r8
	liu		PAR,0x0000
	lil		PAR,0x3000		; Seven Segment LED lines
	spl		r8				; Write out LED bits
	pull	r8
	pull	PAR
	pull	PC
	
; Pushbutton Test
testRoutine3:
	push	r8
	push	r9
	push	r10
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_03.lower
	bsr		printLine
	lix		r10,0x0
loopSwRead:
	bsr		readSws		; returns switches and pushbuttons in r8
	lix		r9,0x7
	and		r8,r8,r9
	lix		r9,0x30
	add		r8,r8,r9
	cmp		r8,r10
	beq		loopSwRead
	add		r10,r8,r0
	bsr		putCharToANSIScreen
	bsr		newLine
	lix		r8,250
	bsr		delay_mS
	bra		loopSwRead
	pull	r10
	pull	r9
	pull	r8
	pull	PC
	
;
; readSws
; switches value returned in r8
; switches are high when pressed
; Switches d0-d2 are the pushbutton switches (inverted)
; 	Pushbutton switches are debounced
; Switches d3-10 are the DIP switches (not inverted)
;

readSws:
	push	PAR
	push	r9
	lix		r9,0x7
	lix		PAR,0x2000	; Switches address
	lpl		r8			; Read switches into r9
	xor		r8,r8,r9
	pull	r9
	pull	PAR
	pull	PC
	
testRoutine4:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_04.lower
	bsr		printLine
	lix		r10,0x0
loopSwRead2:
	bsr		readSws		; returns switches and pushbuttons in r8
	sr1		r8,r8
	sr1		r8,r8
	sr1		r8,r8
	sr1		r8,r8
	lix		r9,0xff
	and		r8,r8,r9
	cmp		r8,r10
	beq		loopSwRead2
	add		r10,r8,r0
	bsr		wr7Seg8Dig
;	bsr		newLine
	lix		r8,250
	bsr		delay_mS
	bra		loopSwRead2
	pull	PC
	
testRoutine5:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_05.lower
	bsr		printLine
	pull	PC
	
testRoutine6:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_06.lower
	bsr		printLine
	pull	PC
	
testRoutine7:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_07.lower
	bsr		printLine
	pull	PC
	
testRoutine8:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_08.lower
	bsr		printLine
	pull	PC
	
testRoutine9:
	lix		r8,runningString.lower
	bsr		printString
	lix		r8,menuItem_09.lower
	bsr		printLine
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
	add		DAR,r8,ZERO		; Address of lineBuff (passed into this routine)
	ldb		r8
	bsr		asciiToHex
	or		r9,r9,r8
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	add		DAR,DAR,ONE
	ldb		r8
	bsr		asciiToHex
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
; Result is returned in r8
;	'0' = 0x30
;	'9' = 0x39
;	'A' = 0x41
;	'F' = 0x46
;	'a' = 0x61
;	'f' = 0x66
;

asciiToHex:
	push	r9
	lix		r9,0x66		; check if letter is > 'f'
	cmp		r9,r8
	bgt		a2h_Error
	lix		r9,0x30		; check if letter is < '0'
	cmp		r9,r8	
	blt		a2h_Error
	lix		r9,0x3A		; check if letter is between '0' and '9' inclusively
	cmp		r9,r8
	blt		gotDigit
	lix		r9,0x41		; check if letter is between '9' and 'A' exclusively
	cmp		r9,r8
	blt		a2h_Error
	lix		r9,0x47		; check if letter is between 'A' and F' inclusively
	cmp		r9,r8
	blt		gotUpperLetter
	lix		r9,0x61		; check if between 'F' and 'a' exclusively
	cmp		r9,r8
	blt		a2h_Error
; Lower case letter
	lix		r9,0x57
	xor		r9,r9,MINUS1
	add		r9,r9,ONE
	add		r8,r8,r9
	lix		r9,0x0F
	and		r8,r8,r9
	bra		doneConvA2H
gotDigit:
	lix		r9,0x30
	xor		r9,r9,MINUS1
	add		r9,r9,ONE
	add		r8,r8,r9
	lix		r9,0x0F
	and		r8,r8,r9
	bra		doneConvA2H
gotUpperLetter:
	lix		r9,0x37
	xor		r9,r9,MINUS1
	add		r9,r9,ONE
	add		r8,r8,r9
	lix		r9,0x0F
	and		r8,r8,r9
	bra		doneConvA2H
a2h_Error:
	lix		r8,syntaxError.lower
	bsr		printString
	lix		r8,0xDEAD
doneConvA2H:
	pull	r9
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
	and 	r8,r8,ONE
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
	push	r10
	lix		r10,0x2
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitUartTxStat
	lix 	PAR,0x1801
	spl		r8			; echo the character
	pull	r10
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
	ldb		r8					; get the character
	cmp		r8,ZERO				; Null terminated string
	beq		donePrStr			; done if null
	bsr		putCharToANSIScreen	; write out the character
	add		DAR,DAR,r1			; Point to next character
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
	add		DAR,r8,ZERO			; set the start of the string
nextChar2:
	ldb		r8					; get the character
	cmp		r8,ZERO				; Null terminated string
	beq		donePrStr2			; done if null
	bsr		putCharToANSIScreen	; write out the character
	add		DAR,DAR,r1			; Point to next character
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
	bsr		putCharToANSIScreen	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		putCharToANSIScreen	; Put the character to the screen
	bsr		putCharToUART		; Echo character back to the UART
	pull	r8
	pull	PC

;
; clearScreen - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearScreen:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	lix		r8,0x5b			; [
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	lix		r8,0x32			; 2
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	lix		r8,0x4A			; J
	bsr		putCharToANSIScreen
	bsr		putCharToUART
	pull	r8
	pull	PC				; rts

;
; putCharToANSIScreen - Put a character to the screen
; Character to put to screen is in r8
;

putCharToANSIScreen:
	push	r9
	push	PAR
	push	r10
	lix		r10,0x2		; TxReady bit
	lix		PAR,0x0		; UART Status
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitScreenTxStat
	lix 	PAR,0x1
	spl		r8			; echo the character
	pull	r10
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
;

setNote:
	push	r8
	push	PAR
	lix		PAR,0x4000
	spl		r8
	pull	PAR
	pull	r8
	pull	PC

;
; enableBuzzer
;

enableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix		r9,0x0010		; Buzzer Enable line
	lix		PAR,0x2800
	lpl		r8
	or		r8,r8,r9
	spl		r8
	pull	PAR
	pull	r8
	pull	r9
	pull	PC

;
; disableBuzzer
;

disableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix		r9,0xffef		; Buzzer Disable line
	lix		PAR,0x2800
	lpl		r8
	and		r8,r8,r9
	spl		r8
	pull	PAR
	pull	r8
	pull	r9
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

; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

wr7Seg8Dig:
	push	PAR
	lix		PAR,0x3000		; Seven Segment LED lines
	spl		r8				; Write out LED bits
	pull	PAR
	pull	PC
