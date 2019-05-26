start:
	nop
	nop
next:
	nop
	liu r8,0x0000	; Should set the upper 16-bits of r8 to the upper 16 bits of start
	lil r8,0x0002	; Should set the lower 16-bits of r8 to the lower 16 bits of start
	bra next		; Relative branch (-3 in this case)
