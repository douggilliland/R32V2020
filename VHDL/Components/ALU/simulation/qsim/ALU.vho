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

-- DATE "05/06/2019 06:45:11"

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
	regDataA : IN std_logic_vector(31 DOWNTO 0);
	regDataB : IN std_logic_vector(31 DOWNTO 0);
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
	ALUDataOut : OUT std_logic_vector(31 DOWNTO 0)
	);
END ALU;

-- Design Ports Information
-- Op_MUL	=>  Location: PIN_Y2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_CMP	=>  Location: PIN_Y1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[0]	=>  Location: PIN_J13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[1]	=>  Location: PIN_A6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[2]	=>  Location: PIN_C2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[3]	=>  Location: PIN_G18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[4]	=>  Location: PIN_B8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[5]	=>  Location: PIN_C11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[6]	=>  Location: PIN_A7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[7]	=>  Location: PIN_D9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[8]	=>  Location: PIN_AC12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[9]	=>  Location: PIN_D17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[10]	=>  Location: PIN_E12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[11]	=>  Location: PIN_B10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[12]	=>  Location: PIN_D7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[13]	=>  Location: PIN_C7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[14]	=>  Location: PIN_D16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[15]	=>  Location: PIN_D15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[16]	=>  Location: PIN_G11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[17]	=>  Location: PIN_G17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[18]	=>  Location: PIN_D8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[19]	=>  Location: PIN_G15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[20]	=>  Location: PIN_A21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[21]	=>  Location: PIN_G9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[22]	=>  Location: PIN_A8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[23]	=>  Location: PIN_F8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[24]	=>  Location: PIN_A18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[25]	=>  Location: PIN_B3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[26]	=>  Location: PIN_C20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[27]	=>  Location: PIN_D19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[28]	=>  Location: PIN_H19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[29]	=>  Location: PIN_A19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[30]	=>  Location: PIN_A3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ALUDataOut[31]	=>  Location: PIN_G10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[0]	=>  Location: PIN_D12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[0]	=>  Location: PIN_C15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ADS	=>  Location: PIN_A12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_XRS	=>  Location: PIN_C14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ARS	=>  Location: PIN_D14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ORS	=>  Location: PIN_F14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[1]	=>  Location: PIN_H16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[31]	=>  Location: PIN_C13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LR1	=>  Location: PIN_C16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RS1	=>  Location: PIN_H15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LS1	=>  Location: PIN_C19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RA1	=>  Location: PIN_G21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RR1	=>  Location: PIN_E24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[1]	=>  Location: PIN_D10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[2]	=>  Location: PIN_J14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[2]	=>  Location: PIN_J19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[3]	=>  Location: PIN_F15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[3]	=>  Location: PIN_G13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[4]	=>  Location: PIN_H17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[4]	=>  Location: PIN_A4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[5]	=>  Location: PIN_J15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[5]	=>  Location: PIN_B21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[6]	=>  Location: PIN_A10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[6]	=>  Location: PIN_B4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[7]	=>  Location: PIN_E14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[7]	=>  Location: PIN_J12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[8]	=>  Location: PIN_D11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[8]	=>  Location: PIN_G12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[9]	=>  Location: PIN_C9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[9]	=>  Location: PIN_A11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[10]	=>  Location: PIN_C10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[10]	=>  Location: PIN_C8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[11]	=>  Location: PIN_H13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[11]	=>  Location: PIN_B11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[12]	=>  Location: PIN_E10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[12]	=>  Location: PIN_D6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[13]	=>  Location: PIN_F17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[13]	=>  Location: PIN_J10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[14]	=>  Location: PIN_G16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[14]	=>  Location: PIN_E17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[15]	=>  Location: PIN_B6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[15]	=>  Location: PIN_D13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[16]	=>  Location: PIN_F7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[16]	=>  Location: PIN_A17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[17]	=>  Location: PIN_B17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[17]	=>  Location: PIN_C12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[18]	=>  Location: PIN_AF14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[18]	=>  Location: PIN_G19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[19]	=>  Location: PIN_H12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[19]	=>  Location: PIN_E11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[20]	=>  Location: PIN_H10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[20]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[21]	=>  Location: PIN_B18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[21]	=>  Location: PIN_G14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[22]	=>  Location: PIN_F12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[22]	=>  Location: PIN_F10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[23]	=>  Location: PIN_B7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[23]	=>  Location: PIN_B19,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[24]	=>  Location: PIN_H21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[24]	=>  Location: PIN_J16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[25]	=>  Location: PIN_E7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[25]	=>  Location: PIN_G22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[26]	=>  Location: PIN_C6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[26]	=>  Location: PIN_D5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[27]	=>  Location: PIN_J17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[27]	=>  Location: PIN_H8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[28]	=>  Location: PIN_F11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[28]	=>  Location: PIN_E25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[29]	=>  Location: PIN_E8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[29]	=>  Location: PIN_H14,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataA[30]	=>  Location: PIN_G20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[30]	=>  Location: PIN_G8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- regDataB[31]	=>  Location: PIN_C17,	 I/O Standard: 2.5 V,	 Current Strength: Default


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
SIGNAL ww_regDataA : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_regDataB : std_logic_vector(31 DOWNTO 0);
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
SIGNAL ww_ALUDataOut : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALUResult[31]~23clkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
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
SIGNAL \regDataA[0]~input_o\ : std_logic;
SIGNAL \regDataB[0]~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Op_ADS~input_o\ : std_logic;
SIGNAL \Op_ORS~input_o\ : std_logic;
SIGNAL \ALUResult[0]~15_combout\ : std_logic;
SIGNAL \Op_RS1~input_o\ : std_logic;
SIGNAL \regDataA[31]~input_o\ : std_logic;
SIGNAL \Op_LR1~input_o\ : std_logic;
SIGNAL \regDataA[1]~input_o\ : std_logic;
SIGNAL \ALUResult[0]~16_combout\ : std_logic;
SIGNAL \Op_XRS~input_o\ : std_logic;
SIGNAL \ALUResult[0]~17_combout\ : std_logic;
SIGNAL \Op_LS1~input_o\ : std_logic;
SIGNAL \ALUResult[0]~18_combout\ : std_logic;
SIGNAL \Op_ARS~input_o\ : std_logic;
SIGNAL \ALUResult[0]~19_combout\ : std_logic;
SIGNAL \ALUResult[0]~14_combout\ : std_logic;
SIGNAL \ALUResult[0]~20_combout\ : std_logic;
SIGNAL \Op_RA1~input_o\ : std_logic;
SIGNAL \Op_RR1~input_o\ : std_logic;
SIGNAL \ALUResult[31]~21_combout\ : std_logic;
SIGNAL \ALUResult[1]~22_combout\ : std_logic;
SIGNAL \ALUResult[31]~23_combout\ : std_logic;
SIGNAL \ALUResult[31]~23clkctrl_outclk\ : std_logic;
SIGNAL \regDataB[1]~input_o\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \ALUResult[1]~25_combout\ : std_logic;
SIGNAL \ALUResult[30]~26_combout\ : std_logic;
SIGNAL \ALUResult[1]~27_combout\ : std_logic;
SIGNAL \regDataA[2]~input_o\ : std_logic;
SIGNAL \ALUResult[1]~28_combout\ : std_logic;
SIGNAL \ALUResult[1]~29_combout\ : std_logic;
SIGNAL \ALUResult[1]~24_combout\ : std_logic;
SIGNAL \ALUResult[1]~30_combout\ : std_logic;
SIGNAL \regDataB[2]~input_o\ : std_logic;
SIGNAL \ALUResult[2]~32_combout\ : std_logic;
SIGNAL \ALUResult[2]~34_combout\ : std_logic;
SIGNAL \regDataA[3]~input_o\ : std_logic;
SIGNAL \ALUResult[2]~33_combout\ : std_logic;
SIGNAL \ALUResult[2]~175_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \ALUResult[2]~31_combout\ : std_logic;
SIGNAL \ALUResult[2]~35_combout\ : std_logic;
SIGNAL \regDataB[3]~input_o\ : std_logic;
SIGNAL \ALUResult[3]~36_combout\ : std_logic;
SIGNAL \ALUResult[3]~37_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \regDataA[4]~input_o\ : std_logic;
SIGNAL \ALUResult[3]~38_combout\ : std_logic;
SIGNAL \ALUResult[3]~39_combout\ : std_logic;
SIGNAL \ALUResult[3]~40_combout\ : std_logic;
SIGNAL \regDataB[4]~input_o\ : std_logic;
SIGNAL \ALUResult[4]~41_combout\ : std_logic;
SIGNAL \regDataA[5]~input_o\ : std_logic;
SIGNAL \ALUResult[4]~42_combout\ : std_logic;
SIGNAL \ALUResult[4]~43_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \ALUResult[4]~44_combout\ : std_logic;
SIGNAL \regDataB[5]~input_o\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \regDataA[6]~input_o\ : std_logic;
SIGNAL \ALUResult[5]~47_combout\ : std_logic;
SIGNAL \ALUResult[5]~48_combout\ : std_logic;
SIGNAL \ALUResult[5]~45_combout\ : std_logic;
SIGNAL \ALUResult[5]~46_combout\ : std_logic;
SIGNAL \ALUResult[5]~49_combout\ : std_logic;
SIGNAL \regDataB[6]~input_o\ : std_logic;
SIGNAL \ALUResult[6]~53_combout\ : std_logic;
SIGNAL \regDataA[7]~input_o\ : std_logic;
SIGNAL \ALUResult[6]~52_combout\ : std_logic;
SIGNAL \ALUResult[6]~176_combout\ : std_logic;
SIGNAL \ALUResult[6]~51_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \ALUResult[6]~50_combout\ : std_logic;
SIGNAL \ALUResult[6]~54_combout\ : std_logic;
SIGNAL \regDataA[8]~input_o\ : std_logic;
SIGNAL \ALUResult[7]~57_combout\ : std_logic;
SIGNAL \ALUResult[7]~58_combout\ : std_logic;
SIGNAL \regDataB[7]~input_o\ : std_logic;
SIGNAL \ALUResult[7]~55_combout\ : std_logic;
SIGNAL \ALUResult[7]~56_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \ALUResult[7]~59_combout\ : std_logic;
SIGNAL \regDataA[9]~input_o\ : std_logic;
SIGNAL \ALUResult[8]~62_combout\ : std_logic;
SIGNAL \regDataB[8]~input_o\ : std_logic;
SIGNAL \ALUResult[8]~63_combout\ : std_logic;
SIGNAL \ALUResult[8]~177_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \ALUResult[8]~60_combout\ : std_logic;
SIGNAL \ALUResult[8]~61_combout\ : std_logic;
SIGNAL \ALUResult[8]~64_combout\ : std_logic;
SIGNAL \regDataA[10]~input_o\ : std_logic;
SIGNAL \ALUResult[9]~67_combout\ : std_logic;
SIGNAL \regDataB[9]~input_o\ : std_logic;
SIGNAL \ALUResult[9]~68_combout\ : std_logic;
SIGNAL \ALUResult[9]~65_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \ALUResult[9]~66_combout\ : std_logic;
SIGNAL \ALUResult[9]~69_combout\ : std_logic;
SIGNAL \regDataB[10]~input_o\ : std_logic;
SIGNAL \ALUResult[10]~73_combout\ : std_logic;
SIGNAL \regDataA[11]~input_o\ : std_logic;
SIGNAL \ALUResult[10]~72_combout\ : std_logic;
SIGNAL \ALUResult[10]~178_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \ALUResult[10]~70_combout\ : std_logic;
SIGNAL \ALUResult[10]~71_combout\ : std_logic;
SIGNAL \ALUResult[10]~74_combout\ : std_logic;
SIGNAL \regDataB[11]~input_o\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \ALUResult[11]~76_combout\ : std_logic;
SIGNAL \ALUResult[11]~75_combout\ : std_logic;
SIGNAL \regDataA[12]~input_o\ : std_logic;
SIGNAL \ALUResult[11]~77_combout\ : std_logic;
SIGNAL \ALUResult[11]~78_combout\ : std_logic;
SIGNAL \ALUResult[11]~79_combout\ : std_logic;
SIGNAL \regDataB[12]~input_o\ : std_logic;
SIGNAL \regDataA[13]~input_o\ : std_logic;
SIGNAL \ALUResult[12]~80_combout\ : std_logic;
SIGNAL \ALUResult[12]~81_combout\ : std_logic;
SIGNAL \ALUResult[12]~82_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \ALUResult[12]~83_combout\ : std_logic;
SIGNAL \regDataB[13]~input_o\ : std_logic;
SIGNAL \regDataA[14]~input_o\ : std_logic;
SIGNAL \ALUResult[13]~86_combout\ : std_logic;
SIGNAL \ALUResult[13]~87_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \ALUResult[13]~85_combout\ : std_logic;
SIGNAL \ALUResult[13]~84_combout\ : std_logic;
SIGNAL \ALUResult[13]~88_combout\ : std_logic;
SIGNAL \regDataB[14]~input_o\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \ALUResult[14]~89_combout\ : std_logic;
SIGNAL \ALUResult[14]~90_combout\ : std_logic;
SIGNAL \ALUResult[14]~92_combout\ : std_logic;
SIGNAL \regDataA[15]~input_o\ : std_logic;
SIGNAL \ALUResult[14]~91_combout\ : std_logic;
SIGNAL \ALUResult[14]~179_combout\ : std_logic;
SIGNAL \ALUResult[14]~93_combout\ : std_logic;
SIGNAL \regDataB[15]~input_o\ : std_logic;
SIGNAL \ALUResult[15]~94_combout\ : std_logic;
SIGNAL \ALUResult[15]~95_combout\ : std_logic;
SIGNAL \regDataA[16]~input_o\ : std_logic;
SIGNAL \ALUResult[15]~96_combout\ : std_logic;
SIGNAL \ALUResult[15]~97_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \ALUResult[15]~98_combout\ : std_logic;
SIGNAL \regDataB[16]~input_o\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \ALUResult[16]~99_combout\ : std_logic;
SIGNAL \regDataA[17]~input_o\ : std_logic;
SIGNAL \ALUResult[16]~100_combout\ : std_logic;
SIGNAL \ALUResult[16]~101_combout\ : std_logic;
SIGNAL \ALUResult[16]~102_combout\ : std_logic;
SIGNAL \regDataB[17]~input_o\ : std_logic;
SIGNAL \ALUResult[17]~103_combout\ : std_logic;
SIGNAL \regDataA[18]~input_o\ : std_logic;
SIGNAL \ALUResult[17]~105_combout\ : std_logic;
SIGNAL \ALUResult[17]~106_combout\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \ALUResult[17]~104_combout\ : std_logic;
SIGNAL \ALUResult[17]~107_combout\ : std_logic;
SIGNAL \regDataB[18]~input_o\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \regDataA[19]~input_o\ : std_logic;
SIGNAL \ALUResult[18]~108_combout\ : std_logic;
SIGNAL \ALUResult[18]~109_combout\ : std_logic;
SIGNAL \ALUResult[18]~110_combout\ : std_logic;
SIGNAL \ALUResult[18]~111_combout\ : std_logic;
SIGNAL \regDataB[19]~input_o\ : std_logic;
SIGNAL \ALUResult[19]~112_combout\ : std_logic;
SIGNAL \regDataA[20]~input_o\ : std_logic;
SIGNAL \ALUResult[19]~114_combout\ : std_logic;
SIGNAL \ALUResult[19]~115_combout\ : std_logic;
SIGNAL \Add0~37\ : std_logic;
SIGNAL \Add0~38_combout\ : std_logic;
SIGNAL \ALUResult[19]~113_combout\ : std_logic;
SIGNAL \ALUResult[19]~116_combout\ : std_logic;
SIGNAL \regDataB[20]~input_o\ : std_logic;
SIGNAL \ALUResult[20]~120_combout\ : std_logic;
SIGNAL \regDataA[21]~input_o\ : std_logic;
SIGNAL \ALUResult[20]~119_combout\ : std_logic;
SIGNAL \ALUResult[20]~180_combout\ : std_logic;
SIGNAL \Add0~39\ : std_logic;
SIGNAL \Add0~40_combout\ : std_logic;
SIGNAL \ALUResult[20]~117_combout\ : std_logic;
SIGNAL \ALUResult[20]~118_combout\ : std_logic;
SIGNAL \ALUResult[20]~121_combout\ : std_logic;
SIGNAL \regDataB[21]~input_o\ : std_logic;
SIGNAL \ALUResult[21]~122_combout\ : std_logic;
SIGNAL \ALUResult[21]~123_combout\ : std_logic;
SIGNAL \Add0~41\ : std_logic;
SIGNAL \Add0~42_combout\ : std_logic;
SIGNAL \regDataA[22]~input_o\ : std_logic;
SIGNAL \ALUResult[21]~124_combout\ : std_logic;
SIGNAL \ALUResult[21]~125_combout\ : std_logic;
SIGNAL \ALUResult[21]~126_combout\ : std_logic;
SIGNAL \regDataB[22]~input_o\ : std_logic;
SIGNAL \Add0~43\ : std_logic;
SIGNAL \Add0~44_combout\ : std_logic;
SIGNAL \regDataA[23]~input_o\ : std_logic;
SIGNAL \ALUResult[22]~127_combout\ : std_logic;
SIGNAL \ALUResult[22]~128_combout\ : std_logic;
SIGNAL \ALUResult[22]~129_combout\ : std_logic;
SIGNAL \ALUResult[22]~130_combout\ : std_logic;
SIGNAL \regDataB[23]~input_o\ : std_logic;
SIGNAL \Add0~45\ : std_logic;
SIGNAL \Add0~46_combout\ : std_logic;
SIGNAL \regDataA[24]~input_o\ : std_logic;
SIGNAL \ALUResult[23]~133_combout\ : std_logic;
SIGNAL \ALUResult[23]~134_combout\ : std_logic;
SIGNAL \ALUResult[23]~131_combout\ : std_logic;
SIGNAL \ALUResult[23]~132_combout\ : std_logic;
SIGNAL \ALUResult[23]~135_combout\ : std_logic;
SIGNAL \regDataB[24]~input_o\ : std_logic;
SIGNAL \ALUResult[24]~139_combout\ : std_logic;
SIGNAL \regDataA[25]~input_o\ : std_logic;
SIGNAL \ALUResult[24]~138_combout\ : std_logic;
SIGNAL \ALUResult[24]~181_combout\ : std_logic;
SIGNAL \ALUResult[24]~137_combout\ : std_logic;
SIGNAL \Add0~47\ : std_logic;
SIGNAL \Add0~48_combout\ : std_logic;
SIGNAL \ALUResult[24]~136_combout\ : std_logic;
SIGNAL \ALUResult[24]~140_combout\ : std_logic;
SIGNAL \regDataB[25]~input_o\ : std_logic;
SIGNAL \ALUResult[25]~141_combout\ : std_logic;
SIGNAL \ALUResult[25]~142_combout\ : std_logic;
SIGNAL \regDataA[26]~input_o\ : std_logic;
SIGNAL \ALUResult[25]~143_combout\ : std_logic;
SIGNAL \ALUResult[25]~144_combout\ : std_logic;
SIGNAL \Add0~49\ : std_logic;
SIGNAL \Add0~50_combout\ : std_logic;
SIGNAL \ALUResult[25]~145_combout\ : std_logic;
SIGNAL \regDataB[26]~input_o\ : std_logic;
SIGNAL \regDataA[27]~input_o\ : std_logic;
SIGNAL \ALUResult[26]~146_combout\ : std_logic;
SIGNAL \ALUResult[26]~147_combout\ : std_logic;
SIGNAL \ALUResult[26]~148_combout\ : std_logic;
SIGNAL \Add0~51\ : std_logic;
SIGNAL \Add0~52_combout\ : std_logic;
SIGNAL \ALUResult[26]~149_combout\ : std_logic;
SIGNAL \regDataB[27]~input_o\ : std_logic;
SIGNAL \regDataA[28]~input_o\ : std_logic;
SIGNAL \ALUResult[27]~150_combout\ : std_logic;
SIGNAL \ALUResult[27]~151_combout\ : std_logic;
SIGNAL \ALUResult[27]~152_combout\ : std_logic;
SIGNAL \Add0~53\ : std_logic;
SIGNAL \Add0~54_combout\ : std_logic;
SIGNAL \ALUResult[27]~153_combout\ : std_logic;
SIGNAL \ALUResult[28]~156_combout\ : std_logic;
SIGNAL \ALUResult[28]~157_combout\ : std_logic;
SIGNAL \regDataB[28]~input_o\ : std_logic;
SIGNAL \Add0~55\ : std_logic;
SIGNAL \Add0~56_combout\ : std_logic;
SIGNAL \ALUResult[28]~154_combout\ : std_logic;
SIGNAL \regDataA[29]~input_o\ : std_logic;
SIGNAL \ALUResult[28]~155_combout\ : std_logic;
SIGNAL \ALUResult[28]~158_combout\ : std_logic;
SIGNAL \regDataB[29]~input_o\ : std_logic;
SIGNAL \Add0~57\ : std_logic;
SIGNAL \Add0~58_combout\ : std_logic;
SIGNAL \regDataA[30]~input_o\ : std_logic;
SIGNAL \ALUResult[29]~159_combout\ : std_logic;
SIGNAL \ALUResult[29]~160_combout\ : std_logic;
SIGNAL \ALUResult[29]~161_combout\ : std_logic;
SIGNAL \ALUResult[29]~162_combout\ : std_logic;
SIGNAL \ALUResult[30]~166_combout\ : std_logic;
SIGNAL \ALUResult[30]~164_combout\ : std_logic;
SIGNAL \ALUResult[30]~165_combout\ : std_logic;
SIGNAL \regDataB[30]~input_o\ : std_logic;
SIGNAL \Add0~59\ : std_logic;
SIGNAL \Add0~60_combout\ : std_logic;
SIGNAL \ALUResult[30]~163_combout\ : std_logic;
SIGNAL \ALUResult[30]~167_combout\ : std_logic;
SIGNAL \regDataB[31]~input_o\ : std_logic;
SIGNAL \Add0~61\ : std_logic;
SIGNAL \Add0~62_combout\ : std_logic;
SIGNAL \ALUResult[31]~169_combout\ : std_logic;
SIGNAL \ALUResult[31]~170_combout\ : std_logic;
SIGNAL \ALUResult[31]~168_combout\ : std_logic;
SIGNAL \ALUResult[31]~171_combout\ : std_logic;
SIGNAL \ALUResult[31]~172_combout\ : std_logic;
SIGNAL \ALUResult[31]~173_combout\ : std_logic;
SIGNAL \ALUResult[31]~174_combout\ : std_logic;
SIGNAL ALUResult : std_logic_vector(31 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_regDataA <= regDataA;
ww_regDataB <= regDataB;
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
ALUDataOut <= ww_ALUDataOut;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\ALUResult[31]~23clkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \ALUResult[31]~23_combout\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X40_Y73_N2
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

-- Location: IOOBUF_X27_Y73_N16
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

-- Location: IOOBUF_X0_Y69_N9
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

-- Location: IOOBUF_X69_Y73_N23
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

-- Location: IOOBUF_X16_Y73_N2
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

-- Location: IOOBUF_X23_Y73_N2
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

-- Location: IOOBUF_X29_Y73_N2
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

-- Location: IOOBUF_X23_Y73_N23
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

-- Location: IOOBUF_X45_Y0_N23
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

-- Location: IOOBUF_X81_Y73_N9
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

-- Location: IOOBUF_X33_Y73_N2
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

-- Location: IOOBUF_X38_Y73_N9
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

-- Location: IOOBUF_X13_Y73_N2
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

-- Location: IOOBUF_X16_Y73_N23
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

-- Location: IOOBUF_X62_Y73_N23
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

-- Location: IOOBUF_X58_Y73_N23
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

-- Location: IOOBUF_X25_Y73_N16
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

-- Location: IOOBUF_X83_Y73_N23
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

-- Location: IOOBUF_X16_Y73_N16
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

-- Location: IOOBUF_X65_Y73_N9
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

-- Location: IOOBUF_X89_Y73_N23
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

-- Location: IOOBUF_X13_Y73_N23
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

-- Location: IOOBUF_X18_Y73_N23
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

-- Location: IOOBUF_X11_Y73_N9
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

-- Location: IOOBUF_X79_Y73_N2
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

-- Location: IOOBUF_X5_Y73_N2
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

-- Location: IOOBUF_X85_Y73_N9
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

-- Location: IOOBUF_X83_Y73_N16
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

-- Location: IOOBUF_X72_Y73_N2
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

-- Location: IOOBUF_X81_Y73_N16
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

-- Location: IOOBUF_X5_Y73_N9
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

-- Location: IOOBUF_X20_Y73_N9
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

-- Location: IOIBUF_X58_Y73_N15
\regDataA[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(0),
	o => \regDataA[0]~input_o\);

-- Location: IOIBUF_X52_Y73_N22
\regDataB[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(0),
	o => \regDataB[0]~input_o\);

-- Location: LCCOMB_X48_Y72_N0
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

-- Location: IOIBUF_X47_Y73_N1
\Op_ADS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_ADS,
	o => \Op_ADS~input_o\);

