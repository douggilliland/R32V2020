nums1:  .LONG 0x12345678,0xffff00000,
nums2:  .SHORT 0xff00,0x4321
nums3:  .BYTE 0x55,0xde,0xbe,0xef,0x99
hi: .string "I have a comment after" ; I am that comment
hi2: .string "Look out for ; character"
empty: .string "foobar"
empty2: .string "Programmers like to say \"Hello world\""
empty3: .string "foobar,spameggs"
; Data RAM Ramp Test
start:
	add	dar,r0,r0	; set the data address register to 0x0
	add	r8,r0,r0	; set the data pattern to match
	add	r9,r0,r0	; clear end count
	lil	r9,0xfe		; memory size-2
ramWriteLoop:
	sdl	r8			; store r8 into the data space memory
	add	dar,dar,r1	; increment the data address register
	add	r8,r8,r1	; increment the data pattern value
	add	r9,r9,r3	; subtract one from the end count
	bnz	ramWriteLoop	; loop more	
; Check the values that were written
	add	dar,r0,r0	; set the data address register to 0x0
	add	r8,r0,r0	; set the data pattern to match
	add	r9,r0,r0	; clear end count
	lil	r9,0xfe		; memory size-2
ramReadLoop:
	ldl	r8			; read the first location 
	cmp	dar,r8		; compare address to the data read
	bne	failedRead	; failed
	add	dar,dar,r1	; increment the address
	add	r9,r9,r3	; subtract one from the end count
	bnz	ramReadLoop	; check the next location
passed:
	add	r11,r0,r0
	lil	r11,0x3000
	add	par,r11,r0
	lil	r10,0x0001
	spl	r10
	hcf
failedRead:
	add	r11,r0,r0
	lil	r11,0x3000
	add	par,r11,r0
	lil	r10,0x7FFF
	spl	r10
	hcf
