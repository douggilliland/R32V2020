;
; C074-IO_Test - Read a line from the UART serial input
; Echo line to the serial port and to the screen
; Parse the line
;

prompt:			.string "R32V2020> "
; lineBuff is 80 characters long
lineBuff:		.string "12345678901234567890123456789012345678901234567890123456789012345678901234567890"
syntaxError:	.string "Syntax error"
runningString:	.string "Running..."
hitAnyKey:		.string "Hit any key to exit..."
menuItem_01:	.string "01-Ring LED Test      "
menuItem_02:	.string "02-7 Segment LED Test "
menuItem_03:	.string "03-Pushbutton Test    "
menuItem_04:	.string "04-DIP Switch Test    "
menuItem_05:	.string "05-ANSI Screen Test   "
menuItem_06:	.string "06-Serial Port Test   "
menuItem_07:	.string "07-MCP23008 I2C Test  "
menuItem_08:	.string "08-MCP4231 SPI Test   "
menuItem_09:	.string "09-PS/2 Keyboard Test "
menuItem_10:	.string "10-Buzzer Test        "
menuItem_11:	.string "11-Timers Test        "
menuItem_12:	.string "12-TBD Test           "

;
; Read a line from the UART and parse the line
;

main:
	bsr		clearScreen_ANSI_UART
	bsr		printMenu
	bsr		readToLineBuffer
	bsr		parseLine
	bra		main

;
; printMenu - Print the menu
;

printMenu:
	push	r8
	bsr		newLine_ANSI_UART
	lix		r8,menuItem_01.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_02.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_03.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,menuItem_04.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_05.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_06.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,menuItem_07.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_08.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_09.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,menuItem_10.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_11.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,prompt.lower
	bsr		printString_ANSI_UART
	pull	r8
	pull	PC

;
; parseLine - 
; line is in lineBuff
;

parseLine:
	push	r8
	lix		r8,lineBuff.lower
	bsr		hexToSevenSeg
; Check to see if the command is 0x01
	cmpi	r8,0x01
	bne		skipTo2
	bsr		testRingLEDs
	bra		doneTests
; Check to see if the command is 0x02
skipTo2:
	cmpi	r8,0x02
	bne		skipTo3
	bsr		test7Segs
	bra		doneTests
; Check to see if the command is 0x03
skipTo3:
	cmpi	r8,0x03
	bne		skipTo4
	bsr		testPushbuttons
	bra		doneTests
; Check to see if the command is 0x04
skipTo4:
	cmpi	r8,0x04
	bne		skipTo5
	bsr		testDIPSwitches
	bra		doneTests
; Check to see if the command is 0x05
skipTo5:
	cmpi	r8,0x05
	bne		skipTo6
	bsr		testANSIScreen
	bra		doneTests
; Check to see if the command is 0x06
skipTo6:
	cmpi	r8,0x06
	bne		skipTo7
	bsr		testSerialPort
	bra		doneTests
; Check to see if the command is 0x07
skipTo7:
	cmpi	r8,0x07
	bne		skipTo8
	bsr		testMCP23008
	bra		doneTests
; Check to see if the command is 0x08
skipTo8:
	cmpi	r8,0x08
	bne		skipTo9
	bsr		testMCP4231
	bra		doneTests
; Check to see if the command is 0x09
skipTo9:
	cmpi	r8,0x09
	bne		skipTo10
	bsr		testPS2Keyboard
	bra		doneTests
; Check to see if the command is 0x10
skipTo10:
	cmpi	r8,0x10
	bne		skipTo11
	bsr		testBuzzer
	bra		doneTests
;
skipTo11:
	cmpi	r8,0x11
	bne		skipTo12
	bsr		testTBD
	bra		doneTests

skipTo12:
	push	r8
	lix		r8,syntaxError.lower
	bsr		printString_ANSI_UART
	pull	r8
doneTests:
	lix		r8,2000
	bsr		delay_mS
	pull	r8
	pull	PC
	
;
; Test Ring LEDs
;

testRingLEDs:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_01.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printString_ANSI_UART
reload:
	lix		r8,1
loopLEDRing:
	bsr		putValueToRingLEDs	; put the switches to the 7 Segment LED
	push	r8
	lix		r8,250				; wait for 1 second
	bsr		delay_mS
	pull	r8
	sl1		r8,r8
	cmpi	r8,0x0801
	bne		loopLEDRing
	lix		r8,0
	bsr		putValueToRingLEDs	; put the switches to the 7 Segment LED
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		reload
	pull	r8
	pull	PC
	
