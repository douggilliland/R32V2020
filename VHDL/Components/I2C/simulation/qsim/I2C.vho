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

-- DATE "07/08/2019 15:50:10"

-- 
-- Device: Altera EP4CE10E22C8 Package TQFP144
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
-- ~ALTERA_ASDO_DATA1~	=>  Location: PIN_6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_FLASH_nCE_nCSO~	=>  Location: PIN_8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DCLK~	=>  Location: PIN_12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_DATA0~	=>  Location: PIN_13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ~ALTERA_nCEO~	=>  Location: PIN_101,	 I/O Standard: 2.5 V,	 Current Strength: 8mA


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

ENTITY 	i2c IS
    PORT (
	RESET : IN std_logic;
	CPU_CLK : IN std_logic;
	I2C_4XCLK : IN std_logic;
	ENA : IN std_logic;
	ADRSEL : IN std_logic;
	DATA_IN : IN std_logic_vector(7 DOWNTO 0);
	DATA_OUT : OUT std_logic_vector(7 DOWNTO 0);
	WR : IN std_logic;
	I2C_SCL : INOUT std_logic;
	I2C_SDA : INOUT std_logic
	);
END i2c;

-- Design Ports Information
-- DATA_OUT[0]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_OUT[1]	=>  Location: PIN_127,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_OUT[2]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_OUT[3]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_OUT[4]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_OUT[5]	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_OUT[6]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_OUT[7]	=>  Location: PIN_128,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I2C_SCL	=>  Location: PIN_129,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I2C_SDA	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ADRSEL	=>  Location: PIN_126,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- I2C_4XCLK	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ENA	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- RESET	=>  Location: PIN_25,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- CPU_CLK	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- WR	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_IN[0]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_IN[1]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_IN[2]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_IN[3]	=>  Location: PIN_124,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_IN[4]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_IN[5]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_IN[6]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- DATA_IN[7]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF i2c IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_RESET : std_logic;
SIGNAL ww_CPU_CLK : std_logic;
SIGNAL ww_I2C_4XCLK : std_logic;
SIGNAL ww_ENA : std_logic;
SIGNAL ww_ADRSEL : std_logic;
SIGNAL ww_DATA_IN : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_DATA_OUT : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_WR : std_logic;
SIGNAL \RESET~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \CPU_CLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \I2C_4XCLK~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \I2C_SCL~input_o\ : std_logic;
SIGNAL \I2C_SCL~output_o\ : std_logic;
SIGNAL \I2C_SDA~output_o\ : std_logic;
SIGNAL \DATA_OUT[0]~output_o\ : std_logic;
SIGNAL \DATA_OUT[1]~output_o\ : std_logic;
SIGNAL \DATA_OUT[2]~output_o\ : std_logic;
SIGNAL \DATA_OUT[3]~output_o\ : std_logic;
SIGNAL \DATA_OUT[4]~output_o\ : std_logic;
SIGNAL \DATA_OUT[5]~output_o\ : std_logic;
SIGNAL \DATA_OUT[6]~output_o\ : std_logic;
SIGNAL \DATA_OUT[7]~output_o\ : std_logic;
SIGNAL \I2C_4XCLK~input_o\ : std_logic;
SIGNAL \I2C_4XCLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \phase~0_combout\ : std_logic;
SIGNAL \RESET~input_o\ : std_logic;
SIGNAL \RESET~inputclkctrl_outclk\ : std_logic;
SIGNAL \ENA~input_o\ : std_logic;
SIGNAL \nbit[0]~0_combout\ : std_logic;
SIGNAL \Add0~0_combout\ : std_logic;
SIGNAL \state~24_combout\ : std_logic;
SIGNAL \Mux11~0_combout\ : std_logic;
SIGNAL \state.s_data~0_combout\ : std_logic;
SIGNAL \CPU_CLK~input_o\ : std_logic;
SIGNAL \CPU_CLK~inputclkctrl_outclk\ : std_logic;
SIGNAL \DATA_IN[0]~input_o\ : std_logic;
SIGNAL \ADRSEL~input_o\ : std_logic;
SIGNAL \WR~input_o\ : std_logic;
SIGNAL \mode[1]~0_combout\ : std_logic;
SIGNAL \DATA_IN[1]~input_o\ : std_logic;
SIGNAL \go~feeder_combout\ : std_logic;
SIGNAL \process_1~1_combout\ : std_logic;
SIGNAL \process_1~2_combout\ : std_logic;
SIGNAL \go~q\ : std_logic;
SIGNAL \state~19_combout\ : std_logic;
SIGNAL \state.s_data~q\ : std_logic;
SIGNAL \nbit[0]~1_combout\ : std_logic;
SIGNAL \nbit[0]~3_combout\ : std_logic;
SIGNAL \nbit[0]~4_combout\ : std_logic;
SIGNAL \Add1~1_combout\ : std_logic;
SIGNAL \Add1~0_combout\ : std_logic;
SIGNAL \nbit[2]~2_combout\ : std_logic;
SIGNAL \state~20_combout\ : std_logic;
SIGNAL \state.s_ack~q\ : std_logic;
SIGNAL \state.s_stop~0_combout\ : std_logic;
SIGNAL \state.s_stop~1_combout\ : std_logic;
SIGNAL \state.s_stop~q\ : std_logic;
SIGNAL \state~18_combout\ : std_logic;
SIGNAL \state~23_combout\ : std_logic;
SIGNAL \state.s_idle~feeder_combout\ : std_logic;
SIGNAL \state.s_idle~q\ : std_logic;
SIGNAL \state~21_combout\ : std_logic;
SIGNAL \state~22_combout\ : std_logic;
SIGNAL \state.s_start~q\ : std_logic;
SIGNAL \scl~0_combout\ : std_logic;
SIGNAL \sda~0_combout\ : std_logic;
SIGNAL \scl~1_combout\ : std_logic;
SIGNAL \ack~2_combout\ : std_logic;
SIGNAL \scl~q\ : std_logic;
SIGNAL \sda~4_combout\ : std_logic;
SIGNAL \rw_bit~0_combout\ : std_logic;
SIGNAL \data_buf[0]~feeder_combout\ : std_logic;
SIGNAL \rw_flag~0_combout\ : std_logic;
SIGNAL \rw_flag~1_combout\ : std_logic;
SIGNAL \rw_flag~q\ : std_logic;
SIGNAL \rw_bit~1_combout\ : std_logic;
SIGNAL \rw_bit~q\ : std_logic;
SIGNAL \DATA_IN[7]~input_o\ : std_logic;
SIGNAL \DATA_IN[6]~input_o\ : std_logic;
SIGNAL \data_buf[6]~feeder_combout\ : std_logic;
SIGNAL \DATA_IN[5]~input_o\ : std_logic;
SIGNAL \DATA_IN[3]~input_o\ : std_logic;
SIGNAL \data_buf[3]~feeder_combout\ : std_logic;
SIGNAL \I2C_SDA~input_o\ : std_logic;
SIGNAL \shift_reg~0_combout\ : std_logic;
SIGNAL \shift_reg[0]~1_combout\ : std_logic;
SIGNAL \shift_reg~2_combout\ : std_logic;
SIGNAL \DATA_IN[2]~input_o\ : std_logic;
SIGNAL \data_buf[2]~feeder_combout\ : std_logic;
SIGNAL \shift_reg~3_combout\ : std_logic;
SIGNAL \shift_reg~4_combout\ : std_logic;
SIGNAL \DATA_IN[4]~input_o\ : std_logic;
SIGNAL \data_buf[4]~feeder_combout\ : std_logic;
SIGNAL \shift_reg~5_combout\ : std_logic;
SIGNAL \shift_reg~6_combout\ : std_logic;
SIGNAL \shift_reg~7_combout\ : std_logic;
SIGNAL \shift_reg~8_combout\ : std_logic;
SIGNAL \sda~1_combout\ : std_logic;
SIGNAL \sda~2_combout\ : std_logic;
SIGNAL \sda~3_combout\ : std_logic;
SIGNAL \sda~5_combout\ : std_logic;
SIGNAL \sda~q\ : std_logic;
SIGNAL \DATA_OUT~0_combout\ : std_logic;
SIGNAL \ack~0_combout\ : std_logic;
SIGNAL \ack~1_combout\ : std_logic;
SIGNAL \ack~q\ : std_logic;
SIGNAL \DATA_OUT~1_combout\ : std_logic;
SIGNAL \DATA_OUT~2_combout\ : std_logic;
SIGNAL \DATA_OUT~3_combout\ : std_logic;
SIGNAL \DATA_OUT~4_combout\ : std_logic;
SIGNAL \DATA_OUT~5_combout\ : std_logic;
SIGNAL \DATA_OUT~6_combout\ : std_logic;
SIGNAL \DATA_OUT~7_combout\ : std_logic;
SIGNAL phase : std_logic_vector(1 DOWNTO 0);
SIGNAL nbit : std_logic_vector(2 DOWNTO 0);
SIGNAL shift_reg : std_logic_vector(7 DOWNTO 0);
SIGNAL data_buf : std_logic_vector(7 DOWNTO 0);
SIGNAL mode : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_state.s_idle~q\ : std_logic;
SIGNAL \ALT_INV_RESET~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_sda~q\ : std_logic;
SIGNAL \ALT_INV_scl~q\ : std_logic;
SIGNAL \ALT_INV_process_1~1_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_RESET <= RESET;
ww_CPU_CLK <= CPU_CLK;
ww_I2C_4XCLK <= I2C_4XCLK;
ww_ENA <= ENA;
ww_ADRSEL <= ADRSEL;
ww_DATA_IN <= DATA_IN;
DATA_OUT <= ww_DATA_OUT;
ww_WR <= WR;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\RESET~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \RESET~input_o\);

