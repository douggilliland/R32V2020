; Read PS/2 keyboard character and put it to the Screen
; Requires V002 build with ANSI screen support
; On RETRO-EP4 card, requires PuTTY to be running to read serial port
; PuTTY needs to be in Hardware Handshake mode
; SigRok PS/2 decoder https://www.sigrok.org/blog/new-protocol-decoder-ps2

hello:	.string "R32V2020> "
missingHandshake: .string "*** Run PuTTY and enable hardware handshake ***"
screenPtr:	.long 0x0000
screenBase:	.long 0x0

;
; Read PS/2 character and put it to the SVGA Display and the Serial Port
;

main:
	bsr	clearANSIScreen
readDataMemory:
	lix	r8,hello.lower
	bsr	printString
loopPS2Read_ScreenWrite:
	bsr	getPS2CharPolled
	bsr	putCharToANSIScreen	; put the character to the screen
	bsr	putUARTChar
	bra	loopPS2Read_ScreenWrite

;
; getPS2Char
; returns character received in r8
;

getPS2Char:
	push	r9
	push	PAR
	lix	PAR,0x0801	; PS/2 Status
waitPS2RxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,r1
	bez waitPS2RxStat
getCharFromPS2:
	lix PAR,0x0800
	lpl	r8
whilePS2RxStat:
	pull	PAR
	pull	r9
	pull	PC

;
; getPS2Char
; returns character received in r8
;

getPS2CharPolled:
	push	r9
	push	PAR
	lix	PAR,0x0803	; PS/2 Status
waitPS2RxStatPolled:
	lpl	r9			; Read Status into r9
	and r9,r9,r1
	bez waitPS2RxStatPolled
getCharFromPS2Polled:
	lix PAR,0x0802
	lpl	r8
whilePS2RxStatPolled:
	pull	PAR
	pull	r9
	pull	PC

;
; putUARTChar - Put a character to the UART
; passed character in r8 is sent out the UART
;

putUARTChar:
	push	r8
	push	r9
	push	r10
	push	PAR
	lil	r10,0x2
	lil	PAR,0x1800	; UART Status
waitUartTxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,r10
	bnz uartRdy
; remind user to enable HW handshake
	lix	r8,missingHandshake.lower
	bsr	printString
loopForever:
	bra	getOut
uartRdy:
	lil PAR,0x1801
	spl	r8			; echo the character
getOut:
	pull	PAR
	pull	r10
	pull	r9
	pull	r8
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
; setCharPos - Move to x,y position
; x,y value is passed in r8
;	First 6 least significant bits (0-63 columns)
; 	Next 5 bits (row on the screen)
; screenBase has the base address of the screen memory
; screenPtr contains the address of the current char position
;

setCharPos:
	push	r9						; save r9
	push	r10						; save r10
	push	DAR						; save DAR
	liu		r10,screenBase.upper
	lil		r10,screenBase.lower
	add		DAR,r10,ZERO			; DAR points to the screenBase
	ldl		r10						; r10 has the screen base address
	add		r10,r8,ZERO				; add passed position to base
	liu		r9,screenPtr.upper
	lil		r9,screenPtr.lower		; r9 is the ptr to screenPtr
	add		DAR,r9,ZERO				; DAR points to screenPtr
	sdl		r10						; store new screen address
	pull 	DAR						; restore DAR
	pull 	r10						; restore r10
	pull 	r9						; restore r9
	pull	PC						; rts
