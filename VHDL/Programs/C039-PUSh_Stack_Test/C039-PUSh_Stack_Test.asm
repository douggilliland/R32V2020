; PUSh/PUll Stack Test
start:
	lix	r8,0x0008
	lix	r9,0x0009
	lix	r10,0x0010
	lix	r11,0x0011
	pss	r8
	pss	r9
	pss	r10
	pss	r11
	lix	r8,0x8888
	lix	r9,0x9999
	lix	r10,0x1010
	lix	r11,0x1111
	pus	r11
	pus	r10
	pus	r9
	pus	r8
	lil	r12,0x8
	cmp	r12,r8
	bne	fail
	lil	r12,0x9
	cmp	r12,r9
	bne	fail
	lil	r12,0x10
	cmp	r12,r10
	bne	fail
	lil	r12,0x11
	cmp	r12,r11
	bne	fail

loop:
	bra	loop
fail:
	hcf
