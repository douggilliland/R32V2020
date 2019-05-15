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

-- DATE "05/15/2019 14:38:07"

-- 
-- Device: Altera EP4CE22F17C6 Package FBGA256
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


LIBRARY ALTERA;
LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	counterLoadable IS
    PORT (
	clock : IN std_logic;
	clear : IN std_logic;
	loadVal : IN std_logic_vector(7 DOWNTO 0);
	soundOut : OUT std_logic;
	Q : OUT std_logic_vector(18 DOWNTO 0)
	);
END counterLoadable;

-- Design Ports Information
-- soundOut	=>  Location: PIN_R1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[0]	=>  Location: PIN_L1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[1]	=>  Location: PIN_K1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[2]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[3]	=>  Location: PIN_L3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[4]	=>  Location: PIN_K2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[5]	=>  Location: PIN_L2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[6]	=>  Location: PIN_K5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[7]	=>  Location: PIN_J1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[8]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[9]	=>  Location: PIN_T3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[10]	=>  Location: PIN_P2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[11]	=>  Location: PIN_R3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[12]	=>  Location: PIN_N3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[13]	=>  Location: PIN_J2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[14]	=>  Location: PIN_P3,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[15]	=>  Location: PIN_P1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[16]	=>  Location: PIN_L4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[17]	=>  Location: PIN_N1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Q[18]	=>  Location: PIN_N2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clear	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clock	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadVal[0]	=>  Location: PIN_E15,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadVal[1]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadVal[2]	=>  Location: PIN_R4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadVal[3]	=>  Location: PIN_T4,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadVal[4]	=>  Location: PIN_T2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadVal[5]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadVal[6]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- loadVal[7]	=>  Location: PIN_N5,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF counterLoadable IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clock : std_logic;
SIGNAL ww_clear : std_logic;
SIGNAL ww_loadVal : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_soundOut : std_logic;
SIGNAL ww_Q : std_logic_vector(18 DOWNTO 0);
SIGNAL \clock~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \soundOut~output_o\ : std_logic;
SIGNAL \Q[0]~output_o\ : std_logic;
SIGNAL \Q[1]~output_o\ : std_logic;
SIGNAL \Q[2]~output_o\ : std_logic;
SIGNAL \Q[3]~output_o\ : std_logic;
SIGNAL \Q[4]~output_o\ : std_logic;
SIGNAL \Q[5]~output_o\ : std_logic;
SIGNAL \Q[6]~output_o\ : std_logic;
SIGNAL \Q[7]~output_o\ : std_logic;
SIGNAL \Q[8]~output_o\ : std_logic;
SIGNAL \Q[9]~output_o\ : std_logic;
SIGNAL \Q[10]~output_o\ : std_logic;
SIGNAL \Q[11]~output_o\ : std_logic;
SIGNAL \Q[12]~output_o\ : std_logic;
SIGNAL \Q[13]~output_o\ : std_logic;
SIGNAL \Q[14]~output_o\ : std_logic;
SIGNAL \Q[15]~output_o\ : std_logic;
SIGNAL \Q[16]~output_o\ : std_logic;
SIGNAL \Q[17]~output_o\ : std_logic;
SIGNAL \Q[18]~output_o\ : std_logic;
SIGNAL \clock~input_o\ : std_logic;
SIGNAL \clock~inputclkctrl_outclk\ : std_logic;
SIGNAL \loadVal[5]~input_o\ : std_logic;
SIGNAL \clear~input_o\ : std_logic;
SIGNAL \loadVal[4]~input_o\ : std_logic;
SIGNAL \loadVal[3]~input_o\ : std_logic;
SIGNAL \loadVal[2]~input_o\ : std_logic;
SIGNAL \loadVal[1]~input_o\ : std_logic;
SIGNAL \loadVal[0]~input_o\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \Pre_Q~0_combout\ : std_logic;
SIGNAL \Add0~1\ : std_logic;
SIGNAL \Add0~2_combout\ : std_logic;
SIGNAL \Pre_Q~1_combout\ : std_logic;
SIGNAL \Add0~3\ : std_logic;
SIGNAL \Add0~4_combout\ : std_logic;
SIGNAL \Pre_Q~2_combout\ : std_logic;
SIGNAL \Add0~5\ : std_logic;
SIGNAL \Add0~6_combout\ : std_logic;
SIGNAL \Pre_Q~3_combout\ : std_logic;
SIGNAL \Add0~7\ : std_logic;
SIGNAL \Add0~8_combout\ : std_logic;
SIGNAL \Pre_Q~4_combout\ : std_logic;
SIGNAL \Add0~9\ : std_logic;
SIGNAL \Add0~10_combout\ : std_logic;
SIGNAL \Pre_Q~5_combout\ : std_logic;
SIGNAL \Add0~11\ : std_logic;
SIGNAL \Add0~12_combout\ : std_logic;
SIGNAL \Pre_Q~6_combout\ : std_logic;
SIGNAL \Add0~13\ : std_logic;
SIGNAL \Add0~14_combout\ : std_logic;
SIGNAL \Pre_Q~7_combout\ : std_logic;
SIGNAL \Add0~15\ : std_logic;
SIGNAL \Add0~16_combout\ : std_logic;
SIGNAL \Pre_Q~8_combout\ : std_logic;
SIGNAL \Add0~17\ : std_logic;
SIGNAL \Add0~18_combout\ : std_logic;
SIGNAL \Pre_Q~9_combout\ : std_logic;
SIGNAL \Add0~19\ : std_logic;
SIGNAL \Add0~20_combout\ : std_logic;
SIGNAL \Pre_Q~10_combout\ : std_logic;
SIGNAL \Add0~21\ : std_logic;
SIGNAL \Add0~22_combout\ : std_logic;
SIGNAL \Pre_Q~11_combout\ : std_logic;
SIGNAL \Add0~23\ : std_logic;
SIGNAL \Add0~24_combout\ : std_logic;
SIGNAL \Pre_Q~12_combout\ : std_logic;
SIGNAL \Add0~25\ : std_logic;
SIGNAL \Add0~26_combout\ : std_logic;
SIGNAL \Pre_Q~13_combout\ : std_logic;
SIGNAL \Add0~27\ : std_logic;
SIGNAL \Add0~28_combout\ : std_logic;
SIGNAL \Pre_Q~14_combout\ : std_logic;
SIGNAL \Add0~29\ : std_logic;
SIGNAL \Add0~30_combout\ : std_logic;
SIGNAL \Pre_Q~15_combout\ : std_logic;
SIGNAL \Add0~31\ : std_logic;
SIGNAL \Add0~32_combout\ : std_logic;
SIGNAL \Pre_Q~16_combout\ : std_logic;
SIGNAL \loadVal[6]~input_o\ : std_logic;
SIGNAL \Add0~33\ : std_logic;
SIGNAL \Add0~34_combout\ : std_logic;
SIGNAL \Pre_Q~17_combout\ : std_logic;
SIGNAL \loadVal[7]~input_o\ : std_logic;
SIGNAL \Add0~35\ : std_logic;
SIGNAL \Add0~36_combout\ : std_logic;
SIGNAL \Pre_Q~18_combout\ : std_logic;
SIGNAL \Equal0~3_combout\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Equal0~4_combout\ : std_logic;
SIGNAL \Equal0~5_combout\ : std_logic;
SIGNAL \sound~0_combout\ : std_logic;
SIGNAL \sound~q\ : std_logic;
SIGNAL Pre_Q : std_logic_vector(18 DOWNTO 0);

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clock <= clock;
ww_clear <= clear;
ww_loadVal <= loadVal;
soundOut <= ww_soundOut;
Q <= ww_Q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clock~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clock~input_o\);
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y5_N23
\soundOut~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \sound~q\,
	devoe => ww_devoe,
	o => \soundOut~output_o\);