-- Location: IOIBUF_X45_Y73_N1
\Op_ORS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_ORS,
	o => \Op_ORS~input_o\);

-- Location: LCCOMB_X52_Y72_N30
\ALUResult[0]~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~15_combout\ = (\Op_ORS~input_o\ & ((\regDataB[0]~input_o\) # (\regDataA[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataB[0]~input_o\,
	datac => \Op_ORS~input_o\,
	datad => \regDataA[0]~input_o\,
	combout => \ALUResult[0]~15_combout\);

-- Location: IOIBUF_X60_Y73_N15
\Op_RS1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_RS1,
	o => \Op_RS1~input_o\);

-- Location: IOIBUF_X54_Y73_N1
\regDataA[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(31),
	o => \regDataA[31]~input_o\);

-- Location: IOIBUF_X62_Y73_N15
\Op_LR1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_LR1,
	o => \Op_LR1~input_o\);

-- Location: IOIBUF_X65_Y73_N22
\regDataA[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(1),
	o => \regDataA[1]~input_o\);

-- Location: LCCOMB_X52_Y72_N14
\ALUResult[0]~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~16_combout\ = (\Op_RS1~input_o\ & (((\regDataA[1]~input_o\)))) # (!\Op_RS1~input_o\ & ((\Op_LR1~input_o\ & (\regDataA[31]~input_o\)) # (!\Op_LR1~input_o\ & ((\regDataA[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111101000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~input_o\,
	datab => \regDataA[31]~input_o\,
	datac => \Op_LR1~input_o\,
	datad => \regDataA[1]~input_o\,
	combout => \ALUResult[0]~16_combout\);

-- Location: IOIBUF_X52_Y73_N1
\Op_XRS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_XRS,
	o => \Op_XRS~input_o\);

-- Location: LCCOMB_X49_Y71_N0
\ALUResult[0]~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~17_combout\ = (!\Op_XRS~input_o\ & !\Op_ORS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_XRS~input_o\,
	datac => \Op_ORS~input_o\,
	combout => \ALUResult[0]~17_combout\);

-- Location: IOIBUF_X83_Y73_N8
\Op_LS1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_LS1,
	o => \Op_LS1~input_o\);

-- Location: LCCOMB_X52_Y72_N18
\ALUResult[0]~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~18_combout\ = (\ALUResult[0]~15_combout\) # ((\ALUResult[0]~16_combout\ & (\ALUResult[0]~17_combout\ & !\Op_LS1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~15_combout\,
	datab => \ALUResult[0]~16_combout\,
	datac => \ALUResult[0]~17_combout\,
	datad => \Op_LS1~input_o\,
	combout => \ALUResult[0]~18_combout\);

-- Location: IOIBUF_X52_Y73_N8
\Op_ARS~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_ARS,
	o => \Op_ARS~input_o\);

-- Location: LCCOMB_X52_Y72_N22
\ALUResult[0]~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~19_combout\ = (\Op_ARS~input_o\ & (\regDataA[0]~input_o\ & ((\regDataB[0]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[0]~18_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[0]~input_o\,
	datab => \ALUResult[0]~18_combout\,
	datac => \Op_ARS~input_o\,
	datad => \regDataB[0]~input_o\,
	combout => \ALUResult[0]~19_combout\);

-- Location: LCCOMB_X49_Y72_N24
\ALUResult[0]~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~14_combout\ = (\Op_ADS~input_o\) # ((!\Op_ARS~input_o\ & (\Op_XRS~input_o\ & !\Op_ORS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \Op_XRS~input_o\,
	datac => \Op_ADS~input_o\,
	datad => \Op_ORS~input_o\,
	combout => \ALUResult[0]~14_combout\);

-- Location: LCCOMB_X49_Y72_N2
\ALUResult[0]~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[0]~20_combout\ = (\Add0~0_combout\ & ((\ALUResult[0]~14_combout\) # ((!\Op_ADS~input_o\ & \ALUResult[0]~19_combout\)))) # (!\Add0~0_combout\ & (!\Op_ADS~input_o\ & (\ALUResult[0]~19_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~0_combout\,
	datab => \Op_ADS~input_o\,
	datac => \ALUResult[0]~19_combout\,
	datad => \ALUResult[0]~14_combout\,
	combout => \ALUResult[0]~20_combout\);

-- Location: IOIBUF_X74_Y73_N22
\Op_RA1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_RA1,
	o => \Op_RA1~input_o\);

-- Location: IOIBUF_X85_Y73_N22
\Op_RR1~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_RR1,
	o => \Op_RR1~input_o\);

-- Location: LCCOMB_X52_Y72_N4
\ALUResult[31]~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~21_combout\ = (\Op_RS1~input_o\) # ((\Op_LS1~input_o\) # ((\Op_LR1~input_o\) # (\Op_RR1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~input_o\,
	datab => \Op_LS1~input_o\,
	datac => \Op_LR1~input_o\,
	datad => \Op_RR1~input_o\,
	combout => \ALUResult[31]~21_combout\);

-- Location: LCCOMB_X47_Y72_N10
\ALUResult[1]~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~22_combout\ = (!\Op_ARS~input_o\ & !\Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ARS~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[1]~22_combout\);

-- Location: LCCOMB_X52_Y72_N26
\ALUResult[31]~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~23_combout\ = (\Op_RA1~input_o\) # ((\ALUResult[31]~21_combout\) # ((!\ALUResult[1]~22_combout\) # (!\ALUResult[0]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RA1~input_o\,
	datab => \ALUResult[31]~21_combout\,
	datac => \ALUResult[0]~17_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[31]~23_combout\);

-- Location: CLKCTRL_G11
\ALUResult[31]~23clkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \ALUResult[31]~23clkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \ALUResult[31]~23clkctrl_outclk\);

