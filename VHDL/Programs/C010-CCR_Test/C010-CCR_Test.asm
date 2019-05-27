; Code that jumps all over the place
start:
	nop
	nop
	ads r8,r0,r0
	nop		; make sure the CCR "sticks" for non-ALU operations
	nop
	ads r8,r0,r1
	nop		; make sure the CCR "sticks" for non-ALU operations
	nop
	ads r8,r0,r2
	nop		; make sure the CCR "sticks" for non-ALU operations
	nop
	ads r8,r3,r1
	nop		; make sure the CCR "sticks" for non-ALU operations
	nop
	cmp r0,r0
	nop		; make sure the CCR "sticks" for non-ALU operations
	nop
	cmp r0,r1
	nop		; make sure the CCR "sticks" for non-ALU operations
	nop
	cmp r1,r0
	nop		; make sure the CCR "sticks" for non-ALU operations
	nop
	bra start
