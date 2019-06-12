; Bxx Checks
; Test all branches with both sets of conditions
start:
	cmp r0,r0		; test cmp and bne/beq
	bne failed		; bne not taken
	beq	skip1		; beq taken
	bra	failed
skip1:
	cmp r0,r1		; test cmp and beq/bne
	beq	failed		; beq not taken
	bne skip2		; bne taken
	bra	failed
skip2:
	add	r8,r0,r1	; test add and bez/be1
	bez	failed		; bez not taken
	be1	skip3		; be1 taken
	bra	failed
skip3:
	add	r8,r0,r0	; test
	be1	failed		; be1 not taken
	bez	skip4		; bez taken
	bra	failed
skip4:
	add	r8,r0,r1	; test add and bez/be1
	bnz	skip5		; bnz taken
	bra failed
skip5:
	add	r8,r0,r0	; test bcc/bcs
	bnz	failed		; bnz should not have been taken
testBCCBCS:
	add	r8,r0,r0	; test carry clear
	bcs	failed		; bcs should not have been taken
	bcc	skip6		; bcc taken
	bra	failed		
skip6:
	add r8,MINUS1,MINUS1	; should set carry
	bcc	failed		; should not take bcc
	bcs	skip7		; should take bcs
	bra	failed
skip7:
	cmp	r0,r1		; test blt/bgt
	blt	failed		; should not take blt
	bgt	skip8		; should take bgt
	bra	failed
skip8:
	cmp	r1,r0		; test blt/bgt
	bgt	failed		; should not take bgt
	blt	skip9		; should take blt
	bra	failed
skip9:
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
