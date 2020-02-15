-- Top level
-- Wrap the R32V2020 RISC CPU with a board specific wrapper

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity R32V2020_RETRO_EP4_top is
	port(
		i_n_reset			: in std_logic := '1';
		i_CLOCK_50			: in std_logic;
		-- Serial port pins
		i_SerRxd				: in std_logic		:= '1';
		o_SerTxd				: out std_logic	:= '1';
		i_SerCts				: in std_logic		:= '0';
		o_SerRts				: out std_logic	:= '1';
		-- VGA pins
		o_vid_Red_Hi		: out std_logic	:= '1';
		o_vid_Red_Lo		: out std_logic	:= '1';
		o_vid_Grn_Hi		: out std_logic	:= '1';
		o_vid_Grn_Lo		: out std_logic	:= '1';
		o_vid_Blu_Hi		: out std_logic	:= '1';
		o_vid_Blu_Lo		: out std_logic	:= '1';
		o_hSync				: out std_logic	:= '1';
		o_vSync				: out std_logic	:= '1';
		-- Not using the SD RAM but reserving pins and making inactive
		n_sdRamCas			: out std_logic := '1';		-- CAS on schematic
		n_sdRamRas			: out std_logic := '1';		-- RAS
		n_sdRamWe			: out std_logic := '1';		-- SDWE
		n_sdRamCe			: out std_logic := '1';		-- SD_NCS0
		sdRamClk				: out std_logic := '1';		-- SDCLK0
		sdRamClkEn			: out std_logic := '1';		-- SDCKE0
		sdRamAddr			: out std_logic_vector(14 downto 0) := "000"&x"000";
		sdRamData			: in std_logic_vector(15 downto 0);
		-- sd cARD
		o_sdCS				: out std_logic := '1';
		o_sdMOSI				: out std_logic := '0';
		i_sdMISO				: in std_logic := '0';
		o_sdSCLK				: out std_logic := '0';
		-- PS/2 Keyboard pins
		i_ps2Clk				: in std_logic := '1';
		i_ps2Data			: in std_logic := '1'		
		);
end R32V2020_RETRO_EP4_top;

architecture struct of R32V2020_RETRO_EP4_top is

signal	o_VideoVect		: std_logic_Vector(5 downto 0);
signal	w_LEDRing		: std_logic_Vector(11 downto 0);

begin

middle : entity work.R32V2020_top
	port map (
		n_reset				=> i_n_reset,
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
		-- SD Card pass-through
		o_sdCS				=> o_sdCS,
		o_sdMOSI				=> o_sdMOSI,
		i_sdMISO				=> i_sdMISO,
		o_sdSCLK				=> o_sdSCLK,
		-- PS/2 Keyboard pins pass-through
		i_ps2Clk				=> i_ps2Clk,
		i_ps2Data			=> i_ps2Data
		);

end;
