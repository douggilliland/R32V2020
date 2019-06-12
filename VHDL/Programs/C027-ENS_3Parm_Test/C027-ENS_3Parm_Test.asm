start:
	add	par,r0,r0	; start of screen
	liu	r8,0x4865	; ASCII 'He'
	lil	r8,0x6C6C	; ASCII 'll'
	ens r9,r8
	spl	r9
	add	par,par,r1	; next screen character
	sr8	r9,r9
	spl	r9
	add	par,par,r1	; next screen character
	sr8	r9,r9
	spl	r9
	add	par,par,r1	; next screen character
	sr8	r9,r9
	spl	r9
loop:
	bra	loop
	