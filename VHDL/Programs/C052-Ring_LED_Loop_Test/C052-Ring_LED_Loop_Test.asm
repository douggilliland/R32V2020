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
	lix	r8,hello.lower
	bsr	printString
	lix	r9,0x1000			; ring has been circled
reload:
	lix	r8,1
loopLEDRing:
	bsr	putValueToRingLEDs	; put the switches to the 7 Segment LED
	pss	r8
	lix	r8,250				; wait for 1 second
	bsr	delay_mS
	pus	r8
	sl1	r8,r8
	cmp	r8,r9
	bne	loopLEDRing
	bra	reload

; putValueToRingLEDs
; passed r8 - value to send to the ring LEDs

putValueToRingLEDs:
	pss	PAR
	pss	r8
	lix	PAR,0x4800		; Ring LED address
	spl	r8				; Write out LED bits
	pus	r8
	pus	PAR
	pus	PC

; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Uses routine uses r9

delay_mS:
	pss	r9
	lix	PAR,0x3802		; address of the mSec counter
	lpl	r9				; read the peripheral counter into r9
	add	r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl	r9				; check the elapsed time counter
	cmp	r8,r9
	blt	loop_delay_mS
	pus	r9
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
	lix	PAR,0x2000	; Switches address
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
	lix	PAR,0x1000	; PS/2 Status
waitPS2RxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,ONE
	bez waitPS2RxStat
getCharFromPS2:
	lix PAR,0x0800
	lpl	r8
	lix	PAR,0x1000	; PS/2 Status
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
	lix	PAR,0x1800	; UART Status
waitUartTxStat:
	lpl	r9			; Read Status into r9
	and r9,r9,r10
	bez waitUartTxStat
	lix PAR,0x1801
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
	add	DAR,r8,ZERO		; set the start of the string
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
	add	DAR,DAR,ONE
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
	add r9,r9,MINUS1	; decrement character counter
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
	lix	r9,screenPtr.lower	; r9 is the ptr to screenPtr
	add	DAR,r9,ZERO			; DAR points to screenPtr
	ldl	r10					; r10 has screenPtr value
	add	PAR,r10,ZERO		; Set PAR to screenPtr
	spb	r8					; write character to screen
	add	r10,r10,ONE			; increment screen pointer
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
	add	DAR,r10,ZERO			; DAR points to the screenBase
	ldl	r10						; r10 has the screen base address
	add	r10,r8,ZERO				; add passed position to base
	liu	r9,screenPtr.upper
	lil	r9,screenPtr.lower		; r9 is the ptr to screenPtr
	add	DAR,r9,ZERO				; DAR points to screenPtr
	sdl	r10						; store new screen address
	pus DAR						; restore DAR
	pus r10						; restore r10
	pus r9						; restore r9
	pus	PC						; rts
