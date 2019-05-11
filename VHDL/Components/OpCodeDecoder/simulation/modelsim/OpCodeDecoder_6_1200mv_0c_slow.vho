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

-- DATE "05/05/2019 19:30:51"

-- 
-- Device: Altera EP4CE6E22C6 Package TQFP144
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


LIBRARY CYCLONEIVE;
LIBRARY IEEE;
USE CYCLONEIVE.CYCLONEIVE_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	OpCodeDecoder IS
    PORT (
	InstrOpCode : IN std_logic_vector(7 DOWNTO 0);
	Op_HCF : OUT std_logic;
	Op_NOP : OUT std_logic;
	Op_RES : OUT std_logic;
	Op_ADS : OUT std_logic;
	Op_MUL : OUT std_logic;
	Op_MAO : OUT std_logic;
	Op_ORS : OUT std_logic;
	Op_ARS : OUT std_logic;
	Op_XRS : OUT std_logic;
	Op_LS1 : OUT std_logic;
	Op_RS1 : OUT std_logic;
	Op_LR1 : OUT std_logic;
	Op_RR1 : OUT std_logic;
	Op_RA1 : OUT std_logic;
	Op_ENS : OUT std_logic;
	Op_LIL : OUT std_logic;
	Op_LIU : OUT std_logic;
	Op_LDB : OUT std_logic;
	Op_SDB : OUT std_logic;
	Op_LDS : OUT std_logic;
	Op_SDS : OUT std_logic;
	Op_LDL : OUT std_logic;
	Op_SDL : OUT std_logic;
	Op_LPB : OUT std_logic;
	Op_SPB : OUT std_logic;
	Op_LPS : OUT std_logic;
	Op_SPS : OUT std_logic;
	Op_LPL : OUT std_logic;
	Op_SPL : OUT std_logic;
	Op_PSS : OUT std_logic;
	Op_PUS : OUT std_logic;
	Op_JSR : OUT std_logic;
	Op_RTS : OUT std_logic;
	Op_BRA : OUT std_logic;
	Op_BCS : OUT std_logic;
	Op_BCC : OUT std_logic;
	Op_BOV : OUT std_logic;
	Op_BEQ : OUT std_logic
	);
END OpCodeDecoder;

