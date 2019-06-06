; BSR/RTS Test
start:
	bsr	testBsr
loop:
	bra	loop
testBsr:
	rts	; need no param version
didntRTS:
	bra	didntRTS
