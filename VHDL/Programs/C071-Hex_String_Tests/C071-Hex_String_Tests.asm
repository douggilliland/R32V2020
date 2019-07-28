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
	bsr		clearScreen
	lix		r8,prompt.lower
	sl1		r8,r8				; Need to shift by 2 to get true address (assembler needs fixed)
	sl1		r8,r8
	bsr		printString
loopRead:
	bsr		getLine
	lix		r8,lineBuff.lower	; DAR pointer = start of line buffer
	sl1		r8,r8				; Need to shift by 2 to get true address (assembler needs fixed)
	sl1		r8,r8
	bsr		hexToSevenSeg		; 
	bra		loopRead

;
; hexToSevenSeg - Convert a two ASCII digit value into a hex byte
; r8 points to the start of the hex string
;

hexToSevenSeg:
	push	r8
	push	r9
	push	r10
	push	DAR
	push	PAR
	lix		r9,0
	add		DAR,r8,ZERO
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
	pull	PAR
	pull	DAR
	pull	r10
	pull	r9
	pull	r8
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
	sl1		r8,r8				; Need to shift by 2 to get true address (assembler needs fixed)
	sl1		r8,r8
	bsr		printString
	lix		r8,0xDEAD
doneConvA2H:
	pull	r9
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
	sl1		DAR,DAR				; Need to shift by 2 to get true address (assembler needs fixed)
	sl1		DAR,DAR				
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
	sl1		r12,r12				; Need to shift by 2 to get true address (assembler needs fixed)
	sl1		r12,r12				
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
;
;
	
parseLine:
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
	push	r8				; save r8
	push	DAR
	add		DAR,r8,ZERO		; set the start of the string
nextChar:
	ldb		r8				; get the character
	cmp		r8,ZERO			; Null terminated string
	beq		donePrStr		; done if null
	bsr		putCharToANSIScreen	; write out the character
	add		DAR,DAR,r1		; Point to next character
	bra		nextChar
donePrStr:
	pull	DAR				; restore DAR
	pull	r8				; restore r8
	pull	PC				; rts
	
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