\CPU_CLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \CPU_CLK~input_o\);

\I2C_4XCLK~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \I2C_4XCLK~input_o\);
\ALT_INV_state.s_idle~q\ <= NOT \state.s_idle~q\;
\ALT_INV_RESET~inputclkctrl_outclk\ <= NOT \RESET~inputclkctrl_outclk\;
\ALT_INV_sda~q\ <= NOT \sda~q\;
\ALT_INV_scl~q\ <= NOT \scl~q\;
\ALT_INV_process_1~1_combout\ <= NOT \process_1~1_combout\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X16_Y24_N23
\I2C_SCL~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_scl~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \I2C_SCL~output_o\);

-- Location: IOOBUF_X23_Y24_N16
\I2C_SDA~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "true")
-- pragma translate_on
PORT MAP (
	i => \ALT_INV_sda~q\,
	oe => VCC,
	devoe => ww_devoe,
	o => \I2C_SDA~output_o\);

-- Location: IOOBUF_X9_Y24_N9
\DATA_OUT[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DATA_OUT~0_combout\,
	devoe => ww_devoe,
	o => \DATA_OUT[0]~output_o\);

-- Location: IOOBUF_X16_Y24_N9
\DATA_OUT[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DATA_OUT~1_combout\,
	devoe => ww_devoe,
	o => \DATA_OUT[1]~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\DATA_OUT[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DATA_OUT~2_combout\,
	devoe => ww_devoe,
	o => \DATA_OUT[2]~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\DATA_OUT[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DATA_OUT~3_combout\,
	devoe => ww_devoe,
	o => \DATA_OUT[3]~output_o\);

-- Location: IOOBUF_X13_Y24_N16
\DATA_OUT[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DATA_OUT~4_combout\,
	devoe => ww_devoe,
	o => \DATA_OUT[4]~output_o\);

-- Location: IOOBUF_X13_Y24_N23
\DATA_OUT[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DATA_OUT~5_combout\,
	devoe => ww_devoe,
	o => \DATA_OUT[5]~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\DATA_OUT[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DATA_OUT~6_combout\,
	devoe => ww_devoe,
	o => \DATA_OUT[6]~output_o\);

-- Location: IOOBUF_X16_Y24_N16
\DATA_OUT[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \DATA_OUT~7_combout\,
	devoe => ww_devoe,
	o => \DATA_OUT[7]~output_o\);

-- Location: IOIBUF_X0_Y11_N8
\I2C_4XCLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_I2C_4XCLK,
	o => \I2C_4XCLK~input_o\);

-- Location: CLKCTRL_G2
\I2C_4XCLK~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \I2C_4XCLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \I2C_4XCLK~inputclkctrl_outclk\);

-- Location: LCCOMB_X22_Y20_N14
\phase~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \phase~0_combout\ = (!phase(0) & \state.s_idle~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => phase(0),
	datad => \state.s_idle~q\,
	combout => \phase~0_combout\);

-- Location: IOIBUF_X0_Y11_N22
\RESET~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_RESET,
	o => \RESET~input_o\);

