dataNotEmpty:	.long 0x0

;
; Test Bit Bang speed
;

main:
	lix		PAR,0x5000	; 8-bit Digital Output port
repat:
	lix		r8,0x5A		; test pattern
	lix		r9,8		; bit count
loopDIO:
	spl		r8			; Output bit
	sr1		r8,r8		; get the next bit
	add		r9,r9,MINUS1 ; decrement the bit count
	bnz		loopDIO
endPoint:
	bra		repat