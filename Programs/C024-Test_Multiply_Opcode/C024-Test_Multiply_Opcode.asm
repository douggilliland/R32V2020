; Test Multiply
start:
	mul	r8,r1,r1	; should be 1
	cmp	r8,r1
	bne	failed
	bcs	failed
	add	r8,r1,r1	; two
	mul	r9,r8,r8	; four
	add	r10,r8,r8	; four
	cmp	r9,r10
	bne	failed
	bcs	failed
	mul	r8,r2,r2	; should cause carry set
	bcc	failed
	bcs	skip1
	bra	failed
skip1:
passed:		; send GOOD to the 7 Segment LED
	add	r11,r0,r0
	lil	r11,0x3000
	add	par,r11,r0
	lil	r10,0x900D
	spl	r10
	hcf
failed:		; send 0BAD to the 7 Segment LED
	add	r11,r0,r0
	lil	r11,0x3000
	add	par,r11,r0
	lil	r10,0x0BAD
	spl	r10
	hcf
