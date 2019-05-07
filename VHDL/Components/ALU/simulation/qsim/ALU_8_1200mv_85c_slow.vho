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

-- DATE "05/06/2019 21:48:03"

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

ENTITY 	ALU IS
    PORT (
	i_regDataA : IN std_logic_vector(31 DOWNTO 0);
	i_regDataB : IN std_logic_vector(31 DOWNTO 0);
	i_Op_ADS : IN std_logic;
	i_Op_MUL : IN std_logic;
	i_Op_CMP : IN std_logic;
	i_Op_ARS : IN std_logic;
	i_Op_XRS : IN std_logic;
	i_Op_ORS : IN std_logic;
	i_Op_LS1 : IN std_logic;
	i_Op_RS1 : IN std_logic;
	i_Op_LR1 : IN std_logic;
	i_Op_RR1 : IN std_logic;
	i_Op_RA1 : IN std_logic;
	o_ALUDataOut : BUFFER std_logic_vector(31 DOWNTO 0);
	o_CondCodeBits : BUFFER std_logic_vector(31 DOWNTO 0)
	);
END ALU;

-- Design Ports Information
-- i_Op_MUL	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_CMP	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[0]	=>  Location: PIN_AF26,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[1]	=>  Location: PIN_AD25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[2]	=>  Location: PIN_AD19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[3]	=>  Location: PIN_AE23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[4]	=>  Location: PIN_AF18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[5]	=>  Location: PIN_AB22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[6]	=>  Location: PIN_AC25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[7]	=>  Location: PIN_AC24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[8]	=>  Location: PIN_AB17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[9]	=>  Location: PIN_AG10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[10]	=>  Location: PIN_AB11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[11]	=>  Location: PIN_AH10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[12]	=>  Location: PIN_AC19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[13]	=>  Location: PIN_AD24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[14]	=>  Location: PIN_AF19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[15]	=>  Location: PIN_AE19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[16]	=>  Location: PIN_AE24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[17]	=>  Location: PIN_AH11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[18]	=>  Location: PIN_AA17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[19]	=>  Location: PIN_Y17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[20]	=>  Location: PIN_AG11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[21]	=>  Location: PIN_AH23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[22]	=>  Location: PIN_AB19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[23]	=>  Location: PIN_AC21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[24]	=>  Location: PIN_AD21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[25]	=>  Location: PIN_AF11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[26]	=>  Location: PIN_AE12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[27]	=>  Location: PIN_AF7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[28]	=>  Location: PIN_AH12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[29]	=>  Location: PIN_AG12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[30]	=>  Location: PIN_AC11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_ALUDataOut[31]	=>  Location: PIN_AF12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[0]	=>  Location: PIN_AG23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[1]	=>  Location: PIN_AB18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[2]	=>  Location: PIN_Y14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[3]	=>  Location: PIN_Y15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[4]	=>  Location: PIN_AF9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[5]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[6]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[7]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[8]	=>  Location: PIN_D20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[9]	=>  Location: PIN_H5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[10]	=>  Location: PIN_K21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[11]	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[12]	=>  Location: PIN_W4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[13]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[14]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[15]	=>  Location: PIN_V23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[16]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[17]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[18]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[19]	=>  Location: PIN_AC8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[20]	=>  Location: PIN_V7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[21]	=>  Location: PIN_K28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[22]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[23]	=>  Location: PIN_R2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[24]	=>  Location: PIN_C3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[25]	=>  Location: PIN_AA24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[26]	=>  Location: PIN_E18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[27]	=>  Location: PIN_AG7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[28]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[29]	=>  Location: PIN_AH4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[30]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- o_CondCodeBits[31]	=>  Location: PIN_C18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_ADS	=>  Location: PIN_AE17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[31]	=>  Location: PIN_AB13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[31]	=>  Location: PIN_AD12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[0]	=>  Location: PIN_AH25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[1]	=>  Location: PIN_AG18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[1]	=>  Location: PIN_AE25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[0]	=>  Location: PIN_AF8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[2]	=>  Location: PIN_AC18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[3]	=>  Location: PIN_AB12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[3]	=>  Location: PIN_AF17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[2]	=>  Location: PIN_AF10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[4]	=>  Location: PIN_AF21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[5]	=>  Location: PIN_AE20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[5]	=>  Location: PIN_AF13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[4]	=>  Location: PIN_AE13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[6]	=>  Location: PIN_AD18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[7]	=>  Location: PIN_AB15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[7]	=>  Location: PIN_AE8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[6]	=>  Location: PIN_AC22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[8]	=>  Location: PIN_AF16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[9]	=>  Location: PIN_AA16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[9]	=>  Location: PIN_AE10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[8]	=>  Location: PIN_AE9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[10]	=>  Location: PIN_AE16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[11]	=>  Location: PIN_AG25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[11]	=>  Location: PIN_AA12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[10]	=>  Location: PIN_AB10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[12]	=>  Location: PIN_AC14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[13]	=>  Location: PIN_AG22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[13]	=>  Location: PIN_Y19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[12]	=>  Location: PIN_AA15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[14]	=>  Location: PIN_AG21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[15]	=>  Location: PIN_AB20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[15]	=>  Location: PIN_AF22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[14]	=>  Location: PIN_Y16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[16]	=>  Location: PIN_AH19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[17]	=>  Location: PIN_AH18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[17]	=>  Location: PIN_AH22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[16]	=>  Location: PIN_AE22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[18]	=>  Location: PIN_AH21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[19]	=>  Location: PIN_AF25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[19]	=>  Location: PIN_AD17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[18]	=>  Location: PIN_AF24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[20]	=>  Location: PIN_AG19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[21]	=>  Location: PIN_AE21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[21]	=>  Location: PIN_AC17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[20]	=>  Location: PIN_AE18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[22]	=>  Location: PIN_AF20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[23]	=>  Location: PIN_AA21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[23]	=>  Location: PIN_AA19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[22]	=>  Location: PIN_AF23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[24]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[25]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[25]	=>  Location: PIN_AD11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[24]	=>  Location: PIN_AB21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[26]	=>  Location: PIN_AC10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[27]	=>  Location: PIN_AB14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[27]	=>  Location: PIN_Y13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[26]	=>  Location: PIN_AD14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[28]	=>  Location: PIN_AA14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[29]	=>  Location: PIN_AG17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[29]	=>  Location: PIN_AH17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[28]	=>  Location: PIN_AD15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataA[30]	=>  Location: PIN_AE14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_regDataB[30]	=>  Location: PIN_AE15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_ORS	=>  Location: PIN_AF15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_ARS	=>  Location: PIN_AC15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_XRS	=>  Location: PIN_AB16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_LR1	=>  Location: PIN_AH8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_RS1	=>  Location: PIN_AE11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_LS1	=>  Location: PIN_AE7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_RA1	=>  Location: PIN_AA13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- i_Op_RR1	=>  Location: PIN_Y12,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF ALU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_i_regDataA : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_i_regDataB : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_i_Op_ADS : std_logic;
SIGNAL ww_i_Op_MUL : std_logic;
SIGNAL ww_i_Op_CMP : std_logic;
SIGNAL ww_i_Op_ARS : std_logic;
SIGNAL ww_i_Op_XRS : std_logic;
SIGNAL ww_i_Op_ORS : std_logic;
SIGNAL ww_i_Op_LS1 : std_logic;
SIGNAL ww_i_Op_RS1 : std_logic;
SIGNAL ww_i_Op_LR1 : std_logic;
SIGNAL ww_i_Op_RR1 : std_logic;
SIGNAL ww_i_Op_RA1 : std_logic;
SIGNAL ww_o_ALUDataOut : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_o_CondCodeBits : std_logic_vector(31 DOWNTO 0);
SIGNAL \w_ALUResult[31]~7clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \i_Op_MUL~input_o\ : std_logic;
SIGNAL \i_Op_CMP~input_o\ : std_logic;
SIGNAL \o_ALUDataOut[0]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[1]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[2]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[3]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[4]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[5]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[6]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[7]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[8]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[9]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[10]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[11]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[12]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[13]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[14]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[15]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[16]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[17]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[18]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[19]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[20]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[21]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[22]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[23]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[24]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[25]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[26]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[27]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[28]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[29]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[30]~output_o\ : std_logic;
SIGNAL \o_ALUDataOut[31]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[0]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[1]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[2]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[3]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[4]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[5]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[6]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[7]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[8]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[9]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[10]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[11]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[12]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[13]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[14]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[15]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[16]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[17]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[18]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[19]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[20]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[21]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[22]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[23]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[24]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[25]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[26]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[27]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[28]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[29]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[30]~output_o\ : std_logic;
SIGNAL \o_CondCodeBits[31]~output_o\ : std_logic;
SIGNAL \i_Op_ARS~input_o\ : std_logic;
SIGNAL \i_Op_ORS~input_o\ : std_logic;
SIGNAL \i_regDataB[0]~input_o\ : std_logic;
SIGNAL \i_regDataA[0]~input_o\ : std_logic;
SIGNAL \w_ALUResult[0]~0_combout\ : std_logic;
SIGNAL \i_Op_XRS~input_o\ : std_logic;
SIGNAL \i_regDataA[31]~input_o\ : std_logic;
SIGNAL \i_Op_LR1~input_o\ : std_logic;
SIGNAL \i_regDataA[1]~input_o\ : std_logic;
SIGNAL \i_Op_RS1~input_o\ : std_logic;
SIGNAL \w_ALUResult[0]~1_combout\ : std_logic;
SIGNAL \i_Op_LS1~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \w_ALUResult[0]~2_combout\ : std_logic;
SIGNAL \w_ALUResult[0]~3_combout\ : std_logic;
SIGNAL \i_Op_ADS~input_o\ : std_logic;
SIGNAL \w_ALUResult[0]~4_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~6_combout\ : std_logic;
SIGNAL \i_Op_RA1~input_o\ : std_logic;
SIGNAL \i_Op_RR1~input_o\ : std_logic;
SIGNAL \w_ALUResult[31]~5_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~7_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~7clkctrl_outclk\ : std_logic;
SIGNAL \i_regDataB[1]~input_o\ : std_logic;
SIGNAL \w_ALUResult[1]~11_combout\ : std_logic;
SIGNAL \w_ALUResult[1]~10_combout\ : std_logic;
SIGNAL \w_ALUResult[1]~12_combout\ : std_logic;
SIGNAL \w_ALUResult[1]~13_combout\ : std_logic;
SIGNAL \i_regDataA[2]~input_o\ : std_logic;
SIGNAL \w_ALUResult[1]~14_combout\ : std_logic;
SIGNAL \w_ALUResult[1]~15_combout\ : std_logic;
SIGNAL \w_ALUResult[1]~8_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \w_ALUResult[1]~9_combout\ : std_logic;
SIGNAL \w_ALUResult[1]~16_combout\ : std_logic;
SIGNAL \i_regDataB[2]~input_o\ : std_logic;
SIGNAL \w_ALUResult[2]~19_combout\ : std_logic;
SIGNAL \i_regDataA[3]~input_o\ : std_logic;
SIGNAL \w_ALUResult[2]~21_combout\ : std_logic;
SIGNAL \w_ALUResult[2]~20_combout\ : std_logic;
SIGNAL \w_ALUResult[2]~22_combout\ : std_logic;
SIGNAL \w_ALUResult[2]~17_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \w_ALUResult[2]~18_combout\ : std_logic;
SIGNAL \w_ALUResult[2]~23_combout\ : std_logic;
SIGNAL \i_regDataB[3]~input_o\ : std_logic;
SIGNAL \w_ALUResult[3]~26_combout\ : std_logic;
SIGNAL \w_ALUResult[3]~27_combout\ : std_logic;
SIGNAL \i_regDataA[4]~input_o\ : std_logic;
SIGNAL \w_ALUResult[3]~28_combout\ : std_logic;
SIGNAL \w_ALUResult[3]~29_combout\ : std_logic;
SIGNAL \w_ALUResult[3]~24_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \w_ALUResult[3]~25_combout\ : std_logic;
SIGNAL \w_ALUResult[3]~30_combout\ : std_logic;
SIGNAL \i_regDataA[5]~input_o\ : std_logic;
SIGNAL \w_ALUResult[4]~35_combout\ : std_logic;
SIGNAL \i_regDataB[4]~input_o\ : std_logic;
SIGNAL \w_ALUResult[4]~34_combout\ : std_logic;
SIGNAL \w_ALUResult[4]~36_combout\ : std_logic;
SIGNAL \w_ALUResult[4]~33_combout\ : std_logic;
SIGNAL \w_ALUResult[4]~31_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \w_ALUResult[4]~32_combout\ : std_logic;
SIGNAL \w_ALUResult[4]~37_combout\ : std_logic;
SIGNAL \i_regDataB[5]~input_o\ : std_logic;
SIGNAL \w_ALUResult[5]~40_combout\ : std_logic;
SIGNAL \w_ALUResult[5]~38_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \w_ALUResult[5]~39_combout\ : std_logic;
SIGNAL \w_ALUResult[5]~41_combout\ : std_logic;
SIGNAL \i_regDataA[6]~input_o\ : std_logic;
SIGNAL \w_ALUResult[5]~42_combout\ : std_logic;
SIGNAL \w_ALUResult[5]~43_combout\ : std_logic;
SIGNAL \w_ALUResult[5]~44_combout\ : std_logic;
SIGNAL \i_regDataA[7]~input_o\ : std_logic;
SIGNAL \w_ALUResult[6]~49_combout\ : std_logic;
SIGNAL \i_regDataB[6]~input_o\ : std_logic;
SIGNAL \w_ALUResult[6]~48_combout\ : std_logic;
SIGNAL \w_ALUResult[6]~50_combout\ : std_logic;
SIGNAL \w_ALUResult[6]~47_combout\ : std_logic;
SIGNAL \w_ALUResult[6]~45_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \w_ALUResult[6]~46_combout\ : std_logic;
SIGNAL \w_ALUResult[6]~51_combout\ : std_logic;
SIGNAL \i_regDataB[7]~input_o\ : std_logic;
SIGNAL \w_ALUResult[7]~54_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \w_ALUResult[7]~52_combout\ : std_logic;
SIGNAL \w_ALUResult[7]~53_combout\ : std_logic;
SIGNAL \i_regDataA[8]~input_o\ : std_logic;
SIGNAL \w_ALUResult[7]~56_combout\ : std_logic;
SIGNAL \w_ALUResult[7]~55_combout\ : std_logic;
SIGNAL \w_ALUResult[7]~57_combout\ : std_logic;
SIGNAL \w_ALUResult[7]~58_combout\ : std_logic;
SIGNAL \i_regDataB[8]~input_o\ : std_logic;
SIGNAL \w_ALUResult[8]~61_combout\ : std_logic;
SIGNAL \i_regDataA[9]~input_o\ : std_logic;
SIGNAL \w_ALUResult[8]~63_combout\ : std_logic;
SIGNAL \w_ALUResult[8]~62_combout\ : std_logic;
SIGNAL \w_ALUResult[8]~64_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \w_ALUResult[8]~59_combout\ : std_logic;
SIGNAL \w_ALUResult[8]~60_combout\ : std_logic;
SIGNAL \w_ALUResult[8]~65_combout\ : std_logic;
SIGNAL \i_regDataB[9]~input_o\ : std_logic;
SIGNAL \w_ALUResult[9]~68_combout\ : std_logic;
SIGNAL \i_regDataA[10]~input_o\ : std_logic;
SIGNAL \w_ALUResult[9]~70_combout\ : std_logic;
SIGNAL \w_ALUResult[9]~69_combout\ : std_logic;
SIGNAL \w_ALUResult[9]~71_combout\ : std_logic;
SIGNAL \w_ALUResult[9]~66_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \w_ALUResult[9]~67_combout\ : std_logic;
SIGNAL \w_ALUResult[9]~72_combout\ : std_logic;
SIGNAL \i_regDataB[10]~input_o\ : std_logic;
SIGNAL \w_ALUResult[10]~75_combout\ : std_logic;
SIGNAL \w_ALUResult[10]~73_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \w_ALUResult[10]~74_combout\ : std_logic;
SIGNAL \i_regDataA[11]~input_o\ : std_logic;
SIGNAL \w_ALUResult[10]~77_combout\ : std_logic;
SIGNAL \w_ALUResult[10]~76_combout\ : std_logic;
SIGNAL \w_ALUResult[10]~78_combout\ : std_logic;
SIGNAL \w_ALUResult[10]~79_combout\ : std_logic;
SIGNAL \i_regDataB[11]~input_o\ : std_logic;
SIGNAL \w_ALUResult[11]~80_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \w_ALUResult[11]~81_combout\ : std_logic;
SIGNAL \i_regDataA[12]~input_o\ : std_logic;
SIGNAL \w_ALUResult[11]~84_combout\ : std_logic;
SIGNAL \w_ALUResult[11]~83_combout\ : std_logic;
SIGNAL \w_ALUResult[11]~85_combout\ : std_logic;
SIGNAL \w_ALUResult[11]~82_combout\ : std_logic;
SIGNAL \w_ALUResult[11]~86_combout\ : std_logic;
SIGNAL \i_regDataB[12]~input_o\ : std_logic;
SIGNAL \w_ALUResult[12]~89_combout\ : std_logic;
SIGNAL \w_ALUResult[12]~90_combout\ : std_logic;
SIGNAL \i_regDataA[13]~input_o\ : std_logic;
SIGNAL \w_ALUResult[12]~91_combout\ : std_logic;
SIGNAL \w_ALUResult[12]~92_combout\ : std_logic;
SIGNAL \w_ALUResult[12]~87_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \w_ALUResult[12]~88_combout\ : std_logic;
SIGNAL \w_ALUResult[12]~93_combout\ : std_logic;
SIGNAL \i_regDataB[13]~input_o\ : std_logic;
SIGNAL \w_ALUResult[13]~97_combout\ : std_logic;
SIGNAL \i_regDataA[14]~input_o\ : std_logic;
SIGNAL \w_ALUResult[13]~98_combout\ : std_logic;
SIGNAL \w_ALUResult[13]~99_combout\ : std_logic;
SIGNAL \w_ALUResult[13]~96_combout\ : std_logic;
SIGNAL \w_ALUResult[13]~94_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \w_ALUResult[13]~95_combout\ : std_logic;
SIGNAL \w_ALUResult[13]~100_combout\ : std_logic;
SIGNAL \i_regDataB[14]~input_o\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \i_regDataA[15]~input_o\ : std_logic;
SIGNAL \w_ALUResult[14]~102_combout\ : std_logic;
SIGNAL \w_ALUResult[14]~101_combout\ : std_logic;
SIGNAL \w_ALUResult[14]~103_combout\ : std_logic;
SIGNAL \w_ALUResult[14]~104_combout\ : std_logic;
SIGNAL \w_ALUResult[14]~105_combout\ : std_logic;
SIGNAL \i_regDataB[15]~input_o\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \w_ALUResult[15]~106_combout\ : std_logic;
SIGNAL \i_regDataA[16]~input_o\ : std_logic;
SIGNAL \w_ALUResult[15]~107_combout\ : std_logic;
SIGNAL \w_ALUResult[15]~108_combout\ : std_logic;
SIGNAL \w_ALUResult[15]~109_combout\ : std_logic;
SIGNAL \w_ALUResult[15]~110_combout\ : std_logic;
SIGNAL \i_regDataB[16]~input_o\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \w_ALUResult[16]~111_combout\ : std_logic;
SIGNAL \i_regDataA[17]~input_o\ : std_logic;
SIGNAL \w_ALUResult[16]~112_combout\ : std_logic;
SIGNAL \w_ALUResult[16]~113_combout\ : std_logic;
SIGNAL \w_ALUResult[16]~114_combout\ : std_logic;
SIGNAL \w_ALUResult[16]~115_combout\ : std_logic;
SIGNAL \i_regDataB[17]~input_o\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \w_ALUResult[17]~116_combout\ : std_logic;
SIGNAL \i_regDataA[18]~input_o\ : std_logic;
SIGNAL \w_ALUResult[17]~117_combout\ : std_logic;
SIGNAL \w_ALUResult[17]~118_combout\ : std_logic;
SIGNAL \w_ALUResult[17]~119_combout\ : std_logic;
SIGNAL \w_ALUResult[17]~120_combout\ : std_logic;
SIGNAL \i_regDataB[18]~input_o\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \i_regDataA[19]~input_o\ : std_logic;
SIGNAL \w_ALUResult[18]~122_combout\ : std_logic;
SIGNAL \w_ALUResult[18]~121_combout\ : std_logic;
SIGNAL \w_ALUResult[18]~123_combout\ : std_logic;
SIGNAL \w_ALUResult[18]~124_combout\ : std_logic;
SIGNAL \w_ALUResult[18]~125_combout\ : std_logic;
SIGNAL \i_regDataB[19]~input_o\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \i_regDataA[20]~input_o\ : std_logic;
SIGNAL \w_ALUResult[19]~127_combout\ : std_logic;
SIGNAL \w_ALUResult[19]~126_combout\ : std_logic;
SIGNAL \w_ALUResult[19]~128_combout\ : std_logic;
SIGNAL \w_ALUResult[19]~129_combout\ : std_logic;
SIGNAL \w_ALUResult[19]~130_combout\ : std_logic;
SIGNAL \i_regDataA[21]~input_o\ : std_logic;
SIGNAL \w_ALUResult[20]~132_combout\ : std_logic;
SIGNAL \i_regDataB[20]~input_o\ : std_logic;
SIGNAL \w_ALUResult[20]~131_combout\ : std_logic;
SIGNAL \w_ALUResult[20]~133_combout\ : std_logic;
SIGNAL \w_ALUResult[20]~134_combout\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \w_ALUResult[20]~135_combout\ : std_logic;
SIGNAL \i_regDataB[21]~input_o\ : std_logic;
SIGNAL \w_ALUResult[21]~136_combout\ : std_logic;
SIGNAL \i_regDataA[22]~input_o\ : std_logic;
SIGNAL \w_ALUResult[21]~137_combout\ : std_logic;
SIGNAL \w_ALUResult[21]~138_combout\ : std_logic;
SIGNAL \w_ALUResult[21]~139_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \w_ALUResult[21]~140_combout\ : std_logic;
SIGNAL \i_regDataB[22]~input_o\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \i_regDataA[23]~input_o\ : std_logic;
SIGNAL \w_ALUResult[22]~142_combout\ : std_logic;
SIGNAL \w_ALUResult[22]~141_combout\ : std_logic;
SIGNAL \w_ALUResult[22]~143_combout\ : std_logic;
SIGNAL \w_ALUResult[22]~144_combout\ : std_logic;
SIGNAL \w_ALUResult[22]~145_combout\ : std_logic;
SIGNAL \i_regDataB[23]~input_o\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \w_ALUResult[23]~146_combout\ : std_logic;
SIGNAL \i_regDataA[24]~input_o\ : std_logic;
SIGNAL \w_ALUResult[23]~147_combout\ : std_logic;
SIGNAL \w_ALUResult[23]~148_combout\ : std_logic;
SIGNAL \w_ALUResult[23]~149_combout\ : std_logic;
SIGNAL \w_ALUResult[23]~150_combout\ : std_logic;
SIGNAL \i_regDataB[24]~input_o\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \i_regDataA[25]~input_o\ : std_logic;
SIGNAL \w_ALUResult[24]~151_combout\ : std_logic;
SIGNAL \w_ALUResult[24]~152_combout\ : std_logic;
SIGNAL \w_ALUResult[24]~153_combout\ : std_logic;
SIGNAL \w_ALUResult[24]~154_combout\ : std_logic;
SIGNAL \w_ALUResult[24]~155_combout\ : std_logic;
SIGNAL \i_regDataB[25]~input_o\ : std_logic;
SIGNAL \i_regDataA[26]~input_o\ : std_logic;
SIGNAL \w_ALUResult[25]~156_combout\ : std_logic;
SIGNAL \w_ALUResult[25]~157_combout\ : std_logic;
SIGNAL \w_ALUResult[25]~158_combout\ : std_logic;
SIGNAL \w_ALUResult[25]~159_combout\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \w_ALUResult[25]~160_combout\ : std_logic;
SIGNAL \i_regDataB[26]~input_o\ : std_logic;
SIGNAL \i_regDataA[27]~input_o\ : std_logic;
SIGNAL \w_ALUResult[26]~161_combout\ : std_logic;
SIGNAL \w_ALUResult[26]~162_combout\ : std_logic;
SIGNAL \w_ALUResult[26]~163_combout\ : std_logic;
SIGNAL \w_ALUResult[26]~164_combout\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \w_ALUResult[26]~165_combout\ : std_logic;
SIGNAL \i_regDataB[27]~input_o\ : std_logic;
SIGNAL \i_regDataA[28]~input_o\ : std_logic;
SIGNAL \w_ALUResult[27]~166_combout\ : std_logic;
SIGNAL \w_ALUResult[27]~167_combout\ : std_logic;
SIGNAL \w_ALUResult[27]~168_combout\ : std_logic;
SIGNAL \w_ALUResult[27]~169_combout\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \w_ALUResult[27]~170_combout\ : std_logic;
SIGNAL \i_regDataB[28]~input_o\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \i_regDataA[29]~input_o\ : std_logic;
SIGNAL \w_ALUResult[28]~171_combout\ : std_logic;
SIGNAL \w_ALUResult[28]~172_combout\ : std_logic;
SIGNAL \w_ALUResult[28]~173_combout\ : std_logic;
SIGNAL \w_ALUResult[28]~174_combout\ : std_logic;
SIGNAL \w_ALUResult[28]~175_combout\ : std_logic;
SIGNAL \i_regDataB[29]~input_o\ : std_logic;
SIGNAL \i_regDataA[30]~input_o\ : std_logic;
SIGNAL \w_ALUResult[29]~176_combout\ : std_logic;
SIGNAL \w_ALUResult[29]~177_combout\ : std_logic;
SIGNAL \w_ALUResult[29]~178_combout\ : std_logic;
SIGNAL \w_ALUResult[29]~179_combout\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \w_ALUResult[29]~180_combout\ : std_logic;
SIGNAL \i_regDataB[30]~input_o\ : std_logic;
SIGNAL \w_ALUResult[30]~181_combout\ : std_logic;
SIGNAL \w_ALUResult[30]~182_combout\ : std_logic;
SIGNAL \w_ALUResult[30]~183_combout\ : std_logic;
SIGNAL \w_ALUResult[30]~184_combout\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \w_ALUResult[30]~185_combout\ : std_logic;
SIGNAL \i_regDataB[31]~input_o\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~186_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~188_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~187_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~189_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~190_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~191_combout\ : std_logic;
SIGNAL \w_ALUResult[31]~192_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \Equal0~10_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \w_CarrySet~0_combout\ : std_logic;
SIGNAL \w_CarryClear~0_combout\ : std_logic;
SIGNAL \Equal2~18_combout\ : std_logic;
SIGNAL \Equal2~16_combout\ : std_logic;
SIGNAL \Equal2~17_combout\ : std_logic;
SIGNAL \Equal2~15_combout\ : std_logic;
SIGNAL \Equal2~19_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Equal2~3_combout\ : std_logic;
SIGNAL \Equal2~2_combout\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \Equal2~4_combout\ : std_logic;
SIGNAL \Equal2~6_combout\ : std_logic;
SIGNAL \Equal2~7_combout\ : std_logic;
SIGNAL \Equal2~5_combout\ : std_logic;
SIGNAL \Equal2~8_combout\ : std_logic;
SIGNAL \Equal2~9_combout\ : std_logic;
SIGNAL \Equal2~11_combout\ : std_logic;
SIGNAL \Equal2~10_combout\ : std_logic;
SIGNAL \Equal2~12_combout\ : std_logic;
SIGNAL \Equal2~13_combout\ : std_logic;
SIGNAL \Equal2~14_combout\ : std_logic;
SIGNAL \Equal2~20_combout\ : std_logic;
SIGNAL w_ALUResult : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_i_regDataA <= i_regDataA;
ww_i_regDataB <= i_regDataB;
ww_i_Op_ADS <= i_Op_ADS;
ww_i_Op_MUL <= i_Op_MUL;
ww_i_Op_CMP <= i_Op_CMP;
ww_i_Op_ARS <= i_Op_ARS;
ww_i_Op_XRS <= i_Op_XRS;
ww_i_Op_ORS <= i_Op_ORS;
ww_i_Op_LS1 <= i_Op_LS1;
ww_i_Op_RS1 <= i_Op_RS1;
ww_i_Op_LR1 <= i_Op_LR1;
ww_i_Op_RR1 <= i_Op_RR1;
ww_i_Op_RA1 <= i_Op_RA1;
o_ALUDataOut <= ww_o_ALUDataOut;
o_CondCodeBits <= ww_o_CondCodeBits;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\w_ALUResult[31]~7clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \w_ALUResult[31]~7_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X89_Y0_N2
\o_ALUDataOut[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(0),
	devoe => ww_devoe,
	o => \o_ALUDataOut[0]~output_o\);

