;--------------------------------------------------------------------
; music.asm

;
; setNote - Set the note
; pass note in r8
; returns note
;

setNote:
	push	PAR
	lix		PAR,0x4000
	spl		r8
	pull	PAR
	pull	PC
