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

-- DATE "05/15/2019 14:42:18"

-- 
-- Device: Altera EP4CE22E22C6 Package TQFP144
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

ENTITY 	COUNT_32 IS
    PORT (
	d : IN std_logic_vector(31 DOWNTO 0);
	ld : IN std_logic;
	inc : IN std_logic;
	dec : IN std_logic;
	clr : IN std_logic;
	clk : IN std_logic;
	q : OUT std_logic_vector(31 DOWNTO 0)
	);
END COUNT_32;

-- Design Ports Information
-- q[0]	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[1]	=>  Location: PIN_136,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[2]	=>  Location: PIN_103,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[3]	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[4]	=>  Location: PIN_144,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[5]	=>  Location: PIN_141,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[6]	=>  Location: PIN_42,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[7]	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[8]	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[9]	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[10]	=>  Location: PIN_135,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[11]	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[12]	=>  Location: PIN_132,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[13]	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[14]	=>  Location: PIN_110,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[15]	=>  Location: PIN_10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[16]	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[17]	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[18]	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[19]	=>  Location: PIN_31,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[20]	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[21]	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[22]	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[23]	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[24]	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[25]	=>  Location: PIN_39,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[26]	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[27]	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[28]	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[29]	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[30]	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- q[31]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_23,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[0]	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clr	=>  Location: PIN_24,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- ld	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- inc	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- dec	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[1]	=>  Location: PIN_104,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[2]	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[3]	=>  Location: PIN_142,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[4]	=>  Location: PIN_133,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[5]	=>  Location: PIN_105,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[6]	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[7]	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[8]	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[9]	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[10]	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[11]	=>  Location: PIN_11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[12]	=>  Location: PIN_121,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[13]	=>  Location: PIN_7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[14]	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[15]	=>  Location: PIN_137,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[16]	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[17]	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[18]	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[19]	=>  Location: PIN_72,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[20]	=>  Location: PIN_28,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[21]	=>  Location: PIN_33,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[22]	=>  Location: PIN_71,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[23]	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[24]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[25]	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[26]	=>  Location: PIN_88,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[27]	=>  Location: PIN_89,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[28]	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[29]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[30]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- d[31]	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF COUNT_32 IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_d : std_logic_vector(31 DOWNTO 0);
SIGNAL ww_ld : std_logic;
SIGNAL ww_inc : std_logic;
SIGNAL ww_dec : std_logic;
SIGNAL ww_clr : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_q : std_logic_vector(31 DOWNTO 0);
SIGNAL \clr~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \q[0]~output_o\ : std_logic;
SIGNAL \q[1]~output_o\ : std_logic;
SIGNAL \q[2]~output_o\ : std_logic;
SIGNAL \q[3]~output_o\ : std_logic;
SIGNAL \q[4]~output_o\ : std_logic;
SIGNAL \q[5]~output_o\ : std_logic;
SIGNAL \q[6]~output_o\ : std_logic;
SIGNAL \q[7]~output_o\ : std_logic;
SIGNAL \q[8]~output_o\ : std_logic;
SIGNAL \q[9]~output_o\ : std_logic;
SIGNAL \q[10]~output_o\ : std_logic;
SIGNAL \q[11]~output_o\ : std_logic;
SIGNAL \q[12]~output_o\ : std_logic;
SIGNAL \q[13]~output_o\ : std_logic;
SIGNAL \q[14]~output_o\ : std_logic;
SIGNAL \q[15]~output_o\ : std_logic;
SIGNAL \q[16]~output_o\ : std_logic;
SIGNAL \q[17]~output_o\ : std_logic;
SIGNAL \q[18]~output_o\ : std_logic;
SIGNAL \q[19]~output_o\ : std_logic;
SIGNAL \q[20]~output_o\ : std_logic;
SIGNAL \q[21]~output_o\ : std_logic;
SIGNAL \q[22]~output_o\ : std_logic;
SIGNAL \q[23]~output_o\ : std_logic;
SIGNAL \q[24]~output_o\ : std_logic;
SIGNAL \q[25]~output_o\ : std_logic;
SIGNAL \q[26]~output_o\ : std_logic;
SIGNAL \q[27]~output_o\ : std_logic;
SIGNAL \q[28]~output_o\ : std_logic;
SIGNAL \q[29]~output_o\ : std_logic;
SIGNAL \q[30]~output_o\ : std_logic;
SIGNAL \q[31]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \Pre_Q[0]~32_combout\ : std_logic;
SIGNAL \d[0]~input_o\ : std_logic;
SIGNAL \clr~input_o\ : std_logic;
SIGNAL \clr~inputclkctrl_outclk\ : std_logic;
SIGNAL \ld~input_o\ : std_logic;
SIGNAL \inc~input_o\ : std_logic;
SIGNAL \dec~input_o\ : std_logic;
SIGNAL \Pre_Q[0]~34_combout\ : std_logic;
SIGNAL \Pre_Q[0]~33\ : std_logic;
SIGNAL \Pre_Q[1]~35_combout\ : std_logic;
SIGNAL \d[1]~input_o\ : std_logic;
SIGNAL \Pre_Q[1]~36\ : std_logic;
SIGNAL \Pre_Q[2]~37_combout\ : std_logic;
SIGNAL \d[2]~input_o\ : std_logic;
SIGNAL \Pre_Q[2]~38\ : std_logic;
SIGNAL \Pre_Q[3]~39_combout\ : std_logic;
SIGNAL \d[3]~input_o\ : std_logic;
SIGNAL \Pre_Q[3]~40\ : std_logic;
SIGNAL \Pre_Q[4]~41_combout\ : std_logic;
SIGNAL \d[4]~input_o\ : std_logic;
SIGNAL \Pre_Q[4]~42\ : std_logic;
SIGNAL \Pre_Q[5]~43_combout\ : std_logic;
SIGNAL \d[5]~input_o\ : std_logic;
SIGNAL \Pre_Q[5]~44\ : std_logic;
SIGNAL \Pre_Q[6]~45_combout\ : std_logic;
SIGNAL \d[6]~input_o\ : std_logic;
SIGNAL \Pre_Q[6]~46\ : std_logic;
SIGNAL \Pre_Q[7]~47_combout\ : std_logic;
SIGNAL \d[7]~input_o\ : std_logic;
SIGNAL \Pre_Q[7]~48\ : std_logic;
SIGNAL \Pre_Q[8]~49_combout\ : std_logic;
SIGNAL \d[8]~input_o\ : std_logic;
SIGNAL \Pre_Q[8]~50\ : std_logic;
SIGNAL \Pre_Q[9]~51_combout\ : std_logic;
SIGNAL \d[9]~input_o\ : std_logic;
SIGNAL \Pre_Q[9]~52\ : std_logic;
SIGNAL \Pre_Q[10]~53_combout\ : std_logic;
SIGNAL \d[10]~input_o\ : std_logic;
SIGNAL \Pre_Q[10]~54\ : std_logic;
SIGNAL \Pre_Q[11]~55_combout\ : std_logic;
SIGNAL \d[11]~input_o\ : std_logic;
SIGNAL \Pre_Q[11]~56\ : std_logic;
SIGNAL \Pre_Q[12]~57_combout\ : std_logic;
SIGNAL \d[12]~input_o\ : std_logic;
SIGNAL \Pre_Q[12]~58\ : std_logic;
SIGNAL \Pre_Q[13]~59_combout\ : std_logic;
SIGNAL \d[13]~input_o\ : std_logic;
SIGNAL \Pre_Q[13]~60\ : std_logic;
SIGNAL \Pre_Q[14]~61_combout\ : std_logic;
SIGNAL \d[14]~input_o\ : std_logic;
SIGNAL \Pre_Q[14]~62\ : std_logic;
SIGNAL \Pre_Q[15]~63_combout\ : std_logic;
SIGNAL \d[15]~input_o\ : std_logic;
SIGNAL \Pre_Q[15]~64\ : std_logic;
SIGNAL \Pre_Q[16]~65_combout\ : std_logic;
SIGNAL \d[16]~input_o\ : std_logic;
SIGNAL \Pre_Q[16]~66\ : std_logic;
SIGNAL \Pre_Q[17]~67_combout\ : std_logic;
SIGNAL \d[17]~input_o\ : std_logic;
SIGNAL \Pre_Q[17]~68\ : std_logic;
SIGNAL \Pre_Q[18]~69_combout\ : std_logic;
SIGNAL \d[18]~input_o\ : std_logic;
SIGNAL \Pre_Q[18]~70\ : std_logic;
SIGNAL \Pre_Q[19]~71_combout\ : std_logic;
SIGNAL \d[19]~input_o\ : std_logic;
SIGNAL \Pre_Q[19]~72\ : std_logic;
SIGNAL \Pre_Q[20]~73_combout\ : std_logic;
SIGNAL \d[20]~input_o\ : std_logic;
SIGNAL \Pre_Q[20]~74\ : std_logic;
SIGNAL \Pre_Q[21]~75_combout\ : std_logic;
SIGNAL \d[21]~input_o\ : std_logic;
SIGNAL \Pre_Q[21]~76\ : std_logic;
SIGNAL \Pre_Q[22]~77_combout\ : std_logic;
SIGNAL \d[22]~input_o\ : std_logic;
SIGNAL \Pre_Q[22]~78\ : std_logic;
SIGNAL \Pre_Q[23]~79_combout\ : std_logic;
SIGNAL \d[23]~input_o\ : std_logic;
SIGNAL \Pre_Q[23]~80\ : std_logic;
SIGNAL \Pre_Q[24]~81_combout\ : std_logic;
SIGNAL \d[24]~input_o\ : std_logic;
SIGNAL \Pre_Q[24]~82\ : std_logic;
SIGNAL \Pre_Q[25]~83_combout\ : std_logic;
SIGNAL \d[25]~input_o\ : std_logic;
SIGNAL \Pre_Q[25]~84\ : std_logic;
SIGNAL \Pre_Q[26]~85_combout\ : std_logic;
SIGNAL \d[26]~input_o\ : std_logic;
SIGNAL \Pre_Q[26]~86\ : std_logic;
SIGNAL \Pre_Q[27]~87_combout\ : std_logic;
SIGNAL \d[27]~input_o\ : std_logic;
SIGNAL \Pre_Q[27]~88\ : std_logic;
SIGNAL \Pre_Q[28]~89_combout\ : std_logic;
SIGNAL \d[28]~input_o\ : std_logic;
SIGNAL \Pre_Q[28]~90\ : std_logic;
SIGNAL \Pre_Q[29]~91_combout\ : std_logic;
SIGNAL \d[29]~input_o\ : std_logic;
SIGNAL \Pre_Q[29]~92\ : std_logic;
SIGNAL \Pre_Q[30]~93_combout\ : std_logic;
SIGNAL \d[30]~input_o\ : std_logic;
SIGNAL \Pre_Q[30]~94\ : std_logic;
SIGNAL \Pre_Q[31]~95_combout\ : std_logic;
SIGNAL \d[31]~input_o\ : std_logic;
SIGNAL Pre_Q : std_logic_vector(31 DOWNTO 0);
SIGNAL \ALT_INV_clr~inputclkctrl_outclk\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_d <= d;
ww_ld <= ld;
ww_inc <= inc;
ww_dec <= dec;
ww_clr <= clr;
ww_clk <= clk;
q <= ww_q;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\clr~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clr~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_clr~inputclkctrl_outclk\ <= NOT \clr~inputclkctrl_outclk\;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X49_Y34_N9
\q[0]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(0),
	devoe => ww_devoe,
	o => \q[0]~output_o\);

