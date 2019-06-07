; BSR/RTS Test
start:
	bsr	testBsr
loop:
	bra	loop
testBsr:
	pus	r7
didntRTS:
	bra	didntRTS
