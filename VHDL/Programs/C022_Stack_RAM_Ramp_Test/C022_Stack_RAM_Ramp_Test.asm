; Stack RAM Ramp Test
start:
	add	sar,r0,r0	; set the Stack address register to 0x0
	add	r9,r0,r0	; Clear read value
	liu	r8,0x9876
	lil	r8,0xabcd
	sss	r8
	nop
	lss	r9
	cmp	r8,r9
	bne	failedRead
;	bra	passed	
testLoop:
	add	sar,r0,r0	; set the Stack address register to 0x0
	add	r8,r0,r0	; set the Stack pattern to match
	add	r9,r0,r0	; clear end count
	lil	r9,0xfe		; memory size-2
ramWriteLoop:
	sss	r8			; store r8 into the Stack space memory
	add	sar,sar,r1	; increment the Stack address register
	add	r8,r8,r1	; increment the Stack pattern value
	add	r9,r9,MINUS1	; subtract one from the end count
	bnz	ramWriteLoop	; loop more	
; Check the values that were written
	add	sar,r0,r0	; set the Stack address register to 0x0
	add	r8,r0,r0	; set the Stack pattern to match
	add	r9,r0,r0	; clear end count
	lil	r9,0xfe		; memory size-2
ramReadLoop:
	lss	r8			; read the stack
	cmp	sar,r8		; compare address to the Stack read
	bne	failedRead	; failed
	add	sar,sar,r1	; increment the address
	add	r9,r9,MINUS1	; subtract one from the end count
	bnz	ramReadLoop	; check the next location
passed:
	add	r11,r0,r0
	lil	r11,0x3000
	add	par,r11,r0
	lil	r10,0x900D
	spl	r10
loopPass:
	bra loopPass
failedRead:
	add	r11,r0,r0
	lil	r11,0x3000
	add	par,r11,r0
	lil	r10,0x0bad
	spl	r10
loopFail:
	bra	loopFail
