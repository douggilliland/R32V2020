-- Copyright (C) 2018  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"

-- DATE "05/06/2019 22:12:25"

-- 
-- Device: Altera EP4CE115F29C8 Package FBGA780
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	hard_block IS
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic
	);
END hard_block;

-- Design Ports Information
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_F4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_E2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_N7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_P28,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


ARCHITECTURE structure OF hard_block IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~padout\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~padout\ : std_logic;
SIGNAL \~ALTERA_DATA0~~padout\ : std_logic;
SIGNAL \~ALTERA_ASDO_DATA1~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_FLASH_nCE_nCSO~~ibuf_o\ : std_logic;
SIGNAL \~ALTERA_DATA0~~ibuf_o\ : std_logic;

BEGIN

ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
END structure;


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	BlockRam_Data IS
    PORT (
	clock : IN std_logic;
	data : IN std_logic_vector(31 DOWNTO 0);
	rdaddress : IN std_logic_vector(7 DOWNTO 0);
	wraddress : IN std_logic_vector(7 DOWNTO 0);
	wren : IN std_logic;
	q : OUT std_logic_vector(31 DOWNTO 0)
	);
END BlockRam_Data;

-- Design Ports Information
-- q[0]	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[1]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[2]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[3]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[4]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[5]	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[6]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[7]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[8]	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[9]	=>  Location: PIN_AH7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[10]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[11]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[12]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[13]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[14]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[15]	=>  Location: PIN_AA10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[16]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[17]	=>  Location: PIN_AH11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[18]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[19]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[20]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[21]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[22]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[23]	=>  Location: PIN_AA8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[24]	=>  Location: PIN_AG8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[25]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[26]	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[27]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[28]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[29]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[30]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[31]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wren	=>  Location: PIN_J28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[0]	=>  Location: PIN_J27,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[0]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[1]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[2]	=>  Location: PIN_AC15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[3]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[4]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[5]	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[6]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- wraddress[7]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[0]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[1]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[2]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[3]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[4]	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[5]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[6]	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- rdaddress[7]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[1]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[2]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[3]	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[4]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[5]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[6]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[7]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[8]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[9]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[10]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[11]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[12]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[13]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[14]	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[15]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[16]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[17]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[18]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[19]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[20]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[21]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[22]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[23]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[24]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[25]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[26]	=>  Location: PIN_AD15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[27]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[28]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[29]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[30]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- data[31]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF BlockRam_Data IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_data : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_rdaddress : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_wraddress : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_wren : std_logic;
SIGNAL ww_q : std_logic_vector(31 DOWNTO 0);
SIGNAL \altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ : std_logic_vector(7 DOWNTO 0);
SIGNAL \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\ : std_logic_vector(35 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \q[0]~output_o\ : std_logic;
SIGNAL \q[1]~output_o\ : std_logic;
SIGNAL \q[2]~output_o\ : std_logic;
SIGNAL \q[3]~output_o\ : std_logic;
SIGNAL \q[4]~output_o\ : std_logic;
SIGNAL \q[5]~output_o\ : std_logic;
SIGNAL \q[6]~output_o\ : std_logic;
SIGNAL \q[7]~output_o\ : std_logic;
SIGNAL \q[8]~output_o\ : std_logic;
SIGNAL \q[9]~output_o\ : std_logic;
SIGNAL \q[10]~output_o\ : std_logic;
SIGNAL \q[11]~output_o\ : std_logic;
SIGNAL \q[12]~output_o\ : std_logic;
SIGNAL \q[13]~output_o\ : std_logic;
SIGNAL \q[14]~output_o\ : std_logic;
SIGNAL \q[15]~output_o\ : std_logic;
SIGNAL \q[16]~output_o\ : std_logic;
SIGNAL \q[17]~output_o\ : std_logic;
SIGNAL \q[18]~output_o\ : std_logic;
SIGNAL \q[19]~output_o\ : std_logic;
SIGNAL \q[20]~output_o\ : std_logic;
SIGNAL \q[21]~output_o\ : std_logic;
SIGNAL \q[22]~output_o\ : std_logic;
SIGNAL \q[23]~output_o\ : std_logic;
SIGNAL \q[24]~output_o\ : std_logic;
SIGNAL \q[25]~output_o\ : std_logic;
SIGNAL \q[26]~output_o\ : std_logic;
SIGNAL \q[27]~output_o\ : std_logic;
SIGNAL \q[28]~output_o\ : std_logic;
SIGNAL \q[29]~output_o\ : std_logic;
SIGNAL \q[30]~output_o\ : std_logic;
SIGNAL \q[31]~output_o\ : std_logic;
SIGNAL \wren~input_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \data[0]~input_o\ : std_logic;
SIGNAL \wraddress[0]~input_o\ : std_logic;
SIGNAL \wraddress[1]~input_o\ : std_logic;
SIGNAL \wraddress[2]~input_o\ : std_logic;
SIGNAL \wraddress[3]~input_o\ : std_logic;
SIGNAL \wraddress[4]~input_o\ : std_logic;
SIGNAL \wraddress[5]~input_o\ : std_logic;
SIGNAL \wraddress[6]~input_o\ : std_logic;
SIGNAL \wraddress[7]~input_o\ : std_logic;
SIGNAL \rdaddress[0]~input_o\ : std_logic;
SIGNAL \rdaddress[1]~input_o\ : std_logic;
SIGNAL \rdaddress[2]~input_o\ : std_logic;
SIGNAL \rdaddress[3]~input_o\ : std_logic;
SIGNAL \rdaddress[4]~input_o\ : std_logic;
SIGNAL \rdaddress[5]~input_o\ : std_logic;
SIGNAL \rdaddress[6]~input_o\ : std_logic;
SIGNAL \rdaddress[7]~input_o\ : std_logic;
SIGNAL \data[1]~input_o\ : std_logic;
SIGNAL \data[2]~input_o\ : std_logic;
SIGNAL \data[3]~input_o\ : std_logic;
SIGNAL \data[4]~input_o\ : std_logic;
SIGNAL \data[5]~input_o\ : std_logic;
SIGNAL \data[6]~input_o\ : std_logic;
SIGNAL \data[7]~input_o\ : std_logic;
SIGNAL \data[8]~input_o\ : std_logic;
SIGNAL \data[9]~input_o\ : std_logic;
SIGNAL \data[10]~input_o\ : std_logic;
SIGNAL \data[11]~input_o\ : std_logic;
SIGNAL \data[12]~input_o\ : std_logic;
SIGNAL \data[13]~input_o\ : std_logic;
SIGNAL \data[14]~input_o\ : std_logic;
SIGNAL \data[15]~input_o\ : std_logic;
SIGNAL \data[16]~input_o\ : std_logic;
SIGNAL \data[17]~input_o\ : std_logic;
SIGNAL \data[18]~input_o\ : std_logic;
SIGNAL \data[19]~input_o\ : std_logic;
SIGNAL \data[20]~input_o\ : std_logic;
SIGNAL \data[21]~input_o\ : std_logic;
SIGNAL \data[22]~input_o\ : std_logic;
SIGNAL \data[23]~input_o\ : std_logic;
SIGNAL \data[24]~input_o\ : std_logic;
SIGNAL \data[25]~input_o\ : std_logic;
SIGNAL \data[26]~input_o\ : std_logic;
SIGNAL \data[27]~input_o\ : std_logic;
SIGNAL \data[28]~input_o\ : std_logic;
SIGNAL \data[29]~input_o\ : std_logic;
SIGNAL \data[30]~input_o\ : std_logic;
SIGNAL \data[31]~input_o\ : std_logic;
SIGNAL \altsyncram_component|auto_generated|q_b\ : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clock <= clock;
ww_data <= data;
ww_rdaddress <= rdaddress;
ww_wraddress <= wraddress;
ww_wren <= wren;
q <= ww_q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\ <= (gnd & gnd & gnd & gnd & \data[31]~input_o\ & \data[30]~input_o\ & \data[29]~input_o\ & \data[28]~input_o\ & \data[27]~input_o\ & \data[26]~input_o\ & \data[25]~input_o\ & 
\data[24]~input_o\ & \data[23]~input_o\ & \data[22]~input_o\ & \data[21]~input_o\ & \data[20]~input_o\ & \data[19]~input_o\ & \data[18]~input_o\ & \data[17]~input_o\ & \data[16]~input_o\ & \data[15]~input_o\ & \data[14]~input_o\ & \data[13]~input_o\ & 
\data[12]~input_o\ & \data[11]~input_o\ & \data[10]~input_o\ & \data[9]~input_o\ & \data[8]~input_o\ & \data[7]~input_o\ & \data[6]~input_o\ & \data[5]~input_o\ & \data[4]~input_o\ & \data[3]~input_o\ & \data[2]~input_o\ & \data[1]~input_o\ & 
\data[0]~input_o\);

\altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\ <= (\wraddress[7]~input_o\ & \wraddress[6]~input_o\ & \wraddress[5]~input_o\ & \wraddress[4]~input_o\ & \wraddress[3]~input_o\ & \wraddress[2]~input_o\ & \wraddress[1]~input_o\ & 
\wraddress[0]~input_o\);

\altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\ <= (\rdaddress[7]~input_o\ & \rdaddress[6]~input_o\ & \rdaddress[5]~input_o\ & \rdaddress[4]~input_o\ & \rdaddress[3]~input_o\ & \rdaddress[2]~input_o\ & \rdaddress[1]~input_o\ & 
\rdaddress[0]~input_o\);

\altsyncram_component|auto_generated|q_b\(0) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(0);
\altsyncram_component|auto_generated|q_b\(1) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(1);
\altsyncram_component|auto_generated|q_b\(2) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(2);
\altsyncram_component|auto_generated|q_b\(3) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(3);
\altsyncram_component|auto_generated|q_b\(4) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(4);
\altsyncram_component|auto_generated|q_b\(5) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(5);
\altsyncram_component|auto_generated|q_b\(6) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(6);
\altsyncram_component|auto_generated|q_b\(7) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(7);
\altsyncram_component|auto_generated|q_b\(8) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(8);
\altsyncram_component|auto_generated|q_b\(9) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(9);
\altsyncram_component|auto_generated|q_b\(10) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(10);
\altsyncram_component|auto_generated|q_b\(11) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(11);
\altsyncram_component|auto_generated|q_b\(12) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(12);
\altsyncram_component|auto_generated|q_b\(13) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(13);
\altsyncram_component|auto_generated|q_b\(14) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(14);
\altsyncram_component|auto_generated|q_b\(15) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(15);
\altsyncram_component|auto_generated|q_b\(16) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(16);
\altsyncram_component|auto_generated|q_b\(17) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(17);
\altsyncram_component|auto_generated|q_b\(18) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(18);
\altsyncram_component|auto_generated|q_b\(19) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(19);
\altsyncram_component|auto_generated|q_b\(20) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(20);
\altsyncram_component|auto_generated|q_b\(21) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(21);
\altsyncram_component|auto_generated|q_b\(22) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(22);
\altsyncram_component|auto_generated|q_b\(23) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(23);
\altsyncram_component|auto_generated|q_b\(24) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(24);
\altsyncram_component|auto_generated|q_b\(25) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(25);
\altsyncram_component|auto_generated|q_b\(26) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(26);
\altsyncram_component|auto_generated|q_b\(27) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(27);
\altsyncram_component|auto_generated|q_b\(28) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(28);
\altsyncram_component|auto_generated|q_b\(29) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(29);
\altsyncram_component|auto_generated|q_b\(30) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(30);
\altsyncram_component|auto_generated|q_b\(31) <= \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\(31);

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X20_Y0_N23
\q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(0),
	devoe => ww_devoe,
	o => \q[0]~output_o\);

