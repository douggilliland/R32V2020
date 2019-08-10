; Read Switches and put to Seven Segment LED Display
hello:		.string "R32V2020> "
screenPtr:	.long 0x0000
screenBase:	.long 0x0

;
; Read Switches and put to the Seven Segment LED Display
;

main:
	bsr	clearScreen
	lix		r8,0x0			; Move cursor to home position
	bsr		setCharPos
readDataMemory:
	liu		r8,hello.upper
	lil		r8,hello.lower
	bsr		printString
loopReadSwitches:
	bsr		readSws
	bsr		wr7Seg8Dig		; put the switches to the 7 Segment LED
	bra		loopReadSwitches

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
	
;
; readSws
; switches value returned in r8
; switches are high when pressed
;

readSws:
	push	PAR
	push	r9
	lix		r9,0x7
	liu		PAR,0x0000
	lil		PAR,0x2000	; Switches address
	lpl		r8			; Read switches into r9
	xor		r8,r8,r9
	pull	r9
	pull	PAR
	pull	PC

;
; getPS2Char
; returns character received in r8
;

getPS2Char:
	push	r9
	push	PAR
	liu		PAR,0x0000
	lil		PAR,0x1000	; PS/2 Status
waitPS2RxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r1
	bez 	waitPS2RxStat
getCharFromPS2:
	liu		PAR,0x0000
	lil 	PAR,0x0800
	lpl		r8
	liu		PAR,0x0000
	lil		PAR,0x1000	; PS/2 Status
whilePS2RxStat:
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
	lil		r10,0x2
	lil		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitUartTxStat
	lil 	PAR,0x1801
	spl		r8			; echo the character
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
; clearScreen - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Return address (-1) is on the stack - need to increment before return
;

clearScreen:
	push	r9				; save r9
	push	r8				; save r8
	lix		r8,0x0			; set screen position to home
	bsr		setCharPos
	lix		r8,0x0020		; fill with spaces
	lix 	r9,0x7FE		; loopCount	(1K minus 1)
looper:
	bsr		putCharToScreen
	add 	r9,r9,MINUS1	; decrement character counter
	bne		looper			; loop until complete
	pull	r8
	pull	r9
	pull	PC			; rts

;
; putCharToScreen - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putCharToScreen:
	push	r10					; save r10
	push	r9					; save r9
	push	DAR
	push	PAR
	liu		r9,screenPtr.upper
	lil		r9,screenPtr.lower	; r9 is the ptr to screenPtr
	add		DAR,r9,r0			; DAR points to screenPtr
	ldl		r10					; r10 has screenPtr value
	add		PAR,r10,r0			; Set PAR to screenPtr
	spb		r8					; write character to screen
	add		r10,r10,ONE			; increment screen pointer
	sdl		r10					; save new pointer
	pull 	PAR					; restore PAR
	pull 	DAR					; restore DAR
	pull 	r9					; restore r9
	pull 	r10					; restore r10
	pull	PC					; rts

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
