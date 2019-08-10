; Data RAM Test
start:
	add	dar,r0,r0	; set the data address register to 0x0
	liu	r8,0x1234	; data test pattern
	lil	r8,0x5678
ramTestLoop:
	sdl	r8			; store r8 into the data space memory
	nop
	ldl	r9			; read the data space memory into r9
	cmp	r8,r9		; compare what was written to what was read
	bne	halt		; if they are different, then halt
	xor	r8,r8,r2	; invert the test pattern value
	bra	ramTestLoop
halt:
	hcf