-- Location: IOOBUF_X100_Y0_N23
\o_ALUDataOut[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(1),
	devoe => ww_devoe,
	o => \o_ALUDataOut[1]~output_o\);

-- Location: IOOBUF_X94_Y0_N2
\o_ALUDataOut[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(2),
	devoe => ww_devoe,
	o => \o_ALUDataOut[2]~output_o\);

-- Location: IOOBUF_X105_Y0_N16
\o_ALUDataOut[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(3),
	devoe => ww_devoe,
	o => \o_ALUDataOut[3]~output_o\);

-- Location: IOOBUF_X79_Y0_N16
\o_ALUDataOut[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(4),
	devoe => ww_devoe,
	o => \o_ALUDataOut[4]~output_o\);

-- Location: IOOBUF_X107_Y0_N2
\o_ALUDataOut[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(5),
	devoe => ww_devoe,
	o => \o_ALUDataOut[5]~output_o\);

-- Location: IOOBUF_X115_Y4_N23
\o_ALUDataOut[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(6),
	devoe => ww_devoe,
	o => \o_ALUDataOut[6]~output_o\);

-- Location: IOOBUF_X115_Y4_N16
\o_ALUDataOut[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(7),
	devoe => ww_devoe,
	o => \o_ALUDataOut[7]~output_o\);

-- Location: IOOBUF_X89_Y0_N16
\o_ALUDataOut[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(8),
	devoe => ww_devoe,
	o => \o_ALUDataOut[8]~output_o\);

-- Location: IOOBUF_X31_Y0_N9
\o_ALUDataOut[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(9),
	devoe => ww_devoe,
	o => \o_ALUDataOut[9]~output_o\);

-- Location: IOOBUF_X27_Y0_N9
\o_ALUDataOut[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(10),
	devoe => ww_devoe,
	o => \o_ALUDataOut[10]~output_o\);

-- Location: IOOBUF_X31_Y0_N2
\o_ALUDataOut[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(11),
	devoe => ww_devoe,
	o => \o_ALUDataOut[11]~output_o\);

-- Location: IOOBUF_X94_Y0_N9
\o_ALUDataOut[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(12),
	devoe => ww_devoe,
	o => \o_ALUDataOut[12]~output_o\);

-- Location: IOOBUF_X105_Y0_N23
\o_ALUDataOut[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(13),
	devoe => ww_devoe,
	o => \o_ALUDataOut[13]~output_o\);

-- Location: IOOBUF_X83_Y0_N16
\o_ALUDataOut[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(14),
	devoe => ww_devoe,
	o => \o_ALUDataOut[14]~output_o\);

-- Location: IOOBUF_X83_Y0_N23
\o_ALUDataOut[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(15),
	devoe => ww_devoe,
	o => \o_ALUDataOut[15]~output_o\);

-- Location: IOOBUF_X100_Y0_N16
\o_ALUDataOut[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(16),
	devoe => ww_devoe,
	o => \o_ALUDataOut[16]~output_o\);

-- Location: IOOBUF_X40_Y0_N16
\o_ALUDataOut[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(17),
	devoe => ww_devoe,
	o => \o_ALUDataOut[17]~output_o\);

-- Location: IOOBUF_X89_Y0_N23
\o_ALUDataOut[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(18),
	devoe => ww_devoe,
	o => \o_ALUDataOut[18]~output_o\);

-- Location: IOOBUF_X96_Y0_N23
\o_ALUDataOut[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(19),
	devoe => ww_devoe,
	o => \o_ALUDataOut[19]~output_o\);

-- Location: IOOBUF_X40_Y0_N23
\o_ALUDataOut[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(20),
	devoe => ww_devoe,
	o => \o_ALUDataOut[20]~output_o\);

-- Location: IOOBUF_X81_Y0_N16
\o_ALUDataOut[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(21),
	devoe => ww_devoe,
	o => \o_ALUDataOut[21]~output_o\);

-- Location: IOOBUF_X98_Y0_N23
\o_ALUDataOut[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(22),
	devoe => ww_devoe,
	o => \o_ALUDataOut[22]~output_o\);

-- Location: IOOBUF_X102_Y0_N23
\o_ALUDataOut[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(23),
	devoe => ww_devoe,
	o => \o_ALUDataOut[23]~output_o\);

-- Location: IOOBUF_X102_Y0_N16
\o_ALUDataOut[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(24),
	devoe => ww_devoe,
	o => \o_ALUDataOut[24]~output_o\);

-- Location: IOOBUF_X35_Y0_N16
\o_ALUDataOut[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(25),
	devoe => ww_devoe,
	o => \o_ALUDataOut[25]~output_o\);

-- Location: IOOBUF_X33_Y0_N9
\o_ALUDataOut[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(26),
	devoe => ww_devoe,
	o => \o_ALUDataOut[26]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\o_ALUDataOut[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(27),
	devoe => ww_devoe,
	o => \o_ALUDataOut[27]~output_o\);

-- Location: IOOBUF_X54_Y0_N2
\o_ALUDataOut[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(28),
	devoe => ww_devoe,
	o => \o_ALUDataOut[28]~output_o\);

-- Location: IOOBUF_X54_Y0_N9
\o_ALUDataOut[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(29),
	devoe => ww_devoe,
	o => \o_ALUDataOut[29]~output_o\);

-- Location: IOOBUF_X49_Y0_N9
\o_ALUDataOut[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(30),
	devoe => ww_devoe,
	o => \o_ALUDataOut[30]~output_o\);

-- Location: IOOBUF_X33_Y0_N2
\o_ALUDataOut[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => w_ALUResult(31),
	devoe => ww_devoe,
	o => \o_ALUDataOut[31]~output_o\);

-- Location: IOOBUF_X81_Y0_N23
\o_CondCodeBits[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~10_combout\,
	devoe => ww_devoe,
	o => \o_CondCodeBits[0]~output_o\);

-- Location: IOOBUF_X98_Y0_N16
\o_CondCodeBits[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~0_combout\,
	devoe => ww_devoe,
	o => \o_CondCodeBits[1]~output_o\);

-- Location: IOOBUF_X56_Y0_N9
\o_CondCodeBits[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \w_CarrySet~0_combout\,
	devoe => ww_devoe,
	o => \o_CondCodeBits[2]~output_o\);

-- Location: IOOBUF_X56_Y0_N2
\o_CondCodeBits[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \w_CarryClear~0_combout\,
	devoe => ww_devoe,
	o => \o_CondCodeBits[3]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\o_CondCodeBits[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal2~20_combout\,
	devoe => ww_devoe,
	o => \o_CondCodeBits[4]~output_o\);

-- Location: IOOBUF_X49_Y73_N23
\o_CondCodeBits[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[5]~output_o\);

-- Location: IOOBUF_X27_Y73_N9
\o_CondCodeBits[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[6]~output_o\);

-- Location: IOOBUF_X18_Y73_N16
\o_CondCodeBits[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[7]~output_o\);

-- Location: IOOBUF_X85_Y73_N16
\o_CondCodeBits[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[8]~output_o\);

-- Location: IOOBUF_X0_Y59_N23
\o_CondCodeBits[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[9]~output_o\);

-- Location: IOOBUF_X115_Y64_N2
\o_CondCodeBits[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[10]~output_o\);

-- Location: IOOBUF_X85_Y73_N23
\o_CondCodeBits[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[11]~output_o\);

-- Location: IOOBUF_X0_Y14_N9
\o_CondCodeBits[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[12]~output_o\);

-- Location: IOOBUF_X62_Y73_N23
\o_CondCodeBits[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[13]~output_o\);

-- Location: IOOBUF_X79_Y73_N9
\o_CondCodeBits[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[14]~output_o\);

-- Location: IOOBUF_X115_Y24_N2
\o_CondCodeBits[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[15]~output_o\);

-- Location: IOOBUF_X27_Y73_N16
\o_CondCodeBits[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[16]~output_o\);

-- Location: IOOBUF_X29_Y73_N2
\o_CondCodeBits[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[17]~output_o\);

-- Location: IOOBUF_X72_Y73_N16
\o_CondCodeBits[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[18]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\o_CondCodeBits[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[19]~output_o\);

-- Location: IOOBUF_X0_Y14_N2
\o_CondCodeBits[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[20]~output_o\);

-- Location: IOOBUF_X115_Y49_N2
\o_CondCodeBits[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[21]~output_o\);

-- Location: IOOBUF_X85_Y73_N9
\o_CondCodeBits[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[22]~output_o\);

-- Location: IOOBUF_X0_Y35_N2
\o_CondCodeBits[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[23]~output_o\);

-- Location: IOOBUF_X1_Y73_N23
\o_CondCodeBits[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[24]~output_o\);

-- Location: IOOBUF_X115_Y9_N23
\o_CondCodeBits[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[25]~output_o\);

-- Location: IOOBUF_X87_Y73_N9
\o_CondCodeBits[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[26]~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\o_CondCodeBits[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[27]~output_o\);

-- Location: IOOBUF_X60_Y73_N9
\o_CondCodeBits[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[28]~output_o\);

-- Location: IOOBUF_X9_Y0_N16
\o_CondCodeBits[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[29]~output_o\);

-- Location: IOOBUF_X69_Y73_N23
\o_CondCodeBits[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[30]~output_o\);

-- Location: IOOBUF_X87_Y73_N23
\o_CondCodeBits[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \o_CondCodeBits[31]~output_o\);

-- Location: IOIBUF_X60_Y0_N22
\i_Op_ARS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_ARS,
	o => \i_Op_ARS~input_o\);

-- Location: IOIBUF_X60_Y0_N1
\i_Op_ORS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_ORS,
	o => \i_Op_ORS~input_o\);

-- Location: IOIBUF_X23_Y0_N15
\i_regDataB[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(0),
	o => \i_regDataB[0]~input_o\);

-- Location: IOIBUF_X91_Y0_N15
\i_regDataA[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(0),
	o => \i_regDataA[0]~input_o\);

-- Location: LCCOMB_X66_Y4_N26
\w_ALUResult[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[0]~0_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[0]~input_o\ & \i_regDataA[0]~input_o\)) # (!\i_Op_ARS~input_o\ & ((\i_regDataB[0]~input_o\) # (\i_regDataA[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datac => \i_regDataB[0]~input_o\,
	datad => \i_regDataA[0]~input_o\,
	combout => \w_ALUResult[0]~0_combout\);

-- Location: IOIBUF_X65_Y0_N1
\i_Op_XRS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_XRS,
	o => \i_Op_XRS~input_o\);

-- Location: IOIBUF_X47_Y0_N8
\i_regDataA[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(31),
	o => \i_regDataA[31]~input_o\);

-- Location: IOIBUF_X20_Y0_N22
\i_Op_LR1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_LR1,
	o => \i_Op_LR1~input_o\);

-- Location: IOIBUF_X69_Y0_N8
\i_regDataA[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(1),
	o => \i_regDataA[1]~input_o\);

-- Location: IOIBUF_X35_Y0_N22
\i_Op_RS1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_RS1,
	o => \i_Op_RS1~input_o\);

-- Location: LCCOMB_X66_Y4_N4
\w_ALUResult[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[0]~1_combout\ = (\i_Op_LR1~input_o\ & ((\i_Op_RS1~input_o\ & ((\i_regDataA[1]~input_o\))) # (!\i_Op_RS1~input_o\ & (\i_regDataA[31]~input_o\)))) # (!\i_Op_LR1~input_o\ & (((\i_regDataA[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[31]~input_o\,
	datab => \i_Op_LR1~input_o\,
	datac => \i_regDataA[1]~input_o\,
	datad => \i_Op_RS1~input_o\,
	combout => \w_ALUResult[0]~1_combout\);

-- Location: IOIBUF_X20_Y0_N15
\i_Op_LS1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_LS1,
	o => \i_Op_LS1~input_o\);

-- Location: LCCOMB_X67_Y2_N0
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\i_regDataB[0]~input_o\ & (\i_regDataA[0]~input_o\ $ (VCC))) # (!\i_regDataB[0]~input_o\ & (\i_regDataA[0]~input_o\ & VCC))
-- \Add0~1\ = CARRY((\i_regDataB[0]~input_o\ & \i_regDataA[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[0]~input_o\,
	datab => \i_regDataA[0]~input_o\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X66_Y4_N20
\w_ALUResult[0]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[0]~2_combout\ = (\i_Op_XRS~input_o\ & (((\Add0~0_combout\)))) # (!\i_Op_XRS~input_o\ & (\w_ALUResult[0]~1_combout\ & (!\i_Op_LS1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \w_ALUResult[0]~1_combout\,
	datac => \i_Op_LS1~input_o\,
	datad => \Add0~0_combout\,
	combout => \w_ALUResult[0]~2_combout\);

-- Location: LCCOMB_X66_Y4_N10
\w_ALUResult[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[0]~3_combout\ = (\i_Op_ARS~input_o\ & (((\w_ALUResult[0]~0_combout\)))) # (!\i_Op_ARS~input_o\ & ((\i_Op_ORS~input_o\ & (\w_ALUResult[0]~0_combout\)) # (!\i_Op_ORS~input_o\ & ((\w_ALUResult[0]~2_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datab => \i_Op_ORS~input_o\,
	datac => \w_ALUResult[0]~0_combout\,
	datad => \w_ALUResult[0]~2_combout\,
	combout => \w_ALUResult[0]~3_combout\);

-- Location: IOIBUF_X67_Y0_N8
\i_Op_ADS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_ADS,
	o => \i_Op_ADS~input_o\);

-- Location: LCCOMB_X66_Y4_N2
\w_ALUResult[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[0]~4_combout\ = (\i_Op_ADS~input_o\ & ((\Add0~0_combout\))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[0]~3_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[0]~3_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \Add0~0_combout\,
	combout => \w_ALUResult[0]~4_combout\);

-- Location: LCCOMB_X66_Y4_N28
\w_ALUResult[31]~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~6_combout\ = (!\i_Op_XRS~input_o\ & (!\i_Op_LR1~input_o\ & (!\i_Op_LS1~input_o\ & !\i_Op_RS1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_Op_LR1~input_o\,
	datac => \i_Op_LS1~input_o\,
	datad => \i_Op_RS1~input_o\,
	combout => \w_ALUResult[31]~6_combout\);

-- Location: IOIBUF_X52_Y0_N1
\i_Op_RA1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_RA1,
	o => \i_Op_RA1~input_o\);

-- Location: IOIBUF_X52_Y0_N22
\i_Op_RR1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_RR1,
	o => \i_Op_RR1~input_o\);

-- Location: LCCOMB_X59_Y1_N18
\w_ALUResult[31]~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~5_combout\ = (\i_Op_ORS~input_o\) # ((\i_Op_RR1~input_o\) # ((\i_Op_ARS~input_o\) # (\i_Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ORS~input_o\,
	datab => \i_Op_RR1~input_o\,
	datac => \i_Op_ARS~input_o\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[31]~5_combout\);

-- Location: LCCOMB_X59_Y1_N24
\w_ALUResult[31]~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~7_combout\ = ((\i_Op_RA1~input_o\) # (\w_ALUResult[31]~5_combout\)) # (!\w_ALUResult[31]~6_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[31]~6_combout\,
	datac => \i_Op_RA1~input_o\,
	datad => \w_ALUResult[31]~5_combout\,
	combout => \w_ALUResult[31]~7_combout\);

-- Location: CLKCTRL_G17
\w_ALUResult[31]~7clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \w_ALUResult[31]~7clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \w_ALUResult[31]~7clkctrl_outclk\);

