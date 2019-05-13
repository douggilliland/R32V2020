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

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/10/2019 13:20:20"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          ALU
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY ALU_vhd_vec_tst IS
END ALU_vhd_vec_tst;
ARCHITECTURE ALU_arch OF ALU_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL i_Op_ADS : STD_LOGIC;
SIGNAL i_Op_ARS : STD_LOGIC;
SIGNAL i_Op_CMP : STD_LOGIC;
SIGNAL i_Op_LR1 : STD_LOGIC;
SIGNAL i_Op_LS1 : STD_LOGIC;
SIGNAL i_Op_MUL : STD_LOGIC;
SIGNAL i_Op_ORS : STD_LOGIC;
SIGNAL i_Op_RA1 : STD_LOGIC;
SIGNAL i_Op_RR1 : STD_LOGIC;
SIGNAL i_Op_RS1 : STD_LOGIC;
SIGNAL i_Op_XRS : STD_LOGIC;
SIGNAL i_regDataA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL i_regDataB : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL o_ALUDataOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL o_CondCodeBits : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT ALU
	PORT (
	i_Op_ADS : IN STD_LOGIC;
	i_Op_ARS : IN STD_LOGIC;
	i_Op_CMP : IN STD_LOGIC;
	i_Op_LR1 : IN STD_LOGIC;
	i_Op_LS1 : IN STD_LOGIC;
	i_Op_MUL : IN STD_LOGIC;
	i_Op_ORS : IN STD_LOGIC;
	i_Op_RA1 : IN STD_LOGIC;
	i_Op_RR1 : IN STD_LOGIC;
	i_Op_RS1 : IN STD_LOGIC;
	i_Op_XRS : IN STD_LOGIC;
	i_regDataA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	i_regDataB : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	o_ALUDataOut : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0);
	o_CondCodeBits : BUFFER STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ALU
	PORT MAP (
-- list connections between master ports and signals
	i_Op_ADS => i_Op_ADS,
	i_Op_ARS => i_Op_ARS,
	i_Op_CMP => i_Op_CMP,
	i_Op_LR1 => i_Op_LR1,
	i_Op_LS1 => i_Op_LS1,
	i_Op_MUL => i_Op_MUL,
	i_Op_ORS => i_Op_ORS,
	i_Op_RA1 => i_Op_RA1,
	i_Op_RR1 => i_Op_RR1,
	i_Op_RS1 => i_Op_RS1,
	i_Op_XRS => i_Op_XRS,
	i_regDataA => i_regDataA,
	i_regDataB => i_regDataB,
	o_ALUDataOut => o_ALUDataOut,
	o_CondCodeBits => o_CondCodeBits
	);

-- i_Op_ADS
t_prcs_i_Op_ADS: PROCESS
BEGIN
	i_Op_ADS <= '0';
WAIT;
END PROCESS t_prcs_i_Op_ADS;

-- i_Op_ARS
t_prcs_i_Op_ARS: PROCESS
BEGIN
	i_Op_ARS <= '0';
WAIT;
END PROCESS t_prcs_i_Op_ARS;

-- i_Op_CMP
t_prcs_i_Op_CMP: PROCESS
BEGIN
	i_Op_CMP <= '0';
WAIT;
END PROCESS t_prcs_i_Op_CMP;

-- i_Op_LR1
t_prcs_i_Op_LR1: PROCESS
BEGIN
	i_Op_LR1 <= '0';
WAIT;
END PROCESS t_prcs_i_Op_LR1;

-- i_Op_LS1
t_prcs_i_Op_LS1: PROCESS
BEGIN
	i_Op_LS1 <= '0';
WAIT;
END PROCESS t_prcs_i_Op_LS1;

-- i_Op_MUL
t_prcs_i_Op_MUL: PROCESS
BEGIN
	i_Op_MUL <= '0';
WAIT;
END PROCESS t_prcs_i_Op_MUL;

-- i_Op_ORS
t_prcs_i_Op_ORS: PROCESS
BEGIN
	i_Op_ORS <= '0';
WAIT;
END PROCESS t_prcs_i_Op_ORS;

-- i_Op_RA1
t_prcs_i_Op_RA1: PROCESS
BEGIN
	i_Op_RA1 <= '0';
WAIT;
END PROCESS t_prcs_i_Op_RA1;

-- i_Op_RR1
t_prcs_i_Op_RR1: PROCESS
BEGIN
	i_Op_RR1 <= '0';
WAIT;
END PROCESS t_prcs_i_Op_RR1;

-- i_Op_RS1
t_prcs_i_Op_RS1: PROCESS
BEGIN
	i_Op_RS1 <= '0';
WAIT;
END PROCESS t_prcs_i_Op_RS1;

-- i_Op_XRS
t_prcs_i_Op_XRS: PROCESS
BEGIN
	i_Op_XRS <= '0';
	WAIT FOR 20000 ps;
	i_Op_XRS <= '1';
	WAIT FOR 20000 ps;
	i_Op_XRS <= '0';
