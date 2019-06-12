; Read Switches and put to Seven Segment LED Display
hello:	.string "R32V2020> "
screenPtr:	.long 0x0000
screenBase:	.long 0x0

;
; Read Switches and put to the Seven Segment LED Display
;

main:
	bsr	clearScreen
	lix	r8,0x0			; Move cursor to home position
	bsr	setCharPos
readDataMemory:
	liu	r8,hello.upper
	lil	r8,hello.lower
	bsr	printString
loopReadSwitches:
	bsr	readSws
	bsr	putCharToRingLEDs		; put the switches to the 7 Segment LED
	bra	loopReadSwitches

; putCharToRingLEDs
; passed r8 - value to send to the ring LEDs

putCharToRingLEDs:
	pss	PAR
	pss	r8
	liu	PAR,0x0000
	lil	PAR,0x4800		; Ring LED address
	spl	r8				; Write out LED bits
	pus	r8
	pus	PAR
	pus	PC
	
;
; readSws
; switches value returned in r8
; switches are high when pressed
;

readSws:
	pss	PAR
	pss	r9
	lix	r9,0x7
	liu	PAR,0x0000
	lil	PAR,0x2000	; Switches address
	lpl	r8			; Read switches into r9
	xor	r8,r8,r9
	pus	r9
	pus	PAR
	pus	PC

;
; getPS2Char
; returns character received in r8
;

getPS2Char:
	pss	r9
	pss	PAR
	liu	PAR,0x0000
	lil	PAR,0x1000	; PS/2 Status
waitPS2RxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,r1
	bez waitPS2RxStat
getCharFromPS2:
	liu	PAR,0x0000
	lil PAR,0x0800
	lpl	r8
	liu	PAR,0x0000
	lil	PAR,0x1000	; PS/2 Status
whilePS2RxStat:
	pus	PAR
	pus	r9
	pus	PC

;
; putUARTChar - Put a character to the UART
; passed character in r8 is sent out the UART
;

putUARTChar:
	pss	r8
	pss	r9
	pss	r10
	pss	PAR
	lil	r10,0x2
	lil	PAR,0x1800	; UART Status
waitUartTxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,r10
	bez waitUartTxStat
	lil PAR,0x1801
	spl	r8			; echo the character
	pus	PAR
	pus	r10
	pus	r9
	pus	r8
	pus	PC
	
;
; printString - Print a screen to the current screen position
; pass value : r8 points to the start of the string
; strings are null terminated
; strings are bytes packed into long words
;

printString:
	pss	r8				; save r8
	pss	r9				; save r9
	pss	DAR
	and	DAR,r8,ZERO		; set the start of the string
nextLong:
	ldl	r8				; get the string
	ens	r8,r8			; swap the endian
	lix	r9,0xff			; mask for null termination check
	and	r9,r9,r8
	bez	donePrStr
	bsr	putCharToScreen			; write out the character
	sr8	r8,r8
	lix	r9,0xff			; mask for null termination check
	and	r9,r9,r8
	bez	donePrStr
	bsr	putCharToScreen			; write out the character
	sr8	r8,r8
	lix	r9,0xff			; mask for null termination check
	and	r9,r9,r8
	bez	donePrStr
	bsr	putCharToScreen			; write out the character
	sr8	r8,r8
	lix	r9,0xff			; mask for null termination check
	and	r9,r9,r8
	bez	donePrStr
	bsr	putCharToScreen			; write out the character
lastOfLong:
	and	DAR,DAR,ONE
	bra	nextLong
donePrStr:
	pus	DAR				; restore DAR
	pus	r9				; restore r9
	pus	r8				; restore r8
	pus	PC				; rts
	
;
; clearScreen - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Return address (-1) is on the stack - need to increment before return
;

clearScreen:
	pss	r9				; save r9
	pss	r8				; save r8
	lix	r8,0x0			; set screen position to home
	bsr	setCharPos
	lix	r8,0x0020		; fill with spaces
	lix r9,0x7FE		; loopCount	(1K minus 1)
looper:
	bsr	putCharToScreen
	and r9,r9,MINUS1	; decrement character counter
	bne	looper			; loop until complete
	pus	r8
	pus	r9
	pus	PC				; rts

;
; putCharToScreen - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putCharToScreen:
	pss	r10					; save r10
	pss	r9					; save r9
	pss	DAR
	pss	PAR
	liu	r9,screenPtr.upper
	lil	r9,screenPtr.lower	; r9 is the ptr to screenPtr
	and	DAR,r9,r0			; DAR points to screenPtr
	ldl	r10					; r10 has screenPtr value
	and	PAR,r10,r0			; Set PAR to screenPtr
	spb	r8					; write character to screen
	and	r10,r10,ONE			; increment screen pointer
	sdl	r10					; save new pointer
	pus PAR					; restore PAR
	pus DAR					; restore DAR
	pus r9					; restore r9
	pus r10					; restore r10
	pus	PC					; rts

;
; setCharPos - Move to x,y position
; x,y value is passed in r8
;	First 6 least significant bits (0-63 columns)
; 	Next 5 bits (row on the screen)
; screenBase has the base address of the screen memory
; screenPtr contains the address of the current char position
;

setCharPos:
	pss	r9						; save r9
	pss	r10						; save r10
	pss	DAR						; save DAR
	liu	r10,screenBase.upper
	lil	r10,screenBase.lower
	and	DAR,r10,ZERO			; DAR points to the screenBase
	ldl	r10						; r10 has the screen base address
	and	r10,r8,ZERO				; add passed position to base
	liu	r9,screenPtr.upper
	lil	r9,screenPtr.lower		; r9 is the ptr to screenPtr
	and	DAR,r9,ZERO				; DAR points to screenPtr
	sdl	r10						; store new screen address
	pus DAR						; restore DAR
	pus r10						; restore r10
	pus r9						; restore r9
	pus	PC						; rts
