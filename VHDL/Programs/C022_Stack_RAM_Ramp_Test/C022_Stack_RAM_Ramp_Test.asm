; Stack RAM Ramp Test
start:
	ads	sar,r0,r0	; set the Stack address register to 0x0
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
	ads	sar,r0,r0	; set the Stack address register to 0x0
	ads	r8,r0,r0	; set the Stack pattern to match
	ads	r9,r0,r0	; clear end count
	lil	r9,0xfe		; memory size-2
ramWriteLoop:
	sss	r8			; store r8 into the Stack space memory
	ads	sar,sar,r1	; increment the Stack address register
	ads	r8,r8,r1	; increment the Stack pattern value
	ads	r9,r9,MINUS1	; subtract one from the end count
	bnz	ramWriteLoop	; loop more	
; Check the values that were written
	ads	sar,r0,r0	; set the Stack address register to 0x0
	ads	r8,r0,r0	; set the Stack pattern to match
	ads	r9,r0,r0	; clear end count
	lil	r9,0xfe		; memory size-2
ramReadLoop:
	lss	r8			; read the stack
	cmp	sar,r8		; compare address to the Stack read
	bne	failedRead	; failed
	ads	sar,sar,r1	; increment the address
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
