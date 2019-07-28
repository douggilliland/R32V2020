firstLong:	.long 0x00000001
secondLong:	.long 0x00000002
firstShort: .short 0x1234
secondShort: .short 0x5678
firstByte:	.byte 0x99
secondByte:	.byte 0x88
thirdByte:	.byte 0x77
fourthByte:	.byte 0x66

start:
	lix		r8,firstLong.lower
	lix		r8,secondLong.lower
	lix		r8,firstShort.lower
	lix		r8,secondShort.lower
	lix		r8,firstByte.lower
	lix		r8,secondByte.lower
	lix		r8,thirdByte.lower
	lix		r8,fourthByte.lower