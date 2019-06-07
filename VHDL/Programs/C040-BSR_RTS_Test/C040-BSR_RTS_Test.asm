; BSR/RTS Test
start:
	bsr	testBsr
loop:
	bra	loop
testBsr:
	rts	; patch r7 as destination
didntRTS:
	bra	didntRTS
