;--------------------------------------------------------------------
; ANSIScreen.asm

;
; putChar_ANSI - Put a character to the screen
; Character to put to screen is in r8
;

putChar_ANSI:
	push	r9
	push	PAR
	lix		PAR,0x0		; UART Status
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitScreenTxStat
	lix 	PAR,0x1
	spl		r8			; echo the character
	pull	PAR
	pull	r9
	pull	PC

;
; newLine_ANSI - Print out a newLine_ANSI (CR-LF)
;

newLine_ANSI:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		putChar_ANSI	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		putChar_ANSI	; Echo character back to the UART
	pull	r8
	pull	PC

;
; printString_ANSI - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString_ANSI:
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextCharANSI:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrANSIStr		; done if null
	bsr		putChar_ANSI	; write out the character
	bra		nextCharANSI
donePrANSIStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; printByte_ANSI
; r8 contains the char value to print
;

printByte_ANSI:
	push	r8
	push	r9
	push	r8				; temporarily save r8
	pull	r8				; restore r8
	lix		r9,2			; loop counter
	sl8		r8,r8
	sl8		r8,r8
	sl8		r8,r8
doNextprintByte_ANSI:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI
	subi	r9,r9,1
	bnz		doNextprintByte_ANSI
	pull	r9
	pull	r8
	pull	PC
	
;
; printHexValANSI_UART
;

printHexVal_ANSI:
	push	r8
	andi	r8,r8,0xf
	cmpi	r8,9
	blt		printHexLetterANSI
	addi	r8,r8,0x30
	bsr		putChar_ANSI
	bra		donePrintHexValANSI
printHexLetterANSI:
	addi	r8,r8,0x37		; 'A' - 10
	bsr		putChar_ANSI
donePrintHexValANSI:
	pull	r8
	pull	PC
