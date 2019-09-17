;--------------------------------------------------------------------
; spi.asm

;
; writeSPI0 - Write to the first SPI pot
; r8 contains the data to write out
; 16-bit command Fig 7-1 in the MCP4231 data sheet
;

writeSPI0:
	push	r8
	lix		r8,0x00			; start chip select
	lix		PAR,0x6001		; Chip Select Address
	spl		r8				; Turn on Chip Select
	lix		r8,0x00			; register select - REG0
	lix		PAR,0x6000		; Data address
	spl		r8				; Store data to the SPI bus
	bsr		waitSPITxRdy	; Wait for Tx Ready
	pull	r8				; data to write
	push	r8
	lix		PAR,0x6000		; data address
	spl		r8				; Store data to the SPI bus
	bsr		waitSPITxRdy	; Wait for Tx Ready
	lix		r8,0x01			; end chip select
	lix		PAR,0x6001		; Chip select address
	spl		r8				; Turn off chip select
	pull	r8
	pull	PC				; return	

;
; waitSPITxRdy - wait for SPI transfer to be complete
; Don't write until the busy cycles high then low
; R32V2020 is much faster than the SPI interface
; Need to wait for the busy to get set and the cleared again
;

waitSPITxRdy:
	push	r8			; save r8 since it's used by calling function(s)
	lix		PAR,0x6002	; SPI busy bit address
loopSPIRdy:				; wait until busy gets set
	lpl		r8			; load the busy bit
	cmpi	r8,0		; 0 = not yet set
	beq		loopSPIRdy	; wait until busy is set
loopSPIRdy2:			; wait while busy is set
	lpl		r8			; load the busy bit
	cmpi	r8,1		; 1 = busy is set
	beq		loopSPIRdy2	; still busy
	pull	r8			; restore r8
	pull	PC			; return

