;--------------------------------------------------------------------
; bufferedIO.asm - collection of buffered I/O routines
;
; readToLineBuffer - Reads the UART and fills a buffer with the characters received
; r8 received character - Character received from the UART
; r9 is the input buffer length
; r10 used to test the backspace doesn't go past the start of the buffer
; DAR points to lineBuff current character position
;

readToLineBuffer:
	push	r8
	push	r9
	push	r10
	push	DAR
	lix		DAR,lineBuff.lower	; DAR pointer = start of line buffer
	lix		r9,79				; number of chars in the line buffer
loopReadLine:
	bsr		waitReadPS2_UART	; Get a character from the UART
	bsr		write_ANSI_UART		; Echo character back to the UART
	cmpi	r8,0x0D				; check if received char was end of line
	beq		gotEOL
	cmpi	r8,0x7F
	beq		gotBackspace
	sdbp	r8
	add		r9,r9,MINUS1
	bnz		loopReadLine		; Next char would overflow
	; tbd add code for line too long	
gotEOL:
	lix		r8,0x0A				; Echo line feed after CR
	bsr		write_ANSI_UART	; Put the character to the screen
	bsr		putChar_UART		; Echo character back to the UART
	sdb		r0					; null at end of line read
	bra		doneHandlingLine
gotBackspace:
	add		DAR,DAR,MINUS1
	lix		r10,lineBuff.lower	; r10 pointer = start of line buffer
	cmp		r10,DAR
	bgt		loopReadLine
	addi	DAR,r10,0
	bra		loopReadLine
doneHandlingLine:
	pull	DAR
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; printLong
; r8 contains the long value to print
;

printLong:
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
doNextPrintLong:
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	rol1	r8,r8
	bsr		printHexVal
	subi	r9,r9,1
	bnz		doNextPrintLong
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; printHexVal
;

printHexVal:
	push	r8
	andi	r8,r8,0xf
	cmpi	r8,9
	blt		printHexLetter
	addi	r8,r8,0x30
	bsr		write_ANSI_UART
	bra		donePrintHexVal
printHexLetter:
	addi	r8,r8,0x37		; 'A' - 10
	bsr		write_ANSI_UART
donePrintHexVal:
	pull	r8
	pull	PC

