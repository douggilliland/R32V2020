; Read PS/2 keyboard character in polled mode
; Put character to the Screen
; Requires V002 Peripherals build with ANSI screen support
; On RETRO-EP4 card, requires PuTTY to be running to read serial port
; PuTTY needs to be in Hardware Handshake mode
; SigRok PS/2 decoder https://www.sigrok.org/blog/new-protocol-decoder-ps2

prompt:	.string "R32V2020> "
missingHandshake: .string "*** Run PuTTY and enable hardware handshake ***"
screenPtr:	.long 0x0000
screenBase:	.long 0x0

;
; Read PS/2 character and put it to the SVGA Display and the Serial Port
;

main:
	bsr		clearANSIScreen
	lix		r8,prompt.lower
	bsr		printString
soundOff:
	lix		r9,0x3F				; Sound generator note off (middle of range)
	lix		PAR,0x4000			; Sound generator
	spl		r9					; shut note off
loopPS2Read_ScreenWrite:
	bsr		getPS2Polled		; Check for polled char
	cmp		r8,MINUS1
	beq		soundOff
	andi	r8,r8,0x7f			; mask the non-note bits
	ori		r8,r8,0x80			; turn on the note enable
	lix		PAR,0x4000			; Sound generator
	spl		r8
	lix		r8,10				; set the delay between repeats
	bsr		delay_mS
	bra		loopPS2Read_ScreenWrite

;
; getPS2Char
; returns character received in r8
;

getPS2Char:
	push	PAR
	lix		PAR,0x0801	; PS/2 Status
waitPS2RxStat:
	lpl		r8			; Read Status into r9
	andi 	r8,r8,1
	bez 	waitPS2RxStat
getCharFromPS2:
	lix 	PAR,0x0800
	lpl		r8
whilePS2RxStat:
	pull	PAR
	pull	PC

;
; waitPS2CharPolled - Check the polled character interface
; wait for a character
; return when a character is present
; returns character received in r8
;

waitPS2CharPolled:
	push	PAR
	lix		PAR,0x0803	; PS/2 Status
waitPS2RxStatPolled:
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x1
	bez 	waitPS2RxStatPolled
getCharFromPS2Polled:
	lix 	PAR,0x0802
	lpl		r8
whilePS2RxStatPolled:
	pull	PAR
	pull	PC

;
; getPS2Polled - Checks the polling status
; returns 
;	-1 if there is no character, 
;	character if there is a character
;

getPS2Polled:
	push	PAR
	lix		PAR,0x0803	; PS/2 Status
	lpl		r8			; Read Status into r8
	andi	r8,r8,0x1
	bez		charNotPresent
	lix		PAR,0x0802
	lpl		r8
	bra		gotCharIn
charNotPresent:
	add		r8,ZERO,MINUS1
gotCharIn:
	pull	PAR
	pull	PC

;
; putUARTChar - Put a character to the UART
; passed character in r8 is sent out the UART
;

putUARTChar:
	push	PAR
	push	r8
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x2
	bnz 	uartRdy
; Remind user to enable HW handshake
; would be better to add a HW handshake timeout
; Since the USB is so much faster it is unlikely this path 
;	will be exercised. 
; It's more likely that PuTTY needed to be run in HW handshake mode.
handshakeStuck:
	lix		r8,missingHandshake.lower
	bsr		printString
	pull	r8
	bra		getOut
uartRdy:
	lix 	PAR,0x1801
	pull	r8
	spl		r8			; echo the character
getOut:
	pull	PAR
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
	addi	DAR,r8,0x0		; set the start of the string
nextChar:
	ldbp	r8				; get the character
	cmpi	r8,0x0			; Null terminated string
	beq		donePrStr		; done if null
	bsr		putCharToANSIScreen	; write out the character
	bra		nextChar
donePrStr:
	pull	DAR				; restore DAR
	pull	r8				; restore r8
	pull	PC				; rts

;
; clearANSIScreen - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
; No passed value
; Uses r8 (saved during function)
; no return value
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
; r8 - Character to put to screen
; r8 - returns character that was sent to screen
;

putCharToANSIScreen:
	push	PAR
	push	r8
	lix		PAR,0x0		; ANSI Screen (UART-style) Status
waitScreenTxStat:
	lpl		r8			; Read Status into r9
	andi 	r8,r8,0x2
	bez 	waitScreenTxStat
	lix 	PAR,0x1		; ANSI Screen (UART-style) Data
	pull	r8
	spl		r8			; send character to the screen
	pull	PAR
	pull	PC
	
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r9

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
