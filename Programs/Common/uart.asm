;--------------------------------------------------------------------
; uart.asm

missingHandshake: .string "*** Run PuTTY and enable hardware handshake ***"

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
; -- status reg
; --     7              6                5         4          3        2         1         0
; --    irq   |   parity error      | overrun | frame err | n_cts  | n_dcd |  tx empty | rx full

;

putChar_UART:
	push	PAR
	push	r8
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x2
	bnz 	uartRdy
; Remind user to enable HW handshake
; would be better to add a HW handshake timeout
; Since the USB is so much faster it is unlikely this path 
;	will be exercised. 
; For cards with RS-232 serial this would be a serious concern
; It's more likely that PuTTY needed to be run in HW handshake mode.
; handshakeStuck:
	; lix		r8,missingHandshake.lower
	; bsr		printString_ANSI
	; pull	r8
	; bra		getOut
uartRdy:
	lix 	PAR,0x1801
	pull	r8
	spl		r8			; echo the character
getOut:
	pull	PAR
	pull	PC
	