; Data RAM Test
; Test Byte, Short, Long accesses of the Data RAM
; Verified pattern using In-System Memory Content Editor as -
; 00008 12 34 56 78 DE AD BA BA 01 02 03 04

prompt:			.string "R32V2020> "
firstVal: 		.long 0x12345678
secVal: 		.long 0xDEADBABA

start:
	lix	dar,0x0020	; set the data address register to 0x0
	liu	r8,0x1234	; data test pattern
	lil	r8,0x5678
	sdl	r8			; store r8 into the data space memory
	nop
	lix	dar,0x0024	; set the data address register to 0x0
	lix	r8,0xDEAD	; data test pattern
	sds	r8			; store r8 into the data space memory
	nop
	lix	dar,0x0026	; set the data address register to 0x0
	lix	r8,0xBABA	; data test pattern
	sds	r8			; store r8 into the data space memory
	nop
	lix	dar,0x0028	; set the data address register to 0x0
	lix	r8,0x01		; data test pattern
	sdb	r8			; store r8 into the data space memory
	nop
	lix	dar,0x0029	; set the data address register to 0x0
	lix	r8,0x02		; data test pattern
	sdb	r8			; store r8 into the data space memory
	nop
	lix	dar,0x002A	; set the data address register to 0x0
	lix	r8,0x03		; data test pattern
	sdb	r8			; store r8 into the data space memory
	nop
	lix	dar,0x002B	; set the data address register to 0x0
	lix	r8,0x04		; data test pattern
	sdb	r8			; store r8 into the data space memory
	nop
	bsr	clearScreen			; Not required for this example
	lix	r8,prompt.lower
	bsr	printString
	lix	r8,firstVal.lower
	lix	r8,secVal.lower
	hcf

;
; clearScreen - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearScreen:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		putCharToANSIScreen
	lix		r8,0x5b			; [
	bsr		putCharToANSIScreen
	lix		r8,0x32			; 2
	bsr		putCharToANSIScreen
	lix		r8,0x4A			; J
	bsr		putCharToANSIScreen
	pull	r8
	pull	PC				; rts

;
; putCharToANSIScreen - Put a character to the screen
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putCharToANSIScreen:
	push	r9
	push	PAR
	push	r10
	lix		r10,0x2		; TxReady bit
	lix		PAR,0x0		; UART Status
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitScreenTxStat
	lix 	PAR,0x1
	spl		r8			; echo the character
	pull	r10
	pull	PAR
	pull	r9
	pull	PC
	
;
; printString - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString:
	push	r8				; save r8
	push	DAR
	add		DAR,r8,ZERO		; set the start of the string
nextChar:
	ldb		r8				; get the character
	cmp		r8,ZERO			; Null terminated string
	beq		donePrStr		; done if null
	bsr		putCharToANSIScreen	; write out the character
	add		DAR,DAR,r1		; Point to next character
	bra		nextChar
donePrStr:
	pull	DAR				; restore DAR
	pull	r8				; restore r8
	pull	PC				; rts
	
