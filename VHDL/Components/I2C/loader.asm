 		DEVICE	ZXSPECTRUM48
; -----------------------------------------------------------------[06.04.2015]
; ReVerSE-U16 Loader Version 1.0 By MVV
; -----------------------------------------------------------------------------
; 06.04.2015	������ ������


system_port	equ #0001	; bit2 = (0:Loader ON, 1:Loader OFF); bit1 = (NC); bit0 = (0:M25P16, 1:ENC424J600)
mask_port	equ #0000	; ����� ����� EXT_MEM_PORT �� AND
ext_mem_port	equ #dffd	; ���� ������
pr_param	equ #7f00



	org #0000
startprog:
	di
	ld sp,#7ffe

	xor a
	out (#fe),a
	call cls	; ������� ������
	ld hl,str1
	call print_str


	xor a		;bit2 = (0:Loader ON, 1:Loader OFF); bit1 = (NC); bit0 = (0:M25P16, 1:ENC424J600)
	ld bc,system_port
	out (c),a
	

; 0B0000 GS 	32K
; 0B8000 GLUK	16K	0
; 0BC000 TR-DOS	16K	1
; 0C0000 OS'86	16K	2
; 0C4000 OS'82	16K	3
; 0C8000 divMMC	 8K	4

; -----------------------------------------------------------------------------
; SPI autoloader
; -----------------------------------------------------------------------------
	call spi_start
	ld d,%00000011	; command = read
	call spi_w

	ld d,#0b	; address = #0b0000
	call spi_w
	ld d,#00
	call spi_w
	ld d,#00
	call spi_w
		
	ld hl,#8000	; gs rom 32k
spi_loader1
	call spi_r
;	ld (hl),a
	inc hl
	ld a,l
	or h
	jr nz,spi_loader1
	
	ld bc,mask_port
	ld a,%11111111	; ����� ����� �� and
	out (c),a
	ld a,%00100100
	ld bc,ext_mem_port
	out (c),a

	xor a		; ��������� �������� ���
spi_loader3
	ld bc,#7ffd
	out (c),a
	ld hl,#c000
	ld e,a
spi_loader2
	call spi_r
	ld (hl),a
	out (#fe),a
	inc hl
	ld a,l
	or h
	jr nz,spi_loader2
	ld a,e
	inc a
	cp 5
	jr c,spi_loader3

	call spi_end
	xor a
	ld bc,#7ffd
	out (c),a
	ld bc,ext_mem_port
	out (c),a
	ld a,%00011111	; ����� ����� (��������� 4mb)
	ld bc,mask_port
	out (c),a

	xor a
	out (#fe),a

	ld hl,str3	;���������
	call print_str

	ld hl,str4	;������������� MC14818A
	call print_str

; -----------------------------------------------------------------------------
; I2C DS1338
; -----------------------------------------------------------------------------
rtc_init
	ld bc,#3f00
	ld hl,#8000
	call i2c_get

	ld hl,str3	;���������
	call print_str

	;����� �������
	ld a,(#8002)	;���
	and #1f
	call print_hex
	ld a,":"
	call print_char
	ld a,(#8001)	;������
	call print_hex
	ld a,":"
	call print_char
	ld a,(#8000)	;�������
	and #7F
	call print_hex

	;����� ����
	ld a," "
	call print_char
	ld a,(#8004)	;�����
	call print_hex
	ld a,"."
	call print_char
	ld a,(#8005)	;�����
	call print_hex
	ld a,"."
	call print_char
	ld a,(#8006)	;���
	call print_hex

	ld hl,str0	;any key
	call print_str

	call anykey

	ld a,%00000100	; bit2 = (0:Loader ON, 1:Loader OFF); bit1 = (NC); bit0 = (0:M25P16, 1:ENC424J600)
	ld bc,system_port
	out (c),a

	ld sp,#ffff
	jp #0000	; ������ �������













; -----------------------------------------------------------------------------	
; I2C 
; -----------------------------------------------------------------------------
; Ports:
; #8C: Data (write/read)
;	bit 7-0	= Stores I2C read/write data
; #8C: Address (write)
; 	bit 7-1	= Holds the first seven address bits of the I2C slave device
; 	bit 0	= I2C 1:read/0:write bit

; #9C: Command/Status Register (write)
;	bit 7-2	= Reserved
;	bit 1-0	= 00: IDLE; 01: START; 10: nSTART; 11: STOP
; #9C: Command/Status Register (read)
;	bit 7-2	= Reserved
;	bit 1 	= 1:ERROR 	(I2C transaction error)
;	bit 0 	= 1:BUSY 	(I2C bus busy)

; HL= ����� ������
; B = ����� (0=256 ����)
; C = �����
i2c_get	
	ld a,%11111101	; start
	out (#9c),a
	ld a,%11010000	; slave address w
	out (#8c),a
	call i2c_ack
	ld a,%11111110	; nstart
	out (#9c),a
	ld a,c		; word address
	out (#8c),a
	call i2c_ack
	ld a,%11111101	; start
	out (#9c),a
	ld a,%11010001	; slave address r
	out (#8c),a
	call i2c_ack
	ld a,%11111100	; idle
	out (#9c),a
i2c_get2
	out (#8c),a
	call i2c_ack
	in a,(#8c)
	ld (hl),a
	inc hl
	ld a,b
	cp 2
	jr nz,i2c_get1
	ld a,%11111111	; stop
	out (#9c),a
i2c_get1
	djnz i2c_get2
	ret

; wait ack
i2c_ack
	in a,(#9c)
	rrca		; ack?
	jr c,i2c_ack
	rrca		; error?
	ret

; -----------------------------------------------------------------------------	
; SPI -- V0.2.1	(20130901)
; -----------------------------------------------------------------------------
; Ports:
; #02: Data Buffer (write/read)
;	bit 7-0	= Stores SPI read/write data
; #03: Command/Status Register (write)
;	bit 7-1	= Reserved
;	bit 0	= 1:END   	(Deselect device after transfer/or immediately if START = '0')
; #03: Command/Status Register (read):
; 	bit 7	= 1:BUSY	(Currently transmitting data)
;	bit 6-0	= Reserved

spi_end
	ld a,%00000001	; config = end
	out (#03),a
	ret
spi_start
	xor a
	out (#03),a
	ret
spi_w
	in a,(#03)
	rlca
	jr c,spi_w
	ld a,d
	out (#02),a
	ret
spi_r
	ld d,#ff
	call spi_w
spi_r1	
	in a,(#03)
	rlca
	jr c,spi_r1
	in a,(#02)
	ret
	
;==============================================================================
; CMOS Setup Utility	
	

;==============================================================================

; clear screen
cls
	xor a
	out (#fe),a
	ld hl,#5aff
cls1
	ld (hl),a
	or (hl)
	dec hl
	jr z,cls1
	ret

; print string i: hl - pointer to string zero-terminated
print_str
	ld a,(hl)
	cp 17
	jr z,print_color
	cp 23
	jr z,print_pos_xy
	cp 24
	jr z,print_pos_x
	cp 25
	jr z,print_pos_y
	or a
	ret z
	inc hl
	call print_char
	jr print_str
print_color
	inc hl
	ld a,(hl)
	ld (pr_param+2),a	; color
	inc hl
	jr print_str
print_pos_xy
	inc hl
	ld a,(hl)
	ld (pr_param),a		; x-coord
	inc hl
	ld a,(hl)
	ld (pr_param+1),a	; y-coord
	inc hl
	jr print_str
print_pos_x
	inc hl
	ld a,(hl)
	ld (pr_param),a		; x-coord
	inc hl
	jr print_str
print_pos_y
	inc hl
	ld a,(hl)
	ld (pr_param+1),a	; y-coord
	inc hl
	jr print_str

; print character i: a - ansi char
print_char
	push hl
	push de
	push bc
	cp 13
	jr z,pchar2
	sub 32
	ld c,a			; �������� ��������� � �
	ld hl,(pr_param)	; hl=yx
	;���������� -> scr adr
	;in: H - Y ����������, L - X ����������
	;out:hl - screen adress
	ld a,h
	and 7
	rrca
	rrca
	rrca
	or l
	ld l,a
	ld a,h
        and 24
	or 64
	ld d,a
	;scr adr -> attr adr
	;in: hl - screen adress
	;out:hl - attr adress
	rrca
	rrca
	rrca
	and 3
	or #58
	ld h,a
	ld a,(pr_param+2)	; ����
	ld (hl),a		; ������ �������� �������
	ld e,l
	ld l,c			; l= ������
	ld h,0
	add hl,hl
	add hl,hl
	add hl,hl
	ld bc,font
	add hl,bc
	ld b,8
pchar3	ld a,(hl)
	ld (de),a
	inc d
	inc hl
	djnz pchar3
	ld a,(pr_param)		; x
	inc a
	cp 32
	jr c,pchar1
pchar2
	ld a,(pr_param+1)	; y
	inc a
	cp 24
	jr c,pchar0
	xor a
pchar0
	ld (pr_param+1),a
pchar00
	xor a
pchar1
	ld (pr_param),a
	pop bc
	pop de
	pop hl
	ret

; print hexadecimal i: a - 8 bit number
print_hex
	ld b,a
	and $f0
	rrca
	rrca
	rrca
	rrca
	call hex2
	ld a,b
	and $0f
hex2
	cp 10
	jr nc,hex1
	add 48
	jp print_char
hex1
	add 55
	jp print_char

;�������� �������
anykey
	xor a			;��� ���� ��������
	in a,(#fe)		;���������� ��� ��������
	cpl			;����� ������������ ����������:
	and 31 			;AND 31:CP 31,  �� ������
	jr z,anykey 		;���� �� ������ ANY KEY
	ret

;����������� ����
;13 (0x0d)		- ���� ������
;17 (0x11),color	- �������� ���� ����������� ��������
;23 (0x17),x,y		- �������� ������� �� ���������� x,y
;24 (0x18),x		- �������� ������� �� x
;25 (0x19),y		- �������� ������� �� y
;0			- ����� ������
	
str1	
;          "                                "
	db 23,0,0,17,#47,"ReVerSE-U16 DevBoard",17,7,13,13
	db "FPGA SoftCore - ZX-Poly v2.10",13
	db "(build 20150406) By MVV",13,13
	db "Copying data from FLASH...",0
str3
	db 17,4," done",17,7,13,0
str4
	db 13,"RTC data read...",0
str0
;          "                                "
	db 13,13,"CPU0 ",17,4,"3.5 MHz",17,7,", Memory ",17,4,"512 KB",17,7
	db 13,13,"F1..F4: Window Select",13
	db "    F5: NMI Button",13
	db "    F6: DivMMC 512KB On/Off",13
	db "   F12: Local Reset",13
	db "PrtScr: System Reset",13
	db " Pause: Hard Reset All",13
	db "   Win: Full Window"
	db 23,0,22,"Press ENTER to continue",0
font	
	INCBIN "font.bin"

	display "Size of ROM is: ",/a, $
	
	savebin "loader.bin",startprog, 2048