-- Location: LCCOMB_X66_Y4_N24
\w_ALUResult[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(0) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[0]~4_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[0]~4_combout\,
	datac => \w_ALUResult[31]~7clkctrl_outclk\,
	datad => w_ALUResult(0),
	combout => w_ALUResult(0));

-- Location: IOIBUF_X89_Y0_N8
\i_regDataB[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(1),
	o => \i_regDataB[1]~input_o\);

-- Location: LCCOMB_X69_Y3_N12
\w_ALUResult[1]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~11_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[1]~input_o\) # (\i_regDataA[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ORS~input_o\,
	datab => \i_regDataB[1]~input_o\,
	datad => \i_regDataA[1]~input_o\,
	combout => \w_ALUResult[1]~11_combout\);

-- Location: LCCOMB_X67_Y3_N18
\w_ALUResult[1]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~10_combout\ = (!\i_Op_ARS~input_o\ & !\i_Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010100000101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datac => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[1]~10_combout\);

-- Location: LCCOMB_X69_Y3_N10
\w_ALUResult[1]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~12_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[1]~input_o\ $ (\i_regDataA[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataB[1]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[1]~input_o\,
	combout => \w_ALUResult[1]~12_combout\);

-- Location: LCCOMB_X66_Y4_N30
\w_ALUResult[1]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~13_combout\ = (\i_Op_LS1~input_o\) # ((\i_Op_LR1~input_o\ & !\i_Op_RS1~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_LR1~input_o\,
	datac => \i_Op_LS1~input_o\,
	datad => \i_Op_RS1~input_o\,
	combout => \w_ALUResult[1]~13_combout\);

-- Location: IOIBUF_X87_Y0_N15
\i_regDataA[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(2),
	o => \i_regDataA[2]~input_o\);

-- Location: LCCOMB_X70_Y3_N28
\w_ALUResult[1]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~14_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[0]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~13_combout\,
	datab => \i_regDataA[2]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[0]~input_o\,
	combout => \w_ALUResult[1]~14_combout\);

-- Location: LCCOMB_X69_Y3_N14
\w_ALUResult[1]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~15_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[1]~12_combout\) # (\w_ALUResult[1]~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~12_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[1]~14_combout\,
	combout => \w_ALUResult[1]~15_combout\);

-- Location: LCCOMB_X69_Y3_N24
\w_ALUResult[1]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~8_combout\ = (\i_regDataB[1]~input_o\ & \i_Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataB[1]~input_o\,
	datac => \i_Op_ARS~input_o\,
	combout => \w_ALUResult[1]~8_combout\);

-- Location: LCCOMB_X67_Y2_N2
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\i_regDataB[1]~input_o\ & ((\i_regDataA[1]~input_o\ & (\Add0~1\ & VCC)) # (!\i_regDataA[1]~input_o\ & (!\Add0~1\)))) # (!\i_regDataB[1]~input_o\ & ((\i_regDataA[1]~input_o\ & (!\Add0~1\)) # (!\i_regDataA[1]~input_o\ & ((\Add0~1\) # 
-- (GND)))))
-- \Add0~3\ = CARRY((\i_regDataB[1]~input_o\ & (!\i_regDataA[1]~input_o\ & !\Add0~1\)) # (!\i_regDataB[1]~input_o\ & ((!\Add0~1\) # (!\i_regDataA[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[1]~input_o\,
	datab => \i_regDataA[1]~input_o\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X69_Y3_N6
\w_ALUResult[1]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~9_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~2_combout\)))) # (!\i_Op_ADS~input_o\ & (\i_regDataA[1]~input_o\ & (\w_ALUResult[1]~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[1]~input_o\,
	datab => \w_ALUResult[1]~8_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \Add0~2_combout\,
	combout => \w_ALUResult[1]~9_combout\);

-- Location: LCCOMB_X69_Y3_N26
\w_ALUResult[1]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[1]~16_combout\ = (\w_ALUResult[1]~9_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[1]~11_combout\) # (\w_ALUResult[1]~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~11_combout\,
	datab => \w_ALUResult[1]~10_combout\,
	datac => \w_ALUResult[1]~15_combout\,
	datad => \w_ALUResult[1]~9_combout\,
	combout => \w_ALUResult[1]~16_combout\);

-- Location: LCCOMB_X69_Y3_N22
\w_ALUResult[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(1) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[1]~16_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~16_combout\,
	datac => w_ALUResult(1),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(1));

-- Location: IOIBUF_X29_Y0_N15
\i_regDataB[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(2),
	o => \i_regDataB[2]~input_o\);

-- Location: LCCOMB_X67_Y3_N10
\w_ALUResult[2]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[2]~19_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[2]~input_o\) # (\i_regDataA[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataB[2]~input_o\,
	datad => \i_regDataA[2]~input_o\,
	combout => \w_ALUResult[2]~19_combout\);

-- Location: IOIBUF_X45_Y0_N15
\i_regDataA[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(3),
	o => \i_regDataA[3]~input_o\);

-- Location: LCCOMB_X67_Y3_N12
\w_ALUResult[2]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[2]~21_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & (\i_regDataA[1]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[1]~input_o\,
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataA[3]~input_o\,
	datad => \w_ALUResult[1]~13_combout\,
	combout => \w_ALUResult[2]~21_combout\);

-- Location: LCCOMB_X67_Y3_N14
\w_ALUResult[2]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[2]~20_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[2]~input_o\ $ (\i_regDataA[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataB[2]~input_o\,
	datad => \i_regDataA[2]~input_o\,
	combout => \w_ALUResult[2]~20_combout\);

-- Location: LCCOMB_X67_Y3_N20
\w_ALUResult[2]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[2]~22_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[2]~21_combout\) # (\w_ALUResult[2]~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[2]~21_combout\,
	datac => \w_ALUResult[2]~20_combout\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[2]~22_combout\);

-- Location: LCCOMB_X67_Y3_N8
\w_ALUResult[2]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[2]~17_combout\ = (\i_Op_ARS~input_o\ & \i_regDataB[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datac => \i_regDataB[2]~input_o\,
	combout => \w_ALUResult[2]~17_combout\);

-- Location: LCCOMB_X67_Y2_N4
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((\i_regDataA[2]~input_o\ $ (\i_regDataB[2]~input_o\ $ (!\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((\i_regDataA[2]~input_o\ & ((\i_regDataB[2]~input_o\) # (!\Add0~3\))) # (!\i_regDataA[2]~input_o\ & (\i_regDataB[2]~input_o\ & !\Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[2]~input_o\,
	datab => \i_regDataB[2]~input_o\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X67_Y3_N22
\w_ALUResult[2]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[2]~18_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~4_combout\)))) # (!\i_Op_ADS~input_o\ & (\i_regDataA[2]~input_o\ & (\w_ALUResult[2]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[2]~input_o\,
	datab => \w_ALUResult[2]~17_combout\,
	datac => \Add0~4_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[2]~18_combout\);

-- Location: LCCOMB_X67_Y3_N30
\w_ALUResult[2]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[2]~23_combout\ = (\w_ALUResult[2]~18_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[2]~19_combout\) # (\w_ALUResult[2]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[2]~19_combout\,
	datab => \w_ALUResult[2]~22_combout\,
	datac => \w_ALUResult[2]~18_combout\,
	datad => \w_ALUResult[1]~10_combout\,
	combout => \w_ALUResult[2]~23_combout\);

-- Location: LCCOMB_X67_Y3_N6
\w_ALUResult[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(2) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[2]~23_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(2),
	datac => \w_ALUResult[2]~23_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(2));

-- Location: IOIBUF_X67_Y0_N1
\i_regDataB[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(3),
	o => \i_regDataB[3]~input_o\);

-- Location: LCCOMB_X67_Y3_N0
\w_ALUResult[3]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[3]~26_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataA[3]~input_o\) # (\i_regDataB[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataA[3]~input_o\,
	datad => \i_regDataB[3]~input_o\,
	combout => \w_ALUResult[3]~26_combout\);

-- Location: LCCOMB_X67_Y3_N16
\w_ALUResult[3]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[3]~27_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataA[3]~input_o\ $ (\i_regDataB[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[3]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataB[3]~input_o\,
	combout => \w_ALUResult[3]~27_combout\);

-- Location: IOIBUF_X87_Y0_N22
\i_regDataA[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(4),
	o => \i_regDataA[4]~input_o\);

-- Location: LCCOMB_X70_Y3_N18
\w_ALUResult[3]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[3]~28_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & (\i_regDataA[2]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[4]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_regDataA[2]~input_o\,
	datac => \i_regDataA[4]~input_o\,
	datad => \w_ALUResult[1]~13_combout\,
	combout => \w_ALUResult[3]~28_combout\);

-- Location: LCCOMB_X68_Y3_N10
\w_ALUResult[3]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[3]~29_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[3]~27_combout\) # (\w_ALUResult[3]~28_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \w_ALUResult[3]~27_combout\,
	datad => \w_ALUResult[3]~28_combout\,
	combout => \w_ALUResult[3]~29_combout\);

-- Location: LCCOMB_X67_Y3_N4
\w_ALUResult[3]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[3]~24_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[3]~input_o\ & (\i_regDataA[3]~input_o\ & !\i_Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datab => \i_regDataB[3]~input_o\,
	datac => \i_regDataA[3]~input_o\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[3]~24_combout\);

-- Location: LCCOMB_X67_Y2_N6
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\i_regDataA[3]~input_o\ & ((\i_regDataB[3]~input_o\ & (\Add0~5\ & VCC)) # (!\i_regDataB[3]~input_o\ & (!\Add0~5\)))) # (!\i_regDataA[3]~input_o\ & ((\i_regDataB[3]~input_o\ & (!\Add0~5\)) # (!\i_regDataB[3]~input_o\ & ((\Add0~5\) # 
-- (GND)))))
-- \Add0~7\ = CARRY((\i_regDataA[3]~input_o\ & (!\i_regDataB[3]~input_o\ & !\Add0~5\)) # (!\i_regDataA[3]~input_o\ & ((!\Add0~5\) # (!\i_regDataB[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[3]~input_o\,
	datab => \i_regDataB[3]~input_o\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X67_Y3_N2
\w_ALUResult[3]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[3]~25_combout\ = (\w_ALUResult[3]~24_combout\) # ((\i_Op_ADS~input_o\ & \Add0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[3]~24_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \Add0~6_combout\,
	combout => \w_ALUResult[3]~25_combout\);

-- Location: LCCOMB_X67_Y3_N28
\w_ALUResult[3]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[3]~30_combout\ = (\w_ALUResult[3]~25_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[3]~26_combout\) # (\w_ALUResult[3]~29_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~10_combout\,
	datab => \w_ALUResult[3]~26_combout\,
	datac => \w_ALUResult[3]~29_combout\,
	datad => \w_ALUResult[3]~25_combout\,
	combout => \w_ALUResult[3]~30_combout\);

-- Location: LCCOMB_X67_Y3_N26
\w_ALUResult[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(3) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[3]~30_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(3),
	datac => \w_ALUResult[3]~30_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(3));

-- Location: IOIBUF_X85_Y0_N22
\i_regDataA[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(5),
	o => \i_regDataA[5]~input_o\);

-- Location: LCCOMB_X68_Y3_N20
\w_ALUResult[4]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[4]~35_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & (\i_regDataA[3]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[5]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000100100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~13_combout\,
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataA[3]~input_o\,
	datad => \i_regDataA[5]~input_o\,
	combout => \w_ALUResult[4]~35_combout\);

-- Location: IOIBUF_X42_Y0_N22
\i_regDataB[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(4),
	o => \i_regDataB[4]~input_o\);

-- Location: LCCOMB_X68_Y3_N4
\w_ALUResult[4]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[4]~34_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[4]~input_o\ $ (\i_regDataA[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[4]~input_o\,
	datab => \i_Op_XRS~input_o\,
	datad => \i_regDataA[4]~input_o\,
	combout => \w_ALUResult[4]~34_combout\);

-- Location: LCCOMB_X68_Y3_N12
\w_ALUResult[4]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[4]~36_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[4]~35_combout\) # (\w_ALUResult[4]~34_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[4]~35_combout\,
	datac => \w_ALUResult[4]~34_combout\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[4]~36_combout\);

-- Location: LCCOMB_X68_Y3_N18
\w_ALUResult[4]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[4]~33_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[4]~input_o\) # (\i_regDataA[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[4]~input_o\,
	datab => \i_Op_ORS~input_o\,
	datad => \i_regDataA[4]~input_o\,
	combout => \w_ALUResult[4]~33_combout\);

-- Location: LCCOMB_X68_Y3_N24
\w_ALUResult[4]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[4]~31_combout\ = (\i_Op_ARS~input_o\ & \i_regDataB[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ARS~input_o\,
	datad => \i_regDataB[4]~input_o\,
	combout => \w_ALUResult[4]~31_combout\);

-- Location: LCCOMB_X67_Y2_N8
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = ((\i_regDataA[4]~input_o\ $ (\i_regDataB[4]~input_o\ $ (!\Add0~7\)))) # (GND)
-- \Add0~9\ = CARRY((\i_regDataA[4]~input_o\ & ((\i_regDataB[4]~input_o\) # (!\Add0~7\))) # (!\i_regDataA[4]~input_o\ & (\i_regDataB[4]~input_o\ & !\Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[4]~input_o\,
	datab => \i_regDataB[4]~input_o\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X68_Y3_N26
\w_ALUResult[4]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[4]~32_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~8_combout\)))) # (!\i_Op_ADS~input_o\ & (\i_regDataA[4]~input_o\ & (\w_ALUResult[4]~31_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[4]~input_o\,
	datab => \w_ALUResult[4]~31_combout\,
	datac => \Add0~8_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[4]~32_combout\);

-- Location: LCCOMB_X68_Y3_N30
\w_ALUResult[4]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[4]~37_combout\ = (\w_ALUResult[4]~32_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[4]~36_combout\) # (\w_ALUResult[4]~33_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[4]~36_combout\,
	datab => \w_ALUResult[4]~33_combout\,
	datac => \w_ALUResult[4]~32_combout\,
	datad => \w_ALUResult[1]~10_combout\,
	combout => \w_ALUResult[4]~37_combout\);

-- Location: LCCOMB_X68_Y3_N14
\w_ALUResult[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(4) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[4]~37_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[4]~37_combout\,
	datac => w_ALUResult(4),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(4));

-- Location: IOIBUF_X42_Y0_N15
\i_regDataB[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(5),
	o => \i_regDataB[5]~input_o\);

-- Location: LCCOMB_X68_Y3_N28
\w_ALUResult[5]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[5]~40_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[5]~input_o\) # (\i_regDataA[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataB[5]~input_o\,
	datad => \i_regDataA[5]~input_o\,
	combout => \w_ALUResult[5]~40_combout\);

-- Location: LCCOMB_X68_Y3_N8
\w_ALUResult[5]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[5]~38_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataA[5]~input_o\ & (\i_regDataB[5]~input_o\ & !\i_Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datab => \i_regDataA[5]~input_o\,
	datac => \i_regDataB[5]~input_o\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[5]~38_combout\);

-- Location: LCCOMB_X67_Y2_N10
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\i_regDataB[5]~input_o\ & ((\i_regDataA[5]~input_o\ & (\Add0~9\ & VCC)) # (!\i_regDataA[5]~input_o\ & (!\Add0~9\)))) # (!\i_regDataB[5]~input_o\ & ((\i_regDataA[5]~input_o\ & (!\Add0~9\)) # (!\i_regDataA[5]~input_o\ & ((\Add0~9\) # 
-- (GND)))))
-- \Add0~11\ = CARRY((\i_regDataB[5]~input_o\ & (!\i_regDataA[5]~input_o\ & !\Add0~9\)) # (!\i_regDataB[5]~input_o\ & ((!\Add0~9\) # (!\i_regDataA[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[5]~input_o\,
	datab => \i_regDataA[5]~input_o\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X68_Y3_N2
\w_ALUResult[5]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[5]~39_combout\ = (\w_ALUResult[5]~38_combout\) # ((\i_Op_ADS~input_o\ & \Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[5]~38_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \Add0~10_combout\,
	combout => \w_ALUResult[5]~39_combout\);

-- Location: LCCOMB_X68_Y3_N16
\w_ALUResult[5]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[5]~41_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[5]~input_o\ $ (\i_regDataA[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataB[5]~input_o\,
	datad => \i_regDataA[5]~input_o\,
	combout => \w_ALUResult[5]~41_combout\);

-- Location: IOIBUF_X85_Y0_N8
\i_regDataA[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(6),
	o => \i_regDataA[6]~input_o\);

-- Location: LCCOMB_X70_Y3_N4
\w_ALUResult[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[5]~42_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[4]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_regDataA[6]~input_o\,
	datac => \i_regDataA[4]~input_o\,
	datad => \w_ALUResult[1]~13_combout\,
	combout => \w_ALUResult[5]~42_combout\);

-- Location: LCCOMB_X69_Y3_N4
\w_ALUResult[5]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[5]~43_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[5]~41_combout\) # (\w_ALUResult[5]~42_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[5]~41_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[5]~42_combout\,
	combout => \w_ALUResult[5]~43_combout\);

-- Location: LCCOMB_X68_Y3_N22
\w_ALUResult[5]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[5]~44_combout\ = (\w_ALUResult[5]~39_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[5]~40_combout\) # (\w_ALUResult[5]~43_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~10_combout\,
	datab => \w_ALUResult[5]~40_combout\,
	datac => \w_ALUResult[5]~39_combout\,
	datad => \w_ALUResult[5]~43_combout\,
	combout => \w_ALUResult[5]~44_combout\);

-- Location: LCCOMB_X68_Y3_N0
\w_ALUResult[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(5) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[5]~44_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(5),
	datac => \w_ALUResult[5]~44_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(5));

-- Location: IOIBUF_X67_Y0_N15
\i_regDataA[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(7),
	o => \i_regDataA[7]~input_o\);

-- Location: LCCOMB_X67_Y4_N2
\w_ALUResult[6]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[6]~49_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[5]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~13_combout\,
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataA[7]~input_o\,
	datad => \i_regDataA[5]~input_o\,
	combout => \w_ALUResult[6]~49_combout\);

-- Location: IOIBUF_X109_Y0_N1
\i_regDataB[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(6),
	o => \i_regDataB[6]~input_o\);

-- Location: LCCOMB_X67_Y4_N18
\w_ALUResult[6]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[6]~48_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataA[6]~input_o\ $ (\i_regDataB[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[6]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataB[6]~input_o\,
	combout => \w_ALUResult[6]~48_combout\);

-- Location: LCCOMB_X67_Y4_N12
\w_ALUResult[6]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[6]~50_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[6]~49_combout\) # (\w_ALUResult[6]~48_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[6]~49_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[6]~48_combout\,
	combout => \w_ALUResult[6]~50_combout\);

-- Location: LCCOMB_X67_Y4_N0
\w_ALUResult[6]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[6]~47_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataA[6]~input_o\) # (\i_regDataB[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[6]~input_o\,
	datac => \i_Op_ORS~input_o\,
	datad => \i_regDataB[6]~input_o\,
	combout => \w_ALUResult[6]~47_combout\);

