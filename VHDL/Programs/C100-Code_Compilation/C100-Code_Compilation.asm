hello:	.string "R32V2020> "
screenPtr:	.long 0x0
currCharLocPtr:	.long 0x0

;
; Read UART character and put it to the XVGA Display
;

main:
	lix		SAR,0x0			; Initialize stack pointer
	lix		r8,0x0			; set screen position to home
	bsr		setCharPos
	bsr		clearScreen
readDataMemory:
	lix		r8,hello.lower	; points to hello string
	bsr		printString		; pass string pointer
readUartStatus:
	bsr		waitGetCharFromUART	; block on waiting for char
putCharToScreenAndUART:
	bsr		putCharToScreen	; put the character to the screen
	lix		r9,0x0d
	cmp		r8,r9
	bne		putOutChar
	push	r8
	lix		r8,0x0a
	bsr		putCharToUART
	pull	r8
putOutChar:
	bsr		putCharToUART
	bra		readUartStatus

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
	and 	r8,r8,ONE
	bez 	waitUartRxStat
	lix 	PAR,0x1801
	lpl		r8
	pull	PAR
	pull	PC

;
; putCharToUART - Put a character to the UART
; passed character in r8 is sent out the UART
; This function is blocking but that's not usually an issue
;	since the Serial-USB interfaces is much faster than the Serial port
;

putCharToUART:
	push	r9
	push	PAR
	push	r10
	lix		r10,0x2
	lix		PAR,0x1800	; UART Status
waitUartTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitUartTxStat
	lix 	PAR,0x1801
	spl		r8			; echo the character
	pull	r10
	pull	PAR
	pull	r9
	pull	PC
	
;
; printString - Print a screen to the current screen position
; pass value : r8 points to the start of the string
; strings are null terminated
; strings are bytes packed into long words
;

printString:
	push	r8				; save r8
	push	r9				; save r9
	push	DAR
	add		DAR,r8,ZERO		; set the start of the string
nextLong:
	ldl		r8				; get the string
	ens		r8,r8			; swap the endian
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToScreen	; write out the character
	sr8		r8,r8
	lix		r9,0xff			; mask for null termination check
	and		r9,r9,r8
	bez		donePrStr
	bsr		putCharToScreen	; write out the character
lastOfLong:
	add		DAR,DAR,ONE
	bra		nextLong
donePrStr:
	pull	DAR				; restore DAR
	pull	r9				; restore r9
	pull	r8				; restore r8
	pull	PC				; rts
	
;
; clearScreen - Clear the screen routine
; Fills the screen with space characters
; Screen is memory mapped
; Screen is 64 columns by 32 rows = 2KB total space
; Return address (-1) is on the stack - need to increment before return
; Sets the pointer to the screen to the first location
;

clearScreen:
	push	r9				; save r9
	push	r8				; save r8
	lix		r8,0x0020		; fill with spaces
	lix 	r9,0x7FE		; loopCount	(1K minus 1)
looper:
	bsr		putCharToScreen
	add 	r9,r9,MINUS1	; decrement character counter
	bne		looper			; loop until complete
	lix		r8,0x0			; Move cursor to home position
	bsr		setCharPos
	pull	r8
	pull	r9
	pull	PC				; rts

;
; putCharToScreen - Put a character to the screen and increment the address
; Character to put to screen is in r8
; Return address (-1) is on the stack - need to increment before return
;

putCharToScreen:
	push	r11					; save r11
	push	r10					; save r10
	push	r9					; save r9
	push	DAR
	push	PAR
	lix		r9,screenPtr.lower	; r9 is the ptr to screenPtr
	add		DAR,r9,ZERO			; DAR points to screenPtr
	ldl		r10					; r10 has screenPtr value
; look for specific characters
	lix		r11,0x7F			; RUBOUT key
	cmp		r8,r11
	beq		gotBS
	lix		r11,0xe0			; 0x0-0x1f are ctrl chars
	and		r11,r11,r8
	bnz		notCtlChar