;
; Seven Segment Display Test
;

test7Segs:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_02.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printString_ANSI_UART
rerun7Segs:
	liu		r8,0x1234
	lil		r8,0x5678
	bsr		wr7Seg8Dig
	lix		r8,2000
	bsr		delay_mS
	liu		r8,0xABCD
	lil		r8,0xEF12
	bsr		wr7Seg8Dig
	lix		r8,2000
	bsr		delay_mS
	lix		r8,0x0
	bsr		wr7Seg8Dig
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		rerun7Segs
	pull	r8
	pull	PC
	

; wr7Seg8Dig
; passed r8 - value to send to the 7 seg display

; wr7Seg8Dig:
	; push	PAR
	; push	r8
	; lix		PAR,0x3000		; Seven Segment LED lines
	; spl		r8				; Write out LED bits
	; pull	r8
	; pull	PAR
	; pull	PC
	
;
; Pushbutton Test
; r8 used for temporary variables
; r9 stores the previous button value
;

testPushbuttons:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_03.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r9,0x0
loopSwRead:
	bsr		checkForCharAndDiscard
	cmpi	r8,1
	beq		doneWithSwitches
	bsr		readSws		; returns switches and pushbuttons in r8
	andi	r8,r8,0x7	; just the pushbuttons
	addi	r8,r8,0x30
	cmp		r8,r9
	beq		loopSwRead
	addi	r9,r8,0
	bsr		printByte_ANSI_UART
	bsr		newLine_ANSI_UART
	lix		r8,250
	bsr		delay_mS
	bra		loopSwRead
doneWithSwitches:
	pull	r9
	pull	r8
	pull	PC
	
;
; DIP Switch Test
;

testDIPSwitches:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_04.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r9,0x0
	lix		r8,0x0
	bsr		wr7Seg8Dig
loopSwRead2:
	bsr		checkForCharAndDiscard
	cmpi	r8,1
	beq		doneWithDIPSwitches
	bsr		readSws		; returns switches and pushbuttons in r8
	sr1		r8,r8
	sr1		r8,r8
	sr1		r8,r8
	sr1		r8,r8
	andi	r8,r8,0xff
	cmp		r8,r9
	beq		loopSwRead2
	addi	r9,r8,0
	bsr		wr7Seg8Dig
	lix		r8,250
	bsr		delay_mS
	bra		loopSwRead2
doneWithDIPSwitches:
	pull	r9
	pull	r8
	pull	PC
	
;
; ANSI Screen Test
;

redString:		.string "Red "
greenString:	.string "Green "
blueString:		.string "Blue "
cyanString:		.string "Cyan "
magentaString:	.string "Magenta "
yellowString:	.string "Yellow "
blackString:	.string "Black "
grayString:		.string "Gray "
onString:		.string "on "
brightString:	.string "Bright "

testANSIScreen:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_05.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,0x20			; start with a space
anotherCharT5:
	bsr		putChar_ANSI
	addi	r8,r8,1
	cmpi	r8,0xFF
	bne		anotherCharT5
	bsr		newLine_ANSI
; Test screen character colors
; Light characters
defaultColors:	.string "[0;1m"
	lix		r8,defaultColors.lower
	bsr		printANSICode
redChars:	.string	"[31;22m"
	lix		r8,redChars.lower
	bsr		printANSICode
	lix		r8,redString.lower
	bsr		printString_ANSI
grnChars:	.string	"[32m"
	lix		r8,grnChars.lower
	bsr		printANSICode
	lix		r8,greenString.lower
	bsr		printString_ANSI
bluChars:	.string	"[34m"
	lix		r8,bluChars.lower
	bsr		printANSICode
	lix		r8,blueString.lower
	bsr		printString_ANSI
cyanChars:	.string	"[36m"
	lix		r8,cyanChars.lower
	bsr		printANSICode
	lix		r8,cyanString.lower
	bsr		printString_ANSI
magChars:	.string	"[35m"
	lix		r8,magChars.lower
	bsr		printANSICode
	lix		r8,magentaString.lower
	bsr		printString_ANSI