-- Location: CLKCTRL_G3
\RESET~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \RESET~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \RESET~inputclkctrl_outclk\);

-- Location: IOIBUF_X34_Y20_N8
\ENA~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ENA,
	o => \ENA~input_o\);

-- Location: FF_X22_Y20_N15
\phase[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \phase~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase(0));

-- Location: LCCOMB_X22_Y20_N10
\nbit[0]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \nbit[0]~0_combout\ = (!\RESET~input_o\ & \ENA~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RESET~input_o\,
	datad => \ENA~input_o\,
	combout => \nbit[0]~0_combout\);

-- Location: LCCOMB_X24_Y20_N4
\Add0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add0~0_combout\ = phase(1) $ (phase(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => phase(1),
	datad => phase(0),
	combout => \Add0~0_combout\);

-- Location: FF_X24_Y20_N5
\phase[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \Add0~0_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sclr => \ALT_INV_state.s_idle~q\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => phase(1));

-- Location: LCCOMB_X22_Y20_N30
\state~24\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~24_combout\ = (\state.s_data~q\ & (((!phase(1)) # (!\nbit[2]~2_combout\)) # (!phase(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100110011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => phase(0),
	datab => \state.s_data~q\,
	datac => \nbit[2]~2_combout\,
	datad => phase(1),
	combout => \state~24_combout\);

-- Location: LCCOMB_X22_Y20_N24
\Mux11~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Mux11~0_combout\ = (phase(0) & phase(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => phase(0),
	datad => phase(1),
	combout => \Mux11~0_combout\);

-- Location: LCCOMB_X22_Y20_N28
\state.s_data~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s_data~0_combout\ = (\state.s_start~q\ & ((\Mux11~0_combout\))) # (!\state.s_start~q\ & (\state~24_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state~24_combout\,
	datab => \state.s_start~q\,
	datad => \Mux11~0_combout\,
	combout => \state.s_data~0_combout\);

-- Location: IOIBUF_X0_Y11_N15
\CPU_CLK~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_CPU_CLK,
	o => \CPU_CLK~input_o\);

-- Location: CLKCTRL_G4
\CPU_CLK~inputclkctrl\ : cycloneive_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \CPU_CLK~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \CPU_CLK~inputclkctrl_outclk\);

-- Location: IOIBUF_X34_Y19_N15
\DATA_IN[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA_IN(0),
	o => \DATA_IN[0]~input_o\);

-- Location: IOIBUF_X16_Y24_N1
\ADRSEL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ADRSEL,
	o => \ADRSEL~input_o\);

-- Location: IOIBUF_X23_Y24_N8
\WR~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_WR,
	o => \WR~input_o\);

-- Location: LCCOMB_X23_Y20_N20
\mode[1]~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \mode[1]~0_combout\ = (\ADRSEL~input_o\ & \WR~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADRSEL~input_o\,
	datad => \WR~input_o\,
	combout => \mode[1]~0_combout\);