-- Location: IOOBUF_X18_Y34_N23
\q[1]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(1),
	devoe => ww_devoe,
	o => \q[1]~output_o\);

-- Location: IOOBUF_X53_Y22_N9
\q[2]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(2),
	devoe => ww_devoe,
	o => \q[2]~output_o\);

-- Location: IOOBUF_X53_Y21_N23
\q[3]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(3),
	devoe => ww_devoe,
	o => \q[3]~output_o\);

-- Location: IOOBUF_X1_Y34_N9
\q[4]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(4),
	devoe => ww_devoe,
	o => \q[4]~output_o\);

-- Location: IOOBUF_X7_Y34_N16
\q[5]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(5),
	devoe => ww_devoe,
	o => \q[5]~output_o\);

-- Location: IOOBUF_X3_Y0_N2
\q[6]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(6),
	devoe => ww_devoe,
	o => \q[6]~output_o\);

-- Location: IOOBUF_X45_Y34_N16
\q[7]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(7),
	devoe => ww_devoe,
	o => \q[7]~output_o\);

-- Location: IOOBUF_X29_Y34_N16
\q[8]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(8),
	devoe => ww_devoe,
	o => \q[8]~output_o\);

-- Location: IOOBUF_X53_Y30_N9
\q[9]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(9),
	devoe => ww_devoe,
	o => \q[9]~output_o\);

