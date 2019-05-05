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
-- Generated on "05/05/2019 07:27:48"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          OpCode_Decoder
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY OpCode_Decoder_vhd_vec_tst IS
END OpCode_Decoder_vhd_vec_tst;
ARCHITECTURE OpCode_Decoder_arch OF OpCode_Decoder_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL InstrOpCode : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL Op_ADS : STD_LOGIC;
SIGNAL Op_ARS : STD_LOGIC;
SIGNAL Op_BCC : STD_LOGIC;
SIGNAL Op_BCS : STD_LOGIC;
SIGNAL Op_BEQ : STD_LOGIC;
SIGNAL Op_BOV : STD_LOGIC;
SIGNAL Op_BRA : STD_LOGIC;
SIGNAL Op_ENS : STD_LOGIC;
SIGNAL Op_HCF : STD_LOGIC;
SIGNAL Op_JSR : STD_LOGIC;
SIGNAL Op_LDB : STD_LOGIC;
SIGNAL Op_LDL : STD_LOGIC;
SIGNAL Op_LDS : STD_LOGIC;
SIGNAL Op_LIL : STD_LOGIC;
SIGNAL Op_LIU : STD_LOGIC;
SIGNAL Op_LPB : STD_LOGIC;
SIGNAL Op_LPL : STD_LOGIC;
SIGNAL Op_LPS : STD_LOGIC;
SIGNAL Op_LR1 : STD_LOGIC;
SIGNAL Op_LS1 : STD_LOGIC;
SIGNAL Op_MAO : STD_LOGIC;
SIGNAL Op_MUL : STD_LOGIC;
SIGNAL Op_NOP : STD_LOGIC;
SIGNAL Op_ORS : STD_LOGIC;
SIGNAL Op_RA1 : STD_LOGIC;
SIGNAL Op_RES : STD_LOGIC;
SIGNAL Op_RR1 : STD_LOGIC;
SIGNAL Op_RS1 : STD_LOGIC;
SIGNAL Op_RTS : STD_LOGIC;
SIGNAL Op_SDB : STD_LOGIC;
SIGNAL Op_SDL : STD_LOGIC;
SIGNAL Op_SDS : STD_LOGIC;
SIGNAL Op_SPB : STD_LOGIC;
SIGNAL Op_SPL : STD_LOGIC;
SIGNAL Op_SPS : STD_LOGIC;
SIGNAL Op_XRS : STD_LOGIC;
COMPONENT OpCode_Decoder
	PORT (
	InstrOpCode : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	Op_ADS : OUT STD_LOGIC;
	Op_ARS : OUT STD_LOGIC;
	Op_BCC : OUT STD_LOGIC;
	Op_BCS : OUT STD_LOGIC;
	Op_BEQ : OUT STD_LOGIC;
	Op_BOV : OUT STD_LOGIC;
	Op_BRA : OUT STD_LOGIC;
	Op_ENS : OUT STD_LOGIC;
	Op_HCF : OUT STD_LOGIC;
	Op_JSR : OUT STD_LOGIC;
	Op_LDB : OUT STD_LOGIC;
	Op_LDL : OUT STD_LOGIC;
	Op_LDS : OUT STD_LOGIC;
	Op_LIL : OUT STD_LOGIC;
	Op_LIU : OUT STD_LOGIC;
	Op_LPB : OUT STD_LOGIC;
	Op_LPL : OUT STD_LOGIC;
	Op_LPS : OUT STD_LOGIC;
	Op_LR1 : OUT STD_LOGIC;
	Op_LS1 : OUT STD_LOGIC;
	Op_MAO : OUT STD_LOGIC;
	Op_MUL : OUT STD_LOGIC;
	Op_NOP : OUT STD_LOGIC;
	Op_ORS : OUT STD_LOGIC;
	Op_RA1 : OUT STD_LOGIC;
	Op_RES : OUT STD_LOGIC;
	Op_RR1 : OUT STD_LOGIC;
	Op_RS1 : OUT STD_LOGIC;
	Op_RTS : OUT STD_LOGIC;
	Op_SDB : OUT STD_LOGIC;
	Op_SDL : OUT STD_LOGIC;
	Op_SDS : OUT STD_LOGIC;
	Op_SPB : OUT STD_LOGIC;
	Op_SPL : OUT STD_LOGIC;
	Op_SPS : OUT STD_LOGIC;
	Op_XRS : OUT STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : OpCode_Decoder
	PORT MAP (
-- list connections between master ports and signals
	InstrOpCode => InstrOpCode,
	Op_ADS => Op_ADS,
	Op_ARS => Op_ARS,
	Op_BCC => Op_BCC,
	Op_BCS => Op_BCS,
	Op_BEQ => Op_BEQ,
	Op_BOV => Op_BOV,
	Op_BRA => Op_BRA,
	Op_ENS => Op_ENS,
	Op_HCF => Op_HCF,
	Op_JSR => Op_JSR,
	Op_LDB => Op_LDB,
	Op_LDL => Op_LDL,
	Op_LDS => Op_LDS,
	Op_LIL => Op_LIL,
	Op_LIU => Op_LIU,
	Op_LPB => Op_LPB,
	Op_LPL => Op_LPL,
	Op_LPS => Op_LPS,
	Op_LR1 => Op_LR1,
	Op_LS1 => Op_LS1,
	Op_MAO => Op_MAO,
	Op_MUL => Op_MUL,
	Op_NOP => Op_NOP,
	Op_ORS => Op_ORS,
	Op_RA1 => Op_RA1,
	Op_RES => Op_RES,
	Op_RR1 => Op_RR1,
	Op_RS1 => Op_RS1,
	Op_RTS => Op_RTS,
	Op_SDB => Op_SDB,
	Op_SDL => Op_SDL,
	Op_SDS => Op_SDS,
	Op_SPB => Op_SPB,
	Op_SPL => Op_SPL,
	Op_SPS => Op_SPS,
	Op_XRS => Op_XRS
	);
-- InstrOpCode[7]
t_prcs_InstrOpCode_7: PROCESS
BEGIN
LOOP
	InstrOpCode(7) <= '0';
	WAIT FOR 1280000 ps;
	InstrOpCode(7) <= '1';
	WAIT FOR 1280000 ps;
	IF (NOW >= 2560000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_InstrOpCode_7;
-- InstrOpCode[6]
t_prcs_InstrOpCode_6: PROCESS
BEGIN
LOOP
	InstrOpCode(6) <= '0';
	WAIT FOR 640000 ps;
	InstrOpCode(6) <= '1';
	WAIT FOR 640000 ps;
	IF (NOW >= 2560000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_InstrOpCode_6;
-- InstrOpCode[5]
t_prcs_InstrOpCode_5: PROCESS
BEGIN
LOOP
	InstrOpCode(5) <= '0';
	WAIT FOR 320000 ps;
	InstrOpCode(5) <= '1';
	WAIT FOR 320000 ps;
	IF (NOW >= 2560000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_InstrOpCode_5;
-- InstrOpCode[4]
t_prcs_InstrOpCode_4: PROCESS
BEGIN
LOOP
	InstrOpCode(4) <= '0';
	WAIT FOR 160000 ps;
	InstrOpCode(4) <= '1';
	WAIT FOR 160000 ps;
	IF (NOW >= 2560000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_InstrOpCode_4;
-- InstrOpCode[3]
t_prcs_InstrOpCode_3: PROCESS
BEGIN
LOOP
	InstrOpCode(3) <= '0';
	WAIT FOR 80000 ps;
	InstrOpCode(3) <= '1';
	WAIT FOR 80000 ps;
	IF (NOW >= 2560000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_InstrOpCode_3;
-- InstrOpCode[2]
t_prcs_InstrOpCode_2: PROCESS
BEGIN
LOOP
	InstrOpCode(2) <= '0';
	WAIT FOR 40000 ps;
	InstrOpCode(2) <= '1';
	WAIT FOR 40000 ps;
	IF (NOW >= 2560000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_InstrOpCode_2;
-- InstrOpCode[1]
t_prcs_InstrOpCode_1: PROCESS
BEGIN
LOOP
	InstrOpCode(1) <= '0';
	WAIT FOR 20000 ps;
	InstrOpCode(1) <= '1';
	WAIT FOR 20000 ps;
	IF (NOW >= 2560000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_InstrOpCode_1;
-- InstrOpCode[0]
t_prcs_InstrOpCode_0: PROCESS
BEGIN
LOOP
	InstrOpCode(0) <= '0';
	WAIT FOR 10000 ps;
	InstrOpCode(0) <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 2560000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_InstrOpCode_0;
END OpCode_Decoder_arch;
