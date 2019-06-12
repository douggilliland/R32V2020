; Read UART character and put it to the SVGA Display
; Read UART character and put it to the SVGA Display
start:
	add	SAR,r0,r0	; Use Stack for return address
	sss	r7			; push the call address -1
	bra	clearScreen
	add	par,r0,r0	; start of screen
	add	dar,r0,r0	; clear the data memory addr pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	sss	r7			; store PC on the stack
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
	add	dar,dar,r1	; increment the data pointer
	add	r11,par,r0	; save the screen pointer in r11
readUartStatus:
	lil	par,0x1800	; UART Status
	lpl	r9			; Read Status into r9
	and r9,r9,r1
	bez readUartStatus
charToScreen:
	lil par,0x1801
	lpl	r8
	add	par,r11,r0	; get the screen pointer
	sss	r7			; return address
	bra	putChar		; put the character to the screen
;	lil	par,0x3000	; Seven Segment Display address
;	spl	r10			; Write to the Seven Segment display
	add	r11,par,r0	; save the screen pointer in r11
	bra	readUartStatus
; Clear the screen routine
clearScreen:
	add par,r0,r0	; start of screen character memory
	add r8,r0,r0	; clear the character
	lil	r8,0x0020	; fill with spaces
	add r9,r0,r0	; screen count
	lil r9,0x7FE	; loopCount	
looper:
	spb r8			; put the character to the screen
	add	par,par,r1	; Increment screen pointer
	add r9,r9,r2	; decrement character counter
	bne	looper		; loop until complete
	lss	r10			; load calling address
	add	r10,r10,r1	; skip the call
	add	r7,r10,r1	; jump to the next address (rts)
; put a character to the screen and increment the address
putChar:
	spb	r8			; write character to peripheral bus
	add	par,par,r1	; Go to the next character position	
	lss	r10			; load calling address
	add	r10,r10,r1	; inc by 1 to skip the call
	add	r7,r10,r1	; jump to the next address (rts)
	