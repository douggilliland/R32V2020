-- Top Level Entity for top of R32V2020 RISC CPU design
-- Build_V002 switches out memory mapped XVGA for ANSI compatible VGA

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity R32V2020_A4CE6_top is
	port(
		n_reset				: in std_logic := '1';
		i_CLOCK_50			: in std_logic;
		-- Switches, LEDs, Buzzer pins
		i_switch				: in std_logic_vector(2 downto 0) := "111";
		i_dipSwitch			: in std_logic_vector(7 downto 0) := x"00";
		--o_LED				: out std_logic_vector(3 downto 0);
		o_BUZZER				: out std_logic := '0';
		-- Serial port pins
		i_SerRxd				: in std_logic := '1';
		o_SerTxd				: out std_logic := '1';
		--o_SerRts				: out std_logic;
		-- VGA pins
		o_VideoVect			: out std_logic_vector(2 downto 0) := "000"; -- rgb
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';
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
		-- SPIbus
		spi_sclk				: out std_logic := '1';
      spi_csN				: out std_logic := '1';
      spi_mosi				: out std_logic := '1';
      spi_miso				: in std_logic := '1';
		o_testPoint			: out std_logic := '1';
		-- Music generator
		o_Note				: out std_logic := '0';
		-- PS/2 Keyboard pins
		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'		
		);
end R32V2020_A4CE6_top;

architecture struct of R32V2020_A4CE6_top is

-- signal	resetLow						: std_logic := '1';

--attribute syn_keep: boolean;
--attribute syn_keep of w_Switch: signal is true;

begin

	middle : entity work.R32V2020_top
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
		--o_SerRts				: out std_logic;
		-- VGA pins
		o_vid_Red_Hi	=> o_VideoVect(2),
		o_vid_Grn_Hi	=> o_VideoVect(1),
		o_vid_Blu_Hi	=> o_VideoVect(0),
		o_hSync			=> o_hSync,
		o_vSync			=> o_vSync,
		-- Seven Segment LED pins
		o_Anode_Activate	=> o_Anode_Activate,
		o_LED7Seg_out		=> o_LED7Seg_out,
		-- LED Ring
		o_LEDRing_out		=> o_LEDRing_out,
		-- 8 bit I/O Latch
		o_LatchIO			=> o_LatchIO,
		-- I2C Clock and Data
		io_I2C_SCL			=> io_I2C_SCL,
		io_I2C_SDA			=> io_I2C_SDA,
		i_I2C_INT			=> i_I2C_INT,
		-- SPIbus
		spi_sclk				=> spi_sclk,
      spi_csN				=> spi_csN,
      spi_mosi				=> spi_mosi,
      spi_miso				=> spi_miso,
		-- Music generator
		o_Note				=> o_Note,
		-- PS/2 Keyboard pins
		i_ps2Clk				=> i_ps2Clk,
		i_ps2Data			=> i_ps2Data
		);
		
	end;
