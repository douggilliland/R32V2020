; PUSh/PUll Stack Test
start:
	lix	r8,0x1234
	pus	r8
	lix	r8,0x5678
	pus	r8
	hcf