-- Location: FF_X23_Y20_N25
\mode[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	asdata => \DATA_IN[0]~input_o\,
	sload => VCC,
	ena => \mode[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mode(0));

-- Location: IOIBUF_X30_Y24_N22
\DATA_IN[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA_IN(1),
	o => \DATA_IN[1]~input_o\);

-- Location: FF_X23_Y20_N23
\mode[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	asdata => \DATA_IN[1]~input_o\,
	sload => VCC,
	ena => \mode[1]~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => mode(1));

-- Location: LCCOMB_X22_Y20_N8
\go~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \go~feeder_combout\ = VCC

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	combout => \go~feeder_combout\);

-- Location: LCCOMB_X22_Y20_N20
\process_1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_1~1_combout\ = (\RESET~input_o\) # (\state.s_data~q\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \RESET~input_o\,
	datad => \state.s_data~q\,
	combout => \process_1~1_combout\);

-- Location: LCCOMB_X23_Y20_N24
\process_1~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \process_1~2_combout\ = (!\ADRSEL~input_o\ & \WR~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ADRSEL~input_o\,
	datad => \WR~input_o\,
	combout => \process_1~2_combout\);

-- Location: FF_X22_Y20_N9
go : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	d => \go~feeder_combout\,
	clrn => \ALT_INV_process_1~1_combout\,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \go~q\);

-- Location: LCCOMB_X23_Y20_N10
\state~19\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~19_combout\ = (\go~q\ & ((mode(1)) # (!mode(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => mode(0),
	datac => mode(1),
	datad => \go~q\,
	combout => \state~19_combout\);

-- Location: FF_X22_Y20_N29
\state.s_data\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \state.s_data~0_combout\,
	asdata => \state~19_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sload => \ALT_INV_state.s_idle~q\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s_data~q\);