-- Design Ports Information
-- Op_HCF	=>  Location: PIN_98,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_NOP	=>  Location: PIN_66,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RES	=>  Location: PIN_65,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ADS	=>  Location: PIN_50,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_MUL	=>  Location: PIN_84,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_MAO	=>  Location: PIN_44,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ORS	=>  Location: PIN_53,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ARS	=>  Location: PIN_120,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_XRS	=>  Location: PIN_64,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LS1	=>  Location: PIN_125,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RS1	=>  Location: PIN_51,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LR1	=>  Location: PIN_52,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RR1	=>  Location: PIN_119,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RA1	=>  Location: PIN_46,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_ENS	=>  Location: PIN_43,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LIL	=>  Location: PIN_71,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LIU	=>  Location: PIN_76,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LDB	=>  Location: PIN_99,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_SDB	=>  Location: PIN_83,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LDS	=>  Location: PIN_112,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_SDS	=>  Location: PIN_100,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LDL	=>  Location: PIN_111,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_SDL	=>  Location: PIN_113,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LPB	=>  Location: PIN_85,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_SPB	=>  Location: PIN_67,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LPS	=>  Location: PIN_68,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_SPS	=>  Location: PIN_80,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_LPL	=>  Location: PIN_114,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_SPL	=>  Location: PIN_106,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_PSS	=>  Location: PIN_30,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_PUS	=>  Location: PIN_77,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_JSR	=>  Location: PIN_54,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_RTS	=>  Location: PIN_86,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_BRA	=>  Location: PIN_60,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_BCS	=>  Location: PIN_58,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_BCC	=>  Location: PIN_115,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_BOV	=>  Location: PIN_87,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Op_BEQ	=>  Location: PIN_59,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstrOpCode[0]	=>  Location: PIN_90,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstrOpCode[1]	=>  Location: PIN_91,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstrOpCode[2]	=>  Location: PIN_49,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstrOpCode[4]	=>  Location: PIN_55,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstrOpCode[7]	=>  Location: PIN_75,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstrOpCode[5]	=>  Location: PIN_74,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstrOpCode[6]	=>  Location: PIN_32,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- InstrOpCode[3]	=>  Location: PIN_69,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF OpCodeDecoder IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_InstrOpCode : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_Op_HCF : std_logic;
SIGNAL ww_Op_NOP : std_logic;
SIGNAL ww_Op_RES : std_logic;
SIGNAL ww_Op_ADS : std_logic;
SIGNAL ww_Op_MUL : std_logic;
SIGNAL ww_Op_MAO : std_logic;
SIGNAL ww_Op_ORS : std_logic;
SIGNAL ww_Op_ARS : std_logic;
SIGNAL ww_Op_XRS : std_logic;
SIGNAL ww_Op_LS1 : std_logic;
SIGNAL ww_Op_RS1 : std_logic;
SIGNAL ww_Op_LR1 : std_logic;
SIGNAL ww_Op_RR1 : std_logic;
SIGNAL ww_Op_RA1 : std_logic;
SIGNAL ww_Op_ENS : std_logic;
SIGNAL ww_Op_LIL : std_logic;
SIGNAL ww_Op_LIU : std_logic;
SIGNAL ww_Op_LDB : std_logic;
SIGNAL ww_Op_SDB : std_logic;
SIGNAL ww_Op_LDS : std_logic;
SIGNAL ww_Op_SDS : std_logic;
SIGNAL ww_Op_LDL : std_logic;
SIGNAL ww_Op_SDL : std_logic;
SIGNAL ww_Op_LPB : std_logic;
SIGNAL ww_Op_SPB : std_logic;
SIGNAL ww_Op_LPS : std_logic;
SIGNAL ww_Op_SPS : std_logic;
SIGNAL ww_Op_LPL : std_logic;
SIGNAL ww_Op_SPL : std_logic;
SIGNAL ww_Op_PSS : std_logic;
SIGNAL ww_Op_PUS : std_logic;
SIGNAL ww_Op_JSR : std_logic;
SIGNAL ww_Op_RTS : std_logic;
SIGNAL ww_Op_BRA : std_logic;
SIGNAL ww_Op_BCS : std_logic;
SIGNAL ww_Op_BCC : std_logic;
SIGNAL ww_Op_BOV : std_logic;
SIGNAL ww_Op_BEQ : std_logic;
SIGNAL \Op_HCF~output_o\ : std_logic;
SIGNAL \Op_NOP~output_o\ : std_logic;
SIGNAL \Op_RES~output_o\ : std_logic;
SIGNAL \Op_ADS~output_o\ : std_logic;
SIGNAL \Op_MUL~output_o\ : std_logic;
SIGNAL \Op_MAO~output_o\ : std_logic;
SIGNAL \Op_ORS~output_o\ : std_logic;
SIGNAL \Op_ARS~output_o\ : std_logic;
SIGNAL \Op_XRS~output_o\ : std_logic;
SIGNAL \Op_LS1~output_o\ : std_logic;
SIGNAL \Op_RS1~output_o\ : std_logic;
SIGNAL \Op_LR1~output_o\ : std_logic;
SIGNAL \Op_RR1~output_o\ : std_logic;
SIGNAL \Op_RA1~output_o\ : std_logic;
SIGNAL \Op_ENS~output_o\ : std_logic;
SIGNAL \Op_LIL~output_o\ : std_logic;
SIGNAL \Op_LIU~output_o\ : std_logic;
SIGNAL \Op_LDB~output_o\ : std_logic;
SIGNAL \Op_SDB~output_o\ : std_logic;
SIGNAL \Op_LDS~output_o\ : std_logic;
SIGNAL \Op_SDS~output_o\ : std_logic;
SIGNAL \Op_LDL~output_o\ : std_logic;
SIGNAL \Op_SDL~output_o\ : std_logic;
SIGNAL \Op_LPB~output_o\ : std_logic;
SIGNAL \Op_SPB~output_o\ : std_logic;
SIGNAL \Op_LPS~output_o\ : std_logic;
SIGNAL \Op_SPS~output_o\ : std_logic;
SIGNAL \Op_LPL~output_o\ : std_logic;
SIGNAL \Op_SPL~output_o\ : std_logic;
SIGNAL \Op_PSS~output_o\ : std_logic;
SIGNAL \Op_PUS~output_o\ : std_logic;
SIGNAL \Op_JSR~output_o\ : std_logic;
SIGNAL \Op_RTS~output_o\ : std_logic;
SIGNAL \Op_BRA~output_o\ : std_logic;
SIGNAL \Op_BCS~output_o\ : std_logic;
SIGNAL \Op_BCC~output_o\ : std_logic;
SIGNAL \Op_BOV~output_o\ : std_logic;
SIGNAL \Op_BEQ~output_o\ : std_logic;
SIGNAL \InstrOpCode[5]~input_o\ : std_logic;
SIGNAL \InstrOpCode[6]~input_o\ : std_logic;
SIGNAL \InstrOpCode[7]~input_o\ : std_logic;
SIGNAL \Op_HCF~0_combout\ : std_logic;
SIGNAL \InstrOpCode[1]~input_o\ : std_logic;
SIGNAL \InstrOpCode[0]~input_o\ : std_logic;
SIGNAL \Equal0~0_combout\ : std_logic;
SIGNAL \InstrOpCode[2]~input_o\ : std_logic;
SIGNAL \InstrOpCode[4]~input_o\ : std_logic;
SIGNAL \Equal0~1_combout\ : std_logic;
SIGNAL \InstrOpCode[3]~input_o\ : std_logic;
SIGNAL \Op_HCF~1_combout\ : std_logic;
SIGNAL \Equal1~0_combout\ : std_logic;
SIGNAL \Op_NOP~0_combout\ : std_logic;
SIGNAL \Op_LR1~0_combout\ : std_logic;
SIGNAL \Op_RES~0_combout\ : std_logic;
SIGNAL \opc_Cat_Decoder|Equal0~0_combout\ : std_logic;
SIGNAL \Op_ADS~0_combout\ : std_logic;
SIGNAL \Op_MUL~2_combout\ : std_logic;
SIGNAL \Op_MAO~0_combout\ : std_logic;
SIGNAL \Op_ORS~0_combout\ : std_logic;
SIGNAL \Op_RS1~0_combout\ : std_logic;
SIGNAL \Op_ARS~0_combout\ : std_logic;
SIGNAL \Op_XRS~0_combout\ : std_logic;
SIGNAL \Op_RA1~0_combout\ : std_logic;
SIGNAL \Op_LS1~0_combout\ : std_logic;
SIGNAL \Op_RS1~1_combout\ : std_logic;
SIGNAL \Op_LR1~1_combout\ : std_logic;
SIGNAL \Op_BOV~0_combout\ : std_logic;
SIGNAL \Op_RR1~0_combout\ : std_logic;
SIGNAL \Op_RA1~1_combout\ : std_logic;
SIGNAL \Equal0~2_combout\ : std_logic;
SIGNAL \Op_LIL~0_combout\ : std_logic;
SIGNAL \Op_LIU~0_combout\ : std_logic;
SIGNAL \opc_Cat_Decoder|Equal0~1_combout\ : std_logic;
SIGNAL \Op_LDB~0_combout\ : std_logic;
SIGNAL \Op_SDB~2_combout\ : std_logic;
SIGNAL \Op_LDS~0_combout\ : std_logic;
SIGNAL \Op_SDS~2_combout\ : std_logic;
SIGNAL \Op_SDS~3_combout\ : std_logic;
SIGNAL \Op_BEQ~0_combout\ : std_logic;
SIGNAL \Op_LDL~0_combout\ : std_logic;
SIGNAL \Op_LDL~1_combout\ : std_logic;
SIGNAL \Op_SDL~0_combout\ : std_logic;
SIGNAL \opc_Cat_Decoder|Equal0~2_combout\ : std_logic;
SIGNAL \Op_LPB~0_combout\ : std_logic;
SIGNAL \Op_SPB~2_combout\ : std_logic;
SIGNAL \Op_LPS~0_combout\ : std_logic;
SIGNAL \Op_SPS~2_combout\ : std_logic;
SIGNAL \Op_LPL~0_combout\ : std_logic;
SIGNAL \Op_LPL~1_combout\ : std_logic;
SIGNAL \Op_SPL~0_combout\ : std_logic;
SIGNAL \Op_PSS~0_combout\ : std_logic;
SIGNAL \Op_PUS~0_combout\ : std_logic;
SIGNAL \opc_Cat_Decoder|Equal0~3_combout\ : std_logic;
SIGNAL \Op_JSR~0_combout\ : std_logic;
SIGNAL \Op_RTS~2_combout\ : std_logic;
SIGNAL \Op_BRA~0_combout\ : std_logic;
SIGNAL \Op_BCS~0_combout\ : std_logic;
SIGNAL \Op_BCC~0_combout\ : std_logic;
SIGNAL \Op_BOV~1_combout\ : std_logic;
SIGNAL \Op_BEQ~1_combout\ : std_logic;

