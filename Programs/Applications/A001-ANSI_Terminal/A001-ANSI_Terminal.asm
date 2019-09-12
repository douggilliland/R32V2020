;
; A001-ANSI_Terminal - Terminal with keyboard and ANSI display
;
; ANSI Terminal is based on Grant Searle's ANSI VHDL code
; The ANSI Terminal application uses the following
;	R32V2020 RISC CPU
; 	PS/2 interface
;	Serial port (could use USB-Serial but more likely to use RS-232)
; Functional Description
;	Read PS/2 keyboard and send out the Serial interface
;	Read the Serial inteface and write to the screen
;	Support loopback mode?
;

prompt:			.string "ANSI Terminal (R32V2020)"
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "Syntax error"

main:
	bsr		clearANSIScreen
	lix		r8,prompt.lower
	bsr		printString_ANSI
loopANSITerminal:
; Check PS/2 for character - If there's a character put it to the serial
	bsr		ps2ToSerial
; Check Serial for a character - If there's a character put it to the screen
	bsr		serialToANSI
; loop forever
	bra		loopANSITerminal


;
; ps2ToSerial
; Check PS/2 for character
; 	If there's a character put it to the serial
; There should not be a handshake off in this case since the PS/2 keyboard is 
;	much slower than the Serial interface, 
;	but check to be sure transmit is ready anyway
;	Also, there is a FIFO on the UART transmit to buffer up chars
;

ps2ToSerial:
	push	r9
	push	PAR
	lix		PAR,0x0801	; PS/2 Status
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x1
	bez 	skipRdPS2	; No character was read
	lix 	PAR,0x0800
	lpl		r8			; read char from PS2
	lix		PAR,0x1800	; UART Status
waitUartTxRdy:			; Don't expect that there should be a wait here
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitUartTxRdy
	lix 	PAR,0x1801
	spl		r8			; echo the character
skipRdPS2:
	pull	PAR
	pull	r9
	pull	PC

;
; serialToANSI
;
	
serialToANSI:
	push	PAR
	lix		PAR,0x1800	; UART Status
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x1
	bez 	noSerialChar
	lix 	PAR,0x1801
	lpl		r8
waitANSITxRdy:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitANSITxRdy
	lix 	PAR,0x1
	spl		r8			; echo the character
noSerialChar:
	pull	PAR
	pull	PC
	pull	PC

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
; getPS2Char
; returns character received in r8
;

getPS2Char:
	push	r9
	push	PAR
	lix		PAR,0x0801	; PS/2 Status
waitPS2RxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x1
	bez 	waitPS2RxStat
getCharFromPS2:
	lix 	PAR,0x0800
	lpl		r8
	lix		PAR,0x0801	; PS/2 Status
whilePS2RxStat:
	pull	PAR
	pull	r9
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
; clearANSIScreen - Clear the screen routine
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
; putValueToRingLEDs
; passed r8 - value to send to the ring LEDs
;

putValueToRingLEDs:
	push	PAR
	lix		PAR,0x4800		; Ring LED address
	spl		r8				; Write out LED bits
	pull	PAR
	pull	PC

;
; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display
;

wr7Seg8Dig:
	push	PAR
	lix		PAR,0x3000		; Seven Segment LED lines
	spl		r8				; Write out LED bits
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
	