-- Location: LCCOMB_X49_Y72_N26
\ALUResult[0]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(0) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[0]~20_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[0]~20_combout\,
	datac => ALUResult(0),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(0));

-- Location: IOIBUF_X35_Y73_N22
\regDataB[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(1),
	o => \regDataB[1]~input_o\);

-- Location: LCCOMB_X48_Y72_N2
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

-- Location: LCCOMB_X47_Y72_N22
\ALUResult[1]~25\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~25_combout\ = (\Add0~2_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~2_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[1]~25_combout\);

-- Location: LCCOMB_X52_Y72_N24
\ALUResult[30]~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~26_combout\ = (!\Op_RS1~input_o\ & \Op_LR1~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~input_o\,
	datac => \Op_LR1~input_o\,
	combout => \ALUResult[30]~26_combout\);

-- Location: LCCOMB_X52_Y72_N28
\ALUResult[1]~27\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~27_combout\ = (\Op_ORS~input_o\) # ((!\Op_XRS~input_o\ & ((\ALUResult[30]~26_combout\) # (\Op_LS1~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_XRS~input_o\,
	datab => \ALUResult[30]~26_combout\,
	datac => \Op_ORS~input_o\,
	datad => \Op_LS1~input_o\,
	combout => \ALUResult[1]~27_combout\);

-- Location: IOIBUF_X49_Y73_N22
\regDataA[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(2),
	o => \regDataA[2]~input_o\);

-- Location: LCCOMB_X47_Y70_N16
\ALUResult[1]~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~28_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[1]~27_combout\ & (\regDataA[0]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[2]~input_o\))))) # (!\ALUResult[0]~17_combout\ & (\ALUResult[1]~27_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \ALUResult[1]~27_combout\,
	datac => \regDataA[0]~input_o\,
	datad => \regDataA[2]~input_o\,
	combout => \ALUResult[1]~28_combout\);

-- Location: LCCOMB_X47_Y70_N26
\ALUResult[1]~29\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~29_combout\ = (\ALUResult[0]~17_combout\ & (\ALUResult[1]~28_combout\)) # (!\ALUResult[0]~17_combout\ & ((\regDataB[1]~input_o\ & ((\ALUResult[1]~28_combout\) # (!\regDataA[1]~input_o\))) # (!\regDataB[1]~input_o\ & 
-- ((\regDataA[1]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \ALUResult[1]~28_combout\,
	datac => \regDataB[1]~input_o\,
	datad => \regDataA[1]~input_o\,
	combout => \ALUResult[1]~29_combout\);

-- Location: LCCOMB_X47_Y72_N16
\ALUResult[1]~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~24_combout\ = (\regDataB[1]~input_o\ & (\Op_ARS~input_o\ & (\regDataA[1]~input_o\ & !\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[1]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[1]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[1]~24_combout\);

-- Location: LCCOMB_X47_Y72_N2
\ALUResult[1]~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[1]~30_combout\ = (\ALUResult[1]~25_combout\) # ((\ALUResult[1]~24_combout\) # ((\ALUResult[1]~29_combout\ & \ALUResult[1]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~25_combout\,
	datab => \ALUResult[1]~29_combout\,
	datac => \ALUResult[1]~24_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[1]~30_combout\);

-- Location: LCCOMB_X47_Y72_N0
\ALUResult[1]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(1) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[1]~30_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(1),
	datac => \ALUResult[1]~30_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(1));

-- Location: IOIBUF_X72_Y73_N8
\regDataB[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(2),
	o => \regDataB[2]~input_o\);

-- Location: LCCOMB_X47_Y72_N6
\ALUResult[2]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~32_combout\ = (\Op_ADS~input_o\) # ((\regDataB[2]~input_o\ & \regDataA[2]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataB[2]~input_o\,
	datac => \regDataA[2]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[2]~32_combout\);

-- Location: LCCOMB_X49_Y71_N26
\ALUResult[2]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~34_combout\ = (\regDataA[2]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[2]~input_o\))) # (!\regDataA[2]~input_o\ & ((\regDataB[2]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[2]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataB[2]~input_o\,
	combout => \ALUResult[2]~34_combout\);

-- Location: IOIBUF_X58_Y73_N1
\regDataA[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(3),
	o => \regDataA[3]~input_o\);

-- Location: LCCOMB_X48_Y70_N0
\ALUResult[2]~33\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~33_combout\ = (\ALUResult[1]~27_combout\ & (\regDataA[1]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataA[1]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[3]~input_o\,
	combout => \ALUResult[2]~33_combout\);

-- Location: LCCOMB_X49_Y71_N2
\ALUResult[2]~175\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~175_combout\ = (\Op_ORS~input_o\ & (\ALUResult[2]~34_combout\)) # (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & (\ALUResult[2]~34_combout\)) # (!\Op_XRS~input_o\ & ((\ALUResult[2]~33_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[2]~34_combout\,
	datab => \Op_ORS~input_o\,
	datac => \Op_XRS~input_o\,
	datad => \ALUResult[2]~33_combout\,
	combout => \ALUResult[2]~175_combout\);

-- Location: LCCOMB_X48_Y72_N4
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

-- Location: LCCOMB_X49_Y72_N20
\ALUResult[2]~31\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~31_combout\ = (\Op_ADS~input_o\ & ((\Add0~4_combout\))) # (!\Op_ADS~input_o\ & (\Op_ARS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \Add0~4_combout\,
	datac => \Op_ADS~input_o\,
	combout => \ALUResult[2]~31_combout\);

-- Location: LCCOMB_X47_Y72_N12
\ALUResult[2]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[2]~35_combout\ = (\ALUResult[2]~32_combout\ & ((\ALUResult[2]~31_combout\) # ((\ALUResult[2]~175_combout\ & \ALUResult[1]~22_combout\)))) # (!\ALUResult[2]~32_combout\ & (\ALUResult[2]~175_combout\ & (\ALUResult[1]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[2]~32_combout\,
	datab => \ALUResult[2]~175_combout\,
	datac => \ALUResult[1]~22_combout\,
	datad => \ALUResult[2]~31_combout\,
	combout => \ALUResult[2]~35_combout\);

-- Location: LCCOMB_X47_Y72_N18
\ALUResult[2]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(2) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[2]~35_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[2]~35_combout\,
	datab => ALUResult(2),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(2));

-- Location: IOIBUF_X38_Y73_N15
\regDataB[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(3),
	o => \regDataB[3]~input_o\);

-- Location: LCCOMB_X48_Y70_N18
\ALUResult[3]~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~36_combout\ = (\ALUResult[0]~17_combout\) # ((\regDataB[3]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[3]~input_o\))) # (!\regDataB[3]~input_o\ & ((\regDataA[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[3]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[3]~input_o\,
	combout => \ALUResult[3]~36_combout\);

