; ENS Test
start:
	liu r9,0x7856
	lil r9,0x3412
	liu r8,0x1234
	lil r8,0x5678
	ens	r8,r8
	cmp r8,r9
	bne flagFail
	bra start
flagFail:
	hcf
