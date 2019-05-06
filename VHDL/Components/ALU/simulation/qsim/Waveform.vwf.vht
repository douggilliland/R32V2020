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
-- Generated on "05/06/2019 05:44:28"
                                                             
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
SIGNAL CondCodeBits : STD_LOGIC_VECTOR(31 DOWNTO 0);
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
	CondCodeBits : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
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
	CondCodeBits => CondCodeBits,
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
END ALU_arch;
