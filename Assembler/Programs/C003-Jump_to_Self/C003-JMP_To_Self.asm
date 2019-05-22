; r0 is 0 which is also the start of the program
start:
	nop
	ads r7,r0,r7			; copies r7 to Program Counter (effectively causing a jump to self)
