-- Top Level Entity for top of R32V2020 RISC CPU design

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity ANSI_Terminal_top is
	port(
		n_reset				: in std_logic := '1';
		i_CLOCK_50			: in std_logic;
--		-- Switches, LEDs, Buzzer pins
		o_BUZZER				: out std_logic := '1';
		-- Serial port pins with handshake lines
		i_SerRxd				: in std_logic := '1';
		o_SerTxd				: out std_logic := '1';
--		i_SerCts				: in std_logic := '0';
		o_SerRts				: out std_logic := '1';
		-- VGA pins - Up to 6-bits
		o_vid_Red			: out std_logic := '0';
		o_vid_Grn			: out std_logic := '0';
		o_vid_Blu			: out std_logic := '0';
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';
		-- PS/2 Keyboard pins
		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'		
		);
end ANSI_Terminal_top;

architecture struct of ANSI_Terminal_top is

	-- Instruction Space Controls
	signal	w_InstructionRomAddress	: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_InstructionRomData		: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_clkInstrRomAddr			: std_logic := '0';

	-- Stack Space controls
	signal	w_StackRamAddress			: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_dataFromStackRam		: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_dataToStackRam			: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_writeStackRamEn			: std_logic := '0';

	signal	w_CPUDataOut				: std_logic_vector(31 downto 0) := x"00000000";

	-- Data Space Controls
	signal	w_DataRamAddress			: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_dataFromDataRam			: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_writeToDataRamEn		: std_logic := '0';
	signal	w_loadData					: std_logic := '0';
	signal	w_storeData					: std_logic := '0';
	signal	w_longData					: std_logic := '0';
	signal	w_shortData					: std_logic := '0';
	signal	w_ByteData					: std_logic := '0';


	-- Peripheral Space Controls
	signal	w_peripheralAddress		: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_dataFromPeripherals	: std_logic_vector(31 downto 0) := x"00000000";
	signal	w_peripheralRdEn			: std_logic := '0';
	signal	w_peripheralWrEn			: std_logic := '0';

	signal	w_OneHotState				: std_logic_vector(3 downto 0) := "0000";
	signal	resetLow						: std_logic := '1';

	signal	o_VideoVect					: std_logic_vector(5 downto 0) := "000000";
	-- Peripheral Chip Selects
	signal ANSI_DisplayCS 		:	std_logic := '0';
	signal w_kbCS 					:	std_logic := '0';
	signal w_kbdDat				:	std_logic_vector(7 downto 0);
	signal w_aciaCS 				:	std_logic := '0';
	signal w_LEDsCS				:	std_logic := '0';
	signal w_KDBPOLCS				:	std_logic := '0';
	-- Serial Port controls
	signal w_serialClkCount		:	std_logic_vector(15 downto 0); 
	signal w_serialClkCount_d	: 	std_logic_vector(15 downto 0);
	signal w_serialClkEn			:	std_logic;
	signal w_serialClock			:	std_logic;
	-- Serial Port
	signal w_aciaData				:	std_logic_vector(7 downto 0);
	signal w_LatData				:	std_logic_vector(7 downto 0);
	-- Display
	signal w_ANSI_DispRamDataOutA	:	std_logic_vector(7 downto 0);

	-- Music/Tone generator
	signal w_BUZZER				: 	std_logic := '0';

--attribute syn_keep: boolean;
--attribute syn_keep of w_Switch: signal is true;
	-- Address decoder addresses
	-- Provides for up to 32 "chip selects"
	-- Address bits 15 down to 11
	-- Some interfaces use lower address bits to select data/control-status
	constant ANSI_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"0";
	constant KB_BASE 		: std_Logic_Vector(4 downto 0) := '0'&x"1";
	constant ACIA_BASE 	: std_Logic_Vector(4 downto 0) := '0'&x"3";

