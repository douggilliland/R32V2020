start:
	ads	SAR,r0,r0	; Use Stack for return address
	sss	r7			; push the call address -1
	bra	clearScreen
fillDataMem:
	ads	dar,r0,r0	; clear the data memory addr pointer
	ads	par,r0,r0	; start of screen
	liu	r8,0x4865	; ASCII 'He'
	lil	r8,0x6C6C	; ASCII 'll'
	sdl	r8			; store d8 as a long
	ads	dar,dar,r1	; increment the data pointer
	liu	r8,0x6F2C	; ASCII 'o,'
	lil	r8,0x2057	; ASCII ' W'
	sdl	r8			; store d8 as a long
	ads	dar,dar,r1	; increment the data pointer
	liu	r8,0x6F72	; ASCII 'or'
	lil	r8,0x6C64	; ASCII 'ld'
	sdl	r8			; store d8 as a long
readDataMemory:
	ads	dar,r0,r0	; clear the data memory addr pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	sss	r7			; store PC on the stack
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	ads	dar,dar,r1	; increment the data pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	sss	r7			; store PC on the stack
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	ads	dar,dar,r1	; increment the data pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	sss	r7			; store PC on the stack
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	rs8	r8,r1,r8
	sss	r7
	bra	putChar
	
loop:
	bra	loop
; Clear the screen routine
clearScreen:
	ads r5,r0,r0	; start of screen character memory
	ads r8,r0,r0	; clear the character
	lil	r8,0x0020	; fill with spaces
	ads r9,r0,r0	; screen count
	lil r9,0x7FE	; loopCount	
looper:
	spb r8			; put the character to the screen
	ads	r5,r5,r1	; Increment screen pointer
	ads r9,r9,r2	; decrement character counter
	bne	looper		; loop until complete
	lss	r10			; load calling address
	ads	r10,r10,r1	; skip the call
	ads	r7,r10,r1	; jump to the next address (rts)
; put a character to the screen and increment the address
putChar:
	spb	r8			; write character to peripheral bus
	ads	r5,r5,r1	; Go to the next character position	
	lss	r10			; load calling address
	ads	r10,r10,r1	; inc by 1 to skip the call
	ads	r7,r10,r1	; jump to the next address (rts)
	