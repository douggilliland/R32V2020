; Data RAM Ramp Test
start:
	ads	dar,r0,r0	; set the data address register to 0x0
	ads	r8,r0,r0	; set the data pattern to match
	ads	r9,r0,r0	; clear end count
	lil	r9,0xfe		; memory size-2
ramWriteLoop:
	sdl	r8			; store r8 into the data space memory
	ads	dar,dar,r1	; increment the data address register
	ads	r8,r8,r1	; increment the data pattern value
	ads	r9,r9,r3	; subtract one from the end count
	bnz	ramWriteLoop	; loop more	
; Check the values that were written
	ads	dar,r0,r0	; set the data address register to 0x0
	ads	r8,r0,r0	; set the data pattern to match
	ads	r9,r0,r0	; clear end count
	lil	r9,0xfe		; memory size-2
ramReadLoop:
	ldl	r8			; read the first location 
	cmp	dar,r8		; compare address to the data read
	bne	failedRead	; failed
	ads	dar,dar,r1	; increment the address
	ads	r9,r9,r3	; subtract one from the end count
	bnz	ramReadLoop	; check the next location
passed:
	ads	r11,r0,r0
	lil	r11,0x3000
	ads	par,r11,r0
	lil	r10,0x0001
	spl	r10
	hcf
failedRead:
	ads	r11,r0,r0
	lil	r11,0x3000
	ads	par,r11,r0
	lil	r10,0x7FFF
	spl	r10
	hcf
