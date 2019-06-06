; Read UART character and put it to the SVGA Display
start:
	ads	SAR,r0,r0	; Initialize Stack Pointer (used for return address)
	sss	r7			; push the call address -1
	bra	clearScreen
	ads	par,r0,r0	; start of screen
readDataMemory:
	ads	dar,r0,r0	; clear the data memory addr pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	sss	r7			; store PC on the stack
	bra	putChar
	rs8	r8,r8
	sss	r7
	bra	putChar
	rs8	r8,r8
	sss	r7
	bra	putChar
	rs8	r8,r8
	sss	r7
	bra	putChar
	ads	dar,dar,r1	; increment the data pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	sss	r7			; store PC on the stack
	bra	putChar
	rs8	r8,r8
	sss	r7
	bra	putChar
	rs8	r8,r8
	sss	r7
	bra	putChar
	rs8	r8,r8
	sss	r7
	bra	putChar
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
	sss	r7			; return address
	bra	putChar		; put the character to the screen
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
	ads par,r0,r0	; start of screen character memory
	ads r8,r0,r0	; clear the character
	lil	r8,0x0020	; fill with spaces
	ads r9,r0,r0	; screen count
	lil r9,0x7FE	; loopCount	(1K minus 1)
looper:
	spb r8			; put the character to the screen
	ads	par,par,r1	; Increment screen pointer
	ads r9,r9,r2	; decrement character counter
	bne	looper		; loop until complete
	lss	r10			; load calling address
	ads	r10,r10,r1	; skip the call
	ads	r7,r10,r1	; jump to the next address (rts)

;
; putChar - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putChar:
	spb	r8			; write character to peripheral bus
	ads	par,par,r1	; Go to the next character position	
	lss	r10			; load calling address
	ads	r10,r10,r1	; inc by 1 to skip the call
	ads	r7,r10,r1	; jump to the next address (rts)
	