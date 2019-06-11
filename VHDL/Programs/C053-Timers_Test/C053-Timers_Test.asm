; delay_microsecond Test
versionString:	.string "R32V2020 > "		; here to prevent an empty data file
start:
	lix	PAR,0x3801	; address of the microsecond counter
	lpl	r8			; read the counter into r8
	lix	PAR,0x3000	; Seven Segment LED lines
	spl	r8			; Write out LED bits
	bra	start
