hello:	.string "R32V2020"
screenPtr:	.long 0x0000
screenBase:	.long 0x0
; Read UART character and put it to the SVGA Display
start:
	bsr	clearScreen
	lix	r8,0x0			; Move cursor to home position
	bsr	setCharPos
readDataMemory:
	lix	dar,hello.lower
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	bsr	putChar
	rs8	r8,r8
	bsr	putChar
	rs8	r8,r8
	bsr	putChar
	rs8	r8,r8
	bsr	putChar
	ads	dar,dar,r1	; increment the data pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	bsr	putChar
	rs8	r8,r8
	bsr	putChar
	rs8	r8,r8
	bsr	putChar
	rs8	r8,r8
	bsr	putChar
	lix	r8,0xa			; Move cursor past banner
	bsr	setCharPos
readUartStatus:
	lil	par,0x1800	; UART Status
waitUartRxChar:
	lpl	r9			; Read Status into r9
	ars r9,r9,r1
	bez waitUartRxChar
getCharFromUart:
	lil par,0x1801
	lpl	r8
	spl	r8			; echo the character
putCharToScreen:
	bsr	putChar		; put the character to the screen
	bra	readUartStatus

;
; clearScreen - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Return address (-1) is on the stack - need to increment before return
;

clearScreen:
	pss	r9				; save r9
	pss	r8				; save r8
	lix	r8,0x0			; set screen position to home
	bsr	setCharPos
	lix	r8,0x0020		; fill with spaces
	lix r9,0x7FE		; loopCount	(1K minus 1)
looper:
	bsr	putChar
	ads r9,r9,MINUS1	; decrement character counter
	bne	looper			; loop until complete
	pus	r8
	pus	r9
	pus	r7				; rts

;
; putChar - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putChar:
	pss	r10					; save r10
	pss	r9					; save r9
	pss	DAR
	liu	r9,screenPtr.upper
	lil	r9,screenPtr.lower	; r9 is the ptr to screenPtr
	ads	DAR,r9,r0			; DAR points to screenPtr
	ldl	r10					; r10 has screenPtr value
	ads	PAR,r10,r0			; Set PAR to screenPtr
	spb	r8					; write character to screen
	ads	r10,r10,ONE			; increment screen pointer
	sdl	r10					; save new pointer
	pus DAR					; restore r9
	pus r9					; restore r9
	pus r10					; restore r10
	pus	r7					; rts

; setCharPos - Move to x,y position
; x,y value is passed in r8
;	First 6 least significant bits (0-63 columns)
; 	Next 5 bits (row on the screen)
; screenBase has the base address of the screen memory
; screenPtr contains the address of the current char position

setCharPos:
	pss	r9						; save r9
	pss	r10						; save r10
	liu	r10,screenBase.upper
	lil	r10,screenBase.lower
	ads	DAR,r10,ZERO			; DAR points to the screenBase
	ldl	r10						; r10 has the screen base address
	ads	r10,r8,ZERO				; add passed position to base
	liu	r9,screenPtr.upper
	lil	r9,screenPtr.lower		; r9 is the ptr to screenPtr
	ads	DAR,r9,ZERO				; DAR points to screenPtr
	sdl	r10						; store new screen address
	pus r10						; restore r10
	pus r9						; restore r9
	pus	r7						; rts
