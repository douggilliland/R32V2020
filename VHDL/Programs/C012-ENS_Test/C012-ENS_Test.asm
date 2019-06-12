; ENS Test
start:
	liu r8,0x1234
	lil r8,0x5678
	ens	r8,r8
	add	r10,r8,r0	; do just to see it on the ALU output
	liu r9,0x7856
	lil r9,0x3412
	add	r11,r9,r0	; do just to see it on the ALU output
	cmp r8,r9
	bne flagFail
	bra start
flagFail:
	hcf
	