WAIT;
END PROCESS t_prcs_i_Op_XRS;
-- i_regDataA[31]
t_prcs_i_regDataA_31: PROCESS
BEGIN
	i_regDataA(31) <= '0';
	WAIT FOR 10000 ps;
	i_regDataA(31) <= '1';
	WAIT FOR 40000 ps;
	i_regDataA(31) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_31;
-- i_regDataA[30]
t_prcs_i_regDataA_30: PROCESS
BEGIN
	i_regDataA(30) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_30;
-- i_regDataA[29]
t_prcs_i_regDataA_29: PROCESS
BEGIN
	i_regDataA(29) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_29;
-- i_regDataA[28]
t_prcs_i_regDataA_28: PROCESS
BEGIN
	i_regDataA(28) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_28;
-- i_regDataA[27]
t_prcs_i_regDataA_27: PROCESS
BEGIN
	i_regDataA(27) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_27;
-- i_regDataA[26]
t_prcs_i_regDataA_26: PROCESS
BEGIN
	i_regDataA(26) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_26;
-- i_regDataA[25]
t_prcs_i_regDataA_25: PROCESS
BEGIN
	i_regDataA(25) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_25;
-- i_regDataA[24]
t_prcs_i_regDataA_24: PROCESS
BEGIN
	i_regDataA(24) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_24;
-- i_regDataA[23]
t_prcs_i_regDataA_23: PROCESS
BEGIN
	i_regDataA(23) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_23;
-- i_regDataA[22]
t_prcs_i_regDataA_22: PROCESS
BEGIN
	i_regDataA(22) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_22;
-- i_regDataA[21]
t_prcs_i_regDataA_21: PROCESS
BEGIN
	i_regDataA(21) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_21;
-- i_regDataA[20]
t_prcs_i_regDataA_20: PROCESS
BEGIN
	i_regDataA(20) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_20;
-- i_regDataA[19]
t_prcs_i_regDataA_19: PROCESS
BEGIN
	i_regDataA(19) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_19;
-- i_regDataA[18]
t_prcs_i_regDataA_18: PROCESS
BEGIN
	i_regDataA(18) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_18;
-- i_regDataA[17]
t_prcs_i_regDataA_17: PROCESS
BEGIN
	i_regDataA(17) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_17;
-- i_regDataA[16]
t_prcs_i_regDataA_16: PROCESS
BEGIN
	i_regDataA(16) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_16;
-- i_regDataA[15]
t_prcs_i_regDataA_15: PROCESS
BEGIN
	i_regDataA(15) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_15;
-- i_regDataA[14]
t_prcs_i_regDataA_14: PROCESS
BEGIN
	i_regDataA(14) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_14;
-- i_regDataA[13]
t_prcs_i_regDataA_13: PROCESS
BEGIN
	i_regDataA(13) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_13;
-- i_regDataA[12]
t_prcs_i_regDataA_12: PROCESS
BEGIN
	i_regDataA(12) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_12;
-- i_regDataA[11]
t_prcs_i_regDataA_11: PROCESS
BEGIN
	i_regDataA(11) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_11;
-- i_regDataA[10]
t_prcs_i_regDataA_10: PROCESS
BEGIN
	i_regDataA(10) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_10;
-- i_regDataA[9]
t_prcs_i_regDataA_9: PROCESS
BEGIN
	i_regDataA(9) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_9;
-- i_regDataA[8]
t_prcs_i_regDataA_8: PROCESS
BEGIN
	i_regDataA(8) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_8;
-- i_regDataA[7]
t_prcs_i_regDataA_7: PROCESS
BEGIN
	i_regDataA(7) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_7;
-- i_regDataA[6]
t_prcs_i_regDataA_6: PROCESS
BEGIN
	i_regDataA(6) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_6;
-- i_regDataA[5]
t_prcs_i_regDataA_5: PROCESS
BEGIN
	i_regDataA(5) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_5;
-- i_regDataA[4]
t_prcs_i_regDataA_4: PROCESS
BEGIN
	i_regDataA(4) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_4;
-- i_regDataA[3]
t_prcs_i_regDataA_3: PROCESS
BEGIN
	i_regDataA(3) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_3;
-- i_regDataA[2]
t_prcs_i_regDataA_2: PROCESS
BEGIN
	i_regDataA(2) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_2;
-- i_regDataA[1]
t_prcs_i_regDataA_1: PROCESS
BEGIN
	i_regDataA(1) <= '0';
	WAIT FOR 10000 ps;
	i_regDataA(1) <= '1';
	WAIT FOR 40000 ps;
	i_regDataA(1) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_1;
-- i_regDataA[0]
t_prcs_i_regDataA_0: PROCESS
BEGIN
	i_regDataA(0) <= '0';
	WAIT FOR 10000 ps;
	i_regDataA(0) <= '1';
	WAIT FOR 40000 ps;
	i_regDataA(0) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataA_0;