-- Location: IOOBUF_X18_Y34_N2
\q[10]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(10),
	devoe => ww_devoe,
	o => \q[10]~output_o\);

-- Location: IOOBUF_X47_Y34_N23
\q[11]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(11),
	devoe => ww_devoe,
	o => \q[11]~output_o\);

-- Location: IOOBUF_X20_Y34_N9
\q[12]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(12),
	devoe => ww_devoe,
	o => \q[12]~output_o\);

-- Location: IOOBUF_X53_Y11_N2
\q[13]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(13),
	devoe => ww_devoe,
	o => \q[13]~output_o\);

-- Location: IOOBUF_X51_Y34_N23
\q[14]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(14),
	devoe => ww_devoe,
	o => \q[14]~output_o\);

-- Location: IOOBUF_X0_Y23_N16
\q[15]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(15),
	devoe => ww_devoe,
	o => \q[15]~output_o\);

-- Location: IOOBUF_X11_Y0_N23
\q[16]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(16),
	devoe => ww_devoe,
	o => \q[16]~output_o\);

-- Location: IOOBUF_X43_Y0_N16
\q[17]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(17),
	devoe => ww_devoe,
	o => \q[17]~output_o\);

-- Location: IOOBUF_X0_Y11_N2
\q[18]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(18),
	devoe => ww_devoe,
	o => \q[18]~output_o\);

-- Location: IOOBUF_X0_Y10_N23
\q[19]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(19),
	devoe => ww_devoe,
	o => \q[19]~output_o\);

-- Location: IOOBUF_X53_Y6_N23
\q[20]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(20),
	devoe => ww_devoe,
	o => \q[20]~output_o\);

-- Location: IOOBUF_X34_Y0_N23
\q[21]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(21),
	devoe => ww_devoe,
	o => \q[21]~output_o\);

-- Location: IOOBUF_X53_Y14_N9
\q[22]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(22),
	devoe => ww_devoe,
	o => \q[22]~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\q[23]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(23),
	devoe => ww_devoe,
	o => \q[23]~output_o\);

-- Location: IOOBUF_X53_Y13_N9
\q[24]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(24),
	devoe => ww_devoe,
	o => \q[24]~output_o\);

-- Location: IOOBUF_X1_Y0_N9
\q[25]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(25),
	devoe => ww_devoe,
	o => \q[25]~output_o\);

-- Location: IOOBUF_X20_Y0_N2
\q[26]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(26),
	devoe => ww_devoe,
	o => \q[26]~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\q[27]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(27),
	devoe => ww_devoe,
	o => \q[27]~output_o\);

-- Location: IOOBUF_X43_Y0_N23
\q[28]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(28),
	devoe => ww_devoe,
	o => \q[28]~output_o\);

-- Location: IOOBUF_X53_Y14_N2
\q[29]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(29),
	devoe => ww_devoe,
	o => \q[29]~output_o\);

-- Location: IOOBUF_X53_Y6_N16
\q[30]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(30),
	devoe => ww_devoe,
	o => \q[30]~output_o\);

-- Location: IOOBUF_X18_Y0_N9
\q[31]~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => Pre_Q(31),
	devoe => ww_devoe,
	o => \q[31]~output_o\);

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

-- Location: LCCOMB_X34_Y18_N0
\Pre_Q[0]~32\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[0]~32_combout\ = Pre_Q(0) $ (VCC)
-- \Pre_Q[0]~33\ = CARRY(Pre_Q(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => Pre_Q(0),
	datad => VCC,
	combout => \Pre_Q[0]~32_combout\,
	cout => \Pre_Q[0]~33\);

-- Location: IOIBUF_X27_Y0_N8
\d[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(0),
	o => \d[0]~input_o\);

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

-- Location: IOIBUF_X27_Y0_N1
\ld~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_ld,
	o => \ld~input_o\);

-- Location: IOIBUF_X36_Y0_N22
\inc~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_inc,
	o => \inc~input_o\);

-- Location: IOIBUF_X38_Y0_N1
\dec~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_dec,
	o => \dec~input_o\);

-- Location: LCCOMB_X34_Y16_N8
\Pre_Q[0]~34\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[0]~34_combout\ = (\ld~input_o\) # ((\inc~input_o\) # (\dec~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ld~input_o\,
	datab => \inc~input_o\,
	datad => \dec~input_o\,
	combout => \Pre_Q[0]~34_combout\);

-- Location: FF_X34_Y18_N1
\Pre_Q[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[0]~32_combout\,
	asdata => \d[0]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(0));