-- Location: IOOBUF_X0_Y11_N9
\Q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(0),
	devoe => ww_devoe,
	o => \Q[0]~output_o\);

-- Location: IOOBUF_X0_Y12_N9
\Q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(1),
	devoe => ww_devoe,
	o => \Q[1]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\Q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(2),
	devoe => ww_devoe,
	o => \Q[2]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\Q[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(3),
	devoe => ww_devoe,
	o => \Q[3]~output_o\);

-- Location: IOOBUF_X0_Y12_N2
\Q[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(4),
	devoe => ww_devoe,
	o => \Q[4]~output_o\);

-- Location: IOOBUF_X0_Y11_N2
\Q[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(5),
	devoe => ww_devoe,
	o => \Q[5]~output_o\);

-- Location: IOOBUF_X0_Y7_N9
\Q[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(6),
	devoe => ww_devoe,
	o => \Q[6]~output_o\);

-- Location: IOOBUF_X0_Y15_N9
\Q[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(7),
	devoe => ww_devoe,
	o => \Q[7]~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\Q[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(8),
	devoe => ww_devoe,
	o => \Q[8]~output_o\);

-- Location: IOOBUF_X1_Y0_N2
\Q[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(9),
	devoe => ww_devoe,
	o => \Q[9]~output_o\);

-- Location: IOOBUF_X0_Y4_N16
\Q[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(10),
	devoe => ww_devoe,
	o => \Q[10]~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\Q[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(11),
	devoe => ww_devoe,
	o => \Q[11]~output_o\);

-- Location: IOOBUF_X1_Y0_N23
\Q[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(12),
	devoe => ww_devoe,
	o => \Q[12]~output_o\);

-- Location: IOOBUF_X0_Y15_N2
\Q[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(13),
	devoe => ww_devoe,
	o => \Q[13]~output_o\);

-- Location: IOOBUF_X1_Y0_N16
\Q[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(14),
	devoe => ww_devoe,
	o => \Q[14]~output_o\);

-- Location: IOOBUF_X0_Y4_N23
\Q[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(15),
	devoe => ww_devoe,
	o => \Q[15]~output_o\);

-- Location: IOOBUF_X0_Y6_N16
\Q[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(16),
	devoe => ww_devoe,
	o => \Q[16]~output_o\);

-- Location: IOOBUF_X0_Y7_N2
\Q[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(17),
	devoe => ww_devoe,
	o => \Q[17]~output_o\);

-- Location: IOOBUF_X0_Y8_N23
\Q[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(18),
	devoe => ww_devoe,
	o => \Q[18]~output_o\);

-- Location: IOIBUF_X0_Y16_N8
\clock~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clock,
	o => \clock~input_o\);

-- Location: CLKCTRL_G2
\clock~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clock~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clock~inputclkctrl_outclk\);

