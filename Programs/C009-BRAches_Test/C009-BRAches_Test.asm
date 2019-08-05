; Code that jumps all over the place
start:
	nop
	nop
next:
	nop
	bra note2		; Relative branch (-1 in this case)
note1:
	nop
	nop
note2:
	nop
	nop
	bra note1
	