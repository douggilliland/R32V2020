; Test immediate instructions
myDat:	.long 0x0

start:
	lix		r8,0x1234
	addi	r8,r8,1
	subi	r8,r8,4
	cmpi	r8,0x1231
	beq		goodVal
	lix		r8,0xBAD
	bsr		wr7Seg8Dig
	bra		forever
goodVal:
	lix		r8,0x900d
	bsr		wr7Seg8Dig
forever:
	bra		forever
	
; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

wr7Seg8Dig:
	push	PAR
	push	r8
	lix		PAR,0x3000		; Seven Segment LED lines
	spl		r8				; Write out LED bits
	pull	r8
	pull	PAR
	pull	PC
