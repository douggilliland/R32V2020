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

-- DATE "05/15/2019 13:07:41"

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

ENTITY 	OneHotStateMachine IS
    PORT (
	clk : IN std_logic;
	clr : IN std_logic;
	hold : IN std_logic;
	state : OUT std_logic_vector(5 DOWNTO 0)
	);
END OneHotStateMachine;

-- Design Ports Information
-- state[0]	=>  Location: PIN_G5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[1]	=>  Location: PIN_D1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[2]	=>  Location: PIN_F2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[3]	=>  Location: PIN_F1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[4]	=>  Location: PIN_G2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- state[5]	=>  Location: PIN_G1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_E1,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clr	=>  Location: PIN_M2,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- hold	=>  Location: PIN_E16,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF OneHotStateMachine IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_clr : std_logic;
SIGNAL ww_hold : std_logic;
SIGNAL ww_state : std_logic_vector(5 DOWNTO 0);
SIGNAL \clr~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \state[0]~output_o\ : std_logic;
SIGNAL \state[1]~output_o\ : std_logic;
SIGNAL \state[2]~output_o\ : std_logic;
SIGNAL \state[3]~output_o\ : std_logic;
SIGNAL \state[4]~output_o\ : std_logic;
SIGNAL \state[5]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Pre_Q~10_combout\ : std_logic;
SIGNAL \Pre_Q~11_combout\ : std_logic;
SIGNAL \clr~input_o\ : std_logic;
SIGNAL \clr~inputclkctrl_outclk\ : std_logic;
SIGNAL \hold~input_o\ : std_logic;
SIGNAL \Pre_Q~8_combout\ : std_logic;
SIGNAL \Pre_Q~9_combout\ : std_logic;
SIGNAL \Pre_Q~6_combout\ : std_logic;
SIGNAL \Pre_Q~7_combout\ : std_logic;
SIGNAL \Pre_Q~4_combout\ : std_logic;
SIGNAL \Pre_Q~5_combout\ : std_logic;
SIGNAL \Pre_Q~0_combout\ : std_logic;
SIGNAL \Pre_Q~3_combout\ : std_logic;
SIGNAL \Pre_Q~1_combout\ : std_logic;
SIGNAL \Pre_Q~2_combout\ : std_logic;
SIGNAL \state[0]~reg0feeder_combout\ : std_logic;
SIGNAL \state[0]~reg0_q\ : std_logic;
SIGNAL \state[1]~reg0feeder_combout\ : std_logic;
SIGNAL \state[1]~reg0_q\ : std_logic;
SIGNAL \state[2]~reg0feeder_combout\ : std_logic;
SIGNAL \state[2]~reg0_q\ : std_logic;
SIGNAL \state[3]~reg0feeder_combout\ : std_logic;
SIGNAL \state[3]~reg0_q\ : std_logic;
SIGNAL \state[4]~reg0_q\ : std_logic;
SIGNAL \state[5]~reg0_q\ : std_logic;
SIGNAL Pre_Q : std_logic_vector(5 DOWNTO 0);
SIGNAL \ALT_INV_clr~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_hold~input_o\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_clk <= clk;
ww_clr <= clr;
ww_hold <= hold;
state <= ww_state;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clr~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clr~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_clr~inputclkctrl_outclk\ <= NOT \clr~inputclkctrl_outclk\;
\ALT_INV_hold~input_o\ <= NOT \hold~input_o\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X0_Y24_N16
\state[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state[0]~reg0_q\,
	devoe => ww_devoe,
	o => \state[0]~output_o\);

-- Location: IOOBUF_X0_Y25_N9
\state[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state[1]~reg0_q\,
	devoe => ww_devoe,
	o => \state[1]~output_o\);

-- Location: IOOBUF_X0_Y24_N23
\state[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state[2]~reg0_q\,
	devoe => ww_devoe,
	o => \state[2]~output_o\);

