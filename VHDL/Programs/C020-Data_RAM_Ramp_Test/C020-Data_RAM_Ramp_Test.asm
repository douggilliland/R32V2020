; Data RAM Ramp Test
start:
	ads	dar,r0,r0	; set the Stack address register to 0x0
	ads	r9,r0,r0	; Clear read value
	liu	r8,0x9876
	lil	r8,0xabcd
	sss	r8
	nop
	lss	r9
	cmp	r8,r9
	bne	failedRead
;	bra	passed	
testLoop:
	ads	dar,r0,r0	; set the Stack address register to 0x0
	ads	r8,r0,r0	; set the Stack pattern to match
	ads	r9,r0,r0	; clear end count
	lil	r9,0xff		; memory size-1
ramWriteLoop:
	sdl	r8			; store r8 into the data space memory
	ads	dar,dar,r1	; increment the data address register
	ads	r8,r8,r1	; increment the data pattern value
	ads	r9,r9,MINUS1	; subtract one from the end count
	bnz	ramWriteLoop	; loop more	
; Check the values that were written
	ads	dar,r0,r0	; set the data address register to 0x0
	ads	r8,r0,r0	; set the data pattern to match
	ads	r9,r0,r0	; clear end count
	lil	r9,0xff		; memory size-1
ramReadLoop:
	ldl	r8			; read the first location 
	cmp	dar,r8		; compare address to the data read
	bne	failedRead	; failed
	ads	dar,dar,r1	; increment the address
	ads	r9,r9,MINUS1	; subtract one from the end count
	bnz	ramReadLoop	; check the next location
passed:
	ads	r11,r0,r0
	lil	r11,0x3000
	ads	par,r11,r0
	lil	r10,0x900D
	spl	r10
loopPass:
	bra loopPass
failedRead:
	ads	r11,r0,r0
	lil	r11,0x3000
	ads	par,r11,r0
	lil	r10,0x0bad
	spl	r10
loopFail:
	bra	loopFail
