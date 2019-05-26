start:
	liu r8,0x0000	; Should set the upper 16-bits of r8 to the upper 16 bits of start
	lil r8,0x0000	; Should set the lower 16-bits of r8 to the lower 16 bits of start
	bra start		; Copy r8 into r7 - causing a jump to start
