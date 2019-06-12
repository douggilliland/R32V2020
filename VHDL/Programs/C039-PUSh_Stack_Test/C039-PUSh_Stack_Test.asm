; PUSh/PUll Stack Test
start:
	lix	r8,0x0008
	lix	r9,0x0009
	lix	r10,0x0010
	lix	r11,0x0011
	push	r8
	push	r9
	push	r10
	push	r11
	lix	r8,0x8888
	lix	r9,0x9999
	lix	r10,0x1010
	lix	r11,0x1111
	pull	r11
	pull	r10
	pull	r9
	pull	r8
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
