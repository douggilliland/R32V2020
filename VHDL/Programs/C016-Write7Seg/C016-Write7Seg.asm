; Peripheral Test
; Put characters on the screen
start:
;	ads	r8,r0,r0	; need a nop until I fix the first fetch
	bra	clearScreen
doneClear:
	ads r5,r0,r0	; start of screen character memory
	ads r8,r0,r0	; clear the character
	lil	r8,0x0048	; ASCII 'H'
	ads	r9,r7,r1
	bra	putChar
	lil	r8,0x0065	; ASCII 'e'
	ads	r9,r7,r1
	bra	putChar
	lil	r8,0x0065	; ASCII 'e'
	ads	r9,r7,r1
	bra	putChar
wr7SegDisplay:
	lil	r5,0x3000	; Seven Segment Display address
	lil	r9,0x1234	; Value to write to display
	spb	r9			; Write to the Seven Segment display
	hcf
; Clear the screen routine
clearScreen:
	ads r5,r0,r0	; start of screen character memory
	ads r8,r0,r0	; clear the character
	lil	r8,0x0020	; fill with spaces
	ads r9,r0,r0	; screen count
	lil r9,0x7FE	; loopCount	
looper:
	spb r8			; put the character to the screen
	ads	r5,r5,r1	; Increment screen pointer
	ads r9,r9,r2	; decrement character counter
	bne	looper		; loop until complete
	bra	doneClear
; put a character to the screen and increment the address
putChar:
	spb	r8			; write character to peripheral bus
	ads	r5,r5,r1	; Go to the next character position	
	ads	r7,r9,r1	; return to calling routine (r9 is the calling address)
	