; Check for CR	
	lix		r11,0x0d			; CR
	cmp		r8,r11
	beq		gotCR
; Check for BELL
	lix		r11,0x07			; BELL
	cmp		r8,r11
	bne		skipPrintChar
	bsr		makeBuzz
; Goes here
	bra		skipPrintChar
gotBS:
	add		r10,r10,MINUS1
	add		PAR,r10,ZERO
	lix		r8,0x20
	spb		r8
	bra		skipPrintChar
gotCR:
	lix		r11,0xffc0			; Go to the start of the line
	and		r10,r10,r11
	lix		r11,0x40			; Go down a line
	add		r10,r10,r11
	add		PAR,r10,ONE			; Set PAR to screenPtr
	bra		skipPrintChar
notCtlChar:
	add		PAR,r10,ZERO		; Set PAR to screenPtr
	spb		r8					; write character to screen
	add		r10,r10,ONE			; increment screen pointer
skipPrintChar:
	sdl		r10					; save new pointer
	pull 	PAR					; restore PAR
	pull 	DAR					; restore DAR
	pull 	r9					; restore r9
	pull 	r10					; restore r10
	pull 	r11					; restore r11
	pull	PC					; rts

;
; setCharPos - Move to x,y position
; x,y value is passed in r8
;	First 6 least significant bits (0-63 columns)
; 	Next 5 bits (row on the screen)
; currCharLocPtr has the base address of the screen memory
; screenPtr contains the address of the current char position
;

setCharPos:
	push	r9						; save r9
	push	r10						; save r10
	push	DAR						; save DAR
	lix		r10,currCharLocPtr.lower
	add		DAR,r10,ZERO			; DAR points to the currCharLocPtr
	ldl		r10						; r10 has the screen base address
	add		r10,r8,ZERO				; add passed position to base
	lix		r9,screenPtr.lower		; r9 is the ptr to screenPtr
	add		DAR,r9,ZERO				; DAR points to screenPtr
	sdl		r10						; store new screen address
	pull	DAR						; restore DAR
	pull	r10						; restore r10
	pull	r9						; restore r9
	pull	PC						; rts

;
; scrollScreen - Scroll the screen by moving every line up by one
; Screen is a 2KB array and is displayed as 64 chars per row times 32 rows
;

scrollScreen:
	push	r8
	push	r9
	push	r10
	push	r11
	lix	r8,64
	lix	r9,0
	lix	r11,2048
loopMove:
	add	PAR,r8,ZERO		; Source
	lpl	r10
	add	PAR,r9,ZERO		; destination
	spl	r10
	add	r8,r8,ONE
	add	r9,r9,ONE
	cmp	r8,r11
	bne	loopMove
	lix	r8,0x20		; fill with spaces
	lix	r9,2048
	lix PAR,1984
loopFillSpaces:
	sps	r8
	add	PAR,PAR,ONE
	cmp	PAR,r9
	bne	loopFillSpaces
	pull	r11
	pull	r10
	pull	r9
	pull	r8
	pull	PC

;
; makeBuzz - Make the buzzer sound for 1/4 second
;

makeBuzz:
	push	r8
	lix		r8,0			; first note is 0
	bsr 	setNote
	bsr		enableBuzzer
	lix		r8,250			; count for 1 Sec
	bsr		delay_mS		; call delay_ms
	bsr		disableBuzzer
	pull	r8
	pull	PC

;
; setNote - Set the note
; pass note in r8
;

setNote:
	push	r8
	push	PAR
	lix		PAR,0x4000
	spl		r8
	pull	PAR
	pull	r8
	pull	PC

;
; enableBuzzer
;

enableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix		r9,0x0010		; Buzzer Enable line
	lix		PAR,0x2800
	lpl		r8
	or		r8,r8,r9
	spl		r8
	pull	PAR
	pull	r8
	pull	r9
	pull	PC

;
; disableBuzzer
;