-- Location: LCCOMB_X22_Y20_N12
\nbit[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \nbit[0]~1_combout\ = (\nbit[0]~0_combout\ & ((\state.s_idle~q\ & (\state.s_data~q\)) # (!\state.s_idle~q\ & ((\go~q\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nbit[0]~0_combout\,
	datab => \state.s_data~q\,
	datac => \go~q\,
	datad => \state.s_idle~q\,
	combout => \nbit[0]~1_combout\);

-- Location: LCCOMB_X22_Y20_N0
\nbit[0]~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \nbit[0]~3_combout\ = (\nbit[0]~1_combout\ & (((!\nbit[2]~2_combout\ & \Mux11~0_combout\)) # (!\state.s_idle~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010101000100010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nbit[0]~1_combout\,
	datab => \state.s_idle~q\,
	datac => \nbit[2]~2_combout\,
	datad => \Mux11~0_combout\,
	combout => \nbit[0]~3_combout\);

-- Location: LCCOMB_X21_Y20_N30
\nbit[0]~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \nbit[0]~4_combout\ = (\nbit[0]~3_combout\ & (!nbit(0) & \state.s_idle~q\)) # (!\nbit[0]~3_combout\ & (nbit(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \nbit[0]~3_combout\,
	datac => nbit(0),
	datad => \state.s_idle~q\,
	combout => \nbit[0]~4_combout\);

-- Location: FF_X21_Y20_N31
\nbit[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \nbit[0]~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => nbit(0));

-- Location: LCCOMB_X21_Y20_N2
\Add1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~1_combout\ = nbit(1) $ (nbit(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => nbit(1),
	datad => nbit(0),
	combout => \Add1~1_combout\);

-- Location: FF_X21_Y20_N3
\nbit[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \Add1~1_combout\,
	sclr => \ALT_INV_state.s_idle~q\,
	ena => \nbit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => nbit(1));

-- Location: LCCOMB_X21_Y20_N24
\Add1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Add1~0_combout\ = nbit(2) $ (((nbit(1) & nbit(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111100001111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => nbit(1),
	datab => nbit(0),
	datac => nbit(2),
	combout => \Add1~0_combout\);

-- Location: FF_X21_Y20_N25
\nbit[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \Add1~0_combout\,
	sclr => \ALT_INV_state.s_idle~q\,
	ena => \nbit[0]~3_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => nbit(2));

-- Location: LCCOMB_X21_Y20_N16
\nbit[2]~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \nbit[2]~2_combout\ = (nbit(2) & (nbit(0) & nbit(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => nbit(2),
	datac => nbit(0),
	datad => nbit(1),
	combout => \nbit[2]~2_combout\);

-- Location: LCCOMB_X22_Y20_N6
\state~20\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~20_combout\ = (\state.s_data~q\ & (\nbit[2]~2_combout\ & ((\Mux11~0_combout\)))) # (!\state.s_data~q\ & (((\state.s_ack~q\ & !\Mux11~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \nbit[2]~2_combout\,
	datab => \state.s_data~q\,
	datac => \state.s_ack~q\,
	datad => \Mux11~0_combout\,
	combout => \state~20_combout\);

-- Location: FF_X22_Y20_N7
\state.s_ack\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \state~20_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s_ack~q\);

-- Location: LCCOMB_X24_Y20_N20
\state.s_stop~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s_stop~0_combout\ = (\ENA~input_o\ & (mode(1) & (\state.s_ack~q\ & \Mux11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ENA~input_o\,
	datab => mode(1),
	datac => \state.s_ack~q\,
	datad => \Mux11~0_combout\,
	combout => \state.s_stop~0_combout\);

-- Location: LCCOMB_X24_Y20_N8
\state.s_stop~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s_stop~1_combout\ = (\state.s_stop~0_combout\) # ((\state.s_stop~q\ & ((!\Mux11~0_combout\) # (!\ENA~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111101110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ENA~input_o\,
	datab => \Mux11~0_combout\,
	datac => \state.s_stop~q\,
	datad => \state.s_stop~0_combout\,
	combout => \state.s_stop~1_combout\);

-- Location: FF_X24_Y20_N9
\state.s_stop\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \state.s_stop~1_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s_stop~q\);

-- Location: LCCOMB_X22_Y20_N4
\state~18\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~18_combout\ = (\state.s_ack~q\ & (((!mode(1))))) # (!\state.s_ack~q\ & (!\state.s_data~q\ & (!\state.s_stop~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000110101011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s_ack~q\,
	datab => \state.s_data~q\,
	datac => \state.s_stop~q\,
	datad => mode(1),
	combout => \state~18_combout\);

-- Location: LCCOMB_X22_Y20_N16
\state~23\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~23_combout\ = ((\state.s_start~q\) # ((!phase(1)) # (!\state~18_combout\))) # (!phase(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101111111111111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => phase(0),
	datab => \state.s_start~q\,
	datac => \state~18_combout\,
	datad => phase(1),
	combout => \state~23_combout\);

-- Location: LCCOMB_X22_Y20_N22
\state.s_idle~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \state.s_idle~feeder_combout\ = \state~23_combout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \state~23_combout\,
	combout => \state.s_idle~feeder_combout\);

-- Location: FF_X22_Y20_N23
\state.s_idle\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \state.s_idle~feeder_combout\,
	asdata => \go~q\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	sload => \ALT_INV_state.s_idle~q\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s_idle~q\);

-- Location: LCCOMB_X23_Y20_N30
\state~21\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~21_combout\ = (!\state.s_idle~q\ & (mode(0) & (!mode(1) & \go~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s_idle~q\,
	datab => mode(0),
	datac => mode(1),
	datad => \go~q\,
	combout => \state~21_combout\);

-- Location: LCCOMB_X22_Y20_N2
\state~22\ : cycloneive_lcell_comb
-- Equation(s):
-- \state~22_combout\ = (\state~21_combout\) # ((\state.s_idle~q\ & (\state.s_start~q\ & !\Mux11~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state~21_combout\,
	datab => \state.s_idle~q\,
	datac => \state.s_start~q\,
	datad => \Mux11~0_combout\,
	combout => \state~22_combout\);

-- Location: FF_X22_Y20_N3
\state.s_start\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \state~22_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	ena => \ENA~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \state.s_start~q\);

-- Location: LCCOMB_X23_Y20_N4
\scl~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \scl~0_combout\ = (phase(0) & (((!\scl~q\)))) # (!phase(0) & ((\state.s_start~q\ & ((!phase(1)) # (!\scl~q\))) # (!\state.s_start~q\ & ((phase(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011011100111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s_start~q\,
	datab => \scl~q\,
	datac => phase(0),
	datad => phase(1),
	combout => \scl~0_combout\);

-- Location: LCCOMB_X23_Y20_N26
\sda~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \sda~0_combout\ = (!\state.s_data~q\ & (!\state.s_ack~q\ & !\state.s_stop~q\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \state.s_data~q\,
	datac => \state.s_ack~q\,
	datad => \state.s_stop~q\,
	combout => \sda~0_combout\);

-- Location: LCCOMB_X23_Y20_N0
\scl~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \scl~1_combout\ = (!\scl~0_combout\ & ((\state.s_start~q\) # (!\sda~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010001100100011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s_start~q\,
	datab => \scl~0_combout\,
	datac => \sda~0_combout\,
	combout => \scl~1_combout\);

-- Location: LCCOMB_X23_Y20_N12
\ack~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \ack~2_combout\ = (\state.s_idle~q\ & \ENA~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010000010100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s_idle~q\,
	datac => \ENA~input_o\,
	combout => \ack~2_combout\);

-- Location: FF_X23_Y20_N1
scl : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \scl~1_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	ena => \ack~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \scl~q\);

-- Location: LCCOMB_X23_Y20_N8
\sda~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \sda~4_combout\ = (\state.s_start~q\ & ((phase(0) & (\sda~q\)) # (!phase(0) & ((phase(1)))))) # (!\state.s_start~q\ & ((\sda~q\) # ((phase(0) & !phase(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011010100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s_start~q\,
	datab => \sda~q\,
	datac => phase(0),
	datad => phase(1),
	combout => \sda~4_combout\);

-- Location: LCCOMB_X22_Y20_N18
\rw_bit~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rw_bit~0_combout\ = (!\state.s_idle~q\ & (!\RESET~input_o\ & (\go~q\ & \ENA~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s_idle~q\,
	datab => \RESET~input_o\,
	datac => \go~q\,
	datad => \ENA~input_o\,
	combout => \rw_bit~0_combout\);

-- Location: LCCOMB_X25_Y20_N26
\data_buf[0]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_buf[0]~feeder_combout\ = \DATA_IN[0]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \DATA_IN[0]~input_o\,
	combout => \data_buf[0]~feeder_combout\);

-- Location: FF_X25_Y20_N27
\data_buf[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	d => \data_buf[0]~feeder_combout\,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_buf(0));

-- Location: LCCOMB_X23_Y20_N14
\rw_flag~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \rw_flag~0_combout\ = (mode(0) & !mode(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => mode(0),
	datac => mode(1),
	combout => \rw_flag~0_combout\);

-- Location: LCCOMB_X24_Y20_N28
\rw_flag~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rw_flag~1_combout\ = (\rw_bit~0_combout\ & ((\rw_flag~0_combout\ & (data_buf(0))) # (!\rw_flag~0_combout\ & ((\rw_flag~q\))))) # (!\rw_bit~0_combout\ & (((\rw_flag~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101100011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rw_bit~0_combout\,
	datab => data_buf(0),
	datac => \rw_flag~q\,
	datad => \rw_flag~0_combout\,
	combout => \rw_flag~1_combout\);

-- Location: FF_X24_Y20_N29
rw_flag : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \rw_flag~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rw_flag~q\);

-- Location: LCCOMB_X24_Y20_N6
\rw_bit~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \rw_bit~1_combout\ = (\rw_bit~0_combout\ & (\rw_flag~q\ & ((!\rw_flag~0_combout\)))) # (!\rw_bit~0_combout\ & (((\rw_bit~q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000011011000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rw_bit~0_combout\,
	datab => \rw_flag~q\,
	datac => \rw_bit~q\,
	datad => \rw_flag~0_combout\,
	combout => \rw_bit~1_combout\);

-- Location: FF_X24_Y20_N7
rw_bit : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \rw_bit~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \rw_bit~q\);

-- Location: IOIBUF_X28_Y24_N22
\DATA_IN[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA_IN(7),
	o => \DATA_IN[7]~input_o\);

-- Location: FF_X25_Y20_N1
\data_buf[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	asdata => \DATA_IN[7]~input_o\,
	sload => VCC,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_buf(7));

-- Location: IOIBUF_X28_Y24_N8
\DATA_IN[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA_IN(6),
	o => \DATA_IN[6]~input_o\);

-- Location: LCCOMB_X25_Y20_N10
\data_buf[6]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_buf[6]~feeder_combout\ = \DATA_IN[6]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \DATA_IN[6]~input_o\,
	combout => \data_buf[6]~feeder_combout\);

-- Location: FF_X25_Y20_N11
\data_buf[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	d => \data_buf[6]~feeder_combout\,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_buf(6));

-- Location: IOIBUF_X30_Y24_N1
\DATA_IN[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA_IN(5),
	o => \DATA_IN[5]~input_o\);

-- Location: FF_X25_Y20_N21
\data_buf[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	asdata => \DATA_IN[5]~input_o\,
	sload => VCC,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_buf(5));

-- Location: IOIBUF_X18_Y24_N15
\DATA_IN[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA_IN(3),
	o => \DATA_IN[3]~input_o\);

-- Location: LCCOMB_X25_Y20_N12
\data_buf[3]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_buf[3]~feeder_combout\ = \DATA_IN[3]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \DATA_IN[3]~input_o\,
	combout => \data_buf[3]~feeder_combout\);

-- Location: FF_X25_Y20_N13
\data_buf[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	d => \data_buf[3]~feeder_combout\,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_buf(3));

-- Location: FF_X25_Y20_N29
\data_buf[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	asdata => \DATA_IN[1]~input_o\,
	sload => VCC,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_buf(1));

-- Location: IOIBUF_X23_Y24_N15
\I2C_SDA~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => I2C_SDA,
	o => \I2C_SDA~input_o\);

-- Location: LCCOMB_X25_Y20_N4
\shift_reg~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg~0_combout\ = (\state.s_idle~q\ & (\I2C_SDA~input_o\)) # (!\state.s_idle~q\ & ((data_buf(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \I2C_SDA~input_o\,
	datab => data_buf(0),
	datad => \state.s_idle~q\,
	combout => \shift_reg~0_combout\);