yelChars:	.string	"[33m"
	lix		r8,yelChars.lower
	bsr		printANSICode
	lix		r8,yellowString.lower
	bsr		printString_ANSI
	bsr		newLine_ANSI
	lix		r8,defaultColors.lower
	bsr		printANSICode
; Bright characters
redChars2:	.string	"[31;1m"
	lix		r8,redChars2.lower
	bsr		printANSICode
	lix		r8,redString.lower
	bsr		printString_ANSI
	lix		r8,grnChars.lower
	bsr		printANSICode
	lix		r8,greenString.lower
	bsr		printString_ANSI
	lix		r8,bluChars.lower
	bsr		printANSICode
	lix		r8,blueString.lower
	bsr		printString_ANSI
	lix		r8,cyanChars.lower
	bsr		printANSICode
	lix		r8,cyanString.lower
	bsr		printString_ANSI
	lix		r8,magChars.lower
	bsr		printANSICode
	lix		r8,magentaString.lower
	bsr		printString_ANSI
	lix		r8,yelChars.lower
	bsr		printANSICode
	lix		r8,yellowString.lower
	bsr		printString_ANSI
	bsr		newLine_ANSI
	lix		r8,defaultColors.lower
	bsr		printANSICode
; Red on Black
redOnBlackANSI:	.string	"[27;40;31m"
	lix		r8,redOnBlackANSI.lower
	bsr		printANSICode
	lix		r8,redString.lower
	bsr		printString_ANSI
	lix		r8,onString.lower
	bsr		printString_ANSI
	lix		r8,grayString.lower
	bsr		printString_ANSI
; Bright Yellow on Green
brtYelOnGrn:	.string "[93;42m"
	lix		r8,brtYelOnGrn.lower
	bsr		printANSICode
	lix		r8,brightString.lower
	bsr		printString_ANSI
	lix		r8,yellowString.lower
	bsr		printString_ANSI
	lix		r8,onString.lower
	bsr		printString_ANSI
	lix		r8,greenString.lower
	bsr		printString_ANSI
; Reset to default colors
	lix		r8,defaultColors.lower
	bsr		printANSICode
	bsr		newLine_ANSI
; Hit any key to continue
	bsr		newLine_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
keepCheckCharIn:
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		keepCheckCharIn
	pull	r8
	pull	PC
	
;
; Serial Port Test
;

testSerialPort:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_06.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,0x20			; start with a space
anotherCharT6:
	bsr		putChar_UART
	addi	r8,r8,1
	cmpi	r8,0x7f
	bne		anotherCharT6
	pull	r8
	pull	PC
	
;
; MCP23008 I2C Test
;

testMCP23008:
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_07.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
; Code to initialize I2CIO8 card
	bsr		init_Regs_I2CIO8	; initialize the MCP23008 on the I2CIO8
restartLoop:
	lix		r8,0x08
loopMain:
	bsr		wrI2CAdrDat_MCP23008	; write to LEDs
	bsr		delayFromJumpers
	sr1		r8,r8					; shift LED bit right by 1
	cmpi	r8,0
	bne		loopMain
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		restartLoop				; restart the shifting
	pull	PC
	
;
; delayFromJumpers - Set delay based on header value
; returns: nothing (restores registers at return)
;

delayFromJumpers:
	push	r8
 	bsr		readI2CDat_MCP23008		; read headers into r8
	xor		r8,r8,MINUS1			; invert headers
	andi	r8,r8,0xF0				; keep 8 bits
	sl1		r8,r8
	sl1		r8,r8
	sl1		r8,r8
	bsr		delay_mS
	pull	r8
	pull	PC

;
; MCP4231 SPI Test
; Write ramp output to SPI-POTX2
; x6000-x67FF (2KB)	- SPI Address Range
; x6000 - d0-d7 = Write value
; x6001 - d0 = Write Chip Select line
; x6002 - d0 = Busy flag
;

testMCP4231:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_08.lower
	bsr		printLinebuffer_ANSI_UART
	lix		r8,hitAnyKey.lower
	bsr		printLinebuffer_ANSI_UART
reloadr8:
	lix		r8,0x00				; sent out low voltage from pot
loopForever:
	bsr		writeSPI0
	addi	r8,r8,0x1
	cmpi	r8,0x80
	bne		loopForever
	bsr		checkForCharAndDiscard
	cmpi	r8,0
	beq		reloadr8
	pull	r8
	pull	PC
	