-- Location: LCCOMB_X48_Y70_N12
\ALUResult[3]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~37_combout\ = (\Op_ARS~input_o\ & (\regDataB[3]~input_o\ & ((\regDataA[3]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[3]~36_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[3]~input_o\,
	datab => \ALUResult[3]~36_combout\,
	datac => \Op_ARS~input_o\,
	datad => \regDataA[3]~input_o\,
	combout => \ALUResult[3]~37_combout\);

-- Location: LCCOMB_X48_Y72_N6
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (\regDataA[3]~input_o\ & ((\regDataB[3]~input_o\ & (\Add0~5\ & VCC)) # (!\regDataB[3]~input_o\ & (!\Add0~5\)))) # (!\regDataA[3]~input_o\ & ((\regDataB[3]~input_o\ & (!\Add0~5\)) # (!\regDataB[3]~input_o\ & ((\Add0~5\) # (GND)))))
-- \Add0~7\ = CARRY((\regDataA[3]~input_o\ & (!\regDataB[3]~input_o\ & !\Add0~5\)) # (!\regDataA[3]~input_o\ & ((!\Add0~5\) # (!\regDataB[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[3]~input_o\,
	datab => \regDataB[3]~input_o\,
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: IOIBUF_X67_Y73_N8
\regDataA[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(4),
	o => \regDataA[4]~input_o\);

-- Location: LCCOMB_X47_Y70_N12
\ALUResult[3]~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~38_combout\ = ((\ALUResult[1]~27_combout\ & ((\regDataA[2]~input_o\))) # (!\ALUResult[1]~27_combout\ & (\regDataA[4]~input_o\))) # (!\ALUResult[0]~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110101110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \ALUResult[1]~27_combout\,
	datac => \regDataA[4]~input_o\,
	datad => \regDataA[2]~input_o\,
	combout => \ALUResult[3]~38_combout\);

-- Location: LCCOMB_X47_Y70_N14
\ALUResult[3]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~39_combout\ = (\ALUResult[3]~38_combout\) # (\Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[3]~38_combout\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[3]~39_combout\);

-- Location: LCCOMB_X48_Y70_N14
\ALUResult[3]~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[3]~40_combout\ = (\Op_ADS~input_o\ & (((\Add0~6_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[3]~37_combout\ & ((\ALUResult[3]~39_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[3]~37_combout\,
	datab => \Add0~6_combout\,
	datac => \Op_ADS~input_o\,
	datad => \ALUResult[3]~39_combout\,
	combout => \ALUResult[3]~40_combout\);

-- Location: LCCOMB_X49_Y70_N6
\ALUResult[3]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(3) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[3]~40_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[3]~40_combout\,
	datac => \ALUResult[31]~23clkctrl_outclk\,
	datad => ALUResult(3),
	combout => ALUResult(3));

-- Location: IOIBUF_X7_Y73_N15
\regDataB[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(4),
	o => \regDataB[4]~input_o\);

-- Location: LCCOMB_X48_Y70_N16
\ALUResult[4]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~41_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[1]~27_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataA[4]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[4]~input_o\))) # (!\regDataA[4]~input_o\ & 
-- ((\regDataB[4]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000111100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[4]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataB[4]~input_o\,
	combout => \ALUResult[4]~41_combout\);

-- Location: IOIBUF_X60_Y73_N22
\regDataA[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(5),
	o => \regDataA[5]~input_o\);

-- Location: LCCOMB_X48_Y70_N26
\ALUResult[4]~42\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~42_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[4]~41_combout\ & (\regDataA[3]~input_o\)) # (!\ALUResult[4]~41_combout\ & ((\regDataA[5]~input_o\))))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[4]~41_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[3]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \ALUResult[4]~41_combout\,
	datad => \regDataA[5]~input_o\,
	combout => \ALUResult[4]~42_combout\);

-- Location: LCCOMB_X48_Y70_N4
\ALUResult[4]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~43_combout\ = (\Op_ARS~input_o\ & (((\regDataB[4]~input_o\ & \regDataA[4]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[4]~42_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[4]~42_combout\,
	datab => \regDataB[4]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \regDataA[4]~input_o\,
	combout => \ALUResult[4]~43_combout\);

-- Location: LCCOMB_X48_Y72_N8
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = ((\regDataA[4]~input_o\ $ (\regDataB[4]~input_o\ $ (!\Add0~7\)))) # (GND)
-- \Add0~9\ = CARRY((\regDataA[4]~input_o\ & ((\regDataB[4]~input_o\) # (!\Add0~7\))) # (!\regDataA[4]~input_o\ & (\regDataB[4]~input_o\ & !\Add0~7\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[4]~input_o\,
	datab => \regDataB[4]~input_o\,
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X48_Y70_N22
\ALUResult[4]~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[4]~44_combout\ = (\Op_ADS~input_o\ & ((\Add0~8_combout\))) # (!\Op_ADS~input_o\ & (\ALUResult[4]~43_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[4]~43_combout\,
	datac => \Op_ADS~input_o\,
	datad => \Add0~8_combout\,
	combout => \ALUResult[4]~44_combout\);

-- Location: LCCOMB_X47_Y70_N22
\ALUResult[4]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(4) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[4]~44_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(4),
	datac => \ALUResult[4]~44_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(4));

-- Location: IOIBUF_X87_Y73_N1
\regDataB[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(5),
	o => \regDataB[5]~input_o\);

-- Location: LCCOMB_X48_Y72_N10
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

-- Location: IOIBUF_X38_Y73_N1
\regDataA[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(6),
	o => \regDataA[6]~input_o\);

-- Location: LCCOMB_X48_Y70_N20
\ALUResult[5]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~47_combout\ = ((\ALUResult[1]~27_combout\ & ((\regDataA[4]~input_o\))) # (!\ALUResult[1]~27_combout\ & (\regDataA[6]~input_o\))) # (!\ALUResult[0]~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101100111011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[6]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[4]~input_o\,
	combout => \ALUResult[5]~47_combout\);

-- Location: LCCOMB_X48_Y70_N30
\ALUResult[5]~48\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~48_combout\ = (\ALUResult[5]~47_combout\) # (\Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[5]~47_combout\,
	datac => \Op_ARS~input_o\,
	combout => \ALUResult[5]~48_combout\);

-- Location: LCCOMB_X48_Y70_N24
\ALUResult[5]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~45_combout\ = (\ALUResult[0]~17_combout\) # ((\regDataB[5]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[5]~input_o\))) # (!\regDataB[5]~input_o\ & ((\regDataA[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[5]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[5]~input_o\,
	combout => \ALUResult[5]~45_combout\);

-- Location: LCCOMB_X48_Y70_N10
\ALUResult[5]~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~46_combout\ = (\Op_ARS~input_o\ & (\regDataB[5]~input_o\ & ((\regDataA[5]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[5]~45_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[5]~input_o\,
	datab => \ALUResult[5]~45_combout\,
	datac => \Op_ARS~input_o\,
	datad => \regDataA[5]~input_o\,
	combout => \ALUResult[5]~46_combout\);

-- Location: LCCOMB_X48_Y70_N8
\ALUResult[5]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[5]~49_combout\ = (\Op_ADS~input_o\ & (\Add0~10_combout\)) # (!\Op_ADS~input_o\ & (((\ALUResult[5]~48_combout\ & \ALUResult[5]~46_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~10_combout\,
	datab => \ALUResult[5]~48_combout\,
	datac => \Op_ADS~input_o\,
	datad => \ALUResult[5]~46_combout\,
	combout => \ALUResult[5]~49_combout\);

-- Location: LCCOMB_X48_Y70_N28
\ALUResult[5]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(5) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[5]~49_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(5),
	datac => \ALUResult[5]~49_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(5));

-- Location: IOIBUF_X7_Y73_N22
\regDataB[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(6),
	o => \regDataB[6]~input_o\);

-- Location: LCCOMB_X49_Y72_N12
\ALUResult[6]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~53_combout\ = (\regDataB[6]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[6]~input_o\))) # (!\regDataB[6]~input_o\ & ((\regDataA[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[6]~input_o\,
	datab => \ALUResult[1]~27_combout\,
	datad => \regDataA[6]~input_o\,
	combout => \ALUResult[6]~53_combout\);

-- Location: IOIBUF_X45_Y73_N8
\regDataA[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(7),
	o => \regDataA[7]~input_o\);

-- Location: LCCOMB_X49_Y72_N18
\ALUResult[6]~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~52_combout\ = (\ALUResult[1]~27_combout\ & ((\regDataA[5]~input_o\))) # (!\ALUResult[1]~27_combout\ & (\regDataA[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[7]~input_o\,
	datac => \regDataA[5]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[6]~52_combout\);

-- Location: LCCOMB_X49_Y72_N0
\ALUResult[6]~176\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~176_combout\ = (\Op_ORS~input_o\ & (\ALUResult[6]~53_combout\)) # (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & (\ALUResult[6]~53_combout\)) # (!\Op_XRS~input_o\ & ((\ALUResult[6]~52_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ORS~input_o\,
	datab => \ALUResult[6]~53_combout\,
	datac => \Op_XRS~input_o\,
	datad => \ALUResult[6]~52_combout\,
	combout => \ALUResult[6]~176_combout\);

-- Location: LCCOMB_X49_Y72_N16
\ALUResult[6]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~51_combout\ = (\Op_ADS~input_o\) # ((\regDataB[6]~input_o\ & \regDataA[6]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[6]~input_o\,
	datac => \Op_ADS~input_o\,
	datad => \regDataA[6]~input_o\,
	combout => \ALUResult[6]~51_combout\);

-- Location: LCCOMB_X48_Y72_N12
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = ((\regDataB[6]~input_o\ $ (\regDataA[6]~input_o\ $ (!\Add0~11\)))) # (GND)
-- \Add0~13\ = CARRY((\regDataB[6]~input_o\ & ((\regDataA[6]~input_o\) # (!\Add0~11\))) # (!\regDataB[6]~input_o\ & (\regDataA[6]~input_o\ & !\Add0~11\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[6]~input_o\,
	datab => \regDataA[6]~input_o\,
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X49_Y72_N22
\ALUResult[6]~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~50_combout\ = (\Op_ADS~input_o\ & ((\Add0~12_combout\))) # (!\Op_ADS~input_o\ & (\Op_ARS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datac => \Op_ADS~input_o\,
	datad => \Add0~12_combout\,
	combout => \ALUResult[6]~50_combout\);

-- Location: LCCOMB_X49_Y72_N6
\ALUResult[6]~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[6]~54_combout\ = (\ALUResult[6]~176_combout\ & ((\ALUResult[1]~22_combout\) # ((\ALUResult[6]~51_combout\ & \ALUResult[6]~50_combout\)))) # (!\ALUResult[6]~176_combout\ & (\ALUResult[6]~51_combout\ & (\ALUResult[6]~50_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[6]~176_combout\,
	datab => \ALUResult[6]~51_combout\,
	datac => \ALUResult[6]~50_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[6]~54_combout\);

-- Location: LCCOMB_X49_Y72_N28
\ALUResult[6]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(6) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[6]~54_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(6),
	datac => \ALUResult[6]~54_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(6));

-- Location: IOIBUF_X23_Y73_N8
\regDataA[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(8),
	o => \regDataA[8]~input_o\);

-- Location: LCCOMB_X48_Y70_N2
\ALUResult[7]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~57_combout\ = ((\ALUResult[1]~27_combout\ & (\regDataA[6]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[8]~input_o\)))) # (!\ALUResult[0]~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[6]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[8]~input_o\,
	combout => \ALUResult[7]~57_combout\);

-- Location: LCCOMB_X47_Y70_N0
\ALUResult[7]~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~58_combout\ = (\ALUResult[7]~57_combout\) # (\Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[7]~57_combout\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[7]~58_combout\);

-- Location: IOIBUF_X40_Y73_N8
\regDataB[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(7),
	o => \regDataB[7]~input_o\);

-- Location: LCCOMB_X46_Y71_N8
\ALUResult[7]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~55_combout\ = (\ALUResult[0]~17_combout\) # ((\regDataA[7]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[7]~input_o\))) # (!\regDataA[7]~input_o\ & (\regDataB[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[7]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataB[7]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[7]~55_combout\);

-- Location: LCCOMB_X46_Y71_N26
\ALUResult[7]~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~56_combout\ = (\Op_ARS~input_o\ & (\regDataA[7]~input_o\ & ((\regDataB[7]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[7]~55_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[7]~input_o\,
	datab => \ALUResult[7]~55_combout\,
	datac => \Op_ARS~input_o\,
	datad => \regDataB[7]~input_o\,
	combout => \ALUResult[7]~56_combout\);

-- Location: LCCOMB_X48_Y72_N14
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

-- Location: LCCOMB_X47_Y71_N0
\ALUResult[7]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[7]~59_combout\ = (\Op_ADS~input_o\ & (((\Add0~14_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[7]~58_combout\ & (\ALUResult[7]~56_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \ALUResult[7]~58_combout\,
	datac => \ALUResult[7]~56_combout\,
	datad => \Add0~14_combout\,
	combout => \ALUResult[7]~59_combout\);

-- Location: LCCOMB_X47_Y71_N16
\ALUResult[7]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(7) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[7]~59_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(7),
	datac => \ALUResult[31]~23clkctrl_outclk\,
	datad => \ALUResult[7]~59_combout\,
	combout => ALUResult(7));

-- Location: IOIBUF_X23_Y73_N15
\regDataA[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(9),
	o => \regDataA[9]~input_o\);

-- Location: LCCOMB_X46_Y72_N20
\ALUResult[8]~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~62_combout\ = (\ALUResult[1]~27_combout\ & ((\regDataA[7]~input_o\))) # (!\ALUResult[1]~27_combout\ & (\regDataA[9]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~27_combout\,
	datab => \regDataA[9]~input_o\,
	datac => \regDataA[7]~input_o\,
	combout => \ALUResult[8]~62_combout\);

-- Location: IOIBUF_X27_Y73_N8
\regDataB[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(8),
	o => \regDataB[8]~input_o\);

-- Location: LCCOMB_X46_Y72_N22
\ALUResult[8]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~63_combout\ = (\regDataB[8]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[8]~input_o\))) # (!\regDataB[8]~input_o\ & ((\regDataA[8]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~27_combout\,
	datac => \regDataB[8]~input_o\,
	datad => \regDataA[8]~input_o\,
	combout => \ALUResult[8]~63_combout\);

-- Location: LCCOMB_X46_Y72_N14
\ALUResult[8]~177\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~177_combout\ = (\Op_ORS~input_o\ & (((\ALUResult[8]~63_combout\)))) # (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & ((\ALUResult[8]~63_combout\))) # (!\Op_XRS~input_o\ & (\ALUResult[8]~62_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ORS~input_o\,
	datab => \ALUResult[8]~62_combout\,
	datac => \ALUResult[8]~63_combout\,
	datad => \Op_XRS~input_o\,
	combout => \ALUResult[8]~177_combout\);

-- Location: LCCOMB_X48_Y72_N16
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = ((\regDataA[8]~input_o\ $ (\regDataB[8]~input_o\ $ (!\Add0~15\)))) # (GND)
-- \Add0~17\ = CARRY((\regDataA[8]~input_o\ & ((\regDataB[8]~input_o\) # (!\Add0~15\))) # (!\regDataA[8]~input_o\ & (\regDataB[8]~input_o\ & !\Add0~15\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[8]~input_o\,
	datab => \regDataB[8]~input_o\,
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X46_Y72_N8
\ALUResult[8]~60\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~60_combout\ = (\Op_ADS~input_o\ & ((\Add0~16_combout\))) # (!\Op_ADS~input_o\ & (\Op_ARS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datac => \Add0~16_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[8]~60_combout\);

-- Location: LCCOMB_X46_Y72_N26
\ALUResult[8]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~61_combout\ = (\Op_ADS~input_o\) # ((\regDataA[8]~input_o\ & \regDataB[8]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataA[8]~input_o\,
	datac => \regDataB[8]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[8]~61_combout\);

-- Location: LCCOMB_X46_Y72_N24
\ALUResult[8]~64\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[8]~64_combout\ = (\ALUResult[8]~177_combout\ & ((\ALUResult[1]~22_combout\) # ((\ALUResult[8]~60_combout\ & \ALUResult[8]~61_combout\)))) # (!\ALUResult[8]~177_combout\ & (\ALUResult[8]~60_combout\ & (\ALUResult[8]~61_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[8]~177_combout\,
	datab => \ALUResult[8]~60_combout\,
	datac => \ALUResult[8]~61_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[8]~64_combout\);

-- Location: LCCOMB_X46_Y72_N18
\ALUResult[8]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(8) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[8]~64_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(8),
	datac => \ALUResult[8]~64_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(8));

-- Location: IOIBUF_X35_Y73_N15
\regDataA[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(10),
	o => \regDataA[10]~input_o\);

-- Location: LCCOMB_X46_Y72_N2
\ALUResult[9]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~67_combout\ = (\ALUResult[1]~27_combout\ & ((\regDataA[8]~input_o\) # ((!\ALUResult[0]~17_combout\)))) # (!\ALUResult[1]~27_combout\ & (((\regDataA[10]~input_o\ & \ALUResult[0]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~27_combout\,
	datab => \regDataA[8]~input_o\,
	datac => \regDataA[10]~input_o\,
	datad => \ALUResult[0]~17_combout\,
	combout => \ALUResult[9]~67_combout\);

-- Location: IOIBUF_X42_Y73_N1
\regDataB[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(9),
	o => \regDataB[9]~input_o\);

-- Location: LCCOMB_X46_Y72_N12
\ALUResult[9]~68\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~68_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[9]~67_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataA[9]~input_o\ & ((\ALUResult[9]~67_combout\) # (!\regDataB[9]~input_o\))) # (!\regDataA[9]~input_o\ & 
-- ((\regDataB[9]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[9]~input_o\,
	datab => \ALUResult[9]~67_combout\,
	datac => \regDataB[9]~input_o\,
	datad => \ALUResult[0]~17_combout\,
	combout => \ALUResult[9]~68_combout\);

-- Location: LCCOMB_X47_Y72_N26
\ALUResult[9]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~65_combout\ = (\regDataA[9]~input_o\ & (\Op_ARS~input_o\ & (\regDataB[9]~input_o\ & !\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[9]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataB[9]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[9]~65_combout\);

-- Location: LCCOMB_X48_Y72_N18
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (\regDataB[9]~input_o\ & ((\regDataA[9]~input_o\ & (\Add0~17\ & VCC)) # (!\regDataA[9]~input_o\ & (!\Add0~17\)))) # (!\regDataB[9]~input_o\ & ((\regDataA[9]~input_o\ & (!\Add0~17\)) # (!\regDataA[9]~input_o\ & ((\Add0~17\) # (GND)))))
-- \Add0~19\ = CARRY((\regDataB[9]~input_o\ & (!\regDataA[9]~input_o\ & !\Add0~17\)) # (!\regDataB[9]~input_o\ & ((!\Add0~17\) # (!\regDataA[9]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[9]~input_o\,
	datab => \regDataA[9]~input_o\,
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X47_Y72_N28
\ALUResult[9]~66\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~66_combout\ = (\Add0~18_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~18_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[9]~66_combout\);

-- Location: LCCOMB_X47_Y72_N24
\ALUResult[9]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[9]~69_combout\ = (\ALUResult[9]~65_combout\) # ((\ALUResult[9]~66_combout\) # ((\ALUResult[9]~68_combout\ & \ALUResult[1]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[9]~68_combout\,
	datab => \ALUResult[9]~65_combout\,
	datac => \ALUResult[9]~66_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[9]~69_combout\);

-- Location: LCCOMB_X47_Y72_N14
\ALUResult[9]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(9) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[9]~69_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(9),
	datac => \ALUResult[9]~69_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(9));

-- Location: IOIBUF_X16_Y73_N8
\regDataB[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(10),
	o => \regDataB[10]~input_o\);

-- Location: LCCOMB_X46_Y72_N10
\ALUResult[10]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~73_combout\ = (\regDataA[10]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[10]~input_o\))) # (!\regDataA[10]~input_o\ & (\regDataB[10]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110011011100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[10]~input_o\,
	datab => \regDataB[10]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	combout => \ALUResult[10]~73_combout\);

-- Location: IOIBUF_X38_Y73_N22
\regDataA[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(11),
	o => \regDataA[11]~input_o\);

-- Location: LCCOMB_X46_Y72_N0
\ALUResult[10]~72\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~72_combout\ = (\ALUResult[1]~27_combout\ & ((\regDataA[9]~input_o\))) # (!\ALUResult[1]~27_combout\ & (\regDataA[11]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[11]~input_o\,
	datab => \regDataA[9]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	combout => \ALUResult[10]~72_combout\);

-- Location: LCCOMB_X46_Y72_N16
\ALUResult[10]~178\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~178_combout\ = (\Op_ORS~input_o\ & (\ALUResult[10]~73_combout\)) # (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & (\ALUResult[10]~73_combout\)) # (!\Op_XRS~input_o\ & ((\ALUResult[10]~72_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[10]~73_combout\,
	datab => \ALUResult[10]~72_combout\,
	datac => \Op_ORS~input_o\,
	datad => \Op_XRS~input_o\,
	combout => \ALUResult[10]~178_combout\);

-- Location: LCCOMB_X48_Y72_N20
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

-- Location: LCCOMB_X47_Y72_N20
\ALUResult[10]~70\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~70_combout\ = (\Op_ADS~input_o\ & ((\Add0~20_combout\))) # (!\Op_ADS~input_o\ & (\Op_ARS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ARS~input_o\,
	datac => \Add0~20_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[10]~70_combout\);

-- Location: LCCOMB_X46_Y72_N6
\ALUResult[10]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~71_combout\ = (\Op_ADS~input_o\) # ((\regDataA[10]~input_o\ & \regDataB[10]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[10]~input_o\,
	datac => \regDataB[10]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[10]~71_combout\);

-- Location: LCCOMB_X46_Y72_N4
\ALUResult[10]~74\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[10]~74_combout\ = (\ALUResult[10]~178_combout\ & ((\ALUResult[1]~22_combout\) # ((\ALUResult[10]~70_combout\ & \ALUResult[10]~71_combout\)))) # (!\ALUResult[10]~178_combout\ & (\ALUResult[10]~70_combout\ & (\ALUResult[10]~71_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[10]~178_combout\,
	datab => \ALUResult[10]~70_combout\,
	datac => \ALUResult[10]~71_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[10]~74_combout\);

-- Location: LCCOMB_X46_Y72_N28
\ALUResult[10]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(10) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[10]~74_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(10),
	datac => \ALUResult[10]~74_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(10));

-- Location: IOIBUF_X42_Y73_N8
\regDataB[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(11),
	o => \regDataB[11]~input_o\);

-- Location: LCCOMB_X48_Y72_N22
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

-- Location: LCCOMB_X47_Y72_N8
\ALUResult[11]~76\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~76_combout\ = (\Add0~22_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~22_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[11]~76_combout\);

-- Location: LCCOMB_X47_Y72_N30
\ALUResult[11]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~75_combout\ = (\regDataB[11]~input_o\ & (\Op_ARS~input_o\ & (\regDataA[11]~input_o\ & !\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[11]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[11]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[11]~75_combout\);

-- Location: IOIBUF_X18_Y73_N15
\regDataA[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(12),
	o => \regDataA[12]~input_o\);

-- Location: LCCOMB_X46_Y71_N28
\ALUResult[11]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~77_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[1]~27_combout\ & (\regDataA[10]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[12]~input_o\))))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[1]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[10]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[12]~input_o\,
	combout => \ALUResult[11]~77_combout\);

-- Location: LCCOMB_X46_Y71_N14
\ALUResult[11]~78\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~78_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[11]~77_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataB[11]~input_o\ & ((\ALUResult[11]~77_combout\) # (!\regDataA[11]~input_o\))) # (!\regDataB[11]~input_o\ & 
-- ((\regDataA[11]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[11]~input_o\,
	datab => \ALUResult[11]~77_combout\,
	datac => \ALUResult[0]~17_combout\,
	datad => \regDataA[11]~input_o\,
	combout => \ALUResult[11]~78_combout\);

-- Location: LCCOMB_X47_Y72_N4
\ALUResult[11]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[11]~79_combout\ = (\ALUResult[11]~76_combout\) # ((\ALUResult[11]~75_combout\) # ((\ALUResult[11]~78_combout\ & \ALUResult[1]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[11]~76_combout\,
	datab => \ALUResult[11]~75_combout\,
	datac => \ALUResult[11]~78_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[11]~79_combout\);

-- Location: LCCOMB_X46_Y72_N30
\ALUResult[11]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(11) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[11]~79_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(11))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[11]~79_combout\,
	datac => ALUResult(11),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(11));

-- Location: IOIBUF_X13_Y73_N15
\regDataB[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(12),
	o => \regDataB[12]~input_o\);

-- Location: IOIBUF_X67_Y73_N15
\regDataA[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(13),
	o => \regDataA[13]~input_o\);

-- Location: LCCOMB_X46_Y71_N24
\ALUResult[12]~80\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~80_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[1]~27_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataA[12]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[12]~input_o\))) # (!\regDataA[12]~input_o\ & 
-- (\regDataB[12]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000000110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[12]~input_o\,
	datab => \regDataB[12]~input_o\,
	datac => \ALUResult[0]~17_combout\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[12]~80_combout\);

