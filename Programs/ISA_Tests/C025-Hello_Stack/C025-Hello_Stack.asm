; Peripheral Test
; Put characters on the screen
start:
	add	SAR,r0,r0	; Use Stack for return address
	sss	r7			; push the call address -1
	bra	clearScreen
doneClear:
	add r5,r0,r0	; start of screen character memory
	add r8,r0,r0	; clear the character
	lil	r8,0x0048	; ASCII 'H'
	sss	r7
	bra	putChar
	lil	r8,0x0065	; ASCII 'e'
	sss	r7
	bra	putChar
	lil	r8,0x006C	; ASCII 'l'
	sss	r7
	bra	putChar
	lil	r8,0x006C	; ASCII 'l'
	sss	r7
	bra	putChar
	lil	r8,0x006F	; ASCII 'o'
	sss	r7
	bra	putChar
	lil	r8,0x002C	; ASCII ','
	sss	r7
	bra	putChar
	lil	r8,0x0020	; ASCII ' '
	sss	r7
	bra	putChar
	lil	r8,0x0057	; ASCII 'W'
	sss	r7
	bra	putChar
	lil	r8,0x006F	; ASCII 'o'
	sss	r7
	bra	putChar
	lil	r8,0x0072	; ASCII 'r'
	sss	r7
	bra	putChar
	lil	r8,0x006C	; ASCII 'l'
	sss	r7
	bra	putChar
	lil	r8,0x0064	; ASCII 'd'
	sss	r7
	bra	putChar
	lil	r8,0x0021	; ASCII '!'
	sss	r7
	bra	putChar
	lil	r8,0x0020	; ASCII ' '
	sss	r7
	bra	putChar
	hcf
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
	lss	r10			; load calling address
	add	r10,r10,r1	; skip the call
	add	r7,r10,r1	; jump to the next address (rts)
; put a character to the screen and increment the address
putChar:
	spb	r8			; write character to peripheral bus
	add	r5,r5,r1	; Go to the next character position	
	lss	r10			; load calling address
	add	r10,r10,r1	; skip the call
	add	r7,r10,r1	; jump to the next address (rts)
	