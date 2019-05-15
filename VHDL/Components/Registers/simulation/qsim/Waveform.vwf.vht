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
-- Generated on "05/15/2019 16:44:36"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          REG_32_LD_At_Reset
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY REG_32_LD_At_Reset_vhd_vec_tst IS
END REG_32_LD_At_Reset_vhd_vec_tst;
ARCHITECTURE REG_32_LD_At_Reset_arch OF REG_32_LD_At_Reset_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL clr : STD_LOGIC;
SIGNAL d : STD_LOGIC_VECTOR(31 DOWNTO 0);
SIGNAL ld : STD_LOGIC;
SIGNAL q : STD_LOGIC_VECTOR(31 DOWNTO 0);
COMPONENT REG_32_LD_At_Reset
	PORT (
	clk : IN STD_LOGIC;
	clr : IN STD_LOGIC;
	d : IN STD_LOGIC_VECTOR(31 DOWNTO 0);
	ld : IN STD_LOGIC;
	q : OUT STD_LOGIC_VECTOR(31 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : REG_32_LD_At_Reset
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	clr => clr,
	d => d,
	ld => ld,
	q => q
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 100000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_clk;

-- clr
t_prcs_clr: PROCESS
BEGIN
	clr <= '1';
	WAIT FOR 20000 ps;
	clr <= '0';
WAIT;
END PROCESS t_prcs_clr;
-- d[31]
t_prcs_d_31: PROCESS
BEGIN
	d(31) <= '0';
WAIT;
END PROCESS t_prcs_d_31;
-- d[30]
t_prcs_d_30: PROCESS
BEGIN
	d(30) <= '0';
WAIT;
END PROCESS t_prcs_d_30;
-- d[29]
t_prcs_d_29: PROCESS
BEGIN
	d(29) <= '0';
WAIT;
END PROCESS t_prcs_d_29;
-- d[28]
t_prcs_d_28: PROCESS
BEGIN
	d(28) <= '0';
	WAIT FOR 40000 ps;
	d(28) <= '1';
	WAIT FOR 20000 ps;
	d(28) <= '0';
WAIT;
END PROCESS t_prcs_d_28;
-- d[27]
t_prcs_d_27: PROCESS
BEGIN
	d(27) <= '0';
WAIT;
END PROCESS t_prcs_d_27;
-- d[26]
t_prcs_d_26: PROCESS
BEGIN
	d(26) <= '0';
WAIT;
END PROCESS t_prcs_d_26;
-- d[25]
t_prcs_d_25: PROCESS
BEGIN
	d(25) <= '0';
	WAIT FOR 40000 ps;
	d(25) <= '1';
	WAIT FOR 20000 ps;
	d(25) <= '0';
WAIT;
END PROCESS t_prcs_d_25;
-- d[24]
t_prcs_d_24: PROCESS
BEGIN
	d(24) <= '0';
WAIT;
END PROCESS t_prcs_d_24;
-- d[23]
t_prcs_d_23: PROCESS
BEGIN
	d(23) <= '0';
WAIT;
END PROCESS t_prcs_d_23;
-- d[22]
t_prcs_d_22: PROCESS
BEGIN
	d(22) <= '0';
WAIT;
END PROCESS t_prcs_d_22;
-- d[21]
t_prcs_d_21: PROCESS
BEGIN
	d(21) <= '0';
	WAIT FOR 40000 ps;
	d(21) <= '1';
	WAIT FOR 20000 ps;
	d(21) <= '0';
WAIT;
END PROCESS t_prcs_d_21;
-- d[20]
t_prcs_d_20: PROCESS
BEGIN
	d(20) <= '0';
	WAIT FOR 40000 ps;
	d(20) <= '1';
	WAIT FOR 20000 ps;
	d(20) <= '0';
WAIT;
END PROCESS t_prcs_d_20;
-- d[19]
t_prcs_d_19: PROCESS
BEGIN
	d(19) <= '0';
WAIT;
END PROCESS t_prcs_d_19;
-- d[18]
t_prcs_d_18: PROCESS
BEGIN
	d(18) <= '0';
	WAIT FOR 40000 ps;
	d(18) <= '1';
	WAIT FOR 20000 ps;
	d(18) <= '0';
WAIT;
END PROCESS t_prcs_d_18;
-- d[17]
t_prcs_d_17: PROCESS
BEGIN
	d(17) <= '0';
WAIT;
END PROCESS t_prcs_d_17;
-- d[16]
t_prcs_d_16: PROCESS
BEGIN
	d(16) <= '0';
WAIT;
END PROCESS t_prcs_d_16;
-- d[15]
t_prcs_d_15: PROCESS
BEGIN
	d(15) <= '0';
WAIT;
END PROCESS t_prcs_d_15;
-- d[14]
t_prcs_d_14: PROCESS
BEGIN
	d(14) <= '0';
	WAIT FOR 40000 ps;
	d(14) <= '1';
	WAIT FOR 20000 ps;
	d(14) <= '0';
WAIT;
END PROCESS t_prcs_d_14;
-- d[13]
t_prcs_d_13: PROCESS
BEGIN
	d(13) <= '0';
WAIT;
END PROCESS t_prcs_d_13;
-- d[12]
t_prcs_d_12: PROCESS
BEGIN
	d(12) <= '0';
	WAIT FOR 40000 ps;
	d(12) <= '1';
	WAIT FOR 20000 ps;
	d(12) <= '0';
WAIT;
END PROCESS t_prcs_d_12;
-- d[11]
t_prcs_d_11: PROCESS
BEGIN
	d(11) <= '0';
WAIT;
END PROCESS t_prcs_d_11;
-- d[10]
t_prcs_d_10: PROCESS
BEGIN
	d(10) <= '0';
	WAIT FOR 40000 ps;
	d(10) <= '1';
	WAIT FOR 20000 ps;
	d(10) <= '0';
WAIT;
END PROCESS t_prcs_d_10;
-- d[9]
t_prcs_d_9: PROCESS
BEGIN
	d(9) <= '0';
	WAIT FOR 40000 ps;
	d(9) <= '1';
	WAIT FOR 20000 ps;
	d(9) <= '0';
WAIT;
END PROCESS t_prcs_d_9;
-- d[8]
t_prcs_d_8: PROCESS
BEGIN
	d(8) <= '0';
WAIT;
END PROCESS t_prcs_d_8;
-- d[7]
t_prcs_d_7: PROCESS
BEGIN
	d(7) <= '0';
WAIT;
END PROCESS t_prcs_d_7;
-- d[6]
t_prcs_d_6: PROCESS
BEGIN
	d(6) <= '0';
	WAIT FOR 40000 ps;
	d(6) <= '1';
	WAIT FOR 20000 ps;
	d(6) <= '0';
WAIT;
END PROCESS t_prcs_d_6;
-- d[5]
t_prcs_d_5: PROCESS
BEGIN
	d(5) <= '0';
	WAIT FOR 40000 ps;
	d(5) <= '1';
	WAIT FOR 20000 ps;
	d(5) <= '0';
WAIT;
END PROCESS t_prcs_d_5;
-- d[4]
t_prcs_d_4: PROCESS
BEGIN
	d(4) <= '0';
	WAIT FOR 40000 ps;
	d(4) <= '1';
	WAIT FOR 20000 ps;
	d(4) <= '0';
WAIT;
END PROCESS t_prcs_d_4;
-- d[3]
t_prcs_d_3: PROCESS
BEGIN
	d(3) <= '0';
	WAIT FOR 40000 ps;
	d(3) <= '1';
	WAIT FOR 20000 ps;
	d(3) <= '0';
WAIT;
END PROCESS t_prcs_d_3;
-- d[2]
t_prcs_d_2: PROCESS
BEGIN
	d(2) <= '0';
WAIT;
END PROCESS t_prcs_d_2;
-- d[1]
t_prcs_d_1: PROCESS
BEGIN
	d(1) <= '0';
WAIT;
END PROCESS t_prcs_d_1;
-- d[0]
t_prcs_d_0: PROCESS
BEGIN
	d(0) <= '0';
WAIT;
END PROCESS t_prcs_d_0;

-- ld
t_prcs_ld: PROCESS
BEGIN
	ld <= '0';
	WAIT FOR 40000 ps;
	ld <= '1';
	WAIT FOR 20000 ps;
	ld <= '0';
WAIT;
END PROCESS t_prcs_ld;
END REG_32_LD_At_Reset_arch;
