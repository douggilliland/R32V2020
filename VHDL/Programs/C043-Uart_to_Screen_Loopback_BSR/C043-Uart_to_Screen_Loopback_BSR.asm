hello:	.string "R32V2020"
; Read UART character and put it to the SVGA Display
start:
	bsr	clearScreen
	ads	par,r0,r0	; start of screen
readDataMemory:
	ads	dar,r0,r0	; clear the data memory addr pointer
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
screenStuff:
	ads	r11,par,r0	; save the screen pointer in r11
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
	ads	par,r11,r0	; get the screen pointer
	bsr	putChar		; put the character to the screen
	ads	r11,par,r0	; save the screen pointer in r11
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
	lil	PAR,0x0			; screen address
	lix	r8,0x0020		; fill with spaces
	lix r9,0x7FE		; loopCount	(1K minus 1)
looper:
	spb r8				; put the character to the screen
	ads	PAR,PAR,ONE		; Increment screen pointer
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
	spb	r8			; write character to peripheral bus
	ads	par,par,r1	; Go to the next character position	
	pus	r7