disableBuzzer:
	push	r9
	push	r8
	push	PAR
	lix		r9,0xffef		; Buzzer Disable line
	lix		PAR,0x2800
	lpl		r8
	and		r8,r8,r9
	spl		r8
	pull	PAR
	pull	r8
	pull	r9
	pull	PC
	
;
; readElapsedTimeCounter
; return timer count in r8
;

readElapsedTimeCounter:
	push	PAR
	lix		PAR,0x3800		; address of the uSec counter
	lpl		r8				; read the peripheral counter into r8
	pull	PAR
	pull	PC

;	
; delay_uS - delay for the number of uSecs
; pass mSec delay in r8
; Uses routine uses r9 (saved and restored)
;

delay_uS:
	push	r9
	push	PAR
	lix		PAR,0x3801		; address of the uSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_uS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_uS
	pull	PAR
	pull	r9
	pull	PC

;
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Uses routine uses r9
;

delay_mS:
	push	r9
	push	PAR
	lix		PAR,0x3802		; address of the mSec counter
	lpl		r9				; read the peripheral counter into r9
	add		r8,r9,r8		; terminal counter to wait until is in r8
loop_delay_mS:
	lpl		r9				; check the elapsed time counter
	cmp		r8,r9
	blt		loop_delay_mS
	pull	PAR
	pull	r9
	pull	PC

;
; readCPUCycleCounter
; return CPU cycle counter in r8
; Useful function for counting the number of CPU cycles it take to do something
;

readCPUCycleCounter:
	push	PAR
	lix		PAR,0x3803		; address of the uSec counter
	lpl		r8				; read the peripheral counter into r8
	pull	PAR
	pull	PC

;
; putValueToRingLEDs
; passed r8 - value to send to the ring LEDs
;

putValueToRingLEDs:
	push	PAR
	push	r8
	lix		PAR,0x4800		; Ring LED address
	spl		r8				; Write out LED bits
	pull	r8
	pull	PAR
	pull	PC

;
; readSws
; switches value returned in r8
; switches are high when pressed
; Switches d0-d2 are the pushbutton switches (inverted)
; 	Pushbutton switches are debounced
; Switches d3-10 are the DIP switches (not inverted)
;

readSws:
	push	PAR
	push	r9
	lix		r9,0x7
	lix		PAR,0x2000	; Switches address
	lpl		r8			; Read switches into r9
	xor		r8,r8,r9
	pull	r9
	pull	PAR
	pull	PC

;
; waitGetPS2Char
; blocking function - wait for character before returning
; returns character received in r8
;

waitGetPS2Char:
	push	r9
	push	PAR
	lix		PAR,0x1000	; PS/2 Status
waitPS2RxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,ONE
	bez 	waitPS2RxStat
getCharFromPS2:
	lix 	PAR,0x0800	; PS/2 keyboard data
	lpl		r8
	pull	PAR
	pull	r9
	pull	PC

;
; getPS2StatusChar - Check the PS/2 receive data ready status bit
; Non-blocking
; return in r8 - MINUS1 means character not present
; Value other than MINUS1 is the character that was received
;

getPS2StatusChar:
	push	r9
	push	PAR
	lix		PAR,0x1000	; PS/2 Status
waitPS2RxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,ONE
	bez 	PS2NotReady
getCharFromPS2:			; character is present
	lix 	PAR,0x0800	; PS/2 keyboard data
	lpl		r8
	bra		PS2CharWasPresent	; skip return of MINUS1
PS2NotReady:
	lix		r8,0xffff
PS2CharWasPresent:
	pull	PAR
	pull	r9
	pull	PC

;
; writeDIGIO
; Write the DIGIO output lines
; value to write is passed in r8
;

writeDIGIO:
	push	PAR
	lix		PAR,0x5000	; 8-bit Digital Output port
	spl		r8			; Output bit
	pull	PAR
	pull	PC

;
; wr7Seg8Dig
; The digits of the seven segment display
; r8 is the long value to put on the display
;

wr7Seg8Dig:
	push	PAR
	lix		PAR,0x3000	; Seven Segment Display port
	spl		r8			; Output bit
	pull	PAR
	pull	PC
