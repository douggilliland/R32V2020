; delay_mS Test
versionString:	.string "R32V2020 > "		; here to prevent an empty data file
start:
	lix	PAR,0x3000		; Seven Segment LED lines
	add	r8,r0,MINUS1	; Turn on all LED bits should sign extend to 32-bits
	spl	r8				; Write out LED bits
	lix	r8,500			; count for 500 mSec
	bsr	delay_mS		; call delay_ms
	lix	PAR,0x3000		; Seven Segment LED lines
	add	r8,ZERO,ZERO	; Turn off all LED bits
	spl	r8				; Write out LED bits
	lix	r8,500			; count for 500 mSec
	bsr	delay_mS		; call delay_ms
	bra	start
; delay_mS - delay for the number of mSecs passed in r8
; routine uses r8,r9
delay_mS:
	push	r9
	lix	PAR,0x3802		; address of the mSec counter
	lpl	r9				; read the peripheral counter into r9
	add	r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl	r9				; check the elapsed time counter
	cmp	r8,r9
	blt	loop_delay_mS
	pull	r9
	pull	r7