COMPONENT hard_block
    PORT (
	devoe : IN std_logic;
	devclrn : IN std_logic;
	devpor : IN std_logic);
END COMPONENT;

BEGIN

ww_InstrOpCode <= InstrOpCode;
Op_HCF <= ww_Op_HCF;
Op_NOP <= ww_Op_NOP;
Op_RES <= ww_Op_RES;
Op_ADS <= ww_Op_ADS;
Op_MUL <= ww_Op_MUL;
Op_MAO <= ww_Op_MAO;
Op_ORS <= ww_Op_ORS;
Op_ARS <= ww_Op_ARS;
Op_XRS <= ww_Op_XRS;
Op_LS1 <= ww_Op_LS1;
Op_RS1 <= ww_Op_RS1;
Op_LR1 <= ww_Op_LR1;
Op_RR1 <= ww_Op_RR1;
Op_RA1 <= ww_Op_RA1;
Op_ENS <= ww_Op_ENS;
Op_LIL <= ww_Op_LIL;
Op_LIU <= ww_Op_LIU;
Op_LDB <= ww_Op_LDB;
Op_SDB <= ww_Op_SDB;
Op_LDS <= ww_Op_LDS;
Op_SDS <= ww_Op_SDS;
Op_LDL <= ww_Op_LDL;
Op_SDL <= ww_Op_SDL;
Op_LPB <= ww_Op_LPB;
Op_SPB <= ww_Op_SPB;
Op_LPS <= ww_Op_LPS;
Op_SPS <= ww_Op_SPS;
Op_LPL <= ww_Op_LPL;
Op_SPL <= ww_Op_SPL;
Op_PSS <= ww_Op_PSS;
Op_PUS <= ww_Op_PUS;
Op_JSR <= ww_Op_JSR;
Op_RTS <= ww_Op_RTS;
Op_BRA <= ww_Op_BRA;
Op_BCS <= ww_Op_BCS;
Op_BCC <= ww_Op_BCC;
Op_BOV <= ww_Op_BOV;
Op_BEQ <= ww_Op_BEQ;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
auto_generated_inst : hard_block
PORT MAP (
	devoe => ww_devoe,
	devclrn => ww_devclrn,
	devpor => ww_devpor);

-- Location: IOOBUF_X34_Y17_N23
\Op_HCF~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_HCF~1_combout\,
	devoe => ww_devoe,
	o => \Op_HCF~output_o\);

-- Location: IOOBUF_X28_Y0_N2
\Op_NOP~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_NOP~0_combout\,
	devoe => ww_devoe,
	o => \Op_NOP~output_o\);

-- Location: IOOBUF_X28_Y0_N23
\Op_RES~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_RES~0_combout\,
	devoe => ww_devoe,
	o => \Op_RES~output_o\);

-- Location: IOOBUF_X13_Y0_N2
\Op_ADS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_ADS~0_combout\,
	devoe => ww_devoe,
	o => \Op_ADS~output_o\);

-- Location: IOOBUF_X34_Y9_N16
\Op_MUL~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_MUL~2_combout\,
	devoe => ww_devoe,
	o => \Op_MUL~output_o\);

-- Location: IOOBUF_X5_Y0_N16
\Op_MAO~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_MAO~0_combout\,
	devoe => ww_devoe,
	o => \Op_MAO~output_o\);

-- Location: IOOBUF_X16_Y0_N2
\Op_ORS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_ORS~0_combout\,
	devoe => ww_devoe,
	o => \Op_ORS~output_o\);

-- Location: IOOBUF_X23_Y24_N9
\Op_ARS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_ARS~0_combout\,
	devoe => ww_devoe,
	o => \Op_ARS~output_o\);

-- Location: IOOBUF_X25_Y0_N2
\Op_XRS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_XRS~0_combout\,
	devoe => ww_devoe,
	o => \Op_XRS~output_o\);

-- Location: IOOBUF_X18_Y24_N23
\Op_LS1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LS1~0_combout\,
	devoe => ww_devoe,
	o => \Op_LS1~output_o\);

-- Location: IOOBUF_X16_Y0_N23
\Op_RS1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_RS1~1_combout\,
	devoe => ww_devoe,
	o => \Op_RS1~output_o\);