;
; PS/2 Keyboard Test
; 0x0D
;

testPS2Keyboard:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_09.lower
	bsr		printLinebuffer_ANSI_UART
loopForeverT9:
	bsr		getChar_PS2
	bsr		printByte_ANSI_UART
	cmpi	r8,0x0D
	bne		loopForeverT9
	pull	r8
	pull	PC

;
; Buzzer Test
;

testBuzzer:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_10.lower
	bsr		printLinebuffer_ANSI_UART
	bsr		enableBuzzer
	lix		r8,0x100
	bsr		delay_mS
	bsr		disableBuzzer
	pull	r8
	pull	PC
	
;
; Timers Test
; 	Address	Timer
; 	X3800	Elapsed Time Counter
;	X3801	MicroSeconds Counter
;	X3802	Milliseconds Counter
;	X3803	CPU Instruction Counter
;

testTBD:
	push	r8
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_11.lower
	bsr		printLinebuffer_ANSI_UART
	bsr		testTimers
	pull	r8
	pull	PC
	
; 
; testTimers
; 

testTimers:
	push	r8
	push	r9
	push	PAR
	; First test the CPU Instruction Counter
	lix		PAR,0x3803		; CPU Instruction Counter
	lpl		r9				; Get the counter value
	nop
	nop
	nop
	nop
	nop
	lpl		r8
	sub		r9,r9,r8
	cmpi	r9,0x06
	beq		CPUCycleTimerDone
	lix		PAR,0x3000
	liu		r8,0xDEAD
	lil		r8,0x0001
	spl		r8
	bra		timerTestsDone
CPUCycleTimerDone:
	lix		PAR,0x3803		; CPU Instruction Counter
	lpl		r9				; Get the counter value
	nop
	nop
	nop
	nop
	nop
	lpl		r8
	sub		r9,r9,r8
	cmpi	r9,06
	beq		millisecondTimerDone
	lix		PAR,0x3000
	liu		r8,0xDEAD
	lil		r8,0x0002
	spl		r8
	bra		timerTestsDone
millisecondTimerDone:

timerTestsDone:
	pull	PAR
	pull	r9
	pull	r8
	pull	PC

;
; TBD Test
;

testRingLEDs2:
	push	r8
	push	r9
	lix		r8,runningString.lower
	bsr		printString_ANSI_UART
	lix		r8,menuItem_12.lower
	bsr		printLinebuffer_ANSI_UART
	;
	pull	r9
	pull	r8
	pull	PC

;
; asciiToHexANSI_UART - Convert a single ASCII hex character into a nibble
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

; asciiToHexANSI_UART:
	; cmpi	r8,0x66			; past 'f'
	; blt		a2h_Error
	; cmpi	r8,0x30			; below '0'
	; bgt		a2h_Error
	; cmpi	r8,0x3A			; '0' - '9'
	; bgt		gotDigit
	; cmpi	r8,0x41			; ':' - '@'
	; bgt		a2h_Error
	; cmpi	r8,0x47			; 'A' - 'F'
	; blt		gotUpperLetter
	; cmpi	r8,0x61			; 'G' - 'tick'
	; blt		a2h_Error
; ; Lower case letter
	; subi	r8,r8,0x57
	; bra		doneConvA2H
; ; number 0-9
; gotDigit:
	; subi	r8,r8,0x30
	; bra		doneConvA2H
; ; A-F
; gotUpperLetter:
	; subi	r8,r8,0x37
	; bra		doneConvA2H
; a2h_Error:
	; lix		r8,syntaxError.lower
	; bsr		printString_ANSI_UART
	; lix		r8,0xDEAD
; doneConvA2H:
	; pull	PC


#include <..\..\common\RingLEDs.asm>
#include <..\..\common\bufferedIO.asm>
#include <..\..\common\SevenSegLEDs.asm>
#include <..\..\common\switches.asm>
#include <..\..\common\mcp23008.asm>
#include <..\..\common\i2c.asm>
#include <..\..\common\spi.asm>
#include <..\..\common\uart.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\timers.asm>
#include <..\..\common\buzzer.asm>
#include <..\..\common\music.asm>
#include <..\..\common\ANSIScreen.asm>
#include <..\..\common\ANSI_UART_io.asm>
