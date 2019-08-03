; Auto-increment Test
; Test Auto-Increment of the Data RAM and Peripheral Space Address Registers

start:
	lix		DAR,0x0
	liu		r8,0x1234
	lil		r8,0x5678
	sdlp	r8
	liu		r8,0xDEAD
	lil		r8,0xBABA
	sdlp	r8
	lix		r8,0x1111
	sdsp	r8
	lix		r8,0x2222
	sdsp	r8
	lix		r8,0x99
	sdbp	r8
	lix		r8,0x88
	sdbp	r8
	lix		r8,0x77
	sdbp	r8
	lix		r8,0x66
	sdbp	r8
	hcf
	