; Code that jumps all over the place
start:
	nop
	ads r8,r0,r0
	ads r8,r0,r1
	ads r8,r0,r2
	cmp r3,r0,r0
	cmp r3,r0,r1
	cmp r3,r1,r0
	bra start
