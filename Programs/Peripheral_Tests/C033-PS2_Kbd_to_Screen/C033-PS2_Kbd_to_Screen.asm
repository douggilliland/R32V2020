; Read PS/2 keyboard character and put it to the Screen
start:
	add	SAR,r0,r0	; Initialize Stack Pointer (used for return address)
	sss	r7			; push the call address -1
	bra	clearScreen
	add	par,r0,r0	; start of screen
readDataMemory:
	add	dar,r0,r0	; clear the data memory addr pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	sss	r7			; store PC on the stack
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
	add	dar,dar,r1	; increment the data pointer
	ldl	r8			; get the long again
	ens r8,r8		; endian swap for right byte order
	sss	r7			; store PC on the stack
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
	sr8	r8,r8
	sss	r7
	bra	putChar
readKBStat:
	lix	r14,0x0800
	lix	r12,0x1000
	lix	r13,0x0010	; 16th column on the screen (middle of the first line)
loopStatRead:
	add	par,r12,r0	; kb status address
loopReadKbStat:
	lpl	r11			; get the kb status value
	and	r11,r11,r1	; test the data present bit
	bez	loopReadKbStat
readKeyboardData:
	add	par,r14,r0	; keyboard data port address
	lpl	r8			; read the keyboard data (r8 used as the character to put to screen)
storeToScreen:
	add par,r13,r0	; Screen address
	sss	r7			; push return address-1
	bra	putChar
	bra	loopStatRead
;
; clearScreen - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Return address (-1) is on the stack - need to increment before return
;

clearScreen:
	add par,r0,r0	; start of screen character memory
	lix	r8,0x0020	; fill with spaces
	lix r9,0x7FE	; loopCount	(1K minus 1)
looper:
	spb r8			; put the character to the screen
	add	par,par,r1	; Increment screen pointer
	add r9,r9,r2	; decrement character counter
	bne	looper		; loop until complete
	lss	r9			; load calling address
	add	r9,r9,r1	; skip the call
	add	r7,r9,r1	; jump to the next address (rts)

;
; putChar - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putChar:
	spb	r8			; write character to peripheral bus
	add	par,par,r1	; Go to the next character position	
	lss	r9			; load calling address
	add	r9,r9,r1	; inc by 1 to skip the call
	add	r7,r9,r1	; jump to the next address (rts)
	