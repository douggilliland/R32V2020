; BSR/RTS Test
start:
	bsr	testBsr
loop:
	bra	loop
testBsr:
	rts	r7,SAR,r0	; need no param version
didntRTS:
	bra	didntRTS