begin

	o_vid_Red <= o_VideoVect(5) or o_VideoVect(4);
	o_vid_Grn <= o_VideoVect(3) or o_VideoVect(2);
	o_vid_Blu <= o_VideoVect(1) or o_VideoVect(0);
	
	DebounceResetSwitch	: entity work.Debouncer
	port map (
		i_CLOCK_50	=> i_CLOCK_50,
		i_PinIn		=> n_reset,
		o_PinOut		=> resetLow
	);

	-- CPU Element
	R32V2020_CPU : 	entity work.R32V2020
	port map (
		n_reset 						=> resetLow,
		-- Clock
		i_CLOCK_50 					=> i_CLOCK_50,
		o_OneHotState				=> w_OneHotState,
		-- Instruction ROM connections
		i_InstructionRomData		=> w_InstructionRomData,
		o_InstructionRomAddress	=> w_InstructionRomAddress,
		o_clkInstrRomAddr			=> w_clkInstrRomAddr,
		-- Stack RAM connections
		o_StackRamAddress			=> w_StackRamAddress,
		o_dataToStackRam			=> w_dataToStackRam,
		i_dataFromStackRam		=> w_dataFromStackRam,
		o_writeStackRamEn			=>	w_writeStackRamEn,
		-- Data RAM connections
		o_DataRamAddress			=> w_DataRamAddress,
		o_DataOutFromRegA			=> w_CPUDataOut,
		i_dataFromDataRam			=>	w_dataFromDataRam,
		o_writeToDataRamEnable	=>	w_writeToDataRamEn,
		o_loadData  				=> w_loadData,
		o_storeData 				=> w_storeData,
		o_longData  				=> w_longData,
		o_shortData 				=> w_shortData,
		o_ByteData  				=> w_ByteData,
--
		-- Peripheral Space Connections
		o_peripheralAddress		=> w_peripheralAddress,
		i_dataFromPeripherals	=> w_dataFromPeripherals,
		o_peripheralRdStrobe		=> w_peripheralRdEn,
		o_peripheralWrStrobe		=> w_peripheralWrEn
	);

	-- Instruction ROM
	Instr_ROM : entity work.BlockRom_Instruction
	PORT MAP (
		address		=> w_InstructionRomAddress(11 downto 0),
		clken			=> w_clkInstrRomAddr,
		clock 		=> i_CLOCK_50,
		q 				=> w_InstructionRomData
	);
	
	-- Stack RAM
	Stack_RAM : entity work.BlockRam_Stack
	PORT MAP	(
		address	=> w_StackRamAddress(6 downto 0),
		clock		=> i_CLOCK_50,
		data		=> w_dataToStackRam,
		wren		=> w_writeStackRamEn,
		q			=> w_dataFromStackRam
	);

	-- Data RAM
	
	Data_RAM_Wrap : entity work.Wrap_Data_Ram
	PORT MAP (
		address 		=> w_DataRamAddress,
		clock 		=> i_CLOCK_50,
		dataIn		=> w_CPUDataOut,
		i_loadData  =>	w_loadData,
		i_storeData =>	w_storeData,
		i_longData  =>	w_longData,
		i_shortData =>	w_shortData,
		i_ByteData  =>	w_ByteData,
		rden			=> '1',
		wren 			=> w_writeToDataRamEn,
		dataOut		=> w_dataFromDataRam
	);
	
	-- Peripheral Address decoder
	-- Currently only uses 16-bits of address
	ANSI_DisplayCS <= '1' when w_peripheralAddress(15 downto 11) = ANSI_BASE	else '0';	-- x0000-x07FF (2KB) - Display RAM (Memory Mapped Display uses range)
	w_kbCS	 		<= '1' when w_peripheralAddress(15 downto 11) = KB_BASE		else '0';	-- x0800-x0FFF (2KB)	- Keyboard
	w_aciaCS 		<= '1' when w_peripheralAddress(15 downto 11) = ACIA_BASE	else '0';	-- x1800-x1FFF (2KB)	- UART
	
	w_dataFromPeripherals <=
		x"000000"		& w_ANSI_DispRamDataOutA 			when	ANSI_DisplayCS = '1' else
		x"000000"		& w_kbdDat			 					when	w_kbCS			= '1' else
		x"000000"			& w_aciaData 						when	w_aciaCS 		= '1' else
		x"DEAD1234";	-- Read of a non-existing interface
	
	-- PS/2 keyboard wrapper
	kbdWrap : entity work.Wrap_Keyboard
	port map (
		i_CLOCK_50				=> i_CLOCK_50,
		i_n_reset				=> n_reset,
		i_kbCS					=> w_kbCS,
		i_peripheralAddress	=>	w_peripheralAddress,
		i_rd_Kbd					=> w_kbCS and w_peripheralRdEn,
		i_ps2_clk				=> i_ps2Clk,
		i_ps2_data				=> i_ps2Data,
		o_kbdDat					=> w_kbdDat
		);

	-- ANSI Video Display 80x25
	-- Command set from Multicomp project
	SVGA : entity work.ANSIDisplayVGA
		port map (
			n_reset			=> n_reset,
			clk				=> i_CLOCK_50,
			n_wr				=> not (ANSI_DisplayCS and w_peripheralWrEn),
			n_rd				=> not (ANSI_DisplayCS and w_peripheralRdEn),
			regSel			=> w_peripheralAddress(0),
			dataIn			=> w_CPUDataOut(7 downto 0),
			dataOut			=> w_ANSI_DispRamDataOutA,
			videoR0			=> o_VideoVect(5),
			videoR1			=> o_VideoVect(4),
			videoG0			=> o_VideoVect(3),
			videoG1			=> o_VideoVect(2),
			videoB0			=> o_VideoVect(1),
			videoB1			=> o_VideoVect(0),
			hSync  			=> o_hSync,
			vSync  			=> o_vSync
			);
	
	-- General Purpose I/O lines
	-- Used on some cards to control LEDs
	-- Connected to speaker/buzzer enable on some cards
	LedBuzzerLatch	: ENTITY work.REG_8
	PORT MAP (
    clk 	=> i_CLOCK_50,
    d 	=> w_CPUDataOut(7 downto 0),
    ld 	=> w_LEDsCS and w_peripheralWrEn,
    clr  => not n_reset,
    q    => w_LatData
	);

	-- Buzzer enable - comes up with the buzzer off
	o_BUZZER <= not w_LatData(4);

	-- 6850 ACIA (UART)
	-- Runs at 115,200 baud
	UART : entity work.bufferedUART
		port map(
			clk 		=> i_CLOCK_50,
			n_wr 		=> not (w_aciaCS and w_peripheralWrEn),
			n_rd 		=> not (w_aciaCS and w_peripheralRdEn),
			regSel 	=> w_peripheralAddress(0),
			dataIn 	=> w_CPUDataOut(7 downto 0),
			dataOut 	=> w_aciaData,
			rxClkEn 	=> w_serialClkEn,
			txClkEn 	=> w_serialClkEn,
			rxd 		=> i_SerRxd,
			txd 		=> o_SerTxd,
			n_cts 	=> '0',
			n_dcd 	=> '0',
			n_rts 	=> o_SerRts
		);

	-- ____________________________________________________________________________________
	-- Serial Port Baud Rate Clock Signals
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

	baud_div: process (w_serialClkCount_d, w_serialClkCount)
		begin
			w_serialClkCount_d <= w_serialClkCount + 2416;		-- 115,200 baud
		end process;

	--Single clock wide baud rate enable
	baud_clk: process(i_CLOCK_50)
		begin
			if rising_edge(i_CLOCK_50) then
					w_serialClkCount <= w_serialClkCount_d;
				if w_serialClkCount(15) = '0' and w_serialClkCount_d(15) = '1' then
					w_serialClkEn <= '1';
				else
					w_serialClkEn <= '0';
				end if;
        end if;
    end process;
	
	end;
