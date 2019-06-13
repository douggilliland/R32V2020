-- Top Level Entity for top of R32V2020 RISC CPU design

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity top is
	port(
		n_reset				: in std_logic := '1';
		i_CLOCK_50			: in std_logic;
		-- Switches, LEDs, Buzzer pins
		i_switch				: in std_logic_vector(2 downto 0) := "111";
		i_dipSwitch			: in std_logic_vector(7 downto 0) := x"00";
		--o_LED				: out std_logic_vector(3 downto 0);
		o_BUZZER				: out std_logic;
		-- Serial port pins
		i_SerRxd				: in std_logic;
		o_SerTxd				: out std_logic;
		--o_SerRts				: out std_logic;
		-- VGA pins
		o_VideoVect			: out std_logic_vector(2 downto 0); -- rrrrr,gggggg,bbbbb,hsync,vsync
		o_hSync				: out std_logic;
		o_vSync				: out std_logic;
		-- Seven Segment LED pins
		o_Anode_Activate 	: out std_logic_vector(7 downto 0) := x"00";
		o_LED7Seg_out		: out std_logic_vector(7 downto 0) := x"00";
		-- LED Ring
		o_LEDRing_out		: out std_logic_vector(11 downto 0) := x"000";
		-- PS/2 Keyboard pins
		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'		
		);
end top;

architecture struct of top is

-- Instruction Space Controls
signal	w_InstructionRomAddress	: std_logic_vector(31 downto 0) := x"00000000";
signal	w_InstructionRomData		: std_logic_vector(31 downto 0) := x"00000000";
--signal	q_InstructionRomData		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_clkInstrRomAddr			: std_logic := '0';
signal	w_clkInstrRomData			: std_logic := '0';

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

-- Peripheral Space Controls
signal	w_peripheralAddress		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataFromPeripherals	: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataToPeripherals		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_peripheralRdEn			: std_logic := '0';
signal	w_peripheralWrEn			: std_logic := '0';

signal	w_OneHotState				: std_logic_vector(5 downto 0) := "000000";
signal	q_debounce					: std_logic_vector(5 downto 0) := "000000";
signal	resetLow						: std_logic := '1';

attribute syn_keep: boolean;
attribute syn_keep of w_dataFromPeripherals: signal is true;

begin

	-- CPU Element
	RISC_CPU : 	entity work.R32V2020
	port map (
		n_reset 						=> resetLow,
		-- Clock
		i_CLOCK_50 					=> i_CLOCK_50,
		o_OneHotState				=> w_OneHotState,
		-- Instruction ROM connections
		i_InstructionRomData		=> w_InstructionRomData,
		o_InstructionRomAddress	=> w_InstructionRomAddress,
		o_clkInstrRomAddr			=> w_clkInstrRomAddr,
--		o_clkInstrRomData			=>	w_clkInstrRomData,
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
		-- Peripheral Space Connections
		o_peripheralAddress		=> w_peripheralAddress,
		i_dataFromPeripherals	=> w_dataFromPeripherals,
		o_peripheralRdStrobe		=> w_peripheralRdEn,
		o_peripheralWrStrobe		=> w_peripheralWrEn
	);

	-- Instruction ROM
	Instr_ROM : entity work.BlockRom_Instruction
	PORT MAP (
		address		=> w_InstructionRomAddress(9 downto 0),
		clken			=> w_clkInstrRomAddr,
		clock 		=> i_CLOCK_50,
		q 				=> w_InstructionRomData
	);
	
	-- Stack RAM
	Stack_RAM : entity work.BlockRam_Stack
	PORT MAP	(
		address	=> w_StackRamAddress(7 downto 0),
		clock		=> i_CLOCK_50,
		data		=> w_dataToStackRam,
		wren		=> w_writeStackRamEn,
		q			=> w_dataFromStackRam
	);

	-- Data RAM
	Data_RAM : entity work.BlockRam_Data
	PORT MAP (
		address 		=> w_DataRamAddress(7 downto 0),
		clock 		=> i_CLOCK_50,
		data 			=> w_CPUDataOut,
		rden			=> '1',
		wren 			=> w_writeToDataRamEn,
		q 				=> w_dataFromDataRam
	);
	
	-- Peripherals
	Peripherals : entity work.PeripheralInterface
	port MAP (
		n_reset						=> resetLow,
		i_CLOCK_50					=> i_CLOCK_50,
		i_OneHotState				=> w_OneHotState,
		-- Peripheral Memory Mapped Space Address/Data/Control lines
		i_peripheralAddress		=> w_peripheralAddress,
		i_dataToPeripherals		=> w_CPUDataOut,
		o_dataFromPeripherals	=> w_dataFromPeripherals,
		i_peripheralRdStrobe		=> w_peripheralRdEn,
		i_peripheralWrStrobe		=> w_peripheralWrEn,
		-- Physical connections to/from the FPGA pins
		i_switch						=> i_switch,
		i_DIP_switch				=> i_dipSwitch,
		--o_LED							=> o_LED,
		o_BUZZER						=> o_BUZZER,
		o_Anode_Activate 			=> o_Anode_Activate,
		o_LED7Seg_out				=> o_LED7Seg_out,
		i_rxd							=> i_SerRxd,
		o_txd							=> o_SerTxd,
		o_LEDRing_out				=> o_LEDRing_out,
		--o_rts							=> o_SerRts,
		o_VideoOut					=> o_VideoVect,
		o_hSync						=> o_hSync,
		o_vSync						=> o_vSync,
		i_PS2_CLK					=> i_ps2Clk,
		i_PS2_DATA					=> i_ps2Data
	);
	
	process (n_reset, i_CLOCK_50)
	begin
		if(rising_edge(i_CLOCK_50)) then
			q_debounce(0) <= n_reset;
			q_debounce(1) <= q_debounce(0);
			q_debounce(2) <= q_debounce(1);
			q_debounce(3) <= q_debounce(2);
			q_debounce(4) <= q_debounce(3);
			q_debounce(5) <= q_debounce(4);
			if (q_debounce(0) = '1') and (q_debounce(1) = '1') and (q_debounce(2) = '1') and (q_debounce(3) = '1') and (q_debounce(4) = '1') and (q_debounce(5) = '1') then
				resetLow <= '1';
			elsif (q_debounce(0) = '0') and 
				(q_debounce(1) = '0') and 
				(q_debounce(2) = '0') and 
				(q_debounce(3) = '0') and 
				(q_debounce(4) = '0') and 
				(q_debounce(5) = '0') then
				resetLow <= '0';
			end if;
		end if;
	end process;

end;
