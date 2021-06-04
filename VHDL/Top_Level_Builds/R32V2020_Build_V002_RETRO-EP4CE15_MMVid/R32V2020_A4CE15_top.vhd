--
-- Top Level Entity for top of R32V2020 RISC CPU design
-- Memory mapped XVGA for ANSI compatible VGA
--
-- RETRO-EP4CE15 Card - supported features
--		VGA Display
--		PS/2 Keyboard
--		USB-Serial interface
--		SD Card
--
--	Not used
--		1MB SRAM
--		32MB SDRAM
--

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity R32V2020_A4CE15_top is
	port(
		i_CLOCK_50			: in std_logic;
		i_n_reset			: in std_logic := '1';
		-- Serial port pins
		i_SerRxd				: in	std_logic := '1';
		o_SerTxd				: out	std_logic;
		i_SerCts				: in	std_logic := '0';
		o_SerRts				: out	std_logic;
		-- VGA pins
		o_vid_Red_Hi		: out std_logic;
		o_vid_Red_Lo		: out std_logic;
		o_vid_Grn_Hi		: out std_logic;
		o_vid_Grn_Lo		: out std_logic;
		o_vid_Blu_Hi		: out std_logic;
		o_vid_Blu_Lo		: out std_logic;
		o_hSync				: out std_logic;
		o_vSync				: out std_logic;
		-- SD Card
		o_sdCS				: out std_logic;
		o_sdMOSI				: out std_logic;
		i_sdMISO				: in std_logic;
		o_sdSCLK				: out std_logic;
		o_driveLED			: out std_logic;		-- D5 LED on FPGA card
		-- Keyboard
		i_ps2Clk				: in std_logic;
		i_ps2Data			: in std_logic;
		-- Not using the SRAM but reserving pins and making inactive
		n_sRamCS				: out std_logic := '1';
		n_sRamOE				: out std_logic := '1';
		n_sRamWE				: out std_logic := '1';
		sramAddress			: out std_logic_vector(19 downto 0) := x"00000";
		sramData				: in std_logic_vector(7 downto 0) := "ZZZZZZZZ";
		-- Not using the SD RAM but reserving pins and making inactive
		n_sdRamCas			: out std_logic := '1';		-- CAS on schematic
		n_sdRamRas			: out std_logic := '1';		-- RAS
		n_sdRamWe			: out std_logic := '1';		-- SDWE
		n_sdRamCe			: out std_logic := '1';		-- SD_NCS0
		sdRamClk				: out std_logic := '1';		-- SDCLK0
		sdRamClkEn			: out std_logic := '1';		-- SDCKE0
		sdRamAddr			: out std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData			: in std_logic_vector(15 downto 0) := "ZZZZZZZZZZZZZZZZ"
		);
end R32V2020_A4CE15_top;

architecture struct of R32V2020_A4CE15_top is

	signal	w_hActive	:		std_logic := '0';

	-- Sets the constant value for the Instruction, Stack, and Data RAM spaces
	constant Data_RAM_Size	: Integer := 8192;
	constant Inst_RAM_Size	: Integer := 32768;
	constant Stack_RAM_Size	: Integer := 1024;

--attribute syn_keep: boolean;
--attribute syn_keep of w_Switch: signal is true;

begin

	R32V2020_top : entity work.R32V2020_top
	generic map
	( 
		DATA_SRAM_SIZE_PASS	=> Data_RAM_Size,
		INST_SRAM_SIZE_PASS	=> Inst_RAM_Size,
		STACK_SRAM_SIZE_PASS	=> Stack_RAM_Size
	)
		port map (
		i_n_reset		=> i_n_reset,
		i_CLOCK_50		=> i_CLOCK_50,
		-- Serial port pins
		i_SerRxd			=> i_SerRxd,
		o_SerTxd			=> o_SerTxd,
		i_SerCts			=> i_SerCts,
		o_SerRts			=> o_SerRts,
		-- VGA pins
		o_vid_Red_Hi	=> o_vid_Red_Hi,
		o_vid_Red_Lo	=> o_vid_Red_Lo,
		o_vid_Grn_Hi	=> o_vid_Grn_Hi,
		o_vid_Grn_Lo	=> o_vid_Grn_Lo,
		o_vid_Blu_Hi	=> o_vid_Blu_Hi,
		o_vid_Blu_Lo	=> o_vid_Blu_Lo,
		o_hSync			=> o_hSync,
		o_vSync			=> o_vSync,
		o_hActive		=> w_hActive,
		-- sd Card
		o_sdCS			=> o_sdCS,
		o_sdMOSI			=> o_sdMOSI,
		i_sdMISO			=> i_sdMISO,
		o_sdSCLK			=> o_sdSCLK,
		o_driveLED		=> o_driveLED,
		-- PS/2 Keyboard pins
		i_ps2Clk			=> i_ps2Clk,
		i_ps2Data		=> i_ps2Data
		);
		
	end;