-- Location: LCCOMB_X34_Y18_N2
\Pre_Q[1]~35\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[1]~35_combout\ = (\inc~input_o\ & ((Pre_Q(1) & (!\Pre_Q[0]~33\)) # (!Pre_Q(1) & ((\Pre_Q[0]~33\) # (GND))))) # (!\inc~input_o\ & ((Pre_Q(1) & (\Pre_Q[0]~33\ & VCC)) # (!Pre_Q(1) & (!\Pre_Q[0]~33\))))
-- \Pre_Q[1]~36\ = CARRY((\inc~input_o\ & ((!\Pre_Q[0]~33\) # (!Pre_Q(1)))) # (!\inc~input_o\ & (!Pre_Q(1) & !\Pre_Q[0]~33\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(1),
	datad => VCC,
	cin => \Pre_Q[0]~33\,
	combout => \Pre_Q[1]~35_combout\,
	cout => \Pre_Q[1]~36\);

-- Location: IOIBUF_X53_Y22_N1
\d[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(1),
	o => \d[1]~input_o\);

-- Location: FF_X34_Y18_N3
\Pre_Q[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[1]~35_combout\,
	asdata => \d[1]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(1));

-- Location: LCCOMB_X34_Y18_N4
\Pre_Q[2]~37\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[2]~37_combout\ = ((Pre_Q(2) $ (\inc~input_o\ $ (\Pre_Q[1]~36\)))) # (GND)
-- \Pre_Q[2]~38\ = CARRY((Pre_Q(2) & ((!\Pre_Q[1]~36\) # (!\inc~input_o\))) # (!Pre_Q(2) & (!\inc~input_o\ & !\Pre_Q[1]~36\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(2),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[1]~36\,
	combout => \Pre_Q[2]~37_combout\,
	cout => \Pre_Q[2]~38\);

-- Location: IOIBUF_X45_Y34_N8
\d[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(2),
	o => \d[2]~input_o\);

-- Location: FF_X34_Y18_N5
\Pre_Q[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[2]~37_combout\,
	asdata => \d[2]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(2));

-- Location: LCCOMB_X34_Y18_N6
\Pre_Q[3]~39\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[3]~39_combout\ = (Pre_Q(3) & ((\inc~input_o\ & (!\Pre_Q[2]~38\)) # (!\inc~input_o\ & (\Pre_Q[2]~38\ & VCC)))) # (!Pre_Q(3) & ((\inc~input_o\ & ((\Pre_Q[2]~38\) # (GND))) # (!\inc~input_o\ & (!\Pre_Q[2]~38\))))
-- \Pre_Q[3]~40\ = CARRY((Pre_Q(3) & (\inc~input_o\ & !\Pre_Q[2]~38\)) # (!Pre_Q(3) & ((\inc~input_o\) # (!\Pre_Q[2]~38\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(3),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[2]~38\,
	combout => \Pre_Q[3]~39_combout\,
	cout => \Pre_Q[3]~40\);

-- Location: IOIBUF_X3_Y34_N1
\d[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(3),
	o => \d[3]~input_o\);

-- Location: FF_X34_Y18_N7
\Pre_Q[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[3]~39_combout\,
	asdata => \d[3]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(3));

-- Location: LCCOMB_X34_Y18_N8
\Pre_Q[4]~41\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[4]~41_combout\ = ((\inc~input_o\ $ (Pre_Q(4) $ (\Pre_Q[3]~40\)))) # (GND)
-- \Pre_Q[4]~42\ = CARRY((\inc~input_o\ & (Pre_Q(4) & !\Pre_Q[3]~40\)) # (!\inc~input_o\ & ((Pre_Q(4)) # (!\Pre_Q[3]~40\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(4),
	datad => VCC,
	cin => \Pre_Q[3]~40\,
	combout => \Pre_Q[4]~41_combout\,
	cout => \Pre_Q[4]~42\);

-- Location: IOIBUF_X20_Y34_N15
\d[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(4),
	o => \d[4]~input_o\);

-- Location: FF_X34_Y18_N9
\Pre_Q[4]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[4]~41_combout\,
	asdata => \d[4]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(4));

-- Location: LCCOMB_X34_Y18_N10
\Pre_Q[5]~43\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[5]~43_combout\ = (Pre_Q(5) & ((\inc~input_o\ & (!\Pre_Q[4]~42\)) # (!\inc~input_o\ & (\Pre_Q[4]~42\ & VCC)))) # (!Pre_Q(5) & ((\inc~input_o\ & ((\Pre_Q[4]~42\) # (GND))) # (!\inc~input_o\ & (!\Pre_Q[4]~42\))))
-- \Pre_Q[5]~44\ = CARRY((Pre_Q(5) & (\inc~input_o\ & !\Pre_Q[4]~42\)) # (!Pre_Q(5) & ((\inc~input_o\) # (!\Pre_Q[4]~42\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(5),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[4]~42\,
	combout => \Pre_Q[5]~43_combout\,
	cout => \Pre_Q[5]~44\);

-- Location: IOIBUF_X53_Y24_N22
\d[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(5),
	o => \d[5]~input_o\);

-- Location: FF_X34_Y18_N11
\Pre_Q[5]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[5]~43_combout\,
	asdata => \d[5]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(5));

-- Location: LCCOMB_X34_Y18_N12
\Pre_Q[6]~45\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[6]~45_combout\ = ((Pre_Q(6) $ (\inc~input_o\ $ (\Pre_Q[5]~44\)))) # (GND)
-- \Pre_Q[6]~46\ = CARRY((Pre_Q(6) & ((!\Pre_Q[5]~44\) # (!\inc~input_o\))) # (!Pre_Q(6) & (!\inc~input_o\ & !\Pre_Q[5]~44\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(6),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[5]~44\,
	combout => \Pre_Q[6]~45_combout\,
	cout => \Pre_Q[6]~46\);

-- Location: IOIBUF_X38_Y34_N15
\d[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(6),
	o => \d[6]~input_o\);

-- Location: FF_X34_Y18_N13
\Pre_Q[6]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[6]~45_combout\,
	asdata => \d[6]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(6));

-- Location: LCCOMB_X34_Y18_N14
\Pre_Q[7]~47\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[7]~47_combout\ = (\inc~input_o\ & ((Pre_Q(7) & (!\Pre_Q[6]~46\)) # (!Pre_Q(7) & ((\Pre_Q[6]~46\) # (GND))))) # (!\inc~input_o\ & ((Pre_Q(7) & (\Pre_Q[6]~46\ & VCC)) # (!Pre_Q(7) & (!\Pre_Q[6]~46\))))
-- \Pre_Q[7]~48\ = CARRY((\inc~input_o\ & ((!\Pre_Q[6]~46\) # (!Pre_Q(7)))) # (!\inc~input_o\ & (!Pre_Q(7) & !\Pre_Q[6]~46\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(7),
	datad => VCC,
	cin => \Pre_Q[6]~46\,
	combout => \Pre_Q[7]~47_combout\,
	cout => \Pre_Q[7]~48\);

-- Location: IOIBUF_X45_Y34_N1
\d[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(7),
	o => \d[7]~input_o\);

-- Location: FF_X34_Y18_N15
\Pre_Q[7]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[7]~47_combout\,
	asdata => \d[7]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(7));

-- Location: LCCOMB_X34_Y18_N16
\Pre_Q[8]~49\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[8]~49_combout\ = ((\inc~input_o\ $ (Pre_Q(8) $ (\Pre_Q[7]~48\)))) # (GND)
-- \Pre_Q[8]~50\ = CARRY((\inc~input_o\ & (Pre_Q(8) & !\Pre_Q[7]~48\)) # (!\inc~input_o\ & ((Pre_Q(8)) # (!\Pre_Q[7]~48\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(8),
	datad => VCC,
	cin => \Pre_Q[7]~48\,
	combout => \Pre_Q[8]~49_combout\,
	cout => \Pre_Q[8]~50\);

-- Location: IOIBUF_X53_Y20_N22
\d[8]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(8),
	o => \d[8]~input_o\);

-- Location: FF_X34_Y18_N17
\Pre_Q[8]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[8]~49_combout\,
	asdata => \d[8]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(8));

-- Location: LCCOMB_X34_Y18_N18
\Pre_Q[9]~51\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[9]~51_combout\ = (\inc~input_o\ & ((Pre_Q(9) & (!\Pre_Q[8]~50\)) # (!Pre_Q(9) & ((\Pre_Q[8]~50\) # (GND))))) # (!\inc~input_o\ & ((Pre_Q(9) & (\Pre_Q[8]~50\ & VCC)) # (!Pre_Q(9) & (!\Pre_Q[8]~50\))))
-- \Pre_Q[9]~52\ = CARRY((\inc~input_o\ & ((!\Pre_Q[8]~50\) # (!Pre_Q(9)))) # (!\inc~input_o\ & (!Pre_Q(9) & !\Pre_Q[8]~50\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(9),
	datad => VCC,
	cin => \Pre_Q[8]~50\,
	combout => \Pre_Q[9]~51_combout\,
	cout => \Pre_Q[9]~52\);

-- Location: IOIBUF_X34_Y0_N1
\d[9]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(9),
	o => \d[9]~input_o\);

-- Location: FF_X34_Y18_N19
\Pre_Q[9]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[9]~51_combout\,
	asdata => \d[9]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(9));

-- Location: LCCOMB_X34_Y18_N20
\Pre_Q[10]~53\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[10]~53_combout\ = ((\inc~input_o\ $ (Pre_Q(10) $ (\Pre_Q[9]~52\)))) # (GND)
-- \Pre_Q[10]~54\ = CARRY((\inc~input_o\ & (Pre_Q(10) & !\Pre_Q[9]~52\)) # (!\inc~input_o\ & ((Pre_Q(10)) # (!\Pre_Q[9]~52\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(10),
	datad => VCC,
	cin => \Pre_Q[9]~52\,
	combout => \Pre_Q[10]~53_combout\,
	cout => \Pre_Q[10]~54\);

-- Location: IOIBUF_X5_Y0_N15
\d[10]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(10),
	o => \d[10]~input_o\);

-- Location: FF_X34_Y18_N21
\Pre_Q[10]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[10]~53_combout\,
	asdata => \d[10]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(10));

-- Location: LCCOMB_X34_Y18_N22
\Pre_Q[11]~55\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[11]~55_combout\ = (Pre_Q(11) & ((\inc~input_o\ & (!\Pre_Q[10]~54\)) # (!\inc~input_o\ & (\Pre_Q[10]~54\ & VCC)))) # (!Pre_Q(11) & ((\inc~input_o\ & ((\Pre_Q[10]~54\) # (GND))) # (!\inc~input_o\ & (!\Pre_Q[10]~54\))))
-- \Pre_Q[11]~56\ = CARRY((Pre_Q(11) & (\inc~input_o\ & !\Pre_Q[10]~54\)) # (!Pre_Q(11) & ((\inc~input_o\) # (!\Pre_Q[10]~54\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(11),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[10]~54\,
	combout => \Pre_Q[11]~55_combout\,
	cout => \Pre_Q[11]~56\);

-- Location: IOIBUF_X0_Y23_N22
\d[11]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(11),
	o => \d[11]~input_o\);

-- Location: FF_X34_Y18_N23
\Pre_Q[11]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[11]~55_combout\,
	asdata => \d[11]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(11));

-- Location: LCCOMB_X34_Y18_N24
\Pre_Q[12]~57\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[12]~57_combout\ = ((\inc~input_o\ $ (Pre_Q(12) $ (\Pre_Q[11]~56\)))) # (GND)
-- \Pre_Q[12]~58\ = CARRY((\inc~input_o\ & (Pre_Q(12) & !\Pre_Q[11]~56\)) # (!\inc~input_o\ & ((Pre_Q(12)) # (!\Pre_Q[11]~56\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(12),
	datad => VCC,
	cin => \Pre_Q[11]~56\,
	combout => \Pre_Q[12]~57_combout\,
	cout => \Pre_Q[12]~58\);

-- Location: IOIBUF_X34_Y34_N1
\d[12]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(12),
	o => \d[12]~input_o\);

-- Location: FF_X34_Y18_N25
\Pre_Q[12]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[12]~57_combout\,
	asdata => \d[12]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(12));

-- Location: LCCOMB_X34_Y18_N26
\Pre_Q[13]~59\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[13]~59_combout\ = (Pre_Q(13) & ((\inc~input_o\ & (!\Pre_Q[12]~58\)) # (!\inc~input_o\ & (\Pre_Q[12]~58\ & VCC)))) # (!Pre_Q(13) & ((\inc~input_o\ & ((\Pre_Q[12]~58\) # (GND))) # (!\inc~input_o\ & (!\Pre_Q[12]~58\))))
-- \Pre_Q[13]~60\ = CARRY((Pre_Q(13) & (\inc~input_o\ & !\Pre_Q[12]~58\)) # (!Pre_Q(13) & ((\inc~input_o\) # (!\Pre_Q[12]~58\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(13),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[12]~58\,
	combout => \Pre_Q[13]~59_combout\,
	cout => \Pre_Q[13]~60\);

-- Location: IOIBUF_X0_Y26_N15
\d[13]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(13),
	o => \d[13]~input_o\);

-- Location: FF_X34_Y18_N27
\Pre_Q[13]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[13]~59_combout\,
	asdata => \d[13]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(13));

-- Location: LCCOMB_X34_Y18_N28
\Pre_Q[14]~61\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[14]~61_combout\ = ((\inc~input_o\ $ (Pre_Q(14) $ (\Pre_Q[13]~60\)))) # (GND)
-- \Pre_Q[14]~62\ = CARRY((\inc~input_o\ & (Pre_Q(14) & !\Pre_Q[13]~60\)) # (!\inc~input_o\ & ((Pre_Q(14)) # (!\Pre_Q[13]~60\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(14),
	datad => VCC,
	cin => \Pre_Q[13]~60\,
	combout => \Pre_Q[14]~61_combout\,
	cout => \Pre_Q[14]~62\);

-- Location: IOIBUF_X38_Y34_N1
\d[14]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(14),
	o => \d[14]~input_o\);

-- Location: FF_X34_Y18_N29
\Pre_Q[14]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[14]~61_combout\,
	asdata => \d[14]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(14));

-- Location: LCCOMB_X34_Y18_N30
\Pre_Q[15]~63\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[15]~63_combout\ = (Pre_Q(15) & ((\inc~input_o\ & (!\Pre_Q[14]~62\)) # (!\inc~input_o\ & (\Pre_Q[14]~62\ & VCC)))) # (!Pre_Q(15) & ((\inc~input_o\ & ((\Pre_Q[14]~62\) # (GND))) # (!\inc~input_o\ & (!\Pre_Q[14]~62\))))
-- \Pre_Q[15]~64\ = CARRY((Pre_Q(15) & (\inc~input_o\ & !\Pre_Q[14]~62\)) # (!Pre_Q(15) & ((\inc~input_o\) # (!\Pre_Q[14]~62\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(15),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[14]~62\,
	combout => \Pre_Q[15]~63_combout\,
	cout => \Pre_Q[15]~64\);

-- Location: IOIBUF_X16_Y34_N15
\d[15]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(15),
	o => \d[15]~input_o\);

-- Location: FF_X34_Y18_N31
\Pre_Q[15]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[15]~63_combout\,
	asdata => \d[15]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(15));

-- Location: LCCOMB_X34_Y17_N0
\Pre_Q[16]~65\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[16]~65_combout\ = ((Pre_Q(16) $ (\inc~input_o\ $ (\Pre_Q[15]~64\)))) # (GND)
-- \Pre_Q[16]~66\ = CARRY((Pre_Q(16) & ((!\Pre_Q[15]~64\) # (!\inc~input_o\))) # (!Pre_Q(16) & (!\inc~input_o\ & !\Pre_Q[15]~64\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(16),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[15]~64\,
	combout => \Pre_Q[16]~65_combout\,
	cout => \Pre_Q[16]~66\);

-- Location: IOIBUF_X38_Y0_N8
\d[16]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(16),
	o => \d[16]~input_o\);

-- Location: FF_X34_Y17_N1
\Pre_Q[16]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[16]~65_combout\,
	asdata => \d[16]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(16));

-- Location: LCCOMB_X34_Y17_N2
\Pre_Q[17]~67\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[17]~67_combout\ = (Pre_Q(17) & ((\inc~input_o\ & (!\Pre_Q[16]~66\)) # (!\inc~input_o\ & (\Pre_Q[16]~66\ & VCC)))) # (!Pre_Q(17) & ((\inc~input_o\ & ((\Pre_Q[16]~66\) # (GND))) # (!\inc~input_o\ & (!\Pre_Q[16]~66\))))
-- \Pre_Q[17]~68\ = CARRY((Pre_Q(17) & (\inc~input_o\ & !\Pre_Q[16]~66\)) # (!Pre_Q(17) & ((\inc~input_o\) # (!\Pre_Q[16]~66\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(17),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[16]~66\,
	combout => \Pre_Q[17]~67_combout\,
	cout => \Pre_Q[17]~68\);

-- Location: IOIBUF_X27_Y0_N22
\d[17]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(17),
	o => \d[17]~input_o\);

-- Location: FF_X34_Y17_N3
\Pre_Q[17]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[17]~67_combout\,
	asdata => \d[17]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(17));

-- Location: LCCOMB_X34_Y17_N4
\Pre_Q[18]~69\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[18]~69_combout\ = ((Pre_Q(18) $ (\inc~input_o\ $ (\Pre_Q[17]~68\)))) # (GND)
-- \Pre_Q[18]~70\ = CARRY((Pre_Q(18) & ((!\Pre_Q[17]~68\) # (!\inc~input_o\))) # (!Pre_Q(18) & (!\inc~input_o\ & !\Pre_Q[17]~68\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(18),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[17]~68\,
	combout => \Pre_Q[18]~69_combout\,
	cout => \Pre_Q[18]~70\);

-- Location: IOIBUF_X27_Y0_N15
\d[18]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(18),
	o => \d[18]~input_o\);

-- Location: FF_X34_Y17_N5
\Pre_Q[18]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[18]~69_combout\,
	asdata => \d[18]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(18));

-- Location: LCCOMB_X34_Y17_N6
\Pre_Q[19]~71\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[19]~71_combout\ = (Pre_Q(19) & ((\inc~input_o\ & (!\Pre_Q[18]~70\)) # (!\inc~input_o\ & (\Pre_Q[18]~70\ & VCC)))) # (!Pre_Q(19) & ((\inc~input_o\ & ((\Pre_Q[18]~70\) # (GND))) # (!\inc~input_o\ & (!\Pre_Q[18]~70\))))
-- \Pre_Q[19]~72\ = CARRY((Pre_Q(19) & (\inc~input_o\ & !\Pre_Q[18]~70\)) # (!Pre_Q(19) & ((\inc~input_o\) # (!\Pre_Q[18]~70\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(19),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[18]~70\,
	combout => \Pre_Q[19]~71_combout\,
	cout => \Pre_Q[19]~72\);

-- Location: IOIBUF_X49_Y0_N1
\d[19]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(19),
	o => \d[19]~input_o\);

-- Location: FF_X34_Y17_N7
\Pre_Q[19]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[19]~71_combout\,
	asdata => \d[19]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(19));

-- Location: LCCOMB_X34_Y17_N8
\Pre_Q[20]~73\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[20]~73_combout\ = ((Pre_Q(20) $ (\inc~input_o\ $ (\Pre_Q[19]~72\)))) # (GND)
-- \Pre_Q[20]~74\ = CARRY((Pre_Q(20) & ((!\Pre_Q[19]~72\) # (!\inc~input_o\))) # (!Pre_Q(20) & (!\inc~input_o\ & !\Pre_Q[19]~72\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(20),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[19]~72\,
	combout => \Pre_Q[20]~73_combout\,
	cout => \Pre_Q[20]~74\);

-- Location: IOIBUF_X0_Y14_N1
\d[20]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(20),
	o => \d[20]~input_o\);

-- Location: FF_X34_Y17_N9
\Pre_Q[20]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[20]~73_combout\,
	asdata => \d[20]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(20));

-- Location: LCCOMB_X34_Y17_N10
\Pre_Q[21]~75\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[21]~75_combout\ = (Pre_Q(21) & ((\inc~input_o\ & (!\Pre_Q[20]~74\)) # (!\inc~input_o\ & (\Pre_Q[20]~74\ & VCC)))) # (!Pre_Q(21) & ((\inc~input_o\ & ((\Pre_Q[20]~74\) # (GND))) # (!\inc~input_o\ & (!\Pre_Q[20]~74\))))
-- \Pre_Q[21]~76\ = CARRY((Pre_Q(21) & (\inc~input_o\ & !\Pre_Q[20]~74\)) # (!Pre_Q(21) & ((\inc~input_o\) # (!\Pre_Q[20]~74\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100101001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(21),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[20]~74\,
	combout => \Pre_Q[21]~75_combout\,
	cout => \Pre_Q[21]~76\);

-- Location: IOIBUF_X0_Y6_N15
\d[21]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(21),
	o => \d[21]~input_o\);

-- Location: FF_X34_Y17_N11
\Pre_Q[21]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[21]~75_combout\,
	asdata => \d[21]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(21));

-- Location: LCCOMB_X34_Y17_N12
\Pre_Q[22]~77\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[22]~77_combout\ = ((Pre_Q(22) $ (\inc~input_o\ $ (\Pre_Q[21]~76\)))) # (GND)
-- \Pre_Q[22]~78\ = CARRY((Pre_Q(22) & ((!\Pre_Q[21]~76\) # (!\inc~input_o\))) # (!Pre_Q(22) & (!\inc~input_o\ & !\Pre_Q[21]~76\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011000101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(22),
	datab => \inc~input_o\,
	datad => VCC,
	cin => \Pre_Q[21]~76\,
	combout => \Pre_Q[22]~77_combout\,
	cout => \Pre_Q[22]~78\);

-- Location: IOIBUF_X49_Y0_N8
\d[22]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(22),
	o => \d[22]~input_o\);

-- Location: FF_X34_Y17_N13
\Pre_Q[22]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[22]~77_combout\,
	asdata => \d[22]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(22));

-- Location: LCCOMB_X34_Y17_N14
\Pre_Q[23]~79\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[23]~79_combout\ = (\inc~input_o\ & ((Pre_Q(23) & (!\Pre_Q[22]~78\)) # (!Pre_Q(23) & ((\Pre_Q[22]~78\) # (GND))))) # (!\inc~input_o\ & ((Pre_Q(23) & (\Pre_Q[22]~78\ & VCC)) # (!Pre_Q(23) & (!\Pre_Q[22]~78\))))
-- \Pre_Q[23]~80\ = CARRY((\inc~input_o\ & ((!\Pre_Q[22]~78\) # (!Pre_Q(23)))) # (!\inc~input_o\ & (!Pre_Q(23) & !\Pre_Q[22]~78\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(23),
	datad => VCC,
	cin => \Pre_Q[22]~78\,
	combout => \Pre_Q[23]~79_combout\,
	cout => \Pre_Q[23]~80\);

-- Location: IOIBUF_X47_Y0_N22
\d[23]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(23),
	o => \d[23]~input_o\);

-- Location: FF_X34_Y17_N15
\Pre_Q[23]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[23]~79_combout\,
	asdata => \d[23]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(23));

-- Location: LCCOMB_X34_Y17_N16
\Pre_Q[24]~81\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[24]~81_combout\ = ((\inc~input_o\ $ (Pre_Q(24) $ (\Pre_Q[23]~80\)))) # (GND)
-- \Pre_Q[24]~82\ = CARRY((\inc~input_o\ & (Pre_Q(24) & !\Pre_Q[23]~80\)) # (!\inc~input_o\ & ((Pre_Q(24)) # (!\Pre_Q[23]~80\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(24),
	datad => VCC,
	cin => \Pre_Q[23]~80\,
	combout => \Pre_Q[24]~81_combout\,
	cout => \Pre_Q[24]~82\);

-- Location: IOIBUF_X0_Y7_N8
\d[24]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(24),
	o => \d[24]~input_o\);

-- Location: FF_X34_Y17_N17
\Pre_Q[24]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[24]~81_combout\,
	asdata => \d[24]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(24));

-- Location: LCCOMB_X34_Y17_N18
\Pre_Q[25]~83\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[25]~83_combout\ = (\inc~input_o\ & ((Pre_Q(25) & (!\Pre_Q[24]~82\)) # (!Pre_Q(25) & ((\Pre_Q[24]~82\) # (GND))))) # (!\inc~input_o\ & ((Pre_Q(25) & (\Pre_Q[24]~82\ & VCC)) # (!Pre_Q(25) & (!\Pre_Q[24]~82\))))
-- \Pre_Q[25]~84\ = CARRY((\inc~input_o\ & ((!\Pre_Q[24]~82\) # (!Pre_Q(25)))) # (!\inc~input_o\ & (!Pre_Q(25) & !\Pre_Q[24]~82\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(25),
	datad => VCC,
	cin => \Pre_Q[24]~82\,
	combout => \Pre_Q[25]~83_combout\,
	cout => \Pre_Q[25]~84\);

-- Location: IOIBUF_X45_Y0_N15
\d[25]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(25),
	o => \d[25]~input_o\);

-- Location: FF_X34_Y17_N19
\Pre_Q[25]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[25]~83_combout\,
	asdata => \d[25]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(25));

-- Location: LCCOMB_X34_Y17_N20
\Pre_Q[26]~85\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[26]~85_combout\ = ((\inc~input_o\ $ (Pre_Q(26) $ (\Pre_Q[25]~84\)))) # (GND)
-- \Pre_Q[26]~86\ = CARRY((\inc~input_o\ & (Pre_Q(26) & !\Pre_Q[25]~84\)) # (!\inc~input_o\ & ((Pre_Q(26)) # (!\Pre_Q[25]~84\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(26),
	datad => VCC,
	cin => \Pre_Q[25]~84\,
	combout => \Pre_Q[26]~85_combout\,
	cout => \Pre_Q[26]~86\);

-- Location: IOIBUF_X53_Y17_N22
\d[26]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(26),
	o => \d[26]~input_o\);

-- Location: FF_X34_Y17_N21
\Pre_Q[26]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[26]~85_combout\,
	asdata => \d[26]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(26));

-- Location: LCCOMB_X34_Y17_N22
\Pre_Q[27]~87\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[27]~87_combout\ = (\inc~input_o\ & ((Pre_Q(27) & (!\Pre_Q[26]~86\)) # (!Pre_Q(27) & ((\Pre_Q[26]~86\) # (GND))))) # (!\inc~input_o\ & ((Pre_Q(27) & (\Pre_Q[26]~86\ & VCC)) # (!Pre_Q(27) & (!\Pre_Q[26]~86\))))
-- \Pre_Q[27]~88\ = CARRY((\inc~input_o\ & ((!\Pre_Q[26]~86\) # (!Pre_Q(27)))) # (!\inc~input_o\ & (!Pre_Q(27) & !\Pre_Q[26]~86\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(27),
	datad => VCC,
	cin => \Pre_Q[26]~86\,
	combout => \Pre_Q[27]~87_combout\,
	cout => \Pre_Q[27]~88\);

-- Location: IOIBUF_X53_Y17_N15
\d[27]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(27),
	o => \d[27]~input_o\);

-- Location: FF_X34_Y17_N23
\Pre_Q[27]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[27]~87_combout\,
	asdata => \d[27]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(27));

-- Location: LCCOMB_X34_Y17_N24
\Pre_Q[28]~89\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[28]~89_combout\ = ((\inc~input_o\ $ (Pre_Q(28) $ (\Pre_Q[27]~88\)))) # (GND)
-- \Pre_Q[28]~90\ = CARRY((\inc~input_o\ & (Pre_Q(28) & !\Pre_Q[27]~88\)) # (!\inc~input_o\ & ((Pre_Q(28)) # (!\Pre_Q[27]~88\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(28),
	datad => VCC,
	cin => \Pre_Q[27]~88\,
	combout => \Pre_Q[28]~89_combout\,
	cout => \Pre_Q[28]~90\);

-- Location: IOIBUF_X53_Y9_N8
\d[28]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(28),
	o => \d[28]~input_o\);

-- Location: FF_X34_Y17_N25
\Pre_Q[28]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[28]~89_combout\,
	asdata => \d[28]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(28));

-- Location: LCCOMB_X34_Y17_N26
\Pre_Q[29]~91\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[29]~91_combout\ = (\inc~input_o\ & ((Pre_Q(29) & (!\Pre_Q[28]~90\)) # (!Pre_Q(29) & ((\Pre_Q[28]~90\) # (GND))))) # (!\inc~input_o\ & ((Pre_Q(29) & (\Pre_Q[28]~90\ & VCC)) # (!Pre_Q(29) & (!\Pre_Q[28]~90\))))
-- \Pre_Q[29]~92\ = CARRY((\inc~input_o\ & ((!\Pre_Q[28]~90\) # (!Pre_Q(29)))) # (!\inc~input_o\ & (!Pre_Q(29) & !\Pre_Q[28]~90\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100100101011",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(29),
	datad => VCC,
	cin => \Pre_Q[28]~90\,
	combout => \Pre_Q[29]~91_combout\,
	cout => \Pre_Q[29]~92\);

-- Location: IOIBUF_X53_Y17_N8
\d[29]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(29),
	o => \d[29]~input_o\);

-- Location: FF_X34_Y17_N27
\Pre_Q[29]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[29]~91_combout\,
	asdata => \d[29]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(29));

-- Location: LCCOMB_X34_Y17_N28
\Pre_Q[30]~93\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[30]~93_combout\ = ((\inc~input_o\ $ (Pre_Q(30) $ (\Pre_Q[29]~92\)))) # (GND)
-- \Pre_Q[30]~94\ = CARRY((\inc~input_o\ & (Pre_Q(30) & !\Pre_Q[29]~92\)) # (!\inc~input_o\ & ((Pre_Q(30)) # (!\Pre_Q[29]~92\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001001101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \inc~input_o\,
	datab => Pre_Q(30),
	datad => VCC,
	cin => \Pre_Q[29]~92\,
	combout => \Pre_Q[30]~93_combout\,
	cout => \Pre_Q[30]~94\);

-- Location: IOIBUF_X53_Y17_N1
\d[30]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(30),
	o => \d[30]~input_o\);

-- Location: FF_X34_Y17_N29
\Pre_Q[30]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[30]~93_combout\,
	asdata => \d[30]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(30));

-- Location: LCCOMB_X34_Y17_N30
\Pre_Q[31]~95\ : cycloneive_lcell_comb
-- Equation(s):
-- \Pre_Q[31]~95_combout\ = Pre_Q(31) $ (\Pre_Q[30]~94\ $ (!\inc~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101010100101",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => Pre_Q(31),
	datad => \inc~input_o\,
	cin => \Pre_Q[30]~94\,
	combout => \Pre_Q[31]~95_combout\);

-- Location: IOIBUF_X53_Y20_N15
\d[31]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_d(31),
	o => \d[31]~input_o\);

-- Location: FF_X34_Y17_N31
\Pre_Q[31]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \Pre_Q[31]~95_combout\,
	asdata => \d[31]~input_o\,
	clrn => \ALT_INV_clr~inputclkctrl_outclk\,
	sload => \ld~input_o\,
	ena => \Pre_Q[0]~34_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => Pre_Q(31));

ww_q(0) <= \q[0]~output_o\;

ww_q(1) <= \q[1]~output_o\;

ww_q(2) <= \q[2]~output_o\;

ww_q(3) <= \q[3]~output_o\;

ww_q(4) <= \q[4]~output_o\;

ww_q(5) <= \q[5]~output_o\;

ww_q(6) <= \q[6]~output_o\;

ww_q(7) <= \q[7]~output_o\;

ww_q(8) <= \q[8]~output_o\;

ww_q(9) <= \q[9]~output_o\;

ww_q(10) <= \q[10]~output_o\;

ww_q(11) <= \q[11]~output_o\;

ww_q(12) <= \q[12]~output_o\;

ww_q(13) <= \q[13]~output_o\;

ww_q(14) <= \q[14]~output_o\;

ww_q(15) <= \q[15]~output_o\;

ww_q(16) <= \q[16]~output_o\;

ww_q(17) <= \q[17]~output_o\;

ww_q(18) <= \q[18]~output_o\;

ww_q(19) <= \q[19]~output_o\;

ww_q(20) <= \q[20]~output_o\;

ww_q(21) <= \q[21]~output_o\;

ww_q(22) <= \q[22]~output_o\;

ww_q(23) <= \q[23]~output_o\;

ww_q(24) <= \q[24]~output_o\;

ww_q(25) <= \q[25]~output_o\;

ww_q(26) <= \q[26]~output_o\;

ww_q(27) <= \q[27]~output_o\;

ww_q(28) <= \q[28]~output_o\;

ww_q(29) <= \q[29]~output_o\;

ww_q(30) <= \q[30]~output_o\;

ww_q(31) <= \q[31]~output_o\;
END structure;


