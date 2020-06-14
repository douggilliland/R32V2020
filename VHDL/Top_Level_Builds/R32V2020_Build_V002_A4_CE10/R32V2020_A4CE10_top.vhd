-- Top Level Entity for top of R32V2020 RISC CPU design
-- Build_V002 switches out memory mapped XVGA for ANSI compatible VGA

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity R32V2020_A4CE10_top is
	port(
		i_n_reset				: in std_logic := '1';
		i_CLOCK_50			: in std_logic;
		-- Serial port pins
		i_SerRxd				: in std_logic := '1';
		o_SerTxd				: out std_logic := '1';
		o_SerRts				: out std_logic;
		i_SerCts				: in std_logic := '1';
		-- VGA pins
		o_VideoVect			: out std_logic_vector(2 downto 0) := "000"; -- rgb
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';
		-- Switches, LEDs, Buzzer pins
		i_switch				: in std_logic_vector(2 downto 0) := "111";
		i_dipSwitch			: in std_logic_vector(7 downto 0) := x"00";
		-- LED Ring
		o_LEDRing_out		: out std_logic_vector(9 downto 0) := x"00"&"00";
		o_BUZZER				: out std_logic := '0';
		-- Seven Segment LED pins
		o_Anode_Activate 	: out std_logic_vector(7 downto 0) := x"00";
		o_LED7Seg_out		: out std_logic_vector(7 downto 0) := x"00";
		-- 8 bit I/O Latch
		--o_LatchIO			: out std_logic_vector(7 downto 0) := x"00";
		-- I2C Clock and Data
		io_I2C_SCL			: inout std_logic := '1';
		io_I2C_SDA			: inout std_logic := '1';
		i_I2C_INT			: in std_logic := '0';
		-- sd cARD
		o_sdCS				: out std_logic := '1';
		o_sdMOSI				: out std_logic := '0';
		i_sdMISO				: in std_logic := '0';
		o_sdSCLK				: out std_logic := '0';
		o_driveLED			: out std_logic := '0';
		-- EEPROM I2C connections
		io_EEP_I2C_SCL		: inout std_logic := '1';
		io_EEP_I2C_SDA		: inout std_logic := '1';
		-- SPIbus
		-- spi_sclk				: out std_logic := '1';
      -- spi_csN				: out std_logic := '1';
      -- spi_mosi				: out std_logic := '1';
      -- spi_miso				: in std_logic := '1';
		-- o_testPoint			: out std_logic := '1';
		-- Music generator
		o_Note				: out std_logic := '0';
		-- PS/2 Keyboard pins
		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'		
		);
end R32V2020_A4CE10_top;

architecture struct of R32V2020_A4CE10_top is

	signal	w_Red_Hi		:		std_logic := '0';
	signal	w_Red_Lo		:		std_logic := '0';
	signal	w_Grn_Hi		:		std_logic := '0';
	signal	w_Grn_Lo		:		std_logic := '0';
	signal	w_Blu_Hi		:		std_logic := '0';
	signal	w_Blu_Lo		:		std_logic := '0';
	signal 	w_LEDRing_out : 	std_logic_vector(11 downto 0) := x"000";
--	signal	w_hActive	:		std_logic := '0';

--attribute syn_keep: boolean;
--attribute syn_keep of w_Switch: signal is true;

begin

	o_VideoVect(2) <= w_Red_Hi or w_Red_Lo;
	o_VideoVect(1) <= w_Grn_Hi or w_Grn_Lo;
	o_VideoVect(0) <= w_Blu_Hi or w_Blu_Lo;
	
	o_LEDRing_out <= w_LEDRing_out(9 downto 0);

	R32V2020_top : entity work.R32V2020_top
		port map (
		n_reset	=> i_n_reset,
		i_CLOCK_50	=> i_CLOCK_50,
		-- Switches, LEDs, Buzzer pins
		i_switch		=> i_switch,
		i_dipSwitch	=> i_dipSwitch,
		--o_LED		=> ,
		o_BUZZER		=> o_BUZZER,
		-- Serial port pins
		i_SerRxd		=> i_SerRxd,
		o_SerTxd		=> o_SerTxd,
		i_SerCts		=> i_SerCts,
		o_SerRts		=> o_SerRts,
		-- VGA pins
		o_vid_Red_Hi	=> w_Red_Hi,
		o_vid_Red_Lo	=> w_Red_Lo,
		o_vid_Grn_Hi	=> w_Grn_Hi,
		o_vid_Grn_Lo	=> w_Grn_Lo,
		o_vid_Blu_Hi	=> w_Blu_Hi,
		o_vid_Blu_Lo	=> w_Blu_Lo,
		o_hSync			=> o_hSync,
		o_vSync			=> o_vSync,
--		o_hActive		=> w_hActive,
		-- Seven Segment LED pins
		o_Anode_Activate	=> o_Anode_Activate,
		o_LED7Seg_out		=> o_LED7Seg_out,
		-- LED Ring
		o_LEDRing_out		=> w_LEDRing_out,
		-- 8 bit I/O Latch
		-- o_LatchIO			=> o_LatchIO,
		-- I2C Clock and Data
		io_I2C_SCL			=> io_I2C_SCL,
		io_I2C_SDA			=> io_I2C_SDA,
		i_I2C_INT			=> i_I2C_INT,
		-- sd Card
		o_sdCS				=> o_sdCS,
		o_sdMOSI				=> o_sdMOSI,
		i_sdMISO				=> i_sdMISO,
		o_sdSCLK				=> o_sdSCLK,
		o_driveLED			=> o_driveLED,
		-- EEPROM I2C connections
		io_EEP_I2C_SCL		=> io_EEP_I2C_SCL,
		io_EEP_I2C_SDA		=> io_EEP_I2C_SDA,
		-- SPIbus
--		spi_sclk				=> spi_sclk,
--      spi_csN				=> spi_csN,
--      spi_mosi				=> spi_mosi,
--      spi_miso				=> spi_miso,
		-- Music generator
		o_Note				=> o_Note,
		-- PS/2 Keyboard pins
		i_ps2Clk				=> i_ps2Clk,
		i_ps2Data			=> i_ps2Data
		);
		
	end;