-- Location: IOOBUF_X0_Y23_N2
\state[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state[3]~reg0_q\,
	devoe => ww_devoe,
	o => \state[3]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\state[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state[4]~reg0_q\,
	devoe => ww_devoe,
	o => \state[4]~output_o\);

-- Location: IOOBUF_X0_Y23_N23
\state[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \state[5]~reg0_q\,
	devoe => ww_devoe,
	o => \state[5]~output_o\);

-- Location: IOIBUF_X0_Y16_N8
\clk~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G2
\clk~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: LCCOMB_X1_Y24_N16
\Pre_Q~10\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~10_combout\ = (!Pre_Q(2) & (!Pre_Q(1) & (!Pre_Q(0) & !Pre_Q(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(2),
	datab => Pre_Q(1),
	datac => Pre_Q(0),
	datad => Pre_Q(3),
	combout => \Pre_Q~10_combout\);

-- Location: LCCOMB_X1_Y24_N10
\Pre_Q~11\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~11_combout\ = (\Pre_Q~10_combout\ & (Pre_Q(4))) # (!\Pre_Q~10_combout\ & ((Pre_Q(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(4),
	datac => Pre_Q(5),
	datad => \Pre_Q~10_combout\,
	combout => \Pre_Q~11_combout\);

-- Location: IOIBUF_X0_Y16_N15
\clr~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clr,
	o => \clr~input_o\);

-- Location: CLKCTRL_G4
\clr~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clr~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clr~inputclkctrl_outclk\);

-- Location: IOIBUF_X53_Y17_N8
\hold~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_hold,
	o => \hold~input_o\);

-- Location: FF_X1_Y24_N11
\Pre_Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q~11_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(5));

-- Location: LCCOMB_X1_Y24_N20
\Pre_Q~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~8_combout\ = (!Pre_Q(0) & (!Pre_Q(1) & (!Pre_Q(5) & !Pre_Q(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(0),
	datab => Pre_Q(1),
	datac => Pre_Q(5),
	datad => Pre_Q(2),
	combout => \Pre_Q~8_combout\);

-- Location: LCCOMB_X1_Y24_N22
\Pre_Q~9\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~9_combout\ = (\Pre_Q~8_combout\ & (Pre_Q(3))) # (!\Pre_Q~8_combout\ & ((Pre_Q(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(3),
	datac => Pre_Q(4),
	datad => \Pre_Q~8_combout\,
	combout => \Pre_Q~9_combout\);

-- Location: FF_X1_Y24_N23
\Pre_Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q~9_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(4));

-- Location: LCCOMB_X1_Y24_N6
\Pre_Q~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~6_combout\ = (!Pre_Q(0) & (!Pre_Q(1) & (!Pre_Q(4) & !Pre_Q(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(0),
	datab => Pre_Q(1),
	datac => Pre_Q(4),
	datad => Pre_Q(5),
	combout => \Pre_Q~6_combout\);

-- Location: LCCOMB_X1_Y24_N28
\Pre_Q~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~7_combout\ = (\Pre_Q~6_combout\ & (Pre_Q(2))) # (!\Pre_Q~6_combout\ & ((Pre_Q(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(2),
	datac => Pre_Q(3),
	datad => \Pre_Q~6_combout\,
	combout => \Pre_Q~7_combout\);

-- Location: FF_X1_Y24_N29
\Pre_Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q~7_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(3));

-- Location: LCCOMB_X1_Y24_N0
\Pre_Q~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~4_combout\ = (!Pre_Q(0) & (!Pre_Q(3) & (!Pre_Q(4) & !Pre_Q(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(0),
	datab => Pre_Q(3),
	datac => Pre_Q(4),
	datad => Pre_Q(5),
	combout => \Pre_Q~4_combout\);

-- Location: LCCOMB_X1_Y24_N12
\Pre_Q~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~5_combout\ = (\Pre_Q~4_combout\ & (Pre_Q(1))) # (!\Pre_Q~4_combout\ & ((Pre_Q(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(1),
	datac => Pre_Q(2),
	datad => \Pre_Q~4_combout\,
	combout => \Pre_Q~5_combout\);

-- Location: FF_X1_Y24_N13
\Pre_Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q~5_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(2));

-- Location: LCCOMB_X1_Y24_N24
\Pre_Q~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~0_combout\ = (!Pre_Q(2) & (!Pre_Q(3) & (!Pre_Q(4) & !Pre_Q(5))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(2),
	datab => Pre_Q(3),
	datac => Pre_Q(4),
	datad => Pre_Q(5),
	combout => \Pre_Q~0_combout\);

-- Location: LCCOMB_X1_Y24_N2
\Pre_Q~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~3_combout\ = (\Pre_Q~0_combout\ & (Pre_Q(0))) # (!\Pre_Q~0_combout\ & ((Pre_Q(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(0),
	datac => Pre_Q(1),
	datad => \Pre_Q~0_combout\,
	combout => \Pre_Q~3_combout\);

-- Location: FF_X1_Y24_N3
\Pre_Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q~3_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(1));

-- Location: LCCOMB_X1_Y24_N18
\Pre_Q~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~1_combout\ = (Pre_Q(4)) # ((Pre_Q(3)) # (Pre_Q(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(4),
	datab => Pre_Q(3),
	datad => Pre_Q(2),
	combout => \Pre_Q~1_combout\);

-- Location: LCCOMB_X1_Y24_N26
\Pre_Q~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q~2_combout\ = (Pre_Q(1) & (((Pre_Q(0))))) # (!Pre_Q(1) & ((Pre_Q(0) & (!\Pre_Q~0_combout\)) # (!Pre_Q(0) & ((!\Pre_Q~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011000010110101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(1),
	datab => \Pre_Q~0_combout\,
	datac => Pre_Q(0),
	datad => \Pre_Q~1_combout\,
	combout => \Pre_Q~2_combout\);

