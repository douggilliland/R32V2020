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

-- DATE "05/05/2019 20:20:34"

-- 
-- Device: Altera EP4CE6F17C6 Package FBGA256
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
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_C1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_D2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_H1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_H2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_F16,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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
	Op_ADS : IN std_logic;
	Op_MUL : IN std_logic;
	Op_CMP : IN std_logic;
	Op_ARS : IN std_logic;
	Op_XRS : IN std_logic;
	Op_ORS : IN std_logic;
	Op_LS1 : IN std_logic;
	Op_RS1 : IN std_logic;
	Op_LR1 : IN std_logic;
	Op_RR1 : IN std_logic;
	Op_RA1 : IN std_logic;
	regDataA : IN std_logic_vector(31 DOWNTO 0);
	regDataB : IN std_logic_vector(31 DOWNTO 0);
	ALUDataOut : OUT std_logic_vector(31 DOWNTO 0);
	CondCodeBits : OUT std_logic_vector(31 DOWNTO 0)
	);
END ALU;

-- Design Ports Information
-- Op_MUL	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_CMP	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[0]	=>  Location: PIN_L13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[1]	=>  Location: PIN_P11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[2]	=>  Location: PIN_R13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[3]	=>  Location: PIN_E9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[4]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[5]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[6]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[7]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[8]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[9]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[10]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[11]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[12]	=>  Location: PIN_B5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[13]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[14]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[15]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[16]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[17]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[18]	=>  Location: PIN_N16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[19]	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[20]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[21]	=>  Location: PIN_R11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[22]	=>  Location: PIN_M10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[23]	=>  Location: PIN_T13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[24]	=>  Location: PIN_T15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[25]	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[26]	=>  Location: PIN_R9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[27]	=>  Location: PIN_T11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[28]	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[29]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[30]	=>  Location: PIN_T5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[31]	=>  Location: PIN_R5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[0]	=>  Location: PIN_L10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[1]	=>  Location: PIN_A15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[2]	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[3]	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[4]	=>  Location: PIN_F6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[5]	=>  Location: PIN_A13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[6]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[7]	=>  Location: PIN_A2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[8]	=>  Location: PIN_L15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[9]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[10]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[11]	=>  Location: PIN_A14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[12]	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[13]	=>  Location: PIN_F9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[14]	=>  Location: PIN_K15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[15]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[16]	=>  Location: PIN_B13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[17]	=>  Location: PIN_B16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[18]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[19]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[20]	=>  Location: PIN_J11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[21]	=>  Location: PIN_M12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[22]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[23]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[24]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[25]	=>  Location: PIN_D3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[26]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[27]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[28]	=>  Location: PIN_B1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[29]	=>  Location: PIN_E6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[30]	=>  Location: PIN_B12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CondCodeBits[31]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ADS	=>  Location: PIN_T7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[31]	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[31]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[0]	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[1]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[1]	=>  Location: PIN_T10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[0]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[4]	=>  Location: PIN_R16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[5]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[5]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[4]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[6]	=>  Location: PIN_K6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[6]	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[7]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[7]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[2]	=>  Location: PIN_R10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[2]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[3]	=>  Location: PIN_R12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[3]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[8]	=>  Location: PIN_M7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[9]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[9]	=>  Location: PIN_A5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[8]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[10]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[10]	=>  Location: PIN_P15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[11]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[11]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[12]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[13]	=>  Location: PIN_N14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[13]	=>  Location: PIN_L16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[12]	=>  Location: PIN_M8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[14]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[14]	=>  Location: PIN_P16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[15]	=>  Location: PIN_L8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[15]	=>  Location: PIN_L6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[16]	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[17]	=>  Location: PIN_T6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[17]	=>  Location: PIN_R6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[16]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[18]	=>  Location: PIN_L12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[18]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[19]	=>  Location: PIN_R7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[19]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[20]	=>  Location: PIN_N15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[21]	=>  Location: PIN_P14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[21]	=>  Location: PIN_P9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[20]	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[22]	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[22]	=>  Location: PIN_T14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[23]	=>  Location: PIN_T12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[23]	=>  Location: PIN_R14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[24]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[25]	=>  Location: PIN_R8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[25]	=>  Location: PIN_B9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[24]	=>  Location: PIN_A9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[26]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[26]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[27]	=>  Location: PIN_T8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[27]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[30]	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[30]	=>  Location: PIN_P6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[28]	=>  Location: PIN_T9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[28]	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[29]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[29]	=>  Location: PIN_K16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_XRS	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ARS	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ORS	=>  Location: PIN_P8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LR1	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RS1	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LS1	=>  Location: PIN_L14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RA1	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RR1	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_Op_ADS : std_logic;
SIGNAL ww_Op_MUL : std_logic;
SIGNAL ww_Op_CMP : std_logic;
SIGNAL ww_Op_ARS : std_logic;
SIGNAL ww_Op_XRS : std_logic;
SIGNAL ww_Op_ORS : std_logic;
SIGNAL ww_Op_LS1 : std_logic;
SIGNAL ww_Op_RS1 : std_logic;
SIGNAL ww_Op_LR1 : std_logic;
SIGNAL ww_Op_RR1 : std_logic;
SIGNAL ww_Op_RA1 : std_logic;
SIGNAL ww_regDataA : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_regDataB : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_ALUDataOut : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_CondCodeBits : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALUResult[31]~17clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Op_MUL~input_o\ : std_logic;
SIGNAL \Op_CMP~input_o\ : std_logic;
SIGNAL \ALUDataOut[0]~output_o\ : std_logic;
SIGNAL \ALUDataOut[1]~output_o\ : std_logic;
SIGNAL \ALUDataOut[2]~output_o\ : std_logic;
SIGNAL \ALUDataOut[3]~output_o\ : std_logic;
SIGNAL \ALUDataOut[4]~output_o\ : std_logic;
SIGNAL \ALUDataOut[5]~output_o\ : std_logic;
SIGNAL \ALUDataOut[6]~output_o\ : std_logic;
SIGNAL \ALUDataOut[7]~output_o\ : std_logic;
SIGNAL \ALUDataOut[8]~output_o\ : std_logic;
SIGNAL \ALUDataOut[9]~output_o\ : std_logic;
SIGNAL \ALUDataOut[10]~output_o\ : std_logic;
SIGNAL \ALUDataOut[11]~output_o\ : std_logic;
SIGNAL \ALUDataOut[12]~output_o\ : std_logic;
SIGNAL \ALUDataOut[13]~output_o\ : std_logic;
SIGNAL \ALUDataOut[14]~output_o\ : std_logic;
SIGNAL \ALUDataOut[15]~output_o\ : std_logic;
SIGNAL \ALUDataOut[16]~output_o\ : std_logic;
SIGNAL \ALUDataOut[17]~output_o\ : std_logic;
SIGNAL \ALUDataOut[18]~output_o\ : std_logic;
SIGNAL \ALUDataOut[19]~output_o\ : std_logic;
SIGNAL \ALUDataOut[20]~output_o\ : std_logic;
SIGNAL \ALUDataOut[21]~output_o\ : std_logic;
SIGNAL \ALUDataOut[22]~output_o\ : std_logic;
SIGNAL \ALUDataOut[23]~output_o\ : std_logic;
SIGNAL \ALUDataOut[24]~output_o\ : std_logic;
SIGNAL \ALUDataOut[25]~output_o\ : std_logic;
SIGNAL \ALUDataOut[26]~output_o\ : std_logic;
SIGNAL \ALUDataOut[27]~output_o\ : std_logic;
SIGNAL \ALUDataOut[28]~output_o\ : std_logic;
SIGNAL \ALUDataOut[29]~output_o\ : std_logic;
SIGNAL \ALUDataOut[30]~output_o\ : std_logic;
SIGNAL \ALUDataOut[31]~output_o\ : std_logic;
SIGNAL \CondCodeBits[0]~output_o\ : std_logic;
SIGNAL \CondCodeBits[1]~output_o\ : std_logic;
SIGNAL \CondCodeBits[2]~output_o\ : std_logic;
SIGNAL \CondCodeBits[3]~output_o\ : std_logic;
SIGNAL \CondCodeBits[4]~output_o\ : std_logic;
SIGNAL \CondCodeBits[5]~output_o\ : std_logic;
SIGNAL \CondCodeBits[6]~output_o\ : std_logic;
SIGNAL \CondCodeBits[7]~output_o\ : std_logic;
SIGNAL \CondCodeBits[8]~output_o\ : std_logic;
SIGNAL \CondCodeBits[9]~output_o\ : std_logic;
SIGNAL \CondCodeBits[10]~output_o\ : std_logic;
SIGNAL \CondCodeBits[11]~output_o\ : std_logic;
SIGNAL \CondCodeBits[12]~output_o\ : std_logic;
SIGNAL \CondCodeBits[13]~output_o\ : std_logic;
SIGNAL \CondCodeBits[14]~output_o\ : std_logic;
SIGNAL \CondCodeBits[15]~output_o\ : std_logic;
SIGNAL \CondCodeBits[16]~output_o\ : std_logic;
SIGNAL \CondCodeBits[17]~output_o\ : std_logic;
SIGNAL \CondCodeBits[18]~output_o\ : std_logic;
SIGNAL \CondCodeBits[19]~output_o\ : std_logic;
SIGNAL \CondCodeBits[20]~output_o\ : std_logic;
SIGNAL \CondCodeBits[21]~output_o\ : std_logic;
SIGNAL \CondCodeBits[22]~output_o\ : std_logic;
SIGNAL \CondCodeBits[23]~output_o\ : std_logic;
SIGNAL \CondCodeBits[24]~output_o\ : std_logic;
SIGNAL \CondCodeBits[25]~output_o\ : std_logic;
SIGNAL \CondCodeBits[26]~output_o\ : std_logic;
SIGNAL \CondCodeBits[27]~output_o\ : std_logic;
SIGNAL \CondCodeBits[28]~output_o\ : std_logic;
SIGNAL \CondCodeBits[29]~output_o\ : std_logic;
SIGNAL \CondCodeBits[30]~output_o\ : std_logic;
SIGNAL \CondCodeBits[31]~output_o\ : std_logic;
SIGNAL \regDataA[0]~input_o\ : std_logic;
SIGNAL \regDataB[0]~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Op_XRS~input_o\ : std_logic;
SIGNAL \Op_ADS~input_o\ : std_logic;
SIGNAL \Op_ARS~input_o\ : std_logic;
SIGNAL \Op_ORS~input_o\ : std_logic;
SIGNAL \ALUResult[0]~8_combout\ : std_logic;
SIGNAL \Op_RS1~input_o\ : std_logic;
SIGNAL \Op_LR1~input_o\ : std_logic;
SIGNAL \regDataA[1]~input_o\ : std_logic;
SIGNAL \regDataA[31]~input_o\ : std_logic;
SIGNAL \ALUResult[0]~10_combout\ : std_logic;
SIGNAL \ALUResult[0]~11_combout\ : std_logic;
SIGNAL \ALUResult[0]~9_combout\ : std_logic;
SIGNAL \Op_LS1~input_o\ : std_logic;
SIGNAL \ALUResult[0]~12_combout\ : std_logic;
SIGNAL \ALUResult[0]~13_combout\ : std_logic;
SIGNAL \ALUResult[0]~14_combout\ : std_logic;
SIGNAL \ALUResult[31]~16_combout\ : std_logic;
SIGNAL \Op_RA1~input_o\ : std_logic;
SIGNAL \Op_RR1~input_o\ : std_logic;
SIGNAL \ALUResult[31]~15_combout\ : std_logic;
SIGNAL \ALUResult[31]~17_combout\ : std_logic;
SIGNAL \ALUResult[31]~17clkctrl_outclk\ : std_logic;
SIGNAL \regDataB[1]~input_o\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \ALUResult[30]~18_combout\ : std_logic;
SIGNAL \ALUResult[1]~19_combout\ : std_logic;
SIGNAL \ALUResult[1]~21_combout\ : std_logic;
SIGNAL \regDataA[2]~input_o\ : std_logic;
SIGNAL \ALUResult[1]~20_combout\ : std_logic;
SIGNAL \ALUResult[1]~22_combout\ : std_logic;
SIGNAL \ALUResult[1]~23_combout\ : std_logic;
SIGNAL \regDataA[3]~input_o\ : std_logic;
SIGNAL \ALUResult[2]~28_combout\ : std_logic;
SIGNAL \regDataB[2]~input_o\ : std_logic;
SIGNAL \Equal2~4_combout\ : std_logic;
SIGNAL \ALUResult[2]~29_combout\ : std_logic;
SIGNAL \ALUResult[1]~26_combout\ : std_logic;
SIGNAL \ALUResult[2]~24_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \ALUResult[2]~25_combout\ : std_logic;
SIGNAL \ALUResult[2]~27_combout\ : std_logic;
SIGNAL \ALUResult[2]~30_combout\ : std_logic;
SIGNAL \regDataA[4]~input_o\ : std_logic;
SIGNAL \regDataB[3]~input_o\ : std_logic;
SIGNAL \Equal2~5_combout\ : std_logic;
SIGNAL \ALUResult[3]~33_combout\ : std_logic;
SIGNAL \ALUResult~34_combout\ : std_logic;
SIGNAL \ALUResult[3]~35_combout\ : std_logic;
SIGNAL \ALUResult[3]~31_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \ALUResult[3]~32_combout\ : std_logic;
SIGNAL \ALUResult[3]~36_combout\ : std_logic;
SIGNAL \regDataA[5]~input_o\ : std_logic;
SIGNAL \ALUResult[4]~39_combout\ : std_logic;
SIGNAL \ALUResult[4]~40_combout\ : std_logic;
SIGNAL \regDataB[4]~input_o\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \ALUResult[4]~37_combout\ : std_logic;
SIGNAL \ALUResult[4]~38_combout\ : std_logic;
SIGNAL \ALUResult[4]~41_combout\ : std_logic;
SIGNAL \regDataB[5]~input_o\ : std_logic;
SIGNAL \ALUResult[5]~43_combout\ : std_logic;
SIGNAL \regDataA[6]~input_o\ : std_logic;
SIGNAL \ALUResult[5]~44_combout\ : std_logic;
SIGNAL \ALUResult[5]~45_combout\ : std_logic;
SIGNAL \ALUResult[5]~177_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \ALUResult[5]~42_combout\ : std_logic;
SIGNAL \ALUResult[5]~46_combout\ : std_logic;
SIGNAL \regDataB[6]~input_o\ : std_logic;
SIGNAL \ALUResult[6]~47_combout\ : std_logic;
SIGNAL \ALUResult[6]~48_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \regDataA[7]~input_o\ : std_logic;
SIGNAL \ALUResult[6]~49_combout\ : std_logic;
SIGNAL \ALUResult[6]~50_combout\ : std_logic;
SIGNAL \ALUResult[6]~51_combout\ : std_logic;
SIGNAL \regDataB[7]~input_o\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \ALUResult[7]~53_combout\ : std_logic;
SIGNAL \ALUResult[7]~52_combout\ : std_logic;
SIGNAL \Equal2~2_combout\ : std_logic;
SIGNAL \regDataA[8]~input_o\ : std_logic;
SIGNAL \ALUResult[7]~54_combout\ : std_logic;
SIGNAL \ALUResult~55_combout\ : std_logic;
SIGNAL \ALUResult[7]~56_combout\ : std_logic;
SIGNAL \ALUResult[7]~57_combout\ : std_logic;
SIGNAL \regDataB[8]~input_o\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \ALUResult[8]~59_combout\ : std_logic;
SIGNAL \ALUResult[8]~58_combout\ : std_logic;
SIGNAL \regDataA[9]~input_o\ : std_logic;
SIGNAL \ALUResult[8]~60_combout\ : std_logic;
SIGNAL \ALUResult[8]~61_combout\ : std_logic;
SIGNAL \ALUResult[8]~62_combout\ : std_logic;
SIGNAL \regDataB[9]~input_o\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \ALUResult[9]~63_combout\ : std_logic;
SIGNAL \ALUResult[9]~64_combout\ : std_logic;
SIGNAL \ALUResult[9]~66_combout\ : std_logic;
SIGNAL \regDataA[10]~input_o\ : std_logic;
SIGNAL \ALUResult[9]~65_combout\ : std_logic;
SIGNAL \ALUResult[9]~178_combout\ : std_logic;
SIGNAL \ALUResult[9]~67_combout\ : std_logic;
SIGNAL \regDataB[10]~input_o\ : std_logic;
SIGNAL \ALUResult[10]~68_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \ALUResult[10]~69_combout\ : std_logic;
SIGNAL \regDataA[11]~input_o\ : std_logic;
SIGNAL \ALUResult[10]~70_combout\ : std_logic;
SIGNAL \ALUResult[10]~71_combout\ : std_logic;
SIGNAL \ALUResult[10]~72_combout\ : std_logic;
SIGNAL \regDataB[11]~input_o\ : std_logic;
SIGNAL \ALUResult[11]~73_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \ALUResult[11]~74_combout\ : std_logic;
SIGNAL \regDataA[12]~input_o\ : std_logic;
SIGNAL \Equal2~8_combout\ : std_logic;
SIGNAL \ALUResult[11]~75_combout\ : std_logic;
SIGNAL \ALUResult~76_combout\ : std_logic;
SIGNAL \ALUResult[11]~77_combout\ : std_logic;
SIGNAL \ALUResult[11]~78_combout\ : std_logic;
SIGNAL \regDataB[12]~input_o\ : std_logic;
SIGNAL \ALUResult[12]~79_combout\ : std_logic;
SIGNAL \ALUResult[12]~80_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \regDataA[13]~input_o\ : std_logic;
SIGNAL \ALUResult[12]~81_combout\ : std_logic;
SIGNAL \ALUResult[12]~82_combout\ : std_logic;
SIGNAL \ALUResult[12]~83_combout\ : std_logic;
SIGNAL \regDataB[13]~input_o\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \ALUResult[13]~84_combout\ : std_logic;
SIGNAL \ALUResult[13]~87_combout\ : std_logic;
SIGNAL \regDataA[14]~input_o\ : std_logic;
SIGNAL \ALUResult[13]~86_combout\ : std_logic;
SIGNAL \ALUResult[13]~179_combout\ : std_logic;
SIGNAL \ALUResult[13]~85_combout\ : std_logic;
SIGNAL \ALUResult[13]~88_combout\ : std_logic;
SIGNAL \regDataB[14]~input_o\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \ALUResult[14]~90_combout\ : std_logic;
SIGNAL \ALUResult[14]~89_combout\ : std_logic;
SIGNAL \regDataA[15]~input_o\ : std_logic;
SIGNAL \ALUResult[14]~91_combout\ : std_logic;
SIGNAL \ALUResult[14]~92_combout\ : std_logic;
SIGNAL \ALUResult[14]~93_combout\ : std_logic;
SIGNAL \regDataB[15]~input_o\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \ALUResult[15]~95_combout\ : std_logic;
SIGNAL \ALUResult~97_combout\ : std_logic;
SIGNAL \regDataA[16]~input_o\ : std_logic;
SIGNAL \Equal2~11_combout\ : std_logic;
SIGNAL \ALUResult[15]~96_combout\ : std_logic;
SIGNAL \ALUResult[15]~98_combout\ : std_logic;
SIGNAL \ALUResult[15]~94_combout\ : std_logic;
SIGNAL \ALUResult[15]~99_combout\ : std_logic;
SIGNAL \regDataB[16]~input_o\ : std_logic;
SIGNAL \regDataA[17]~input_o\ : std_logic;
SIGNAL \ALUResult[16]~102_combout\ : std_logic;
SIGNAL \ALUResult[16]~103_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \ALUResult[16]~101_combout\ : std_logic;
SIGNAL \ALUResult[16]~100_combout\ : std_logic;
SIGNAL \ALUResult[16]~104_combout\ : std_logic;
SIGNAL \regDataB[17]~input_o\ : std_logic;
SIGNAL \ALUResult[17]~108_combout\ : std_logic;
SIGNAL \regDataA[18]~input_o\ : std_logic;
SIGNAL \ALUResult[17]~107_combout\ : std_logic;
SIGNAL \ALUResult[17]~180_combout\ : std_logic;
SIGNAL \ALUResult[17]~106_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \ALUResult[17]~105_combout\ : std_logic;
SIGNAL \ALUResult[17]~109_combout\ : std_logic;
SIGNAL \regDataA[19]~input_o\ : std_logic;
SIGNAL \ALUResult[18]~112_combout\ : std_logic;
SIGNAL \regDataB[18]~input_o\ : std_logic;
SIGNAL \ALUResult[18]~113_combout\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \ALUResult[18]~111_combout\ : std_logic;
SIGNAL \ALUResult[18]~110_combout\ : std_logic;
SIGNAL \ALUResult[18]~114_combout\ : std_logic;
SIGNAL \regDataB[19]~input_o\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \ALUResult[19]~116_combout\ : std_logic;
SIGNAL \Equal2~14_combout\ : std_logic;
SIGNAL \regDataA[20]~input_o\ : std_logic;
SIGNAL \ALUResult[19]~115_combout\ : std_logic;
SIGNAL \ALUResult[19]~117_combout\ : std_logic;
SIGNAL \ALUResult[19]~118_combout\ : std_logic;
SIGNAL \ALUResult[19]~119_combout\ : std_logic;
SIGNAL \regDataB[20]~input_o\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \regDataA[21]~input_o\ : std_logic;
SIGNAL \ALUResult[20]~120_combout\ : std_logic;
SIGNAL \ALUResult[20]~121_combout\ : std_logic;
SIGNAL \ALUResult[20]~122_combout\ : std_logic;
SIGNAL \ALUResult[20]~123_combout\ : std_logic;
SIGNAL \regDataB[21]~input_o\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \ALUResult[21]~124_combout\ : std_logic;
SIGNAL \regDataA[22]~input_o\ : std_logic;
SIGNAL \ALUResult[21]~125_combout\ : std_logic;
SIGNAL \ALUResult[21]~126_combout\ : std_logic;
SIGNAL \ALUResult[21]~127_combout\ : std_logic;
SIGNAL \regDataB[22]~input_o\ : std_logic;
SIGNAL \ALUResult[22]~128_combout\ : std_logic;
SIGNAL \ALUResult[22]~129_combout\ : std_logic;
SIGNAL \regDataA[23]~input_o\ : std_logic;
SIGNAL \ALUResult[22]~130_combout\ : std_logic;
SIGNAL \ALUResult[22]~131_combout\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \ALUResult[22]~132_combout\ : std_logic;
SIGNAL \regDataB[23]~input_o\ : std_logic;
SIGNAL \ALUResult[23]~134_combout\ : std_logic;
SIGNAL \ALUResult[23]~135_combout\ : std_logic;
SIGNAL \Equal2~17_combout\ : std_logic;
SIGNAL \regDataA[24]~input_o\ : std_logic;
SIGNAL \ALUResult[23]~133_combout\ : std_logic;
SIGNAL \ALUResult[23]~136_combout\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \ALUResult[23]~137_combout\ : std_logic;
SIGNAL \regDataB[24]~input_o\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \ALUResult[24]~139_combout\ : std_logic;
SIGNAL \ALUResult[24]~138_combout\ : std_logic;
SIGNAL \regDataA[25]~input_o\ : std_logic;
SIGNAL \ALUResult[24]~140_combout\ : std_logic;
SIGNAL \ALUResult[24]~141_combout\ : std_logic;
SIGNAL \ALUResult[24]~142_combout\ : std_logic;
SIGNAL \regDataB[25]~input_o\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \regDataA[26]~input_o\ : std_logic;
SIGNAL \ALUResult[25]~143_combout\ : std_logic;
SIGNAL \ALUResult[25]~144_combout\ : std_logic;
SIGNAL \ALUResult[25]~145_combout\ : std_logic;
SIGNAL \ALUResult[25]~146_combout\ : std_logic;
SIGNAL \regDataB[26]~input_o\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \regDataA[27]~input_o\ : std_logic;
SIGNAL \ALUResult[26]~149_combout\ : std_logic;
SIGNAL \ALUResult[26]~150_combout\ : std_logic;
SIGNAL \ALUResult[26]~147_combout\ : std_logic;
SIGNAL \ALUResult[26]~148_combout\ : std_logic;
SIGNAL \ALUResult[26]~151_combout\ : std_logic;
SIGNAL \regDataB[27]~input_o\ : std_logic;
SIGNAL \ALUResult~153_combout\ : std_logic;
SIGNAL \Equal2~20_combout\ : std_logic;
SIGNAL \regDataA[28]~input_o\ : std_logic;
SIGNAL \ALUResult[27]~152_combout\ : std_logic;
SIGNAL \ALUResult[27]~154_combout\ : std_logic;
SIGNAL \ALUResult[27]~155_combout\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \ALUResult[27]~156_combout\ : std_logic;
SIGNAL \regDataB[28]~input_o\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \regDataA[29]~input_o\ : std_logic;
SIGNAL \ALUResult[28]~157_combout\ : std_logic;
SIGNAL \ALUResult[28]~158_combout\ : std_logic;
SIGNAL \ALUResult[28]~159_combout\ : std_logic;
SIGNAL \ALUResult[28]~160_combout\ : std_logic;
SIGNAL \regDataB[29]~input_o\ : std_logic;
SIGNAL \ALUResult~162_combout\ : std_logic;
SIGNAL \regDataA[30]~input_o\ : std_logic;
SIGNAL \Equal2~23_combout\ : std_logic;
SIGNAL \ALUResult[29]~161_combout\ : std_logic;
SIGNAL \ALUResult[29]~163_combout\ : std_logic;
SIGNAL \ALUResult[29]~164_combout\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \ALUResult[29]~165_combout\ : std_logic;
SIGNAL \regDataB[30]~input_o\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \ALUResult[30]~166_combout\ : std_logic;
SIGNAL \ALUResult[30]~167_combout\ : std_logic;
SIGNAL \ALUResult[30]~168_combout\ : std_logic;
SIGNAL \ALUResult[30]~169_combout\ : std_logic;
SIGNAL \regDataB[31]~input_o\ : std_logic;
SIGNAL \ALUResult[31]~173_combout\ : std_logic;
SIGNAL \ALUResult[31]~171_combout\ : std_logic;
SIGNAL \ALUResult[31]~170_combout\ : std_logic;
SIGNAL \ALUResult[31]~172_combout\ : std_logic;
SIGNAL \ALUResult[31]~174_combout\ : std_logic;
SIGNAL \ALUResult[31]~175_combout\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \ALUResult[31]~176_combout\ : std_logic;
SIGNAL \Equal0~6_combout\ : std_logic;
SIGNAL \Equal0~7_combout\ : std_logic;
SIGNAL \Equal0~8_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~9_combout\ : std_logic;
SIGNAL \Equal0~10_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \CarrySet~0_combout\ : std_logic;
SIGNAL \Equal2~7_combout\ : std_logic;
SIGNAL \Equal2~9_combout\ : std_logic;
SIGNAL \Equal2~22_combout\ : std_logic;
SIGNAL \Equal2~24_combout\ : std_logic;
SIGNAL \Equal2~19_combout\ : std_logic;
SIGNAL \Equal2~21_combout\ : std_logic;
SIGNAL \Equal2~13_combout\ : std_logic;
SIGNAL \Equal2~15_combout\ : std_logic;
SIGNAL \Equal2~16_combout\ : std_logic;
SIGNAL \Equal2~18_combout\ : std_logic;
SIGNAL \Equal2~25_combout\ : std_logic;
SIGNAL \Equal2~1_combout\ : std_logic;
SIGNAL \Equal2~3_combout\ : std_logic;
SIGNAL \Equal2~0_combout\ : std_logic;
SIGNAL \Equal2~6_combout\ : std_logic;
SIGNAL \Equal2~10_combout\ : std_logic;
SIGNAL \Equal2~12_combout\ : std_logic;
SIGNAL \Equal2~26_combout\ : std_logic;
SIGNAL ALUResult : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_Op_ADS <= Op_ADS;
ww_Op_MUL <= Op_MUL;
ww_Op_CMP <= Op_CMP;
ww_Op_ARS <= Op_ARS;
ww_Op_XRS <= Op_XRS;
ww_Op_ORS <= Op_ORS;
ww_Op_LS1 <= Op_LS1;
ww_Op_RS1 <= Op_RS1;
ww_Op_LR1 <= Op_LR1;
ww_Op_RR1 <= Op_RR1;
ww_Op_RA1 <= Op_RA1;
ww_regDataA <= regDataA;
ww_regDataB <= regDataB;
ALUDataOut <= ww_ALUDataOut;
CondCodeBits <= ww_CondCodeBits;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ALUResult[31]~17clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ALUResult[31]~17_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y8_N23
\ALUDataOut[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(0),
	devoe => ww_devoe,
	o => \ALUDataOut[0]~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\ALUDataOut[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(1),
	devoe => ww_devoe,
	o => \ALUDataOut[1]~output_o\);

-- Location: IOOBUF_X28_Y0_N16
\ALUDataOut[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(2),
	devoe => ww_devoe,
	o => \ALUDataOut[2]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\ALUDataOut[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(3),
	devoe => ww_devoe,
	o => \ALUDataOut[3]~output_o\);

-- Location: IOOBUF_X18_Y24_N16
\ALUDataOut[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(4),
	devoe => ww_devoe,
	o => \ALUDataOut[4]~output_o\);

-- Location: IOOBUF_X9_Y24_N23
\ALUDataOut[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(5),
	devoe => ww_devoe,
	o => \ALUDataOut[5]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\ALUDataOut[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(6),
	devoe => ww_devoe,
	o => \ALUDataOut[6]~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\ALUDataOut[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(7),
	devoe => ww_devoe,
	o => \ALUDataOut[7]~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\ALUDataOut[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(8),
	devoe => ww_devoe,
	o => \ALUDataOut[8]~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\ALUDataOut[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(9),
	devoe => ww_devoe,
	o => \ALUDataOut[9]~output_o\);

-- Location: IOOBUF_X9_Y24_N16
\ALUDataOut[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(10),
	devoe => ww_devoe,
	o => \ALUDataOut[10]~output_o\);

-- Location: IOOBUF_X0_Y7_N16
\ALUDataOut[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(11),
	devoe => ww_devoe,
	o => \ALUDataOut[11]~output_o\);

-- Location: IOOBUF_X5_Y24_N9
\ALUDataOut[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(12),
	devoe => ww_devoe,
	o => \ALUDataOut[12]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\ALUDataOut[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(13),
	devoe => ww_devoe,
	o => \ALUDataOut[13]~output_o\);

-- Location: IOOBUF_X11_Y24_N9
\ALUDataOut[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(14),
	devoe => ww_devoe,
	o => \ALUDataOut[14]~output_o\);

-- Location: IOOBUF_X34_Y11_N2
\ALUDataOut[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(15),
	devoe => ww_devoe,
	o => \ALUDataOut[15]~output_o\);

-- Location: IOOBUF_X11_Y24_N23
\ALUDataOut[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(16),
	devoe => ww_devoe,
	o => \ALUDataOut[16]~output_o\);

-- Location: IOOBUF_X34_Y2_N23
\ALUDataOut[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(17),
	devoe => ww_devoe,
	o => \ALUDataOut[17]~output_o\);

-- Location: IOOBUF_X34_Y7_N23
\ALUDataOut[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(18),
	devoe => ww_devoe,
	o => \ALUDataOut[18]~output_o\);

-- Location: IOOBUF_X32_Y0_N16
\ALUDataOut[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(19),
	devoe => ww_devoe,
	o => \ALUDataOut[19]~output_o\);

-- Location: IOOBUF_X11_Y24_N2
\ALUDataOut[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(20),
	devoe => ww_devoe,
	o => \ALUDataOut[20]~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\ALUDataOut[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(21),
	devoe => ww_devoe,
	o => \ALUDataOut[21]~output_o\);

-- Location: IOOBUF_X28_Y0_N2
\ALUDataOut[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(22),
	devoe => ww_devoe,
	o => \ALUDataOut[22]~output_o\);

-- Location: IOOBUF_X28_Y0_N9
\ALUDataOut[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(23),
	devoe => ww_devoe,
	o => \ALUDataOut[23]~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\ALUDataOut[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(24),
	devoe => ww_devoe,
	o => \ALUDataOut[24]~output_o\);

-- Location: IOOBUF_X21_Y0_N16
\ALUDataOut[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(25),
	devoe => ww_devoe,
	o => \ALUDataOut[25]~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\ALUDataOut[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(26),
	devoe => ww_devoe,
	o => \ALUDataOut[26]~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\ALUDataOut[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(27),
	devoe => ww_devoe,
	o => \ALUDataOut[27]~output_o\);

-- Location: IOOBUF_X21_Y0_N23
\ALUDataOut[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(28),
	devoe => ww_devoe,
	o => \ALUDataOut[28]~output_o\);

-- Location: IOOBUF_X7_Y0_N23
\ALUDataOut[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(29),
	devoe => ww_devoe,
	o => \ALUDataOut[29]~output_o\);

-- Location: IOOBUF_X9_Y0_N2
\ALUDataOut[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(30),
	devoe => ww_devoe,
	o => \ALUDataOut[30]~output_o\);

-- Location: IOOBUF_X9_Y0_N9
\ALUDataOut[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => ALUResult(31),
	devoe => ww_devoe,
	o => \ALUDataOut[31]~output_o\);

-- Location: IOOBUF_X25_Y0_N9
\CondCodeBits[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal0~10_combout\,
	devoe => ww_devoe,
	o => \CondCodeBits[0]~output_o\);

-- Location: IOOBUF_X21_Y24_N2
\CondCodeBits[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal1~0_combout\,
	devoe => ww_devoe,
	o => \CondCodeBits[1]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\CondCodeBits[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \CarrySet~0_combout\,
	devoe => ww_devoe,
	o => \CondCodeBits[2]~output_o\);

-- Location: IOOBUF_X34_Y19_N16
\CondCodeBits[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[3]~output_o\);

-- Location: IOOBUF_X11_Y24_N16
\CondCodeBits[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Equal2~26_combout\,
	devoe => ww_devoe,
	o => \CondCodeBits[4]~output_o\);

-- Location: IOOBUF_X30_Y24_N9
\CondCodeBits[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[5]~output_o\);

-- Location: IOOBUF_X25_Y24_N16
\CondCodeBits[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[6]~output_o\);

-- Location: IOOBUF_X5_Y24_N2
\CondCodeBits[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[7]~output_o\);

-- Location: IOOBUF_X34_Y8_N9
\CondCodeBits[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[8]~output_o\);

-- Location: IOOBUF_X3_Y24_N2
\CondCodeBits[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[9]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\CondCodeBits[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[10]~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\CondCodeBits[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[11]~output_o\);

-- Location: IOOBUF_X32_Y24_N9
\CondCodeBits[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[12]~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\CondCodeBits[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[13]~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\CondCodeBits[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[14]~output_o\);

-- Location: IOOBUF_X21_Y24_N9
\CondCodeBits[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[15]~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\CondCodeBits[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[16]~output_o\);

-- Location: IOOBUF_X34_Y18_N2
\CondCodeBits[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[17]~output_o\);

-- Location: IOOBUF_X23_Y24_N23
\CondCodeBits[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[18]~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\CondCodeBits[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[19]~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\CondCodeBits[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[20]~output_o\);

-- Location: IOOBUF_X34_Y2_N16
\CondCodeBits[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[21]~output_o\);

-- Location: IOOBUF_X0_Y21_N23
\CondCodeBits[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[22]~output_o\);

-- Location: IOOBUF_X0_Y18_N23
\CondCodeBits[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[23]~output_o\);

-- Location: IOOBUF_X30_Y24_N2
\CondCodeBits[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[24]~output_o\);

-- Location: IOOBUF_X1_Y24_N9
\CondCodeBits[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[25]~output_o\);

-- Location: IOOBUF_X25_Y24_N23
\CondCodeBits[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[26]~output_o\);

-- Location: IOOBUF_X34_Y18_N16
\CondCodeBits[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[27]~output_o\);

-- Location: IOOBUF_X0_Y22_N2
\CondCodeBits[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[28]~output_o\);

-- Location: IOOBUF_X7_Y24_N9
\CondCodeBits[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[29]~output_o\);

-- Location: IOOBUF_X25_Y24_N9
\CondCodeBits[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[30]~output_o\);

-- Location: IOOBUF_X3_Y24_N16
\CondCodeBits[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \CondCodeBits[31]~output_o\);

-- Location: IOIBUF_X18_Y0_N1
\regDataA[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(0),
	o => \regDataA[0]~input_o\);

-- Location: IOIBUF_X5_Y0_N22
\regDataB[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(0),
	o => \regDataB[0]~input_o\);

-- Location: LCCOMB_X14_Y4_N0
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = (\regDataA[0]~input_o\ & (\regDataB[0]~input_o\ $ (VCC))) # (!\regDataA[0]~input_o\ & (\regDataB[0]~input_o\ & VCC))
-- \Add0~1\ = CARRY((\regDataA[0]~input_o\ & \regDataB[0]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[0]~input_o\,
	datab => \regDataB[0]~input_o\,
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: IOIBUF_X9_Y0_N15
\Op_XRS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_XRS,
	o => \Op_XRS~input_o\);

-- Location: IOIBUF_X13_Y0_N22
\Op_ADS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_ADS,
	o => \Op_ADS~input_o\);

-- Location: IOIBUF_X0_Y5_N22
\Op_ARS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_ARS,
	o => \Op_ARS~input_o\);

-- Location: IOIBUF_X16_Y0_N15
\Op_ORS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_ORS,
	o => \Op_ORS~input_o\);

-- Location: LCCOMB_X10_Y4_N0
\ALUResult[0]~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~8_combout\ = (\Op_ADS~input_o\) # ((\Op_XRS~input_o\ & (!\Op_ARS~input_o\ & !\Op_ORS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_XRS~input_o\,
	datab => \Op_ADS~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \Op_ORS~input_o\,
	combout => \ALUResult[0]~8_combout\);

-- Location: IOIBUF_X5_Y0_N15
\Op_RS1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_RS1,
	o => \Op_RS1~input_o\);

-- Location: IOIBUF_X1_Y0_N22
\Op_LR1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_LR1,
	o => \Op_LR1~input_o\);

-- Location: IOIBUF_X0_Y6_N22
\regDataA[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(1),
	o => \regDataA[1]~input_o\);

-- Location: IOIBUF_X7_Y0_N15
\regDataA[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(31),
	o => \regDataA[31]~input_o\);

-- Location: LCCOMB_X9_Y3_N22
\ALUResult[0]~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~10_combout\ = (\Op_RS1~input_o\ & (((\regDataA[1]~input_o\)))) # (!\Op_RS1~input_o\ & ((\Op_LR1~input_o\ & ((\regDataA[31]~input_o\))) # (!\Op_LR1~input_o\ & (\regDataA[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~input_o\,
	datab => \Op_LR1~input_o\,
	datac => \regDataA[1]~input_o\,
	datad => \regDataA[31]~input_o\,
	combout => \ALUResult[0]~10_combout\);

-- Location: LCCOMB_X17_Y4_N22
\ALUResult[0]~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~11_combout\ = (!\Op_XRS~input_o\ & !\Op_ORS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op_XRS~input_o\,
	datad => \Op_ORS~input_o\,
	combout => \ALUResult[0]~11_combout\);

-- Location: LCCOMB_X9_Y3_N30
\ALUResult[0]~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~9_combout\ = (\Op_ORS~input_o\ & ((\regDataB[0]~input_o\) # (\regDataA[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ORS~input_o\,
	datac => \regDataB[0]~input_o\,
	datad => \regDataA[0]~input_o\,
	combout => \ALUResult[0]~9_combout\);

-- Location: IOIBUF_X34_Y7_N8
\Op_LS1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_LS1,
	o => \Op_LS1~input_o\);

-- Location: LCCOMB_X9_Y3_N28
\ALUResult[0]~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~12_combout\ = (\ALUResult[0]~9_combout\) # ((\ALUResult[0]~10_combout\ & (\ALUResult[0]~11_combout\ & !\Op_LS1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~10_combout\,
	datab => \ALUResult[0]~11_combout\,
	datac => \ALUResult[0]~9_combout\,
	datad => \Op_LS1~input_o\,
	combout => \ALUResult[0]~12_combout\);

-- Location: LCCOMB_X9_Y3_N0
\ALUResult[0]~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~13_combout\ = (\Op_ARS~input_o\ & (((\regDataB[0]~input_o\ & \regDataA[0]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[0]~12_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \ALUResult[0]~12_combout\,
	datac => \regDataB[0]~input_o\,
	datad => \regDataA[0]~input_o\,
	combout => \ALUResult[0]~13_combout\);

-- Location: LCCOMB_X10_Y4_N26
\ALUResult[0]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~14_combout\ = (\Add0~0_combout\ & ((\ALUResult[0]~8_combout\) # ((!\Op_ADS~input_o\ & \ALUResult[0]~13_combout\)))) # (!\Add0~0_combout\ & (((!\Op_ADS~input_o\ & \ALUResult[0]~13_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \ALUResult[0]~8_combout\,
	datac => \Op_ADS~input_o\,
	datad => \ALUResult[0]~13_combout\,
	combout => \ALUResult[0]~14_combout\);

-- Location: LCCOMB_X9_Y3_N12
\ALUResult[31]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~16_combout\ = (!\Op_RS1~input_o\ & (!\Op_LS1~input_o\ & (!\Op_LR1~input_o\ & !\Op_XRS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~input_o\,
	datab => \Op_LS1~input_o\,
	datac => \Op_LR1~input_o\,
	datad => \Op_XRS~input_o\,
	combout => \ALUResult[31]~16_combout\);

-- Location: IOIBUF_X7_Y24_N1
\Op_RA1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_RA1,
	o => \Op_RA1~input_o\);

-- Location: IOIBUF_X0_Y19_N15
\Op_RR1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_RR1,
	o => \Op_RR1~input_o\);

-- Location: LCCOMB_X9_Y3_N24
\ALUResult[31]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~15_combout\ = (\Op_RR1~input_o\) # ((\Op_ORS~input_o\) # ((\Op_ARS~input_o\) # (\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RR1~input_o\,
	datab => \Op_ORS~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[31]~15_combout\);

-- Location: LCCOMB_X9_Y3_N8
\ALUResult[31]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~17_combout\ = ((\Op_RA1~input_o\) # (\ALUResult[31]~15_combout\)) # (!\ALUResult[31]~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[31]~16_combout\,
	datac => \Op_RA1~input_o\,
	datad => \ALUResult[31]~15_combout\,
	combout => \ALUResult[31]~17_combout\);

-- Location: CLKCTRL_G4
\ALUResult[31]~17clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ALUResult[31]~17clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ALUResult[31]~17clkctrl_outclk\);

-- Location: LCCOMB_X10_Y4_N30
\ALUResult[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(0) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[0]~14_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[0]~14_combout\,
	datac => ALUResult(0),
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(0));

-- Location: IOIBUF_X21_Y0_N1
\regDataB[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(1),
	o => \regDataB[1]~input_o\);

-- Location: LCCOMB_X14_Y4_N2
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (\regDataA[1]~input_o\ & ((\regDataB[1]~input_o\ & (\Add0~1\ & VCC)) # (!\regDataB[1]~input_o\ & (!\Add0~1\)))) # (!\regDataA[1]~input_o\ & ((\regDataB[1]~input_o\ & (!\Add0~1\)) # (!\regDataB[1]~input_o\ & ((\Add0~1\) # (GND)))))
-- \Add0~3\ = CARRY((\regDataA[1]~input_o\ & (!\regDataB[1]~input_o\ & !\Add0~1\)) # (!\regDataA[1]~input_o\ & ((!\Add0~1\) # (!\regDataB[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[1]~input_o\,
	datab => \regDataB[1]~input_o\,
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X9_Y3_N26
\ALUResult[30]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~18_combout\ = (!\Op_RS1~input_o\ & \Op_LR1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~input_o\,
	datac => \Op_LR1~input_o\,
	combout => \ALUResult[30]~18_combout\);

-- Location: LCCOMB_X16_Y4_N6
\ALUResult[1]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~19_combout\ = (\Op_ORS~input_o\) # ((!\Op_XRS~input_o\ & ((\ALUResult[30]~18_combout\) # (\Op_LS1~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[30]~18_combout\,
	datab => \Op_ORS~input_o\,
	datac => \Op_XRS~input_o\,
	datad => \Op_LS1~input_o\,
	combout => \ALUResult[1]~19_combout\);

-- Location: LCCOMB_X18_Y3_N10
\ALUResult[1]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~21_combout\ = (\regDataB[1]~input_o\ & ((\Op_ARS~input_o\ & (\regDataA[1]~input_o\)) # (!\Op_ARS~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataA[1]~input_o\))))) # (!\regDataB[1]~input_o\ & (!\Op_ARS~input_o\ & 
-- (\regDataA[1]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001010010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[1]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[1]~input_o\,
	datad => \ALUResult[1]~19_combout\,
	combout => \ALUResult[1]~21_combout\);

-- Location: IOIBUF_X21_Y0_N8
\regDataA[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(2),
	o => \regDataA[2]~input_o\);

-- Location: LCCOMB_X18_Y3_N12
\ALUResult[1]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~20_combout\ = ((\ALUResult[1]~19_combout\ & (\regDataA[0]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[2]~input_o\)))) # (!\ALUResult[0]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[0]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[2]~input_o\,
	combout => \ALUResult[1]~20_combout\);

-- Location: LCCOMB_X18_Y3_N0
\ALUResult[1]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~22_combout\ = (\Op_ARS~input_o\ & (\ALUResult[1]~21_combout\)) # (!\Op_ARS~input_o\ & ((\ALUResult[0]~11_combout\ & ((\ALUResult[1]~20_combout\))) # (!\ALUResult[0]~11_combout\ & (\ALUResult[1]~21_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~21_combout\,
	datab => \Op_ARS~input_o\,
	datac => \ALUResult[0]~11_combout\,
	datad => \ALUResult[1]~20_combout\,
	combout => \ALUResult[1]~22_combout\);

-- Location: LCCOMB_X18_Y4_N30
\ALUResult[1]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~23_combout\ = (\Op_ADS~input_o\ & (\Add0~2_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[1]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~2_combout\,
	datac => \Op_ADS~input_o\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[1]~23_combout\);

-- Location: LCCOMB_X19_Y4_N10
\ALUResult[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(1) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[1]~23_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(1),
	datac => \ALUResult[1]~23_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(1));

-- Location: IOIBUF_X23_Y0_N1
\regDataA[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(3),
	o => \regDataA[3]~input_o\);

-- Location: LCCOMB_X16_Y4_N10
\ALUResult[2]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~28_combout\ = (\ALUResult[30]~18_combout\ & (((\regDataA[1]~input_o\)))) # (!\ALUResult[30]~18_combout\ & ((\Op_LS1~input_o\ & (\regDataA[1]~input_o\)) # (!\Op_LS1~input_o\ & ((\regDataA[3]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[30]~18_combout\,
	datab => \Op_LS1~input_o\,
	datac => \regDataA[1]~input_o\,
	datad => \regDataA[3]~input_o\,
	combout => \ALUResult[2]~28_combout\);

-- Location: IOIBUF_X13_Y24_N15
\regDataB[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(2),
	o => \regDataB[2]~input_o\);

-- Location: LCCOMB_X16_Y4_N24
\Equal2~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~4_combout\ = \regDataB[2]~input_o\ $ (\regDataA[2]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataB[2]~input_o\,
	datad => \regDataA[2]~input_o\,
	combout => \Equal2~4_combout\);

-- Location: LCCOMB_X17_Y4_N4
\ALUResult[2]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~29_combout\ = (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & ((\Equal2~4_combout\))) # (!\Op_XRS~input_o\ & (\ALUResult[2]~28_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[2]~28_combout\,
	datab => \Op_ORS~input_o\,
	datac => \Op_XRS~input_o\,
	datad => \Equal2~4_combout\,
	combout => \ALUResult[2]~29_combout\);

-- Location: LCCOMB_X13_Y4_N4
\ALUResult[1]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~26_combout\ = (!\Op_ADS~input_o\ & !\Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ADS~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[1]~26_combout\);

-- Location: LCCOMB_X16_Y4_N12
\ALUResult[2]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~24_combout\ = (\regDataB[2]~input_o\ & \Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataB[2]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[2]~24_combout\);

-- Location: LCCOMB_X14_Y4_N4
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = ((\regDataB[2]~input_o\ $ (\regDataA[2]~input_o\ $ (!\Add0~3\)))) # (GND)
-- \Add0~5\ = CARRY((\regDataB[2]~input_o\ & ((\regDataA[2]~input_o\) # (!\Add0~3\))) # (!\regDataB[2]~input_o\ & (\regDataA[2]~input_o\ & !\Add0~3\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[2]~input_o\,
	datab => \regDataA[2]~input_o\,
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X16_Y4_N26
\ALUResult[2]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~25_combout\ = (\Op_ADS~input_o\ & (((\Add0~4_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[2]~24_combout\ & (\regDataA[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[2]~24_combout\,
	datab => \regDataA[2]~input_o\,
	datac => \Add0~4_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[2]~25_combout\);

-- Location: LCCOMB_X16_Y4_N0
\ALUResult[2]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~27_combout\ = (\Op_ORS~input_o\ & ((\regDataB[2]~input_o\) # (\regDataA[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ORS~input_o\,
	datac => \regDataB[2]~input_o\,
	datad => \regDataA[2]~input_o\,
	combout => \ALUResult[2]~27_combout\);

-- Location: LCCOMB_X16_Y4_N20
\ALUResult[2]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~30_combout\ = (\ALUResult[2]~25_combout\) # ((\ALUResult[1]~26_combout\ & ((\ALUResult[2]~29_combout\) # (\ALUResult[2]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[2]~29_combout\,
	datab => \ALUResult[1]~26_combout\,
	datac => \ALUResult[2]~25_combout\,
	datad => \ALUResult[2]~27_combout\,
	combout => \ALUResult[2]~30_combout\);

-- Location: LCCOMB_X16_Y4_N18
\ALUResult[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(2) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[2]~30_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[2]~30_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(2),
	combout => ALUResult(2));

-- Location: IOIBUF_X34_Y5_N15
\regDataA[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(4),
	o => \regDataA[4]~input_o\);

-- Location: IOIBUF_X0_Y8_N1
\regDataB[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(3),
	o => \regDataB[3]~input_o\);

-- Location: LCCOMB_X16_Y4_N14
\Equal2~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~5_combout\ = \regDataB[3]~input_o\ $ (\regDataA[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataB[3]~input_o\,
	datad => \regDataA[3]~input_o\,
	combout => \Equal2~5_combout\);

-- Location: LCCOMB_X16_Y4_N4
\ALUResult[3]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~33_combout\ = (\ALUResult[1]~19_combout\ & (((!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & ((\ALUResult[0]~11_combout\ & (\regDataA[4]~input_o\)) # (!\ALUResult[0]~11_combout\ & ((\Equal2~5_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100010011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \regDataA[4]~input_o\,
	datac => \Equal2~5_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[3]~33_combout\);

-- Location: LCCOMB_X16_Y4_N22
\ALUResult~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult~34_combout\ = (\regDataB[3]~input_o\) # (\regDataA[3]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataB[3]~input_o\,
	datad => \regDataA[3]~input_o\,
	combout => \ALUResult~34_combout\);

-- Location: LCCOMB_X16_Y4_N16
\ALUResult[3]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~35_combout\ = (\ALUResult[1]~19_combout\ & ((\ALUResult[3]~33_combout\ & (\ALUResult~34_combout\)) # (!\ALUResult[3]~33_combout\ & ((\regDataA[2]~input_o\))))) # (!\ALUResult[1]~19_combout\ & (\ALUResult[3]~33_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \ALUResult[3]~33_combout\,
	datac => \ALUResult~34_combout\,
	datad => \regDataA[2]~input_o\,
	combout => \ALUResult[3]~35_combout\);

-- Location: LCCOMB_X16_Y4_N2
\ALUResult[3]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~31_combout\ = (\regDataA[3]~input_o\ & (\Op_ARS~input_o\ & (\regDataB[3]~input_o\ & !\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[3]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataB[3]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[3]~31_combout\);

-- Location: LCCOMB_X14_Y4_N6
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\regDataB[3]~input_o\ & ((\regDataA[3]~input_o\ & (\Add0~5\ & VCC)) # (!\regDataA[3]~input_o\ & (!\Add0~5\)))) # (!\regDataB[3]~input_o\ & ((\regDataA[3]~input_o\ & (!\Add0~5\)) # (!\regDataA[3]~input_o\ & ((\Add0~5\) # (GND)))))
-- \Add0~7\ = CARRY((\regDataB[3]~input_o\ & (!\regDataA[3]~input_o\ & !\Add0~5\)) # (!\regDataB[3]~input_o\ & ((!\Add0~5\) # (!\regDataA[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[3]~input_o\,
	datab => \regDataA[3]~input_o\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X17_Y4_N30
\ALUResult[3]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~32_combout\ = (\Add0~6_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~6_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[3]~32_combout\);

-- Location: LCCOMB_X17_Y4_N0
\ALUResult[3]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~36_combout\ = (\ALUResult[3]~31_combout\) # ((\ALUResult[3]~32_combout\) # ((\ALUResult[3]~35_combout\ & \ALUResult[1]~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[3]~35_combout\,
	datab => \ALUResult[1]~26_combout\,
	datac => \ALUResult[3]~31_combout\,
	datad => \ALUResult[3]~32_combout\,
	combout => \ALUResult[3]~36_combout\);

-- Location: LCCOMB_X17_Y4_N20
\ALUResult[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(3) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[3]~36_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[3]~36_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(3),
	combout => ALUResult(3));

-- Location: IOIBUF_X0_Y10_N1
\regDataA[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(5),
	o => \regDataA[5]~input_o\);

-- Location: LCCOMB_X18_Y3_N18
\ALUResult[4]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~39_combout\ = ((\ALUResult[1]~19_combout\ & ((\regDataA[3]~input_o\))) # (!\ALUResult[1]~19_combout\ & (\regDataA[5]~input_o\))) # (!\ALUResult[0]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111100101111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[5]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[3]~input_o\,
	combout => \ALUResult[4]~39_combout\);

-- Location: LCCOMB_X18_Y3_N28
\ALUResult[4]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~40_combout\ = (\Op_ARS~input_o\) # (\ALUResult[4]~39_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ARS~input_o\,
	datad => \ALUResult[4]~39_combout\,
	combout => \ALUResult[4]~40_combout\);

-- Location: IOIBUF_X16_Y24_N22
\regDataB[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(4),
	o => \regDataB[4]~input_o\);

-- Location: LCCOMB_X14_Y4_N8
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = ((\regDataB[4]~input_o\ $ (\regDataA[4]~input_o\ $ (!\Add0~7\)))) # (GND)
-- \Add0~9\ = CARRY((\regDataB[4]~input_o\ & ((\regDataA[4]~input_o\) # (!\Add0~7\))) # (!\regDataB[4]~input_o\ & (\regDataA[4]~input_o\ & !\Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[4]~input_o\,
	datab => \regDataA[4]~input_o\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X17_Y4_N18
\ALUResult[4]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~37_combout\ = (\ALUResult[0]~11_combout\) # ((\regDataB[4]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataA[4]~input_o\))) # (!\regDataB[4]~input_o\ & (\regDataA[4]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011110110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[4]~input_o\,
	datab => \regDataA[4]~input_o\,
	datac => \ALUResult[0]~11_combout\,
	datad => \ALUResult[1]~19_combout\,
	combout => \ALUResult[4]~37_combout\);

-- Location: LCCOMB_X17_Y4_N12
\ALUResult[4]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~38_combout\ = (\Op_ARS~input_o\ & (\regDataA[4]~input_o\ & ((\regDataB[4]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[4]~37_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[4]~input_o\,
	datab => \ALUResult[4]~37_combout\,
	datac => \regDataB[4]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[4]~38_combout\);

-- Location: LCCOMB_X18_Y4_N12
\ALUResult[4]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~41_combout\ = (\Op_ADS~input_o\ & (((\Add0~8_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[4]~40_combout\ & ((\ALUResult[4]~38_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \ALUResult[4]~40_combout\,
	datac => \Add0~8_combout\,
	datad => \ALUResult[4]~38_combout\,
	combout => \ALUResult[4]~41_combout\);

-- Location: LCCOMB_X18_Y4_N18
\ALUResult[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(4) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[4]~41_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(4),
	datac => \ALUResult[4]~41_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(4));

-- Location: IOIBUF_X18_Y24_N8
\regDataB[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(5),
	o => \regDataB[5]~input_o\);

-- Location: LCCOMB_X17_Y4_N16
\ALUResult[5]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~43_combout\ = (\Op_ADS~input_o\) # ((\regDataB[5]~input_o\ & \regDataA[5]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[5]~input_o\,
	datac => \regDataA[5]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[5]~43_combout\);

-- Location: IOIBUF_X0_Y9_N1
\regDataA[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(6),
	o => \regDataA[6]~input_o\);

-- Location: LCCOMB_X17_Y4_N6
\ALUResult[5]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~44_combout\ = (\ALUResult[1]~19_combout\ & (\regDataA[4]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[4]~input_o\,
	datac => \regDataA[6]~input_o\,
	datad => \ALUResult[1]~19_combout\,
	combout => \ALUResult[5]~44_combout\);

-- Location: LCCOMB_X17_Y4_N24
\ALUResult[5]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~45_combout\ = (\regDataA[5]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataB[5]~input_o\))) # (!\regDataA[5]~input_o\ & ((\regDataB[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datac => \regDataA[5]~input_o\,
	datad => \regDataB[5]~input_o\,
	combout => \ALUResult[5]~45_combout\);

-- Location: LCCOMB_X17_Y4_N14
\ALUResult[5]~177\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~177_combout\ = (\Op_ORS~input_o\ & (((\ALUResult[5]~45_combout\)))) # (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & ((\ALUResult[5]~45_combout\))) # (!\Op_XRS~input_o\ & (\ALUResult[5]~44_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[5]~44_combout\,
	datab => \Op_ORS~input_o\,
	datac => \Op_XRS~input_o\,
	datad => \ALUResult[5]~45_combout\,
	combout => \ALUResult[5]~177_combout\);

-- Location: LCCOMB_X14_Y4_N10
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (\regDataA[5]~input_o\ & ((\regDataB[5]~input_o\ & (\Add0~9\ & VCC)) # (!\regDataB[5]~input_o\ & (!\Add0~9\)))) # (!\regDataA[5]~input_o\ & ((\regDataB[5]~input_o\ & (!\Add0~9\)) # (!\regDataB[5]~input_o\ & ((\Add0~9\) # (GND)))))
-- \Add0~11\ = CARRY((\regDataA[5]~input_o\ & (!\regDataB[5]~input_o\ & !\Add0~9\)) # (!\regDataA[5]~input_o\ & ((!\Add0~9\) # (!\regDataB[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[5]~input_o\,
	datab => \regDataB[5]~input_o\,
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X17_Y4_N26
\ALUResult[5]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~42_combout\ = (\Op_ADS~input_o\ & (\Add0~10_combout\)) # (!\Op_ADS~input_o\ & ((\Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datac => \Op_ARS~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[5]~42_combout\);

-- Location: LCCOMB_X17_Y4_N2
\ALUResult[5]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~46_combout\ = (\ALUResult[5]~43_combout\ & ((\ALUResult[5]~42_combout\) # ((\ALUResult[1]~26_combout\ & \ALUResult[5]~177_combout\)))) # (!\ALUResult[5]~43_combout\ & (\ALUResult[1]~26_combout\ & (\ALUResult[5]~177_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[5]~43_combout\,
	datab => \ALUResult[1]~26_combout\,
	datac => \ALUResult[5]~177_combout\,
	datad => \ALUResult[5]~42_combout\,
	combout => \ALUResult[5]~46_combout\);

-- Location: LCCOMB_X17_Y4_N10
\ALUResult[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(5) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[5]~46_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(5),
	datac => \ALUResult[5]~46_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(5));

-- Location: IOIBUF_X0_Y10_N22
\regDataB[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(6),
	o => \regDataB[6]~input_o\);

-- Location: LCCOMB_X17_Y4_N28
\ALUResult[6]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~47_combout\ = (\ALUResult[0]~11_combout\) # ((\regDataA[6]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataB[6]~input_o\))) # (!\regDataA[6]~input_o\ & (\regDataB[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \regDataA[6]~input_o\,
	datac => \regDataB[6]~input_o\,
	datad => \ALUResult[1]~19_combout\,
	combout => \ALUResult[6]~47_combout\);

-- Location: LCCOMB_X13_Y4_N22
\ALUResult[6]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~48_combout\ = (\Op_ARS~input_o\ & (((\regDataA[6]~input_o\ & \regDataB[6]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[6]~47_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[6]~47_combout\,
	datab => \regDataA[6]~input_o\,
	datac => \regDataB[6]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[6]~48_combout\);

-- Location: LCCOMB_X14_Y4_N12
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = ((\regDataA[6]~input_o\ $ (\regDataB[6]~input_o\ $ (!\Add0~11\)))) # (GND)
-- \Add0~13\ = CARRY((\regDataA[6]~input_o\ & ((\regDataB[6]~input_o\) # (!\Add0~11\))) # (!\regDataA[6]~input_o\ & (\regDataB[6]~input_o\ & !\Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[6]~input_o\,
	datab => \regDataB[6]~input_o\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: IOIBUF_X13_Y24_N1
\regDataA[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(7),
	o => \regDataA[7]~input_o\);

-- Location: LCCOMB_X9_Y4_N0
\ALUResult[6]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~49_combout\ = ((\ALUResult[1]~19_combout\ & (\regDataA[5]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[7]~input_o\)))) # (!\ALUResult[0]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[5]~input_o\,
	datab => \regDataA[7]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[6]~49_combout\);

-- Location: LCCOMB_X9_Y4_N14
\ALUResult[6]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~50_combout\ = (\Op_ARS~input_o\) # (\ALUResult[6]~49_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ARS~input_o\,
	datad => \ALUResult[6]~49_combout\,
	combout => \ALUResult[6]~50_combout\);

-- Location: LCCOMB_X13_Y4_N28
\ALUResult[6]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~51_combout\ = (\Op_ADS~input_o\ & (((\Add0~12_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[6]~48_combout\ & ((\ALUResult[6]~50_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[6]~48_combout\,
	datab => \Op_ADS~input_o\,
	datac => \Add0~12_combout\,
	datad => \ALUResult[6]~50_combout\,
	combout => \ALUResult[6]~51_combout\);

-- Location: LCCOMB_X12_Y4_N10
\ALUResult[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(6) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[6]~51_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(6))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[6]~51_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(6),
	combout => ALUResult(6));

-- Location: IOIBUF_X0_Y10_N15
\regDataB[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(7),
	o => \regDataB[7]~input_o\);

-- Location: LCCOMB_X14_Y4_N14
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (\regDataA[7]~input_o\ & ((\regDataB[7]~input_o\ & (\Add0~13\ & VCC)) # (!\regDataB[7]~input_o\ & (!\Add0~13\)))) # (!\regDataA[7]~input_o\ & ((\regDataB[7]~input_o\ & (!\Add0~13\)) # (!\regDataB[7]~input_o\ & ((\Add0~13\) # (GND)))))
-- \Add0~15\ = CARRY((\regDataA[7]~input_o\ & (!\regDataB[7]~input_o\ & !\Add0~13\)) # (!\regDataA[7]~input_o\ & ((!\Add0~13\) # (!\regDataB[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[7]~input_o\,
	datab => \regDataB[7]~input_o\,
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X9_Y4_N6
\ALUResult[7]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~53_combout\ = (\Add0~14_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~14_combout\,
	datab => \Op_ADS~input_o\,
	combout => \ALUResult[7]~53_combout\);

-- Location: LCCOMB_X9_Y4_N8
\ALUResult[7]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~52_combout\ = (!\Op_ADS~input_o\ & (\regDataA[7]~input_o\ & (\regDataB[7]~input_o\ & \Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \regDataA[7]~input_o\,
	datac => \regDataB[7]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[7]~52_combout\);

-- Location: LCCOMB_X9_Y4_N22
\Equal2~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~2_combout\ = \regDataB[7]~input_o\ $ (\regDataA[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataB[7]~input_o\,
	datad => \regDataA[7]~input_o\,
	combout => \Equal2~2_combout\);

-- Location: IOIBUF_X9_Y0_N22
\regDataA[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(8),
	o => \regDataA[8]~input_o\);

-- Location: LCCOMB_X9_Y4_N12
\ALUResult[7]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~54_combout\ = (\ALUResult[1]~19_combout\ & (((!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & ((\ALUResult[0]~11_combout\ & ((\regDataA[8]~input_o\))) # (!\ALUResult[0]~11_combout\ & (\Equal2~2_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~2_combout\,
	datab => \regDataA[8]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[7]~54_combout\);

-- Location: LCCOMB_X9_Y4_N10
\ALUResult~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult~55_combout\ = (\regDataB[7]~input_o\) # (\regDataA[7]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataB[7]~input_o\,
	datad => \regDataA[7]~input_o\,
	combout => \ALUResult~55_combout\);

-- Location: LCCOMB_X9_Y4_N28
\ALUResult[7]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~56_combout\ = (\ALUResult[7]~54_combout\ & (((\ALUResult~55_combout\) # (!\ALUResult[1]~19_combout\)))) # (!\ALUResult[7]~54_combout\ & (\regDataA[6]~input_o\ & (\ALUResult[1]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[7]~54_combout\,
	datab => \regDataA[6]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \ALUResult~55_combout\,
	combout => \ALUResult[7]~56_combout\);

-- Location: LCCOMB_X9_Y4_N2
\ALUResult[7]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~57_combout\ = (\ALUResult[7]~53_combout\) # ((\ALUResult[7]~52_combout\) # ((\ALUResult[1]~26_combout\ & \ALUResult[7]~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~26_combout\,
	datab => \ALUResult[7]~53_combout\,
	datac => \ALUResult[7]~52_combout\,
	datad => \ALUResult[7]~56_combout\,
	combout => \ALUResult[7]~57_combout\);

-- Location: LCCOMB_X9_Y4_N20
\ALUResult[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(7) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[7]~57_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[7]~57_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(7),
	combout => ALUResult(7));

-- Location: IOIBUF_X0_Y4_N22
\regDataB[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(8),
	o => \regDataB[8]~input_o\);

-- Location: LCCOMB_X14_Y4_N16
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = ((\regDataB[8]~input_o\ $ (\regDataA[8]~input_o\ $ (!\Add0~15\)))) # (GND)
-- \Add0~17\ = CARRY((\regDataB[8]~input_o\ & ((\regDataA[8]~input_o\) # (!\Add0~15\))) # (!\regDataB[8]~input_o\ & (\regDataA[8]~input_o\ & !\Add0~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[8]~input_o\,
	datab => \regDataA[8]~input_o\,
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X10_Y4_N16
\ALUResult[8]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~59_combout\ = (\Op_ADS~input_o\ & \Add0~16_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ADS~input_o\,
	datad => \Add0~16_combout\,
	combout => \ALUResult[8]~59_combout\);

-- Location: LCCOMB_X9_Y4_N4
\ALUResult[8]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~58_combout\ = (!\Op_ADS~input_o\ & (\regDataB[8]~input_o\ & (\regDataA[8]~input_o\ & \Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \regDataB[8]~input_o\,
	datac => \regDataA[8]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[8]~58_combout\);

-- Location: IOIBUF_X0_Y6_N15
\regDataA[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(9),
	o => \regDataA[9]~input_o\);

-- Location: LCCOMB_X9_Y4_N26
\ALUResult[8]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~60_combout\ = (\ALUResult[1]~19_combout\ & (((\regDataA[7]~input_o\) # (!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & (\regDataA[9]~input_o\ & ((\ALUResult[0]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[9]~input_o\,
	datab => \regDataA[7]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[8]~60_combout\);

-- Location: LCCOMB_X9_Y4_N16
\ALUResult[8]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~61_combout\ = (\ALUResult[0]~11_combout\ & (\ALUResult[8]~60_combout\)) # (!\ALUResult[0]~11_combout\ & ((\regDataA[8]~input_o\ & ((\ALUResult[8]~60_combout\) # (!\regDataB[8]~input_o\))) # (!\regDataA[8]~input_o\ & 
-- ((\regDataB[8]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[8]~60_combout\,
	datab => \regDataA[8]~input_o\,
	datac => \regDataB[8]~input_o\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[8]~61_combout\);

-- Location: LCCOMB_X9_Y4_N30
\ALUResult[8]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~62_combout\ = (\ALUResult[8]~59_combout\) # ((\ALUResult[8]~58_combout\) # ((\ALUResult[1]~26_combout\ & \ALUResult[8]~61_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~26_combout\,
	datab => \ALUResult[8]~59_combout\,
	datac => \ALUResult[8]~58_combout\,
	datad => \ALUResult[8]~61_combout\,
	combout => \ALUResult[8]~62_combout\);

-- Location: LCCOMB_X9_Y4_N18
\ALUResult[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(8) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[8]~62_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(8),
	datac => \ALUResult[8]~62_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(8));

-- Location: IOIBUF_X7_Y24_N15
\regDataB[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(9),
	o => \regDataB[9]~input_o\);

-- Location: LCCOMB_X14_Y4_N18
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (\regDataA[9]~input_o\ & ((\regDataB[9]~input_o\ & (\Add0~17\ & VCC)) # (!\regDataB[9]~input_o\ & (!\Add0~17\)))) # (!\regDataA[9]~input_o\ & ((\regDataB[9]~input_o\ & (!\Add0~17\)) # (!\regDataB[9]~input_o\ & ((\Add0~17\) # (GND)))))
-- \Add0~19\ = CARRY((\regDataA[9]~input_o\ & (!\regDataB[9]~input_o\ & !\Add0~17\)) # (!\regDataA[9]~input_o\ & ((!\Add0~17\) # (!\regDataB[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[9]~input_o\,
	datab => \regDataB[9]~input_o\,
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X10_Y4_N10
\ALUResult[9]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~63_combout\ = (\Op_ADS~input_o\ & ((\Add0~18_combout\))) # (!\Op_ADS~input_o\ & (\Op_ARS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ADS~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \Add0~18_combout\,
	combout => \ALUResult[9]~63_combout\);

-- Location: LCCOMB_X10_Y4_N20
\ALUResult[9]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~64_combout\ = (\Op_ADS~input_o\) # ((\regDataB[9]~input_o\ & \regDataA[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[9]~input_o\,
	datab => \Op_ADS~input_o\,
	datad => \regDataA[9]~input_o\,
	combout => \ALUResult[9]~64_combout\);

-- Location: LCCOMB_X10_Y4_N24
\ALUResult[9]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~66_combout\ = (\regDataA[9]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataB[9]~input_o\))) # (!\regDataA[9]~input_o\ & ((\regDataB[9]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[9]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \regDataB[9]~input_o\,
	combout => \ALUResult[9]~66_combout\);

-- Location: IOIBUF_X0_Y4_N15
\regDataA[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(10),
	o => \regDataA[10]~input_o\);

-- Location: LCCOMB_X10_Y4_N22
\ALUResult[9]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~65_combout\ = (\ALUResult[1]~19_combout\ & (\regDataA[8]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[8]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \regDataA[10]~input_o\,
	combout => \ALUResult[9]~65_combout\);

-- Location: LCCOMB_X10_Y4_N28
\ALUResult[9]~178\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~178_combout\ = (\Op_XRS~input_o\ & (\ALUResult[9]~66_combout\)) # (!\Op_XRS~input_o\ & ((\Op_ORS~input_o\ & (\ALUResult[9]~66_combout\)) # (!\Op_ORS~input_o\ & ((\ALUResult[9]~65_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_XRS~input_o\,
	datab => \ALUResult[9]~66_combout\,
	datac => \ALUResult[9]~65_combout\,
	datad => \Op_ORS~input_o\,
	combout => \ALUResult[9]~178_combout\);

-- Location: LCCOMB_X10_Y4_N2
\ALUResult[9]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~67_combout\ = (\ALUResult[9]~63_combout\ & ((\ALUResult[9]~64_combout\) # ((\ALUResult[1]~26_combout\ & \ALUResult[9]~178_combout\)))) # (!\ALUResult[9]~63_combout\ & (\ALUResult[1]~26_combout\ & ((\ALUResult[9]~178_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[9]~63_combout\,
	datab => \ALUResult[1]~26_combout\,
	datac => \ALUResult[9]~64_combout\,
	datad => \ALUResult[9]~178_combout\,
	combout => \ALUResult[9]~67_combout\);

-- Location: LCCOMB_X10_Y4_N4
\ALUResult[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(9) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[9]~67_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[9]~67_combout\,
	datac => ALUResult(9),
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(9));

-- Location: IOIBUF_X34_Y4_N15
\regDataB[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(10),
	o => \regDataB[10]~input_o\);

-- Location: LCCOMB_X11_Y4_N24
\ALUResult[10]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~68_combout\ = (!\Op_ADS~input_o\ & (\regDataB[10]~input_o\ & (\regDataA[10]~input_o\ & \Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \regDataB[10]~input_o\,
	datac => \regDataA[10]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[10]~68_combout\);

-- Location: LCCOMB_X14_Y4_N20
\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = ((\regDataA[10]~input_o\ $ (\regDataB[10]~input_o\ $ (!\Add0~19\)))) # (GND)
-- \Add0~21\ = CARRY((\regDataA[10]~input_o\ & ((\regDataB[10]~input_o\) # (!\Add0~19\))) # (!\regDataA[10]~input_o\ & (\regDataB[10]~input_o\ & !\Add0~19\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[10]~input_o\,
	datab => \regDataB[10]~input_o\,
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X11_Y4_N6
\ALUResult[10]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~69_combout\ = (\Op_ADS~input_o\ & \Add0~20_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op_ADS~input_o\,
	datad => \Add0~20_combout\,
	combout => \ALUResult[10]~69_combout\);

-- Location: IOIBUF_X0_Y8_N8
\regDataA[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(11),
	o => \regDataA[11]~input_o\);

-- Location: LCCOMB_X11_Y4_N8
\ALUResult[10]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~70_combout\ = (\ALUResult[1]~19_combout\ & (((\regDataA[9]~input_o\) # (!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & (\regDataA[11]~input_o\ & (\ALUResult[0]~11_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[11]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[9]~input_o\,
	combout => \ALUResult[10]~70_combout\);

-- Location: LCCOMB_X11_Y4_N10
\ALUResult[10]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~71_combout\ = (\ALUResult[0]~11_combout\ & (((\ALUResult[10]~70_combout\)))) # (!\ALUResult[0]~11_combout\ & ((\regDataA[10]~input_o\ & ((\ALUResult[10]~70_combout\) # (!\regDataB[10]~input_o\))) # (!\regDataA[10]~input_o\ & 
-- (\regDataB[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[10]~input_o\,
	datab => \ALUResult[0]~11_combout\,
	datac => \regDataB[10]~input_o\,
	datad => \ALUResult[10]~70_combout\,
	combout => \ALUResult[10]~71_combout\);

-- Location: LCCOMB_X11_Y4_N16
\ALUResult[10]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~72_combout\ = (\ALUResult[10]~68_combout\) # ((\ALUResult[10]~69_combout\) # ((\ALUResult[1]~26_combout\ & \ALUResult[10]~71_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[10]~68_combout\,
	datab => \ALUResult[10]~69_combout\,
	datac => \ALUResult[1]~26_combout\,
	datad => \ALUResult[10]~71_combout\,
	combout => \ALUResult[10]~72_combout\);

-- Location: LCCOMB_X11_Y4_N12
\ALUResult[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(10) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[10]~72_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(10),
	datac => \ALUResult[10]~72_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(10));

-- Location: IOIBUF_X0_Y7_N22
\regDataB[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(11),
	o => \regDataB[11]~input_o\);

-- Location: LCCOMB_X11_Y4_N2
\ALUResult[11]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~73_combout\ = (!\Op_ADS~input_o\ & (\Op_ARS~input_o\ & (\regDataA[11]~input_o\ & \regDataB[11]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[11]~input_o\,
	datad => \regDataB[11]~input_o\,
	combout => \ALUResult[11]~73_combout\);

-- Location: LCCOMB_X14_Y4_N22
\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (\regDataA[11]~input_o\ & ((\regDataB[11]~input_o\ & (\Add0~21\ & VCC)) # (!\regDataB[11]~input_o\ & (!\Add0~21\)))) # (!\regDataA[11]~input_o\ & ((\regDataB[11]~input_o\ & (!\Add0~21\)) # (!\regDataB[11]~input_o\ & ((\Add0~21\) # 
-- (GND)))))
-- \Add0~23\ = CARRY((\regDataA[11]~input_o\ & (!\regDataB[11]~input_o\ & !\Add0~21\)) # (!\regDataA[11]~input_o\ & ((!\Add0~21\) # (!\regDataB[11]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[11]~input_o\,
	datab => \regDataB[11]~input_o\,
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X11_Y4_N0
\ALUResult[11]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~74_combout\ = (\Op_ADS~input_o\ & \Add0~22_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op_ADS~input_o\,
	datad => \Add0~22_combout\,
	combout => \ALUResult[11]~74_combout\);

-- Location: IOIBUF_X11_Y0_N8
\regDataA[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(12),
	o => \regDataA[12]~input_o\);

-- Location: LCCOMB_X11_Y4_N28
\Equal2~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~8_combout\ = \regDataB[11]~input_o\ $ (\regDataA[11]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataB[11]~input_o\,
	datac => \regDataA[11]~input_o\,
	combout => \Equal2~8_combout\);

-- Location: LCCOMB_X11_Y4_N30
\ALUResult[11]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~75_combout\ = (\ALUResult[1]~19_combout\ & (((!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & ((\ALUResult[0]~11_combout\ & (\regDataA[12]~input_o\)) # (!\ALUResult[0]~11_combout\ & ((\Equal2~8_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010111100101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[12]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \ALUResult[0]~11_combout\,
	datad => \Equal2~8_combout\,
	combout => \ALUResult[11]~75_combout\);

-- Location: LCCOMB_X11_Y4_N20
\ALUResult~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult~76_combout\ = (\regDataB[11]~input_o\) # (\regDataA[11]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataB[11]~input_o\,
	datac => \regDataA[11]~input_o\,
	combout => \ALUResult~76_combout\);

-- Location: LCCOMB_X11_Y4_N18
\ALUResult[11]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~77_combout\ = (\ALUResult[11]~75_combout\ & (((\ALUResult~76_combout\)) # (!\ALUResult[1]~19_combout\))) # (!\ALUResult[11]~75_combout\ & (\ALUResult[1]~19_combout\ & (\regDataA[10]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[11]~75_combout\,
	datab => \ALUResult[1]~19_combout\,
	datac => \regDataA[10]~input_o\,
	datad => \ALUResult~76_combout\,
	combout => \ALUResult[11]~77_combout\);

-- Location: LCCOMB_X11_Y4_N4
\ALUResult[11]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~78_combout\ = (\ALUResult[11]~73_combout\) # ((\ALUResult[11]~74_combout\) # ((\ALUResult[1]~26_combout\ & \ALUResult[11]~77_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[11]~73_combout\,
	datab => \ALUResult[11]~74_combout\,
	datac => \ALUResult[1]~26_combout\,
	datad => \ALUResult[11]~77_combout\,
	combout => \ALUResult[11]~78_combout\);

-- Location: LCCOMB_X11_Y4_N22
\ALUResult[11]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(11) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[11]~78_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[11]~78_combout\,
	datac => ALUResult(11),
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(11));

-- Location: IOIBUF_X13_Y0_N1
\regDataB[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(12),
	o => \regDataB[12]~input_o\);

-- Location: LCCOMB_X12_Y4_N28
\ALUResult[12]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~79_combout\ = (\ALUResult[0]~11_combout\) # ((\regDataB[12]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataA[12]~input_o\))) # (!\regDataB[12]~input_o\ & (\regDataA[12]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[12]~input_o\,
	datab => \regDataA[12]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[12]~79_combout\);

-- Location: LCCOMB_X12_Y4_N14
\ALUResult[12]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~80_combout\ = (\Op_ARS~input_o\ & (\regDataB[12]~input_o\ & (\regDataA[12]~input_o\))) # (!\Op_ARS~input_o\ & ((\ALUResult[12]~79_combout\) # ((!\regDataB[12]~input_o\ & \regDataA[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[12]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[12]~input_o\,
	datad => \ALUResult[12]~79_combout\,
	combout => \ALUResult[12]~80_combout\);

-- Location: LCCOMB_X14_Y4_N24
\Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = ((\regDataA[12]~input_o\ $ (\regDataB[12]~input_o\ $ (!\Add0~23\)))) # (GND)
-- \Add0~25\ = CARRY((\regDataA[12]~input_o\ & ((\regDataB[12]~input_o\) # (!\Add0~23\))) # (!\regDataA[12]~input_o\ & (\regDataB[12]~input_o\ & !\Add0~23\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[12]~input_o\,
	datab => \regDataB[12]~input_o\,
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: IOIBUF_X34_Y4_N22
\regDataA[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(13),
	o => \regDataA[13]~input_o\);

-- Location: LCCOMB_X11_Y4_N26
\ALUResult[12]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~81_combout\ = ((\ALUResult[1]~19_combout\ & (\regDataA[11]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[13]~input_o\)))) # (!\ALUResult[0]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[11]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[13]~input_o\,
	combout => \ALUResult[12]~81_combout\);

-- Location: LCCOMB_X10_Y4_N12
\ALUResult[12]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~82_combout\ = (\Op_ARS~input_o\) # (\ALUResult[12]~81_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op_ARS~input_o\,
	datad => \ALUResult[12]~81_combout\,
	combout => \ALUResult[12]~82_combout\);

-- Location: LCCOMB_X10_Y4_N6
\ALUResult[12]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~83_combout\ = (\Op_ADS~input_o\ & (((\Add0~24_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[12]~80_combout\ & ((\ALUResult[12]~82_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[12]~80_combout\,
	datab => \Op_ADS~input_o\,
	datac => \Add0~24_combout\,
	datad => \ALUResult[12]~82_combout\,
	combout => \ALUResult[12]~83_combout\);

-- Location: LCCOMB_X10_Y4_N18
\ALUResult[12]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(12) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[12]~83_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(12),
	datac => \ALUResult[12]~83_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(12));

-- Location: IOIBUF_X34_Y8_N15
\regDataB[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(13),
	o => \regDataB[13]~input_o\);

-- Location: LCCOMB_X14_Y4_N26
\Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (\regDataB[13]~input_o\ & ((\regDataA[13]~input_o\ & (\Add0~25\ & VCC)) # (!\regDataA[13]~input_o\ & (!\Add0~25\)))) # (!\regDataB[13]~input_o\ & ((\regDataA[13]~input_o\ & (!\Add0~25\)) # (!\regDataA[13]~input_o\ & ((\Add0~25\) # 
-- (GND)))))
-- \Add0~27\ = CARRY((\regDataB[13]~input_o\ & (!\regDataA[13]~input_o\ & !\Add0~25\)) # (!\regDataB[13]~input_o\ & ((!\Add0~25\) # (!\regDataA[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[13]~input_o\,
	datab => \regDataA[13]~input_o\,
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X13_Y4_N10
\ALUResult[13]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~84_combout\ = (\Op_ADS~input_o\ & (\Add0~26_combout\)) # (!\Op_ADS~input_o\ & ((\Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~26_combout\,
	datac => \Op_ARS~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[13]~84_combout\);

-- Location: LCCOMB_X12_Y4_N16
\ALUResult[13]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~87_combout\ = (\regDataB[13]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataA[13]~input_o\))) # (!\regDataB[13]~input_o\ & ((\regDataA[13]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[1]~19_combout\,
	datac => \regDataB[13]~input_o\,
	datad => \regDataA[13]~input_o\,
	combout => \ALUResult[13]~87_combout\);

-- Location: IOIBUF_X0_Y19_N1
\regDataA[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(14),
	o => \regDataA[14]~input_o\);

-- Location: LCCOMB_X12_Y4_N18
\ALUResult[13]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~86_combout\ = (\ALUResult[1]~19_combout\ & (\regDataA[12]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[14]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataA[12]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \regDataA[14]~input_o\,
	combout => \ALUResult[13]~86_combout\);

-- Location: LCCOMB_X12_Y4_N20
\ALUResult[13]~179\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~179_combout\ = (\Op_ORS~input_o\ & (\ALUResult[13]~87_combout\)) # (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & (\ALUResult[13]~87_combout\)) # (!\Op_XRS~input_o\ & ((\ALUResult[13]~86_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ORS~input_o\,
	datab => \ALUResult[13]~87_combout\,
	datac => \Op_XRS~input_o\,
	datad => \ALUResult[13]~86_combout\,
	combout => \ALUResult[13]~179_combout\);

-- Location: LCCOMB_X12_Y4_N8
\ALUResult[13]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~85_combout\ = (\Op_ADS~input_o\) # ((\regDataB[13]~input_o\ & \regDataA[13]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[13]~input_o\,
	datab => \Op_ADS~input_o\,
	datad => \regDataA[13]~input_o\,
	combout => \ALUResult[13]~85_combout\);

-- Location: LCCOMB_X13_Y4_N16
\ALUResult[13]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~88_combout\ = (\ALUResult[13]~84_combout\ & ((\ALUResult[13]~85_combout\) # ((\ALUResult[13]~179_combout\ & \ALUResult[1]~26_combout\)))) # (!\ALUResult[13]~84_combout\ & (\ALUResult[13]~179_combout\ & ((\ALUResult[1]~26_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[13]~84_combout\,
	datab => \ALUResult[13]~179_combout\,
	datac => \ALUResult[13]~85_combout\,
	datad => \ALUResult[1]~26_combout\,
	combout => \ALUResult[13]~88_combout\);

-- Location: LCCOMB_X13_Y4_N2
\ALUResult[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(13) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[13]~88_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[13]~88_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(13),
	combout => ALUResult(13));

-- Location: IOIBUF_X34_Y5_N22
\regDataB[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(14),
	o => \regDataB[14]~input_o\);

-- Location: LCCOMB_X14_Y4_N28
\Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = ((\regDataB[14]~input_o\ $ (\regDataA[14]~input_o\ $ (!\Add0~27\)))) # (GND)
-- \Add0~29\ = CARRY((\regDataB[14]~input_o\ & ((\regDataA[14]~input_o\) # (!\Add0~27\))) # (!\regDataB[14]~input_o\ & (\regDataA[14]~input_o\ & !\Add0~27\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[14]~input_o\,
	datab => \regDataA[14]~input_o\,
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X13_Y4_N6
\ALUResult[14]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~90_combout\ = (\Add0~28_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~28_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[14]~90_combout\);

-- Location: LCCOMB_X12_Y4_N2
\ALUResult[14]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~89_combout\ = (\regDataB[14]~input_o\ & (\regDataA[14]~input_o\ & (!\Op_ADS~input_o\ & \Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[14]~input_o\,
	datab => \regDataA[14]~input_o\,
	datac => \Op_ADS~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[14]~89_combout\);

-- Location: IOIBUF_X13_Y0_N15
\regDataA[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(15),
	o => \regDataA[15]~input_o\);

-- Location: LCCOMB_X12_Y4_N0
\ALUResult[14]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~91_combout\ = (\ALUResult[0]~11_combout\ & ((\ALUResult[1]~19_combout\ & ((\regDataA[13]~input_o\))) # (!\ALUResult[1]~19_combout\ & (\regDataA[15]~input_o\)))) # (!\ALUResult[0]~11_combout\ & (\ALUResult[1]~19_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \ALUResult[1]~19_combout\,
	datac => \regDataA[15]~input_o\,
	datad => \regDataA[13]~input_o\,
	combout => \ALUResult[14]~91_combout\);

-- Location: LCCOMB_X12_Y4_N26
\ALUResult[14]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~92_combout\ = (\ALUResult[0]~11_combout\ & (\ALUResult[14]~91_combout\)) # (!\ALUResult[0]~11_combout\ & ((\regDataA[14]~input_o\ & ((\ALUResult[14]~91_combout\) # (!\regDataB[14]~input_o\))) # (!\regDataA[14]~input_o\ & 
-- ((\regDataB[14]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \ALUResult[14]~91_combout\,
	datac => \regDataA[14]~input_o\,
	datad => \regDataB[14]~input_o\,
	combout => \ALUResult[14]~92_combout\);

-- Location: LCCOMB_X13_Y4_N12
\ALUResult[14]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~93_combout\ = (\ALUResult[14]~90_combout\) # ((\ALUResult[14]~89_combout\) # ((\ALUResult[14]~92_combout\ & \ALUResult[1]~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[14]~90_combout\,
	datab => \ALUResult[14]~89_combout\,
	datac => \ALUResult[14]~92_combout\,
	datad => \ALUResult[1]~26_combout\,
	combout => \ALUResult[14]~93_combout\);

-- Location: LCCOMB_X13_Y4_N24
\ALUResult[14]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(14) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[14]~93_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(14),
	datac => \ALUResult[14]~93_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(14));

-- Location: IOIBUF_X0_Y9_N8
\regDataB[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(15),
	o => \regDataB[15]~input_o\);

-- Location: LCCOMB_X14_Y4_N30
\Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (\regDataB[15]~input_o\ & ((\regDataA[15]~input_o\ & (\Add0~29\ & VCC)) # (!\regDataA[15]~input_o\ & (!\Add0~29\)))) # (!\regDataB[15]~input_o\ & ((\regDataA[15]~input_o\ & (!\Add0~29\)) # (!\regDataA[15]~input_o\ & ((\Add0~29\) # 
-- (GND)))))
-- \Add0~31\ = CARRY((\regDataB[15]~input_o\ & (!\regDataA[15]~input_o\ & !\Add0~29\)) # (!\regDataB[15]~input_o\ & ((!\Add0~29\) # (!\regDataA[15]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[15]~input_o\,
	datab => \regDataA[15]~input_o\,
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X13_Y4_N0
\ALUResult[15]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~95_combout\ = (\Add0~30_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~30_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[15]~95_combout\);

-- Location: LCCOMB_X13_Y4_N30
\ALUResult~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult~97_combout\ = (\regDataB[15]~input_o\) # (\regDataA[15]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataB[15]~input_o\,
	datad => \regDataA[15]~input_o\,
	combout => \ALUResult~97_combout\);

-- Location: IOIBUF_X32_Y0_N8
\regDataA[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(16),
	o => \regDataA[16]~input_o\);

-- Location: LCCOMB_X13_Y4_N26
\Equal2~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~11_combout\ = \regDataB[15]~input_o\ $ (\regDataA[15]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataB[15]~input_o\,
	datad => \regDataA[15]~input_o\,
	combout => \Equal2~11_combout\);

-- Location: LCCOMB_X12_Y4_N24
\ALUResult[15]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~96_combout\ = (\ALUResult[0]~11_combout\ & (!\ALUResult[1]~19_combout\ & (\regDataA[16]~input_o\))) # (!\ALUResult[0]~11_combout\ & ((\ALUResult[1]~19_combout\) # ((\Equal2~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010101100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \ALUResult[1]~19_combout\,
	datac => \regDataA[16]~input_o\,
	datad => \Equal2~11_combout\,
	combout => \ALUResult[15]~96_combout\);

-- Location: LCCOMB_X12_Y4_N30
\ALUResult[15]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~98_combout\ = (\ALUResult[1]~19_combout\ & ((\ALUResult[15]~96_combout\ & (\ALUResult~97_combout\)) # (!\ALUResult[15]~96_combout\ & ((\regDataA[14]~input_o\))))) # (!\ALUResult[1]~19_combout\ & (((\ALUResult[15]~96_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult~97_combout\,
	datab => \regDataA[14]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \ALUResult[15]~96_combout\,
	combout => \ALUResult[15]~98_combout\);

-- Location: LCCOMB_X13_Y4_N18
\ALUResult[15]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~94_combout\ = (\regDataA[15]~input_o\ & (\Op_ARS~input_o\ & (\regDataB[15]~input_o\ & !\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[15]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataB[15]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[15]~94_combout\);

-- Location: LCCOMB_X13_Y4_N20
\ALUResult[15]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~99_combout\ = (\ALUResult[15]~95_combout\) # ((\ALUResult[15]~94_combout\) # ((\ALUResult[15]~98_combout\ & \ALUResult[1]~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[15]~95_combout\,
	datab => \ALUResult[15]~98_combout\,
	datac => \ALUResult[15]~94_combout\,
	datad => \ALUResult[1]~26_combout\,
	combout => \ALUResult[15]~99_combout\);

-- Location: LCCOMB_X13_Y4_N14
\ALUResult[15]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(15) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[15]~99_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[15]~99_combout\,
	datac => ALUResult(15),
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(15));

-- Location: IOIBUF_X13_Y24_N22
\regDataB[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(16),
	o => \regDataB[16]~input_o\);

-- Location: IOIBUF_X11_Y0_N15
\regDataA[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(17),
	o => \regDataA[17]~input_o\);

-- Location: LCCOMB_X12_Y3_N14
\ALUResult[16]~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~102_combout\ = (\ALUResult[1]~19_combout\ & (((\regDataA[15]~input_o\) # (!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & (\regDataA[17]~input_o\ & ((\ALUResult[0]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[17]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \regDataA[15]~input_o\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[16]~102_combout\);

-- Location: LCCOMB_X12_Y3_N12
\ALUResult[16]~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~103_combout\ = (\ALUResult[0]~11_combout\ & (((\ALUResult[16]~102_combout\)))) # (!\ALUResult[0]~11_combout\ & ((\regDataB[16]~input_o\ & ((\ALUResult[16]~102_combout\) # (!\regDataA[16]~input_o\))) # (!\regDataB[16]~input_o\ & 
-- (\regDataA[16]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[16]~input_o\,
	datab => \regDataA[16]~input_o\,
	datac => \ALUResult[16]~102_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[16]~103_combout\);

-- Location: LCCOMB_X14_Y3_N0
\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = ((\regDataB[16]~input_o\ $ (\regDataA[16]~input_o\ $ (!\Add0~31\)))) # (GND)
-- \Add0~33\ = CARRY((\regDataB[16]~input_o\ & ((\regDataA[16]~input_o\) # (!\Add0~31\))) # (!\regDataB[16]~input_o\ & (\regDataA[16]~input_o\ & !\Add0~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[16]~input_o\,
	datab => \regDataA[16]~input_o\,
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X12_Y3_N24
\ALUResult[16]~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~101_combout\ = (\Add0~32_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~32_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[16]~101_combout\);

-- Location: LCCOMB_X12_Y3_N30
\ALUResult[16]~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~100_combout\ = (!\Op_ADS~input_o\ & (\regDataA[16]~input_o\ & (\regDataB[16]~input_o\ & \Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \regDataA[16]~input_o\,
	datac => \regDataB[16]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[16]~100_combout\);

-- Location: LCCOMB_X12_Y3_N2
\ALUResult[16]~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~104_combout\ = (\ALUResult[16]~101_combout\) # ((\ALUResult[16]~100_combout\) # ((\ALUResult[16]~103_combout\ & \ALUResult[1]~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[16]~103_combout\,
	datab => \ALUResult[16]~101_combout\,
	datac => \ALUResult[16]~100_combout\,
	datad => \ALUResult[1]~26_combout\,
	combout => \ALUResult[16]~104_combout\);

-- Location: LCCOMB_X12_Y3_N28
\ALUResult[16]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(16) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[16]~104_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(16))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[16]~104_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(16),
	combout => ALUResult(16));

-- Location: IOIBUF_X11_Y0_N22
\regDataB[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(17),
	o => \regDataB[17]~input_o\);

-- Location: LCCOMB_X12_Y3_N6
\ALUResult[17]~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~108_combout\ = (\regDataB[17]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataA[17]~input_o\))) # (!\regDataB[17]~input_o\ & (\regDataA[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[17]~input_o\,
	datac => \regDataA[17]~input_o\,
	datad => \ALUResult[1]~19_combout\,
	combout => \ALUResult[17]~108_combout\);

-- Location: IOIBUF_X34_Y3_N22
\regDataA[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(18),
	o => \regDataA[18]~input_o\);

-- Location: LCCOMB_X12_Y3_N0
\ALUResult[17]~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~107_combout\ = (\ALUResult[1]~19_combout\ & (\regDataA[16]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[18]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[1]~19_combout\,
	datac => \regDataA[16]~input_o\,
	datad => \regDataA[18]~input_o\,
	combout => \ALUResult[17]~107_combout\);

-- Location: LCCOMB_X12_Y3_N26
\ALUResult[17]~180\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~180_combout\ = (\Op_XRS~input_o\ & (\ALUResult[17]~108_combout\)) # (!\Op_XRS~input_o\ & ((\Op_ORS~input_o\ & (\ALUResult[17]~108_combout\)) # (!\Op_ORS~input_o\ & ((\ALUResult[17]~107_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[17]~108_combout\,
	datab => \ALUResult[17]~107_combout\,
	datac => \Op_XRS~input_o\,
	datad => \Op_ORS~input_o\,
	combout => \ALUResult[17]~180_combout\);

-- Location: LCCOMB_X12_Y3_N22
\ALUResult[17]~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~106_combout\ = (\Op_ADS~input_o\) # ((\regDataB[17]~input_o\ & \regDataA[17]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[17]~input_o\,
	datac => \regDataA[17]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[17]~106_combout\);

-- Location: LCCOMB_X14_Y3_N2
\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (\regDataB[17]~input_o\ & ((\regDataA[17]~input_o\ & (\Add0~33\ & VCC)) # (!\regDataA[17]~input_o\ & (!\Add0~33\)))) # (!\regDataB[17]~input_o\ & ((\regDataA[17]~input_o\ & (!\Add0~33\)) # (!\regDataA[17]~input_o\ & ((\Add0~33\) # 
-- (GND)))))
-- \Add0~35\ = CARRY((\regDataB[17]~input_o\ & (!\regDataA[17]~input_o\ & !\Add0~33\)) # (!\regDataB[17]~input_o\ & ((!\Add0~33\) # (!\regDataA[17]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[17]~input_o\,
	datab => \regDataA[17]~input_o\,
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X12_Y3_N20
\ALUResult[17]~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~105_combout\ = (\Op_ADS~input_o\ & (\Add0~34_combout\)) # (!\Op_ADS~input_o\ & ((\Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~34_combout\,
	datab => \Op_ARS~input_o\,
	datac => \Op_ADS~input_o\,
	combout => \ALUResult[17]~105_combout\);

-- Location: LCCOMB_X12_Y3_N4
\ALUResult[17]~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~109_combout\ = (\ALUResult[17]~180_combout\ & ((\ALUResult[1]~26_combout\) # ((\ALUResult[17]~106_combout\ & \ALUResult[17]~105_combout\)))) # (!\ALUResult[17]~180_combout\ & (\ALUResult[17]~106_combout\ & ((\ALUResult[17]~105_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[17]~180_combout\,
	datab => \ALUResult[17]~106_combout\,
	datac => \ALUResult[1]~26_combout\,
	datad => \ALUResult[17]~105_combout\,
	combout => \ALUResult[17]~109_combout\);

-- Location: LCCOMB_X12_Y3_N10
\ALUResult[17]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(17) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[17]~109_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(17))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[17]~109_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(17),
	combout => ALUResult(17));

-- Location: IOIBUF_X11_Y0_N1
\regDataA[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(19),
	o => \regDataA[19]~input_o\);

-- Location: LCCOMB_X12_Y3_N18
\ALUResult[18]~112\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~112_combout\ = (\ALUResult[0]~11_combout\ & ((\ALUResult[1]~19_combout\ & ((\regDataA[17]~input_o\))) # (!\ALUResult[1]~19_combout\ & (\regDataA[19]~input_o\)))) # (!\ALUResult[0]~11_combout\ & (((\ALUResult[1]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[19]~input_o\,
	datab => \ALUResult[0]~11_combout\,
	datac => \regDataA[17]~input_o\,
	datad => \ALUResult[1]~19_combout\,
	combout => \ALUResult[18]~112_combout\);

-- Location: IOIBUF_X1_Y0_N8
\regDataB[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(18),
	o => \regDataB[18]~input_o\);

-- Location: LCCOMB_X12_Y3_N16
\ALUResult[18]~113\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~113_combout\ = (\ALUResult[0]~11_combout\ & (\ALUResult[18]~112_combout\)) # (!\ALUResult[0]~11_combout\ & ((\regDataB[18]~input_o\ & ((\ALUResult[18]~112_combout\) # (!\regDataA[18]~input_o\))) # (!\regDataB[18]~input_o\ & 
-- ((\regDataA[18]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[18]~112_combout\,
	datab => \ALUResult[0]~11_combout\,
	datac => \regDataB[18]~input_o\,
	datad => \regDataA[18]~input_o\,
	combout => \ALUResult[18]~113_combout\);

-- Location: LCCOMB_X14_Y3_N4
\Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = ((\regDataA[18]~input_o\ $ (\regDataB[18]~input_o\ $ (!\Add0~35\)))) # (GND)
-- \Add0~37\ = CARRY((\regDataA[18]~input_o\ & ((\regDataB[18]~input_o\) # (!\Add0~35\))) # (!\regDataA[18]~input_o\ & (\regDataB[18]~input_o\ & !\Add0~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[18]~input_o\,
	datab => \regDataB[18]~input_o\,
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: LCCOMB_X13_Y3_N16
\ALUResult[18]~111\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~111_combout\ = (\Add0~36_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~36_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[18]~111_combout\);

-- Location: LCCOMB_X13_Y3_N18
\ALUResult[18]~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~110_combout\ = (\Op_ARS~input_o\ & (!\Op_ADS~input_o\ & (\regDataA[18]~input_o\ & \regDataB[18]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \Op_ADS~input_o\,
	datac => \regDataA[18]~input_o\,
	datad => \regDataB[18]~input_o\,
	combout => \ALUResult[18]~110_combout\);

-- Location: LCCOMB_X13_Y3_N2
\ALUResult[18]~114\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~114_combout\ = (\ALUResult[18]~111_combout\) # ((\ALUResult[18]~110_combout\) # ((\ALUResult[18]~113_combout\ & \ALUResult[1]~26_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[18]~113_combout\,
	datab => \ALUResult[18]~111_combout\,
	datac => \ALUResult[18]~110_combout\,
	datad => \ALUResult[1]~26_combout\,
	combout => \ALUResult[18]~114_combout\);

-- Location: LCCOMB_X13_Y3_N20
\ALUResult[18]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(18) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[18]~114_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[18]~114_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(18),
	combout => ALUResult(18));

-- Location: IOIBUF_X13_Y24_N8
\regDataB[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(19),
	o => \regDataB[19]~input_o\);

-- Location: LCCOMB_X14_Y3_N6
\Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (\regDataB[19]~input_o\ & ((\regDataA[19]~input_o\ & (\Add0~37\ & VCC)) # (!\regDataA[19]~input_o\ & (!\Add0~37\)))) # (!\regDataB[19]~input_o\ & ((\regDataA[19]~input_o\ & (!\Add0~37\)) # (!\regDataA[19]~input_o\ & ((\Add0~37\) # 
-- (GND)))))
-- \Add0~39\ = CARRY((\regDataB[19]~input_o\ & (!\regDataA[19]~input_o\ & !\Add0~37\)) # (!\regDataB[19]~input_o\ & ((!\Add0~37\) # (!\regDataA[19]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[19]~input_o\,
	datab => \regDataA[19]~input_o\,
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: LCCOMB_X13_Y3_N6
\ALUResult[19]~116\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~116_combout\ = (\Op_ARS~input_o\ & (\regDataA[19]~input_o\ & (\regDataB[19]~input_o\))) # (!\Op_ARS~input_o\ & (\ALUResult[1]~19_combout\ & ((\regDataA[19]~input_o\) # (\regDataB[19]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[19]~input_o\,
	datab => \regDataB[19]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[19]~116_combout\);

-- Location: LCCOMB_X13_Y3_N14
\Equal2~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~14_combout\ = \regDataA[19]~input_o\ $ (\regDataB[19]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[19]~input_o\,
	datac => \regDataB[19]~input_o\,
	combout => \Equal2~14_combout\);

-- Location: IOIBUF_X34_Y7_N15
\regDataA[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(20),
	o => \regDataA[20]~input_o\);

-- Location: LCCOMB_X13_Y3_N8
\ALUResult[19]~115\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~115_combout\ = (\ALUResult[1]~19_combout\ & (((\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & ((\ALUResult[0]~11_combout\ & ((\regDataA[20]~input_o\))) # (!\ALUResult[0]~11_combout\ & (\Equal2~14_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \Equal2~14_combout\,
	datac => \regDataA[20]~input_o\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[19]~115_combout\);

-- Location: LCCOMB_X13_Y3_N28
\ALUResult[19]~117\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~117_combout\ = (\Op_ARS~input_o\ & (((\ALUResult[19]~116_combout\)))) # (!\Op_ARS~input_o\ & (((\regDataA[18]~input_o\)) # (!\ALUResult[1]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110100110001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[18]~input_o\,
	datad => \ALUResult[19]~116_combout\,
	combout => \ALUResult[19]~117_combout\);

-- Location: LCCOMB_X13_Y3_N26
\ALUResult[19]~118\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~118_combout\ = (\ALUResult[19]~115_combout\ & ((\ALUResult[19]~117_combout\))) # (!\ALUResult[19]~115_combout\ & (\ALUResult[19]~116_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[19]~116_combout\,
	datac => \ALUResult[19]~115_combout\,
	datad => \ALUResult[19]~117_combout\,
	combout => \ALUResult[19]~118_combout\);

-- Location: LCCOMB_X18_Y4_N6
\ALUResult[19]~119\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~119_combout\ = (\Op_ADS~input_o\ & (\Add0~38_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[19]~118_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datac => \Add0~38_combout\,
	datad => \ALUResult[19]~118_combout\,
	combout => \ALUResult[19]~119_combout\);

-- Location: LCCOMB_X18_Y4_N4
\ALUResult[19]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(19) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[19]~119_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[19]~119_combout\,
	datac => ALUResult(19),
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(19));

-- Location: IOIBUF_X32_Y0_N1
\regDataB[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(20),
	o => \regDataB[20]~input_o\);

-- Location: LCCOMB_X14_Y3_N8
\Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = ((\regDataA[20]~input_o\ $ (\regDataB[20]~input_o\ $ (!\Add0~39\)))) # (GND)
-- \Add0~41\ = CARRY((\regDataA[20]~input_o\ & ((\regDataB[20]~input_o\) # (!\Add0~39\))) # (!\regDataA[20]~input_o\ & (\regDataB[20]~input_o\ & !\Add0~39\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[20]~input_o\,
	datab => \regDataB[20]~input_o\,
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: IOIBUF_X32_Y0_N22
\regDataA[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(21),
	o => \regDataA[21]~input_o\);

-- Location: LCCOMB_X13_Y3_N12
\ALUResult[20]~120\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~120_combout\ = ((\ALUResult[1]~19_combout\ & (\regDataA[19]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[21]~input_o\)))) # (!\ALUResult[0]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[19]~input_o\,
	datab => \regDataA[21]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[20]~120_combout\);

-- Location: LCCOMB_X13_Y3_N22
\ALUResult[20]~121\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~121_combout\ = (\Op_ARS~input_o\ & (((\regDataA[20]~input_o\ & \regDataB[20]~input_o\)))) # (!\Op_ARS~input_o\ & ((\regDataA[20]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataB[20]~input_o\))) # (!\regDataA[20]~input_o\ & 
-- ((\regDataB[20]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[20]~input_o\,
	datad => \regDataB[20]~input_o\,
	combout => \ALUResult[20]~121_combout\);

-- Location: LCCOMB_X13_Y3_N24
\ALUResult[20]~122\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~122_combout\ = (\Op_ARS~input_o\ & (((\ALUResult[20]~121_combout\)))) # (!\Op_ARS~input_o\ & ((\ALUResult[0]~11_combout\ & (\ALUResult[20]~120_combout\)) # (!\ALUResult[0]~11_combout\ & ((\ALUResult[20]~121_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[20]~120_combout\,
	datab => \Op_ARS~input_o\,
	datac => \ALUResult[20]~121_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[20]~122_combout\);

-- Location: LCCOMB_X13_Y3_N30
\ALUResult[20]~123\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~123_combout\ = (\Op_ADS~input_o\ & (\Add0~40_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[20]~122_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~40_combout\,
	datac => \Op_ADS~input_o\,
	datad => \ALUResult[20]~122_combout\,
	combout => \ALUResult[20]~123_combout\);

-- Location: LCCOMB_X13_Y3_N10
\ALUResult[20]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(20) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[20]~123_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[20]~123_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(20),
	combout => ALUResult(20));

-- Location: IOIBUF_X25_Y0_N1
\regDataB[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(21),
	o => \regDataB[21]~input_o\);

-- Location: LCCOMB_X14_Y3_N10
\Add0~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~42_combout\ = (\regDataB[21]~input_o\ & ((\regDataA[21]~input_o\ & (\Add0~41\ & VCC)) # (!\regDataA[21]~input_o\ & (!\Add0~41\)))) # (!\regDataB[21]~input_o\ & ((\regDataA[21]~input_o\ & (!\Add0~41\)) # (!\regDataA[21]~input_o\ & ((\Add0~41\) # 
-- (GND)))))
-- \Add0~43\ = CARRY((\regDataB[21]~input_o\ & (!\regDataA[21]~input_o\ & !\Add0~41\)) # (!\regDataB[21]~input_o\ & ((!\Add0~41\) # (!\regDataA[21]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[21]~input_o\,
	datab => \regDataA[21]~input_o\,
	datad => VCC,
	cin => \Add0~41\,
	combout => \Add0~42_combout\,
	cout => \Add0~43\);

-- Location: LCCOMB_X19_Y4_N16
\ALUResult[21]~124\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~124_combout\ = (\ALUResult[0]~11_combout\ & (((\ALUResult[1]~19_combout\)))) # (!\ALUResult[0]~11_combout\ & ((\regDataA[21]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataB[21]~input_o\))) # (!\regDataA[21]~input_o\ & 
-- (\regDataB[21]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[21]~input_o\,
	datab => \regDataB[21]~input_o\,
	datac => \ALUResult[0]~11_combout\,
	datad => \ALUResult[1]~19_combout\,
	combout => \ALUResult[21]~124_combout\);

-- Location: IOIBUF_X25_Y0_N15
\regDataA[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(22),
	o => \regDataA[22]~input_o\);

-- Location: LCCOMB_X19_Y4_N30
\ALUResult[21]~125\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~125_combout\ = (\ALUResult[0]~11_combout\ & ((\ALUResult[21]~124_combout\ & ((\regDataA[20]~input_o\))) # (!\ALUResult[21]~124_combout\ & (\regDataA[22]~input_o\)))) # (!\ALUResult[0]~11_combout\ & (\ALUResult[21]~124_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \ALUResult[21]~124_combout\,
	datac => \regDataA[22]~input_o\,
	datad => \regDataA[20]~input_o\,
	combout => \ALUResult[21]~125_combout\);

-- Location: LCCOMB_X19_Y4_N12
\ALUResult[21]~126\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~126_combout\ = (\Op_ARS~input_o\ & (((\regDataB[21]~input_o\ & \regDataA[21]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[21]~125_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[21]~125_combout\,
	datab => \regDataB[21]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \regDataA[21]~input_o\,
	combout => \ALUResult[21]~126_combout\);

-- Location: LCCOMB_X18_Y4_N8
\ALUResult[21]~127\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~127_combout\ = (\Op_ADS~input_o\ & (\Add0~42_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[21]~126_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \Add0~42_combout\,
	datad => \ALUResult[21]~126_combout\,
	combout => \ALUResult[21]~127_combout\);

-- Location: LCCOMB_X18_Y4_N2
\ALUResult[21]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(21) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[21]~127_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(21)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(21),
	datac => \ALUResult[21]~127_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(21));

-- Location: IOIBUF_X30_Y0_N15
\regDataB[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(22),
	o => \regDataB[22]~input_o\);

-- Location: LCCOMB_X19_Y4_N6
\ALUResult[22]~128\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[22]~128_combout\ = (\ALUResult[0]~11_combout\) # ((\regDataB[22]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataA[22]~input_o\))) # (!\regDataB[22]~input_o\ & ((\regDataA[22]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[22]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[22]~input_o\,
	combout => \ALUResult[22]~128_combout\);

-- Location: LCCOMB_X19_Y4_N0
\ALUResult[22]~129\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[22]~129_combout\ = (\Op_ARS~input_o\ & (\regDataB[22]~input_o\ & (\regDataA[22]~input_o\))) # (!\Op_ARS~input_o\ & (((\ALUResult[22]~128_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[22]~input_o\,
	datab => \regDataA[22]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \ALUResult[22]~128_combout\,
	combout => \ALUResult[22]~129_combout\);

-- Location: IOIBUF_X25_Y0_N22
\regDataA[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(23),
	o => \regDataA[23]~input_o\);

-- Location: LCCOMB_X19_Y4_N2
\ALUResult[22]~130\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[22]~130_combout\ = ((\ALUResult[1]~19_combout\ & (\regDataA[21]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[23]~input_o\)))) # (!\ALUResult[0]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[21]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[23]~input_o\,
	combout => \ALUResult[22]~130_combout\);

-- Location: LCCOMB_X19_Y4_N20
\ALUResult[22]~131\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[22]~131_combout\ = (\Op_ARS~input_o\) # (\ALUResult[22]~130_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Op_ARS~input_o\,
	datad => \ALUResult[22]~130_combout\,
	combout => \ALUResult[22]~131_combout\);

-- Location: LCCOMB_X14_Y3_N12
\Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = ((\regDataA[22]~input_o\ $ (\regDataB[22]~input_o\ $ (!\Add0~43\)))) # (GND)
-- \Add0~45\ = CARRY((\regDataA[22]~input_o\ & ((\regDataB[22]~input_o\) # (!\Add0~43\))) # (!\regDataA[22]~input_o\ & (\regDataB[22]~input_o\ & !\Add0~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[22]~input_o\,
	datab => \regDataB[22]~input_o\,
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: LCCOMB_X18_Y4_N22
\ALUResult[22]~132\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[22]~132_combout\ = (\Op_ADS~input_o\ & (((\Add0~44_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[22]~129_combout\ & (\ALUResult[22]~131_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \ALUResult[22]~129_combout\,
	datac => \ALUResult[22]~131_combout\,
	datad => \Add0~44_combout\,
	combout => \ALUResult[22]~132_combout\);

-- Location: LCCOMB_X18_Y4_N20
\ALUResult[22]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(22) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[22]~132_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(22),
	datac => \ALUResult[22]~132_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(22));

-- Location: IOIBUF_X30_Y0_N1
\regDataB[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(23),
	o => \regDataB[23]~input_o\);

-- Location: LCCOMB_X19_Y4_N8
\ALUResult[23]~134\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~134_combout\ = (\Op_ARS~input_o\ & (\regDataB[23]~input_o\ & ((\regDataA[23]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[1]~19_combout\ & ((\regDataB[23]~input_o\) # (\regDataA[23]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[23]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \Op_ARS~input_o\,
	datad => \regDataA[23]~input_o\,
	combout => \ALUResult[23]~134_combout\);

-- Location: LCCOMB_X19_Y4_N22
\ALUResult[23]~135\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~135_combout\ = (\Op_ARS~input_o\ & (\ALUResult[23]~134_combout\)) # (!\Op_ARS~input_o\ & (((\regDataA[22]~input_o\) # (!\ALUResult[1]~19_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \ALUResult[23]~134_combout\,
	datac => \regDataA[22]~input_o\,
	datad => \ALUResult[1]~19_combout\,
	combout => \ALUResult[23]~135_combout\);

-- Location: LCCOMB_X19_Y4_N4
\Equal2~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~17_combout\ = \regDataA[23]~input_o\ $ (\regDataB[23]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataA[23]~input_o\,
	datad => \regDataB[23]~input_o\,
	combout => \Equal2~17_combout\);

-- Location: IOIBUF_X34_Y6_N15
\regDataA[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(24),
	o => \regDataA[24]~input_o\);

-- Location: LCCOMB_X19_Y4_N26
\ALUResult[23]~133\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~133_combout\ = (\ALUResult[0]~11_combout\ & ((\ALUResult[1]~19_combout\) # ((\regDataA[24]~input_o\)))) # (!\ALUResult[0]~11_combout\ & (!\ALUResult[1]~19_combout\ & (\Equal2~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101010011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \ALUResult[1]~19_combout\,
	datac => \Equal2~17_combout\,
	datad => \regDataA[24]~input_o\,
	combout => \ALUResult[23]~133_combout\);

-- Location: LCCOMB_X19_Y4_N28
\ALUResult[23]~136\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~136_combout\ = (\ALUResult[23]~133_combout\ & (\ALUResult[23]~135_combout\)) # (!\ALUResult[23]~133_combout\ & ((\ALUResult[23]~134_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[23]~135_combout\,
	datab => \ALUResult[23]~134_combout\,
	datac => \ALUResult[23]~133_combout\,
	combout => \ALUResult[23]~136_combout\);

-- Location: LCCOMB_X14_Y3_N14
\Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (\regDataB[23]~input_o\ & ((\regDataA[23]~input_o\ & (\Add0~45\ & VCC)) # (!\regDataA[23]~input_o\ & (!\Add0~45\)))) # (!\regDataB[23]~input_o\ & ((\regDataA[23]~input_o\ & (!\Add0~45\)) # (!\regDataA[23]~input_o\ & ((\Add0~45\) # 
-- (GND)))))
-- \Add0~47\ = CARRY((\regDataB[23]~input_o\ & (!\regDataA[23]~input_o\ & !\Add0~45\)) # (!\regDataB[23]~input_o\ & ((!\Add0~45\) # (!\regDataA[23]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[23]~input_o\,
	datab => \regDataA[23]~input_o\,
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

-- Location: LCCOMB_X18_Y4_N0
\ALUResult[23]~137\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~137_combout\ = (\Op_ADS~input_o\ & ((\Add0~46_combout\))) # (!\Op_ADS~input_o\ & (\ALUResult[23]~136_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \ALUResult[23]~136_combout\,
	datad => \Add0~46_combout\,
	combout => \ALUResult[23]~137_combout\);

-- Location: LCCOMB_X18_Y4_N14
\ALUResult[23]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(23) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[23]~137_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(23),
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => \ALUResult[23]~137_combout\,
	combout => ALUResult(23));

-- Location: IOIBUF_X16_Y24_N1
\regDataB[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(24),
	o => \regDataB[24]~input_o\);

-- Location: LCCOMB_X14_Y3_N16
\Add0~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~48_combout\ = ((\regDataA[24]~input_o\ $ (\regDataB[24]~input_o\ $ (!\Add0~47\)))) # (GND)
-- \Add0~49\ = CARRY((\regDataA[24]~input_o\ & ((\regDataB[24]~input_o\) # (!\Add0~47\))) # (!\regDataA[24]~input_o\ & (\regDataB[24]~input_o\ & !\Add0~47\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[24]~input_o\,
	datab => \regDataB[24]~input_o\,
	datad => VCC,
	cin => \Add0~47\,
	combout => \Add0~48_combout\,
	cout => \Add0~49\);

-- Location: LCCOMB_X16_Y3_N30
\ALUResult[24]~139\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~139_combout\ = (\Add0~48_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~48_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[24]~139_combout\);

-- Location: LCCOMB_X16_Y3_N16
\ALUResult[24]~138\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~138_combout\ = (\regDataB[24]~input_o\ & (\regDataA[24]~input_o\ & (!\Op_ADS~input_o\ & \Op_ARS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[24]~input_o\,
	datab => \regDataA[24]~input_o\,
	datac => \Op_ADS~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[24]~138_combout\);

-- Location: IOIBUF_X16_Y0_N8
\regDataA[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(25),
	o => \regDataA[25]~input_o\);

-- Location: LCCOMB_X16_Y3_N4
\ALUResult[24]~140\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~140_combout\ = (\ALUResult[1]~19_combout\ & (((\regDataA[23]~input_o\) # (!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & (\regDataA[25]~input_o\ & ((\ALUResult[0]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[25]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \regDataA[23]~input_o\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[24]~140_combout\);

-- Location: LCCOMB_X16_Y3_N2
\ALUResult[24]~141\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~141_combout\ = (\ALUResult[0]~11_combout\ & (((\ALUResult[24]~140_combout\)))) # (!\ALUResult[0]~11_combout\ & ((\regDataB[24]~input_o\ & ((\ALUResult[24]~140_combout\) # (!\regDataA[24]~input_o\))) # (!\regDataB[24]~input_o\ & 
-- ((\regDataA[24]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \regDataB[24]~input_o\,
	datac => \ALUResult[24]~140_combout\,
	datad => \regDataA[24]~input_o\,
	combout => \ALUResult[24]~141_combout\);

-- Location: LCCOMB_X16_Y3_N12
\ALUResult[24]~142\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~142_combout\ = (\ALUResult[24]~139_combout\) # ((\ALUResult[24]~138_combout\) # ((\ALUResult[1]~26_combout\ & \ALUResult[24]~141_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[24]~139_combout\,
	datab => \ALUResult[1]~26_combout\,
	datac => \ALUResult[24]~138_combout\,
	datad => \ALUResult[24]~141_combout\,
	combout => \ALUResult[24]~142_combout\);

-- Location: LCCOMB_X16_Y3_N10
\ALUResult[24]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(24) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[24]~142_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(24),
	datac => \ALUResult[24]~142_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(24));

-- Location: IOIBUF_X16_Y24_N8
\regDataB[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(25),
	o => \regDataB[25]~input_o\);

-- Location: LCCOMB_X14_Y3_N18
\Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (\regDataA[25]~input_o\ & ((\regDataB[25]~input_o\ & (\Add0~49\ & VCC)) # (!\regDataB[25]~input_o\ & (!\Add0~49\)))) # (!\regDataA[25]~input_o\ & ((\regDataB[25]~input_o\ & (!\Add0~49\)) # (!\regDataB[25]~input_o\ & ((\Add0~49\) # 
-- (GND)))))
-- \Add0~51\ = CARRY((\regDataA[25]~input_o\ & (!\regDataB[25]~input_o\ & !\Add0~49\)) # (!\regDataA[25]~input_o\ & ((!\Add0~49\) # (!\regDataB[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[25]~input_o\,
	datab => \regDataB[25]~input_o\,
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

-- Location: IOIBUF_X34_Y3_N15
\regDataA[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(26),
	o => \regDataA[26]~input_o\);

-- Location: LCCOMB_X16_Y3_N14
\ALUResult[25]~143\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~143_combout\ = (\ALUResult[0]~11_combout\ & (((\ALUResult[1]~19_combout\)))) # (!\ALUResult[0]~11_combout\ & ((\regDataA[25]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataB[25]~input_o\))) # (!\regDataA[25]~input_o\ & 
-- (\regDataB[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[25]~input_o\,
	datab => \regDataB[25]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[25]~143_combout\);

-- Location: LCCOMB_X16_Y3_N24
\ALUResult[25]~144\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~144_combout\ = (\ALUResult[0]~11_combout\ & ((\ALUResult[25]~143_combout\ & ((\regDataA[24]~input_o\))) # (!\ALUResult[25]~143_combout\ & (\regDataA[26]~input_o\)))) # (!\ALUResult[0]~11_combout\ & (((\ALUResult[25]~143_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \regDataA[26]~input_o\,
	datac => \ALUResult[25]~143_combout\,
	datad => \regDataA[24]~input_o\,
	combout => \ALUResult[25]~144_combout\);

-- Location: LCCOMB_X16_Y3_N18
\ALUResult[25]~145\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~145_combout\ = (\Op_ARS~input_o\ & (\regDataA[25]~input_o\ & ((\regDataB[25]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[25]~144_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[25]~input_o\,
	datab => \ALUResult[25]~144_combout\,
	datac => \regDataB[25]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[25]~145_combout\);

-- Location: LCCOMB_X17_Y3_N24
\ALUResult[25]~146\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~146_combout\ = (\Op_ADS~input_o\ & (\Add0~50_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[25]~145_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datac => \Add0~50_combout\,
	datad => \ALUResult[25]~145_combout\,
	combout => \ALUResult[25]~146_combout\);

-- Location: LCCOMB_X17_Y3_N20
\ALUResult[25]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(25) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[25]~146_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[25]~146_combout\,
	datac => ALUResult(25),
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(25));

-- Location: IOIBUF_X16_Y24_N15
\regDataB[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(26),
	o => \regDataB[26]~input_o\);

-- Location: LCCOMB_X14_Y3_N20
\Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = ((\regDataB[26]~input_o\ $ (\regDataA[26]~input_o\ $ (!\Add0~51\)))) # (GND)
-- \Add0~53\ = CARRY((\regDataB[26]~input_o\ & ((\regDataA[26]~input_o\) # (!\Add0~51\))) # (!\regDataB[26]~input_o\ & (\regDataA[26]~input_o\ & !\Add0~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[26]~input_o\,
	datab => \regDataA[26]~input_o\,
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

-- Location: IOIBUF_X16_Y0_N1
\regDataA[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(27),
	o => \regDataA[27]~input_o\);

-- Location: LCCOMB_X16_Y3_N0
\ALUResult[26]~149\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~149_combout\ = ((\ALUResult[1]~19_combout\ & (\regDataA[25]~input_o\)) # (!\ALUResult[1]~19_combout\ & ((\regDataA[27]~input_o\)))) # (!\ALUResult[0]~11_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100011111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[25]~input_o\,
	datab => \ALUResult[1]~19_combout\,
	datac => \regDataA[27]~input_o\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[26]~149_combout\);

-- Location: LCCOMB_X16_Y3_N26
\ALUResult[26]~150\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~150_combout\ = (\Op_ARS~input_o\) # (\ALUResult[26]~149_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ARS~input_o\,
	datad => \ALUResult[26]~149_combout\,
	combout => \ALUResult[26]~150_combout\);

-- Location: LCCOMB_X16_Y3_N8
\ALUResult[26]~147\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~147_combout\ = (\ALUResult[0]~11_combout\) # ((\regDataA[26]~input_o\ & ((\ALUResult[1]~19_combout\) # (!\regDataB[26]~input_o\))) # (!\regDataA[26]~input_o\ & ((\regDataB[26]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~11_combout\,
	datab => \regDataA[26]~input_o\,
	datac => \ALUResult[1]~19_combout\,
	datad => \regDataB[26]~input_o\,
	combout => \ALUResult[26]~147_combout\);

-- Location: LCCOMB_X16_Y3_N6
\ALUResult[26]~148\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~148_combout\ = (\Op_ARS~input_o\ & (\regDataB[26]~input_o\ & ((\regDataA[26]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[26]~147_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[26]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \ALUResult[26]~147_combout\,
	datad => \regDataA[26]~input_o\,
	combout => \ALUResult[26]~148_combout\);

-- Location: LCCOMB_X16_Y3_N20
\ALUResult[26]~151\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~151_combout\ = (\Op_ADS~input_o\ & (\Add0~52_combout\)) # (!\Op_ADS~input_o\ & (((\ALUResult[26]~150_combout\ & \ALUResult[26]~148_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~52_combout\,
	datab => \Op_ADS~input_o\,
	datac => \ALUResult[26]~150_combout\,
	datad => \ALUResult[26]~148_combout\,
	combout => \ALUResult[26]~151_combout\);

-- Location: LCCOMB_X17_Y3_N10
\ALUResult[26]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(26) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[26]~151_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(26),
	datab => \ALUResult[26]~151_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(26));

-- Location: IOIBUF_X18_Y0_N8
\regDataB[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(27),
	o => \regDataB[27]~input_o\);

-- Location: LCCOMB_X17_Y3_N28
\ALUResult~153\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult~153_combout\ = (\regDataA[27]~input_o\) # (\regDataB[27]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataA[27]~input_o\,
	datad => \regDataB[27]~input_o\,
	combout => \ALUResult~153_combout\);

-- Location: LCCOMB_X17_Y3_N14
\Equal2~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~20_combout\ = \regDataA[27]~input_o\ $ (\regDataB[27]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \regDataA[27]~input_o\,
	datad => \regDataB[27]~input_o\,
	combout => \Equal2~20_combout\);

-- Location: IOIBUF_X18_Y0_N15
\regDataA[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(28),
	o => \regDataA[28]~input_o\);

-- Location: LCCOMB_X17_Y3_N22
\ALUResult[27]~152\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[27]~152_combout\ = (\ALUResult[1]~19_combout\ & (((!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & ((\ALUResult[0]~11_combout\ & ((\regDataA[28]~input_o\))) # (!\ALUResult[0]~11_combout\ & (\Equal2~20_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101111000001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \Equal2~20_combout\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[28]~input_o\,
	combout => \ALUResult[27]~152_combout\);

-- Location: LCCOMB_X17_Y3_N30
\ALUResult[27]~154\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[27]~154_combout\ = (\ALUResult[1]~19_combout\ & ((\ALUResult[27]~152_combout\ & (\ALUResult~153_combout\)) # (!\ALUResult[27]~152_combout\ & ((\regDataA[26]~input_o\))))) # (!\ALUResult[1]~19_combout\ & (((\ALUResult[27]~152_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \ALUResult~153_combout\,
	datac => \ALUResult[27]~152_combout\,
	datad => \regDataA[26]~input_o\,
	combout => \ALUResult[27]~154_combout\);

-- Location: LCCOMB_X17_Y3_N4
\ALUResult[27]~155\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[27]~155_combout\ = (\Op_ARS~input_o\ & (((\regDataB[27]~input_o\ & \regDataA[27]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[27]~154_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[27]~154_combout\,
	datab => \regDataB[27]~input_o\,
	datac => \regDataA[27]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[27]~155_combout\);

-- Location: LCCOMB_X14_Y3_N22
\Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (\regDataB[27]~input_o\ & ((\regDataA[27]~input_o\ & (\Add0~53\ & VCC)) # (!\regDataA[27]~input_o\ & (!\Add0~53\)))) # (!\regDataB[27]~input_o\ & ((\regDataA[27]~input_o\ & (!\Add0~53\)) # (!\regDataA[27]~input_o\ & ((\Add0~53\) # 
-- (GND)))))
-- \Add0~55\ = CARRY((\regDataB[27]~input_o\ & (!\regDataA[27]~input_o\ & !\Add0~53\)) # (!\regDataB[27]~input_o\ & ((!\Add0~53\) # (!\regDataA[27]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[27]~input_o\,
	datab => \regDataA[27]~input_o\,
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

-- Location: LCCOMB_X17_Y3_N26
\ALUResult[27]~156\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[27]~156_combout\ = (\Op_ADS~input_o\ & ((\Add0~54_combout\))) # (!\Op_ADS~input_o\ & (\ALUResult[27]~155_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \ALUResult[27]~155_combout\,
	datad => \Add0~54_combout\,
	combout => \ALUResult[27]~156_combout\);

-- Location: LCCOMB_X17_Y3_N16
\ALUResult[27]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(27) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[27]~156_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(27),
	datac => \ALUResult[27]~156_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(27));

-- Location: IOIBUF_X30_Y0_N22
\regDataB[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(28),
	o => \regDataB[28]~input_o\);

-- Location: LCCOMB_X14_Y3_N24
\Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = ((\regDataA[28]~input_o\ $ (\regDataB[28]~input_o\ $ (!\Add0~55\)))) # (GND)
-- \Add0~57\ = CARRY((\regDataA[28]~input_o\ & ((\regDataB[28]~input_o\) # (!\Add0~55\))) # (!\regDataA[28]~input_o\ & (\regDataB[28]~input_o\ & !\Add0~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[28]~input_o\,
	datab => \regDataB[28]~input_o\,
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

-- Location: IOIBUF_X16_Y0_N22
\regDataA[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(29),
	o => \regDataA[29]~input_o\);

-- Location: LCCOMB_X17_Y3_N12
\ALUResult[28]~157\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~157_combout\ = (\ALUResult[1]~19_combout\ & ((\regDataA[27]~input_o\) # ((!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & (((\ALUResult[0]~11_combout\ & \regDataA[29]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101010001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \regDataA[27]~input_o\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[29]~input_o\,
	combout => \ALUResult[28]~157_combout\);

-- Location: LCCOMB_X17_Y3_N2
\ALUResult[28]~158\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~158_combout\ = (\ALUResult[0]~11_combout\ & (\ALUResult[28]~157_combout\)) # (!\ALUResult[0]~11_combout\ & ((\regDataB[28]~input_o\ & ((\ALUResult[28]~157_combout\) # (!\regDataA[28]~input_o\))) # (!\regDataB[28]~input_o\ & 
-- ((\regDataA[28]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[28]~157_combout\,
	datab => \regDataB[28]~input_o\,
	datac => \ALUResult[0]~11_combout\,
	datad => \regDataA[28]~input_o\,
	combout => \ALUResult[28]~158_combout\);

-- Location: LCCOMB_X17_Y3_N0
\ALUResult[28]~159\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~159_combout\ = (\Op_ARS~input_o\ & (\regDataA[28]~input_o\ & ((\regDataB[28]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[28]~158_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[28]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \ALUResult[28]~158_combout\,
	datad => \regDataB[28]~input_o\,
	combout => \ALUResult[28]~159_combout\);

-- Location: LCCOMB_X17_Y3_N18
\ALUResult[28]~160\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~160_combout\ = (\Op_ADS~input_o\ & (\Add0~56_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[28]~159_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datac => \Add0~56_combout\,
	datad => \ALUResult[28]~159_combout\,
	combout => \ALUResult[28]~160_combout\);

-- Location: LCCOMB_X17_Y3_N6
\ALUResult[28]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(28) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[28]~160_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(28),
	datac => \ALUResult[28]~160_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(28));

-- Location: IOIBUF_X34_Y9_N15
\regDataB[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(29),
	o => \regDataB[29]~input_o\);

-- Location: LCCOMB_X11_Y3_N20
\ALUResult~162\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult~162_combout\ = (\regDataA[29]~input_o\) # (\regDataB[29]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataA[29]~input_o\,
	datad => \regDataB[29]~input_o\,
	combout => \ALUResult~162_combout\);

-- Location: IOIBUF_X7_Y0_N8
\regDataA[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(30),
	o => \regDataA[30]~input_o\);

-- Location: LCCOMB_X11_Y3_N6
\Equal2~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~23_combout\ = \regDataA[29]~input_o\ $ (\regDataB[29]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataA[29]~input_o\,
	datad => \regDataB[29]~input_o\,
	combout => \Equal2~23_combout\);

-- Location: LCCOMB_X11_Y3_N14
\ALUResult[29]~161\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[29]~161_combout\ = (\ALUResult[1]~19_combout\ & (!\ALUResult[0]~11_combout\)) # (!\ALUResult[1]~19_combout\ & ((\ALUResult[0]~11_combout\ & (\regDataA[30]~input_o\)) # (!\ALUResult[0]~11_combout\ & ((\Equal2~23_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111001101100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \ALUResult[0]~11_combout\,
	datac => \regDataA[30]~input_o\,
	datad => \Equal2~23_combout\,
	combout => \ALUResult[29]~161_combout\);

-- Location: LCCOMB_X11_Y3_N22
\ALUResult[29]~163\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[29]~163_combout\ = (\ALUResult[1]~19_combout\ & ((\ALUResult[29]~161_combout\ & (\ALUResult~162_combout\)) # (!\ALUResult[29]~161_combout\ & ((\regDataA[28]~input_o\))))) # (!\ALUResult[1]~19_combout\ & (((\ALUResult[29]~161_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \ALUResult~162_combout\,
	datac => \ALUResult[29]~161_combout\,
	datad => \regDataA[28]~input_o\,
	combout => \ALUResult[29]~163_combout\);

-- Location: LCCOMB_X11_Y3_N8
\ALUResult[29]~164\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[29]~164_combout\ = (\Op_ARS~input_o\ & (((\regDataA[29]~input_o\ & \regDataB[29]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[29]~163_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[29]~163_combout\,
	datab => \regDataA[29]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \regDataB[29]~input_o\,
	combout => \ALUResult[29]~164_combout\);

-- Location: LCCOMB_X14_Y3_N26
\Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (\regDataB[29]~input_o\ & ((\regDataA[29]~input_o\ & (\Add0~57\ & VCC)) # (!\regDataA[29]~input_o\ & (!\Add0~57\)))) # (!\regDataB[29]~input_o\ & ((\regDataA[29]~input_o\ & (!\Add0~57\)) # (!\regDataA[29]~input_o\ & ((\Add0~57\) # 
-- (GND)))))
-- \Add0~59\ = CARRY((\regDataB[29]~input_o\ & (!\regDataA[29]~input_o\ & !\Add0~57\)) # (!\regDataB[29]~input_o\ & ((!\Add0~57\) # (!\regDataA[29]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[29]~input_o\,
	datab => \regDataA[29]~input_o\,
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

-- Location: LCCOMB_X11_Y3_N18
\ALUResult[29]~165\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[29]~165_combout\ = (\Op_ADS~input_o\ & ((\Add0~58_combout\))) # (!\Op_ADS~input_o\ & (\ALUResult[29]~164_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[29]~164_combout\,
	datac => \Add0~58_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[29]~165_combout\);

-- Location: LCCOMB_X11_Y3_N10
\ALUResult[29]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(29) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[29]~165_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(29)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(29),
	datac => \ALUResult[29]~165_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(29));

-- Location: IOIBUF_X7_Y0_N1
\regDataB[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(30),
	o => \regDataB[30]~input_o\);

-- Location: LCCOMB_X14_Y3_N28
\Add0~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~60_combout\ = ((\regDataB[30]~input_o\ $ (\regDataA[30]~input_o\ $ (!\Add0~59\)))) # (GND)
-- \Add0~61\ = CARRY((\regDataB[30]~input_o\ & ((\regDataA[30]~input_o\) # (!\Add0~59\))) # (!\regDataB[30]~input_o\ & (\regDataA[30]~input_o\ & !\Add0~59\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[30]~input_o\,
	datab => \regDataA[30]~input_o\,
	datad => VCC,
	cin => \Add0~59\,
	combout => \Add0~60_combout\,
	cout => \Add0~61\);

-- Location: LCCOMB_X11_Y3_N28
\ALUResult[30]~166\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~166_combout\ = (\ALUResult[1]~19_combout\ & ((\regDataA[29]~input_o\) # ((!\ALUResult[0]~11_combout\)))) # (!\ALUResult[1]~19_combout\ & (((\regDataA[31]~input_o\ & \ALUResult[0]~11_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~19_combout\,
	datab => \regDataA[29]~input_o\,
	datac => \regDataA[31]~input_o\,
	datad => \ALUResult[0]~11_combout\,
	combout => \ALUResult[30]~166_combout\);

-- Location: LCCOMB_X11_Y3_N26
\ALUResult[30]~167\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~167_combout\ = (\ALUResult[0]~11_combout\ & (((\ALUResult[30]~166_combout\)))) # (!\ALUResult[0]~11_combout\ & ((\regDataA[30]~input_o\ & ((\ALUResult[30]~166_combout\) # (!\regDataB[30]~input_o\))) # (!\regDataA[30]~input_o\ & 
-- (\regDataB[30]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[30]~input_o\,
	datab => \ALUResult[0]~11_combout\,
	datac => \regDataB[30]~input_o\,
	datad => \ALUResult[30]~166_combout\,
	combout => \ALUResult[30]~167_combout\);

-- Location: LCCOMB_X11_Y3_N0
\ALUResult[30]~168\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~168_combout\ = (\Op_ARS~input_o\ & (\regDataB[30]~input_o\ & ((\regDataA[30]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[30]~167_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[30]~input_o\,
	datab => \ALUResult[30]~167_combout\,
	datac => \Op_ARS~input_o\,
	datad => \regDataA[30]~input_o\,
	combout => \ALUResult[30]~168_combout\);

-- Location: LCCOMB_X11_Y3_N30
\ALUResult[30]~169\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~169_combout\ = (\Op_ADS~input_o\ & (\Add0~60_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[30]~168_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~60_combout\,
	datac => \ALUResult[30]~168_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[30]~169_combout\);

-- Location: LCCOMB_X11_Y3_N16
\ALUResult[30]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(30) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (\ALUResult[30]~169_combout\)) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((ALUResult(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[30]~169_combout\,
	datac => \ALUResult[31]~17clkctrl_outclk\,
	datad => ALUResult(30),
	combout => ALUResult(30));

-- Location: IOIBUF_X0_Y7_N1
\regDataB[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(31),
	o => \regDataB[31]~input_o\);

-- Location: LCCOMB_X9_Y3_N20
\ALUResult[31]~173\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~173_combout\ = (\regDataB[31]~input_o\ & ((\Op_ORS~input_o\) # (!\regDataA[31]~input_o\))) # (!\regDataB[31]~input_o\ & (\regDataA[31]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[31]~input_o\,
	datab => \regDataA[31]~input_o\,
	datad => \Op_ORS~input_o\,
	combout => \ALUResult[31]~173_combout\);

-- Location: LCCOMB_X9_Y3_N10
\ALUResult[31]~171\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~171_combout\ = (\ALUResult[31]~16_combout\ & ((\Op_RR1~input_o\ & ((\regDataA[0]~input_o\))) # (!\Op_RR1~input_o\ & (\regDataA[31]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[31]~16_combout\,
	datab => \regDataA[31]~input_o\,
	datac => \Op_RR1~input_o\,
	datad => \regDataA[0]~input_o\,
	combout => \ALUResult[31]~171_combout\);

-- Location: LCCOMB_X9_Y3_N16
\ALUResult[31]~170\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~170_combout\ = (!\Op_XRS~input_o\ & ((\Op_LS1~input_o\) # ((!\Op_RS1~input_o\ & \Op_LR1~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~input_o\,
	datab => \Op_LS1~input_o\,
	datac => \Op_LR1~input_o\,
	datad => \Op_XRS~input_o\,
	combout => \ALUResult[31]~170_combout\);

-- Location: LCCOMB_X9_Y3_N4
\ALUResult[31]~172\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~172_combout\ = (\ALUResult[31]~171_combout\) # ((\regDataA[30]~input_o\ & \ALUResult[31]~170_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[31]~171_combout\,
	datac => \regDataA[30]~input_o\,
	datad => \ALUResult[31]~170_combout\,
	combout => \ALUResult[31]~172_combout\);

-- Location: LCCOMB_X9_Y3_N2
\ALUResult[31]~174\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~174_combout\ = (\Op_ORS~input_o\ & (((\ALUResult[31]~173_combout\)))) # (!\Op_ORS~input_o\ & ((\ALUResult[31]~172_combout\) # ((\Op_XRS~input_o\ & \ALUResult[31]~173_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_XRS~input_o\,
	datab => \ALUResult[31]~173_combout\,
	datac => \ALUResult[31]~172_combout\,
	datad => \Op_ORS~input_o\,
	combout => \ALUResult[31]~174_combout\);

-- Location: LCCOMB_X9_Y3_N6
\ALUResult[31]~175\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~175_combout\ = (\Op_ARS~input_o\ & (\regDataB[31]~input_o\ & (\regDataA[31]~input_o\))) # (!\Op_ARS~input_o\ & (((\ALUResult[31]~174_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[31]~input_o\,
	datab => \regDataA[31]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \ALUResult[31]~174_combout\,
	combout => \ALUResult[31]~175_combout\);

-- Location: LCCOMB_X14_Y3_N30
\Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = \regDataB[31]~input_o\ $ (\Add0~61\ $ (\regDataA[31]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[31]~input_o\,
	datad => \regDataA[31]~input_o\,
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

-- Location: LCCOMB_X11_Y3_N24
\ALUResult[31]~176\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~176_combout\ = (\Op_ADS~input_o\ & ((\Add0~62_combout\))) # (!\Op_ADS~input_o\ & (\ALUResult[31]~175_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[31]~175_combout\,
	datab => \Add0~62_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[31]~176_combout\);

-- Location: LCCOMB_X11_Y3_N2
\ALUResult[31]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(31) = (GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & ((\ALUResult[31]~176_combout\))) # (!GLOBAL(\ALUResult[31]~17clkctrl_outclk\) & (ALUResult(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(31),
	datac => \ALUResult[31]~176_combout\,
	datad => \ALUResult[31]~17clkctrl_outclk\,
	combout => ALUResult(31));

-- Location: LCCOMB_X18_Y4_N10
\Equal0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~6_combout\ = (!ALUResult(24) & (!ALUResult(22) & (!ALUResult(23) & !ALUResult(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(24),
	datab => ALUResult(22),
	datac => ALUResult(23),
	datad => ALUResult(21),
	combout => \Equal0~6_combout\);

-- Location: LCCOMB_X17_Y3_N8
\Equal0~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~7_combout\ = (!ALUResult(28) & (!ALUResult(25) & (!ALUResult(27) & !ALUResult(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(28),
	datab => ALUResult(25),
	datac => ALUResult(27),
	datad => ALUResult(26),
	combout => \Equal0~7_combout\);

-- Location: LCCOMB_X11_Y3_N4
\Equal0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~8_combout\ = (!ALUResult(29) & (!ALUResult(31) & (\Equal0~7_combout\ & !ALUResult(30))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(29),
	datab => ALUResult(31),
	datac => \Equal0~7_combout\,
	datad => ALUResult(30),
	combout => \Equal0~8_combout\);

-- Location: LCCOMB_X13_Y3_N0
\Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (!ALUResult(17) & (!ALUResult(18) & (!ALUResult(19) & !ALUResult(20))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(17),
	datab => ALUResult(18),
	datac => ALUResult(19),
	datad => ALUResult(20),
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X10_Y4_N8
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (!ALUResult(9) & (!ALUResult(12) & (!ALUResult(10) & !ALUResult(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(9),
	datab => ALUResult(12),
	datac => ALUResult(10),
	datad => ALUResult(11),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X13_Y4_N8
\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (!ALUResult(16) & (!ALUResult(14) & (!ALUResult(15) & !ALUResult(13))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(16),
	datab => ALUResult(14),
	datac => ALUResult(15),
	datad => ALUResult(13),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X9_Y4_N24
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!ALUResult(5) & (!ALUResult(8) & (!ALUResult(6) & !ALUResult(7))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(5),
	datab => ALUResult(8),
	datac => ALUResult(6),
	datad => ALUResult(7),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X19_Y4_N24
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!ALUResult(1) & (!ALUResult(4) & (!ALUResult(3) & !ALUResult(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(1),
	datab => ALUResult(4),
	datac => ALUResult(3),
	datad => ALUResult(2),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X18_Y4_N28
\Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~2_combout\ & (\Equal0~3_combout\ & (\Equal0~1_combout\ & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \Equal0~3_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~0_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X18_Y4_N16
\Equal0~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~9_combout\ = (\Equal0~6_combout\ & (\Equal0~8_combout\ & (\Equal0~5_combout\ & \Equal0~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~6_combout\,
	datab => \Equal0~8_combout\,
	datac => \Equal0~5_combout\,
	datad => \Equal0~4_combout\,
	combout => \Equal0~9_combout\);

-- Location: LCCOMB_X18_Y4_N26
\Equal0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~10_combout\ = (!ALUResult(0) & \Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => ALUResult(0),
	datad => \Equal0~9_combout\,
	combout => \Equal0~10_combout\);

-- Location: LCCOMB_X18_Y4_N24
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (ALUResult(0) & \Equal0~9_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => ALUResult(0),
	datad => \Equal0~9_combout\,
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X9_Y3_N14
\CarrySet~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \CarrySet~0_combout\ = (\regDataB[31]~input_o\ & (\Op_ADS~input_o\ & \regDataA[31]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[31]~input_o\,
	datac => \Op_ADS~input_o\,
	datad => \regDataA[31]~input_o\,
	combout => \CarrySet~0_combout\);

-- Location: LCCOMB_X10_Y4_N14
\Equal2~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~7_combout\ = (\regDataA[9]~input_o\ & (\regDataB[9]~input_o\ & (\regDataB[8]~input_o\ $ (!\regDataA[8]~input_o\)))) # (!\regDataA[9]~input_o\ & (!\regDataB[9]~input_o\ & (\regDataB[8]~input_o\ $ (!\regDataA[8]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[9]~input_o\,
	datab => \regDataB[8]~input_o\,
	datac => \regDataA[8]~input_o\,
	datad => \regDataB[9]~input_o\,
	combout => \Equal2~7_combout\);

-- Location: LCCOMB_X11_Y4_N14
\Equal2~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~9_combout\ = (!\Equal2~8_combout\ & (\Equal2~7_combout\ & (\regDataA[10]~input_o\ $ (!\regDataB[10]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[10]~input_o\,
	datab => \Equal2~8_combout\,
	datac => \regDataB[10]~input_o\,
	datad => \Equal2~7_combout\,
	combout => \Equal2~9_combout\);

-- Location: LCCOMB_X9_Y3_N18
\Equal2~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~22_combout\ = (\regDataB[30]~input_o\ & (\regDataA[30]~input_o\ & (\regDataA[31]~input_o\ $ (!\regDataB[31]~input_o\)))) # (!\regDataB[30]~input_o\ & (!\regDataA[30]~input_o\ & (\regDataA[31]~input_o\ $ (!\regDataB[31]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[30]~input_o\,
	datab => \regDataA[31]~input_o\,
	datac => \regDataA[30]~input_o\,
	datad => \regDataB[31]~input_o\,
	combout => \Equal2~22_combout\);

-- Location: LCCOMB_X11_Y3_N12
\Equal2~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~24_combout\ = (!\Equal2~23_combout\ & (\Equal2~22_combout\ & (\regDataB[28]~input_o\ $ (!\regDataA[28]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~23_combout\,
	datab => \regDataB[28]~input_o\,
	datac => \Equal2~22_combout\,
	datad => \regDataA[28]~input_o\,
	combout => \Equal2~24_combout\);

-- Location: LCCOMB_X16_Y3_N28
\Equal2~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~19_combout\ = (\regDataB[24]~input_o\ & (\regDataA[24]~input_o\ & (\regDataB[25]~input_o\ $ (!\regDataA[25]~input_o\)))) # (!\regDataB[24]~input_o\ & (!\regDataA[24]~input_o\ & (\regDataB[25]~input_o\ $ (!\regDataA[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000001001000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[24]~input_o\,
	datab => \regDataB[25]~input_o\,
	datac => \regDataA[25]~input_o\,
	datad => \regDataA[24]~input_o\,
	combout => \Equal2~19_combout\);

-- Location: LCCOMB_X16_Y3_N22
\Equal2~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~21_combout\ = (\Equal2~19_combout\ & (!\Equal2~20_combout\ & (\regDataB[26]~input_o\ $ (!\regDataA[26]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[26]~input_o\,
	datab => \Equal2~19_combout\,
	datac => \Equal2~20_combout\,
	datad => \regDataA[26]~input_o\,
	combout => \Equal2~21_combout\);

-- Location: LCCOMB_X12_Y3_N8
\Equal2~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~13_combout\ = (\regDataB[17]~input_o\ & (\regDataA[17]~input_o\ & (\regDataA[16]~input_o\ $ (!\regDataB[16]~input_o\)))) # (!\regDataB[17]~input_o\ & (!\regDataA[17]~input_o\ & (\regDataA[16]~input_o\ $ (!\regDataB[16]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[17]~input_o\,
	datab => \regDataA[16]~input_o\,
	datac => \regDataA[17]~input_o\,
	datad => \regDataB[16]~input_o\,
	combout => \Equal2~13_combout\);

-- Location: LCCOMB_X13_Y3_N4
\Equal2~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~15_combout\ = (\Equal2~13_combout\ & (!\Equal2~14_combout\ & (\regDataA[18]~input_o\ $ (!\regDataB[18]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~13_combout\,
	datab => \Equal2~14_combout\,
	datac => \regDataA[18]~input_o\,
	datad => \regDataB[18]~input_o\,
	combout => \Equal2~15_combout\);

-- Location: LCCOMB_X19_Y4_N18
\Equal2~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~16_combout\ = (\regDataA[21]~input_o\ & (\regDataB[21]~input_o\ & (\regDataB[20]~input_o\ $ (!\regDataA[20]~input_o\)))) # (!\regDataA[21]~input_o\ & (!\regDataB[21]~input_o\ & (\regDataB[20]~input_o\ $ (!\regDataA[20]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[21]~input_o\,
	datab => \regDataB[21]~input_o\,
	datac => \regDataB[20]~input_o\,
	datad => \regDataA[20]~input_o\,
	combout => \Equal2~16_combout\);

-- Location: LCCOMB_X19_Y4_N14
\Equal2~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~18_combout\ = (!\Equal2~17_combout\ & (\Equal2~16_combout\ & (\regDataA[22]~input_o\ $ (!\regDataB[22]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[22]~input_o\,
	datab => \Equal2~17_combout\,
	datac => \regDataB[22]~input_o\,
	datad => \Equal2~16_combout\,
	combout => \Equal2~18_combout\);

-- Location: LCCOMB_X12_Y4_N4
\Equal2~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~25_combout\ = (\Equal2~24_combout\ & (\Equal2~21_combout\ & (\Equal2~15_combout\ & \Equal2~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~24_combout\,
	datab => \Equal2~21_combout\,
	datac => \Equal2~15_combout\,
	datad => \Equal2~18_combout\,
	combout => \Equal2~25_combout\);

-- Location: LCCOMB_X17_Y4_N8
\Equal2~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~1_combout\ = (\regDataB[4]~input_o\ & (\regDataA[4]~input_o\ & (\regDataA[5]~input_o\ $ (!\regDataB[5]~input_o\)))) # (!\regDataB[4]~input_o\ & (!\regDataA[4]~input_o\ & (\regDataA[5]~input_o\ $ (!\regDataB[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[4]~input_o\,
	datab => \regDataA[5]~input_o\,
	datac => \regDataA[4]~input_o\,
	datad => \regDataB[5]~input_o\,
	combout => \Equal2~1_combout\);

-- Location: LCCOMB_X16_Y4_N30
\Equal2~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~3_combout\ = (\Equal2~1_combout\ & (!\Equal2~2_combout\ & (\regDataB[6]~input_o\ $ (!\regDataA[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[6]~input_o\,
	datab => \regDataA[6]~input_o\,
	datac => \Equal2~1_combout\,
	datad => \Equal2~2_combout\,
	combout => \Equal2~3_combout\);

-- Location: LCCOMB_X16_Y4_N28
\Equal2~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~0_combout\ = (\regDataB[1]~input_o\ & (\regDataA[1]~input_o\ & (\regDataB[0]~input_o\ $ (!\regDataA[0]~input_o\)))) # (!\regDataB[1]~input_o\ & (!\regDataA[1]~input_o\ & (\regDataB[0]~input_o\ $ (!\regDataA[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000010000100001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[1]~input_o\,
	datab => \regDataB[0]~input_o\,
	datac => \regDataA[1]~input_o\,
	datad => \regDataA[0]~input_o\,
	combout => \Equal2~0_combout\);

-- Location: LCCOMB_X16_Y4_N8
\Equal2~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~6_combout\ = (\Equal2~3_combout\ & (\Equal2~0_combout\ & (!\Equal2~5_combout\ & !\Equal2~4_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~3_combout\,
	datab => \Equal2~0_combout\,
	datac => \Equal2~5_combout\,
	datad => \Equal2~4_combout\,
	combout => \Equal2~6_combout\);

-- Location: LCCOMB_X12_Y4_N12
\Equal2~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~10_combout\ = (\regDataB[12]~input_o\ & (\regDataA[12]~input_o\ & (\regDataB[13]~input_o\ $ (!\regDataA[13]~input_o\)))) # (!\regDataB[12]~input_o\ & (!\regDataA[12]~input_o\ & (\regDataB[13]~input_o\ $ (!\regDataA[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001000000001001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[12]~input_o\,
	datab => \regDataA[12]~input_o\,
	datac => \regDataB[13]~input_o\,
	datad => \regDataA[13]~input_o\,
	combout => \Equal2~10_combout\);

-- Location: LCCOMB_X12_Y4_N6
\Equal2~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~12_combout\ = (\Equal2~10_combout\ & (!\Equal2~11_combout\ & (\regDataA[14]~input_o\ $ (!\regDataB[14]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~10_combout\,
	datab => \Equal2~11_combout\,
	datac => \regDataA[14]~input_o\,
	datad => \regDataB[14]~input_o\,
	combout => \Equal2~12_combout\);

-- Location: LCCOMB_X12_Y4_N22
\Equal2~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal2~26_combout\ = (\Equal2~9_combout\ & (\Equal2~25_combout\ & (\Equal2~6_combout\ & \Equal2~12_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal2~9_combout\,
	datab => \Equal2~25_combout\,
	datac => \Equal2~6_combout\,
	datad => \Equal2~12_combout\,
	combout => \Equal2~26_combout\);

-- Location: IOIBUF_X34_Y19_N1
\Op_MUL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_MUL,
	o => \Op_MUL~input_o\);

-- Location: IOIBUF_X3_Y24_N22
\Op_CMP~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_CMP,
	o => \Op_CMP~input_o\);

ww_ALUDataOut(0) <= \ALUDataOut[0]~output_o\;

ww_ALUDataOut(1) <= \ALUDataOut[1]~output_o\;

ww_ALUDataOut(2) <= \ALUDataOut[2]~output_o\;

ww_ALUDataOut(3) <= \ALUDataOut[3]~output_o\;

ww_ALUDataOut(4) <= \ALUDataOut[4]~output_o\;

ww_ALUDataOut(5) <= \ALUDataOut[5]~output_o\;

ww_ALUDataOut(6) <= \ALUDataOut[6]~output_o\;

ww_ALUDataOut(7) <= \ALUDataOut[7]~output_o\;

ww_ALUDataOut(8) <= \ALUDataOut[8]~output_o\;

ww_ALUDataOut(9) <= \ALUDataOut[9]~output_o\;

ww_ALUDataOut(10) <= \ALUDataOut[10]~output_o\;

ww_ALUDataOut(11) <= \ALUDataOut[11]~output_o\;

ww_ALUDataOut(12) <= \ALUDataOut[12]~output_o\;

ww_ALUDataOut(13) <= \ALUDataOut[13]~output_o\;

ww_ALUDataOut(14) <= \ALUDataOut[14]~output_o\;

ww_ALUDataOut(15) <= \ALUDataOut[15]~output_o\;

ww_ALUDataOut(16) <= \ALUDataOut[16]~output_o\;

ww_ALUDataOut(17) <= \ALUDataOut[17]~output_o\;

ww_ALUDataOut(18) <= \ALUDataOut[18]~output_o\;

ww_ALUDataOut(19) <= \ALUDataOut[19]~output_o\;

ww_ALUDataOut(20) <= \ALUDataOut[20]~output_o\;

ww_ALUDataOut(21) <= \ALUDataOut[21]~output_o\;

ww_ALUDataOut(22) <= \ALUDataOut[22]~output_o\;

ww_ALUDataOut(23) <= \ALUDataOut[23]~output_o\;

ww_ALUDataOut(24) <= \ALUDataOut[24]~output_o\;

ww_ALUDataOut(25) <= \ALUDataOut[25]~output_o\;

ww_ALUDataOut(26) <= \ALUDataOut[26]~output_o\;

ww_ALUDataOut(27) <= \ALUDataOut[27]~output_o\;

ww_ALUDataOut(28) <= \ALUDataOut[28]~output_o\;

ww_ALUDataOut(29) <= \ALUDataOut[29]~output_o\;

ww_ALUDataOut(30) <= \ALUDataOut[30]~output_o\;

ww_ALUDataOut(31) <= \ALUDataOut[31]~output_o\;

ww_CondCodeBits(0) <= \CondCodeBits[0]~output_o\;

ww_CondCodeBits(1) <= \CondCodeBits[1]~output_o\;

ww_CondCodeBits(2) <= \CondCodeBits[2]~output_o\;

ww_CondCodeBits(3) <= \CondCodeBits[3]~output_o\;

ww_CondCodeBits(4) <= \CondCodeBits[4]~output_o\;

ww_CondCodeBits(5) <= \CondCodeBits[5]~output_o\;

ww_CondCodeBits(6) <= \CondCodeBits[6]~output_o\;

ww_CondCodeBits(7) <= \CondCodeBits[7]~output_o\;

ww_CondCodeBits(8) <= \CondCodeBits[8]~output_o\;

ww_CondCodeBits(9) <= \CondCodeBits[9]~output_o\;

ww_CondCodeBits(10) <= \CondCodeBits[10]~output_o\;

ww_CondCodeBits(11) <= \CondCodeBits[11]~output_o\;

ww_CondCodeBits(12) <= \CondCodeBits[12]~output_o\;

ww_CondCodeBits(13) <= \CondCodeBits[13]~output_o\;

ww_CondCodeBits(14) <= \CondCodeBits[14]~output_o\;

ww_CondCodeBits(15) <= \CondCodeBits[15]~output_o\;

ww_CondCodeBits(16) <= \CondCodeBits[16]~output_o\;

ww_CondCodeBits(17) <= \CondCodeBits[17]~output_o\;

ww_CondCodeBits(18) <= \CondCodeBits[18]~output_o\;

ww_CondCodeBits(19) <= \CondCodeBits[19]~output_o\;

ww_CondCodeBits(20) <= \CondCodeBits[20]~output_o\;

ww_CondCodeBits(21) <= \CondCodeBits[21]~output_o\;

ww_CondCodeBits(22) <= \CondCodeBits[22]~output_o\;

ww_CondCodeBits(23) <= \CondCodeBits[23]~output_o\;

ww_CondCodeBits(24) <= \CondCodeBits[24]~output_o\;

ww_CondCodeBits(25) <= \CondCodeBits[25]~output_o\;

ww_CondCodeBits(26) <= \CondCodeBits[26]~output_o\;

ww_CondCodeBits(27) <= \CondCodeBits[27]~output_o\;

ww_CondCodeBits(28) <= \CondCodeBits[28]~output_o\;

ww_CondCodeBits(29) <= \CondCodeBits[29]~output_o\;

ww_CondCodeBits(30) <= \CondCodeBits[30]~output_o\;

ww_CondCodeBits(31) <= \CondCodeBits[31]~output_o\;
END structure;


