; Write to the SPI-POTX2 card
;	http://land-boards.com/blwiki/index.php?title=SPI-POTX2
;	Card has an Dual Digital Potentiometers
; Arduino code 
; https://raw.githubusercontent.com/land-boards/lb-Arduino-Code/master/LBCards/SPIPOTX2/SPI-POTX2-Triangle/SPI-POTX2-Triangle.ino
; 

prompt:			.string "R32V2020> "
xfered:			.string "Transfered"

;
; main
;

main:
	bsr		clearScreen			; Not required for this example
	lix		r8,prompt.lower		; r8 contains the pointer to the the prompt 
	bsr		printString			; Print the prompt to the screen

; Write ramp output to SPI-POTX2
; x6000-x67FF (2KB)	- SPI Address Range
; x6000 - d0-d7 = Write value
; x6001 - d0 = Write Chip Select line
; x6002 - d0 = Busy flag
; x6003 - 

	lix		r9,0x80				; loop terminal count
reloadr8:
	lix		r8,0x00				; sent out low voltage from pot
loopForever:
	bsr		writeSPI0
	add		r8,r8,r1
	cmp		r8,r9
	bne		loopForever
	bra		reloadr8

transferDone:
	lix		r8,xfered.lower		; embedded print string
	bsr		printString			; Print the string to the screen

;
; writeSPI0 - Write to the first SPI pot
; r8 contains the data to write out
; 16-bit command Fig 7-1 in the data sheet
;

writeSPI0:
	push	r8
	lix		r8,0x00			; start chip select
	lix		PAR,0x6001		; Chip Select Address
	spl		r8				; Turn on Chip Select
	lix		r8,0x00			; register select - REG0
	lix		PAR,0x6000		; Data address
	spl		r8				; Store data to the SPI bus
	bsr		waitSPITxRdy	; Wait for Tx Ready
	pull	r8				; data to write
	push	r8
	lix		PAR,0x6000		; data address
	spl		r8				; Store data to the SPI bus
	bsr		waitSPITxRdy	; Wait for Tx Ready
	lix		r8,0x01			; end chip select
	lix		PAR,0x6001		; Chip select address
	spl		r8				; Turn off chip select
	pull	r8
	pull	PC				; return	

;
; waitSPITxRdy - wait for SPI transfer to be complete
; Don't write until the busy cycles high then low
; R32V2020 is much faster than the SPI interface
; Need to wait for the busy to get set and the cleared again
;

waitSPITxRdy:
	push	r8			; save r8 since it's used by calling function(s)
	lix		PAR,0x6002	; SPI busy bit address
loopSPIRdy:				; wait until busy gets set
	lpl		r8			; load the busy bit
	cmp		r8,r0		; 0 = not yet set
	beq		loopSPIRdy	; wait until busy is set
loopSPIRdy2:			; wait while busy is set
	lpl		r8			; load the busy bit
	cmp		r8,r1		; 1 = busy is set
	beq		loopSPIRdy2	; still busy
	pull	r8			; restore r8
	pull	PC			; return

;
; readUartStatus
;
	
readUartStatus:
	bsr		waitGetCharFromUART
putCharToANSIScreenAndUART:
	bsr		putCharToANSIScreen	; put the character to the screen
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
	push	r10
	push	PAR
	lix		r10,0x2		; TxReady bit
	lix		PAR,0x0		; UART Status
waitScreenTxStat:
	lpl		r9			; Read Status into r9
	and 	r9,r9,r10
	bez 	waitScreenTxStat
	lix 	PAR,0x1
	spl		r8			; echo the character
	pull	PAR
	pull	r10
	pull	r9
	pull	PC
	
;
; makeBuzz - Make the buzzer buzz
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
	
; delay_mS - delay for the number of mSecs passed in r8
; pass mSec delay in r8
; Routine uses r9

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