-- Location: LCCOMB_X67_Y4_N16
\w_ALUResult[6]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[6]~45_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataA[6]~input_o\ & (!\i_Op_ADS~input_o\ & \i_regDataB[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datab => \i_regDataA[6]~input_o\,
	datac => \i_Op_ADS~input_o\,
	datad => \i_regDataB[6]~input_o\,
	combout => \w_ALUResult[6]~45_combout\);

-- Location: LCCOMB_X67_Y2_N12
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = ((\i_regDataA[6]~input_o\ $ (\i_regDataB[6]~input_o\ $ (!\Add0~11\)))) # (GND)
-- \Add0~13\ = CARRY((\i_regDataA[6]~input_o\ & ((\i_regDataB[6]~input_o\) # (!\Add0~11\))) # (!\i_regDataA[6]~input_o\ & (\i_regDataB[6]~input_o\ & !\Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[6]~input_o\,
	datab => \i_regDataB[6]~input_o\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X67_Y4_N24
\w_ALUResult[6]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[6]~46_combout\ = (\w_ALUResult[6]~45_combout\) # ((\i_Op_ADS~input_o\ & \Add0~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[6]~45_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \Add0~12_combout\,
	combout => \w_ALUResult[6]~46_combout\);

-- Location: LCCOMB_X67_Y4_N30
\w_ALUResult[6]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[6]~51_combout\ = (\w_ALUResult[6]~46_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[6]~50_combout\) # (\w_ALUResult[6]~47_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[6]~50_combout\,
	datab => \w_ALUResult[6]~47_combout\,
	datac => \w_ALUResult[1]~10_combout\,
	datad => \w_ALUResult[6]~46_combout\,
	combout => \w_ALUResult[6]~51_combout\);

-- Location: LCCOMB_X67_Y4_N14
\w_ALUResult[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(6) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[6]~51_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(6),
	datac => \w_ALUResult[6]~51_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(6));

-- Location: IOIBUF_X23_Y0_N22
\i_regDataB[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(7),
	o => \i_regDataB[7]~input_o\);

-- Location: LCCOMB_X67_Y4_N10
\w_ALUResult[7]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[7]~54_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[7]~input_o\) # (\i_regDataA[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataB[7]~input_o\,
	datac => \i_regDataA[7]~input_o\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[7]~54_combout\);

-- Location: LCCOMB_X67_Y2_N14
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\i_regDataB[7]~input_o\ & ((\i_regDataA[7]~input_o\ & (\Add0~13\ & VCC)) # (!\i_regDataA[7]~input_o\ & (!\Add0~13\)))) # (!\i_regDataB[7]~input_o\ & ((\i_regDataA[7]~input_o\ & (!\Add0~13\)) # (!\i_regDataA[7]~input_o\ & ((\Add0~13\) 
-- # (GND)))))
-- \Add0~15\ = CARRY((\i_regDataB[7]~input_o\ & (!\i_regDataA[7]~input_o\ & !\Add0~13\)) # (!\i_regDataB[7]~input_o\ & ((!\Add0~13\) # (!\i_regDataA[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[7]~input_o\,
	datab => \i_regDataA[7]~input_o\,
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X67_Y4_N6
\w_ALUResult[7]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[7]~52_combout\ = (\i_regDataB[7]~input_o\ & \i_Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \i_regDataB[7]~input_o\,
	datad => \i_Op_ARS~input_o\,
	combout => \w_ALUResult[7]~52_combout\);

-- Location: LCCOMB_X68_Y4_N2
\w_ALUResult[7]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[7]~53_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~14_combout\)))) # (!\i_Op_ADS~input_o\ & (\i_regDataA[7]~input_o\ & ((\w_ALUResult[7]~52_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[7]~input_o\,
	datab => \Add0~14_combout\,
	datac => \w_ALUResult[7]~52_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[7]~53_combout\);

-- Location: IOIBUF_X65_Y0_N15
\i_regDataA[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(8),
	o => \i_regDataA[8]~input_o\);

-- Location: LCCOMB_X67_Y4_N4
\w_ALUResult[7]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[7]~56_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[6]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[8]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[8]~input_o\,
	datab => \w_ALUResult[1]~13_combout\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[6]~input_o\,
	combout => \w_ALUResult[7]~56_combout\);

-- Location: LCCOMB_X67_Y4_N28
\w_ALUResult[7]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[7]~55_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[7]~input_o\ $ (\i_regDataA[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataB[7]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[7]~input_o\,
	combout => \w_ALUResult[7]~55_combout\);

-- Location: LCCOMB_X67_Y4_N20
\w_ALUResult[7]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[7]~57_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[7]~56_combout\) # (\w_ALUResult[7]~55_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[7]~56_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[7]~55_combout\,
	combout => \w_ALUResult[7]~57_combout\);

-- Location: LCCOMB_X68_Y4_N30
\w_ALUResult[7]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[7]~58_combout\ = (\w_ALUResult[7]~53_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[7]~54_combout\) # (\w_ALUResult[7]~57_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[7]~54_combout\,
	datab => \w_ALUResult[1]~10_combout\,
	datac => \w_ALUResult[7]~53_combout\,
	datad => \w_ALUResult[7]~57_combout\,
	combout => \w_ALUResult[7]~58_combout\);

-- Location: LCCOMB_X68_Y4_N4
\w_ALUResult[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(7) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[7]~58_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[7]~58_combout\,
	datac => w_ALUResult(7),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(7));

-- Location: IOIBUF_X27_Y0_N22
\i_regDataB[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(8),
	o => \i_regDataB[8]~input_o\);

-- Location: LCCOMB_X66_Y3_N6
\w_ALUResult[8]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[8]~61_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[8]~input_o\) # (\i_regDataA[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataB[8]~input_o\,
	datad => \i_regDataA[8]~input_o\,
	combout => \w_ALUResult[8]~61_combout\);

-- Location: IOIBUF_X65_Y0_N8
\i_regDataA[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(9),
	o => \i_regDataA[9]~input_o\);

-- Location: LCCOMB_X67_Y4_N22
\w_ALUResult[8]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[8]~63_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[7]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[9]~input_o\,
	datab => \i_regDataA[7]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \w_ALUResult[1]~13_combout\,
	combout => \w_ALUResult[8]~63_combout\);

-- Location: LCCOMB_X66_Y3_N12
\w_ALUResult[8]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[8]~62_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[8]~input_o\ $ (\i_regDataA[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datac => \i_regDataB[8]~input_o\,
	datad => \i_regDataA[8]~input_o\,
	combout => \w_ALUResult[8]~62_combout\);

-- Location: LCCOMB_X66_Y3_N0
\w_ALUResult[8]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[8]~64_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[8]~63_combout\) # (\w_ALUResult[8]~62_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \w_ALUResult[8]~63_combout\,
	datad => \w_ALUResult[8]~62_combout\,
	combout => \w_ALUResult[8]~64_combout\);

-- Location: LCCOMB_X67_Y2_N16
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = ((\i_regDataA[8]~input_o\ $ (\i_regDataB[8]~input_o\ $ (!\Add0~15\)))) # (GND)
-- \Add0~17\ = CARRY((\i_regDataA[8]~input_o\ & ((\i_regDataB[8]~input_o\) # (!\Add0~15\))) # (!\i_regDataA[8]~input_o\ & (\i_regDataB[8]~input_o\ & !\Add0~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[8]~input_o\,
	datab => \i_regDataB[8]~input_o\,
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X66_Y3_N4
\w_ALUResult[8]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[8]~59_combout\ = (\i_Op_ARS~input_o\ & \i_regDataB[8]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datac => \i_regDataB[8]~input_o\,
	combout => \w_ALUResult[8]~59_combout\);

-- Location: LCCOMB_X66_Y3_N30
\w_ALUResult[8]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[8]~60_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~16_combout\)))) # (!\i_Op_ADS~input_o\ & (\i_regDataA[8]~input_o\ & ((\w_ALUResult[8]~59_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[8]~input_o\,
	datab => \Add0~16_combout\,
	datac => \w_ALUResult[8]~59_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[8]~60_combout\);

-- Location: LCCOMB_X66_Y3_N28
\w_ALUResult[8]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[8]~65_combout\ = (\w_ALUResult[8]~60_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[8]~61_combout\) # (\w_ALUResult[8]~64_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[8]~61_combout\,
	datab => \w_ALUResult[8]~64_combout\,
	datac => \w_ALUResult[1]~10_combout\,
	datad => \w_ALUResult[8]~60_combout\,
	combout => \w_ALUResult[8]~65_combout\);

-- Location: LCCOMB_X66_Y3_N8
\w_ALUResult[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(8) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[8]~65_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(8))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[8]~65_combout\,
	datac => w_ALUResult(8),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(8));

-- Location: IOIBUF_X29_Y0_N22
\i_regDataB[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(9),
	o => \i_regDataB[9]~input_o\);

-- Location: LCCOMB_X66_Y3_N26
\w_ALUResult[9]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[9]~68_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[9]~input_o\) # (\i_regDataA[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataB[9]~input_o\,
	datad => \i_regDataA[9]~input_o\,
	combout => \w_ALUResult[9]~68_combout\);

-- Location: IOIBUF_X65_Y0_N22
\i_regDataA[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(10),
	o => \i_regDataA[10]~input_o\);

-- Location: LCCOMB_X65_Y3_N14
\w_ALUResult[9]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[9]~70_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[8]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[10]~input_o\,
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataA[8]~input_o\,
	datad => \w_ALUResult[1]~13_combout\,
	combout => \w_ALUResult[9]~70_combout\);

-- Location: LCCOMB_X66_Y3_N16
\w_ALUResult[9]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[9]~69_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[9]~input_o\ $ (\i_regDataA[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datac => \i_regDataB[9]~input_o\,
	datad => \i_regDataA[9]~input_o\,
	combout => \w_ALUResult[9]~69_combout\);

-- Location: LCCOMB_X66_Y3_N20
\w_ALUResult[9]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[9]~71_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[9]~70_combout\) # (\w_ALUResult[9]~69_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[9]~70_combout\,
	datab => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[9]~69_combout\,
	combout => \w_ALUResult[9]~71_combout\);

-- Location: LCCOMB_X66_Y3_N10
\w_ALUResult[9]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[9]~66_combout\ = (\i_Op_ARS~input_o\ & \i_regDataB[9]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datac => \i_regDataB[9]~input_o\,
	combout => \w_ALUResult[9]~66_combout\);

-- Location: LCCOMB_X67_Y2_N18
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (\i_regDataA[9]~input_o\ & ((\i_regDataB[9]~input_o\ & (\Add0~17\ & VCC)) # (!\i_regDataB[9]~input_o\ & (!\Add0~17\)))) # (!\i_regDataA[9]~input_o\ & ((\i_regDataB[9]~input_o\ & (!\Add0~17\)) # (!\i_regDataB[9]~input_o\ & ((\Add0~17\) 
-- # (GND)))))
-- \Add0~19\ = CARRY((\i_regDataA[9]~input_o\ & (!\i_regDataB[9]~input_o\ & !\Add0~17\)) # (!\i_regDataA[9]~input_o\ & ((!\Add0~17\) # (!\i_regDataB[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[9]~input_o\,
	datab => \i_regDataB[9]~input_o\,
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X66_Y3_N22
\w_ALUResult[9]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[9]~67_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~18_combout\)))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[9]~66_combout\ & (\i_regDataA[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[9]~66_combout\,
	datab => \i_regDataA[9]~input_o\,
	datac => \Add0~18_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[9]~67_combout\);

-- Location: LCCOMB_X66_Y3_N2
\w_ALUResult[9]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[9]~72_combout\ = (\w_ALUResult[9]~67_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[9]~68_combout\) # (\w_ALUResult[9]~71_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[9]~68_combout\,
	datab => \w_ALUResult[9]~71_combout\,
	datac => \w_ALUResult[1]~10_combout\,
	datad => \w_ALUResult[9]~67_combout\,
	combout => \w_ALUResult[9]~72_combout\);

-- Location: LCCOMB_X66_Y3_N18
\w_ALUResult[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(9) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[9]~72_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(9),
	datac => \w_ALUResult[9]~72_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(9));

-- Location: IOIBUF_X38_Y0_N8
\i_regDataB[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(10),
	o => \i_regDataB[10]~input_o\);

-- Location: LCCOMB_X66_Y2_N2
\w_ALUResult[10]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[10]~75_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[10]~input_o\) # (\i_regDataA[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[10]~input_o\,
	datab => \i_Op_ORS~input_o\,
	datad => \i_regDataA[10]~input_o\,
	combout => \w_ALUResult[10]~75_combout\);

-- Location: LCCOMB_X66_Y2_N20
\w_ALUResult[10]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[10]~73_combout\ = (\i_regDataB[10]~input_o\ & \i_Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[10]~input_o\,
	datac => \i_Op_ARS~input_o\,
	combout => \w_ALUResult[10]~73_combout\);

-- Location: LCCOMB_X67_Y2_N20
\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = ((\i_regDataB[10]~input_o\ $ (\i_regDataA[10]~input_o\ $ (!\Add0~19\)))) # (GND)
-- \Add0~21\ = CARRY((\i_regDataB[10]~input_o\ & ((\i_regDataA[10]~input_o\) # (!\Add0~19\))) # (!\i_regDataB[10]~input_o\ & (\i_regDataA[10]~input_o\ & !\Add0~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[10]~input_o\,
	datab => \i_regDataA[10]~input_o\,
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X66_Y2_N6
\w_ALUResult[10]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[10]~74_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~20_combout\)))) # (!\i_Op_ADS~input_o\ & (\i_regDataA[10]~input_o\ & (\w_ALUResult[10]~73_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[10]~input_o\,
	datab => \w_ALUResult[10]~73_combout\,
	datac => \Add0~20_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[10]~74_combout\);

-- Location: IOIBUF_X91_Y0_N22
\i_regDataA[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(11),
	o => \i_regDataA[11]~input_o\);

-- Location: LCCOMB_X66_Y2_N12
\w_ALUResult[10]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[10]~77_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & (\i_regDataA[9]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[11]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~13_combout\,
	datab => \i_regDataA[9]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[11]~input_o\,
	combout => \w_ALUResult[10]~77_combout\);

-- Location: LCCOMB_X66_Y2_N24
\w_ALUResult[10]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[10]~76_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[10]~input_o\ $ (\i_regDataA[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[10]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[10]~input_o\,
	combout => \w_ALUResult[10]~76_combout\);

-- Location: LCCOMB_X66_Y2_N0
\w_ALUResult[10]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[10]~78_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[10]~77_combout\) # (\w_ALUResult[10]~76_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[10]~77_combout\,
	datab => \w_ALUResult[10]~76_combout\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[10]~78_combout\);

-- Location: LCCOMB_X66_Y2_N22
\w_ALUResult[10]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[10]~79_combout\ = (\w_ALUResult[10]~74_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[10]~75_combout\) # (\w_ALUResult[10]~78_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~10_combout\,
	datab => \w_ALUResult[10]~75_combout\,
	datac => \w_ALUResult[10]~74_combout\,
	datad => \w_ALUResult[10]~78_combout\,
	combout => \w_ALUResult[10]~79_combout\);

-- Location: LCCOMB_X66_Y2_N4
\w_ALUResult[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(10) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[10]~79_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(10))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[10]~79_combout\,
	datac => w_ALUResult(10),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(10));

-- Location: IOIBUF_X52_Y0_N15
\i_regDataB[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(11),
	o => \i_regDataB[11]~input_o\);

-- Location: LCCOMB_X66_Y2_N18
\w_ALUResult[11]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[11]~80_combout\ = (\i_Op_ARS~input_o\ & \i_regDataB[11]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datac => \i_regDataB[11]~input_o\,
	combout => \w_ALUResult[11]~80_combout\);

-- Location: LCCOMB_X67_Y2_N22
\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\i_regDataB[11]~input_o\ & ((\i_regDataA[11]~input_o\ & (\Add0~21\ & VCC)) # (!\i_regDataA[11]~input_o\ & (!\Add0~21\)))) # (!\i_regDataB[11]~input_o\ & ((\i_regDataA[11]~input_o\ & (!\Add0~21\)) # (!\i_regDataA[11]~input_o\ & 
-- ((\Add0~21\) # (GND)))))
-- \Add0~23\ = CARRY((\i_regDataB[11]~input_o\ & (!\i_regDataA[11]~input_o\ & !\Add0~21\)) # (!\i_regDataB[11]~input_o\ & ((!\Add0~21\) # (!\i_regDataA[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[11]~input_o\,
	datab => \i_regDataA[11]~input_o\,
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X66_Y2_N30
\w_ALUResult[11]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[11]~81_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~22_combout\)))) # (!\i_Op_ADS~input_o\ & (\i_regDataA[11]~input_o\ & (\w_ALUResult[11]~80_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[11]~input_o\,
	datab => \w_ALUResult[11]~80_combout\,
	datac => \Add0~22_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[11]~81_combout\);

-- Location: IOIBUF_X56_Y0_N22
\i_regDataA[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(12),
	o => \i_regDataA[12]~input_o\);

-- Location: LCCOMB_X65_Y2_N4
\w_ALUResult[11]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[11]~84_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[10]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[12]~input_o\,
	datab => \i_regDataA[10]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[11]~84_combout\);

-- Location: LCCOMB_X66_Y2_N28
\w_ALUResult[11]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[11]~83_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataB[11]~input_o\ $ (\i_regDataA[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataB[11]~input_o\,
	datad => \i_regDataA[11]~input_o\,
	combout => \w_ALUResult[11]~83_combout\);

-- Location: LCCOMB_X65_Y2_N16
\w_ALUResult[11]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[11]~85_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[11]~84_combout\) # (\w_ALUResult[11]~83_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010101010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ORS~input_o\,
	datac => \w_ALUResult[11]~84_combout\,
	datad => \w_ALUResult[11]~83_combout\,
	combout => \w_ALUResult[11]~85_combout\);

-- Location: LCCOMB_X66_Y2_N16
\w_ALUResult[11]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[11]~82_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[11]~input_o\) # (\i_regDataA[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataB[11]~input_o\,
	datad => \i_regDataA[11]~input_o\,
	combout => \w_ALUResult[11]~82_combout\);

-- Location: LCCOMB_X66_Y2_N8
\w_ALUResult[11]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[11]~86_combout\ = (\w_ALUResult[11]~81_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[11]~85_combout\) # (\w_ALUResult[11]~82_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~10_combout\,
	datab => \w_ALUResult[11]~81_combout\,
	datac => \w_ALUResult[11]~85_combout\,
	datad => \w_ALUResult[11]~82_combout\,
	combout => \w_ALUResult[11]~86_combout\);

-- Location: LCCOMB_X66_Y2_N14
\w_ALUResult[11]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(11) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[11]~86_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[11]~86_combout\,
	datac => w_ALUResult(11),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(11));

-- Location: IOIBUF_X67_Y0_N22
\i_regDataB[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(12),
	o => \i_regDataB[12]~input_o\);

-- Location: LCCOMB_X68_Y2_N12
\w_ALUResult[12]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[12]~89_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataA[12]~input_o\) # (\i_regDataB[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataA[12]~input_o\,
	datad => \i_regDataB[12]~input_o\,
	combout => \w_ALUResult[12]~89_combout\);

-- Location: LCCOMB_X68_Y2_N22
\w_ALUResult[12]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[12]~90_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataA[12]~input_o\ $ (\i_regDataB[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datac => \i_regDataA[12]~input_o\,
	datad => \i_regDataB[12]~input_o\,
	combout => \w_ALUResult[12]~90_combout\);

-- Location: IOIBUF_X79_Y0_N8
\i_regDataA[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(13),
	o => \i_regDataA[13]~input_o\);

-- Location: LCCOMB_X69_Y2_N28
\w_ALUResult[12]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[12]~91_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & (\i_regDataA[11]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[13]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_regDataA[11]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_regDataA[13]~input_o\,
	combout => \w_ALUResult[12]~91_combout\);

-- Location: LCCOMB_X68_Y2_N16
\w_ALUResult[12]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[12]~92_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[12]~90_combout\) # (\w_ALUResult[12]~91_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \w_ALUResult[12]~90_combout\,
	datad => \w_ALUResult[12]~91_combout\,
	combout => \w_ALUResult[12]~92_combout\);

-- Location: LCCOMB_X68_Y2_N6
\w_ALUResult[12]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[12]~87_combout\ = (\i_Op_ARS~input_o\ & \i_regDataB[12]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ARS~input_o\,
	datad => \i_regDataB[12]~input_o\,
	combout => \w_ALUResult[12]~87_combout\);

