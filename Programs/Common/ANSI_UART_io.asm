;--------------------------------------------------------------------
; ANSI_UART_io.asm

;
; ANSI_UART_io.asm - 
;

;
; printString_ANSI_UART - Print a screen to the current screen position
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printString_ANSI_UART:
	push	r8					; save r8
	push	DAR
	add		DAR,r8,ZERO			; set the start of the string
nextChar:
	ldbp	r8					; get the character01
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr			; done if null
	bsr		write_ANSI_UART	; write out the character
	bra		nextChar
donePrStr:
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts

;
; printLinebuffer_ANSI_UART - Print a screen to the current screen position with CRLF at the end
; pass value : r8 points to the start of the string in Data memory
; strings are bytes packed into long words
; strings are null terminated
;

printLinebuffer_ANSI_UART:
	push	r8					; save r8
	push	DAR
	addi	DAR,r8,0x0			; set the start of the string
nextChar2:
	ldbp	r8					; get the character
	cmpi	r8,0x0				; Null terminated string
	beq		donePrStr2			; done if null
	bsr		write_ANSI_UART	; write out the character
	bra		nextChar2
donePrStr2:
	bsr		newLine_ANSI_UART
	pull	DAR					; restore DAR
	pull	r8					; restore r8
	pull	PC					; rts
	
;
; newLine_ANSI_UART - Print out a newLine_ANSI_UART (CR-LF)
;

newLine_ANSI_UART:
	push	r8
	lix		r8,0x0A				; Line Feed
	bsr		write_ANSI_UART	; Put the character to the screen
	lix		r8,0x0D				; Carriage Return
	bsr		write_ANSI_UART		; Echo character back to the UART
	pull	r8
	pull	PC

;
; clearScreen_ANSI_UART - Clear the screen routine
; ANSI Terminal has an escape sequence which clears the screen and homes cursor
;