-- Location: LCCOMB_X46_Y71_N10
\ALUResult[12]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~81_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[12]~80_combout\ & (\regDataA[11]~input_o\)) # (!\ALUResult[12]~80_combout\ & ((\regDataA[13]~input_o\))))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[12]~80_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[11]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataA[13]~input_o\,
	datad => \ALUResult[12]~80_combout\,
	combout => \ALUResult[12]~81_combout\);

-- Location: LCCOMB_X46_Y71_N4
\ALUResult[12]~82\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~82_combout\ = (\Op_ARS~input_o\ & (\regDataA[12]~input_o\ & (\regDataB[12]~input_o\))) # (!\Op_ARS~input_o\ & (((\ALUResult[12]~81_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[12]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataB[12]~input_o\,
	datad => \ALUResult[12]~81_combout\,
	combout => \ALUResult[12]~82_combout\);

-- Location: LCCOMB_X48_Y72_N24
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

-- Location: LCCOMB_X47_Y71_N10
\ALUResult[12]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[12]~83_combout\ = (\Op_ADS~input_o\ & ((\Add0~24_combout\))) # (!\Op_ADS~input_o\ & (\ALUResult[12]~82_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111001000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \ALUResult[12]~82_combout\,
	datad => \Add0~24_combout\,
	combout => \ALUResult[12]~83_combout\);

-- Location: LCCOMB_X47_Y71_N2
\ALUResult[12]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(12) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[12]~83_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[12]~83_combout\,
	datab => ALUResult(12),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(12));

-- Location: IOIBUF_X20_Y73_N22
\regDataB[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(13),
	o => \regDataB[13]~input_o\);

-- Location: IOIBUF_X67_Y73_N1
\regDataA[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(14),
	o => \regDataA[14]~input_o\);

-- Location: LCCOMB_X46_Y71_N0
\ALUResult[13]~86\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~86_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[1]~27_combout\ & (\regDataA[12]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[14]~input_o\))))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[1]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[12]~input_o\,
	datab => \regDataA[14]~input_o\,
	datac => \ALUResult[0]~17_combout\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[13]~86_combout\);

-- Location: LCCOMB_X46_Y71_N2
\ALUResult[13]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~87_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[13]~86_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataB[13]~input_o\ & ((\ALUResult[13]~86_combout\) # (!\regDataA[13]~input_o\))) # (!\regDataB[13]~input_o\ & 
-- (\regDataA[13]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[13]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataA[13]~input_o\,
	datad => \ALUResult[13]~86_combout\,
	combout => \ALUResult[13]~87_combout\);

-- Location: LCCOMB_X48_Y72_N26
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

-- Location: LCCOMB_X47_Y71_N4
\ALUResult[13]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~85_combout\ = (\Add0~26_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Add0~26_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[13]~85_combout\);

-- Location: LCCOMB_X46_Y71_N22
\ALUResult[13]~84\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~84_combout\ = (\regDataB[13]~input_o\ & (\Op_ARS~input_o\ & (\regDataA[13]~input_o\ & !\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[13]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[13]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[13]~84_combout\);

-- Location: LCCOMB_X46_Y71_N12
\ALUResult[13]~88\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[13]~88_combout\ = (\ALUResult[13]~85_combout\) # ((\ALUResult[13]~84_combout\) # ((\ALUResult[13]~87_combout\ & \ALUResult[1]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[13]~87_combout\,
	datab => \ALUResult[13]~85_combout\,
	datac => \ALUResult[1]~22_combout\,
	datad => \ALUResult[13]~84_combout\,
	combout => \ALUResult[13]~88_combout\);

-- Location: LCCOMB_X46_Y71_N30
\ALUResult[13]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(13) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[13]~88_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(13),
	datac => \ALUResult[13]~88_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(13));

-- Location: IOIBUF_X67_Y73_N22
\regDataB[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(14),
	o => \regDataB[14]~input_o\);

-- Location: LCCOMB_X48_Y72_N28
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

-- Location: LCCOMB_X50_Y72_N0
\ALUResult[14]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~89_combout\ = (\Op_ADS~input_o\ & ((\Add0~28_combout\))) # (!\Op_ADS~input_o\ & (\Op_ARS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ARS~input_o\,
	datac => \Add0~28_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[14]~89_combout\);

-- Location: LCCOMB_X50_Y72_N2
\ALUResult[14]~90\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~90_combout\ = (\Op_ADS~input_o\) # ((\regDataB[14]~input_o\ & \regDataA[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataB[14]~input_o\,
	datac => \regDataA[14]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[14]~90_combout\);

-- Location: LCCOMB_X50_Y72_N30
\ALUResult[14]~92\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~92_combout\ = (\regDataB[14]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[14]~input_o\))) # (!\regDataB[14]~input_o\ & (\regDataA[14]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataB[14]~input_o\,
	datac => \regDataA[14]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[14]~92_combout\);

-- Location: IOIBUF_X27_Y73_N22
\regDataA[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(15),
	o => \regDataA[15]~input_o\);

-- Location: LCCOMB_X50_Y72_N4
\ALUResult[14]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~91_combout\ = (\ALUResult[1]~27_combout\ & ((\regDataA[13]~input_o\))) # (!\ALUResult[1]~27_combout\ & (\regDataA[15]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[15]~input_o\,
	datac => \regDataA[13]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[14]~91_combout\);

-- Location: LCCOMB_X50_Y72_N18
\ALUResult[14]~179\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~179_combout\ = (\Op_ORS~input_o\ & (\ALUResult[14]~92_combout\)) # (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & (\ALUResult[14]~92_combout\)) # (!\Op_XRS~input_o\ & ((\ALUResult[14]~91_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[14]~92_combout\,
	datab => \ALUResult[14]~91_combout\,
	datac => \Op_ORS~input_o\,
	datad => \Op_XRS~input_o\,
	combout => \ALUResult[14]~179_combout\);

-- Location: LCCOMB_X50_Y72_N24
\ALUResult[14]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[14]~93_combout\ = (\ALUResult[14]~89_combout\ & ((\ALUResult[14]~90_combout\) # ((\ALUResult[14]~179_combout\ & \ALUResult[1]~22_combout\)))) # (!\ALUResult[14]~89_combout\ & (((\ALUResult[14]~179_combout\ & \ALUResult[1]~22_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[14]~89_combout\,
	datab => \ALUResult[14]~90_combout\,
	datac => \ALUResult[14]~179_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[14]~93_combout\);

-- Location: LCCOMB_X50_Y72_N28
\ALUResult[14]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(14) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[14]~93_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(14))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[14]~93_combout\,
	datab => ALUResult(14),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(14));

-- Location: IOIBUF_X54_Y73_N8
\regDataB[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(15),
	o => \regDataB[15]~input_o\);

-- Location: LCCOMB_X50_Y72_N10
\ALUResult[15]~94\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~94_combout\ = (\ALUResult[0]~17_combout\) # ((\regDataA[15]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[15]~input_o\))) # (!\regDataA[15]~input_o\ & (\regDataB[15]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111010111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataA[15]~input_o\,
	datac => \regDataB[15]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[15]~94_combout\);

