; Read UART status and put it to the Seven Segment Display
start:
	bra	clearScreen
doneClear:
	add r5,r0,r0	; start of screen character memory
	add r8,r0,r0	; clear the character
	lil	r8,0x0048	; ASCII 'H'
	add	r9,r7,r1
	bra	putChar
	lil	r8,0x0065	; ASCII 'e'
	add	r9,r7,r1
	bra	putChar
	lil	r8,0x0065	; ASCII 'e'
	add	r9,r7,r1
	bra	putChar
readUartStatus:
	lil	r5,0x1800	; UART Status
	lpl	r9			; Read Status into r9
	and r9,r9,r1
	bez readUartStatus
	lil r5,0x1801
	lpl	r10
	lil	r5,0x3000	; Seven Segment Display address
	spl	r10			; Write to the Seven Segment display
	bra	readUartStatus
; Clear the screen routine
clearScreen:
	add r5,r0,r0	; start of screen character memory
	add r8,r0,r0	; clear the character
	lil	r8,0x0020	; fill with spaces
	add r9,r0,r0	; screen count
	lil r9,0x7FE	; loopCount	
looper:
	spb r8			; put the character to the screen
	add	r5,r5,r1	; Increment screen pointer
	add r9,r9,r2	; decrement character counter
	bne	looper		; loop until complete
	bra	doneClear
; put a character to the screen and increment the address
putChar:
	spb	r8			; write character to peripheral bus
	add	r5,r5,r1	; Go to the next character position	
	add	r7,r9,r1	; return to calling routine (r9 is the calling address)
	