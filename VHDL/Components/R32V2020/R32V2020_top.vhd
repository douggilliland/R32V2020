-- Top Level Entity for top of R32V2020 RISC CPU design

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity R32V2020_top is
	port(
		n_reset				: in std_logic := '1';
		i_CLOCK_50			: in std_logic;
		-- Switches, LEDs, Buzzer pins
		i_switch				: in std_logic_vector(2 downto 0) := "111";
		i_dipSwitch			: in std_logic_vector(7 downto 0) := x"00";
		--o_LED				: out std_logic_vector(3 downto 0);
		o_BUZZER				: out std_logic := '0';
		-- Serial port pins with handshake lines
		i_SerRxd				: in std_logic := '1';
		o_SerTxd				: out std_logic := '1';
		i_SerCts				: in std_logic := '0';
		o_SerRts				: out std_logic := '1';
		-- VGA pins - Up to 6-bits
		o_vid_Red_Hi		: out std_logic := '0';
		o_vid_Red_Lo		: out std_logic := '0';
		o_vid_Grn_Hi		: out std_logic := '0';
		o_vid_Grn_Lo		: out std_logic := '0';
		o_vid_Blu_Hi		: out std_logic := '0';
		o_vid_Blu_Lo		: out std_logic := '0';
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';
		--o_hActive			: out std_logic := '0';
		-- Seven Segment LED pins
		o_Anode_Activate 	: out std_logic_vector(7 downto 0) := x"00";
		o_LED7Seg_out		: out std_logic_vector(7 downto 0) := x"00";
		-- LED Ring
		o_LEDRing_out		: out std_logic_vector(11 downto 0) := x"000";
		-- 8 bit I/O Latch
		o_LatchIO			: out std_logic_vector(7 downto 0) := x"00";
		-- I2C Clock and Data
		io_I2C_SCL			: inout std_logic := '1';
		io_I2C_SDA			: inout std_logic := '1';
		i_I2C_INT			: in std_logic := '0';
		-- EEPROM I2C connections
		io_EEP_I2C_SCL		: inout std_logic := '1';
		io_EEP_I2C_SDA		: inout std_logic := '1';
		-- SPIbus
		spi_sclk				: out std_logic := '1';
      spi_csN				: out std_logic := '1';
      spi_mosi				: out std_logic := '1';
      spi_miso				: in std_logic := '1';
		-- Music generator
		o_Note				: out std_logic := '0';
		-- sd cARD
		o_sdCS				: out std_logic := '1';
		o_sdMOSI				: out std_logic := '0';
		i_sdMISO				: in std_logic := '0';
		o_sdSCLK				: out std_logic := '0';
		o_driveLED			: out std_logic := '0';
		-- PS/2 Keyboard pins
		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'		
		);
end R32V2020_top;

architecture struct of R32V2020_top is

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

--attribute syn_keep: boolean;
--attribute syn_keep of w_Switch: signal is true;

begin

	o_vid_Red_Hi <= o_VideoVect(5);
	o_vid_Red_Lo <= o_VideoVect(4);
	o_vid_Grn_Hi <= o_VideoVect(3);
	o_vid_Grn_Lo <= o_VideoVect(2);
	o_vid_Blu_Hi <= o_VideoVect(1);
	o_vid_Blu_Lo <= o_VideoVect(0);
	
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
		o_loadData  				=>	w_loadData,
		o_storeData 				=>	w_storeData,
		o_longData  				=>	w_longData,
		o_shortData 				=>	w_shortData,
		o_ByteData  				=>	w_ByteData,
		-- Peripheral Space Connections
		o_peripheralAddress		=> w_peripheralAddress,
		i_dataFromPeripherals	=> w_dataFromPeripherals,
		o_peripheralRdStrobe		=> w_peripheralRdEn,
		o_peripheralWrStrobe		=> w_peripheralWrEn
	);

	-- Instruction ROM
	Instr_ROM : entity work.BlockRom_Instruction
	PORT MAP (
		address		=> w_InstructionRomAddress(10 downto 0),
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
		-- Pass throughs to/from the FPGA pins
		i_switch						=> i_switch,
		i_DIP_switch				=> i_dipSwitch,
		--o_LED							=> o_LED,
		o_BUZZER						=> o_BUZZER,
		o_Anode_Activate 			=> o_Anode_Activate,
		o_LED7Seg_out				=> o_LED7Seg_out,
		o_LatchIO					=> o_LatchIO,
		i_rxd							=> i_SerRxd,
		o_txd							=> o_SerTxd,
		o_rts							=> o_SerRts,
		i_cts							=> i_SerCts,
		o_LEDRing_out				=> o_LEDRing_out,
		o_VideoOut					=> o_VideoVect,
		o_hSync						=> o_hSync,
		o_vSync						=> o_vSync,
		io_I2C_SCL					=> io_I2C_SCL,
		io_I2C_SDA					=> io_I2C_SDA,
		io_I2C_INT					=> i_I2C_INT,
		-- sd cARD
		o_sdCS						=> o_sdCS,
		o_sdMOSI						=> o_sdMOSI,
		i_sdMISO						=> i_sdMISO,
		o_sdSCLK						=> o_sdSCLK,
		o_driveLED					=> o_driveLED,
		--
		spi_sclk						=> spi_sclk,
      spi_csN						=> spi_csN,
      spi_mosi						=> spi_mosi,
      spi_miso						=> spi_miso,
		io_EEP_I2C_SCL				=> io_EEP_I2C_SCL,
		io_EEP_I2C_SDA				=> io_EEP_I2C_SDA,
		o_Note						=> o_Note,
		--o_testPoint					=> o_testPoint,
		i_PS2_CLK					=> i_ps2Clk,
		i_PS2_DATA					=> i_ps2Data
	);
	
	end;