-- Location: LCCOMB_X50_Y72_N12
\ALUResult[15]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~95_combout\ = (\Op_ARS~input_o\ & (((\regDataB[15]~input_o\ & \regDataA[15]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[15]~94_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[15]~94_combout\,
	datab => \Op_ARS~input_o\,
	datac => \regDataB[15]~input_o\,
	datad => \regDataA[15]~input_o\,
	combout => \ALUResult[15]~95_combout\);

-- Location: IOIBUF_X9_Y73_N8
\regDataA[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(16),
	o => \regDataA[16]~input_o\);

-- Location: LCCOMB_X50_Y72_N14
\ALUResult[15]~96\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~96_combout\ = ((\ALUResult[1]~27_combout\ & ((\regDataA[14]~input_o\))) # (!\ALUResult[1]~27_combout\ & (\regDataA[16]~input_o\))) # (!\ALUResult[0]~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010111011101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataA[16]~input_o\,
	datac => \regDataA[14]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[15]~96_combout\);

-- Location: LCCOMB_X50_Y72_N8
\ALUResult[15]~97\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~97_combout\ = (\ALUResult[15]~96_combout\) # (\Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ALUResult[15]~96_combout\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[15]~97_combout\);

-- Location: LCCOMB_X48_Y72_N30
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

-- Location: LCCOMB_X50_Y72_N26
\ALUResult[15]~98\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[15]~98_combout\ = (\Op_ADS~input_o\ & (((\Add0~30_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[15]~95_combout\ & (\ALUResult[15]~97_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[15]~95_combout\,
	datab => \Op_ADS~input_o\,
	datac => \ALUResult[15]~97_combout\,
	datad => \Add0~30_combout\,
	combout => \ALUResult[15]~98_combout\);

-- Location: LCCOMB_X50_Y72_N6
\ALUResult[15]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(15) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[15]~98_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(15),
	datac => \ALUResult[15]~98_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(15));

-- Location: IOIBUF_X60_Y73_N1
\regDataB[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(16),
	o => \regDataB[16]~input_o\);

-- Location: LCCOMB_X48_Y71_N0
\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = ((\regDataA[16]~input_o\ $ (\regDataB[16]~input_o\ $ (!\Add0~31\)))) # (GND)
-- \Add0~33\ = CARRY((\regDataA[16]~input_o\ & ((\regDataB[16]~input_o\) # (!\Add0~31\))) # (!\regDataA[16]~input_o\ & (\regDataB[16]~input_o\ & !\Add0~31\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[16]~input_o\,
	datab => \regDataB[16]~input_o\,
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X50_Y72_N20
\ALUResult[16]~99\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~99_combout\ = (\ALUResult[0]~17_combout\ & (\ALUResult[1]~27_combout\)) # (!\ALUResult[0]~17_combout\ & ((\regDataA[16]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[16]~input_o\))) # (!\regDataA[16]~input_o\ & 
-- ((\regDataB[16]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~27_combout\,
	datab => \regDataA[16]~input_o\,
	datac => \ALUResult[0]~17_combout\,
	datad => \regDataB[16]~input_o\,
	combout => \ALUResult[16]~99_combout\);

-- Location: IOIBUF_X60_Y73_N8
\regDataA[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(17),
	o => \regDataA[17]~input_o\);

-- Location: LCCOMB_X50_Y72_N22
\ALUResult[16]~100\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~100_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[16]~99_combout\ & ((\regDataA[15]~input_o\))) # (!\ALUResult[16]~99_combout\ & (\regDataA[17]~input_o\)))) # (!\ALUResult[0]~17_combout\ & (\ALUResult[16]~99_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110001100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \ALUResult[16]~99_combout\,
	datac => \regDataA[17]~input_o\,
	datad => \regDataA[15]~input_o\,
	combout => \ALUResult[16]~100_combout\);

-- Location: LCCOMB_X50_Y72_N16
\ALUResult[16]~101\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~101_combout\ = (\Op_ARS~input_o\ & (\regDataA[16]~input_o\ & ((\regDataB[16]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[16]~100_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[16]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \ALUResult[16]~100_combout\,
	datad => \regDataB[16]~input_o\,
	combout => \ALUResult[16]~101_combout\);

-- Location: LCCOMB_X47_Y71_N22
\ALUResult[16]~102\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[16]~102_combout\ = (\Op_ADS~input_o\ & (\Add0~32_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[16]~101_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datac => \Add0~32_combout\,
	datad => \ALUResult[16]~101_combout\,
	combout => \ALUResult[16]~102_combout\);

-- Location: LCCOMB_X47_Y71_N12
\ALUResult[16]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(16) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[16]~102_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(16),
	datac => \ALUResult[16]~102_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(16));

-- Location: IOIBUF_X52_Y73_N15
\regDataB[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(17),
	o => \regDataB[17]~input_o\);

-- Location: LCCOMB_X50_Y71_N8
\ALUResult[17]~103\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~103_combout\ = (\regDataA[17]~input_o\ & (\regDataB[17]~input_o\ & (\Op_ARS~input_o\ & !\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[17]~input_o\,
	datab => \regDataB[17]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[17]~103_combout\);

-- Location: IOIBUF_X49_Y0_N15
\regDataA[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(18),
	o => \regDataA[18]~input_o\);

-- Location: LCCOMB_X50_Y71_N4
\ALUResult[17]~105\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~105_combout\ = (\ALUResult[1]~27_combout\ & (((\regDataA[16]~input_o\) # (!\ALUResult[0]~17_combout\)))) # (!\ALUResult[1]~27_combout\ & (\regDataA[18]~input_o\ & (\ALUResult[0]~17_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110000101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[18]~input_o\,
	datab => \ALUResult[1]~27_combout\,
	datac => \ALUResult[0]~17_combout\,
	datad => \regDataA[16]~input_o\,
	combout => \ALUResult[17]~105_combout\);

-- Location: LCCOMB_X50_Y71_N14
\ALUResult[17]~106\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~106_combout\ = (\ALUResult[0]~17_combout\ & (\ALUResult[17]~105_combout\)) # (!\ALUResult[0]~17_combout\ & ((\regDataB[17]~input_o\ & ((\ALUResult[17]~105_combout\) # (!\regDataA[17]~input_o\))) # (!\regDataB[17]~input_o\ & 
-- ((\regDataA[17]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \ALUResult[17]~105_combout\,
	datac => \regDataB[17]~input_o\,
	datad => \regDataA[17]~input_o\,
	combout => \ALUResult[17]~106_combout\);

-- Location: LCCOMB_X48_Y71_N2
\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (\regDataA[17]~input_o\ & ((\regDataB[17]~input_o\ & (\Add0~33\ & VCC)) # (!\regDataB[17]~input_o\ & (!\Add0~33\)))) # (!\regDataA[17]~input_o\ & ((\regDataB[17]~input_o\ & (!\Add0~33\)) # (!\regDataB[17]~input_o\ & ((\Add0~33\) # 
-- (GND)))))
-- \Add0~35\ = CARRY((\regDataA[17]~input_o\ & (!\regDataB[17]~input_o\ & !\Add0~33\)) # (!\regDataA[17]~input_o\ & ((!\Add0~33\) # (!\regDataB[17]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[17]~input_o\,
	datab => \regDataB[17]~input_o\,
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X50_Y71_N2
\ALUResult[17]~104\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~104_combout\ = (\Add0~34_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~34_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[17]~104_combout\);

-- Location: LCCOMB_X50_Y71_N0
\ALUResult[17]~107\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[17]~107_combout\ = (\ALUResult[17]~103_combout\) # ((\ALUResult[17]~104_combout\) # ((\ALUResult[17]~106_combout\ & \ALUResult[1]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[17]~103_combout\,
	datab => \ALUResult[17]~106_combout\,
	datac => \ALUResult[1]~22_combout\,
	datad => \ALUResult[17]~104_combout\,
	combout => \ALUResult[17]~107_combout\);

-- Location: LCCOMB_X50_Y71_N16
\ALUResult[17]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(17) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[17]~107_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(17),
	datac => \ALUResult[17]~107_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(17));

-- Location: IOIBUF_X69_Y73_N15
\regDataB[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(18),
	o => \regDataB[18]~input_o\);

-- Location: LCCOMB_X48_Y71_N4
\Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = ((\regDataB[18]~input_o\ $ (\regDataA[18]~input_o\ $ (!\Add0~35\)))) # (GND)
-- \Add0~37\ = CARRY((\regDataB[18]~input_o\ & ((\regDataA[18]~input_o\) # (!\Add0~35\))) # (!\regDataB[18]~input_o\ & (\regDataA[18]~input_o\ & !\Add0~35\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[18]~input_o\,
	datab => \regDataA[18]~input_o\,
	datad => VCC,
	cin => \Add0~35\,
	combout => \Add0~36_combout\,
	cout => \Add0~37\);

-- Location: IOIBUF_X25_Y73_N22
\regDataA[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(19),
	o => \regDataA[19]~input_o\);

-- Location: LCCOMB_X50_Y71_N26
\ALUResult[18]~108\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~108_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[1]~27_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataA[18]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[18]~input_o\))) # (!\regDataA[18]~input_o\ & 
-- ((\regDataB[18]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[18]~input_o\,
	datab => \ALUResult[1]~27_combout\,
	datac => \ALUResult[0]~17_combout\,
	datad => \regDataB[18]~input_o\,
	combout => \ALUResult[18]~108_combout\);

-- Location: LCCOMB_X50_Y71_N20
\ALUResult[18]~109\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~109_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[18]~108_combout\ & ((\regDataA[17]~input_o\))) # (!\ALUResult[18]~108_combout\ & (\regDataA[19]~input_o\)))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[18]~108_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100001011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataA[19]~input_o\,
	datac => \ALUResult[18]~108_combout\,
	datad => \regDataA[17]~input_o\,
	combout => \ALUResult[18]~109_combout\);

-- Location: LCCOMB_X50_Y71_N22
\ALUResult[18]~110\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~110_combout\ = (\Op_ARS~input_o\ & (\regDataA[18]~input_o\ & ((\regDataB[18]~input_o\)))) # (!\Op_ARS~input_o\ & (((\ALUResult[18]~109_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[18]~input_o\,
	datab => \ALUResult[18]~109_combout\,
	datac => \Op_ARS~input_o\,
	datad => \regDataB[18]~input_o\,
	combout => \ALUResult[18]~110_combout\);

-- Location: LCCOMB_X47_Y71_N24
\ALUResult[18]~111\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[18]~111_combout\ = (\Op_ADS~input_o\ & (\Add0~36_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[18]~110_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~36_combout\,
	datab => \Op_ADS~input_o\,
	datac => \ALUResult[18]~110_combout\,
	combout => \ALUResult[18]~111_combout\);

-- Location: LCCOMB_X47_Y71_N6
\ALUResult[18]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(18) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[18]~111_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(18),
	datac => \ALUResult[18]~111_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(18));

-- Location: IOIBUF_X31_Y73_N1
\regDataB[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(19),
	o => \regDataB[19]~input_o\);

-- Location: LCCOMB_X50_Y71_N24
\ALUResult[19]~112\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~112_combout\ = (\regDataB[19]~input_o\ & (\regDataA[19]~input_o\ & (\Op_ARS~input_o\ & !\Op_ADS~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[19]~input_o\,
	datab => \regDataA[19]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[19]~112_combout\);

-- Location: IOIBUF_X20_Y73_N15
\regDataA[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(20),
	o => \regDataA[20]~input_o\);

-- Location: LCCOMB_X50_Y71_N10
\ALUResult[19]~114\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~114_combout\ = (\ALUResult[1]~27_combout\ & ((\regDataA[18]~input_o\) # ((!\ALUResult[0]~17_combout\)))) # (!\ALUResult[1]~27_combout\ & (((\ALUResult[0]~17_combout\ & \regDataA[20]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011110010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[18]~input_o\,
	datab => \ALUResult[1]~27_combout\,
	datac => \ALUResult[0]~17_combout\,
	datad => \regDataA[20]~input_o\,
	combout => \ALUResult[19]~114_combout\);

-- Location: LCCOMB_X50_Y71_N28
\ALUResult[19]~115\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~115_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[19]~114_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataB[19]~input_o\ & ((\ALUResult[19]~114_combout\) # (!\regDataA[19]~input_o\))) # (!\regDataB[19]~input_o\ & 
-- (\regDataA[19]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataB[19]~input_o\,
	datac => \regDataA[19]~input_o\,
	datad => \ALUResult[19]~114_combout\,
	combout => \ALUResult[19]~115_combout\);

-- Location: LCCOMB_X48_Y71_N6
\Add0~38\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~38_combout\ = (\regDataA[19]~input_o\ & ((\regDataB[19]~input_o\ & (\Add0~37\ & VCC)) # (!\regDataB[19]~input_o\ & (!\Add0~37\)))) # (!\regDataA[19]~input_o\ & ((\regDataB[19]~input_o\ & (!\Add0~37\)) # (!\regDataB[19]~input_o\ & ((\Add0~37\) # 
-- (GND)))))
-- \Add0~39\ = CARRY((\regDataA[19]~input_o\ & (!\regDataB[19]~input_o\ & !\Add0~37\)) # (!\regDataA[19]~input_o\ & ((!\Add0~37\) # (!\regDataB[19]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[19]~input_o\,
	datab => \regDataB[19]~input_o\,
	datad => VCC,
	cin => \Add0~37\,
	combout => \Add0~38_combout\,
	cout => \Add0~39\);

-- Location: LCCOMB_X49_Y71_N4
\ALUResult[19]~113\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~113_combout\ = (\Add0~38_combout\ & \Op_ADS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \Add0~38_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[19]~113_combout\);

-- Location: LCCOMB_X50_Y71_N6
\ALUResult[19]~116\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[19]~116_combout\ = (\ALUResult[19]~112_combout\) # ((\ALUResult[19]~113_combout\) # ((\ALUResult[19]~115_combout\ & \ALUResult[1]~22_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[19]~112_combout\,
	datab => \ALUResult[19]~115_combout\,
	datac => \ALUResult[1]~22_combout\,
	datad => \ALUResult[19]~113_combout\,
	combout => \ALUResult[19]~116_combout\);

-- Location: LCCOMB_X50_Y71_N18
\ALUResult[19]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(19) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[19]~116_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(19))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[19]~116_combout\,
	datac => ALUResult(19),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(19));

-- Location: IOIBUF_X58_Y73_N8
\regDataB[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(20),
	o => \regDataB[20]~input_o\);

-- Location: LCCOMB_X47_Y69_N6
\ALUResult[20]~120\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~120_combout\ = (\regDataB[20]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[20]~input_o\))) # (!\regDataB[20]~input_o\ & ((\regDataA[20]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011011010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[20]~input_o\,
	datab => \ALUResult[1]~27_combout\,
	datac => \regDataA[20]~input_o\,
	combout => \ALUResult[20]~120_combout\);

-- Location: IOIBUF_X79_Y73_N8
\regDataA[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(21),
	o => \regDataA[21]~input_o\);

-- Location: LCCOMB_X47_Y69_N4
\ALUResult[20]~119\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~119_combout\ = (\ALUResult[1]~27_combout\ & (\regDataA[19]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[21]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[19]~input_o\,
	datac => \regDataA[21]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[20]~119_combout\);

-- Location: LCCOMB_X47_Y69_N2
\ALUResult[20]~180\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~180_combout\ = (\Op_ORS~input_o\ & (\ALUResult[20]~120_combout\)) # (!\Op_ORS~input_o\ & ((\Op_XRS~input_o\ & (\ALUResult[20]~120_combout\)) # (!\Op_XRS~input_o\ & ((\ALUResult[20]~119_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[20]~120_combout\,
	datab => \Op_ORS~input_o\,
	datac => \ALUResult[20]~119_combout\,
	datad => \Op_XRS~input_o\,
	combout => \ALUResult[20]~180_combout\);

-- Location: LCCOMB_X48_Y71_N8
\Add0~40\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~40_combout\ = ((\regDataB[20]~input_o\ $ (\regDataA[20]~input_o\ $ (!\Add0~39\)))) # (GND)
-- \Add0~41\ = CARRY((\regDataB[20]~input_o\ & ((\regDataA[20]~input_o\) # (!\Add0~39\))) # (!\regDataB[20]~input_o\ & (\regDataA[20]~input_o\ & !\Add0~39\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[20]~input_o\,
	datab => \regDataA[20]~input_o\,
	datad => VCC,
	cin => \Add0~39\,
	combout => \Add0~40_combout\,
	cout => \Add0~41\);

-- Location: LCCOMB_X47_Y69_N8
\ALUResult[20]~117\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~117_combout\ = (\Op_ADS~input_o\ & ((\Add0~40_combout\))) # (!\Op_ADS~input_o\ & (\Op_ARS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_ARS~input_o\,
	datac => \Add0~40_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[20]~117_combout\);

-- Location: LCCOMB_X47_Y69_N10
\ALUResult[20]~118\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~118_combout\ = (\Op_ADS~input_o\) # ((\regDataB[20]~input_o\ & \regDataA[20]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[20]~input_o\,
	datab => \regDataA[20]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[20]~118_combout\);

-- Location: LCCOMB_X47_Y69_N16
\ALUResult[20]~121\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[20]~121_combout\ = (\ALUResult[1]~22_combout\ & ((\ALUResult[20]~180_combout\) # ((\ALUResult[20]~117_combout\ & \ALUResult[20]~118_combout\)))) # (!\ALUResult[1]~22_combout\ & (((\ALUResult[20]~117_combout\ & \ALUResult[20]~118_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[1]~22_combout\,
	datab => \ALUResult[20]~180_combout\,
	datac => \ALUResult[20]~117_combout\,
	datad => \ALUResult[20]~118_combout\,
	combout => \ALUResult[20]~121_combout\);

-- Location: LCCOMB_X47_Y69_N28
\ALUResult[20]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(20) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[20]~121_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(20),
	datac => \ALUResult[20]~121_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(20));

-- Location: IOIBUF_X47_Y73_N15
\regDataB[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(21),
	o => \regDataB[21]~input_o\);

-- Location: LCCOMB_X47_Y69_N18
\ALUResult[21]~122\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~122_combout\ = (\ALUResult[0]~17_combout\) # ((\regDataB[21]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[21]~input_o\))) # (!\regDataB[21]~input_o\ & (\regDataA[21]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011011110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[21]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataA[21]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[21]~122_combout\);

-- Location: LCCOMB_X47_Y69_N20
\ALUResult[21]~123\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~123_combout\ = (\Op_ARS~input_o\ & (\regDataB[21]~input_o\ & (\regDataA[21]~input_o\))) # (!\Op_ARS~input_o\ & (((\ALUResult[21]~122_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011001110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[21]~input_o\,
	datab => \Op_ARS~input_o\,
	datac => \regDataA[21]~input_o\,
	datad => \ALUResult[21]~122_combout\,
	combout => \ALUResult[21]~123_combout\);

-- Location: LCCOMB_X48_Y71_N10
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

-- Location: IOIBUF_X33_Y73_N8
\regDataA[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(22),
	o => \regDataA[22]~input_o\);

-- Location: LCCOMB_X47_Y69_N30
\ALUResult[21]~124\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~124_combout\ = ((\ALUResult[1]~27_combout\ & (\regDataA[20]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[22]~input_o\)))) # (!\ALUResult[0]~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101111110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[20]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataA[22]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[21]~124_combout\);

-- Location: LCCOMB_X47_Y69_N24
\ALUResult[21]~125\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~125_combout\ = (\ALUResult[21]~124_combout\) # (\Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[21]~124_combout\,
	datac => \Op_ARS~input_o\,
	combout => \ALUResult[21]~125_combout\);

-- Location: LCCOMB_X47_Y69_N26
\ALUResult[21]~126\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[21]~126_combout\ = (\Op_ADS~input_o\ & (((\Add0~42_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[21]~123_combout\ & ((\ALUResult[21]~125_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110010010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \ALUResult[21]~123_combout\,
	datac => \Add0~42_combout\,
	datad => \ALUResult[21]~125_combout\,
	combout => \ALUResult[21]~126_combout\);

-- Location: LCCOMB_X36_Y69_N0
\ALUResult[21]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(21) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[21]~126_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(21))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[21]~126_combout\,
	datac => \ALUResult[31]~23clkctrl_outclk\,
	datad => ALUResult(21),
	combout => ALUResult(21));

-- Location: IOIBUF_X20_Y73_N1
\regDataB[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(22),
	o => \regDataB[22]~input_o\);

-- Location: LCCOMB_X48_Y71_N12
\Add0~44\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~44_combout\ = ((\regDataB[22]~input_o\ $ (\regDataA[22]~input_o\ $ (!\Add0~43\)))) # (GND)
-- \Add0~45\ = CARRY((\regDataB[22]~input_o\ & ((\regDataA[22]~input_o\) # (!\Add0~43\))) # (!\regDataB[22]~input_o\ & (\regDataA[22]~input_o\ & !\Add0~43\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[22]~input_o\,
	datab => \regDataA[22]~input_o\,
	datad => VCC,
	cin => \Add0~43\,
	combout => \Add0~44_combout\,
	cout => \Add0~45\);

-- Location: IOIBUF_X29_Y73_N8
\regDataA[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(23),
	o => \regDataA[23]~input_o\);

-- Location: LCCOMB_X47_Y69_N12
\ALUResult[22]~127\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[22]~127_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[1]~27_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataB[22]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[22]~input_o\))) # (!\regDataB[22]~input_o\ & 
-- (\regDataA[22]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[22]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataA[22]~input_o\,
	datad => \ALUResult[1]~27_combout\,
	combout => \ALUResult[22]~127_combout\);

-- Location: LCCOMB_X47_Y69_N22
\ALUResult[22]~128\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[22]~128_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[22]~127_combout\ & ((\regDataA[21]~input_o\))) # (!\ALUResult[22]~127_combout\ & (\regDataA[23]~input_o\)))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[22]~127_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[23]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataA[21]~input_o\,
	datad => \ALUResult[22]~127_combout\,
	combout => \ALUResult[22]~128_combout\);

-- Location: LCCOMB_X47_Y69_N0
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

-- Location: LCCOMB_X47_Y71_N26
\ALUResult[22]~130\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[22]~130_combout\ = (\Op_ADS~input_o\ & (\Add0~44_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[22]~129_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datab => \Add0~44_combout\,
	datad => \ALUResult[22]~129_combout\,
	combout => \ALUResult[22]~130_combout\);

-- Location: LCCOMB_X46_Y71_N16
\ALUResult[22]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(22) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[22]~130_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(22))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[22]~130_combout\,
	datab => ALUResult(22),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(22));

-- Location: IOIBUF_X81_Y73_N22
\regDataB[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(23),
	o => \regDataB[23]~input_o\);

-- Location: LCCOMB_X48_Y71_N14
\Add0~46\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~46_combout\ = (\regDataA[23]~input_o\ & ((\regDataB[23]~input_o\ & (\Add0~45\ & VCC)) # (!\regDataB[23]~input_o\ & (!\Add0~45\)))) # (!\regDataA[23]~input_o\ & ((\regDataB[23]~input_o\ & (!\Add0~45\)) # (!\regDataB[23]~input_o\ & ((\Add0~45\) # 
-- (GND)))))
-- \Add0~47\ = CARRY((\regDataA[23]~input_o\ & (!\regDataB[23]~input_o\ & !\Add0~45\)) # (!\regDataA[23]~input_o\ & ((!\Add0~45\) # (!\regDataB[23]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[23]~input_o\,
	datab => \regDataB[23]~input_o\,
	datad => VCC,
	cin => \Add0~45\,
	combout => \Add0~46_combout\,
	cout => \Add0~47\);

