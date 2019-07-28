-- 

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
		o_SerTxd				: out std_logic;
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
--		-- I2C Clock and Data
		io_I2C_SCL			: inout std_logic := '1';
		io_I2C_SDA			: inout std_logic := '1';
		i_I2C_INT			: in std_logic := '0';
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

begin

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
		-- I2C Interface
		io_I2C_SCL			=> io_I2C_SCL,
		io_I2C_SDA			=> io_I2C_SDA,
		--
		spi_sclk				=> spi_sclk,
		spi_csN				=> spi_csN,
		spi_mosi				=> spi_mosi,
		spi_miso				=> spi_miso,
		-- PS/2 Keyboard pins
		i_ps2Clk				=> i_ps2Clk,
		i_ps2Data			=> i_ps2Data
		);

end;
