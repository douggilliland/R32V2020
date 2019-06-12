; r0 is 0 which is also the start of the program
start:
	nop
	add r7,r0,r0			; copies r0 to Program Counter (effectively causing a jump back to 0)
