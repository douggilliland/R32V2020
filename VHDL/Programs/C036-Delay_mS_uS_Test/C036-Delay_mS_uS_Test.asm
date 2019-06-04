; delay_mS Test
start:
	lix	PAR,0x3000	; Seven Segment LED lines
	lix	r8,0xffff	; Turn on all LED bits
	spl	r8			; Write out LED bits
	ads	r8,r0,r0	; clear r8
	lil	r8,500		; count for 500 mSec
	sss	r7			; store the current PC to the stack
	bra	delay_mS	; call delay_ms
	lix	PAR,0x3000	; Seven Segment LED lines
	lix	r8,0x0000	; Turn off all LED bits
	spl	r8			; Write out LED bits
	ads	r8,r0,r0	; clear r8
	lil	r8,500		; count for 500 mSec
	sss	r7			; store the current PC to the stack
	bra	delay_mS	; call delay_ms
	bra	start
; delay_mS - delay for the number of mSecs passed in r8
; routine uses r8,r9
delay_mS:
	ads	r9,r0,r0	; Clear r8
	lil	r9,50000	; Count for 50,000 counts = 1 mSec count
	mul	r8,r8,r9	; total number of clocks to count
	lix	PAR,0x3800	; address of the elapsed time counter
	lpl	r9			; read the peripheral counter into r9
	ads	r8,r9,r8	; terminal counter to wait until is in r8
loop_delay_mS:
	lpl	r9			; check the elapsed time counter
	cmp	r9,r8
	bgt	loop_delay_mS
	lss	r9			; do a return from the routine
	ads	r9,r9,r1	; skip the call
	ads	r7,r9,r1	; jump to the next address (rts)