-- Location: IOIBUF_X72_Y73_N15
\regDataA[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(24),
	o => \regDataA[24]~input_o\);

-- Location: LCCOMB_X49_Y71_N18
\ALUResult[23]~133\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~133_combout\ = ((\ALUResult[1]~27_combout\ & (\regDataA[22]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[24]~input_o\)))) # (!\ALUResult[0]~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111110110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[22]~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[24]~input_o\,
	combout => \ALUResult[23]~133_combout\);

-- Location: LCCOMB_X49_Y71_N20
\ALUResult[23]~134\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~134_combout\ = (\ALUResult[23]~133_combout\) # (\Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[23]~133_combout\,
	datac => \Op_ARS~input_o\,
	combout => \ALUResult[23]~134_combout\);

-- Location: LCCOMB_X49_Y71_N6
\ALUResult[23]~131\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~131_combout\ = (\ALUResult[0]~17_combout\) # ((\regDataA[23]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataB[23]~input_o\))) # (!\regDataA[23]~input_o\ & ((\regDataB[23]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataA[23]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataB[23]~input_o\,
	combout => \ALUResult[23]~131_combout\);

-- Location: LCCOMB_X49_Y71_N16
\ALUResult[23]~132\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~132_combout\ = (\Op_ARS~input_o\ & (((\regDataA[23]~input_o\ & \regDataB[23]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[23]~131_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[23]~131_combout\,
	datab => \regDataA[23]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \regDataB[23]~input_o\,
	combout => \ALUResult[23]~132_combout\);

-- Location: LCCOMB_X49_Y71_N14
\ALUResult[23]~135\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[23]~135_combout\ = (\Op_ADS~input_o\ & (\Add0~46_combout\)) # (!\Op_ADS~input_o\ & (((\ALUResult[23]~134_combout\ & \ALUResult[23]~132_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~46_combout\,
	datab => \ALUResult[23]~134_combout\,
	datac => \Op_ADS~input_o\,
	datad => \ALUResult[23]~132_combout\,
	combout => \ALUResult[23]~135_combout\);

-- Location: LCCOMB_X40_Y71_N0
\ALUResult[23]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(23) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[23]~135_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(23)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(23),
	datac => \ALUResult[23]~135_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(23));

-- Location: IOIBUF_X65_Y73_N15
\regDataB[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(24),
	o => \regDataB[24]~input_o\);

-- Location: LCCOMB_X49_Y71_N22
\ALUResult[24]~139\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~139_combout\ = (\regDataB[24]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[24]~input_o\))) # (!\regDataB[24]~input_o\ & ((\regDataA[24]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[24]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[24]~input_o\,
	combout => \ALUResult[24]~139_combout\);

-- Location: IOIBUF_X13_Y73_N8
\regDataA[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(25),
	o => \regDataA[25]~input_o\);

-- Location: LCCOMB_X49_Y71_N12
\ALUResult[24]~138\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~138_combout\ = (\ALUResult[1]~27_combout\ & ((\regDataA[23]~input_o\))) # (!\ALUResult[1]~27_combout\ & (\regDataA[25]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[25]~input_o\,
	datab => \regDataA[23]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	combout => \ALUResult[24]~138_combout\);

-- Location: LCCOMB_X49_Y71_N28
\ALUResult[24]~181\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~181_combout\ = (\Op_XRS~input_o\ & (\ALUResult[24]~139_combout\)) # (!\Op_XRS~input_o\ & ((\Op_ORS~input_o\ & (\ALUResult[24]~139_combout\)) # (!\Op_ORS~input_o\ & ((\ALUResult[24]~138_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[24]~139_combout\,
	datab => \Op_XRS~input_o\,
	datac => \Op_ORS~input_o\,
	datad => \ALUResult[24]~138_combout\,
	combout => \ALUResult[24]~181_combout\);

-- Location: LCCOMB_X49_Y71_N10
\ALUResult[24]~137\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~137_combout\ = (\Op_ADS~input_o\) # ((\regDataA[24]~input_o\ & \regDataB[24]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[24]~input_o\,
	datac => \regDataB[24]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[24]~137_combout\);

-- Location: LCCOMB_X48_Y71_N16
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

-- Location: LCCOMB_X49_Y71_N8
\ALUResult[24]~136\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~136_combout\ = (\Op_ADS~input_o\ & ((\Add0~48_combout\))) # (!\Op_ADS~input_o\ & (\Op_ARS~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datac => \Add0~48_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[24]~136_combout\);

-- Location: LCCOMB_X49_Y71_N24
\ALUResult[24]~140\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[24]~140_combout\ = (\ALUResult[24]~181_combout\ & ((\ALUResult[1]~22_combout\) # ((\ALUResult[24]~137_combout\ & \ALUResult[24]~136_combout\)))) # (!\ALUResult[24]~181_combout\ & (\ALUResult[24]~137_combout\ & (\ALUResult[24]~136_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[24]~181_combout\,
	datab => \ALUResult[24]~137_combout\,
	datac => \ALUResult[24]~136_combout\,
	datad => \ALUResult[1]~22_combout\,
	combout => \ALUResult[24]~140_combout\);

-- Location: LCCOMB_X49_Y71_N30
\ALUResult[24]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(24) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[24]~140_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(24))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[24]~140_combout\,
	datac => ALUResult(24),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(24));

-- Location: IOIBUF_X72_Y73_N22
\regDataB[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(25),
	o => \regDataB[25]~input_o\);

-- Location: LCCOMB_X47_Y70_N10
\ALUResult[25]~141\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~141_combout\ = (\ALUResult[0]~17_combout\) # ((\regDataB[25]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[25]~input_o\))) # (!\regDataB[25]~input_o\ & ((\regDataA[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \ALUResult[1]~27_combout\,
	datac => \regDataB[25]~input_o\,
	datad => \regDataA[25]~input_o\,
	combout => \ALUResult[25]~141_combout\);

-- Location: LCCOMB_X47_Y70_N4
\ALUResult[25]~142\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~142_combout\ = (\Op_ARS~input_o\ & (((\regDataA[25]~input_o\ & \regDataB[25]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[25]~141_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[25]~141_combout\,
	datab => \regDataA[25]~input_o\,
	datac => \regDataB[25]~input_o\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[25]~142_combout\);

-- Location: IOIBUF_X5_Y73_N22
\regDataA[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(26),
	o => \regDataA[26]~input_o\);

-- Location: LCCOMB_X47_Y70_N6
\ALUResult[25]~143\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~143_combout\ = ((\ALUResult[1]~27_combout\ & (\regDataA[24]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[26]~input_o\)))) # (!\ALUResult[0]~17_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111011111010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \ALUResult[1]~27_combout\,
	datac => \regDataA[24]~input_o\,
	datad => \regDataA[26]~input_o\,
	combout => \ALUResult[25]~143_combout\);

-- Location: LCCOMB_X47_Y70_N8
\ALUResult[25]~144\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~144_combout\ = (\ALUResult[25]~143_combout\) # (\Op_ARS~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[25]~143_combout\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[25]~144_combout\);

-- Location: LCCOMB_X48_Y71_N18
\Add0~50\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~50_combout\ = (\regDataB[25]~input_o\ & ((\regDataA[25]~input_o\ & (\Add0~49\ & VCC)) # (!\regDataA[25]~input_o\ & (!\Add0~49\)))) # (!\regDataB[25]~input_o\ & ((\regDataA[25]~input_o\ & (!\Add0~49\)) # (!\regDataA[25]~input_o\ & ((\Add0~49\) # 
-- (GND)))))
-- \Add0~51\ = CARRY((\regDataB[25]~input_o\ & (!\regDataA[25]~input_o\ & !\Add0~49\)) # (!\regDataB[25]~input_o\ & ((!\Add0~49\) # (!\regDataA[25]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[25]~input_o\,
	datab => \regDataA[25]~input_o\,
	datad => VCC,
	cin => \Add0~49\,
	combout => \Add0~50_combout\,
	cout => \Add0~51\);

-- Location: LCCOMB_X47_Y71_N20
\ALUResult[25]~145\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[25]~145_combout\ = (\Op_ADS~input_o\ & (((\Add0~50_combout\)))) # (!\Op_ADS~input_o\ & (\ALUResult[25]~142_combout\ & (\ALUResult[25]~144_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[25]~142_combout\,
	datab => \ALUResult[25]~144_combout\,
	datac => \Op_ADS~input_o\,
	datad => \Add0~50_combout\,
	combout => \ALUResult[25]~145_combout\);

-- Location: LCCOMB_X46_Y71_N18
\ALUResult[25]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(25) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[25]~145_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(25)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(25),
	datac => \ALUResult[25]~145_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(25));

-- Location: IOIBUF_X3_Y73_N1
\regDataB[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(26),
	o => \regDataB[26]~input_o\);

-- Location: IOIBUF_X69_Y73_N1
\regDataA[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(27),
	o => \regDataA[27]~input_o\);

-- Location: LCCOMB_X47_Y70_N2
\ALUResult[26]~146\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~146_combout\ = (\ALUResult[0]~17_combout\ & (\ALUResult[1]~27_combout\)) # (!\ALUResult[0]~17_combout\ & ((\regDataB[26]~input_o\ & ((\ALUResult[1]~27_combout\) # (!\regDataA[26]~input_o\))) # (!\regDataB[26]~input_o\ & 
-- ((\regDataA[26]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110111011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \ALUResult[1]~27_combout\,
	datac => \regDataB[26]~input_o\,
	datad => \regDataA[26]~input_o\,
	combout => \ALUResult[26]~146_combout\);

-- Location: LCCOMB_X47_Y70_N20
\ALUResult[26]~147\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~147_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[26]~146_combout\ & (\regDataA[25]~input_o\)) # (!\ALUResult[26]~146_combout\ & ((\regDataA[27]~input_o\))))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[26]~146_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataA[25]~input_o\,
	datac => \regDataA[27]~input_o\,
	datad => \ALUResult[26]~146_combout\,
	combout => \ALUResult[26]~147_combout\);

-- Location: LCCOMB_X47_Y70_N30
\ALUResult[26]~148\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~148_combout\ = (\Op_ARS~input_o\ & (\regDataA[26]~input_o\ & (\regDataB[26]~input_o\))) # (!\Op_ARS~input_o\ & (((\ALUResult[26]~147_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \regDataA[26]~input_o\,
	datac => \regDataB[26]~input_o\,
	datad => \ALUResult[26]~147_combout\,
	combout => \ALUResult[26]~148_combout\);

-- Location: LCCOMB_X48_Y71_N20
\Add0~52\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~52_combout\ = ((\regDataA[26]~input_o\ $ (\regDataB[26]~input_o\ $ (!\Add0~51\)))) # (GND)
-- \Add0~53\ = CARRY((\regDataA[26]~input_o\ & ((\regDataB[26]~input_o\) # (!\Add0~51\))) # (!\regDataA[26]~input_o\ & (\regDataB[26]~input_o\ & !\Add0~51\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[26]~input_o\,
	datab => \regDataB[26]~input_o\,
	datad => VCC,
	cin => \Add0~51\,
	combout => \Add0~52_combout\,
	cout => \Add0~53\);

-- Location: LCCOMB_X49_Y70_N8
\ALUResult[26]~149\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[26]~149_combout\ = (\Op_ADS~input_o\ & ((\Add0~52_combout\))) # (!\Op_ADS~input_o\ & (\ALUResult[26]~148_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[26]~148_combout\,
	datac => \Op_ADS~input_o\,
	datad => \Add0~52_combout\,
	combout => \ALUResult[26]~149_combout\);

-- Location: LCCOMB_X50_Y70_N24
\ALUResult[26]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(26) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[26]~149_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[26]~149_combout\,
	datac => ALUResult(26),
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(26));

-- Location: IOIBUF_X11_Y73_N22
\regDataB[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(27),
	o => \regDataB[27]~input_o\);

-- Location: IOIBUF_X31_Y73_N8
\regDataA[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(28),
	o => \regDataA[28]~input_o\);

-- Location: LCCOMB_X47_Y70_N24
\ALUResult[27]~150\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[27]~150_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[1]~27_combout\ & (\regDataA[26]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[28]~input_o\))))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[1]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataA[26]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[28]~input_o\,
	combout => \ALUResult[27]~150_combout\);

-- Location: LCCOMB_X47_Y70_N18
\ALUResult[27]~151\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[27]~151_combout\ = (\ALUResult[0]~17_combout\ & (((\ALUResult[27]~150_combout\)))) # (!\ALUResult[0]~17_combout\ & ((\regDataB[27]~input_o\ & ((\ALUResult[27]~150_combout\) # (!\regDataA[27]~input_o\))) # (!\regDataB[27]~input_o\ & 
-- (\regDataA[27]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111000010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataB[27]~input_o\,
	datac => \regDataA[27]~input_o\,
	datad => \ALUResult[27]~150_combout\,
	combout => \ALUResult[27]~151_combout\);

-- Location: LCCOMB_X47_Y70_N28
\ALUResult[27]~152\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[27]~152_combout\ = (\Op_ARS~input_o\ & (\regDataB[27]~input_o\ & (\regDataA[27]~input_o\))) # (!\Op_ARS~input_o\ & (((\ALUResult[27]~151_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101010110000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \regDataB[27]~input_o\,
	datac => \regDataA[27]~input_o\,
	datad => \ALUResult[27]~151_combout\,
	combout => \ALUResult[27]~152_combout\);

-- Location: LCCOMB_X48_Y71_N22
\Add0~54\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~54_combout\ = (\regDataA[27]~input_o\ & ((\regDataB[27]~input_o\ & (\Add0~53\ & VCC)) # (!\regDataB[27]~input_o\ & (!\Add0~53\)))) # (!\regDataA[27]~input_o\ & ((\regDataB[27]~input_o\ & (!\Add0~53\)) # (!\regDataB[27]~input_o\ & ((\Add0~53\) # 
-- (GND)))))
-- \Add0~55\ = CARRY((\regDataA[27]~input_o\ & (!\regDataB[27]~input_o\ & !\Add0~53\)) # (!\regDataA[27]~input_o\ & ((!\Add0~53\) # (!\regDataB[27]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[27]~input_o\,
	datab => \regDataB[27]~input_o\,
	datad => VCC,
	cin => \Add0~53\,
	combout => \Add0~54_combout\,
	cout => \Add0~55\);