-- Location: IOOBUF_X23_Y0_N23
\q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(1),
	devoe => ww_devoe,
	o => \q[1]~output_o\);

-- Location: IOOBUF_X33_Y0_N2
\q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(2),
	devoe => ww_devoe,
	o => \q[2]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\q[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(3),
	devoe => ww_devoe,
	o => \q[3]~output_o\);

-- Location: IOOBUF_X40_Y0_N23
\q[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(4),
	devoe => ww_devoe,
	o => \q[4]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\q[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(5),
	devoe => ww_devoe,
	o => \q[5]~output_o\);

-- Location: IOOBUF_X45_Y0_N16
\q[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(6),
	devoe => ww_devoe,
	o => \q[6]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\q[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(7),
	devoe => ww_devoe,
	o => \q[7]~output_o\);

-- Location: IOOBUF_X35_Y0_N23
\q[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(8),
	devoe => ww_devoe,
	o => \q[8]~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\q[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(9),
	devoe => ww_devoe,
	o => \q[9]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\q[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(10),
	devoe => ww_devoe,
	o => \q[10]~output_o\);

-- Location: IOOBUF_X29_Y0_N23
\q[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(11),
	devoe => ww_devoe,
	o => \q[11]~output_o\);

-- Location: IOOBUF_X42_Y0_N16
\q[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(12),
	devoe => ww_devoe,
	o => \q[12]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\q[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(13),
	devoe => ww_devoe,
	o => \q[13]~output_o\);

-- Location: IOOBUF_X42_Y0_N23
\q[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(14),
	devoe => ww_devoe,
	o => \q[14]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\q[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(15),
	devoe => ww_devoe,
	o => \q[15]~output_o\);

-- Location: IOOBUF_X47_Y0_N2
\q[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(16),
	devoe => ww_devoe,
	o => \q[16]~output_o\);

-- Location: IOOBUF_X40_Y0_N16
\q[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(17),
	devoe => ww_devoe,
	o => \q[17]~output_o\);

-- Location: IOOBUF_X29_Y0_N16
\q[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(18),
	devoe => ww_devoe,
	o => \q[18]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\q[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(19),
	devoe => ww_devoe,
	o => \q[19]~output_o\);

-- Location: IOOBUF_X38_Y0_N2
\q[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(20),
	devoe => ww_devoe,
	o => \q[20]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\q[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(21),
	devoe => ww_devoe,
	o => \q[21]~output_o\);

-- Location: IOOBUF_X45_Y0_N23
\q[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(22),
	devoe => ww_devoe,
	o => \q[22]~output_o\);

-- Location: IOOBUF_X18_Y0_N16
\q[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(23),
	devoe => ww_devoe,
	o => \q[23]~output_o\);

-- Location: IOOBUF_X18_Y0_N2
\q[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(24),
	devoe => ww_devoe,
	o => \q[24]~output_o\);

-- Location: IOOBUF_X27_Y0_N23
\q[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(25),
	devoe => ww_devoe,
	o => \q[25]~output_o\);

-- Location: IOOBUF_X20_Y0_N16
\q[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(26),
	devoe => ww_devoe,
	o => \q[26]~output_o\);

-- Location: IOOBUF_X38_Y0_N9
\q[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(27),
	devoe => ww_devoe,
	o => \q[27]~output_o\);

-- Location: IOOBUF_X49_Y0_N2
\q[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(28),
	devoe => ww_devoe,
	o => \q[28]~output_o\);

-- Location: IOOBUF_X33_Y0_N9
\q[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(29),
	devoe => ww_devoe,
	o => \q[29]~output_o\);

-- Location: IOOBUF_X35_Y0_N16
\q[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(30),
	devoe => ww_devoe,
	o => \q[30]~output_o\);

-- Location: IOOBUF_X27_Y0_N9
\q[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \altsyncram_component|auto_generated|q_b\(31),
	devoe => ww_devoe,
	o => \q[31]~output_o\);

-- Location: IOIBUF_X115_Y37_N8
\wren~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wren,
	o => \wren~input_o\);

-- Location: IOIBUF_X0_Y36_N8
\clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G2
\clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X115_Y37_N1
\data[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(0),
	o => \data[0]~input_o\);

-- Location: IOIBUF_X69_Y0_N1
\wraddress[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(0),
	o => \wraddress[0]~input_o\);

-- Location: IOIBUF_X81_Y0_N15
\wraddress[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(1),
	o => \wraddress[1]~input_o\);

-- Location: IOIBUF_X60_Y0_N22
\wraddress[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(2),
	o => \wraddress[2]~input_o\);

-- Location: IOIBUF_X52_Y0_N15
\wraddress[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(3),
	o => \wraddress[3]~input_o\);

-- Location: IOIBUF_X49_Y0_N15
\wraddress[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(4),
	o => \wraddress[4]~input_o\);

-- Location: IOIBUF_X52_Y0_N22
\wraddress[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(5),
	o => \wraddress[5]~input_o\);

-- Location: IOIBUF_X54_Y0_N8
\wraddress[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(6),
	o => \wraddress[6]~input_o\);

-- Location: IOIBUF_X54_Y0_N22
\wraddress[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_wraddress(7),
	o => \wraddress[7]~input_o\);

-- Location: IOIBUF_X83_Y0_N8
\rdaddress[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(0),
	o => \rdaddress[0]~input_o\);

-- Location: IOIBUF_X62_Y0_N22
\rdaddress[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(1),
	o => \rdaddress[1]~input_o\);

-- Location: IOIBUF_X83_Y0_N1
\rdaddress[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(2),
	o => \rdaddress[2]~input_o\);

-- Location: IOIBUF_X52_Y0_N8
\rdaddress[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(3),
	o => \rdaddress[3]~input_o\);

-- Location: IOIBUF_X65_Y0_N1
\rdaddress[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(4),
	o => \rdaddress[4]~input_o\);

-- Location: IOIBUF_X54_Y0_N1
\rdaddress[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(5),
	o => \rdaddress[5]~input_o\);

-- Location: IOIBUF_X67_Y0_N8
\rdaddress[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(6),
	o => \rdaddress[6]~input_o\);

-- Location: IOIBUF_X83_Y0_N15
\rdaddress[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_rdaddress(7),
	o => \rdaddress[7]~input_o\);

-- Location: IOIBUF_X62_Y0_N15
\data[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(1),
	o => \data[1]~input_o\);

-- Location: IOIBUF_X56_Y0_N15
\data[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(2),
	o => \data[2]~input_o\);

-- Location: IOIBUF_X52_Y0_N1
\data[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(3),
	o => \data[3]~input_o\);

-- Location: IOIBUF_X79_Y0_N1
\data[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(4),
	o => \data[4]~input_o\);

-- Location: IOIBUF_X56_Y0_N8
\data[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(5),
	o => \data[5]~input_o\);

-- Location: IOIBUF_X72_Y0_N8
\data[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(6),
	o => \data[6]~input_o\);

-- Location: IOIBUF_X67_Y0_N22
\data[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(7),
	o => \data[7]~input_o\);

-- Location: IOIBUF_X65_Y0_N8
\data[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(8),
	o => \data[8]~input_o\);

-- Location: IOIBUF_X79_Y0_N22
\data[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(9),
	o => \data[9]~input_o\);

-- Location: IOIBUF_X60_Y0_N8
\data[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(10),
	o => \data[10]~input_o\);

-- Location: IOIBUF_X74_Y0_N1
\data[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(11),
	o => \data[11]~input_o\);

-- Location: IOIBUF_X49_Y0_N22
\data[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(12),
	o => \data[12]~input_o\);

-- Location: IOIBUF_X79_Y0_N15
\data[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(13),
	o => \data[13]~input_o\);

-- Location: IOIBUF_X60_Y0_N1
\data[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(14),
	o => \data[14]~input_o\);

-- Location: IOIBUF_X74_Y0_N22
\data[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(15),
	o => \data[15]~input_o\);

-- Location: IOIBUF_X56_Y0_N1
\data[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(16),
	o => \data[16]~input_o\);

-- Location: IOIBUF_X72_Y0_N1
\data[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(17),
	o => \data[17]~input_o\);

-- Location: IOIBUF_X56_Y0_N22
\data[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(18),
	o => \data[18]~input_o\);

-- Location: IOIBUF_X65_Y0_N15
\data[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(19),
	o => \data[19]~input_o\);

-- Location: IOIBUF_X69_Y0_N8
\data[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(20),
	o => \data[20]~input_o\);

-- Location: IOIBUF_X47_Y0_N8
\data[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(21),
	o => \data[21]~input_o\);

-- Location: IOIBUF_X67_Y0_N1
\data[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(22),
	o => \data[22]~input_o\);

-- Location: IOIBUF_X79_Y0_N8
\data[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(23),
	o => \data[23]~input_o\);

-- Location: IOIBUF_X81_Y0_N22
\data[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(24),
	o => \data[24]~input_o\);

-- Location: IOIBUF_X54_Y0_N15
\data[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(25),
	o => \data[25]~input_o\);

-- Location: IOIBUF_X60_Y0_N15
\data[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(26),
	o => \data[26]~input_o\);

-- Location: IOIBUF_X74_Y0_N15
\data[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(27),
	o => \data[27]~input_o\);

-- Location: IOIBUF_X74_Y0_N8
\data[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(28),
	o => \data[28]~input_o\);

-- Location: IOIBUF_X83_Y0_N22
\data[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(29),
	o => \data[29]~input_o\);

-- Location: IOIBUF_X67_Y0_N15
\data[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(30),
	o => \data[30]~input_o\);

-- Location: IOIBUF_X65_Y0_N22
\data[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_data(31),
	o => \data[31]~input_o\);

-- Location: M9K_X51_Y1_N0
\altsyncram_component|auto_generated|ram_block1a0\ : cycloneive_ram_block
-- pragma translate_off
GENERIC MAP (
	clk0_core_clock_enable => "ena0",
	data_interleave_offset_in_bits => 1,
	data_interleave_width_in_bits => 1,
	logical_ram_name => "altsyncram:altsyncram_component|altsyncram_dvn3:auto_generated|ALTSYNCRAM",
	mixed_port_feed_through_mode => "dont_care",
	operation_mode => "dual_port",
	port_a_address_clear => "none",
	port_a_address_width => 8,
	port_a_byte_enable_clock => "none",
	port_a_data_out_clear => "none",
	port_a_data_out_clock => "none",
	port_a_data_width => 36,
	port_a_first_address => 0,
	port_a_first_bit_number => 0,
	port_a_last_address => 255,
	port_a_logical_ram_depth => 256,
	port_a_logical_ram_width => 32,
	port_a_read_during_write_mode => "new_data_with_nbe_read",
	port_b_address_clear => "none",
	port_b_address_clock => "clock1",
	port_b_address_width => 8,
	port_b_data_out_clear => "none",
	port_b_data_out_clock => "clock1",
	port_b_data_width => 36,
	port_b_first_address => 0,
	port_b_first_bit_number => 0,
	port_b_last_address => 255,
	port_b_logical_ram_depth => 256,
	port_b_logical_ram_width => 32,
	port_b_read_during_write_mode => "new_data_with_nbe_read",
	port_b_read_enable_clock => "clock1",
	ram_block_type => "M9K")
-- pragma translate_on
PORT MAP (
	portawe => \wren~input_o\,
	portbre => VCC,
	clk0 => \clock~inputclkctrl_outclk\,
	clk1 => \clock~inputclkctrl_outclk\,
	ena0 => \wren~input_o\,
	portadatain => \altsyncram_component|auto_generated|ram_block1a0_PORTADATAIN_bus\,
	portaaddr => \altsyncram_component|auto_generated|ram_block1a0_PORTAADDR_bus\,
	portbaddr => \altsyncram_component|auto_generated|ram_block1a0_PORTBADDR_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	portbdataout => \altsyncram_component|auto_generated|ram_block1a0_PORTBDATAOUT_bus\);

ww_q(0) <= \q[0]~output_o\;

ww_q(1) <= \q[1]~output_o\;

ww_q(2) <= \q[2]~output_o\;

ww_q(3) <= \q[3]~output_o\;

ww_q(4) <= \q[4]~output_o\;

ww_q(5) <= \q[5]~output_o\;

ww_q(6) <= \q[6]~output_o\;

ww_q(7) <= \q[7]~output_o\;

ww_q(8) <= \q[8]~output_o\;

ww_q(9) <= \q[9]~output_o\;

ww_q(10) <= \q[10]~output_o\;

ww_q(11) <= \q[11]~output_o\;

ww_q(12) <= \q[12]~output_o\;

ww_q(13) <= \q[13]~output_o\;

ww_q(14) <= \q[14]~output_o\;

ww_q(15) <= \q[15]~output_o\;

ww_q(16) <= \q[16]~output_o\;

ww_q(17) <= \q[17]~output_o\;

ww_q(18) <= \q[18]~output_o\;

ww_q(19) <= \q[19]~output_o\;

ww_q(20) <= \q[20]~output_o\;

ww_q(21) <= \q[21]~output_o\;

ww_q(22) <= \q[22]~output_o\;

ww_q(23) <= \q[23]~output_o\;

ww_q(24) <= \q[24]~output_o\;

ww_q(25) <= \q[25]~output_o\;

ww_q(26) <= \q[26]~output_o\;

ww_q(27) <= \q[27]~output_o\;

ww_q(28) <= \q[28]~output_o\;

ww_q(29) <= \q[29]~output_o\;

ww_q(30) <= \q[30]~output_o\;

ww_q(31) <= \q[31]~output_o\;
END structure;