-- i_regDataB[31]
t_prcs_i_regDataB_31: PROCESS
BEGIN
	i_regDataB(31) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(31) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(31) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_31;
-- i_regDataB[30]
t_prcs_i_regDataB_30: PROCESS
BEGIN
	i_regDataB(30) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(30) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(30) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_30;
-- i_regDataB[29]
t_prcs_i_regDataB_29: PROCESS
BEGIN
	i_regDataB(29) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(29) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(29) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_29;
-- i_regDataB[28]
t_prcs_i_regDataB_28: PROCESS
BEGIN
	i_regDataB(28) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(28) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(28) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_28;
-- i_regDataB[27]
t_prcs_i_regDataB_27: PROCESS
BEGIN
	i_regDataB(27) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(27) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(27) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_27;
-- i_regDataB[26]
t_prcs_i_regDataB_26: PROCESS
BEGIN
	i_regDataB(26) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(26) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(26) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_26;
-- i_regDataB[25]
t_prcs_i_regDataB_25: PROCESS
BEGIN
	i_regDataB(25) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(25) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(25) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_25;
-- i_regDataB[24]
t_prcs_i_regDataB_24: PROCESS
BEGIN
	i_regDataB(24) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(24) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(24) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_24;
-- i_regDataB[23]
t_prcs_i_regDataB_23: PROCESS
BEGIN
	i_regDataB(23) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(23) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(23) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_23;
-- i_regDataB[22]
t_prcs_i_regDataB_22: PROCESS
BEGIN
	i_regDataB(22) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(22) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(22) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_22;
-- i_regDataB[21]
t_prcs_i_regDataB_21: PROCESS
BEGIN
	i_regDataB(21) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(21) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(21) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_21;
-- i_regDataB[20]
t_prcs_i_regDataB_20: PROCESS
BEGIN
	i_regDataB(20) <= '0';
	WAIT FOR 10000 ps;
	i_regDataB(20) <= '1';
	WAIT FOR 40000 ps;
	i_regDataB(20) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_20;
-- i_regDataB[19]
t_prcs_i_regDataB_19: PROCESS
BEGIN
	i_regDataB(19) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_19;
-- i_regDataB[18]
t_prcs_i_regDataB_18: PROCESS
BEGIN
	i_regDataB(18) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_18;
-- i_regDataB[17]
t_prcs_i_regDataB_17: PROCESS
BEGIN
	i_regDataB(17) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_17;
-- i_regDataB[16]
t_prcs_i_regDataB_16: PROCESS
BEGIN
	i_regDataB(16) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_16;
-- i_regDataB[15]
t_prcs_i_regDataB_15: PROCESS
BEGIN
	i_regDataB(15) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_15;
-- i_regDataB[14]
t_prcs_i_regDataB_14: PROCESS
BEGIN
	i_regDataB(14) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_14;
-- i_regDataB[13]
t_prcs_i_regDataB_13: PROCESS
BEGIN
	i_regDataB(13) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_13;
-- i_regDataB[12]
t_prcs_i_regDataB_12: PROCESS
BEGIN
	i_regDataB(12) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_12;
-- i_regDataB[11]
t_prcs_i_regDataB_11: PROCESS
BEGIN
	i_regDataB(11) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_11;
-- i_regDataB[10]
t_prcs_i_regDataB_10: PROCESS
BEGIN
	i_regDataB(10) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_10;
-- i_regDataB[9]
t_prcs_i_regDataB_9: PROCESS
BEGIN
	i_regDataB(9) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_9;
-- i_regDataB[8]
t_prcs_i_regDataB_8: PROCESS
BEGIN
	i_regDataB(8) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_8;
-- i_regDataB[7]
t_prcs_i_regDataB_7: PROCESS
BEGIN
	i_regDataB(7) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_7;
-- i_regDataB[6]
t_prcs_i_regDataB_6: PROCESS
BEGIN
	i_regDataB(6) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_6;
-- i_regDataB[5]
t_prcs_i_regDataB_5: PROCESS
BEGIN
	i_regDataB(5) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_5;
-- i_regDataB[4]
t_prcs_i_regDataB_4: PROCESS
BEGIN
	i_regDataB(4) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_4;
-- i_regDataB[3]
t_prcs_i_regDataB_3: PROCESS
BEGIN
	i_regDataB(3) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_3;
-- i_regDataB[2]
t_prcs_i_regDataB_2: PROCESS
BEGIN
	i_regDataB(2) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_2;
-- i_regDataB[1]
t_prcs_i_regDataB_1: PROCESS
BEGIN
	i_regDataB(1) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_1;
-- i_regDataB[0]
t_prcs_i_regDataB_0: PROCESS
BEGIN
	i_regDataB(0) <= '0';
WAIT;
END PROCESS t_prcs_i_regDataB_0;
END ALU_arch;
