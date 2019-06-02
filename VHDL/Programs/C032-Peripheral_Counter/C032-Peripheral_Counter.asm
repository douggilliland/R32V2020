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
readETCounter:
	ads	r8,r0,r0	; r8 will contain the counter address
	lil	r8,0x3800
	ads	r9,r0,r0	; r9 will contain the 7 Seg Display address
	lil	r9,0x3000
loopETCounter:
	ads	par,r8,r0	; counter address
	lpl	r10			; get the counter value
	rs8	r10,r1,r10	; get the top 16-bits of the counter
	rs8	r10,r1,r10
	ads par,r9,r0	; Seven Segment Address
	spl	r10			; store value
	bra	loopETCounter
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
	