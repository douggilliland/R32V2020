; Read PS/2 keyboard character in polled mode
; Put character to the Screen
; Requires V002 Peripherals build with ANSI screen support
; On RETRO-EP4 card, requires PuTTY to be running to read serial port
; PuTTY needs to be in Hardware Handshake mode
; SigRok PS/2 decoder https://www.sigrok.org/blog/new-protocol-decoder-ps2

prompt:	.string "R32V2020> "
;missingHandshake: .string "*** Run PuTTY and enable hardware handshake ***"
screenPtr:	.long 0x0000
screenBase:	.long 0x0

;
; Read PS/2 character and put it to the SVGA Display and the Serial Port
;

main:
	bsr		clearScreen_ANSI
	lix		r8,prompt.lower
	bsr		printString_ANSI
soundOff:
	lix		r9,0x3F				; Sound generator note off (middle of range)
	lix		PAR,0x4000			; Sound generator
	spl		r9					; shut note off
loopPS2Read_ScreenWrite:
	bsr		checkGetStat_PS2	; Check for polled char
	cmp		r8,MINUS1
	beq		soundOff
	andi	r8,r8,0x7f			; mask the non-note bits
	ori		r8,r8,0x80			; turn on the note enable
	lix		PAR,0x4000			; Sound generator
	spl		r8
	lix		r8,10				; set the delay between repeats
	bsr		delay_mS
	bra		loopPS2Read_ScreenWrite

#include <..\..\common\timers.asm>
#include <..\..\common\ps2.asm>
#include <..\..\common\uart.asm>
#include <..\..\common\ANSIScreen.asm>
