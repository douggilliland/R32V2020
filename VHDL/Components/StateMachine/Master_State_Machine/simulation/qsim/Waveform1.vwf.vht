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
-- Generated on "05/15/2019 13:08:26"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          OneHotStateMachine
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY OneHotStateMachine_vhd_vec_tst IS
END OneHotStateMachine_vhd_vec_tst;
ARCHITECTURE OneHotStateMachine_arch OF OneHotStateMachine_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL clr : STD_LOGIC;
SIGNAL hold : STD_LOGIC;
SIGNAL state : STD_LOGIC_VECTOR(5 DOWNTO 0);
COMPONENT OneHotStateMachine
	PORT (
	clk : IN STD_LOGIC;
	clr : IN STD_LOGIC;
	hold : IN STD_LOGIC;
	state : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : OneHotStateMachine
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	clr => clr,
	hold => hold,
	state => state
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
LOOP
	clk <= '0';
	WAIT FOR 10000 ps;
	clk <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 200000 ps) THEN WAIT; END IF;
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

-- hold
t_prcs_hold: PROCESS
BEGIN
	hold <= '0';
	WAIT FOR 100000 ps;
	hold <= '1';
	WAIT FOR 20000 ps;
	hold <= '0';
WAIT;
END PROCESS t_prcs_hold;
END OneHotStateMachine_arch;