-- Location: LCCOMB_X22_Y20_N26
\shift_reg[0]~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg[0]~1_combout\ = (\nbit[0]~1_combout\ & (((phase(1) & !phase(0))) # (!\state.s_idle~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011101100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => phase(1),
	datab => \state.s_idle~q\,
	datac => phase(0),
	datad => \nbit[0]~1_combout\,
	combout => \shift_reg[0]~1_combout\);

-- Location: FF_X25_Y20_N5
\shift_reg[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \shift_reg~0_combout\,
	ena => \shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shift_reg(0));

-- Location: LCCOMB_X25_Y20_N30
\shift_reg~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg~2_combout\ = (\state.s_idle~q\ & ((shift_reg(0)))) # (!\state.s_idle~q\ & (data_buf(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data_buf(1),
	datac => shift_reg(0),
	datad => \state.s_idle~q\,
	combout => \shift_reg~2_combout\);

-- Location: FF_X25_Y20_N31
\shift_reg[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \shift_reg~2_combout\,
	ena => \shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shift_reg(1));

-- Location: IOIBUF_X28_Y24_N1
\DATA_IN[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA_IN(2),
	o => \DATA_IN[2]~input_o\);

-- Location: LCCOMB_X25_Y20_N2
\data_buf[2]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_buf[2]~feeder_combout\ = \DATA_IN[2]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \DATA_IN[2]~input_o\,
	combout => \data_buf[2]~feeder_combout\);