-- Location: LCCOMB_X49_Y70_N2
\ALUResult[27]~153\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[27]~153_combout\ = (\Op_ADS~input_o\ & ((\Add0~54_combout\))) # (!\Op_ADS~input_o\ & (\ALUResult[27]~152_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[27]~152_combout\,
	datac => \Op_ADS~input_o\,
	datad => \Add0~54_combout\,
	combout => \ALUResult[27]~153_combout\);

-- Location: LCCOMB_X54_Y70_N24
\ALUResult[27]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(27) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[27]~153_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(27)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(27),
	datac => \ALUResult[27]~153_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(27));

-- Location: LCCOMB_X49_Y69_N20
\ALUResult[28]~156\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~156_combout\ = (!\Op_ARS~input_o\ & (!\Op_ADS~input_o\ & ((\regDataA[28]~input_o\) # (\ALUResult[0]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \regDataA[28]~input_o\,
	datac => \ALUResult[0]~17_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[28]~156_combout\);

-- Location: LCCOMB_X49_Y69_N22
\ALUResult[28]~157\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~157_combout\ = (!\Op_ADS~input_o\ & ((\Op_ARS~input_o\ & (!\regDataA[28]~input_o\)) # (!\Op_ARS~input_o\ & ((\ALUResult[0]~17_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \regDataA[28]~input_o\,
	datac => \ALUResult[0]~17_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[28]~157_combout\);

-- Location: IOIBUF_X83_Y73_N1
\regDataB[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(28),
	o => \regDataB[28]~input_o\);

-- Location: LCCOMB_X48_Y71_N24
\Add0~56\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~56_combout\ = ((\regDataB[28]~input_o\ $ (\regDataA[28]~input_o\ $ (!\Add0~55\)))) # (GND)
-- \Add0~57\ = CARRY((\regDataB[28]~input_o\ & ((\regDataA[28]~input_o\) # (!\Add0~55\))) # (!\regDataB[28]~input_o\ & (\regDataA[28]~input_o\ & !\Add0~55\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110001110",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataB[28]~input_o\,
	datab => \regDataA[28]~input_o\,
	datad => VCC,
	cin => \Add0~55\,
	combout => \Add0~56_combout\,
	cout => \Add0~57\);

-- Location: LCCOMB_X49_Y69_N24
\ALUResult[28]~154\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~154_combout\ = (\Op_ADS~input_o\ & ((\Add0~56_combout\))) # (!\Op_ADS~input_o\ & (\regDataB[28]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \regDataB[28]~input_o\,
	datac => \Add0~56_combout\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[28]~154_combout\);

-- Location: IOIBUF_X11_Y73_N1
\regDataA[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(29),
	o => \regDataA[29]~input_o\);

-- Location: LCCOMB_X49_Y69_N10
\ALUResult[28]~155\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~155_combout\ = (\ALUResult[0]~17_combout\ & ((\ALUResult[1]~27_combout\ & (\regDataA[27]~input_o\)) # (!\ALUResult[1]~27_combout\ & ((\regDataA[29]~input_o\))))) # (!\ALUResult[0]~17_combout\ & (((\ALUResult[1]~27_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101101011010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[0]~17_combout\,
	datab => \regDataA[27]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	datad => \regDataA[29]~input_o\,
	combout => \ALUResult[28]~155_combout\);

-- Location: LCCOMB_X49_Y69_N0
\ALUResult[28]~158\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[28]~158_combout\ = (\ALUResult[28]~156_combout\ & ((\ALUResult[28]~155_combout\) # ((!\ALUResult[28]~157_combout\ & !\ALUResult[28]~154_combout\)))) # (!\ALUResult[28]~156_combout\ & (!\ALUResult[28]~157_combout\ & 
-- (\ALUResult[28]~154_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101000010010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[28]~156_combout\,
	datab => \ALUResult[28]~157_combout\,
	datac => \ALUResult[28]~154_combout\,
	datad => \ALUResult[28]~155_combout\,
	combout => \ALUResult[28]~158_combout\);

-- Location: LCCOMB_X49_Y69_N18
\ALUResult[28]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(28) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[28]~158_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(28),
	datac => \ALUResult[28]~158_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(28));

-- Location: IOIBUF_X49_Y73_N15
\regDataB[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(29),
	o => \regDataB[29]~input_o\);

-- Location: LCCOMB_X48_Y71_N26
\Add0~58\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~58_combout\ = (\regDataA[29]~input_o\ & ((\regDataB[29]~input_o\ & (\Add0~57\ & VCC)) # (!\regDataB[29]~input_o\ & (!\Add0~57\)))) # (!\regDataA[29]~input_o\ & ((\regDataB[29]~input_o\ & (!\Add0~57\)) # (!\regDataB[29]~input_o\ & ((\Add0~57\) # 
-- (GND)))))
-- \Add0~59\ = CARRY((\regDataA[29]~input_o\ & (!\regDataB[29]~input_o\ & !\Add0~57\)) # (!\regDataA[29]~input_o\ & ((!\Add0~57\) # (!\regDataB[29]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000010111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[29]~input_o\,
	datab => \regDataB[29]~input_o\,
	datad => VCC,
	cin => \Add0~57\,
	combout => \Add0~58_combout\,
	cout => \Add0~59\);

-- Location: IOIBUF_X74_Y73_N15
\regDataA[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataA(30),
	o => \regDataA[30]~input_o\);

-- Location: LCCOMB_X49_Y69_N26
\ALUResult[29]~159\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[29]~159_combout\ = (\ALUResult[1]~27_combout\ & (((\regDataA[28]~input_o\) # (!\ALUResult[0]~17_combout\)))) # (!\ALUResult[1]~27_combout\ & (\regDataA[30]~input_o\ & ((\ALUResult[0]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[30]~input_o\,
	datab => \regDataA[28]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	datad => \ALUResult[0]~17_combout\,
	combout => \ALUResult[29]~159_combout\);

-- Location: LCCOMB_X49_Y69_N4
\ALUResult[29]~160\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[29]~160_combout\ = (\ALUResult[0]~17_combout\ & (\ALUResult[29]~159_combout\)) # (!\ALUResult[0]~17_combout\ & ((\regDataB[29]~input_o\ & ((\ALUResult[29]~159_combout\) # (!\regDataA[29]~input_o\))) # (!\regDataB[29]~input_o\ & 
-- ((\regDataA[29]~input_o\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101110101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[29]~159_combout\,
	datab => \regDataB[29]~input_o\,
	datac => \ALUResult[0]~17_combout\,
	datad => \regDataA[29]~input_o\,
	combout => \ALUResult[29]~160_combout\);

-- Location: LCCOMB_X49_Y69_N14
\ALUResult[29]~161\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[29]~161_combout\ = (\Op_ARS~input_o\ & (\regDataA[29]~input_o\ & (\regDataB[29]~input_o\))) # (!\Op_ARS~input_o\ & (((\ALUResult[29]~160_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[29]~input_o\,
	datab => \regDataB[29]~input_o\,
	datac => \ALUResult[29]~160_combout\,
	datad => \Op_ARS~input_o\,
	combout => \ALUResult[29]~161_combout\);

-- Location: LCCOMB_X49_Y70_N12
\ALUResult[29]~162\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[29]~162_combout\ = (\Op_ADS~input_o\ & (\Add0~58_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[29]~161_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011101110001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~58_combout\,
	datab => \Op_ADS~input_o\,
	datad => \ALUResult[29]~161_combout\,
	combout => \ALUResult[29]~162_combout\);

-- Location: LCCOMB_X50_Y70_N18
\ALUResult[29]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(29) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (\ALUResult[29]~162_combout\)) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((ALUResult(29))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ALUResult[29]~162_combout\,
	datac => \ALUResult[31]~23clkctrl_outclk\,
	datad => ALUResult(29),
	combout => ALUResult(29));

-- Location: LCCOMB_X49_Y69_N30
\ALUResult[30]~166\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~166_combout\ = (!\Op_ADS~input_o\ & ((\Op_ARS~input_o\ & ((!\regDataA[30]~input_o\))) # (!\Op_ARS~input_o\ & (\ALUResult[0]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataA[30]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[30]~166_combout\);

-- Location: LCCOMB_X49_Y69_N2
\ALUResult[30]~164\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~164_combout\ = (\ALUResult[1]~27_combout\ & ((\regDataA[29]~input_o\) # ((!\ALUResult[0]~17_combout\)))) # (!\ALUResult[1]~27_combout\ & (((\regDataA[31]~input_o\ & \ALUResult[0]~17_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[29]~input_o\,
	datab => \regDataA[31]~input_o\,
	datac => \ALUResult[1]~27_combout\,
	datad => \ALUResult[0]~17_combout\,
	combout => \ALUResult[30]~164_combout\);

-- Location: LCCOMB_X49_Y69_N28
\ALUResult[30]~165\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~165_combout\ = (!\Op_ARS~input_o\ & (!\Op_ADS~input_o\ & ((\ALUResult[0]~17_combout\) # (\regDataA[30]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ARS~input_o\,
	datab => \ALUResult[0]~17_combout\,
	datac => \regDataA[30]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[30]~165_combout\);

-- Location: IOIBUF_X11_Y73_N15
\regDataB[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(30),
	o => \regDataB[30]~input_o\);

-- Location: LCCOMB_X48_Y71_N28
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

-- Location: LCCOMB_X49_Y69_N8
\ALUResult[30]~163\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~163_combout\ = (\Op_ADS~input_o\ & (\Add0~60_combout\)) # (!\Op_ADS~input_o\ & ((\regDataB[30]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Add0~60_combout\,
	datac => \regDataB[30]~input_o\,
	datad => \Op_ADS~input_o\,
	combout => \ALUResult[30]~163_combout\);

-- Location: LCCOMB_X49_Y69_N16
\ALUResult[30]~167\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[30]~167_combout\ = (\ALUResult[30]~165_combout\ & ((\ALUResult[30]~164_combout\) # ((!\ALUResult[30]~166_combout\ & !\ALUResult[30]~163_combout\)))) # (!\ALUResult[30]~165_combout\ & (!\ALUResult[30]~166_combout\ & 
-- ((\ALUResult[30]~163_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100010111010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[30]~166_combout\,
	datab => \ALUResult[30]~164_combout\,
	datac => \ALUResult[30]~165_combout\,
	datad => \ALUResult[30]~163_combout\,
	combout => \ALUResult[30]~167_combout\);

-- Location: LCCOMB_X49_Y69_N12
\ALUResult[30]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(30) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[30]~167_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => ALUResult(30),
	datac => \ALUResult[30]~167_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(30));

-- Location: IOIBUF_X81_Y73_N1
\regDataB[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_regDataB(31),
	o => \regDataB[31]~input_o\);

-- Location: LCCOMB_X48_Y71_N30
\Add0~62\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~62_combout\ = \regDataA[31]~input_o\ $ (\Add0~61\ $ (\regDataB[31]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010101011010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \regDataA[31]~input_o\,
	datad => \regDataB[31]~input_o\,
	cin => \Add0~61\,
	combout => \Add0~62_combout\);

-- Location: LCCOMB_X52_Y72_N16
\ALUResult[31]~169\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~169_combout\ = (\Op_RR1~input_o\ & (!\Op_ORS~input_o\ & ((\regDataA[0]~input_o\)))) # (!\Op_RR1~input_o\ & (((\regDataA[31]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111010000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ORS~input_o\,
	datab => \Op_RR1~input_o\,
	datac => \regDataA[31]~input_o\,
	datad => \regDataA[0]~input_o\,
	combout => \ALUResult[31]~169_combout\);

-- Location: LCCOMB_X52_Y72_N12
\ALUResult[31]~170\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~170_combout\ = (!\Op_RS1~input_o\ & (\ALUResult[31]~169_combout\ & (!\Op_LR1~input_o\ & !\Op_LS1~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~input_o\,
	datab => \ALUResult[31]~169_combout\,
	datac => \Op_LR1~input_o\,
	datad => \Op_LS1~input_o\,
	combout => \ALUResult[31]~170_combout\);

-- Location: LCCOMB_X52_Y72_N20
\ALUResult[31]~168\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~168_combout\ = (\Op_ORS~input_o\ & (((\regDataA[31]~input_o\) # (\regDataB[31]~input_o\)))) # (!\Op_ORS~input_o\ & (\Op_XRS~input_o\ & (\regDataA[31]~input_o\ $ (\regDataB[31]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_XRS~input_o\,
	datab => \regDataA[31]~input_o\,
	datac => \Op_ORS~input_o\,
	datad => \regDataB[31]~input_o\,
	combout => \ALUResult[31]~168_combout\);

-- Location: LCCOMB_X52_Y72_N8
\ALUResult[31]~171\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~171_combout\ = (!\Op_ORS~input_o\ & (\regDataA[30]~input_o\ & ((\ALUResult[30]~26_combout\) # (\Op_LS1~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ORS~input_o\,
	datab => \ALUResult[30]~26_combout\,
	datac => \regDataA[30]~input_o\,
	datad => \Op_LS1~input_o\,
	combout => \ALUResult[31]~171_combout\);

-- Location: LCCOMB_X52_Y72_N10
\ALUResult[31]~172\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~172_combout\ = (\ALUResult[31]~168_combout\) # ((!\Op_XRS~input_o\ & ((\ALUResult[31]~170_combout\) # (\ALUResult[31]~171_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[31]~170_combout\,
	datab => \ALUResult[31]~168_combout\,
	datac => \ALUResult[31]~171_combout\,
	datad => \Op_XRS~input_o\,
	combout => \ALUResult[31]~172_combout\);

-- Location: LCCOMB_X52_Y72_N6
\ALUResult[31]~173\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~173_combout\ = (\Op_ARS~input_o\ & (((\regDataA[31]~input_o\ & \regDataB[31]~input_o\)))) # (!\Op_ARS~input_o\ & (\ALUResult[31]~172_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100101000001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ALUResult[31]~172_combout\,
	datab => \regDataA[31]~input_o\,
	datac => \Op_ARS~input_o\,
	datad => \regDataB[31]~input_o\,
	combout => \ALUResult[31]~173_combout\);

-- Location: LCCOMB_X47_Y71_N14
\ALUResult[31]~174\ : cycloneive_lcell_comb
-- Equation(s):
-- \ALUResult[31]~174_combout\ = (\Op_ADS~input_o\ & (\Add0~62_combout\)) # (!\Op_ADS~input_o\ & ((\ALUResult[31]~173_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_ADS~input_o\,
	datac => \Add0~62_combout\,
	datad => \ALUResult[31]~173_combout\,
	combout => \ALUResult[31]~174_combout\);

-- Location: LCCOMB_X47_Y71_N8
\ALUResult[31]\ : cycloneive_lcell_comb
-- Equation(s):
-- ALUResult(31) = (GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & ((\ALUResult[31]~174_combout\))) # (!GLOBAL(\ALUResult[31]~23clkctrl_outclk\) & (ALUResult(31)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => ALUResult(31),
	datac => \ALUResult[31]~174_combout\,
	datad => \ALUResult[31]~23clkctrl_outclk\,
	combout => ALUResult(31));

-- Location: IOIBUF_X0_Y36_N15
\Op_MUL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_Op_MUL,
	o => \Op_MUL~input_o\);

-- Location: IOIBUF_X0_Y36_N22
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
END structure;