-- Location: IOOBUF_X16_Y0_N9
\Op_LR1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LR1~1_combout\,
	devoe => ww_devoe,
	o => \Op_LR1~output_o\);

-- Location: IOOBUF_X23_Y24_N2
\Op_RR1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_RR1~0_combout\,
	devoe => ww_devoe,
	o => \Op_RR1~output_o\);

-- Location: IOOBUF_X7_Y0_N2
\Op_RA1~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_RA1~1_combout\,
	devoe => ww_devoe,
	o => \Op_RA1~output_o\);

-- Location: IOOBUF_X5_Y0_N23
\Op_ENS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \Op_ENS~output_o\);

-- Location: IOOBUF_X32_Y0_N16
\Op_LIL~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LIL~0_combout\,
	devoe => ww_devoe,
	o => \Op_LIL~output_o\);

-- Location: IOOBUF_X34_Y4_N23
\Op_LIU~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LIU~0_combout\,
	devoe => ww_devoe,
	o => \Op_LIU~output_o\);

-- Location: IOOBUF_X34_Y17_N16
\Op_LDB~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LDB~0_combout\,
	devoe => ww_devoe,
	o => \Op_LDB~output_o\);

-- Location: IOOBUF_X34_Y9_N23
\Op_SDB~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_SDB~2_combout\,
	devoe => ww_devoe,
	o => \Op_SDB~output_o\);

-- Location: IOOBUF_X28_Y24_N2
\Op_LDS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LDS~0_combout\,
	devoe => ww_devoe,
	o => \Op_LDS~output_o\);

-- Location: IOOBUF_X34_Y17_N2
\Op_SDS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_SDS~3_combout\,
	devoe => ww_devoe,
	o => \Op_SDS~output_o\);

-- Location: IOOBUF_X30_Y24_N23
\Op_LDL~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LDL~1_combout\,
	devoe => ww_devoe,
	o => \Op_LDL~output_o\);

-- Location: IOOBUF_X28_Y24_N9
\Op_SDL~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_SDL~0_combout\,
	devoe => ww_devoe,
	o => \Op_SDL~output_o\);

-- Location: IOOBUF_X34_Y9_N9
\Op_LPB~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LPB~0_combout\,
	devoe => ww_devoe,
	o => \Op_LPB~output_o\);

-- Location: IOOBUF_X30_Y0_N23
\Op_SPB~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_SPB~2_combout\,
	devoe => ww_devoe,
	o => \Op_SPB~output_o\);

-- Location: IOOBUF_X30_Y0_N9
\Op_LPS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LPS~0_combout\,
	devoe => ww_devoe,
	o => \Op_LPS~output_o\);

-- Location: IOOBUF_X34_Y7_N9
\Op_SPS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_SPS~2_combout\,
	devoe => ww_devoe,
	o => \Op_SPS~output_o\);

-- Location: IOOBUF_X28_Y24_N16
\Op_LPL~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_LPL~1_combout\,
	devoe => ww_devoe,
	o => \Op_LPL~output_o\);

-- Location: IOOBUF_X34_Y20_N9
\Op_SPL~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_SPL~0_combout\,
	devoe => ww_devoe,
	o => \Op_SPL~output_o\);

-- Location: IOOBUF_X0_Y8_N16
\Op_PSS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_PSS~0_combout\,
	devoe => ww_devoe,
	o => \Op_PSS~output_o\);

-- Location: IOOBUF_X34_Y4_N16
\Op_PUS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_PUS~0_combout\,
	devoe => ww_devoe,
	o => \Op_PUS~output_o\);

-- Location: IOOBUF_X18_Y0_N23
\Op_JSR~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_JSR~0_combout\,
	devoe => ww_devoe,
	o => \Op_JSR~output_o\);

-- Location: IOOBUF_X34_Y9_N2
\Op_RTS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_RTS~2_combout\,
	devoe => ww_devoe,
	o => \Op_RTS~output_o\);

-- Location: IOOBUF_X23_Y0_N9
\Op_BRA~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_BRA~0_combout\,
	devoe => ww_devoe,
	o => \Op_BRA~output_o\);

-- Location: IOOBUF_X21_Y0_N9
\Op_BCS~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_BCS~0_combout\,
	devoe => ww_devoe,
	o => \Op_BCS~output_o\);

-- Location: IOOBUF_X28_Y24_N23
\Op_BCC~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_BCC~0_combout\,
	devoe => ww_devoe,
	o => \Op_BCC~output_o\);

-- Location: IOOBUF_X34_Y10_N9
\Op_BOV~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_BOV~1_combout\,
	devoe => ww_devoe,
	o => \Op_BOV~output_o\);

-- Location: IOOBUF_X23_Y0_N16
\Op_BEQ~output\ : cycloneive_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \Op_BEQ~1_combout\,
	devoe => ww_devoe,
	o => \Op_BEQ~output_o\);

-- Location: IOIBUF_X34_Y2_N15
\InstrOpCode[5]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InstrOpCode(5),
	o => \InstrOpCode[5]~input_o\);

-- Location: IOIBUF_X0_Y6_N15
\InstrOpCode[6]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InstrOpCode(6),
	o => \InstrOpCode[6]~input_o\);

-- Location: IOIBUF_X34_Y3_N22
\InstrOpCode[7]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InstrOpCode(7),
	o => \InstrOpCode[7]~input_o\);

-- Location: LCCOMB_X29_Y8_N24
\Op_HCF~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_HCF~0_combout\ = (!\InstrOpCode[5]~input_o\ & (!\InstrOpCode[6]~input_o\ & !\InstrOpCode[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	combout => \Op_HCF~0_combout\);

-- Location: IOIBUF_X34_Y12_N1
\InstrOpCode[1]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InstrOpCode(1),
	o => \InstrOpCode[1]~input_o\);

-- Location: IOIBUF_X34_Y12_N8
\InstrOpCode[0]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InstrOpCode(0),
	o => \InstrOpCode[0]~input_o\);

