firstLong:	.long 0x00000001
secondLong:	.long 0x00000002

start:
	lix		r8,firstLong.lower
	lix		r8,secondLong.lower
	