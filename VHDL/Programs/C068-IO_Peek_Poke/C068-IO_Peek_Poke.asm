;
; I/O Peek/Poke Code
; Read a line from the Serial Port
; Parse the line that was read
; Perform the operation that was parsed out
;
; Commands are
; 	RL 00005000 - Read a long from address 0x00005000
; 	WL 00005000,12345678 - Write a long at address 0x00005000 with value 0x12345678
;

prompt:			.string "R32V2020> "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "Syntax error"

;
; Read UART character and put it to the ANSI VGA Display
;

main:
	bsr		clearScreen
	lix		r8,prompt.lower
	lix		r9,0x0
	lix		r10,0x0d			; Enter key
	bsr		printString
readUartStatus:
	bsr		waitGetCharFromUART	; Get a character from the UART
putCharToANSIScreenAndUART:
	bsr		putCharToANSIScreen	; Put the character to the screen
	cmp		r8,r10
	bne		skipEnter
	lix		r8,0x0
	lix		r9,0x0
	bra		doneEnter
skipEnter:
	sl8		r9,r9
	or		r9,r9,r8
	add		r8,r9,ZERO
doneEnter:
	bsr		wr7Seg8Dig			; Put the character to the Seven Segment Display
	bsr		putCharToUART
	bra		readUartStatus

;
; readLineFromUART
; r8 used to get characters from UART
; r9 points to lineBuff
; r10 byte count in LineBuff (increments from 0-3)
; r11 long count in LineBuff (increments from 0-19)
; r12 accumulated character (bytes into long value)
;

readLineFromUART:
	lix		r8,0x0				; clear character initially
	lix		r9,lineBuff.lower	; Get the address
	lix		r10,0x0
	lix		r11,0x0
	lix		r12,0x0
	
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
	push	r9				; save r9
	push	DAR
	add		DAR,r8,ZERO		; set the start of the string
nextLong:
	ldl		r8				; get the string
	ens		r8,r8			; swap the endian
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToANSIScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToANSIScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToANSIScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToANSIScreen	; write out the character
lastOfLong:
	add		DAR,DAR,ONE
	bra		nextLong
donePrStr:
	pull	DAR				; restore DAR
	pull	r9				; restore r9
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
; Return address (-1) is on the stack - need to increment before return
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
