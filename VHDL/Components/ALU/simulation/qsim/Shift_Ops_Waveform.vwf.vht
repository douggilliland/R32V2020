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
-- Generated on "05/06/2019 06:45:09"
                                                             
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
SIGNAL ALUDataOut : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL Op_ADS : STD_LOGIC;
SIGNAL Op_ARS : STD_LOGIC;
SIGNAL Op_CMP : STD_LOGIC;
SIGNAL Op_LR1 : STD_LOGIC;
SIGNAL Op_LS1 : STD_LOGIC;
SIGNAL Op_MUL : STD_LOGIC;
SIGNAL Op_ORS : STD_LOGIC;
SIGNAL Op_RA1 : STD_LOGIC;
SIGNAL Op_RR1 : STD_LOGIC;
SIGNAL Op_RS1 : STD_LOGIC;
SIGNAL Op_XRS : STD_LOGIC;
SIGNAL regDataA : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL regDataB : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT ALU
	PORT (
	ALUDataOut : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
	Op_ADS : IN STD_LOGIC;
	Op_ARS : IN STD_LOGIC;
	Op_CMP : IN STD_LOGIC;
	Op_LR1 : IN STD_LOGIC;
	Op_LS1 : IN STD_LOGIC;
	Op_MUL : IN STD_LOGIC;
	Op_ORS : IN STD_LOGIC;
	Op_RA1 : IN STD_LOGIC;
	Op_RR1 : IN STD_LOGIC;
	Op_RS1 : IN STD_LOGIC;
	Op_XRS : IN STD_LOGIC;
	regDataA : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	regDataB : IN STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : ALU
	PORT MAP (
-- list connections between master ports and signals
	ALUDataOut => ALUDataOut,
	Op_ADS => Op_ADS,
	Op_ARS => Op_ARS,
	Op_CMP => Op_CMP,
	Op_LR1 => Op_LR1,
	Op_LS1 => Op_LS1,
	Op_MUL => Op_MUL,
	Op_ORS => Op_ORS,
	Op_RA1 => Op_RA1,
	Op_RR1 => Op_RR1,
	Op_RS1 => Op_RS1,
	Op_XRS => Op_XRS,
	regDataA => regDataA,
	regDataB => regDataB
	);

-- Op_LR1
t_prcs_Op_LR1: PROCESS
BEGIN
	Op_LR1 <= '0';
	WAIT FOR 10000 ps;
	Op_LR1 <= '1';
	WAIT FOR 30000 ps;
	Op_LR1 <= '0';
WAIT;
END PROCESS t_prcs_Op_LR1;

-- Op_ADS
t_prcs_Op_ADS: PROCESS
BEGIN
	Op_ADS <= '0';
WAIT;
END PROCESS t_prcs_Op_ADS;

-- Op_ARS
t_prcs_Op_ARS: PROCESS
BEGIN
	Op_ARS <= '0';
WAIT;
END PROCESS t_prcs_Op_ARS;

-- Op_CMP
t_prcs_Op_CMP: PROCESS
BEGIN
	Op_CMP <= '0';
WAIT;
END PROCESS t_prcs_Op_CMP;

-- Op_LS1
t_prcs_Op_LS1: PROCESS
BEGIN
	Op_LS1 <= '0';
WAIT;
END PROCESS t_prcs_Op_LS1;

-- Op_MUL
t_prcs_Op_MUL: PROCESS
BEGIN
	Op_MUL <= '0';
WAIT;
END PROCESS t_prcs_Op_MUL;

-- Op_ORS
t_prcs_Op_ORS: PROCESS
BEGIN
	Op_ORS <= '0';
WAIT;
END PROCESS t_prcs_Op_ORS;

-- Op_RA1
t_prcs_Op_RA1: PROCESS
BEGIN
	Op_RA1 <= '0';
WAIT;
END PROCESS t_prcs_Op_RA1;

-- Op_RR1
t_prcs_Op_RR1: PROCESS
BEGIN
	Op_RR1 <= '0';
WAIT;
END PROCESS t_prcs_Op_RR1;

-- Op_RS1
t_prcs_Op_RS1: PROCESS
BEGIN
	Op_RS1 <= '0';
WAIT;
END PROCESS t_prcs_Op_RS1;

-- Op_XRS
t_prcs_Op_XRS: PROCESS
BEGIN
	Op_XRS <= '0';
WAIT;
END PROCESS t_prcs_Op_XRS;
-- regDataA[31]
t_prcs_regDataA_31: PROCESS
BEGIN
	regDataA(31) <= '1';
WAIT;
END PROCESS t_prcs_regDataA_31;
-- regDataA[30]
t_prcs_regDataA_30: PROCESS
BEGIN
	regDataA(30) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_30;
-- regDataA[29]
t_prcs_regDataA_29: PROCESS
BEGIN
	regDataA(29) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_29;
-- regDataA[28]
t_prcs_regDataA_28: PROCESS
BEGIN
	regDataA(28) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_28;
-- regDataA[27]
t_prcs_regDataA_27: PROCESS
BEGIN
	regDataA(27) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_27;
-- regDataA[26]
t_prcs_regDataA_26: PROCESS
BEGIN
	regDataA(26) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_26;
-- regDataA[25]
t_prcs_regDataA_25: PROCESS
BEGIN
	regDataA(25) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_25;
-- regDataA[24]
t_prcs_regDataA_24: PROCESS
BEGIN
	regDataA(24) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_24;
-- regDataA[23]
t_prcs_regDataA_23: PROCESS
BEGIN
	regDataA(23) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_23;
-- regDataA[22]
t_prcs_regDataA_22: PROCESS
BEGIN
	regDataA(22) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_22;
-- regDataA[21]
t_prcs_regDataA_21: PROCESS
BEGIN
	regDataA(21) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_21;
-- regDataA[20]
t_prcs_regDataA_20: PROCESS
BEGIN
	regDataA(20) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_20;
-- regDataA[19]
t_prcs_regDataA_19: PROCESS
BEGIN
	regDataA(19) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_19;
-- regDataA[18]
t_prcs_regDataA_18: PROCESS
BEGIN
	regDataA(18) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_18;
-- regDataA[17]
t_prcs_regDataA_17: PROCESS
BEGIN
	regDataA(17) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_17;
-- regDataA[16]
t_prcs_regDataA_16: PROCESS
BEGIN
	regDataA(16) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_16;
-- regDataA[15]
t_prcs_regDataA_15: PROCESS
BEGIN
	regDataA(15) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_15;
-- regDataA[14]
t_prcs_regDataA_14: PROCESS
BEGIN
	regDataA(14) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_14;
-- regDataA[13]
t_prcs_regDataA_13: PROCESS
BEGIN
	regDataA(13) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_13;
-- regDataA[12]
t_prcs_regDataA_12: PROCESS
BEGIN
	regDataA(12) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_12;
-- regDataA[11]
t_prcs_regDataA_11: PROCESS
BEGIN
	regDataA(11) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_11;
-- regDataA[10]
t_prcs_regDataA_10: PROCESS
BEGIN
	regDataA(10) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_10;
-- regDataA[9]
t_prcs_regDataA_9: PROCESS
BEGIN
	regDataA(9) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_9;
-- regDataA[8]
t_prcs_regDataA_8: PROCESS
BEGIN
	regDataA(8) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_8;
-- regDataA[7]
t_prcs_regDataA_7: PROCESS
BEGIN
	regDataA(7) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_7;
-- regDataA[6]
t_prcs_regDataA_6: PROCESS
BEGIN
	regDataA(6) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_6;
-- regDataA[5]
t_prcs_regDataA_5: PROCESS
BEGIN
	regDataA(5) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_5;
-- regDataA[4]
t_prcs_regDataA_4: PROCESS
BEGIN
	regDataA(4) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_4;
-- regDataA[3]
t_prcs_regDataA_3: PROCESS
BEGIN
	regDataA(3) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_3;
-- regDataA[2]
t_prcs_regDataA_2: PROCESS
BEGIN
	regDataA(2) <= '1';
WAIT;
END PROCESS t_prcs_regDataA_2;
-- regDataA[1]
t_prcs_regDataA_1: PROCESS
BEGIN
	regDataA(1) <= '0';
WAIT;
END PROCESS t_prcs_regDataA_1;
-- regDataA[0]
t_prcs_regDataA_0: PROCESS
BEGIN
	regDataA(0) <= '1';
WAIT;
END PROCESS t_prcs_regDataA_0;
-- regDataB[31]
t_prcs_regDataB_31: PROCESS
BEGIN
	regDataB(31) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_31;
-- regDataB[30]
t_prcs_regDataB_30: PROCESS
BEGIN
	regDataB(30) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_30;
-- regDataB[29]
t_prcs_regDataB_29: PROCESS
BEGIN
	regDataB(29) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_29;
-- regDataB[28]
t_prcs_regDataB_28: PROCESS
BEGIN
	regDataB(28) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_28;
-- regDataB[27]
t_prcs_regDataB_27: PROCESS
BEGIN
	regDataB(27) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_27;
-- regDataB[26]
t_prcs_regDataB_26: PROCESS
BEGIN
	regDataB(26) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_26;
-- regDataB[25]
t_prcs_regDataB_25: PROCESS
BEGIN
	regDataB(25) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_25;
-- regDataB[24]
t_prcs_regDataB_24: PROCESS
BEGIN
	regDataB(24) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_24;
-- regDataB[23]
t_prcs_regDataB_23: PROCESS
BEGIN
	regDataB(23) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_23;
-- regDataB[22]
t_prcs_regDataB_22: PROCESS
BEGIN
	regDataB(22) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_22;
-- regDataB[21]
t_prcs_regDataB_21: PROCESS
BEGIN
	regDataB(21) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_21;
-- regDataB[20]
t_prcs_regDataB_20: PROCESS
BEGIN
	regDataB(20) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_20;
-- regDataB[19]
t_prcs_regDataB_19: PROCESS
BEGIN
	regDataB(19) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_19;
-- regDataB[18]
t_prcs_regDataB_18: PROCESS
BEGIN
	regDataB(18) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_18;
-- regDataB[17]
t_prcs_regDataB_17: PROCESS
BEGIN
	regDataB(17) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_17;
-- regDataB[16]
t_prcs_regDataB_16: PROCESS
BEGIN
	regDataB(16) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_16;
-- regDataB[15]
t_prcs_regDataB_15: PROCESS
BEGIN
	regDataB(15) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_15;
-- regDataB[14]
t_prcs_regDataB_14: PROCESS
BEGIN
	regDataB(14) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_14;
-- regDataB[13]
t_prcs_regDataB_13: PROCESS
BEGIN
	regDataB(13) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_13;
-- regDataB[12]
t_prcs_regDataB_12: PROCESS
BEGIN
	regDataB(12) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_12;
-- regDataB[11]
t_prcs_regDataB_11: PROCESS
BEGIN
	regDataB(11) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_11;
-- regDataB[10]
t_prcs_regDataB_10: PROCESS
BEGIN
	regDataB(10) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_10;
-- regDataB[9]
t_prcs_regDataB_9: PROCESS
BEGIN
	regDataB(9) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_9;
-- regDataB[8]
t_prcs_regDataB_8: PROCESS
BEGIN
	regDataB(8) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_8;
-- regDataB[7]
t_prcs_regDataB_7: PROCESS
BEGIN
	regDataB(7) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_7;
-- regDataB[6]
t_prcs_regDataB_6: PROCESS
BEGIN
	regDataB(6) <= '1';
WAIT;
END PROCESS t_prcs_regDataB_6;
-- regDataB[5]
t_prcs_regDataB_5: PROCESS
BEGIN
	regDataB(5) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_5;
-- regDataB[4]
t_prcs_regDataB_4: PROCESS
BEGIN
	regDataB(4) <= '1';
WAIT;
END PROCESS t_prcs_regDataB_4;
-- regDataB[3]
t_prcs_regDataB_3: PROCESS
BEGIN
	regDataB(3) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_3;
-- regDataB[2]
t_prcs_regDataB_2: PROCESS
BEGIN
	regDataB(2) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_2;
-- regDataB[1]
t_prcs_regDataB_1: PROCESS
BEGIN
	regDataB(1) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_1;
-- regDataB[0]
t_prcs_regDataB_0: PROCESS
BEGIN
	regDataB(0) <= '0';
WAIT;
END PROCESS t_prcs_regDataB_0;
END ALU_arch;