-- Location: LCCOMB_X28_Y8_N16
\Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~0_combout\ = (!\InstrOpCode[1]~input_o\ & !\InstrOpCode[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \InstrOpCode[1]~input_o\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Equal0~0_combout\);

-- Location: IOIBUF_X13_Y0_N15
\InstrOpCode[2]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InstrOpCode(2),
	o => \InstrOpCode[2]~input_o\);

-- Location: IOIBUF_X18_Y0_N15
\InstrOpCode[4]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InstrOpCode(4),
	o => \InstrOpCode[4]~input_o\);

-- Location: LCCOMB_X22_Y4_N24
\Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~1_combout\ = (!\InstrOpCode[2]~input_o\ & !\InstrOpCode[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \InstrOpCode[2]~input_o\,
	datad => \InstrOpCode[4]~input_o\,
	combout => \Equal0~1_combout\);

-- Location: IOIBUF_X30_Y0_N1
\InstrOpCode[3]~input\ : cycloneive_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_InstrOpCode(3),
	o => \InstrOpCode[3]~input_o\);

-- Location: LCCOMB_X28_Y8_N10
\Op_HCF~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_HCF~1_combout\ = (\Op_HCF~0_combout\ & (\Equal0~0_combout\ & (\Equal0~1_combout\ & !\InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_HCF~0_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_HCF~1_combout\);

-- Location: LCCOMB_X28_Y8_N20
\Equal1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal1~0_combout\ = (\Equal0~1_combout\ & (!\InstrOpCode[3]~input_o\ & (!\InstrOpCode[1]~input_o\ & \InstrOpCode[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \InstrOpCode[3]~input_o\,
	datac => \InstrOpCode[1]~input_o\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Equal1~0_combout\);

-- Location: LCCOMB_X29_Y8_N18
\Op_NOP~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_NOP~0_combout\ = (!\InstrOpCode[5]~input_o\ & (\Equal1~0_combout\ & (!\InstrOpCode[7]~input_o\ & !\InstrOpCode[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \Equal1~0_combout\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[6]~input_o\,
	combout => \Op_NOP~0_combout\);

-- Location: LCCOMB_X28_Y8_N6
\Op_LR1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LR1~0_combout\ = (\InstrOpCode[1]~input_o\ & !\InstrOpCode[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \InstrOpCode[1]~input_o\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Op_LR1~0_combout\);

-- Location: LCCOMB_X28_Y8_N24
\Op_RES~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_RES~0_combout\ = (\Equal0~1_combout\ & (!\InstrOpCode[3]~input_o\ & (\Op_HCF~0_combout\ & \Op_LR1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \InstrOpCode[3]~input_o\,
	datac => \Op_HCF~0_combout\,
	datad => \Op_LR1~0_combout\,
	combout => \Op_RES~0_combout\);

-- Location: LCCOMB_X29_Y8_N20
\opc_Cat_Decoder|Equal0~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \opc_Cat_Decoder|Equal0~0_combout\ = (\InstrOpCode[5]~input_o\ & (!\InstrOpCode[6]~input_o\ & !\InstrOpCode[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	combout => \opc_Cat_Decoder|Equal0~0_combout\);

-- Location: LCCOMB_X22_Y4_N26
\Op_ADS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_ADS~0_combout\ = (\Equal0~1_combout\ & (\Equal0~0_combout\ & (\opc_Cat_Decoder|Equal0~0_combout\ & !\InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \opc_Cat_Decoder|Equal0~0_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_ADS~0_combout\);

-- Location: LCCOMB_X29_Y8_N28
\Op_MUL~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_MUL~2_combout\ = (\InstrOpCode[5]~input_o\ & (\Equal1~0_combout\ & (!\InstrOpCode[7]~input_o\ & !\InstrOpCode[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \Equal1~0_combout\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[6]~input_o\,
	combout => \Op_MUL~2_combout\);

-- Location: LCCOMB_X22_Y4_N28
\Op_MAO~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_MAO~0_combout\ = (\Op_LR1~0_combout\ & (\Equal0~1_combout\ & (\opc_Cat_Decoder|Equal0~0_combout\ & !\InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_LR1~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \opc_Cat_Decoder|Equal0~0_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_MAO~0_combout\);

-- Location: LCCOMB_X22_Y4_N30
\Op_ORS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_ORS~0_combout\ = (\Equal0~1_combout\ & (\Equal0~0_combout\ & (\opc_Cat_Decoder|Equal0~0_combout\ & \InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \opc_Cat_Decoder|Equal0~0_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_ORS~0_combout\);

-- Location: LCCOMB_X28_Y6_N8
\Op_RS1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_RS1~0_combout\ = (\InstrOpCode[0]~input_o\ & !\InstrOpCode[1]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \InstrOpCode[0]~input_o\,
	datad => \InstrOpCode[1]~input_o\,
	combout => \Op_RS1~0_combout\);

-- Location: LCCOMB_X22_Y4_N16
\Op_ARS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_ARS~0_combout\ = (\Op_RS1~0_combout\ & (\Equal0~1_combout\ & (\opc_Cat_Decoder|Equal0~0_combout\ & \InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \opc_Cat_Decoder|Equal0~0_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_ARS~0_combout\);

-- Location: LCCOMB_X22_Y4_N10
\Op_XRS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_XRS~0_combout\ = (\Op_LR1~0_combout\ & (\Equal0~1_combout\ & (\opc_Cat_Decoder|Equal0~0_combout\ & \InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_LR1~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \opc_Cat_Decoder|Equal0~0_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_XRS~0_combout\);

-- Location: LCCOMB_X28_Y6_N18
\Op_RA1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_RA1~0_combout\ = (!\InstrOpCode[6]~input_o\ & (!\InstrOpCode[3]~input_o\ & (\InstrOpCode[5]~input_o\ & !\InstrOpCode[7]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[6]~input_o\,
	datab => \InstrOpCode[3]~input_o\,
	datac => \InstrOpCode[5]~input_o\,
	datad => \InstrOpCode[7]~input_o\,
	combout => \Op_RA1~0_combout\);

-- Location: LCCOMB_X22_Y4_N4
\Op_LS1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LS1~0_combout\ = (\InstrOpCode[4]~input_o\ & (!\InstrOpCode[2]~input_o\ & (\Op_RA1~0_combout\ & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[4]~input_o\,
	datab => \InstrOpCode[2]~input_o\,
	datac => \Op_RA1~0_combout\,
	datad => \Equal0~0_combout\,
	combout => \Op_LS1~0_combout\);

-- Location: LCCOMB_X22_Y4_N22
\Op_RS1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_RS1~1_combout\ = (\InstrOpCode[4]~input_o\ & (!\InstrOpCode[2]~input_o\ & (\Op_RA1~0_combout\ & \Op_RS1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[4]~input_o\,
	datab => \InstrOpCode[2]~input_o\,
	datac => \Op_RA1~0_combout\,
	datad => \Op_RS1~0_combout\,
	combout => \Op_RS1~1_combout\);

-- Location: LCCOMB_X22_Y4_N8
\Op_LR1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LR1~1_combout\ = (\InstrOpCode[4]~input_o\ & (!\InstrOpCode[2]~input_o\ & (\Op_RA1~0_combout\ & \Op_LR1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[4]~input_o\,
	datab => \InstrOpCode[2]~input_o\,
	datac => \Op_RA1~0_combout\,
	datad => \Op_LR1~0_combout\,
	combout => \Op_LR1~1_combout\);

-- Location: LCCOMB_X28_Y8_N26
\Op_BOV~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_BOV~0_combout\ = (\InstrOpCode[1]~input_o\ & \InstrOpCode[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \InstrOpCode[1]~input_o\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Op_BOV~0_combout\);

-- Location: LCCOMB_X22_Y4_N2
\Op_RR1~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_RR1~0_combout\ = (\InstrOpCode[4]~input_o\ & (!\InstrOpCode[2]~input_o\ & (\Op_RA1~0_combout\ & \Op_BOV~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[4]~input_o\,
	datab => \InstrOpCode[2]~input_o\,
	datac => \Op_RA1~0_combout\,
	datad => \Op_BOV~0_combout\,
	combout => \Op_RR1~0_combout\);

-- Location: LCCOMB_X22_Y4_N12
\Op_RA1~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_RA1~1_combout\ = (\InstrOpCode[4]~input_o\ & (\InstrOpCode[2]~input_o\ & (\Op_RA1~0_combout\ & \Equal0~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[4]~input_o\,
	datab => \InstrOpCode[2]~input_o\,
	datac => \Op_RA1~0_combout\,
	datad => \Equal0~0_combout\,
	combout => \Op_RA1~1_combout\);

-- Location: LCCOMB_X28_Y8_N12
\Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Equal0~2_combout\ = (\Equal0~1_combout\ & (!\InstrOpCode[3]~input_o\ & (!\InstrOpCode[1]~input_o\ & !\InstrOpCode[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \InstrOpCode[3]~input_o\,
	datac => \InstrOpCode[1]~input_o\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Equal0~2_combout\);

-- Location: LCCOMB_X29_Y8_N30
\Op_LIL~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LIL~0_combout\ = (\Equal0~2_combout\ & (\InstrOpCode[6]~input_o\ & (!\InstrOpCode[7]~input_o\ & !\InstrOpCode[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[5]~input_o\,
	combout => \Op_LIL~0_combout\);

-- Location: LCCOMB_X29_Y8_N0
\Op_LIU~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LIU~0_combout\ = (!\InstrOpCode[5]~input_o\ & (\Equal1~0_combout\ & (!\InstrOpCode[7]~input_o\ & \InstrOpCode[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \Equal1~0_combout\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[6]~input_o\,
	combout => \Op_LIU~0_combout\);

-- Location: LCCOMB_X29_Y8_N26
\opc_Cat_Decoder|Equal0~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \opc_Cat_Decoder|Equal0~1_combout\ = (\InstrOpCode[5]~input_o\ & (\InstrOpCode[6]~input_o\ & !\InstrOpCode[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	combout => \opc_Cat_Decoder|Equal0~1_combout\);

-- Location: LCCOMB_X28_Y8_N14
\Op_LDB~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LDB~0_combout\ = (\Equal0~0_combout\ & (\opc_Cat_Decoder|Equal0~1_combout\ & (\Equal0~1_combout\ & !\InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~0_combout\,
	datab => \opc_Cat_Decoder|Equal0~1_combout\,
	datac => \Equal0~1_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_LDB~0_combout\);

-- Location: LCCOMB_X29_Y8_N14
\Op_SDB~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_SDB~2_combout\ = (\InstrOpCode[5]~input_o\ & (\Equal1~0_combout\ & (!\InstrOpCode[7]~input_o\ & \InstrOpCode[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \Equal1~0_combout\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[6]~input_o\,
	combout => \Op_SDB~2_combout\);

-- Location: LCCOMB_X28_Y8_N8
\Op_LDS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LDS~0_combout\ = (\Op_LR1~0_combout\ & (\opc_Cat_Decoder|Equal0~1_combout\ & (\Equal0~1_combout\ & !\InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_LR1~0_combout\,
	datab => \opc_Cat_Decoder|Equal0~1_combout\,
	datac => \Equal0~1_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_LDS~0_combout\);

-- Location: LCCOMB_X28_Y8_N2
\Op_SDS~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_SDS~2_combout\ = (\Equal0~1_combout\ & (!\InstrOpCode[3]~input_o\ & (\InstrOpCode[1]~input_o\ & \InstrOpCode[0]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \InstrOpCode[3]~input_o\,
	datac => \InstrOpCode[1]~input_o\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Op_SDS~2_combout\);

-- Location: LCCOMB_X29_Y8_N16
\Op_SDS~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_SDS~3_combout\ = (\Op_SDS~2_combout\ & (\InstrOpCode[6]~input_o\ & (!\InstrOpCode[7]~input_o\ & \InstrOpCode[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000100000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_SDS~2_combout\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[5]~input_o\,
	combout => \Op_SDS~3_combout\);

-- Location: LCCOMB_X22_Y4_N6
\Op_BEQ~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_BEQ~0_combout\ = (\InstrOpCode[2]~input_o\ & !\InstrOpCode[4]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \InstrOpCode[2]~input_o\,
	datad => \InstrOpCode[4]~input_o\,
	combout => \Op_BEQ~0_combout\);

-- Location: LCCOMB_X28_Y8_N4
\Op_LDL~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LDL~0_combout\ = (\Op_BEQ~0_combout\ & (\opc_Cat_Decoder|Equal0~1_combout\ & (!\InstrOpCode[1]~input_o\ & !\InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_BEQ~0_combout\,
	datab => \opc_Cat_Decoder|Equal0~1_combout\,
	datac => \InstrOpCode[1]~input_o\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_LDL~0_combout\);

-- Location: LCCOMB_X28_Y20_N24
\Op_LDL~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LDL~1_combout\ = (\Op_LDL~0_combout\ & !\InstrOpCode[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_LDL~0_combout\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Op_LDL~1_combout\);

-- Location: LCCOMB_X28_Y20_N2
\Op_SDL~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_SDL~0_combout\ = (\Op_LDL~0_combout\ & \InstrOpCode[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_LDL~0_combout\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Op_SDL~0_combout\);

-- Location: LCCOMB_X29_Y8_N4
\opc_Cat_Decoder|Equal0~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \opc_Cat_Decoder|Equal0~2_combout\ = (!\InstrOpCode[5]~input_o\ & (!\InstrOpCode[6]~input_o\ & \InstrOpCode[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	combout => \opc_Cat_Decoder|Equal0~2_combout\);

-- Location: LCCOMB_X28_Y8_N30
\Op_LPB~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LPB~0_combout\ = (\opc_Cat_Decoder|Equal0~2_combout\ & (\Equal0~0_combout\ & (\Equal0~1_combout\ & !\InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \opc_Cat_Decoder|Equal0~2_combout\,
	datab => \Equal0~0_combout\,
	datac => \Equal0~1_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_LPB~0_combout\);

-- Location: LCCOMB_X29_Y8_N10
\Op_SPB~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_SPB~2_combout\ = (!\InstrOpCode[5]~input_o\ & (\Equal1~0_combout\ & (\InstrOpCode[7]~input_o\ & !\InstrOpCode[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \Equal1~0_combout\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[6]~input_o\,
	combout => \Op_SPB~2_combout\);

-- Location: LCCOMB_X28_Y8_N0
\Op_LPS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LPS~0_combout\ = (\Op_LR1~0_combout\ & (!\InstrOpCode[3]~input_o\ & (\Equal0~1_combout\ & \opc_Cat_Decoder|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_LR1~0_combout\,
	datab => \InstrOpCode[3]~input_o\,
	datac => \Equal0~1_combout\,
	datad => \opc_Cat_Decoder|Equal0~2_combout\,
	combout => \Op_LPS~0_combout\);

-- Location: LCCOMB_X29_Y8_N12
\Op_SPS~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_SPS~2_combout\ = (\Op_SDS~2_combout\ & (!\InstrOpCode[6]~input_o\ & (\InstrOpCode[7]~input_o\ & !\InstrOpCode[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_SDS~2_combout\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[5]~input_o\,
	combout => \Op_SPS~2_combout\);

-- Location: LCCOMB_X28_Y8_N18
\Op_LPL~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LPL~0_combout\ = (\Op_BEQ~0_combout\ & (!\InstrOpCode[3]~input_o\ & (!\InstrOpCode[1]~input_o\ & \opc_Cat_Decoder|Equal0~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000001000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_BEQ~0_combout\,
	datab => \InstrOpCode[3]~input_o\,
	datac => \InstrOpCode[1]~input_o\,
	datad => \opc_Cat_Decoder|Equal0~2_combout\,
	combout => \Op_LPL~0_combout\);

-- Location: LCCOMB_X28_Y20_N4
\Op_LPL~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_LPL~1_combout\ = (\Op_LPL~0_combout\ & !\InstrOpCode[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_LPL~0_combout\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Op_LPL~1_combout\);

-- Location: LCCOMB_X28_Y20_N14
\Op_SPL~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_SPL~0_combout\ = (\Op_LPL~0_combout\ & \InstrOpCode[0]~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \Op_LPL~0_combout\,
	datad => \InstrOpCode[0]~input_o\,
	combout => \Op_SPL~0_combout\);

-- Location: LCCOMB_X29_Y8_N22
\Op_PSS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_PSS~0_combout\ = (\Equal0~2_combout\ & (!\InstrOpCode[6]~input_o\ & (\InstrOpCode[7]~input_o\ & \InstrOpCode[5]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~2_combout\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[5]~input_o\,
	combout => \Op_PSS~0_combout\);

-- Location: LCCOMB_X29_Y8_N8
\Op_PUS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_PUS~0_combout\ = (\InstrOpCode[5]~input_o\ & (\Equal1~0_combout\ & (\InstrOpCode[7]~input_o\ & !\InstrOpCode[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \Equal1~0_combout\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[6]~input_o\,
	combout => \Op_PUS~0_combout\);

-- Location: LCCOMB_X29_Y8_N2
\opc_Cat_Decoder|Equal0~3\ : cycloneive_lcell_comb
-- Equation(s):
-- \opc_Cat_Decoder|Equal0~3_combout\ = (!\InstrOpCode[5]~input_o\ & (\InstrOpCode[6]~input_o\ & \InstrOpCode[7]~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000001000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \InstrOpCode[6]~input_o\,
	datac => \InstrOpCode[7]~input_o\,
	combout => \opc_Cat_Decoder|Equal0~3_combout\);

-- Location: LCCOMB_X22_Y4_N0
\Op_JSR~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_JSR~0_combout\ = (\Equal0~1_combout\ & (\Equal0~0_combout\ & (\opc_Cat_Decoder|Equal0~3_combout\ & !\InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \opc_Cat_Decoder|Equal0~3_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_JSR~0_combout\);

-- Location: LCCOMB_X29_Y8_N6
\Op_RTS~2\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_RTS~2_combout\ = (!\InstrOpCode[5]~input_o\ & (\Equal1~0_combout\ & (\InstrOpCode[7]~input_o\ & \InstrOpCode[6]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \InstrOpCode[5]~input_o\,
	datab => \Equal1~0_combout\,
	datac => \InstrOpCode[7]~input_o\,
	datad => \InstrOpCode[6]~input_o\,
	combout => \Op_RTS~2_combout\);

-- Location: LCCOMB_X22_Y4_N18
\Op_BRA~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_BRA~0_combout\ = (\Equal0~1_combout\ & (\Equal0~0_combout\ & (\opc_Cat_Decoder|Equal0~3_combout\ & \InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Equal0~0_combout\,
	datac => \opc_Cat_Decoder|Equal0~3_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_BRA~0_combout\);

-- Location: LCCOMB_X22_Y4_N20
\Op_BCS~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_BCS~0_combout\ = (\Op_RS1~0_combout\ & (\Equal0~1_combout\ & (\opc_Cat_Decoder|Equal0~3_combout\ & \InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_RS1~0_combout\,
	datab => \Equal0~1_combout\,
	datac => \opc_Cat_Decoder|Equal0~3_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_BCS~0_combout\);

-- Location: LCCOMB_X28_Y8_N28
\Op_BCC~0\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_BCC~0_combout\ = (\Equal0~1_combout\ & (\InstrOpCode[3]~input_o\ & (\opc_Cat_Decoder|Equal0~3_combout\ & \Op_LR1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \InstrOpCode[3]~input_o\,
	datac => \opc_Cat_Decoder|Equal0~3_combout\,
	datad => \Op_LR1~0_combout\,
	combout => \Op_BCC~0_combout\);

-- Location: LCCOMB_X28_Y8_N22
\Op_BOV~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_BOV~1_combout\ = (\Equal0~1_combout\ & (\Op_BOV~0_combout\ & (\opc_Cat_Decoder|Equal0~3_combout\ & \InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Equal0~1_combout\,
	datab => \Op_BOV~0_combout\,
	datac => \opc_Cat_Decoder|Equal0~3_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_BOV~1_combout\);

-- Location: LCCOMB_X22_Y4_N14
\Op_BEQ~1\ : cycloneive_lcell_comb
-- Equation(s):
-- \Op_BEQ~1_combout\ = (\Op_BEQ~0_combout\ & (\Equal0~0_combout\ & (\opc_Cat_Decoder|Equal0~3_combout\ & \InstrOpCode[3]~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \Op_BEQ~0_combout\,
	datab => \Equal0~0_combout\,
	datac => \opc_Cat_Decoder|Equal0~3_combout\,
	datad => \InstrOpCode[3]~input_o\,
	combout => \Op_BEQ~1_combout\);

ww_Op_HCF <= \Op_HCF~output_o\;

ww_Op_NOP <= \Op_NOP~output_o\;

ww_Op_RES <= \Op_RES~output_o\;

ww_Op_ADS <= \Op_ADS~output_o\;

ww_Op_MUL <= \Op_MUL~output_o\;

ww_Op_MAO <= \Op_MAO~output_o\;

ww_Op_ORS <= \Op_ORS~output_o\;

ww_Op_ARS <= \Op_ARS~output_o\;

ww_Op_XRS <= \Op_XRS~output_o\;

ww_Op_LS1 <= \Op_LS1~output_o\;

ww_Op_RS1 <= \Op_RS1~output_o\;

ww_Op_LR1 <= \Op_LR1~output_o\;

ww_Op_RR1 <= \Op_RR1~output_o\;

ww_Op_RA1 <= \Op_RA1~output_o\;

ww_Op_ENS <= \Op_ENS~output_o\;

ww_Op_LIL <= \Op_LIL~output_o\;

ww_Op_LIU <= \Op_LIU~output_o\;

ww_Op_LDB <= \Op_LDB~output_o\;

ww_Op_SDB <= \Op_SDB~output_o\;

ww_Op_LDS <= \Op_LDS~output_o\;

ww_Op_SDS <= \Op_SDS~output_o\;

ww_Op_LDL <= \Op_LDL~output_o\;

ww_Op_SDL <= \Op_SDL~output_o\;

ww_Op_LPB <= \Op_LPB~output_o\;

ww_Op_SPB <= \Op_SPB~output_o\;

ww_Op_LPS <= \Op_LPS~output_o\;

ww_Op_SPS <= \Op_SPS~output_o\;

ww_Op_LPL <= \Op_LPL~output_o\;

ww_Op_SPL <= \Op_SPL~output_o\;

ww_Op_PSS <= \Op_PSS~output_o\;

ww_Op_PUS <= \Op_PUS~output_o\;

ww_Op_JSR <= \Op_JSR~output_o\;

ww_Op_RTS <= \Op_RTS~output_o\;

ww_Op_BRA <= \Op_BRA~output_o\;

ww_Op_BCS <= \Op_BCS~output_o\;

ww_Op_BCC <= \Op_BCC~output_o\;

ww_Op_BOV <= \Op_BOV~output_o\;

ww_Op_BEQ <= \Op_BEQ~output_o\;
END structure;


