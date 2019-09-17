;--------------------------------------------------------------------
; switches.asm

;
; readSws
; switches value returned in r8
; switches are high when pressed
; Switches d0-d2 are the pushbutton switches (inverted in FPGA hardware)
; 	Pushbutton switches are debounced
; Switches d3-10 are the DIP switches (not inverted)
;

readSws:
	push	PAR
	lix		PAR,0x2000	; Switches address
	lpl		r8			; Read switches into r9
	andi	r8,r8,0xfff	; just the switches
	pull	PAR
	pull	PC
	
