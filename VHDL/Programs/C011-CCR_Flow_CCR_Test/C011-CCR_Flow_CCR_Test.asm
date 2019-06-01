; CMP and Bxx Checks
start:
	cmp r0,r0
	bne failed
	beq	skip1
	bra	failed
skip1:
	cmp r0,r1
	beq failed
	bne	skip2
	bra	failed
	bra passed
	nop
skip2:
passed:		; send GOOD to the 7 Segment LED
	ads	r11,r0,r0
	lil	r11,0x3000
	ads	par,r11,r0
	lil	r10,0x900D
	spl	r10
	hcf
failed:		; send 0BAD to the 7 Segment LED
	ads	r11,r0,r0
	lil	r11,0x3000
	ads	par,r11,r0
	lil	r10,0x0BAD
	spl	r10
	hcf
