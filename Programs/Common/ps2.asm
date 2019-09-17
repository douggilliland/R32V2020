;--------------------------------------------------------------------
; ps2.asm - Functions to read the PS/2 keyboard
;
; Address	Function
; x0800 	Latched Keyboard Data
; x0801 	Latched Keyboard Status
; x0802 	Polled Keyboard Data
; x0803 	Polled Keyboard Status
;
; getPS2Char
; returns character received in r8
;

getPS2Char:
	push	r9
	push	PAR
	lix		PAR,0x0801	; PS/2 Status
waitPS2RxStat:
	lpl		r9			; Read Status into r9
	andi	r9,r9,0x1
	bez 	waitPS2RxStat
getCharFromPS2:
	lix 	PAR,0x0800
	lpl		r8
	lix		PAR,0x0801	; PS/2 Status
whilePS2RxStat:
	pull	PAR
	pull	r9
	pull	PC

; waitReadPS2_UART
; wait for character from either 
;	the PS/2 keyboard or the UART serial
; r8 = read character

waitReadPS2_UART:
	push	PAR
checkCharFromPS2:
	lix		PAR,0x0801	; PS/2 Status
	lpl		r8			; Read Status
	andi	r8,r8,0x1	; =1 when char received
	bez 	checkUARTStat
	lix 	PAR,0x0800	; PS/2 Data
	lpl		r8
	bra		gotPS2Char
checkUARTStat:
	lix		PAR,0x1800	; UART Status
	lpl		r8			; Read Status
	andi 	r8,r8,0x1	; =1 when char received
	bez 	checkCharFromPS2
	lix 	PAR,0x1801	; UART Data
	lpl		r8
gotPS2Char:
	pull	PAR
	pull	PC
	
; checkForCharAndDiscard - Check for a character in UART or PS/2
; Discard the character received
; return whether char was present (1) or no char was present (0)

checkForCharAndDiscard:
	push	PAR
	lix		PAR,0x0801	; PS/2 Status
	lpl		r8			; Read Status
	andi	r8,r8,0x1	; =1 when char received
	bez 	checkUARTStat2
	lix 	PAR,0x0800	; PS/2 Data
	lpl		r8			; throw away char
	lix		r8,0x1
	bra		gotChar
checkUARTStat2:
	lix		PAR,0x1800	; UART Status
	lpl		r8			; Read Status
	andi 	r8,r8,0x1	; =1 when char received
	bez 	noCharReceived
	lix 	PAR,0x1801	; UART Data
	lpl		r8
	lix		r8,1
	bra		gotChar
noCharReceived:
	lix		r8,0
gotChar:
	pull	PAR
	pull	PC

;
; waitCharPolled_PS2 - Check the polled character interface
; wait for a character
; return when a character is present
; returns character received in r8
;

waitCharPolled_PS2:
	push	PAR
	lix		PAR,0x0803	; PS/2 Status
waitPS2RxStatPolled:
	lpl		r8			; Read Status into r8
	andi 	r8,r8,0x1
	bez 	waitPS2RxStatPolled
getCharFromPS2Polled:
	lix 	PAR,0x0802
	lpl		r8
whilePS2RxStatPolled:
	pull	PAR
	pull	PC

;
; checkGetStat_PS2 - Checks the polling status
; Polled interface is active while the keyboard key is pressed
; returns 
;	-1 if there is no character, 
;	character if there is a character
;

checkGetStat_PS2:
	push	PAR
	lix		PAR,0x0803	; PS/2 Status
	lpl		r8			; Read Status into r8
	andi	r8,r8,0x1
	bez		charNotPresent
	lix		PAR,0x0802
	lpl		r8
	bra		gotCharIn
charNotPresent:
	add		r8,ZERO,MINUS1
gotCharIn:
	pull	PAR
	pull	PC
