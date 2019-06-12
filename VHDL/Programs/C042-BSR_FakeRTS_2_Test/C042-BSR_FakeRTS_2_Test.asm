; BSR/RTS Test
start:
	bsr	testBsr
loop:
	bra	loop
testBsr:
	push	r7
didntRTS:
	bra	didntRTS