-- Location: FF_X25_Y20_N3
\data_buf[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	d => \data_buf[2]~feeder_combout\,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_buf(2));

-- Location: LCCOMB_X25_Y20_N8
\shift_reg~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg~3_combout\ = (\state.s_idle~q\ & (shift_reg(1))) # (!\state.s_idle~q\ & ((data_buf(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => shift_reg(1),
	datab => data_buf(2),
	datad => \state.s_idle~q\,
	combout => \shift_reg~3_combout\);

-- Location: FF_X25_Y20_N9
\shift_reg[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \shift_reg~3_combout\,
	ena => \shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shift_reg(2));

-- Location: LCCOMB_X25_Y20_N22
\shift_reg~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg~4_combout\ = (\state.s_idle~q\ & ((shift_reg(2)))) # (!\state.s_idle~q\ & (data_buf(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data_buf(3),
	datac => shift_reg(2),
	datad => \state.s_idle~q\,
	combout => \shift_reg~4_combout\);

-- Location: FF_X25_Y20_N23
\shift_reg[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \shift_reg~4_combout\,
	ena => \shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shift_reg(3));

-- Location: IOIBUF_X34_Y17_N22
\DATA_IN[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_DATA_IN(4),
	o => \DATA_IN[4]~input_o\);

-- Location: LCCOMB_X25_Y20_N6
\data_buf[4]~feeder\ : cycloneive_lcell_comb
-- Equation(s):
-- \data_buf[4]~feeder_combout\ = \DATA_IN[4]~input_o\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \DATA_IN[4]~input_o\,
	combout => \data_buf[4]~feeder_combout\);

-- Location: FF_X25_Y20_N7
\data_buf[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \CPU_CLK~inputclkctrl_outclk\,
	d => \data_buf[4]~feeder_combout\,
	ena => \process_1~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => data_buf(4));

-- Location: LCCOMB_X25_Y20_N18
\shift_reg~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg~5_combout\ = (\state.s_idle~q\ & (shift_reg(3))) # (!\state.s_idle~q\ & ((data_buf(4))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => shift_reg(3),
	datab => data_buf(4),
	datad => \state.s_idle~q\,
	combout => \shift_reg~5_combout\);

-- Location: FF_X25_Y20_N19
\shift_reg[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \shift_reg~5_combout\,
	ena => \shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shift_reg(4));

-- Location: LCCOMB_X25_Y20_N24
\shift_reg~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg~6_combout\ = (\state.s_idle~q\ & ((shift_reg(4)))) # (!\state.s_idle~q\ & (data_buf(5)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_buf(5),
	datab => shift_reg(4),
	datad => \state.s_idle~q\,
	combout => \shift_reg~6_combout\);

-- Location: FF_X25_Y20_N25
\shift_reg[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \shift_reg~6_combout\,
	ena => \shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shift_reg(5));

-- Location: LCCOMB_X25_Y20_N14
\shift_reg~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg~7_combout\ = (\state.s_idle~q\ & ((shift_reg(5)))) # (!\state.s_idle~q\ & (data_buf(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110000001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => data_buf(6),
	datac => \state.s_idle~q\,
	datad => shift_reg(5),
	combout => \shift_reg~7_combout\);

-- Location: FF_X25_Y20_N15
\shift_reg[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \shift_reg~7_combout\,
	ena => \shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shift_reg(6));

-- Location: LCCOMB_X25_Y20_N16
\shift_reg~8\ : cycloneive_lcell_comb
-- Equation(s):
-- \shift_reg~8_combout\ = (\state.s_idle~q\ & ((shift_reg(6)))) # (!\state.s_idle~q\ & (data_buf(7)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => data_buf(7),
	datab => shift_reg(6),
	datad => \state.s_idle~q\,
	combout => \shift_reg~8_combout\);

-- Location: FF_X25_Y20_N17
\shift_reg[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \shift_reg~8_combout\,
	ena => \shift_reg[0]~1_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => shift_reg(7));

-- Location: LCCOMB_X23_Y20_N6
\sda~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \sda~1_combout\ = (\state.s_data~q\ & (((shift_reg(7))))) # (!\state.s_data~q\ & (mode(1) & ((mode(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => mode(1),
	datab => \state.s_data~q\,
	datac => shift_reg(7),
	datad => mode(0),
	combout => \sda~1_combout\);

-- Location: LCCOMB_X23_Y20_N16
\sda~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \sda~2_combout\ = (\state.s_data~q\ & (!\rw_bit~q\ & ((!\sda~1_combout\)))) # (!\state.s_data~q\ & ((\state.s_ack~q\ & (\rw_bit~q\ & !\sda~1_combout\)) # (!\state.s_ack~q\ & ((\sda~1_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001101100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \rw_bit~q\,
	datab => \state.s_data~q\,
	datac => \state.s_ack~q\,
	datad => \sda~1_combout\,
	combout => \sda~2_combout\);

