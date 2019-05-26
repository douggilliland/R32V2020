; r0 is 0 which is also the start of the program
start:
	ads r8,r0,r0	; clears r8
loopsBackToHere:
	liu r8,0x1234	; Load upper short of r8 with 0x1234
	lil r8,0x5678	; Load lower short of r8 with 0x5678
	hcf				; stop running