-- Location: FF_X1_Y24_N27
\Pre_Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q~2_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(0));

-- Location: LCCOMB_X1_Y24_N4
\state[0]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state[0]~reg0feeder_combout\ = Pre_Q(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => Pre_Q(0),
	combout => \state[0]~reg0feeder_combout\);

-- Location: FF_X1_Y24_N5
\state[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state[0]~reg0feeder_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state[0]~reg0_q\);

-- Location: LCCOMB_X1_Y24_N8
\state[1]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state[1]~reg0feeder_combout\ = Pre_Q(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Pre_Q(1),
	combout => \state[1]~reg0feeder_combout\);

-- Location: FF_X1_Y24_N9
\state[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state[1]~reg0feeder_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state[1]~reg0_q\);

-- Location: LCCOMB_X1_Y24_N14
\state[2]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state[2]~reg0feeder_combout\ = Pre_Q(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => Pre_Q(2),
	combout => \state[2]~reg0feeder_combout\);

-- Location: FF_X1_Y24_N15
\state[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state[2]~reg0feeder_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state[2]~reg0_q\);

-- Location: LCCOMB_X1_Y24_N30
\state[3]~reg0feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state[3]~reg0feeder_combout\ = Pre_Q(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => Pre_Q(3),
	combout => \state[3]~reg0feeder_combout\);

-- Location: FF_X1_Y24_N31
\state[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \state[3]~reg0feeder_combout\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state[3]~reg0_q\);

-- Location: FF_X1_Y24_N25
\state[4]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => Pre_Q(4),
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state[4]~reg0_q\);

-- Location: FF_X1_Y24_N21
\state[5]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => Pre_Q(5),
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => VCC,
	ena => \ALT_INV_hold~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state[5]~reg0_q\);

ww_state(0) <= \state[0]~output_o\;

ww_state(1) <= \state[1]~output_o\;

ww_state(2) <= \state[2]~output_o\;

ww_state(3) <= \state[3]~output_o\;

ww_state(4) <= \state[4]~output_o\;

ww_state(5) <= \state[5]~output_o\;
END structure;