-- Location: LCCOMB_X67_Y2_N24
\Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = ((\i_regDataA[12]~input_o\ $ (\i_regDataB[12]~input_o\ $ (!\Add0~23\)))) # (GND)
-- \Add0~25\ = CARRY((\i_regDataA[12]~input_o\ & ((\i_regDataB[12]~input_o\) # (!\Add0~23\))) # (!\i_regDataA[12]~input_o\ & (\i_regDataB[12]~input_o\ & !\Add0~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[12]~input_o\,
	datab => \i_regDataB[12]~input_o\,
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X68_Y2_N4
\w_ALUResult[12]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[12]~88_combout\ = (\i_Op_ADS~input_o\ & (((\Add0~24_combout\)))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[12]~87_combout\ & ((\i_regDataA[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[12]~87_combout\,
	datab => \Add0~24_combout\,
	datac => \i_regDataA[12]~input_o\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[12]~88_combout\);

-- Location: LCCOMB_X68_Y2_N30
\w_ALUResult[12]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[12]~93_combout\ = (\w_ALUResult[12]~88_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[12]~89_combout\) # (\w_ALUResult[12]~92_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[12]~89_combout\,
	datab => \w_ALUResult[12]~92_combout\,
	datac => \w_ALUResult[12]~88_combout\,
	datad => \w_ALUResult[1]~10_combout\,
	combout => \w_ALUResult[12]~93_combout\);

-- Location: LCCOMB_X68_Y2_N14
\w_ALUResult[12]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(12) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[12]~93_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[12]~93_combout\,
	datac => w_ALUResult(12),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(12));

-- Location: IOIBUF_X105_Y0_N1
\i_regDataB[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(13),
	o => \i_regDataB[13]~input_o\);

-- Location: LCCOMB_X68_Y2_N10
\w_ALUResult[13]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[13]~97_combout\ = (\i_Op_XRS~input_o\ & (\i_regDataA[13]~input_o\ $ (\i_regDataB[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[13]~input_o\,
	datac => \i_regDataB[13]~input_o\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[13]~97_combout\);

-- Location: IOIBUF_X74_Y0_N8
\i_regDataA[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(14),
	o => \i_regDataA[14]~input_o\);

-- Location: LCCOMB_X68_Y2_N24
\w_ALUResult[13]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[13]~98_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & (\i_regDataA[12]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[14]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[12]~input_o\,
	datab => \w_ALUResult[1]~13_combout\,
	datac => \i_regDataA[14]~input_o\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[13]~98_combout\);

-- Location: LCCOMB_X68_Y2_N26
\w_ALUResult[13]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[13]~99_combout\ = (!\i_Op_ORS~input_o\ & ((\w_ALUResult[13]~97_combout\) # (\w_ALUResult[13]~98_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[13]~97_combout\,
	datab => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[13]~98_combout\,
	combout => \w_ALUResult[13]~99_combout\);

-- Location: LCCOMB_X68_Y2_N0
\w_ALUResult[13]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[13]~96_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataA[13]~input_o\) # (\i_regDataB[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[13]~input_o\,
	datac => \i_regDataB[13]~input_o\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[13]~96_combout\);

-- Location: LCCOMB_X68_Y2_N20
\w_ALUResult[13]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[13]~94_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[13]~input_o\ & (!\i_Op_ADS~input_o\ & \i_regDataA[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datab => \i_regDataB[13]~input_o\,
	datac => \i_Op_ADS~input_o\,
	datad => \i_regDataA[13]~input_o\,
	combout => \w_ALUResult[13]~94_combout\);

-- Location: LCCOMB_X67_Y2_N26
\Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (\i_regDataB[13]~input_o\ & ((\i_regDataA[13]~input_o\ & (\Add0~25\ & VCC)) # (!\i_regDataA[13]~input_o\ & (!\Add0~25\)))) # (!\i_regDataB[13]~input_o\ & ((\i_regDataA[13]~input_o\ & (!\Add0~25\)) # (!\i_regDataA[13]~input_o\ & 
-- ((\Add0~25\) # (GND)))))
-- \Add0~27\ = CARRY((\i_regDataB[13]~input_o\ & (!\i_regDataA[13]~input_o\ & !\Add0~25\)) # (!\i_regDataB[13]~input_o\ & ((!\Add0~25\) # (!\i_regDataA[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[13]~input_o\,
	datab => \i_regDataA[13]~input_o\,
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X68_Y2_N8
\w_ALUResult[13]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[13]~95_combout\ = (\w_ALUResult[13]~94_combout\) # ((\i_Op_ADS~input_o\ & \Add0~26_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[13]~94_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \Add0~26_combout\,
	combout => \w_ALUResult[13]~95_combout\);

-- Location: LCCOMB_X68_Y2_N18
\w_ALUResult[13]~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[13]~100_combout\ = (\w_ALUResult[13]~95_combout\) # ((\w_ALUResult[1]~10_combout\ & ((\w_ALUResult[13]~99_combout\) # (\w_ALUResult[13]~96_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[13]~99_combout\,
	datab => \w_ALUResult[13]~96_combout\,
	datac => \w_ALUResult[13]~95_combout\,
	datad => \w_ALUResult[1]~10_combout\,
	combout => \w_ALUResult[13]~100_combout\);

-- Location: LCCOMB_X68_Y2_N28
\w_ALUResult[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(13) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[13]~100_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(13),
	datac => \w_ALUResult[13]~100_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(13));

-- Location: IOIBUF_X96_Y0_N15
\i_regDataB[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(14),
	o => \i_regDataB[14]~input_o\);

-- Location: LCCOMB_X67_Y2_N28
\Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = ((\i_regDataA[14]~input_o\ $ (\i_regDataB[14]~input_o\ $ (!\Add0~27\)))) # (GND)
-- \Add0~29\ = CARRY((\i_regDataA[14]~input_o\ & ((\i_regDataB[14]~input_o\) # (!\Add0~27\))) # (!\i_regDataA[14]~input_o\ & (\i_regDataB[14]~input_o\ & !\Add0~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[14]~input_o\,
	datab => \i_regDataB[14]~input_o\,
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: IOIBUF_X100_Y0_N1
\i_regDataA[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(15),
	o => \i_regDataA[15]~input_o\);

-- Location: LCCOMB_X69_Y2_N30
\w_ALUResult[14]~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[14]~102_combout\ = (\w_ALUResult[1]~13_combout\ & (\i_regDataA[13]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[13]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_regDataA[15]~input_o\,
	combout => \w_ALUResult[14]~102_combout\);

-- Location: LCCOMB_X69_Y2_N20
\w_ALUResult[14]~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[14]~101_combout\ = (\i_Op_ORS~input_o\ & (((\i_regDataB[14]~input_o\) # (\i_regDataA[14]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataB[14]~input_o\ $ (\i_regDataA[14]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataB[14]~input_o\,
	datad => \i_regDataA[14]~input_o\,
	combout => \w_ALUResult[14]~101_combout\);

-- Location: LCCOMB_X69_Y2_N10
\w_ALUResult[14]~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[14]~103_combout\ = (\w_ALUResult[14]~101_combout\) # ((\w_ALUResult[14]~102_combout\ & (!\i_Op_ORS~input_o\ & !\i_Op_XRS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[14]~102_combout\,
	datab => \i_Op_ORS~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \w_ALUResult[14]~101_combout\,
	combout => \w_ALUResult[14]~103_combout\);

-- Location: LCCOMB_X69_Y2_N24
\w_ALUResult[14]~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[14]~104_combout\ = (\i_Op_ARS~input_o\ & (((\i_regDataB[14]~input_o\ & \i_regDataA[14]~input_o\)))) # (!\i_Op_ARS~input_o\ & (\w_ALUResult[14]~103_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[14]~103_combout\,
	datab => \i_Op_ARS~input_o\,
	datac => \i_regDataB[14]~input_o\,
	datad => \i_regDataA[14]~input_o\,
	combout => \w_ALUResult[14]~104_combout\);

-- Location: LCCOMB_X69_Y2_N4
\w_ALUResult[14]~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[14]~105_combout\ = (\i_Op_ADS~input_o\ & (\Add0~28_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[14]~104_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~28_combout\,
	datab => \w_ALUResult[14]~104_combout\,
	datac => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[14]~105_combout\);

-- Location: LCCOMB_X69_Y2_N8
\w_ALUResult[14]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(14) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[14]~105_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[14]~105_combout\,
	datab => w_ALUResult(14),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(14));

-- Location: IOIBUF_X96_Y0_N1
\i_regDataB[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(15),
	o => \i_regDataB[15]~input_o\);

-- Location: LCCOMB_X67_Y2_N30
\Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (\i_regDataA[15]~input_o\ & ((\i_regDataB[15]~input_o\ & (\Add0~29\ & VCC)) # (!\i_regDataB[15]~input_o\ & (!\Add0~29\)))) # (!\i_regDataA[15]~input_o\ & ((\i_regDataB[15]~input_o\ & (!\Add0~29\)) # (!\i_regDataB[15]~input_o\ & 
-- ((\Add0~29\) # (GND)))))
-- \Add0~31\ = CARRY((\i_regDataA[15]~input_o\ & (!\i_regDataB[15]~input_o\ & !\Add0~29\)) # (!\i_regDataA[15]~input_o\ & ((!\Add0~29\) # (!\i_regDataB[15]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[15]~input_o\,
	datab => \i_regDataB[15]~input_o\,
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X69_Y2_N22
\w_ALUResult[15]~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[15]~106_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[15]~input_o\) # ((\i_regDataA[15]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataB[15]~input_o\ $ (\i_regDataA[15]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[15]~input_o\,
	datab => \i_Op_ORS~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[15]~input_o\,
	combout => \w_ALUResult[15]~106_combout\);

-- Location: IOIBUF_X72_Y0_N1
\i_regDataA[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(16),
	o => \i_regDataA[16]~input_o\);

-- Location: LCCOMB_X70_Y2_N28
\w_ALUResult[15]~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[15]~107_combout\ = (\w_ALUResult[1]~13_combout\ & (\i_regDataA[14]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[16]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~13_combout\,
	datac => \i_regDataA[14]~input_o\,
	datad => \i_regDataA[16]~input_o\,
	combout => \w_ALUResult[15]~107_combout\);

-- Location: LCCOMB_X69_Y2_N26
\w_ALUResult[15]~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[15]~108_combout\ = (\w_ALUResult[15]~106_combout\) # ((!\i_Op_ORS~input_o\ & (!\i_Op_XRS~input_o\ & \w_ALUResult[15]~107_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[15]~106_combout\,
	datab => \i_Op_ORS~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \w_ALUResult[15]~107_combout\,
	combout => \w_ALUResult[15]~108_combout\);

-- Location: LCCOMB_X69_Y2_N6
\w_ALUResult[15]~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[15]~109_combout\ = (\i_Op_ARS~input_o\ & (((\i_regDataA[15]~input_o\ & \i_regDataB[15]~input_o\)))) # (!\i_Op_ARS~input_o\ & (\w_ALUResult[15]~108_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[15]~108_combout\,
	datab => \i_regDataA[15]~input_o\,
	datac => \i_Op_ARS~input_o\,
	datad => \i_regDataB[15]~input_o\,
	combout => \w_ALUResult[15]~109_combout\);

-- Location: LCCOMB_X70_Y1_N18
\w_ALUResult[15]~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[15]~110_combout\ = (\i_Op_ADS~input_o\ & (\Add0~30_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[15]~109_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~30_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \w_ALUResult[15]~109_combout\,
	combout => \w_ALUResult[15]~110_combout\);

-- Location: LCCOMB_X70_Y1_N12
\w_ALUResult[15]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(15) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[15]~110_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(15),
	datab => \w_ALUResult[15]~110_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(15));

-- Location: IOIBUF_X96_Y0_N8
\i_regDataB[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(16),
	o => \i_regDataB[16]~input_o\);

-- Location: LCCOMB_X67_Y1_N0
\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = ((\i_regDataB[16]~input_o\ $ (\i_regDataA[16]~input_o\ $ (!\Add0~31\)))) # (GND)
-- \Add0~33\ = CARRY((\i_regDataB[16]~input_o\ & ((\i_regDataA[16]~input_o\) # (!\Add0~31\))) # (!\i_regDataB[16]~input_o\ & (\i_regDataA[16]~input_o\ & !\Add0~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[16]~input_o\,
	datab => \i_regDataA[16]~input_o\,
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X69_Y2_N2
\w_ALUResult[16]~111\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[16]~111_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[16]~input_o\) # ((\i_regDataA[16]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataB[16]~input_o\ $ (\i_regDataA[16]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[16]~input_o\,
	datab => \i_Op_ORS~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[16]~input_o\,
	combout => \w_ALUResult[16]~111_combout\);

-- Location: IOIBUF_X69_Y0_N1
\i_regDataA[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(17),
	o => \i_regDataA[17]~input_o\);

-- Location: LCCOMB_X69_Y2_N18
\w_ALUResult[16]~112\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[16]~112_combout\ = (\w_ALUResult[1]~13_combout\ & ((\i_regDataA[15]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[17]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_regDataA[15]~input_o\,
	combout => \w_ALUResult[16]~112_combout\);

-- Location: LCCOMB_X69_Y2_N12
\w_ALUResult[16]~113\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[16]~113_combout\ = (\w_ALUResult[16]~111_combout\) # ((\w_ALUResult[16]~112_combout\ & (!\i_Op_XRS~input_o\ & !\i_Op_ORS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[16]~111_combout\,
	datab => \w_ALUResult[16]~112_combout\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[16]~113_combout\);

-- Location: LCCOMB_X69_Y2_N0
\w_ALUResult[16]~114\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[16]~114_combout\ = (\i_Op_ARS~input_o\ & (((\i_regDataA[16]~input_o\ & \i_regDataB[16]~input_o\)))) # (!\i_Op_ARS~input_o\ & (\w_ALUResult[16]~113_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[16]~113_combout\,
	datab => \i_regDataA[16]~input_o\,
	datac => \i_Op_ARS~input_o\,
	datad => \i_regDataB[16]~input_o\,
	combout => \w_ALUResult[16]~114_combout\);

-- Location: LCCOMB_X69_Y3_N30
\w_ALUResult[16]~115\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[16]~115_combout\ = (\i_Op_ADS~input_o\ & (\Add0~32_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[16]~114_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~32_combout\,
	datab => \i_Op_ADS~input_o\,
	datad => \w_ALUResult[16]~114_combout\,
	combout => \w_ALUResult[16]~115_combout\);

-- Location: LCCOMB_X69_Y3_N20
\w_ALUResult[16]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(16) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[16]~115_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(16),
	datac => \w_ALUResult[16]~115_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(16));

-- Location: IOIBUF_X79_Y0_N1
\i_regDataB[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(17),
	o => \i_regDataB[17]~input_o\);

-- Location: LCCOMB_X67_Y1_N2
\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (\i_regDataA[17]~input_o\ & ((\i_regDataB[17]~input_o\ & (\Add0~33\ & VCC)) # (!\i_regDataB[17]~input_o\ & (!\Add0~33\)))) # (!\i_regDataA[17]~input_o\ & ((\i_regDataB[17]~input_o\ & (!\Add0~33\)) # (!\i_regDataB[17]~input_o\ & 
-- ((\Add0~33\) # (GND)))))
-- \Add0~35\ = CARRY((\i_regDataA[17]~input_o\ & (!\i_regDataB[17]~input_o\ & !\Add0~33\)) # (!\i_regDataA[17]~input_o\ & ((!\Add0~33\) # (!\i_regDataB[17]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[17]~input_o\,
	datab => \i_regDataB[17]~input_o\,
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X68_Y1_N24
\w_ALUResult[17]~116\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[17]~116_combout\ = (\i_Op_ORS~input_o\ & (((\i_regDataA[17]~input_o\) # (\i_regDataB[17]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataA[17]~input_o\ $ (\i_regDataB[17]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ORS~input_o\,
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataA[17]~input_o\,
	datad => \i_regDataB[17]~input_o\,
	combout => \w_ALUResult[17]~116_combout\);

-- Location: IOIBUF_X74_Y0_N1
\i_regDataA[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(18),
	o => \i_regDataA[18]~input_o\);

-- Location: LCCOMB_X69_Y1_N24
\w_ALUResult[17]~117\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[17]~117_combout\ = (\w_ALUResult[1]~13_combout\ & (\i_regDataA[16]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[18]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[16]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_regDataA[18]~input_o\,
	combout => \w_ALUResult[17]~117_combout\);

-- Location: LCCOMB_X68_Y1_N18
\w_ALUResult[17]~118\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[17]~118_combout\ = (\w_ALUResult[17]~116_combout\) # ((!\i_Op_ORS~input_o\ & (!\i_Op_XRS~input_o\ & \w_ALUResult[17]~117_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ORS~input_o\,
	datab => \w_ALUResult[17]~116_combout\,
	datac => \i_Op_XRS~input_o\,
	datad => \w_ALUResult[17]~117_combout\,
	combout => \w_ALUResult[17]~118_combout\);

-- Location: LCCOMB_X68_Y1_N2
\w_ALUResult[17]~119\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[17]~119_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[17]~input_o\ & (\i_regDataA[17]~input_o\))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[17]~118_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[17]~input_o\,
	datab => \i_Op_ARS~input_o\,
	datac => \i_regDataA[17]~input_o\,
	datad => \w_ALUResult[17]~118_combout\,
	combout => \w_ALUResult[17]~119_combout\);

-- Location: LCCOMB_X68_Y1_N22
\w_ALUResult[17]~120\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[17]~120_combout\ = (\i_Op_ADS~input_o\ & (\Add0~34_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[17]~119_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ADS~input_o\,
	datac => \Add0~34_combout\,
	datad => \w_ALUResult[17]~119_combout\,
	combout => \w_ALUResult[17]~120_combout\);

-- Location: LCCOMB_X68_Y1_N14
\w_ALUResult[17]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(17) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[17]~120_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(17),
	datac => \w_ALUResult[31]~7clkctrl_outclk\,
	datad => \w_ALUResult[17]~120_combout\,
	combout => w_ALUResult(17));

-- Location: IOIBUF_X83_Y0_N8
\i_regDataB[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(18),
	o => \i_regDataB[18]~input_o\);

-- Location: LCCOMB_X67_Y1_N4
\Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = ((\i_regDataB[18]~input_o\ $ (\i_regDataA[18]~input_o\ $ (!\Add0~35\)))) # (GND)
-- \Add0~37\ = CARRY((\i_regDataB[18]~input_o\ & ((\i_regDataA[18]~input_o\) # (!\Add0~35\))) # (!\i_regDataB[18]~input_o\ & (\i_regDataA[18]~input_o\ & !\Add0~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[18]~input_o\,
	datab => \i_regDataA[18]~input_o\,
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: IOIBUF_X83_Y0_N1
\i_regDataA[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(19),
	o => \i_regDataA[19]~input_o\);

-- Location: LCCOMB_X69_Y1_N28
\w_ALUResult[18]~122\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[18]~122_combout\ = (\w_ALUResult[1]~13_combout\ & ((\i_regDataA[17]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[19]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[19]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_regDataA[17]~input_o\,
	combout => \w_ALUResult[18]~122_combout\);

-- Location: LCCOMB_X69_Y1_N16
\w_ALUResult[18]~121\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[18]~121_combout\ = (\i_Op_ORS~input_o\ & (((\i_regDataA[18]~input_o\) # (\i_regDataB[18]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataA[18]~input_o\ $ (\i_regDataB[18]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_regDataA[18]~input_o\,
	datac => \i_regDataB[18]~input_o\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[18]~121_combout\);

-- Location: LCCOMB_X69_Y1_N6
\w_ALUResult[18]~123\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[18]~123_combout\ = (\w_ALUResult[18]~121_combout\) # ((!\i_Op_XRS~input_o\ & (\w_ALUResult[18]~122_combout\ & !\i_Op_ORS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \w_ALUResult[18]~122_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[18]~121_combout\,
	combout => \w_ALUResult[18]~123_combout\);

-- Location: LCCOMB_X69_Y1_N2
\w_ALUResult[18]~124\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[18]~124_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataA[18]~input_o\ & (\i_regDataB[18]~input_o\))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[18]~123_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datab => \i_regDataA[18]~input_o\,
	datac => \i_regDataB[18]~input_o\,
	datad => \w_ALUResult[18]~123_combout\,
	combout => \w_ALUResult[18]~124_combout\);

-- Location: LCCOMB_X68_Y1_N6
\w_ALUResult[18]~125\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[18]~125_combout\ = (\i_Op_ADS~input_o\ & (\Add0~36_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[18]~124_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ADS~input_o\,
	datac => \Add0~36_combout\,
	datad => \w_ALUResult[18]~124_combout\,
	combout => \w_ALUResult[18]~125_combout\);

-- Location: LCCOMB_X68_Y1_N28
\w_ALUResult[18]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(18) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[18]~125_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[18]~125_combout\,
	datac => \w_ALUResult[31]~7clkctrl_outclk\,
	datad => w_ALUResult(18),
	combout => w_ALUResult(18));

-- Location: IOIBUF_X74_Y0_N15
\i_regDataB[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(19),
	o => \i_regDataB[19]~input_o\);

-- Location: LCCOMB_X67_Y1_N6
\Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (\i_regDataB[19]~input_o\ & ((\i_regDataA[19]~input_o\ & (\Add0~37\ & VCC)) # (!\i_regDataA[19]~input_o\ & (!\Add0~37\)))) # (!\i_regDataB[19]~input_o\ & ((\i_regDataA[19]~input_o\ & (!\Add0~37\)) # (!\i_regDataA[19]~input_o\ & 
-- ((\Add0~37\) # (GND)))))
-- \Add0~39\ = CARRY((\i_regDataB[19]~input_o\ & (!\i_regDataA[19]~input_o\ & !\Add0~37\)) # (!\i_regDataB[19]~input_o\ & ((!\Add0~37\) # (!\i_regDataA[19]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[19]~input_o\,
	datab => \i_regDataA[19]~input_o\,
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: IOIBUF_X72_Y0_N8
\i_regDataA[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(20),
	o => \i_regDataA[20]~input_o\);

-- Location: LCCOMB_X69_Y1_N30
\w_ALUResult[19]~127\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[19]~127_combout\ = (\w_ALUResult[1]~13_combout\ & ((\i_regDataA[18]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[20]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[20]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_regDataA[18]~input_o\,
	combout => \w_ALUResult[19]~127_combout\);

-- Location: LCCOMB_X69_Y1_N12
\w_ALUResult[19]~126\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[19]~126_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[19]~input_o\) # ((\i_regDataA[19]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataB[19]~input_o\ $ (\i_regDataA[19]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[19]~input_o\,
	datab => \i_Op_ORS~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[19]~input_o\,
	combout => \w_ALUResult[19]~126_combout\);

-- Location: LCCOMB_X69_Y1_N20
\w_ALUResult[19]~128\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[19]~128_combout\ = (\w_ALUResult[19]~126_combout\) # ((!\i_Op_XRS~input_o\ & (!\i_Op_ORS~input_o\ & \w_ALUResult[19]~127_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_Op_ORS~input_o\,
	datac => \w_ALUResult[19]~127_combout\,
	datad => \w_ALUResult[19]~126_combout\,
	combout => \w_ALUResult[19]~128_combout\);

-- Location: LCCOMB_X69_Y1_N18
\w_ALUResult[19]~129\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[19]~129_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[19]~input_o\ & ((\i_regDataA[19]~input_o\)))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[19]~128_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[19]~input_o\,
	datab => \w_ALUResult[19]~128_combout\,
	datac => \i_Op_ARS~input_o\,
	datad => \i_regDataA[19]~input_o\,
	combout => \w_ALUResult[19]~129_combout\);

-- Location: LCCOMB_X68_Y1_N16
\w_ALUResult[19]~130\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[19]~130_combout\ = (\i_Op_ADS~input_o\ & (\Add0~38_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[19]~129_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ADS~input_o\,
	datac => \Add0~38_combout\,
	datad => \w_ALUResult[19]~129_combout\,
	combout => \w_ALUResult[19]~130_combout\);

-- Location: LCCOMB_X68_Y1_N8
\w_ALUResult[19]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(19) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[19]~130_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[19]~130_combout\,
	datab => w_ALUResult(19),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(19));

-- Location: IOIBUF_X85_Y0_N1
\i_regDataA[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(21),
	o => \i_regDataA[21]~input_o\);

-- Location: LCCOMB_X69_Y1_N22
\w_ALUResult[20]~132\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[20]~132_combout\ = (\w_ALUResult[1]~13_combout\ & (\i_regDataA[19]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[21]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[19]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_regDataA[21]~input_o\,
	combout => \w_ALUResult[20]~132_combout\);

-- Location: IOIBUF_X79_Y0_N22
\i_regDataB[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(20),
	o => \i_regDataB[20]~input_o\);

-- Location: LCCOMB_X68_Y1_N20
\w_ALUResult[20]~131\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[20]~131_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[20]~input_o\) # ((\i_regDataA[20]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataB[20]~input_o\ $ (\i_regDataA[20]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ORS~input_o\,
	datab => \i_regDataB[20]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[20]~input_o\,
	combout => \w_ALUResult[20]~131_combout\);

-- Location: LCCOMB_X68_Y1_N10
\w_ALUResult[20]~133\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[20]~133_combout\ = (\w_ALUResult[20]~131_combout\) # ((!\i_Op_ORS~input_o\ & (\w_ALUResult[20]~132_combout\ & !\i_Op_XRS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ORS~input_o\,
	datab => \w_ALUResult[20]~132_combout\,
	datac => \i_Op_XRS~input_o\,
	datad => \w_ALUResult[20]~131_combout\,
	combout => \w_ALUResult[20]~133_combout\);

-- Location: LCCOMB_X68_Y1_N30
\w_ALUResult[20]~134\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[20]~134_combout\ = (\i_Op_ARS~input_o\ & (((\i_regDataB[20]~input_o\ & \i_regDataA[20]~input_o\)))) # (!\i_Op_ARS~input_o\ & (\w_ALUResult[20]~133_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[20]~133_combout\,
	datab => \i_regDataB[20]~input_o\,
	datac => \i_Op_ARS~input_o\,
	datad => \i_regDataA[20]~input_o\,
	combout => \w_ALUResult[20]~134_combout\);

-- Location: LCCOMB_X67_Y1_N8
\Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = ((\i_regDataA[20]~input_o\ $ (\i_regDataB[20]~input_o\ $ (!\Add0~39\)))) # (GND)
-- \Add0~41\ = CARRY((\i_regDataA[20]~input_o\ & ((\i_regDataB[20]~input_o\) # (!\Add0~39\))) # (!\i_regDataA[20]~input_o\ & (\i_regDataB[20]~input_o\ & !\Add0~39\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[20]~input_o\,
	datab => \i_regDataB[20]~input_o\,
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: LCCOMB_X68_Y1_N26
\w_ALUResult[20]~135\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[20]~135_combout\ = (\i_Op_ADS~input_o\ & ((\Add0~40_combout\))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[20]~134_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ADS~input_o\,
	datac => \w_ALUResult[20]~134_combout\,
	datad => \Add0~40_combout\,
	combout => \w_ALUResult[20]~135_combout\);

-- Location: LCCOMB_X68_Y1_N4
\w_ALUResult[20]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(20) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[20]~135_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[20]~135_combout\,
	datac => w_ALUResult(20),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(20));

-- Location: IOIBUF_X74_Y0_N22
\i_regDataB[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(21),
	o => \i_regDataB[21]~input_o\);

-- Location: LCCOMB_X69_Y1_N8
\w_ALUResult[21]~136\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[21]~136_combout\ = (\i_Op_ORS~input_o\ & (((\i_regDataB[21]~input_o\) # (\i_regDataA[21]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataB[21]~input_o\ $ (\i_regDataA[21]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataB[21]~input_o\,
	datad => \i_regDataA[21]~input_o\,
	combout => \w_ALUResult[21]~136_combout\);

-- Location: IOIBUF_X85_Y0_N15
\i_regDataA[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(22),
	o => \i_regDataA[22]~input_o\);

-- Location: LCCOMB_X70_Y1_N20
\w_ALUResult[21]~137\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[21]~137_combout\ = (\w_ALUResult[1]~13_combout\ & ((\i_regDataA[20]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[22]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_regDataA[22]~input_o\,
	datac => \i_regDataA[20]~input_o\,
	datad => \w_ALUResult[1]~13_combout\,
	combout => \w_ALUResult[21]~137_combout\);

-- Location: LCCOMB_X69_Y1_N10
\w_ALUResult[21]~138\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[21]~138_combout\ = (\w_ALUResult[21]~136_combout\) # ((!\i_Op_XRS~input_o\ & (!\i_Op_ORS~input_o\ & \w_ALUResult[21]~137_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \w_ALUResult[21]~136_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[21]~137_combout\,
	combout => \w_ALUResult[21]~138_combout\);

-- Location: LCCOMB_X69_Y1_N0
\w_ALUResult[21]~139\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[21]~139_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataA[21]~input_o\ & (\i_regDataB[21]~input_o\))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[21]~138_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ARS~input_o\,
	datab => \i_regDataA[21]~input_o\,
	datac => \i_regDataB[21]~input_o\,
	datad => \w_ALUResult[21]~138_combout\,
	combout => \w_ALUResult[21]~139_combout\);

-- Location: LCCOMB_X67_Y1_N10
\Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (\i_regDataB[21]~input_o\ & ((\i_regDataA[21]~input_o\ & (\Add0~41\ & VCC)) # (!\i_regDataA[21]~input_o\ & (!\Add0~41\)))) # (!\i_regDataB[21]~input_o\ & ((\i_regDataA[21]~input_o\ & (!\Add0~41\)) # (!\i_regDataA[21]~input_o\ & 
-- ((\Add0~41\) # (GND)))))
-- \Add0~43\ = CARRY((\i_regDataB[21]~input_o\ & (!\i_regDataA[21]~input_o\ & !\Add0~41\)) # (!\i_regDataB[21]~input_o\ & ((!\Add0~41\) # (!\i_regDataA[21]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[21]~input_o\,
	datab => \i_regDataA[21]~input_o\,
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: LCCOMB_X70_Y1_N30
\w_ALUResult[21]~140\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[21]~140_combout\ = (\i_Op_ADS~input_o\ & ((\Add0~42_combout\))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[21]~139_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[21]~139_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \Add0~42_combout\,
	combout => \w_ALUResult[21]~140_combout\);

-- Location: LCCOMB_X70_Y1_N14
\w_ALUResult[21]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(21) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[21]~140_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[21]~140_combout\,
	datac => w_ALUResult(21),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(21));

-- Location: IOIBUF_X105_Y0_N8
\i_regDataB[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(22),
	o => \i_regDataB[22]~input_o\);

-- Location: LCCOMB_X67_Y1_N12
\Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = ((\i_regDataB[22]~input_o\ $ (\i_regDataA[22]~input_o\ $ (!\Add0~43\)))) # (GND)
-- \Add0~45\ = CARRY((\i_regDataB[22]~input_o\ & ((\i_regDataA[22]~input_o\) # (!\Add0~43\))) # (!\i_regDataB[22]~input_o\ & (\i_regDataA[22]~input_o\ & !\Add0~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[22]~input_o\,
	datab => \i_regDataA[22]~input_o\,
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: IOIBUF_X111_Y0_N1
\i_regDataA[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(23),
	o => \i_regDataA[23]~input_o\);

-- Location: LCCOMB_X69_Y4_N24
\w_ALUResult[22]~142\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[22]~142_combout\ = (\w_ALUResult[1]~13_combout\ & ((\i_regDataA[21]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[23]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[23]~input_o\,
	datab => \i_regDataA[21]~input_o\,
	datad => \w_ALUResult[1]~13_combout\,
	combout => \w_ALUResult[22]~142_combout\);

-- Location: LCCOMB_X69_Y4_N22
\w_ALUResult[22]~141\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[22]~141_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[22]~input_o\) # ((\i_regDataA[22]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataB[22]~input_o\ $ (\i_regDataA[22]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[22]~input_o\,
	datab => \i_regDataA[22]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[22]~141_combout\);

-- Location: LCCOMB_X69_Y4_N18
\w_ALUResult[22]~143\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[22]~143_combout\ = (\w_ALUResult[22]~141_combout\) # ((!\i_Op_XRS~input_o\ & (\w_ALUResult[22]~142_combout\ & !\i_Op_ORS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \w_ALUResult[22]~142_combout\,
	datac => \w_ALUResult[22]~141_combout\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[22]~143_combout\);

-- Location: LCCOMB_X69_Y4_N12
\w_ALUResult[22]~144\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[22]~144_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[22]~input_o\ & ((\i_regDataA[22]~input_o\)))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[22]~143_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[22]~input_o\,
	datab => \w_ALUResult[22]~143_combout\,
	datac => \i_regDataA[22]~input_o\,
	datad => \i_Op_ARS~input_o\,
	combout => \w_ALUResult[22]~144_combout\);

-- Location: LCCOMB_X70_Y1_N26
\w_ALUResult[22]~145\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[22]~145_combout\ = (\i_Op_ADS~input_o\ & (\Add0~44_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[22]~144_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~44_combout\,
	datab => \w_ALUResult[22]~144_combout\,
	datac => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[22]~145_combout\);

-- Location: LCCOMB_X70_Y1_N10
\w_ALUResult[22]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(22) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[22]~145_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(22),
	datac => \w_ALUResult[22]~145_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(22));

-- Location: IOIBUF_X107_Y0_N8
\i_regDataB[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(23),
	o => \i_regDataB[23]~input_o\);

-- Location: LCCOMB_X67_Y1_N14
\Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (\i_regDataB[23]~input_o\ & ((\i_regDataA[23]~input_o\ & (\Add0~45\ & VCC)) # (!\i_regDataA[23]~input_o\ & (!\Add0~45\)))) # (!\i_regDataB[23]~input_o\ & ((\i_regDataA[23]~input_o\ & (!\Add0~45\)) # (!\i_regDataA[23]~input_o\ & 
-- ((\Add0~45\) # (GND)))))
-- \Add0~47\ = CARRY((\i_regDataB[23]~input_o\ & (!\i_regDataA[23]~input_o\ & !\Add0~45\)) # (!\i_regDataB[23]~input_o\ & ((!\Add0~45\) # (!\i_regDataA[23]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[23]~input_o\,
	datab => \i_regDataA[23]~input_o\,
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

-- Location: LCCOMB_X69_Y4_N16
\w_ALUResult[23]~146\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[23]~146_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[23]~input_o\) # ((\i_regDataA[23]~input_o\)))) # (!\i_Op_ORS~input_o\ & (\i_Op_XRS~input_o\ & (\i_regDataB[23]~input_o\ $ (\i_regDataA[23]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ORS~input_o\,
	datab => \i_regDataB[23]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[23]~input_o\,
	combout => \w_ALUResult[23]~146_combout\);

-- Location: IOIBUF_X49_Y0_N15
\i_regDataA[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(24),
	o => \i_regDataA[24]~input_o\);

-- Location: LCCOMB_X69_Y4_N30
\w_ALUResult[23]~147\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[23]~147_combout\ = (\w_ALUResult[1]~13_combout\ & (\i_regDataA[22]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[24]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[1]~13_combout\,
	datac => \i_regDataA[22]~input_o\,
	datad => \i_regDataA[24]~input_o\,
	combout => \w_ALUResult[23]~147_combout\);

-- Location: LCCOMB_X69_Y4_N26
\w_ALUResult[23]~148\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[23]~148_combout\ = (\w_ALUResult[23]~146_combout\) # ((!\i_Op_XRS~input_o\ & (\w_ALUResult[23]~147_combout\ & !\i_Op_ORS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \w_ALUResult[23]~146_combout\,
	datac => \w_ALUResult[23]~147_combout\,
	datad => \i_Op_ORS~input_o\,
	combout => \w_ALUResult[23]~148_combout\);

-- Location: LCCOMB_X69_Y4_N20
\w_ALUResult[23]~149\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[23]~149_combout\ = (\i_Op_ARS~input_o\ & (((\i_regDataB[23]~input_o\ & \i_regDataA[23]~input_o\)))) # (!\i_Op_ARS~input_o\ & (\w_ALUResult[23]~148_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[23]~148_combout\,
	datab => \i_regDataB[23]~input_o\,
	datac => \i_Op_ARS~input_o\,
	datad => \i_regDataA[23]~input_o\,
	combout => \w_ALUResult[23]~149_combout\);

-- Location: LCCOMB_X70_Y1_N8
\w_ALUResult[23]~150\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[23]~150_combout\ = (\i_Op_ADS~input_o\ & (\Add0~46_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[23]~149_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~46_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \w_ALUResult[23]~149_combout\,
	combout => \w_ALUResult[23]~150_combout\);

-- Location: LCCOMB_X70_Y1_N22
\w_ALUResult[23]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(23) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[23]~150_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(23),
	datac => \w_ALUResult[23]~150_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(23));

-- Location: IOIBUF_X109_Y0_N8
\i_regDataB[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(24),
	o => \i_regDataB[24]~input_o\);

-- Location: LCCOMB_X67_Y1_N16
\Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = ((\i_regDataA[24]~input_o\ $ (\i_regDataB[24]~input_o\ $ (!\Add0~47\)))) # (GND)
-- \Add0~49\ = CARRY((\i_regDataA[24]~input_o\ & ((\i_regDataB[24]~input_o\) # (!\Add0~47\))) # (!\i_regDataA[24]~input_o\ & (\i_regDataB[24]~input_o\ & !\Add0~47\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[24]~input_o\,
	datab => \i_regDataB[24]~input_o\,
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

-- Location: IOIBUF_X45_Y0_N22
\i_regDataA[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(25),
	o => \i_regDataA[25]~input_o\);

-- Location: LCCOMB_X69_Y4_N28
\w_ALUResult[24]~151\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[24]~151_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[23]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[25]~input_o\,
	datab => \w_ALUResult[1]~13_combout\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[23]~input_o\,
	combout => \w_ALUResult[24]~151_combout\);

-- Location: LCCOMB_X69_Y4_N4
\w_ALUResult[24]~152\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[24]~152_combout\ = (\w_ALUResult[24]~151_combout\) # ((\i_Op_XRS~input_o\ & (\i_regDataA[24]~input_o\ $ (\i_regDataB[24]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[24]~input_o\,
	datab => \w_ALUResult[24]~151_combout\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataB[24]~input_o\,
	combout => \w_ALUResult[24]~152_combout\);

-- Location: LCCOMB_X69_Y4_N0
\w_ALUResult[24]~153\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[24]~153_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataA[24]~input_o\) # ((\i_regDataB[24]~input_o\)))) # (!\i_Op_ORS~input_o\ & (((\w_ALUResult[24]~152_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[24]~input_o\,
	datab => \i_Op_ORS~input_o\,
	datac => \w_ALUResult[24]~152_combout\,
	datad => \i_regDataB[24]~input_o\,
	combout => \w_ALUResult[24]~153_combout\);

-- Location: LCCOMB_X69_Y4_N2
\w_ALUResult[24]~154\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[24]~154_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataA[24]~input_o\ & ((\i_regDataB[24]~input_o\)))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[24]~153_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[24]~input_o\,
	datab => \w_ALUResult[24]~153_combout\,
	datac => \i_Op_ARS~input_o\,
	datad => \i_regDataB[24]~input_o\,
	combout => \w_ALUResult[24]~154_combout\);

-- Location: LCCOMB_X70_Y1_N16
\w_ALUResult[24]~155\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[24]~155_combout\ = (\i_Op_ADS~input_o\ & (\Add0~48_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[24]~154_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~48_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \w_ALUResult[24]~154_combout\,
	combout => \w_ALUResult[24]~155_combout\);

-- Location: LCCOMB_X70_Y1_N4
\w_ALUResult[24]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(24) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (\w_ALUResult[24]~155_combout\)) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((w_ALUResult(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[24]~155_combout\,
	datac => w_ALUResult(24),
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(24));

-- Location: IOIBUF_X49_Y0_N1
\i_regDataB[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(25),
	o => \i_regDataB[25]~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\i_regDataA[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(26),
	o => \i_regDataA[26]~input_o\);

-- Location: LCCOMB_X65_Y2_N20
\w_ALUResult[25]~156\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[25]~156_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[24]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[26]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[26]~input_o\,
	datab => \i_Op_XRS~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_regDataA[24]~input_o\,
	combout => \w_ALUResult[25]~156_combout\);

-- Location: LCCOMB_X65_Y2_N8
\w_ALUResult[25]~157\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[25]~157_combout\ = (\w_ALUResult[25]~156_combout\) # ((\i_Op_XRS~input_o\ & (\i_regDataB[25]~input_o\ $ (\i_regDataA[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datab => \i_regDataB[25]~input_o\,
	datac => \i_regDataA[25]~input_o\,
	datad => \w_ALUResult[25]~156_combout\,
	combout => \w_ALUResult[25]~157_combout\);

-- Location: LCCOMB_X65_Y2_N2
\w_ALUResult[25]~158\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[25]~158_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataA[25]~input_o\) # ((\i_regDataB[25]~input_o\)))) # (!\i_Op_ORS~input_o\ & (((\w_ALUResult[25]~157_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[25]~input_o\,
	datab => \w_ALUResult[25]~157_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \i_regDataB[25]~input_o\,
	combout => \w_ALUResult[25]~158_combout\);

-- Location: LCCOMB_X65_Y2_N30
\w_ALUResult[25]~159\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[25]~159_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[25]~input_o\ & (\i_regDataA[25]~input_o\))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[25]~158_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[25]~input_o\,
	datab => \i_regDataA[25]~input_o\,
	datac => \i_Op_ARS~input_o\,
	datad => \w_ALUResult[25]~158_combout\,
	combout => \w_ALUResult[25]~159_combout\);

-- Location: LCCOMB_X67_Y1_N18
\Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (\i_regDataB[25]~input_o\ & ((\i_regDataA[25]~input_o\ & (\Add0~49\ & VCC)) # (!\i_regDataA[25]~input_o\ & (!\Add0~49\)))) # (!\i_regDataB[25]~input_o\ & ((\i_regDataA[25]~input_o\ & (!\Add0~49\)) # (!\i_regDataA[25]~input_o\ & 
-- ((\Add0~49\) # (GND)))))
-- \Add0~51\ = CARRY((\i_regDataB[25]~input_o\ & (!\i_regDataA[25]~input_o\ & !\Add0~49\)) # (!\i_regDataB[25]~input_o\ & ((!\Add0~49\) # (!\i_regDataA[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[25]~input_o\,
	datab => \i_regDataA[25]~input_o\,
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

-- Location: LCCOMB_X66_Y1_N8
\w_ALUResult[25]~160\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[25]~160_combout\ = (\i_Op_ADS~input_o\ & ((\Add0~50_combout\))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[25]~159_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \w_ALUResult[25]~159_combout\,
	datac => \i_Op_ADS~input_o\,
	datad => \Add0~50_combout\,
	combout => \w_ALUResult[25]~160_combout\);

-- Location: LCCOMB_X66_Y1_N10
\w_ALUResult[25]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(25) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[25]~160_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(25),
	datac => \w_ALUResult[25]~160_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(25));

-- Location: IOIBUF_X56_Y0_N15
\i_regDataB[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(26),
	o => \i_regDataB[26]~input_o\);

-- Location: IOIBUF_X54_Y0_N15
\i_regDataA[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(27),
	o => \i_regDataA[27]~input_o\);

-- Location: LCCOMB_X65_Y2_N12
\w_ALUResult[26]~161\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[26]~161_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[25]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[27]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[27]~input_o\,
	datab => \i_regDataA[25]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[26]~161_combout\);

-- Location: LCCOMB_X65_Y2_N10
\w_ALUResult[26]~162\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[26]~162_combout\ = (\w_ALUResult[26]~161_combout\) # ((\i_Op_XRS~input_o\ & (\i_regDataB[26]~input_o\ $ (\i_regDataA[26]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[26]~input_o\,
	datab => \i_regDataA[26]~input_o\,
	datac => \i_Op_XRS~input_o\,
	datad => \w_ALUResult[26]~161_combout\,
	combout => \w_ALUResult[26]~162_combout\);

-- Location: LCCOMB_X65_Y2_N28
\w_ALUResult[26]~163\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[26]~163_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[26]~input_o\) # ((\i_regDataA[26]~input_o\)))) # (!\i_Op_ORS~input_o\ & (((\w_ALUResult[26]~162_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[26]~input_o\,
	datab => \i_regDataA[26]~input_o\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[26]~162_combout\,
	combout => \w_ALUResult[26]~163_combout\);

-- Location: LCCOMB_X65_Y2_N0
\w_ALUResult[26]~164\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[26]~164_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataA[26]~input_o\ & ((\i_regDataB[26]~input_o\)))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[26]~163_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[26]~input_o\,
	datab => \w_ALUResult[26]~163_combout\,
	datac => \i_Op_ARS~input_o\,
	datad => \i_regDataB[26]~input_o\,
	combout => \w_ALUResult[26]~164_combout\);

-- Location: LCCOMB_X67_Y1_N20
\Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = ((\i_regDataB[26]~input_o\ $ (\i_regDataA[26]~input_o\ $ (!\Add0~51\)))) # (GND)
-- \Add0~53\ = CARRY((\i_regDataB[26]~input_o\ & ((\i_regDataA[26]~input_o\) # (!\Add0~51\))) # (!\i_regDataB[26]~input_o\ & (\i_regDataA[26]~input_o\ & !\Add0~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[26]~input_o\,
	datab => \i_regDataA[26]~input_o\,
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

-- Location: LCCOMB_X66_Y1_N22
\w_ALUResult[26]~165\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[26]~165_combout\ = (\i_Op_ADS~input_o\ & ((\Add0~52_combout\))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[26]~164_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ADS~input_o\,
	datab => \w_ALUResult[26]~164_combout\,
	datad => \Add0~52_combout\,
	combout => \w_ALUResult[26]~165_combout\);

-- Location: LCCOMB_X66_Y1_N6
\w_ALUResult[26]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(26) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[26]~165_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(26),
	datac => \w_ALUResult[26]~165_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(26));

-- Location: IOIBUF_X52_Y0_N8
\i_regDataB[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(27),
	o => \i_regDataB[27]~input_o\);

-- Location: IOIBUF_X54_Y0_N22
\i_regDataA[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(28),
	o => \i_regDataA[28]~input_o\);

-- Location: LCCOMB_X65_Y2_N6
\w_ALUResult[27]~166\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[27]~166_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & (\i_regDataA[26]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[28]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000101100001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[26]~input_o\,
	datab => \w_ALUResult[1]~13_combout\,
	datac => \i_Op_XRS~input_o\,
	datad => \i_regDataA[28]~input_o\,
	combout => \w_ALUResult[27]~166_combout\);

-- Location: LCCOMB_X65_Y2_N14
\w_ALUResult[27]~167\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[27]~167_combout\ = (\w_ALUResult[27]~166_combout\) # ((\i_Op_XRS~input_o\ & (\i_regDataB[27]~input_o\ $ (\i_regDataA[27]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[27]~input_o\,
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataA[27]~input_o\,
	datad => \w_ALUResult[27]~166_combout\,
	combout => \w_ALUResult[27]~167_combout\);

-- Location: LCCOMB_X65_Y2_N24
\w_ALUResult[27]~168\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[27]~168_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataA[27]~input_o\) # ((\i_regDataB[27]~input_o\)))) # (!\i_Op_ORS~input_o\ & (((\w_ALUResult[27]~167_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[27]~input_o\,
	datab => \w_ALUResult[27]~167_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \i_regDataB[27]~input_o\,
	combout => \w_ALUResult[27]~168_combout\);

-- Location: LCCOMB_X65_Y2_N26
\w_ALUResult[27]~169\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[27]~169_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[27]~input_o\ & (\i_regDataA[27]~input_o\))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[27]~168_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[27]~input_o\,
	datab => \i_Op_ARS~input_o\,
	datac => \i_regDataA[27]~input_o\,
	datad => \w_ALUResult[27]~168_combout\,
	combout => \w_ALUResult[27]~169_combout\);

-- Location: LCCOMB_X67_Y1_N22
\Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (\i_regDataA[27]~input_o\ & ((\i_regDataB[27]~input_o\ & (\Add0~53\ & VCC)) # (!\i_regDataB[27]~input_o\ & (!\Add0~53\)))) # (!\i_regDataA[27]~input_o\ & ((\i_regDataB[27]~input_o\ & (!\Add0~53\)) # (!\i_regDataB[27]~input_o\ & 
-- ((\Add0~53\) # (GND)))))
-- \Add0~55\ = CARRY((\i_regDataA[27]~input_o\ & (!\i_regDataB[27]~input_o\ & !\Add0~53\)) # (!\i_regDataA[27]~input_o\ & ((!\Add0~53\) # (!\i_regDataB[27]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[27]~input_o\,
	datab => \i_regDataB[27]~input_o\,
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

-- Location: LCCOMB_X66_Y1_N30
\w_ALUResult[27]~170\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[27]~170_combout\ = (\i_Op_ADS~input_o\ & ((\Add0~54_combout\))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[27]~169_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[27]~169_combout\,
	datab => \Add0~54_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[27]~170_combout\);

-- Location: LCCOMB_X66_Y1_N14
\w_ALUResult[27]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(27) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[27]~170_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(27),
	datac => \w_ALUResult[31]~7clkctrl_outclk\,
	datad => \w_ALUResult[27]~170_combout\,
	combout => w_ALUResult(27));

-- Location: IOIBUF_X60_Y0_N15
\i_regDataB[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(28),
	o => \i_regDataB[28]~input_o\);

-- Location: LCCOMB_X67_Y1_N24
\Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = ((\i_regDataA[28]~input_o\ $ (\i_regDataB[28]~input_o\ $ (!\Add0~55\)))) # (GND)
-- \Add0~57\ = CARRY((\i_regDataA[28]~input_o\ & ((\i_regDataB[28]~input_o\) # (!\Add0~55\))) # (!\i_regDataA[28]~input_o\ & (\i_regDataB[28]~input_o\ & !\Add0~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[28]~input_o\,
	datab => \i_regDataB[28]~input_o\,
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

-- Location: IOIBUF_X62_Y0_N22
\i_regDataA[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(29),
	o => \i_regDataA[29]~input_o\);

-- Location: LCCOMB_X65_Y1_N22
\w_ALUResult[28]~171\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[28]~171_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[27]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[29]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~13_combout\,
	datab => \i_regDataA[29]~input_o\,
	datac => \i_regDataA[27]~input_o\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[28]~171_combout\);

-- Location: LCCOMB_X65_Y1_N28
\w_ALUResult[28]~172\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[28]~172_combout\ = (\w_ALUResult[28]~171_combout\) # ((\i_Op_XRS~input_o\ & (\i_regDataA[28]~input_o\ $ (\i_regDataB[28]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[28]~171_combout\,
	datab => \i_regDataA[28]~input_o\,
	datac => \i_regDataB[28]~input_o\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[28]~172_combout\);

-- Location: LCCOMB_X65_Y1_N12
\w_ALUResult[28]~173\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[28]~173_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[28]~input_o\) # ((\i_regDataA[28]~input_o\)))) # (!\i_Op_ORS~input_o\ & (((\w_ALUResult[28]~172_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[28]~input_o\,
	datab => \i_regDataA[28]~input_o\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[28]~172_combout\,
	combout => \w_ALUResult[28]~173_combout\);

-- Location: LCCOMB_X65_Y1_N6
\w_ALUResult[28]~174\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[28]~174_combout\ = (\i_Op_ARS~input_o\ & (((\i_regDataA[28]~input_o\ & \i_regDataB[28]~input_o\)))) # (!\i_Op_ARS~input_o\ & (\w_ALUResult[28]~173_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[28]~173_combout\,
	datab => \i_regDataA[28]~input_o\,
	datac => \i_regDataB[28]~input_o\,
	datad => \i_Op_ARS~input_o\,
	combout => \w_ALUResult[28]~174_combout\);

-- Location: LCCOMB_X66_Y1_N2
\w_ALUResult[28]~175\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[28]~175_combout\ = (\i_Op_ADS~input_o\ & (\Add0~56_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[28]~174_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ADS~input_o\,
	datab => \Add0~56_combout\,
	datad => \w_ALUResult[28]~174_combout\,
	combout => \w_ALUResult[28]~175_combout\);

-- Location: LCCOMB_X66_Y1_N0
\w_ALUResult[28]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(28) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[28]~175_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(28),
	datac => \w_ALUResult[28]~175_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(28));

-- Location: IOIBUF_X62_Y0_N15
\i_regDataB[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(29),
	o => \i_regDataB[29]~input_o\);

-- Location: IOIBUF_X49_Y0_N22
\i_regDataA[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataA(30),
	o => \i_regDataA[30]~input_o\);

-- Location: LCCOMB_X65_Y1_N4
\w_ALUResult[29]~176\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[29]~176_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & ((\i_regDataA[28]~input_o\))) # (!\w_ALUResult[1]~13_combout\ & (\i_regDataA[30]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[30]~input_o\,
	datab => \i_regDataA[28]~input_o\,
	datac => \w_ALUResult[1]~13_combout\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[29]~176_combout\);

-- Location: LCCOMB_X65_Y1_N10
\w_ALUResult[29]~177\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[29]~177_combout\ = (\w_ALUResult[29]~176_combout\) # ((\i_Op_XRS~input_o\ & (\i_regDataB[29]~input_o\ $ (\i_regDataA[29]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[29]~input_o\,
	datab => \i_regDataA[29]~input_o\,
	datac => \w_ALUResult[29]~176_combout\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[29]~177_combout\);

-- Location: LCCOMB_X65_Y1_N0
\w_ALUResult[29]~178\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[29]~178_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[29]~input_o\) # ((\i_regDataA[29]~input_o\)))) # (!\i_Op_ORS~input_o\ & (((\w_ALUResult[29]~177_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[29]~input_o\,
	datab => \i_regDataA[29]~input_o\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[29]~177_combout\,
	combout => \w_ALUResult[29]~178_combout\);

-- Location: LCCOMB_X65_Y1_N20
\w_ALUResult[29]~179\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[29]~179_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[29]~input_o\ & (\i_regDataA[29]~input_o\))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[29]~178_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[29]~input_o\,
	datab => \i_regDataA[29]~input_o\,
	datac => \i_Op_ARS~input_o\,
	datad => \w_ALUResult[29]~178_combout\,
	combout => \w_ALUResult[29]~179_combout\);

-- Location: LCCOMB_X67_Y1_N26
\Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (\i_regDataB[29]~input_o\ & ((\i_regDataA[29]~input_o\ & (\Add0~57\ & VCC)) # (!\i_regDataA[29]~input_o\ & (!\Add0~57\)))) # (!\i_regDataB[29]~input_o\ & ((\i_regDataA[29]~input_o\ & (!\Add0~57\)) # (!\i_regDataA[29]~input_o\ & 
-- ((\Add0~57\) # (GND)))))
-- \Add0~59\ = CARRY((\i_regDataB[29]~input_o\ & (!\i_regDataA[29]~input_o\ & !\Add0~57\)) # (!\i_regDataB[29]~input_o\ & ((!\Add0~57\) # (!\i_regDataA[29]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[29]~input_o\,
	datab => \i_regDataA[29]~input_o\,
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

-- Location: LCCOMB_X66_Y1_N16
\w_ALUResult[29]~180\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[29]~180_combout\ = (\i_Op_ADS~input_o\ & ((\Add0~58_combout\))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[29]~179_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_ADS~input_o\,
	datab => \w_ALUResult[29]~179_combout\,
	datad => \Add0~58_combout\,
	combout => \w_ALUResult[29]~180_combout\);

-- Location: LCCOMB_X66_Y1_N24
\w_ALUResult[29]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(29) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[29]~180_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(29),
	datac => \w_ALUResult[29]~180_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(29));

-- Location: IOIBUF_X60_Y0_N8
\i_regDataB[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(30),
	o => \i_regDataB[30]~input_o\);

-- Location: LCCOMB_X65_Y1_N2
\w_ALUResult[30]~181\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[30]~181_combout\ = (!\i_Op_XRS~input_o\ & ((\w_ALUResult[1]~13_combout\ & (\i_regDataA[29]~input_o\)) # (!\w_ALUResult[1]~13_combout\ & ((\i_regDataA[31]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[1]~13_combout\,
	datab => \i_regDataA[29]~input_o\,
	datac => \i_regDataA[31]~input_o\,
	datad => \i_Op_XRS~input_o\,
	combout => \w_ALUResult[30]~181_combout\);

-- Location: LCCOMB_X65_Y1_N16
\w_ALUResult[30]~182\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[30]~182_combout\ = (\w_ALUResult[30]~181_combout\) # ((\i_Op_XRS~input_o\ & (\i_regDataA[30]~input_o\ $ (\i_regDataB[30]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[30]~input_o\,
	datab => \i_Op_XRS~input_o\,
	datac => \i_regDataB[30]~input_o\,
	datad => \w_ALUResult[30]~181_combout\,
	combout => \w_ALUResult[30]~182_combout\);

-- Location: LCCOMB_X65_Y1_N14
\w_ALUResult[30]~183\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[30]~183_combout\ = (\i_Op_ORS~input_o\ & ((\i_regDataB[30]~input_o\) # ((\i_regDataA[30]~input_o\)))) # (!\i_Op_ORS~input_o\ & (((\w_ALUResult[30]~182_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[30]~input_o\,
	datab => \w_ALUResult[30]~182_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \i_regDataA[30]~input_o\,
	combout => \w_ALUResult[30]~183_combout\);

-- Location: LCCOMB_X65_Y1_N8
\w_ALUResult[30]~184\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[30]~184_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataB[30]~input_o\ & ((\i_regDataA[30]~input_o\)))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[30]~183_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[30]~input_o\,
	datab => \i_Op_ARS~input_o\,
	datac => \w_ALUResult[30]~183_combout\,
	datad => \i_regDataA[30]~input_o\,
	combout => \w_ALUResult[30]~184_combout\);

-- Location: LCCOMB_X67_Y1_N28
\Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = ((\i_regDataA[30]~input_o\ $ (\i_regDataB[30]~input_o\ $ (!\Add0~59\)))) # (GND)
-- \Add0~61\ = CARRY((\i_regDataA[30]~input_o\ & ((\i_regDataB[30]~input_o\) # (!\Add0~59\))) # (!\i_regDataA[30]~input_o\ & (\i_regDataB[30]~input_o\ & !\Add0~59\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[30]~input_o\,
	datab => \i_regDataB[30]~input_o\,
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

-- Location: LCCOMB_X66_Y1_N20
\w_ALUResult[30]~185\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[30]~185_combout\ = (\i_Op_ADS~input_o\ & ((\Add0~60_combout\))) # (!\i_Op_ADS~input_o\ & (\w_ALUResult[30]~184_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[30]~184_combout\,
	datab => \Add0~60_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[30]~185_combout\);

-- Location: LCCOMB_X66_Y1_N18
\w_ALUResult[30]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(30) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[30]~185_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(30),
	datac => \w_ALUResult[31]~7clkctrl_outclk\,
	datad => \w_ALUResult[30]~185_combout\,
	combout => w_ALUResult(30));

-- Location: IOIBUF_X47_Y0_N1
\i_regDataB[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_regDataB(31),
	o => \i_regDataB[31]~input_o\);

-- Location: LCCOMB_X67_Y1_N30
\Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = \i_regDataA[31]~input_o\ $ (\i_regDataB[31]~input_o\ $ (\Add0~61\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011010010110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[31]~input_o\,
	datab => \i_regDataB[31]~input_o\,
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

-- Location: LCCOMB_X66_Y4_N12
\w_ALUResult[31]~186\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~186_combout\ = (\w_ALUResult[31]~6_combout\ & ((\i_Op_RR1~input_o\ & ((\i_regDataA[0]~input_o\))) # (!\i_Op_RR1~input_o\ & (\i_regDataA[31]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[31]~input_o\,
	datab => \w_ALUResult[31]~6_combout\,
	datac => \i_Op_RR1~input_o\,
	datad => \i_regDataA[0]~input_o\,
	combout => \w_ALUResult[31]~186_combout\);

-- Location: LCCOMB_X66_Y4_N22
\w_ALUResult[31]~188\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~188_combout\ = (\i_regDataA[30]~input_o\ & ((\i_Op_LS1~input_o\) # ((\i_Op_LR1~input_o\ & !\i_Op_RS1~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_LR1~input_o\,
	datab => \i_Op_LS1~input_o\,
	datac => \i_regDataA[30]~input_o\,
	datad => \i_Op_RS1~input_o\,
	combout => \w_ALUResult[31]~188_combout\);

-- Location: LCCOMB_X66_Y4_N18
\w_ALUResult[31]~187\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~187_combout\ = (\i_regDataB[31]~input_o\ & ((\i_Op_ORS~input_o\) # (!\i_regDataA[31]~input_o\))) # (!\i_regDataB[31]~input_o\ & ((\i_regDataA[31]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \i_Op_ORS~input_o\,
	datac => \i_regDataB[31]~input_o\,
	datad => \i_regDataA[31]~input_o\,
	combout => \w_ALUResult[31]~187_combout\);

-- Location: LCCOMB_X66_Y4_N16
\w_ALUResult[31]~189\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~189_combout\ = (\i_Op_XRS~input_o\ & ((\w_ALUResult[31]~187_combout\))) # (!\i_Op_XRS~input_o\ & (\w_ALUResult[31]~188_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_Op_XRS~input_o\,
	datac => \w_ALUResult[31]~188_combout\,
	datad => \w_ALUResult[31]~187_combout\,
	combout => \w_ALUResult[31]~189_combout\);

-- Location: LCCOMB_X66_Y4_N8
\w_ALUResult[31]~190\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~190_combout\ = (\i_Op_ORS~input_o\ & (((\w_ALUResult[31]~187_combout\)))) # (!\i_Op_ORS~input_o\ & ((\w_ALUResult[31]~186_combout\) # ((\w_ALUResult[31]~189_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \w_ALUResult[31]~186_combout\,
	datab => \w_ALUResult[31]~189_combout\,
	datac => \i_Op_ORS~input_o\,
	datad => \w_ALUResult[31]~187_combout\,
	combout => \w_ALUResult[31]~190_combout\);

-- Location: LCCOMB_X66_Y4_N14
\w_ALUResult[31]~191\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~191_combout\ = (\i_Op_ARS~input_o\ & (\i_regDataA[31]~input_o\ & ((\i_regDataB[31]~input_o\)))) # (!\i_Op_ARS~input_o\ & (((\w_ALUResult[31]~190_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[31]~input_o\,
	datab => \w_ALUResult[31]~190_combout\,
	datac => \i_regDataB[31]~input_o\,
	datad => \i_Op_ARS~input_o\,
	combout => \w_ALUResult[31]~191_combout\);

-- Location: LCCOMB_X66_Y1_N26
\w_ALUResult[31]~192\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_ALUResult[31]~192_combout\ = (\i_Op_ADS~input_o\ & (\Add0~62_combout\)) # (!\i_Op_ADS~input_o\ & ((\w_ALUResult[31]~191_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~62_combout\,
	datab => \w_ALUResult[31]~191_combout\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_ALUResult[31]~192_combout\);

-- Location: LCCOMB_X66_Y1_N12
\w_ALUResult[31]\ : cycloneive_lcell_comb
-- Equation(s):
-- w_ALUResult(31) = (GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & ((\w_ALUResult[31]~192_combout\))) # (!GLOBAL(\w_ALUResult[31]~7clkctrl_outclk\) & (w_ALUResult(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(31),
	datac => \w_ALUResult[31]~192_combout\,
	datad => \w_ALUResult[31]~7clkctrl_outclk\,
	combout => w_ALUResult(31));

-- Location: LCCOMB_X68_Y1_N12
\Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!w_ALUResult(17) & (!w_ALUResult(18) & (!w_ALUResult(20) & !w_ALUResult(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(17),
	datab => w_ALUResult(18),
	datac => w_ALUResult(20),
	datad => w_ALUResult(19),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X68_Y4_N12
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!w_ALUResult(8) & (!w_ALUResult(5) & (!w_ALUResult(7) & !w_ALUResult(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(8),
	datab => w_ALUResult(5),
	datac => w_ALUResult(7),
	datad => w_ALUResult(6),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X69_Y3_N16
\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!w_ALUResult(13) & (!w_ALUResult(16) & (!w_ALUResult(14) & !w_ALUResult(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(13),
	datab => w_ALUResult(16),
	datac => w_ALUResult(14),
	datad => w_ALUResult(15),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X66_Y3_N24
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!w_ALUResult(11) & (!w_ALUResult(12) & (!w_ALUResult(10) & !w_ALUResult(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(11),
	datab => w_ALUResult(12),
	datac => w_ALUResult(10),
	datad => w_ALUResult(9),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X69_Y3_N18
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!w_ALUResult(1) & (!w_ALUResult(2) & (!w_ALUResult(4) & !w_ALUResult(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(1),
	datab => w_ALUResult(2),
	datac => w_ALUResult(4),
	datad => w_ALUResult(3),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X69_Y3_N28
\Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~1_combout\ & (\Equal0~3_combout\ & (\Equal0~2_combout\ & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~3_combout\,
	datac => \Equal0~2_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X66_Y1_N28
\Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (!w_ALUResult(25) & (!w_ALUResult(28) & (!w_ALUResult(27) & !w_ALUResult(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(25),
	datab => w_ALUResult(28),
	datac => w_ALUResult(27),
	datad => w_ALUResult(26),
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X66_Y1_N4
\Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (!w_ALUResult(31) & (\Equal0~7_combout\ & (!w_ALUResult(29) & !w_ALUResult(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(31),
	datab => \Equal0~7_combout\,
	datac => w_ALUResult(29),
	datad => w_ALUResult(30),
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X70_Y1_N28
\Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!w_ALUResult(24) & (!w_ALUResult(21) & (!w_ALUResult(23) & !w_ALUResult(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => w_ALUResult(24),
	datab => w_ALUResult(21),
	datac => w_ALUResult(23),
	datad => w_ALUResult(22),
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X69_Y1_N14
\Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\Equal0~5_combout\ & (\Equal0~4_combout\ & (\Equal0~8_combout\ & \Equal0~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \Equal0~4_combout\,
	datac => \Equal0~8_combout\,
	datad => \Equal0~6_combout\,
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X70_Y1_N0
\Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~10_combout\ = (!w_ALUResult(0) & \Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(0),
	datad => \Equal0~9_combout\,
	combout => \Equal0~10_combout\);

-- Location: LCCOMB_X70_Y1_N24
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (w_ALUResult(0) & \Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => w_ALUResult(0),
	datad => \Equal0~9_combout\,
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X65_Y1_N26
\w_CarrySet~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_CarrySet~0_combout\ = (\i_regDataA[31]~input_o\ & (\i_regDataB[31]~input_o\ & \i_Op_ADS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[31]~input_o\,
	datab => \i_regDataB[31]~input_o\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_CarrySet~0_combout\);

-- Location: LCCOMB_X65_Y1_N18
\w_CarryClear~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \w_CarryClear~0_combout\ = (\i_Op_ADS~input_o\ & ((!\i_regDataB[31]~input_o\) # (!\i_regDataA[31]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[31]~input_o\,
	datab => \i_regDataB[31]~input_o\,
	datad => \i_Op_ADS~input_o\,
	combout => \w_CarryClear~0_combout\);

-- Location: LCCOMB_X65_Y1_N24
\Equal2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~18_combout\ = (\i_regDataA[31]~input_o\ & (\i_regDataB[31]~input_o\ & (\i_regDataB[30]~input_o\ $ (!\i_regDataA[30]~input_o\)))) # (!\i_regDataA[31]~input_o\ & (!\i_regDataB[31]~input_o\ & (\i_regDataB[30]~input_o\ $ (!\i_regDataA[30]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[31]~input_o\,
	datab => \i_regDataB[31]~input_o\,
	datac => \i_regDataB[30]~input_o\,
	datad => \i_regDataA[30]~input_o\,
	combout => \Equal2~18_combout\);

-- Location: LCCOMB_X65_Y2_N22
\Equal2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~16_combout\ = (\i_regDataB[27]~input_o\ & (\i_regDataA[27]~input_o\ & (\i_regDataA[26]~input_o\ $ (!\i_regDataB[26]~input_o\)))) # (!\i_regDataB[27]~input_o\ & (!\i_regDataA[27]~input_o\ & (\i_regDataA[26]~input_o\ $ (!\i_regDataB[26]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[27]~input_o\,
	datab => \i_regDataA[26]~input_o\,
	datac => \i_regDataA[27]~input_o\,
	datad => \i_regDataB[26]~input_o\,
	combout => \Equal2~16_combout\);

-- Location: LCCOMB_X65_Y1_N30
\Equal2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~17_combout\ = (\i_regDataB[29]~input_o\ & (\i_regDataA[29]~input_o\ & (\i_regDataA[28]~input_o\ $ (!\i_regDataB[28]~input_o\)))) # (!\i_regDataB[29]~input_o\ & (!\i_regDataA[29]~input_o\ & (\i_regDataA[28]~input_o\ $ (!\i_regDataB[28]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[29]~input_o\,
	datab => \i_regDataA[28]~input_o\,
	datac => \i_regDataB[28]~input_o\,
	datad => \i_regDataA[29]~input_o\,
	combout => \Equal2~17_combout\);

-- Location: LCCOMB_X69_Y4_N14
\Equal2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~15_combout\ = (\i_regDataA[24]~input_o\ & (\i_regDataB[24]~input_o\ & (\i_regDataA[25]~input_o\ $ (!\i_regDataB[25]~input_o\)))) # (!\i_regDataA[24]~input_o\ & (!\i_regDataB[24]~input_o\ & (\i_regDataA[25]~input_o\ $ (!\i_regDataB[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[24]~input_o\,
	datab => \i_regDataA[25]~input_o\,
	datac => \i_regDataB[25]~input_o\,
	datad => \i_regDataB[24]~input_o\,
	combout => \Equal2~15_combout\);

-- Location: LCCOMB_X65_Y4_N14
\Equal2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~19_combout\ = (\Equal2~18_combout\ & (\Equal2~16_combout\ & (\Equal2~17_combout\ & \Equal2~15_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~18_combout\,
	datab => \Equal2~16_combout\,
	datac => \Equal2~17_combout\,
	datad => \Equal2~15_combout\,
	combout => \Equal2~19_combout\);

-- Location: LCCOMB_X66_Y4_N0
\Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (\i_regDataA[1]~input_o\ & (\i_regDataB[1]~input_o\ & (\i_regDataB[0]~input_o\ $ (!\i_regDataA[0]~input_o\)))) # (!\i_regDataA[1]~input_o\ & (!\i_regDataB[1]~input_o\ & (\i_regDataB[0]~input_o\ $ (!\i_regDataA[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[1]~input_o\,
	datab => \i_regDataB[1]~input_o\,
	datac => \i_regDataB[0]~input_o\,
	datad => \i_regDataA[0]~input_o\,
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X67_Y4_N8
\Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~3_combout\ = (\i_regDataB[6]~input_o\ & (\i_regDataA[6]~input_o\ & (\i_regDataA[7]~input_o\ $ (!\i_regDataB[7]~input_o\)))) # (!\i_regDataB[6]~input_o\ & (!\i_regDataA[6]~input_o\ & (\i_regDataA[7]~input_o\ $ (!\i_regDataB[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[6]~input_o\,
	datab => \i_regDataA[7]~input_o\,
	datac => \i_regDataB[7]~input_o\,
	datad => \i_regDataA[6]~input_o\,
	combout => \Equal2~3_combout\);

-- Location: LCCOMB_X68_Y3_N6
\Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~2_combout\ = (\i_regDataA[4]~input_o\ & (\i_regDataB[4]~input_o\ & (\i_regDataB[5]~input_o\ $ (!\i_regDataA[5]~input_o\)))) # (!\i_regDataA[4]~input_o\ & (!\i_regDataB[4]~input_o\ & (\i_regDataB[5]~input_o\ $ (!\i_regDataA[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[4]~input_o\,
	datab => \i_regDataB[5]~input_o\,
	datac => \i_regDataB[4]~input_o\,
	datad => \i_regDataA[5]~input_o\,
	combout => \Equal2~2_combout\);

-- Location: LCCOMB_X67_Y3_N24
\Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (\i_regDataA[2]~input_o\ & (\i_regDataB[2]~input_o\ & (\i_regDataA[3]~input_o\ $ (!\i_regDataB[3]~input_o\)))) # (!\i_regDataA[2]~input_o\ & (!\i_regDataB[2]~input_o\ & (\i_regDataA[3]~input_o\ $ (!\i_regDataB[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataA[2]~input_o\,
	datab => \i_regDataB[2]~input_o\,
	datac => \i_regDataA[3]~input_o\,
	datad => \i_regDataB[3]~input_o\,
	combout => \Equal2~1_combout\);

-- Location: LCCOMB_X67_Y4_N26
\Equal2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~4_combout\ = (\Equal2~0_combout\ & (\Equal2~3_combout\ & (\Equal2~2_combout\ & \Equal2~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~0_combout\,
	datab => \Equal2~3_combout\,
	datac => \Equal2~2_combout\,
	datad => \Equal2~1_combout\,
	combout => \Equal2~4_combout\);

-- Location: LCCOMB_X66_Y2_N10
\Equal2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~6_combout\ = (\i_regDataB[10]~input_o\ & (\i_regDataA[10]~input_o\ & (\i_regDataB[11]~input_o\ $ (!\i_regDataA[11]~input_o\)))) # (!\i_regDataB[10]~input_o\ & (!\i_regDataA[10]~input_o\ & (\i_regDataB[11]~input_o\ $ (!\i_regDataA[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[10]~input_o\,
	datab => \i_regDataA[10]~input_o\,
	datac => \i_regDataB[11]~input_o\,
	datad => \i_regDataA[11]~input_o\,
	combout => \Equal2~6_combout\);

-- Location: LCCOMB_X68_Y2_N2
\Equal2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~7_combout\ = (\i_regDataB[12]~input_o\ & (\i_regDataA[12]~input_o\ & (\i_regDataB[13]~input_o\ $ (!\i_regDataA[13]~input_o\)))) # (!\i_regDataB[12]~input_o\ & (!\i_regDataA[12]~input_o\ & (\i_regDataB[13]~input_o\ $ (!\i_regDataA[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[12]~input_o\,
	datab => \i_regDataB[13]~input_o\,
	datac => \i_regDataA[12]~input_o\,
	datad => \i_regDataA[13]~input_o\,
	combout => \Equal2~7_combout\);

-- Location: LCCOMB_X66_Y3_N14
\Equal2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~5_combout\ = (\i_regDataB[8]~input_o\ & (\i_regDataA[8]~input_o\ & (\i_regDataA[9]~input_o\ $ (!\i_regDataB[9]~input_o\)))) # (!\i_regDataB[8]~input_o\ & (!\i_regDataA[8]~input_o\ & (\i_regDataA[9]~input_o\ $ (!\i_regDataB[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[8]~input_o\,
	datab => \i_regDataA[9]~input_o\,
	datac => \i_regDataB[9]~input_o\,
	datad => \i_regDataA[8]~input_o\,
	combout => \Equal2~5_combout\);

-- Location: LCCOMB_X69_Y2_N16
\Equal2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~8_combout\ = (\i_regDataB[15]~input_o\ & (\i_regDataA[15]~input_o\ & (\i_regDataA[14]~input_o\ $ (!\i_regDataB[14]~input_o\)))) # (!\i_regDataB[15]~input_o\ & (!\i_regDataA[15]~input_o\ & (\i_regDataA[14]~input_o\ $ (!\i_regDataB[14]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[15]~input_o\,
	datab => \i_regDataA[14]~input_o\,
	datac => \i_regDataB[14]~input_o\,
	datad => \i_regDataA[15]~input_o\,
	combout => \Equal2~8_combout\);

-- Location: LCCOMB_X66_Y2_N26
\Equal2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~9_combout\ = (\Equal2~6_combout\ & (\Equal2~7_combout\ & (\Equal2~5_combout\ & \Equal2~8_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~6_combout\,
	datab => \Equal2~7_combout\,
	datac => \Equal2~5_combout\,
	datad => \Equal2~8_combout\,
	combout => \Equal2~9_combout\);

-- Location: LCCOMB_X69_Y1_N4
\Equal2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~11_combout\ = (\i_regDataB[19]~input_o\ & (\i_regDataA[19]~input_o\ & (\i_regDataB[18]~input_o\ $ (!\i_regDataA[18]~input_o\)))) # (!\i_regDataB[19]~input_o\ & (!\i_regDataA[19]~input_o\ & (\i_regDataB[18]~input_o\ $ (!\i_regDataA[18]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[19]~input_o\,
	datab => \i_regDataA[19]~input_o\,
	datac => \i_regDataB[18]~input_o\,
	datad => \i_regDataA[18]~input_o\,
	combout => \Equal2~11_combout\);

-- Location: LCCOMB_X69_Y2_N14
\Equal2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~10_combout\ = (\i_regDataB[16]~input_o\ & (\i_regDataA[16]~input_o\ & (\i_regDataA[17]~input_o\ $ (!\i_regDataB[17]~input_o\)))) # (!\i_regDataB[16]~input_o\ & (!\i_regDataA[16]~input_o\ & (\i_regDataA[17]~input_o\ $ (!\i_regDataB[17]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[16]~input_o\,
	datab => \i_regDataA[16]~input_o\,
	datac => \i_regDataA[17]~input_o\,
	datad => \i_regDataB[17]~input_o\,
	combout => \Equal2~10_combout\);

-- Location: LCCOMB_X69_Y1_N26
\Equal2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~12_combout\ = (\i_regDataB[20]~input_o\ & (\i_regDataA[20]~input_o\ & (\i_regDataB[21]~input_o\ $ (!\i_regDataA[21]~input_o\)))) # (!\i_regDataB[20]~input_o\ & (!\i_regDataA[20]~input_o\ & (\i_regDataB[21]~input_o\ $ (!\i_regDataA[21]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[20]~input_o\,
	datab => \i_regDataA[20]~input_o\,
	datac => \i_regDataB[21]~input_o\,
	datad => \i_regDataA[21]~input_o\,
	combout => \Equal2~12_combout\);

-- Location: LCCOMB_X69_Y4_N10
\Equal2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~13_combout\ = (\i_regDataB[22]~input_o\ & (\i_regDataA[22]~input_o\ & (\i_regDataB[23]~input_o\ $ (!\i_regDataA[23]~input_o\)))) # (!\i_regDataB[22]~input_o\ & (!\i_regDataA[22]~input_o\ & (\i_regDataB[23]~input_o\ $ (!\i_regDataA[23]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \i_regDataB[22]~input_o\,
	datab => \i_regDataB[23]~input_o\,
	datac => \i_regDataA[22]~input_o\,
	datad => \i_regDataA[23]~input_o\,
	combout => \Equal2~13_combout\);

-- Location: LCCOMB_X69_Y4_N8
\Equal2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~14_combout\ = (\Equal2~11_combout\ & (\Equal2~10_combout\ & (\Equal2~12_combout\ & \Equal2~13_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~11_combout\,
	datab => \Equal2~10_combout\,
	datac => \Equal2~12_combout\,
	datad => \Equal2~13_combout\,
	combout => \Equal2~14_combout\);

-- Location: LCCOMB_X66_Y4_N6
\Equal2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~20_combout\ = (\Equal2~19_combout\ & (\Equal2~4_combout\ & (\Equal2~9_combout\ & \Equal2~14_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~19_combout\,
	datab => \Equal2~4_combout\,
	datac => \Equal2~9_combout\,
	datad => \Equal2~14_combout\,
	combout => \Equal2~20_combout\);

-- Location: IOIBUF_X0_Y36_N15
\i_Op_MUL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_MUL,
	o => \i_Op_MUL~input_o\);

-- Location: IOIBUF_X0_Y36_N22
\i_Op_CMP~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_i_Op_CMP,
	o => \i_Op_CMP~input_o\);

ww_o_ALUDataOut(0) <= \o_ALUDataOut[0]~output_o\;

ww_o_ALUDataOut(1) <= \o_ALUDataOut[1]~output_o\;

ww_o_ALUDataOut(2) <= \o_ALUDataOut[2]~output_o\;

ww_o_ALUDataOut(3) <= \o_ALUDataOut[3]~output_o\;

ww_o_ALUDataOut(4) <= \o_ALUDataOut[4]~output_o\;

ww_o_ALUDataOut(5) <= \o_ALUDataOut[5]~output_o\;

ww_o_ALUDataOut(6) <= \o_ALUDataOut[6]~output_o\;

ww_o_ALUDataOut(7) <= \o_ALUDataOut[7]~output_o\;

ww_o_ALUDataOut(8) <= \o_ALUDataOut[8]~output_o\;

ww_o_ALUDataOut(9) <= \o_ALUDataOut[9]~output_o\;

ww_o_ALUDataOut(10) <= \o_ALUDataOut[10]~output_o\;

ww_o_ALUDataOut(11) <= \o_ALUDataOut[11]~output_o\;

ww_o_ALUDataOut(12) <= \o_ALUDataOut[12]~output_o\;

ww_o_ALUDataOut(13) <= \o_ALUDataOut[13]~output_o\;

ww_o_ALUDataOut(14) <= \o_ALUDataOut[14]~output_o\;

ww_o_ALUDataOut(15) <= \o_ALUDataOut[15]~output_o\;

ww_o_ALUDataOut(16) <= \o_ALUDataOut[16]~output_o\;

ww_o_ALUDataOut(17) <= \o_ALUDataOut[17]~output_o\;

ww_o_ALUDataOut(18) <= \o_ALUDataOut[18]~output_o\;

ww_o_ALUDataOut(19) <= \o_ALUDataOut[19]~output_o\;

ww_o_ALUDataOut(20) <= \o_ALUDataOut[20]~output_o\;

ww_o_ALUDataOut(21) <= \o_ALUDataOut[21]~output_o\;

ww_o_ALUDataOut(22) <= \o_ALUDataOut[22]~output_o\;

ww_o_ALUDataOut(23) <= \o_ALUDataOut[23]~output_o\;

ww_o_ALUDataOut(24) <= \o_ALUDataOut[24]~output_o\;

ww_o_ALUDataOut(25) <= \o_ALUDataOut[25]~output_o\;

ww_o_ALUDataOut(26) <= \o_ALUDataOut[26]~output_o\;

ww_o_ALUDataOut(27) <= \o_ALUDataOut[27]~output_o\;

ww_o_ALUDataOut(28) <= \o_ALUDataOut[28]~output_o\;

ww_o_ALUDataOut(29) <= \o_ALUDataOut[29]~output_o\;

ww_o_ALUDataOut(30) <= \o_ALUDataOut[30]~output_o\;

ww_o_ALUDataOut(31) <= \o_ALUDataOut[31]~output_o\;

ww_o_CondCodeBits(0) <= \o_CondCodeBits[0]~output_o\;

ww_o_CondCodeBits(1) <= \o_CondCodeBits[1]~output_o\;

ww_o_CondCodeBits(2) <= \o_CondCodeBits[2]~output_o\;

ww_o_CondCodeBits(3) <= \o_CondCodeBits[3]~output_o\;

ww_o_CondCodeBits(4) <= \o_CondCodeBits[4]~output_o\;

ww_o_CondCodeBits(5) <= \o_CondCodeBits[5]~output_o\;

ww_o_CondCodeBits(6) <= \o_CondCodeBits[6]~output_o\;

ww_o_CondCodeBits(7) <= \o_CondCodeBits[7]~output_o\;

ww_o_CondCodeBits(8) <= \o_CondCodeBits[8]~output_o\;

ww_o_CondCodeBits(9) <= \o_CondCodeBits[9]~output_o\;

ww_o_CondCodeBits(10) <= \o_CondCodeBits[10]~output_o\;

ww_o_CondCodeBits(11) <= \o_CondCodeBits[11]~output_o\;

ww_o_CondCodeBits(12) <= \o_CondCodeBits[12]~output_o\;

ww_o_CondCodeBits(13) <= \o_CondCodeBits[13]~output_o\;

ww_o_CondCodeBits(14) <= \o_CondCodeBits[14]~output_o\;

ww_o_CondCodeBits(15) <= \o_CondCodeBits[15]~output_o\;

ww_o_CondCodeBits(16) <= \o_CondCodeBits[16]~output_o\;

ww_o_CondCodeBits(17) <= \o_CondCodeBits[17]~output_o\;

ww_o_CondCodeBits(18) <= \o_CondCodeBits[18]~output_o\;

ww_o_CondCodeBits(19) <= \o_CondCodeBits[19]~output_o\;

ww_o_CondCodeBits(20) <= \o_CondCodeBits[20]~output_o\;

ww_o_CondCodeBits(21) <= \o_CondCodeBits[21]~output_o\;

ww_o_CondCodeBits(22) <= \o_CondCodeBits[22]~output_o\;

ww_o_CondCodeBits(23) <= \o_CondCodeBits[23]~output_o\;

ww_o_CondCodeBits(24) <= \o_CondCodeBits[24]~output_o\;

ww_o_CondCodeBits(25) <= \o_CondCodeBits[25]~output_o\;

ww_o_CondCodeBits(26) <= \o_CondCodeBits[26]~output_o\;

ww_o_CondCodeBits(27) <= \o_CondCodeBits[27]~output_o\;

ww_o_CondCodeBits(28) <= \o_CondCodeBits[28]~output_o\;

ww_o_CondCodeBits(29) <= \o_CondCodeBits[29]~output_o\;

ww_o_CondCodeBits(30) <= \o_CondCodeBits[30]~output_o\;

ww_o_CondCodeBits(31) <= \o_CondCodeBits[31]~output_o\;
END structure;


