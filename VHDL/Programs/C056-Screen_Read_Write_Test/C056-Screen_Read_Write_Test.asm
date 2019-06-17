hello:	.string "R32V2020> "
screenPtr:	.long 0x0000
screenBase:	.long 0x0

;
; Read UART character and put it to the SVGA Display
;

main:
	bsr	clearScreen
	lix	r8,128			; Move cursor to 4th row position
	bsr	setCharPos
readDataMemory:
	lix	r8,hello.lower
	bsr	printString
;readUartStatus:
;	bsr	getUARTChar
;putCharToScreen:
;	bsr	putChar		; put the character to the screen
	lix	PAR,128
	lpl	r8
	bsr	putUARTChar
	lix	PAR,129
	lpl	r8
	bsr	putUARTChar
loopPosition:
	bra	loopPosition

;
; getUARTChar
; returns character received in r8
;

getUARTChar:
	push	r9
	push	PAR
	lix	PAR,0x1800	; UART Status
waitUartRxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,ONE
	bez waitUartRxStat
getCharFromUart:
	lix PAR,0x1801
	lpl	r8
	pull	PAR
	pull	r9
	pull	PC

;
; putUARTChar - Put a character to the UART
; passed character in r8 is sent out the UART
;

putUARTChar:
	push	r9
	push	PAR
	push	r10
	lix	r10,0x2
	lix	PAR,0x1800	; UART Status
waitUartTxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,r10
	bez waitUartTxStat
	lix PAR,0x1801
	spl	r8			; echo the character
	pull	r10
	pull	PAR
	pull	r9
	pull	PC
	
;
; printString - Print a screen to the current screen position
; pass value : r8 points to the start of the string
; strings are null terminated
; strings are bytes packed into long words
;

printString:
	push	r8				; save r8
	push	r9				; save r9
	push	DAR
	add	DAR,r8,ZERO		; set the start of the string
nextLong:
	ldl	r8				; get the string
	ens	r8,r8			; swap the endian
	lix	r9,0xff			; mask for null termination check
	and	r9,r9,r8
	bez	donePrStr
	bsr	putChar			; write out the character
	sr8	r8,r8
	lix	r9,0xff			; mask for null termination check
	and	r9,r9,r8
	bez	donePrStr
	bsr	putChar			; write out the character
	sr8	r8,r8
	lix	r9,0xff			; mask for null termination check
	and	r9,r9,r8
	bez	donePrStr
	bsr	putChar			; write out the character
	sr8	r8,r8
	lix	r9,0xff			; mask for null termination check
	and	r9,r9,r8
	bez	donePrStr
	bsr	putChar			; write out the character
lastOfLong:
	add	DAR,DAR,ONE
	bra	nextLong
donePrStr:
	pull	DAR				; restore DAR
	pull	r9				; restore r9
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
	lix	r8,0x0			; set screen position to home
	bsr	setCharPos
	lix	r8,0x0020		; fill with spaces
	lix r9,0x7FE		; loopCount	(1K minus 1)
looper:
	bsr	putChar
	add r9,r9,MINUS1	; decrement character counter
	bne	looper			; loop until complete
	pull	r8
	pull	r9
	pull	PC				; rts

;
; putChar - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putChar:
	push	r10					; save r10
	push	r9					; save r9
	push	DAR
	push	PAR
	lix	r9,screenPtr.lower	; r9 is the ptr to screenPtr
	add	DAR,r9,ZERO			; DAR points to screenPtr
	ldl	r10					; r10 has screenPtr value
	add	PAR,r10,ZERO		; Set PAR to screenPtr
	spb	r8					; write character to screen
	add	r10,r10,ONE			; increment screen pointer
	sdl	r10					; save new pointer
	pull PAR					; restore PAR
	pull DAR					; restore DAR
	pull r9					; restore r9
	pull r10					; restore r10
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
	lix	r10,screenBase.lower
	add	DAR,r10,ZERO			; DAR points to the screenBase
	ldl	r10						; r10 has the screen base address
	add	r10,r8,ZERO				; add passed position to base
	lix	r9,screenPtr.lower		; r9 is the ptr to screenPtr
	add	DAR,r9,ZERO				; DAR points to screenPtr
	sdl	r10						; store new screen address
	pull DAR						; restore DAR
	pull r10						; restore r10
	pull r9						; restore r9
	pull	PC						; rts
