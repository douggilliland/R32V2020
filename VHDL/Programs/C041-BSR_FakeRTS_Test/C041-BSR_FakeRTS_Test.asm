; BSR/RTS Test
start:
	bsr	testBsr
loop:
	bra	loop
testBsr:
	and	SAR,SAR,MINUS1	; fake rts sequence
	lss	r7
;	rts	 patch r7 as destination
didntRTS:
	bra	didntRTS
