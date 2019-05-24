; r0 is 0 which is also the start of the program
start:
	ads r8,r0,r0	; clears r8
	ads r8,r8,r1	; keep adding one to r8 every time it loops
	ads r7,r1,r0	; jump back to previous line