-- Location: LCCOMB_X23_Y20_N2
\sda~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \sda~3_combout\ = (!phase(1) & (phase(0) & !\sda~2_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => phase(1),
	datac => phase(0),
	datad => \sda~2_combout\,
	combout => \sda~3_combout\);

-- Location: LCCOMB_X23_Y20_N18
\sda~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \sda~5_combout\ = (\sda~4_combout\ & ((\state.s_start~q\) # ((!\sda~0_combout\ & !\sda~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000100010001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \state.s_start~q\,
	datab => \sda~4_combout\,
	datac => \sda~0_combout\,
	datad => \sda~3_combout\,
	combout => \sda~5_combout\);

-- Location: FF_X23_Y20_N19
sda : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \sda~5_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	ena => \ack~2_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \sda~q\);

-- Location: LCCOMB_X23_Y20_N28
\DATA_OUT~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \DATA_OUT~0_combout\ = (\ADRSEL~input_o\ & ((\go~q\) # ((\state.s_idle~q\)))) # (!\ADRSEL~input_o\ & (((shift_reg(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \go~q\,
	datab => \ADRSEL~input_o\,
	datac => shift_reg(0),
	datad => \state.s_idle~q\,
	combout => \DATA_OUT~0_combout\);

-- Location: LCCOMB_X24_Y20_N10
\ack~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \ack~0_combout\ = (\ENA~input_o\ & (\state.s_ack~q\ & (phase(1) & !phase(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ENA~input_o\,
	datab => \state.s_ack~q\,
	datac => phase(1),
	datad => phase(0),
	combout => \ack~0_combout\);

-- Location: LCCOMB_X24_Y20_N22
\ack~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \ack~1_combout\ = (\ack~0_combout\ & (\I2C_SDA~input_o\)) # (!\ack~0_combout\ & ((\ack~q\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \I2C_SDA~input_o\,
	datac => \ack~q\,
	datad => \ack~0_combout\,
	combout => \ack~1_combout\);

-- Location: FF_X24_Y20_N23
ack : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \I2C_4XCLK~inputclkctrl_outclk\,
	d => \ack~1_combout\,
	clrn => \ALT_INV_RESET~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \ack~q\);

-- Location: LCCOMB_X24_Y20_N24
\DATA_OUT~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \DATA_OUT~1_combout\ = (\ADRSEL~input_o\ & (\ack~q\)) # (!\ADRSEL~input_o\ & ((shift_reg(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011100010111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ack~q\,
	datab => \ADRSEL~input_o\,
	datac => shift_reg(1),
	combout => \DATA_OUT~1_combout\);

-- Location: LCCOMB_X21_Y20_N4
\DATA_OUT~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \DATA_OUT~2_combout\ = (\ADRSEL~input_o\) # (shift_reg(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ADRSEL~input_o\,
	datad => shift_reg(2),
	combout => \DATA_OUT~2_combout\);

-- Location: LCCOMB_X25_Y20_N0
\DATA_OUT~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \DATA_OUT~3_combout\ = (shift_reg(3)) # (\ADRSEL~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => shift_reg(3),
	datad => \ADRSEL~input_o\,
	combout => \DATA_OUT~3_combout\);

-- Location: LCCOMB_X21_Y20_N22
\DATA_OUT~4\ : cycloneive_lcell_comb
-- Equation(s):
-- \DATA_OUT~4_combout\ = (\ADRSEL~input_o\) # (shift_reg(4))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ADRSEL~input_o\,
	datad => shift_reg(4),
	combout => \DATA_OUT~4_combout\);

-- Location: LCCOMB_X21_Y20_N28
\DATA_OUT~5\ : cycloneive_lcell_comb
-- Equation(s):
-- \DATA_OUT~5_combout\ = (\ADRSEL~input_o\) # (shift_reg(5))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \ADRSEL~input_o\,
	datad => shift_reg(5),
	combout => \DATA_OUT~5_combout\);

-- Location: LCCOMB_X24_Y20_N2
\DATA_OUT~6\ : cycloneive_lcell_comb
-- Equation(s):
-- \DATA_OUT~6_combout\ = (shift_reg(6)) # (\ADRSEL~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => shift_reg(6),
	datac => \ADRSEL~input_o\,
	combout => \DATA_OUT~6_combout\);

-- Location: LCCOMB_X23_Y20_N22
\DATA_OUT~7\ : cycloneive_lcell_comb
-- Equation(s):
-- \DATA_OUT~7_combout\ = (shift_reg(7)) # (\ADRSEL~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => shift_reg(7),
	datad => \ADRSEL~input_o\,
	combout => \DATA_OUT~7_combout\);

-- Location: IOIBUF_X16_Y24_N22
\I2C_SCL~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => I2C_SCL,
	o => \I2C_SCL~input_o\);

ww_DATA_OUT(0) <= \DATA_OUT[0]~output_o\;

ww_DATA_OUT(1) <= \DATA_OUT[1]~output_o\;

ww_DATA_OUT(2) <= \DATA_OUT[2]~output_o\;

ww_DATA_OUT(3) <= \DATA_OUT[3]~output_o\;

ww_DATA_OUT(4) <= \DATA_OUT[4]~output_o\;

ww_DATA_OUT(5) <= \DATA_OUT[5]~output_o\;

ww_DATA_OUT(6) <= \DATA_OUT[6]~output_o\;

ww_DATA_OUT(7) <= \DATA_OUT[7]~output_o\;

I2C_SCL <= \I2C_SCL~output_o\;

I2C_SDA <= \I2C_SDA~output_o\;
END structure;


