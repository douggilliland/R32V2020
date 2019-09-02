-- Wrap the R32V2020 RISC CPU with a board specific wrapper

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity R32V2020_RETRO_EP4_top is
	port(
		n_reset				: in std_logic := '1';
		i_CLOCK_50			: in std_logic;
		-- Serial port pins
		i_SerRxd				: in std_logic := '1';
		o_SerTxd				: out std_logic := '1';
		i_SerCts				: in std_logic := '0';
		o_SerRts				: out std_logic;
		-- VGA pins
		o_vid_Red_Hi		: out std_logic := '1';
		o_vid_Red_Lo		: out std_logic := '1';
		o_vid_Grn_Hi		: out std_logic := '1';
		o_vid_Grn_Lo		: out std_logic := '1';
		o_vid_Blu_Hi		: out std_logic := '1';
		o_vid_Blu_Lo		: out std_logic := '1';
		o_hSync				: out std_logic := '1';
		o_vSync				: out std_logic := '1';
		-- LEDs
		o_LEDRing			: out std_logic_vector(3 downto 0) := x"0";
--		-- I2C Clock and Data
		io_I2C_SCL			: inout std_logic := '1';
		io_I2C_SDA			: inout std_logic := '1';
--		i_I2C_INT			: in std_logic := '0';
		-- sd cARD
		o_sdCS				: out std_logic := '1';
		o_sdMOSI				: out std_logic := '0';
		i_sdMISO				: in std_logic := '0';
		o_sdSCLK				: out std_logic := '0';
		o_driveLED			: out std_logic := '0';
		-- SPIbus
		spi_sclk				: out std_logic := '1';
      spi_csN				: out std_logic := '1';
      spi_mosi				: out std_logic := '1';
      spi_miso				: in std_logic := '1';
		-- PS/2 Keyboard pins
		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'		
		);
end R32V2020_RETRO_EP4_top;

architecture struct of R32V2020_RETRO_EP4_top is

signal	o_VideoVect		: std_logic_Vector(5 downto 0);
signal	w_LEDRing		: std_logic_Vector(11 downto 0);

begin

	-- LEDs are active low
	-- R32V2020 has 12 LEDs
	-- RETRO-EP4 has 4 LEDs
	o_LEDRing(3) <= w_LEDRing(3) and w_LEDRing(7) and w_LEDRing(11);
	o_LEDRing(2) <= w_LEDRing(2) and w_LEDRing(6) and w_LEDRing(10);
	o_LEDRing(1) <= w_LEDRing(1) and w_LEDRing(5) and w_LEDRing(9);
	o_LEDRing(0) <= w_LEDRing(0) and w_LEDRing(4) and w_LEDRing(8);

middle : entity work.R32V2020_top
	port map (
		n_reset				=> n_reset,
		i_CLOCK_50			=> i_CLOCK_50,
		-- Serial port pins
		i_SerRxd				=> i_SerRxd,
		o_SerTxd				=> o_SerTxd,
		o_SerRts				=> o_SerRts,
		i_Sercts				=> i_Sercts,
		-- VGA pins
		o_vid_Red_Hi		=> o_vid_Red_Hi,
		o_vid_Red_Lo		=> o_vid_Red_Lo,
		o_vid_Grn_Hi		=> o_vid_Grn_Hi,
		o_vid_Grn_Lo		=> o_vid_Grn_Lo,
		o_vid_Blu_Hi		=> o_vid_Blu_Hi,
		o_vid_Blu_Lo		=> o_vid_Blu_Lo,
		o_hSync				=> o_hSync,
		o_vSync				=> o_vSync,
		--
		o_LEDRing_out		=> w_LEDRing,
		--
		--o_Note				=> o_Note,
		-- I2C Interface pass-through
		io_I2C_SCL			=> io_I2C_SCL,
		io_I2C_SDA			=> io_I2C_SDA,
		-- sd cARD pass-through
		o_sdCS						=> o_sdCS,
		o_sdMOSI						=> o_sdMOSI,
		i_sdMISO						=> i_sdMISO,
		o_sdSCLK						=> o_sdSCLK,
		o_driveLED					=> o_driveLED,
		-- SPI pass-through
		spi_sclk				=> spi_sclk,
		spi_csN				=> spi_csN,
		spi_mosi				=> spi_mosi,
		spi_miso				=> spi_miso,
		-- PS/2 Keyboard pins pass-through
		i_ps2Clk				=> i_ps2Clk,
		i_ps2Data			=> i_ps2Data
		);

end;
