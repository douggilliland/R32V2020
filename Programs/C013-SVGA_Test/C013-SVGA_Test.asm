; Peripheral Test
; Put characters on the screen
start:
	add r5,r0,r0	; start of screen character memory
	add r8,r0,r0	; clear the character
	lil	r8,0x0048	; ASCII 'H'
	spb r8			; put the character to the screen
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x0065	; ASCII 'e'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x006C	; ASCII 'l'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x006C	; ASCII 'l'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x006F	; ASCII 'o'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x002C	; ASCII ','
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x0020	; ASCII ' '
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x0057	; ASCII 'W'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x006F	; ASCII 'o'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x0072	; ASCII 'r'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x006C	; ASCII 'l'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x0064	; ASCII 'd'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x0021	; ASCII '!'
	spb	r8
	add	r5,r5,r1	; Go to the next column
	lil	r8,0x0020	; ASCII ' '
	spb	r8
	hcf
	