-- Location: IOIBUF_X0_Y24_N22
\loadVal[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadVal(5),
	o => \loadVal[5]~input_o\);

-- Location: IOIBUF_X53_Y17_N8
\clear~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clear,
	o => \clear~input_o\);

-- Location: IOIBUF_X3_Y0_N1
\loadVal[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadVal(4),
	o => \loadVal[4]~input_o\);

-- Location: IOIBUF_X5_Y0_N15
\loadVal[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadVal(3),
	o => \loadVal[3]~input_o\);

-- Location: IOIBUF_X5_Y0_N22
\loadVal[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadVal(2),
	o => \loadVal[2]~input_o\);

-- Location: IOIBUF_X0_Y24_N15
\loadVal[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadVal(1),
	o => \loadVal[1]~input_o\);

-- Location: IOIBUF_X53_Y17_N1
\loadVal[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadVal(0),
	o => \loadVal[0]~input_o\);

-- Location: LCCOMB_X2_Y10_N14
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = Pre_Q(0) $ (VCC)
-- \Add0~1\ = CARRY(Pre_Q(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(0),
	datad => VCC,
	combout => \Add0~0_combout\,
	cout => \Add0~1\);

-- Location: LCCOMB_X2_Y10_N4
\Pre_Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~0_combout\ = (!\clear~input_o\ & (\Add0~0_combout\ & \Equal0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clear~input_o\,
	datac => \Add0~0_combout\,
	datad => \Equal0~5_combout\,
	combout => \Pre_Q~0_combout\);

-- Location: FF_X2_Y10_N5
\Pre_Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(0));

-- Location: LCCOMB_X2_Y10_N16
\Add0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~2_combout\ = (Pre_Q(1) & (!\Add0~1\)) # (!Pre_Q(1) & ((\Add0~1\) # (GND)))
-- \Add0~3\ = CARRY((!\Add0~1\) # (!Pre_Q(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(1),
	datad => VCC,
	cin => \Add0~1\,
	combout => \Add0~2_combout\,
	cout => \Add0~3\);

-- Location: LCCOMB_X2_Y10_N10
\Pre_Q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~1_combout\ = (\Equal0~5_combout\ & (!\clear~input_o\ & \Add0~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \clear~input_o\,
	datad => \Add0~2_combout\,
	combout => \Pre_Q~1_combout\);

-- Location: FF_X2_Y10_N11
\Pre_Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(1));

-- Location: LCCOMB_X2_Y10_N18
\Add0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~4_combout\ = (Pre_Q(2) & (\Add0~3\ $ (GND))) # (!Pre_Q(2) & (!\Add0~3\ & VCC))
-- \Add0~5\ = CARRY((Pre_Q(2) & !\Add0~3\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(2),
	datad => VCC,
	cin => \Add0~3\,
	combout => \Add0~4_combout\,
	cout => \Add0~5\);

-- Location: LCCOMB_X1_Y9_N0
\Pre_Q~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~2_combout\ = (!\clear~input_o\ & (\Equal0~5_combout\ & \Add0~4_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datac => \Equal0~5_combout\,
	datad => \Add0~4_combout\,
	combout => \Pre_Q~2_combout\);

-- Location: FF_X2_Y10_N21
\Pre_Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	asdata => \Pre_Q~2_combout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(2));

-- Location: LCCOMB_X2_Y10_N20
\Add0~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~6_combout\ = (Pre_Q(3) & (!\Add0~5\)) # (!Pre_Q(3) & ((\Add0~5\) # (GND)))
-- \Add0~7\ = CARRY((!\Add0~5\) # (!Pre_Q(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(3),
	datad => VCC,
	cin => \Add0~5\,
	combout => \Add0~6_combout\,
	cout => \Add0~7\);

-- Location: LCCOMB_X2_Y10_N8
\Pre_Q~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~3_combout\ = (\Equal0~5_combout\ & (!\clear~input_o\ & \Add0~6_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \clear~input_o\,
	datad => \Add0~6_combout\,
	combout => \Pre_Q~3_combout\);

-- Location: FF_X2_Y10_N9
\Pre_Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(3));

-- Location: LCCOMB_X2_Y10_N22
\Add0~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~8_combout\ = (Pre_Q(4) & (\Add0~7\ $ (GND))) # (!Pre_Q(4) & (!\Add0~7\ & VCC))
-- \Add0~9\ = CARRY((Pre_Q(4) & !\Add0~7\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(4),
	datad => VCC,
	cin => \Add0~7\,
	combout => \Add0~8_combout\,
	cout => \Add0~9\);

-- Location: LCCOMB_X2_Y10_N2
\Pre_Q~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~4_combout\ = (!\clear~input_o\ & (\Add0~8_combout\ & \Equal0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clear~input_o\,
	datac => \Add0~8_combout\,
	datad => \Equal0~5_combout\,
	combout => \Pre_Q~4_combout\);

-- Location: FF_X2_Y10_N3
\Pre_Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(4));

-- Location: LCCOMB_X2_Y10_N24
\Add0~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~10_combout\ = (Pre_Q(5) & (!\Add0~9\)) # (!Pre_Q(5) & ((\Add0~9\) # (GND)))
-- \Add0~11\ = CARRY((!\Add0~9\) # (!Pre_Q(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(5),
	datad => VCC,
	cin => \Add0~9\,
	combout => \Add0~10_combout\,
	cout => \Add0~11\);

-- Location: LCCOMB_X1_Y9_N2
\Pre_Q~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~5_combout\ = (!\clear~input_o\ & (\Equal0~5_combout\ & \Add0~10_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datac => \Equal0~5_combout\,
	datad => \Add0~10_combout\,
	combout => \Pre_Q~5_combout\);

-- Location: FF_X1_Y9_N3
\Pre_Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~5_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(5));

-- Location: LCCOMB_X2_Y10_N26
\Add0~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~12_combout\ = (Pre_Q(6) & (\Add0~11\ $ (GND))) # (!Pre_Q(6) & (!\Add0~11\ & VCC))
-- \Add0~13\ = CARRY((Pre_Q(6) & !\Add0~11\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(6),
	datad => VCC,
	cin => \Add0~11\,
	combout => \Add0~12_combout\,
	cout => \Add0~13\);

-- Location: LCCOMB_X2_Y10_N12
\Pre_Q~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~6_combout\ = (!\clear~input_o\ & (\Add0~12_combout\ & \Equal0~5_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clear~input_o\,
	datac => \Add0~12_combout\,
	datad => \Equal0~5_combout\,
	combout => \Pre_Q~6_combout\);

-- Location: FF_X2_Y10_N13
\Pre_Q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~6_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(6));

-- Location: LCCOMB_X2_Y10_N28
\Add0~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~14_combout\ = (Pre_Q(7) & (!\Add0~13\)) # (!Pre_Q(7) & ((\Add0~13\) # (GND)))
-- \Add0~15\ = CARRY((!\Add0~13\) # (!Pre_Q(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(7),
	datad => VCC,
	cin => \Add0~13\,
	combout => \Add0~14_combout\,
	cout => \Add0~15\);

-- Location: LCCOMB_X2_Y10_N6
\Pre_Q~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~7_combout\ = (!\clear~input_o\ & ((\Add0~14_combout\) # (!\Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \clear~input_o\,
	datad => \Add0~14_combout\,
	combout => \Pre_Q~7_combout\);

-- Location: FF_X2_Y10_N7
\Pre_Q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~7_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(7));

-- Location: LCCOMB_X2_Y10_N30
\Add0~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~16_combout\ = (Pre_Q(8) & (\Add0~15\ $ (GND))) # (!Pre_Q(8) & (!\Add0~15\ & VCC))
-- \Add0~17\ = CARRY((Pre_Q(8) & !\Add0~15\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(8),
	datad => VCC,
	cin => \Add0~15\,
	combout => \Add0~16_combout\,
	cout => \Add0~17\);

-- Location: LCCOMB_X2_Y10_N0
\Pre_Q~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~8_combout\ = (!\clear~input_o\ & ((\Add0~16_combout\) # (!\Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \clear~input_o\,
	datac => \Add0~16_combout\,
	datad => \Equal0~5_combout\,
	combout => \Pre_Q~8_combout\);

-- Location: FF_X2_Y10_N1
\Pre_Q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~8_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(8));

-- Location: LCCOMB_X2_Y9_N0
\Add0~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~18_combout\ = (Pre_Q(9) & (!\Add0~17\)) # (!Pre_Q(9) & ((\Add0~17\) # (GND)))
-- \Add0~19\ = CARRY((!\Add0~17\) # (!Pre_Q(9)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(9),
	datad => VCC,
	cin => \Add0~17\,
	combout => \Add0~18_combout\,
	cout => \Add0~19\);

-- Location: LCCOMB_X2_Y9_N20
\Pre_Q~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~9_combout\ = (!\clear~input_o\ & ((\Add0~18_combout\) # (!\Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~5_combout\,
	datac => \clear~input_o\,
	datad => \Add0~18_combout\,
	combout => \Pre_Q~9_combout\);

-- Location: FF_X2_Y9_N21
\Pre_Q[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(9));

-- Location: LCCOMB_X2_Y9_N2
\Add0~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~20_combout\ = (Pre_Q(10) & (\Add0~19\ $ (GND))) # (!Pre_Q(10) & (!\Add0~19\ & VCC))
-- \Add0~21\ = CARRY((Pre_Q(10) & !\Add0~19\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(10),
	datad => VCC,
	cin => \Add0~19\,
	combout => \Add0~20_combout\,
	cout => \Add0~21\);

-- Location: LCCOMB_X2_Y9_N22
\Pre_Q~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~10_combout\ = (!\clear~input_o\ & ((\Add0~20_combout\) # (!\Equal0~5_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Equal0~5_combout\,
	datac => \clear~input_o\,
	datad => \Add0~20_combout\,
	combout => \Pre_Q~10_combout\);

-- Location: FF_X2_Y9_N23
\Pre_Q[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(10));

-- Location: LCCOMB_X2_Y9_N4
\Add0~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~22_combout\ = (Pre_Q(11) & (!\Add0~21\)) # (!Pre_Q(11) & ((\Add0~21\) # (GND)))
-- \Add0~23\ = CARRY((!\Add0~21\) # (!Pre_Q(11)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(11),
	datad => VCC,
	cin => \Add0~21\,
	combout => \Add0~22_combout\,
	cout => \Add0~23\);

-- Location: LCCOMB_X2_Y9_N24
\Pre_Q~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~11_combout\ = (!\clear~input_o\ & ((\Equal0~5_combout\ & ((\Add0~22_combout\))) # (!\Equal0~5_combout\ & (\loadVal[0]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \loadVal[0]~input_o\,
	datab => \clear~input_o\,
	datac => \Add0~22_combout\,
	datad => \Equal0~5_combout\,
	combout => \Pre_Q~11_combout\);

-- Location: FF_X2_Y9_N25
\Pre_Q[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~11_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(11));

-- Location: LCCOMB_X2_Y9_N6
\Add0~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~24_combout\ = (Pre_Q(12) & (\Add0~23\ $ (GND))) # (!Pre_Q(12) & (!\Add0~23\ & VCC))
-- \Add0~25\ = CARRY((Pre_Q(12) & !\Add0~23\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(12),
	datad => VCC,
	cin => \Add0~23\,
	combout => \Add0~24_combout\,
	cout => \Add0~25\);

-- Location: LCCOMB_X1_Y9_N12
\Pre_Q~12\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~12_combout\ = (!\clear~input_o\ & ((\Equal0~5_combout\ & ((\Add0~24_combout\))) # (!\Equal0~5_combout\ & (\loadVal[1]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datab => \loadVal[1]~input_o\,
	datac => \Equal0~5_combout\,
	datad => \Add0~24_combout\,
	combout => \Pre_Q~12_combout\);

-- Location: FF_X1_Y9_N13
\Pre_Q[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~12_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(12));

-- Location: LCCOMB_X2_Y9_N8
\Add0~26\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~26_combout\ = (Pre_Q(13) & (!\Add0~25\)) # (!Pre_Q(13) & ((\Add0~25\) # (GND)))
-- \Add0~27\ = CARRY((!\Add0~25\) # (!Pre_Q(13)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(13),
	datad => VCC,
	cin => \Add0~25\,
	combout => \Add0~26_combout\,
	cout => \Add0~27\);

-- Location: LCCOMB_X2_Y9_N26
\Pre_Q~13\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~13_combout\ = (!\clear~input_o\ & ((\Equal0~5_combout\ & ((\Add0~26_combout\))) # (!\Equal0~5_combout\ & (\loadVal[2]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \loadVal[2]~input_o\,
	datab => \clear~input_o\,
	datac => \Add0~26_combout\,
	datad => \Equal0~5_combout\,
	combout => \Pre_Q~13_combout\);

-- Location: FF_X2_Y9_N27
\Pre_Q[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~13_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(13));

-- Location: LCCOMB_X2_Y9_N10
\Add0~28\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~28_combout\ = (Pre_Q(14) & (\Add0~27\ $ (GND))) # (!Pre_Q(14) & (!\Add0~27\ & VCC))
-- \Add0~29\ = CARRY((Pre_Q(14) & !\Add0~27\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(14),
	datad => VCC,
	cin => \Add0~27\,
	combout => \Add0~28_combout\,
	cout => \Add0~29\);

-- Location: LCCOMB_X2_Y9_N28
\Pre_Q~14\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~14_combout\ = (!\clear~input_o\ & ((\Equal0~5_combout\ & ((\Add0~28_combout\))) # (!\Equal0~5_combout\ & (\loadVal[3]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \loadVal[3]~input_o\,
	datab => \Equal0~5_combout\,
	datac => \clear~input_o\,
	datad => \Add0~28_combout\,
	combout => \Pre_Q~14_combout\);

-- Location: FF_X2_Y9_N29
\Pre_Q[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~14_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(14));

-- Location: LCCOMB_X2_Y9_N12
\Add0~30\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~30_combout\ = (Pre_Q(15) & (!\Add0~29\)) # (!Pre_Q(15) & ((\Add0~29\) # (GND)))
-- \Add0~31\ = CARRY((!\Add0~29\) # (!Pre_Q(15)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(15),
	datad => VCC,
	cin => \Add0~29\,
	combout => \Add0~30_combout\,
	cout => \Add0~31\);

-- Location: LCCOMB_X2_Y9_N30
\Pre_Q~15\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~15_combout\ = (!\clear~input_o\ & ((\Equal0~5_combout\ & ((\Add0~30_combout\))) # (!\Equal0~5_combout\ & (\loadVal[4]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \loadVal[4]~input_o\,
	datab => \Equal0~5_combout\,
	datac => \clear~input_o\,
	datad => \Add0~30_combout\,
	combout => \Pre_Q~15_combout\);

-- Location: FF_X2_Y9_N31
\Pre_Q[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~15_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(15));

-- Location: LCCOMB_X2_Y9_N14
\Add0~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~32_combout\ = (Pre_Q(16) & (\Add0~31\ $ (GND))) # (!Pre_Q(16) & (!\Add0~31\ & VCC))
-- \Add0~33\ = CARRY((Pre_Q(16) & !\Add0~31\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(16),
	datad => VCC,
	cin => \Add0~31\,
	combout => \Add0~32_combout\,
	cout => \Add0~33\);

-- Location: LCCOMB_X1_Y9_N30
\Pre_Q~16\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~16_combout\ = (!\clear~input_o\ & ((\Equal0~5_combout\ & ((\Add0~32_combout\))) # (!\Equal0~5_combout\ & (\loadVal[5]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datab => \loadVal[5]~input_o\,
	datac => \clear~input_o\,
	datad => \Add0~32_combout\,
	combout => \Pre_Q~16_combout\);

-- Location: FF_X1_Y9_N31
\Pre_Q[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~16_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(16));

-- Location: IOIBUF_X0_Y23_N1
\loadVal[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadVal(6),
	o => \loadVal[6]~input_o\);

-- Location: LCCOMB_X2_Y9_N16
\Add0~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~34_combout\ = (Pre_Q(17) & (!\Add0~33\)) # (!Pre_Q(17) & ((\Add0~33\) # (GND)))
-- \Add0~35\ = CARRY((!\Add0~33\) # (!Pre_Q(17)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(17),
	datad => VCC,
	cin => \Add0~33\,
	combout => \Add0~34_combout\,
	cout => \Add0~35\);

-- Location: LCCOMB_X1_Y9_N28
\Pre_Q~17\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~17_combout\ = (!\clear~input_o\ & ((\Equal0~5_combout\ & ((\Add0~34_combout\))) # (!\Equal0~5_combout\ & (\loadVal[6]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datab => \loadVal[6]~input_o\,
	datac => \Equal0~5_combout\,
	datad => \Add0~34_combout\,
	combout => \Pre_Q~17_combout\);

-- Location: FF_X1_Y9_N29
\Pre_Q[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~17_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(17));

-- Location: IOIBUF_X5_Y0_N8
\loadVal[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_loadVal(7),
	o => \loadVal[7]~input_o\);

-- Location: LCCOMB_X2_Y9_N18
\Add0~36\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~36_combout\ = Pre_Q(18) $ (!\Add0~35\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010110100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(18),
	cin => \Add0~35\,
	combout => \Add0~36_combout\);

-- Location: LCCOMB_X1_Y9_N26
\Pre_Q~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~18_combout\ = (!\clear~input_o\ & ((\Equal0~5_combout\ & ((\Add0~36_combout\))) # (!\Equal0~5_combout\ & (\loadVal[7]~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101010000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \clear~input_o\,
	datab => \loadVal[7]~input_o\,
	datac => \Equal0~5_combout\,
	datad => \Add0~36_combout\,
	combout => \Pre_Q~18_combout\);

-- Location: FF_X1_Y9_N27
\Pre_Q[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \Pre_Q~18_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(18));

-- Location: LCCOMB_X1_Y9_N10
\Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~3_combout\ = (((!Pre_Q(12)) # (!Pre_Q(14))) # (!Pre_Q(13))) # (!Pre_Q(15))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(15),
	datab => Pre_Q(13),
	datac => Pre_Q(14),
	datad => Pre_Q(12),
	combout => \Equal0~3_combout\);

-- Location: LCCOMB_X1_Y9_N4
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (((!Pre_Q(8)) # (!Pre_Q(11))) # (!Pre_Q(10))) # (!Pre_Q(9))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(9),
	datab => Pre_Q(10),
	datac => Pre_Q(11),
	datad => Pre_Q(8),
	combout => \Equal0~0_combout\);

-- Location: LCCOMB_X1_Y9_N14
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = ((Pre_Q(5)) # ((Pre_Q(4)) # (Pre_Q(6)))) # (!Pre_Q(7))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(7),
	datab => Pre_Q(5),
	datac => Pre_Q(4),
	datad => Pre_Q(6),
	combout => \Equal0~1_combout\);

-- Location: LCCOMB_X1_Y9_N24
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (Pre_Q(0)) # ((Pre_Q(3)) # ((Pre_Q(1)) # (Pre_Q(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(0),
	datab => Pre_Q(3),
	datac => Pre_Q(1),
	datad => Pre_Q(2),
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X1_Y9_N20
\Equal0~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~4_combout\ = (\Equal0~3_combout\) # ((\Equal0~0_combout\) # ((\Equal0~1_combout\) # (\Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~3_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \Equal0~2_combout\,
	combout => \Equal0~4_combout\);

-- Location: LCCOMB_X1_Y9_N22
\Equal0~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~5_combout\ = (((\Equal0~4_combout\) # (!Pre_Q(18))) # (!Pre_Q(17))) # (!Pre_Q(16))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(16),
	datab => Pre_Q(17),
	datac => Pre_Q(18),
	datad => \Equal0~4_combout\,
	combout => \Equal0~5_combout\);

-- Location: LCCOMB_X1_Y9_N8
\sound~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sound~0_combout\ = (!\clear~input_o\ & (\Equal0~5_combout\ $ (!\sound~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010100101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~5_combout\,
	datac => \sound~q\,
	datad => \clear~input_o\,
	combout => \sound~0_combout\);

-- Location: FF_X1_Y9_N9
sound : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clock~inputclkctrl_outclk\,
	d => \sound~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sound~q\);

ww_soundOut <= \soundOut~output_o\;

ww_Q(0) <= \Q[0]~output_o\;

ww_Q(1) <= \Q[1]~output_o\;

ww_Q(2) <= \Q[2]~output_o\;

ww_Q(3) <= \Q[3]~output_o\;

ww_Q(4) <= \Q[4]~output_o\;

ww_Q(5) <= \Q[5]~output_o\;

ww_Q(6) <= \Q[6]~output_o\;

ww_Q(7) <= \Q[7]~output_o\;

ww_Q(8) <= \Q[8]~output_o\;

ww_Q(9) <= \Q[9]~output_o\;

ww_Q(10) <= \Q[10]~output_o\;

ww_Q(11) <= \Q[11]~output_o\;

ww_Q(12) <= \Q[12]~output_o\;

ww_Q(13) <= \Q[13]~output_o\;

ww_Q(14) <= \Q[14]~output_o\;

ww_Q(15) <= \Q[15]~output_o\;

ww_Q(16) <= \Q[16]~output_o\;

ww_Q(17) <= \Q[17]~output_o\;

ww_Q(18) <= \Q[18]~output_o\;
END structure;


