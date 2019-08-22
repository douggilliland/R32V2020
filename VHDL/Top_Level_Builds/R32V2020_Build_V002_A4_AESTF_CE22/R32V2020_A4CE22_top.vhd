-- Top Level Entity for top of R32V2020 RISC CPU design
-- Build_V002 switches out memory mapped XVGA for ANSI compatible VGA
-- This level connects to the specific FPGA board

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity R32V2020_A4CE22_top is
	port(
		n_reset				: in std_logic := '1';
		i_CLOCK_50			: in std_logic;
		-- Switches, LEDs, Buzzer pins
		i_switch				: in std_logic_vector(2 downto 0) := "111";
		i_dipSwitch			: in std_logic_vector(7 downto 0) := x"00";
		o_BUZZER				: out std_logic := '0';
		-- Serial port pins
		i_SerRxd				: in std_logic := '1';
		o_SerTxd				: out std_logic := '1';
		-- VGA pins
		o_vid_Red			: out std_logic_Vector(4 downto 0) := "00000";
		o_vid_Grn			: out std_logic_Vector(5 downto 0) := "000000";
		o_vid_Blu			: out std_logic_Vector(4 downto 0) := "00000";
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';
		-- Seven Segment LED pins
--		o_Anode_Activate 	: out std_logic_vector(7 downto 0) := x"00";
--		o_LED7Seg_out		: out std_logic_vector(7 downto 0) := x"00";
		U2_138_select		: out std_logic := '0';
		o_U2_138_A			: out std_logic_vector(2 downto 0) := "000";
		-- Matrix
		o_dataOut			: out std_logic_vector(7 downto 0) := x"00";
		o_U3_138_select	: out std_logic := '0';
--		o_U3_138_A			: out std_logic_vector(2 downto 0) := "000";
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
		o_testPoint			: out std_logic := '1';
		-- PS/2 Keyboard pins
		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'		
		);
end R32V2020_A4CE22_top;

architecture struct of R32V2020_A4CE22_top is

	signal	w_Red_Hi		:		std_logic := '0';
	signal	w_Red_Lo		:		std_logic := '0';
	signal	w_Grn_Hi		:		std_logic := '0';
	signal	w_Grn_Lo		:		std_logic := '0';
	signal	w_Blu_Hi		:		std_logic := '0';
	signal	w_Blu_Lo		:		std_logic := '0';
	signal	w_hActive	:		std_logic := '0';
	signal	w_Anode_Activate	:	std_logic_vector(7 downto 0);

begin

	o_U2_138_A(2) <= w_Anode_Activate(7) or w_Anode_Activate(6) or w_Anode_Activate(5) or w_Anode_Activate(4);
	o_U2_138_A(1) <= w_Anode_Activate(7) or w_Anode_Activate(6) or w_Anode_Activate(3) or w_Anode_Activate(2);
	o_U2_138_A(0) <= w_Anode_Activate(7) or w_Anode_Activate(5) or w_Anode_Activate(3) or w_Anode_Activate(1);
	
	R32V2020_top : entity work.R32V2020_top
		port map (
		n_reset		=> n_reset,
		i_CLOCK_50	=> i_CLOCK_50,
		-- Switches, LEDs, Buzzer pins
		i_switch		=> i_switch,
		i_dipSwitch	=> i_dipSwitch,
		--o_LED		=> ,
		o_BUZZER		=> o_BUZZER,
		-- Serial port pins
		i_SerRxd		=> i_SerRxd,
		o_SerTxd		=> o_SerTxd,
		-- VGA pins
		o_vid_Red_Hi	=> o_vid_Red(4),
		o_vid_Red_Lo	=> o_vid_Red(3),
		o_vid_Grn_Hi	=> o_vid_Grn(5),
		o_vid_Grn_Lo	=> o_vid_Grn(4),
		o_vid_Blu_Hi	=> o_vid_Blu(4),
		o_vid_Blu_Lo	=> o_vid_Blu(3),
		o_hSync			=> o_hSync,
		o_vSync			=> o_vSync,
		o_hActive		=> w_hActive,
		-- Seven Segment LED pins
		o_Anode_Activate	=> w_Anode_Activate,
--		o_LED7Seg_out		=> o_LED7Seg_out,
		-- LED Ring
--		o_LEDRing_out		=> o_LEDRing_out,
		-- 8 bit I/O Latch
--		o_LatchIO			=> o_LatchIO,
		-- I2C Clock and Data
		io_I2C_SCL			=> io_I2C_SCL,
		io_I2C_SDA			=> io_I2C_SDA,
		i_I2C_INT			=> i_I2C_INT,
		-- EEPROM I2C connections
		io_EEP_I2C_SCL		=> io_EEP_I2C_SCL,
		io_EEP_I2C_SDA		=> io_EEP_I2C_SDA,
		-- SPIbus
		spi_sclk				=> spi_sclk,
      spi_csN				=> spi_csN,
      spi_mosi				=> spi_mosi,
      spi_miso				=> spi_miso,
		-- PS/2 Keyboard pins
		i_ps2Clk				=> i_ps2Clk,
		i_ps2Data			=> i_ps2Data
		);
		
	end;
