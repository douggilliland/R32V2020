;
; P001-ANSI-Speed_Test - Test the speed of the ANSI display hardware
;
; Tests include
;	1 - Character write speed (no scroll)
;	2 - Screen clear speed
;	3 - Screen scroll speed
;

prompt:			.string "ANSI VDU Speed Tests"
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "Syntax error"
runningString:	.string "Running..."
hitAnyKey:		.string "Hit any key to exit..."
serialOverflow:	.string "Serial port overflow"
testMetric:		.string "Ran test 1024 times in (uSecs) : "
menuItem_01:	.string "01 - Character write speed"
menuItem_02:	.string "02 - Screen clear speed"
menuItem_03:	.string "03 - Screen scroll speed"

;
; Read a line from the UART and parse the line
;

main:
	bsr		clearScreen_ANSI
	lix		r8,prompt.lower
	bsr		printLinebuffer_ANSI_UART
	bsr		printMenu
	bsr		readToLineBuffer
	bsr		callTests
	bra		main

;
; printMenu - Print the menu
;

printMenu:
	push	r8
	lix		r8,menuItem_01.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,menuItem_02.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,menuItem_03.lower
	bsr		printLinebuffer_ANSI_UART
	pull	r8
	pull	PC

;
; callTests - 
; line is in lineBuff
;	1 - Character write speed
;	2 - Screen clear speed
;	3 - Screen scroll speed
; Uses r8 for the command
;

callTests:
	push	r8
	lix		r8,lineBuff.lower
	bsr		hexToSevenSeg_ANSI_UART
; testCharWriteSpeed
	cmpi	r8,0x01
	bne		skipTo2
	bsr		testCharWriteSpeed
	bra		doneTests
; testScreenClearSpeed
skipTo2:
	cmpi	r8,0x02
	bne		skipTo3
	bsr		testScreenClearSpeed
	bra		doneTests
; testScreenScrollSpeed
skipTo3:
	cmpi	r8,0x03
	bne		skipToEnd
	bsr		testScreenScrollSpeed
	bra		doneTests
; testScreenScrollSpeed
skipToEnd:
	push	r8
	lix		r8,syntaxError.lower
	bsr		printString_ANSI_UART
	pull	r8
doneTests:
	pull	r8
	pull	PC
	
;
; testCharWriteSpeed - Test Char Write Speed
; Use microsecond counter - 0x3801 is microsecond counter
; Measured 0x31F = 799 uS for 1024 chars or 0.78 uS/char or 1.2M chars/sec
;

testCharWriteSpeed:
	push	PAR
	push	r8
	push	r9
	push	r10
	bsr		clearScreen_ANSI
	lix		r8,10		; Delay for 10 mS to give the screen time to clear
	bsr		delay_mS
	lix		r8,0x31		; char to print is '1'
	lix		r10,1024	; print 1024 characters
	lix		PAR,0x3801	; microsecond counter
	lpl		r9			; read the counter
anotherCharTest:
	lix		PAR,0x0		; ANSI Screen Status (UART style)
waitScreenTxStat3:
	lpl		r11			; Read Status into r9
	andi	r11,r11,0x2
	bez 	waitScreenTxStat3
	lix 	PAR,0x1		; ANSI Screen Data (UART style)
	spl		r8			; echo the character
	subi	r10,r10,1
	bnz		anotherCharTest
	lix		PAR,0x3801	; microsecond counter
	lpl		r8			; read the counter
	sub		r8,r9,r8	; How many microseconds to clear screen?
	bsr		wr7Seg8Dig	; put number of microseconds out to 7 seg display
	bsr		newLine_ANSI_UART
	push	r8
	lix		r8,testMetric.lower
	bsr		printString_ANSI_UART
	pull	r8
	bsr		printLong_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
reload001:
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		reload001
	pull	r10
	pull	r9
	pull	r8
	pull	PAR
	pull	PC
	
;
; testScreenClearSpeed - Test Screen Clear Speed
; 1024 screen clears take 0x190CC = 102,604 uS
;	100.2 uS to clear the screen
;

testScreenClearSpeed:
	push	PAR
	push	r8
	push	r9
	push	r10
	lix		r8,10		; Delay for 10 mS to give the screen time to clear
	bsr		delay_mS
	lix		r10,1024	; clear screen 1024 times
	lix		PAR,0x3801	; microsecond counter
	lpl		r9			; read the counter
clearAgain:
	bsr		clearScreen_ANSI
	subi	r10,r10,1
	bnz		clearAgain
	lix		PAR,0x3801	; microsecond counter
	lpl		r8			; read the counter
	sub		r8,r9,r8	; How many microseconds to clear screen?
	bsr		wr7Seg8Dig	; put number of microseconds out to 7 seg display
	bsr		newLine_ANSI_UART
	push	r8
	lix		r8,testMetric.lower
	bsr		printString_ANSI_UART
	pull	r8
	bsr		printLong_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printString_ANSI_UART
reload002:
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		reload002
	pull	r10
	pull	r9
	pull	r8
	pull	PAR
	pull	PC
	
;
; testScreenScrollSpeed - Test Screen Scroll Speed
; 1024 lines in 0x0FC7 uSecs = 4,039 uS
;	 3.94 uS to scroll screen
;

testScreenScrollSpeed:
	push	PAR
	push	r8
	push	r9
	push	r10
	push	r11
	lix		r8,0x0A				; Line Feed
	lix		r10,26				; prescroll by 26 lines to get to the bottom of the screen
scrollAgain:
	bsr		putChar_ANSI
	subi	r10,r10,1
	bnz		scrollAgain
	lix		r8,500		; Delay for 500 mS to give the screen time to scroll
	bsr		delay_mS
	lix		r8,0x0A				; Line Feed
	lix		r10,1024
	lix		PAR,0x3801	; microsecond counter
	lpl		r9			; read the counter
anotherScroll:
	lix		PAR,0x0		; ANSI Screen Status (UART style)
waitScreenTxStat2:
	lpl		r11			; Read Status into r9
	andi	r11,r11,0x2
	bez 	waitScreenTxStat2
	lix 	PAR,0x1		; ANSI Screen Data (UART style)
	spl		r8			; echo the character
	subi	r10,r10,1
	bnz		anotherScroll
	lix		PAR,0x3801	; microsecond counter
	lpl		r8			; read the counter
	sub		r8,r9,r8	; How many microseconds to clear screen?
	bsr		wr7Seg8Dig	; put number of microseconds out to 7 seg display
	bsr		newLine_ANSI_UART
	push	r8
	lix		r8,testMetric.lower
	bsr		printString_ANSI_UART
	pull	r8
	bsr		printLong_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printString_ANSI_UART
reload003:
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		reload003
	pull	r11
	pull	r10
	pull	r9
	pull	r8
	pull	PAR
	pull	PC
	
#include <..\..\common\ANSIScreen.asm>
#include <..\..\common\ANSI_UART_io.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\uart.asm>
#include <..\..\common\timers.asm>
#include <..\..\common\switches.asm>
#include <..\..\common\SevenSegLEDs.asm>
#include <..\..\common\bufferedIO.asm>
