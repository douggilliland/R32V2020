; CMP and Bxx Checks
start:
	cmp r0,r0
	bne flagFail
	beq	skip1
	bra	flagFail
skip1:
	cmp r0,r1
	beq flagFail
	bne	skip2
	bra	flagFail
skip2:
	bra start
flagFail:
	hcf
	