-- Top Level Entity for R32V2020

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity R32V2020 is
	port(
		n_reset		: in std_logic;
		CLK_50		: in std_logic;
		
		rxd			: in std_logic;
		txd			: out std_logic;
		rts			: out std_logic;

		VoutVect		: out std_logic_vector(17 downto 0); -- rrrrr,gggggg,bbbbb,hsync,vsync
		
		switch0		: in std_logic;
		switch1		: in std_logic;
		switch2		: in std_logic;

		LED1			: out std_logic;
		LED2			: out std_logic;
		LED3			: out std_logic;
		LED4			: out std_logic;

		BUZZER		: out std_logic;

		ps2Clk		: in std_logic;
		ps2Data		: in std_logic;
		
		Anode_Activate : out std_logic_vector(3 downto 0);
		LED_out			: out std_logic_vector(6 downto 0)

		);
end R32V2020;

architecture struct of R32V2020 is

-- Peripheral Signals
signal n_kbCS 					:	std_logic;
signal n_dispRamCS 			:	std_logic;
signal n_aciaCS 				:	std_logic;
signal peripheralAddress	: std_logic_vector(31 downto 0);
signal peripheralDataIn		: std_logic_vector(31 downto 0);
signal peripheralDataOut	: std_logic_vector(31 downto 0);

begin

	-- Peripheral Address decoder
	n_dispRamCS 	<= '0' when peripheralAddress(15 downto 11) = "00000" else '1';	-- x0000-x07FF (2KB)
	n_kbCS 			<= '0' when peripheralAddress(15 downto 11) = "00001" else '1';	-- x0800-x0FFF (2KB)
	n_aciaCS 		<= '0' when peripheralAddress(15 downto 11) = "00010" else '1';	-- x1000-x17FF (2KB)

	VoutVect <=	video&video&video&video&video&			-- Red
					video&video&video&video&video&video&	-- Grn
					"00000"&											-- Blu
					hSync&vSync;
	
	peripheralDataIn <=
		aciaData when n_aciaCS = '0' else
		dispRamDataOutA when n_dispRamCS = '0' else
		kbReadData when n_kbCS='0' else 
		x"FF";
	
	opcodeDecoder : entity work.OpCodeDecoder
	port map (
		InstrOpCode => ,
		-- Category = System
		Op_HCF => ,
		Op_NOP => ,
		Op_RES => ,
		-- Category = ALU
		Op_ADS => ,
		Op_MUL => ,
		Op_MAO => ,
		Op_ORS => ,
		Op_ARS => ,
		Op_XRS => ,
		Op_LS1 => ,
		Op_RS1 => ,
		Op_LR1 => ,
		Op_RR1 => ,
		Op_RA1 => ,
		Op_ENS => ,
		-- Category = Immediate values
		Op_LIL => ,
		Op_LIU => ,
		-- Category = Load/Store
		Op_LDB => ,
		Op_SDB => ,
		Op_LDS => ,
		Op_SDS => ,
		Op_SDL => ,
		-- Category = Peripheral I/O
		Op_LPB => ,
		Op_SPB => ,
		Op_LPS => ,
		Op_SPS => ,
		Op_LPL => ,
		Op_SPL => ,
		-- Category = Stack
		Op_PSS => ,
		Op_PUS => ,
		-- Category = Flow Control
		Op_JSR => ,
		Op_RTS => ,
		Op_BRA => ,
		Op_BCS => ,
		Op_BCC => ,
		Op_BOV => ,
		Op_BEQ => 
	);
	
	ALU : entity work.ALU
	port map (
		i_regDataA => ,
		i_regDataB => ,
		i_Op_ADS => ,
		i_Op_MUL => ,
		i_Op_CMP => ,
		i_Op_ARS => ,
		i_Op_XRS => ,
		i_Op_ORS => ,
		i_Op_LS1 => ,
		i_Op_RS1 => ,
		i_Op_LR1 => ,
		i_Op_RR1 => ,
		i_Op_RA1 => ,
 		o_ALUDataOut => ,
		o_CondCodeBits => 
	);

	Instr_ROM : ENTITY work.BlockRom_Instruction
	PORT MAP (
		address => ,
		clock => ,
		q => 
	);

	StackRAM : ENTITY work.BlockRam_Stack
	PORT MAP	(
		address => ,
		clock => ,
		data => ,
		wren => ,
		q => 
	);

	RegisterFile : entity work.RegisterFile
	port map (
		clk			=> ,
		clear			=> ,
		wrStrobe		=> ,
		wrRegSel		=> ,
		rdRegSelA	=> ,
		rdRegSelB	=> ,
		regDataIn	=> ,
		regDataOutA	=> ,
		regDataOutB	=> 
	);

	DataRAM : ENTITY work.BlockRam_Data
	PORT MAP (
		clock => ,
		data => ,
		rdaddress => ,
		wraddress => ,
		wren => ,
		q => 
	);
	
	UART : entity work.bufferedUART
		port map(
			clk => CLOCK_50,
			n_wr => n_aciaCS or cpuClock or n_WR,
			n_rd => n_aciaCS or cpuClock or (not n_WR),
			regSel => peripheralAddress(0),
			dataIn => peripheralDataOut,
			dataOut => aciaData,
			rxClkEn => serialClkEn,
			txClkEn => serialClkEn,
			rxd => rxd,
			txd => txdBuff,
			n_cts => '0',
			n_dcd => '0',
			n_rts => rts
		);

	Display : entity work.UK101TextDisplay_svga_800x600
	port map (
		charAddr => charAddr,
		charData => charData,
		dispAddr => dispAddrB,
		dispData => dispRamDataOutB,
		clk => Video_Clk_25p6,
		video => video,
		vSync => vSync,
		hSync => hSync
	);
	
	DisplayRAM : entity work.DisplayRam2k 
	port map	(
		address_a => peripheralAddress(10 downto 0),
		address_b => dispAddrB,
		clock	=> CLOCK_50,
		data_a => peripheralDataOut,
		data_b => (others => '0'),
		wren_a => not(n_memWR or n_dispRamCS),
		wren_b => '0',
		q_a => dispRamDataOutA,
		q_b => dispRamDataOutB
	);
	
	Keyboard : entity work.UK101keyboard
	port map(
		CLK => CLOCK_50,
		nRESET => n_reset,
		PS2_CLK	=> ps2Clk,
		PS2_DATA	=> ps2Data,
		A	=> kbRowSel,
		KEYB	=> kbReadData
	);
	
	process (n_kbCS,n_memWR)
	begin
		if	n_kbCS='0' and n_memWR = '0' then
			kbRowSel <= peripheralDataOut;
		end if;
	end process;
	
	-- ____________________________________________________________________________________
	-- Baud Rate Clock Signals
	-- Serial clock DDS
	-- 50MHz master input clock:
	-- f = (increment x 50,000,000) / 65,536 = 16X baud rate
	-- Baud Increment
	-- 115200 2416
	-- 38400 805
	-- 19200 403
	-- 9600 201
	-- 4800 101
	-- 2400 50
	-- 1200 25
	-- 600 13
	-- 300 6

	baud_div: process (serialClkCount_d, serialClkCount)
		begin
			serialClkCount_d <= serialClkCount + 6;		-- 300 baud
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(CLOCK_50)
		begin
			if rising_edge(CLOCK_50) then
					serialClkCount <= serialClkCount_d;
				if serialClkCount(15) = '0' and serialClkCount_d(15) = '1' then
					serialClkEn <= '1';
				else
					serialClkEn <= '0';
				end if;
        end if;
    end process;

end;
