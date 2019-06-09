dataPlaceHolder:	.string "R32V2020> "
secsCount:	.long 0x0
; delay_mS Test
	liu	DAR,secsCount.upper
	lil	DAR,secsCount.lower
	lix	r8,0
	sdl	r8
start:
	liu	DAR,secsCount.upper
	lil	DAR,secsCount.lower
	ldl	r8
	bsr	wr7Seg8Dig
	pss	r8				; save the counter
	lix	r8,1000			; count for 1 Sec
	bsr	delay_mS		; call delay_ms
	pus	r8				; restore r8
	ads	r8,r8,ONE
	sdl	r8
	bra	start

; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Uses routine uses r9

delay_mS:
	pss	r9 
	pss	r8
	lix	r9,50000	; Count for 50,000 counts = 1 mSec count
	mul	r8,r8,r9	; total number of clocks to count
	lix	PAR,0x3800	; address of the elapsed time counter
	lpl	r9			; read the peripheral counter into r9
	ads	r8,r9,r8	; terminal counter to wait until is in r8
loop_delay_mS:
	lpl	r9			; check the elapsed time counter
	cmp	r9,r8
	bgt	loop_delay_mS
	pus	r8
	pus	r9
	pus	PC
	
; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

wr7Seg8Dig:
	lix	PAR,0x3000		; Seven Segment LED lines
	spl	r8				; Write out LED bits
	pus	PC