clearScreen_ANSI_UART:
	push	r8				; save r8
	lix		r8,0x1b			; ESC
	bsr		write_ANSI_UART
	lix		r8,0x5b			; [
	bsr		write_ANSI_UART
	lix		r8,0x32			; 2
	bsr		write_ANSI_UART
	lix		r8,0x4A			; J
	bsr		write_ANSI_UART
	pull	r8
	pull	PC				; rts

; write_ANSI_UART
; write out a character to both 
;	the ANSI screen and the UART

write_ANSI_UART:
	bsr		putChar_ANSI
	bsr		putChar_UART
	pull	PC

;
; asciiToHex_ANSI_UART - Convert a single ASCII hex character into a nibble
; Make conversion case insensitive
; Character to convert is passed in r8
;	'0' = 0x30
;	'9' = 0x39
;	'A' = 0x41
;	'F' = 0x46
;	'a' = 0x61
;	'f' = 0x66
; Result is returned in r8
;	0x0-0xf - Legal Values
;	'DEAD' - Not hex character
;

asciiToHex_ANSI_UART:
	cmpi	r8,0x66			; past 'f'
	blt		a2h_Error
	cmpi	r8,0x30			; below '0'
	bgt		a2h_Error
	cmpi	r8,0x3A			; '0' - '9'
	bgt		gotDigit
	cmpi	r8,0x41			; ':' - '@'
	bgt		a2h_Error
	cmpi	r8,0x47			; 'A' - 'F'
	blt		gotUpperLetter
	cmpi	r8,0x61			; 'G' - 'tick'
	blt		a2h_Error
; Lower case letter
	subi	r8,r8,0x57
	bra		doneConvA2H
; number 0-9
gotDigit:
	subi	r8,r8,0x30
	bra		doneConvA2H
; A-F
gotUpperLetter:
	subi	r8,r8,0x37
	bra		doneConvA2H
a2h_Error:
	lix		r8,syntaxError.lower
	bsr		newLine_ANSI_UART
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,0xDEAD
doneConvA2H:
	pull	PC

; hexToSevenSeg_ANSI_UART - Convert a two ASCII digit value into a hex byte
; Passed: r8 points to the start of the hex string
; Returned: r8 contains the hex value of the string
; Put the byte to the Seven Segment Display
;

hexToSevenSeg_ANSI_UART:
	push	r9
	push	DAR
	push	PAR
	lix		r9,0
	add		DAR,r8,ZERO		; Address of lineBuff (passed into this routine)
	ldbp	r8
	bsr		asciiToHex_ANSI_UART
	cmpi	r8,0xDEAD
	beq		badHexVal
	andi	r8,r8,0xf
	or		r9,r9,r8
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	sl1		r9,r9
	ldb		r8
	bsr		asciiToHex_ANSI_UART
	cmpi	r8,0xDEAD
	beq		badHexVal
	andi	r8,r8,0xf
	or		r9,r9,r8
	lix		PAR,0x3000		; seven segment display
	spl		r9
	add		r8,r9,ZERO
	bra		valOKDone
badHexVal:
	lix		r8,syntaxError.lower
	bsr		newLine_ANSI_UART
	bsr		printString_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,0xDEAD
valOKDone:
	pull	PAR
	pull	DAR
	pull	r9
	pull	PC

;
; printHexVal_ANSI_UART
;

printHexVal_ANSI_UART:
	push	r8
	andi	r8,r8,0xf
	cmpi	r8,9
	blt		printHexLetterANSI_UART
	addi	r8,r8,0x30
	bsr		write_ANSI_UART
	bra		doneprintHexValANSI_UART
printHexLetterANSI_UART:
	addi	r8,r8,0x37		; 'A' - 10
	bsr		write_ANSI_UART
doneprintHexValANSI_UART:
	pull	r8
	pull	PC
	
;
; printByte_ANSI_UART
; r8 contains the short value to print
;

printByte_ANSI_UART:
	push	r8
	push	r9
	push	r8				; temporarily save r8
	lix		r8,0x30			; print 0x
	bsr		putChar_ANSI_UART
	lix		r8,0x78
	bsr		putChar_ANSI_UART
	pull	r8				; restore r8
	lix		r9,2			; loop counter
	sl8		r8,r8
	sl8		r8,r8
	sl8		r8,r8
doNextprintByte_ANSI_UART:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI_UART
	subi	r9,r9,1
	bnz		doNextprintByte_ANSI_UART
	pull	r9
	pull	r8
	pull	PC

;
; printShort_ANSI_UART
; r8 contains the short value to print
;

printShort_ANSI_UART:
	push	r8
	push	r9
	push	r10
	push	r8				; temporarily save r8
	lix		r8,0x30
	bsr		write_ANSI_UART
	lix		r8,0x78
	bsr		write_ANSI_UART
	pull	r8				; restore r8
	lix		r9,4			; loop counter
	sl8		r8,r8
	sl8		r8,r8
doNextprintShortANSI_UART:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI_UART
	subi	r9,r9,1
	bnz		doNextprintShortANSI_UART
	pull	r10
	pull	r9
	pull	r8
	pull	PC
	
;
; printLong_ANSI_UART
; r8 contains the long value to print
;

printLong_ANSI_UART:
	push	r8
	push	r9
	push	r10
	push	r8				; temporarily save r8
	lix		r8,0x30
	bsr		write_ANSI_UART
	lix		r8,0x78
	bsr		write_ANSI_UART
	pull	r8				; restore r8
	lix		r9,8			; loop counter
doNextprintLongANSI_UART:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal_ANSI_UART
	subi	r9,r9,1
	bnz		doNextprintLongANSI_UART
	pull	r10
	pull	r9
	pull	r8
	pull	PC

; putChar_ANSI_UART
; write out a character to both 
;	the ANSI screen and the UART

putChar_ANSI_UART:
	bsr		putChar_ANSI
	bsr		putChar_UART
	pull	PC
