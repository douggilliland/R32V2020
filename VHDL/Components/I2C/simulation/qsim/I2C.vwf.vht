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
-- Generated on "07/08/2019 15:50:09"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          i2c
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY i2c_vhd_vec_tst IS
END i2c_vhd_vec_tst;
ARCHITECTURE i2c_arch OF i2c_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL ADRSEL : STD_LOGIC;
SIGNAL CPU_CLK : STD_LOGIC;
SIGNAL DATA_IN : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL DATA_OUT : STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL ENA : STD_LOGIC;
SIGNAL I2C_4XCLK : STD_LOGIC;
SIGNAL I2C_SCL : STD_LOGIC;
SIGNAL I2C_SDA : STD_LOGIC;
SIGNAL RESET : STD_LOGIC;
SIGNAL WR : STD_LOGIC;
COMPONENT i2c
	PORT (
	ADRSEL : IN STD_LOGIC;
	CPU_CLK : IN STD_LOGIC;
	DATA_IN : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	DATA_OUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
	ENA : IN STD_LOGIC;
	I2C_4XCLK : IN STD_LOGIC;
	I2C_SCL : INOUT STD_LOGIC;
	I2C_SDA : INOUT STD_LOGIC;
	RESET : IN STD_LOGIC;
	WR : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : i2c
	PORT MAP (
-- list connections between master ports and signals
	ADRSEL => ADRSEL,
	CPU_CLK => CPU_CLK,
	DATA_IN => DATA_IN,
	DATA_OUT => DATA_OUT,
	ENA => ENA,
	I2C_4XCLK => I2C_4XCLK,
	I2C_SCL => I2C_SCL,
	I2C_SDA => I2C_SDA,
	RESET => RESET,
	WR => WR
	);

-- RESET
t_prcs_RESET: PROCESS
BEGIN
	RESET <= '1';
	WAIT FOR 200000 ps;
	RESET <= '0';
WAIT;
END PROCESS t_prcs_RESET;

-- CPU_CLK
t_prcs_CPU_CLK: PROCESS
BEGIN
LOOP
	CPU_CLK <= '0';
	WAIT FOR 10000 ps;
	CPU_CLK <= '1';
	WAIT FOR 10000 ps;
	IF (NOW >= 10000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_CPU_CLK;

-- I2C_4XCLK
t_prcs_I2C_4XCLK: PROCESS
BEGIN
LOOP
	I2C_4XCLK <= '0';
	WAIT FOR 1250000 ps;
	I2C_4XCLK <= '1';
	WAIT FOR 1250000 ps;
	IF (NOW >= 10000000 ps) THEN WAIT; END IF;
END LOOP;
END PROCESS t_prcs_I2C_4XCLK;

-- ADRSEL
t_prcs_ADRSEL: PROCESS
BEGIN
	ADRSEL <= '0';
WAIT;
END PROCESS t_prcs_ADRSEL;
-- DATA_IN[7]
t_prcs_DATA_IN_7: PROCESS
BEGIN
	DATA_IN(7) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_7;
-- DATA_IN[6]
t_prcs_DATA_IN_6: PROCESS
BEGIN
	DATA_IN(6) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_6;
-- DATA_IN[5]
t_prcs_DATA_IN_5: PROCESS
BEGIN
	DATA_IN(5) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_5;
-- DATA_IN[4]
t_prcs_DATA_IN_4: PROCESS
BEGIN
	DATA_IN(4) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_4;
-- DATA_IN[3]
t_prcs_DATA_IN_3: PROCESS
BEGIN
	DATA_IN(3) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_3;
-- DATA_IN[2]
t_prcs_DATA_IN_2: PROCESS
BEGIN
	DATA_IN(2) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_2;
-- DATA_IN[1]
t_prcs_DATA_IN_1: PROCESS
BEGIN
	DATA_IN(1) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_1;
-- DATA_IN[0]
t_prcs_DATA_IN_0: PROCESS
BEGIN
	DATA_IN(0) <= '0';
WAIT;
END PROCESS t_prcs_DATA_IN_0;

-- ENA
t_prcs_ENA: PROCESS
BEGIN
	ENA <= '0';
WAIT;
END PROCESS t_prcs_ENA;

-- WR
t_prcs_WR: PROCESS
BEGIN
	WR <= '0';
WAIT;
END PROCESS t_prcs_WR;

-- I2C_SCL
t_prcs_I2C_SCL: PROCESS
BEGIN
	I2C_SCL <= 'H';
	WAIT FOR 999000 ps;
	I2C_SCL <= '0';
WAIT;
END PROCESS t_prcs_I2C_SCL;

-- I2C_SDA
t_prcs_I2C_SDA: PROCESS
BEGIN
	I2C_SDA <= 'H';
	WAIT FOR 999000 ps;
	I2C_SDA <= '0';
WAIT;
END PROCESS t_prcs_I2C_SDA;
END i2c_arch;
