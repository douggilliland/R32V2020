;--------------------------------------------------------------------
; uart.asm

;
; waitGetCharFromUART
; returns character received in r8
; function is blocking until a character is received from the UART
;

waitGetCharFromUART:
	push	PAR
	lix		PAR,0x1800	; UART Status
waitUartRxStat:
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x1
	bez 	waitUartRxStat
	lix 	PAR,0x1801
	lpl		r8
	pull	PAR
	pull	PC

;
; putChar_UART - Put a character to the UART
; passed character in r8 is sent out the UART
;

putChar_UART:
	push	r9
	push	PAR
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x2
	bez 	waitUartTxStat
	lix 	PAR,0x1801
	spl		r8			; echo the character
	pull	PAR
	pull	r9
	pull	PC
	
