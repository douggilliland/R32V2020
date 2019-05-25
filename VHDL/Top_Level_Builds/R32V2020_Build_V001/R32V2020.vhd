-- Top Level Entity for R32V2020

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity R32V2020 is
	port(
		n_reset		: in std_logic;
		CLOCK_50		: in std_logic;
		
		-- switch0		: in std_logic;
		-- switch1		: in std_logic;
		-- switch2		: in std_logic;

		-- LED1			: out std_logic;
		-- LED2			: out std_logic;
		-- LED3			: out std_logic;
		-- LED4			: out std_logic;

		-- BUZZER		: out std_logic;

		SerRxd			: in std_logic;
		SerTxd			: out std_logic;
		SerRts			: out std_logic;

		VideoVect		: out std_logic_vector(17 downto 0); -- rrrrr,gggggg,bbbbb,hsync,vsync
		
		Anode_Activate : out std_logic_vector(3 downto 0);
		LED_out			: out std_logic_vector(6 downto 0);

		ps2Clk		: in std_logic;
		ps2Data		: in std_logic		
		);
end R32V2020;

architecture struct of R32V2020 is

signal	w_Op_NOP : std_logic := '0';		-- No operation
signal	w_Op_HCF : std_logic := '0';		-- Halt and Catch Fire
signal	w_Op_RES : std_logic := '0';		-- Reset CPU
signal	w_Op_ADS : std_logic := '0';		-- Add 2 regs and store in 3rd
signal	w_Op_CMP : std_logic := '0';		-- Compare 2 regs and set cond codes
signal	w_Op_MUL : std_logic := '0';		-- Multiply 2 regs and store in 3rd
--signal	Op_MAO : std_logic;
signal	w_Op_ORS  : std_logic := '0';	-- OR 2 regs and store in 3rd
signal	w_Op_ARS  : std_logic := '0';	-- AND 2 regs and store in 3rd
signal	w_Op_XRS  : std_logic := '0';	-- XOR 2 regs and store in 3rd
signal	w_Op_LS1  : std_logic := '0';	-- Logical Shift left by 1
signal	w_Op_RS1  : std_logic := '0';	-- Logical Shift right by 1
signal	w_Op_LR1  : std_logic := '0';	-- Rotate left by 1
signal	w_Op_RR1  : std_logic := '0';	-- Rotate right by 12
signal	w_Op_RA1  : std_logic := '0';	-- Right arithmetic shift
signal	w_Op_ENS  : std_logic := '0';	-- Swap endian
signal	w_Op_LIL  : std_logic := '0';	-- Load Register Immediate Lower
signal	w_Op_LIU  : std_logic := '0';	-- Load Register Immediate Upper
signal	w_Op_LDB  : std_logic := '0';	-- Load Data Byte
signal	w_Op_SDB  : std_logic := '0';	-- Store Data Byte
signal	w_Op_LDS  : std_logic := '0';	-- Load Data Short
signal	w_Op_SDS  : std_logic := '0';	-- Store Data Short
signal	w_Op_LDL  : std_logic := '0';	-- Load Data Long
signal	w_Op_SDL  : std_logic := '0';	-- Store Data Long
signal	w_Op_LPB  : std_logic := '0';	-- Load Peripheral Byte
signal	w_Op_SPB  : std_logic := '0';	-- Store Peripheral Byte
signal	w_Op_LPS  : std_logic := '0';	-- Load Peripheral Short
signal	w_Op_SPS  : std_logic := '0';	-- Store Peripheral Short
signal	w_Op_LPL  : std_logic := '0';	-- Load Peripheral Long
signal	w_Op_SPL  : std_logic := '0';	-- Store Peripheral Long
signal	w_Op_PSS  : std_logic := '0';	-- Push register to Stack
signal	w_Op_PUS  : std_logic := '0';	-- Pull register from Stack
signal	w_Op_SSS  : std_logic := '0';	-- Store to stack memory
signal	w_Op_SUS  : std_logic := '0';	-- Load from stack memory
signal	w_Op_LSS  : std_logic := '0';	-- Store to stack memory
signal	w_Op_JSR  : std_logic := '0';	-- Jump to Subroutine
signal	w_Op_RTS  : std_logic := '0';	-- Return from Subroutine
signal	w_Op_BRA  : std_logic := '0';	-- Branch Always
signal	w_Op_BCS  : std_logic := '0';	-- Branch if carry is set
signal	w_Op_BCC  : std_logic := '0';	-- Branch if carry is clear
signal	w_Op_BEZ  : std_logic := '0';	-- Branch if equal to zero
signal	w_Op_BE1  : std_logic := '0';	-- Branch if equal to one
signal	w_Op_BOV  : std_logic := '0';	-- Branch if overflow
signal	w_Op_BEQ  : std_logic := '0';	-- Branch if equal

signal	w_Video_Clk	: std_logic := '0';

signal	w_regDataA		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_regDataB		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_ALUDataOut	: std_logic_vector(31 downto 0) := x"00000000";
signal	w_CondCodeBits: std_logic_vector(31 downto 0) := x"00000000";
signal	w_CCR			: std_logic_vector(31 downto 0) := x"00000000";

signal	w_ldDestRegister			: std_logic := '0';
signal	w_dataIntoRegisterFile	: std_logic_vector(31 downto 0) := x"00000000";

signal	w_InstructionRomAddress	: std_logic_vector(31 downto 0) := x"00000000";
signal	w_InstructionRomData		: std_logic_vector(31 downto 0) := x"00000000";
signal	q_InstructionRomData		: std_logic_vector(31 downto 0) := x"00000000";

signal	w_StackRamAddress		: std_logic_vector(31 downto 0) := x"00000000";
--signal	dataToStackRam			: std_logic_vector(31 downto 0) := x"00000000";
signal	w_writeStackRamEn		: std_logic := '0';
signal	w_dataFromStackRam		: std_logic_vector(31 downto 0) := x"00000000";

signal	w_DataRamAddress				: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataToDataRam				: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataRamWriteAddress		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_writeToDataRamEnable		: std_logic;
signal	w_dataFromDataRam			: std_logic_vector(31 downto 0) := x"00000000";

signal	w_displayed_number		: std_logic_vector(15 downto 0) := x"0000";

signal	w_peripheralAddress		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataFromPeripherals	: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataToPeripherals		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_peripheralRdStrobe		: std_logic;
signal	w_peripheralWrStrobe		: std_logic;

signal	w_OneHotState				: std_logic_vector(5 downto 0) := "000000";
signal	w_save_CCR_bits			: std_logic := '0';

signal	w_holdHaltCatchFire		: std_logic := '0';
signal	w_wrRegFile					: std_logic := '0';
--attribute syn_keep: boolean;
--attribute syn_keep of w_wrRegFile: signal is true;

signal	w_TakeBranch				: std_logic := '0';
attribute syn_keep: boolean;
attribute syn_keep of w_TakeBranch: signal is true;

begin

	w_holdHaltCatchFire	<= '1' when w_OneHotState(3) = '1' and w_Op_HCF = '1' and n_reset = '1' else '0';
	w_writeStackRamEn <= '1' when (w_OneHotState(3) = '1' and (w_Op_PSS = '1' or w_Op_SSS = '1') and n_reset = '1') else '0';

	clockGen : ENTITY work.VideoClk_SVGA_800x600
	PORT map 	(
		areset	=> not n_reset,
		inclk0	=> CLOCK_50,
		c0			=> w_Video_Clk
	);
	
	StateMachine : entity work.OneHotStateMachine
	PORT map (
		clk 	=> CLOCK_50,
		clr 	=> not n_reset,
		hold	=> w_holdHaltCatchFire,
		state	=> w_OneHotState
	);
	
	SevenSegDisplay : entity work.Loadable_7S4D_LED
    Port map ( 
		i_clock_50Mhz 			=> CLOCK_50,
      i_reset					=> not n_reset,
		i_displayed_number	=> w_displayed_number,
      o_Anode_Activate		=> Anode_Activate,
      o_LED_out 				=> LED_out		-- Cathode patterns of 7-segment display
	);

	SevenSegmentDisplayLatch : ENTITY work.REG_16
	PORT MAP (
    clk 	=> CLOCK_50,
    d   	=> q_InstructionRomData(31 downto 24)&w_InstructionRomAddress(7 downto 0),
    ld  	=> w_OneHotState(4),
    clr 	=> not n_reset,
    q		=> w_displayed_number
	);
	
	opcodeDecoder : entity work.OpCodeDecoder
	port map (
		InstrOpCode => q_InstructionRomData(31 downto 24),
		-- Category = System
		Op_NOP => w_Op_NOP,
		Op_HCF => w_Op_HCF,
		Op_RES => w_Op_RES,
		-- Category = ALU
		Op_ADS => w_Op_ADS,
		Op_MUL => w_Op_MUL,
		Op_CMP => w_Op_CMP,
		Op_ORS => w_Op_ORS,
		Op_ARS => w_Op_ARS,
		Op_XRS => w_Op_XRS,
		Op_LS1 => w_Op_LS1,
		Op_RS1 => w_Op_RS1,
		Op_LR1 => w_Op_LR1,
		Op_RR1 => w_Op_RR1,
		Op_RA1 => w_Op_RA1,
		Op_ENS => w_Op_ENS,
		-- Category = Immediate values
		Op_LIL => w_Op_LIL,
		Op_LIU => w_Op_LIU,
		-- Category = Load/Store
		Op_LDB => w_Op_LDB,
		Op_SDB => w_Op_SDB,
		Op_LDS => w_Op_LDS,
		Op_SDS => w_Op_SDS,
		Op_LDL => w_Op_LDL,
		Op_SDL => w_Op_SDL,
		-- Category = Peripheral I/O
		Op_LPB => w_Op_LPB,
		Op_SPB => w_Op_SPB,
		Op_LPS => w_Op_LPS,
		Op_SPS => w_Op_SPS,
		Op_LPL => w_Op_LPL,
		Op_SPL => w_Op_SPL,
		-- Category = Stack
		Op_PSS => w_Op_PSS,
		Op_PUS => w_Op_PUS,
		Op_SSS => w_Op_SSS,
		Op_LSS => w_Op_LSS,		
		-- Category = Flow Control
		Op_JSR => w_Op_JSR,
		Op_RTS => w_Op_RTS,
		Op_BRA => w_Op_BRA,
		Op_BCS => w_Op_BCS,
		Op_BCC => w_Op_BCC,
		Op_BEZ => w_Op_BEZ,
		Op_BE1 => w_Op_BE1,
		Op_BOV => w_Op_BOV,
		Op_BEQ => w_Op_BEQ,
		o_WrRegFile => w_wrRegFile
	);
	
flowControl : ENTITY work.CCRControl PORT map 
	(
	CCR		=> w_CCR,
	Op_NOP => w_Op_NOP,
	Op_HCF => w_Op_HCF,
	Op_RES => w_Op_RES,
	-- Category = ALU
	Op_ADS => w_Op_ADS,
	Op_MUL => w_Op_MUL,
	Op_ORS => w_Op_ORS,
	Op_ARS => w_Op_ARS,
	Op_XRS => w_Op_XRS,
	Op_LS1 => w_Op_LS1,
	Op_RS1 => w_Op_RS1,
	Op_LR1 => w_Op_LR1,
	Op_RR1 => w_Op_RR1,
	Op_RA1 => w_Op_RA1,
	Op_ENS => w_Op_ENS,
	Op_CMP => w_Op_CMP,
	-- Category = Immediate values
	Op_LIL => w_Op_LIL,
	Op_LIU => w_Op_LIU,
	-- Category = Load/Store to/from Data Memory
	Op_LDB => w_Op_LDB,
	Op_SDB => w_Op_SDB,
	Op_LDS => w_Op_LDS,
	Op_SDS => w_Op_SDS,
	Op_LDL => w_Op_LDL,
	Op_SDL => w_Op_SDL,
	-- Category = Load/Store to/from Peripheral I/O space
	Op_LPB => w_Op_LPB,
	Op_SPB => w_Op_SPB,
	Op_LPS => w_Op_LPS,
	Op_SPS => w_Op_SPS,
	Op_LPL => w_Op_LPL,
	Op_SPL => w_Op_SPL,
	-- Category = Stack
	Op_PSS => w_Op_PSS,
	Op_PUS => w_Op_PUS,
	Op_SSS => w_Op_SSS,
	Op_LSS => w_Op_LSS,
	-- Category = Flow Control
	Op_JSR => w_Op_JSR,
	Op_RTS => w_Op_RTS,
	Op_BRA => w_Op_BRA,
	Op_BCS => w_Op_BCS,
	Op_BCC => w_Op_BCC,
	Op_BEZ => w_Op_BEZ,
	Op_BE1 => w_Op_BE1,
	Op_BOV => w_Op_BOV,
	Op_BEQ => w_Op_BEQ,
	o_save_CCR_bits => w_save_CCR_bits,
	-- increment or branch?
	o_TakeBranch => w_TakeBranch
	);

	ALU : entity work.ALU
	port map (
		i_regDataA => w_regDataA,
		i_regDataB => w_regDataB,
		i_Op_ADS => w_Op_ADS,
		i_Op_MUL => w_Op_MUL,
		i_Op_CMP => w_Op_CMP,
		i_Op_ARS => w_Op_ARS,
		i_Op_XRS => w_Op_XRS,
		i_Op_ORS => w_Op_ORS,
		i_Op_LS1 => w_Op_LS1,
		i_Op_RS1 => w_Op_RS1,
		i_Op_LR1 => w_Op_LR1,
		i_Op_RR1 => w_Op_RR1,
		i_Op_RA1 => w_Op_RA1,
 		o_ALUDataOut => w_ALUDataOut,
		o_CondCodeBits => w_CondCodeBits
	);

	Instr_ROM : ENTITY work.BlockRom_Instruction
	PORT MAP (
		address		=> w_InstructionRomAddress(8 downto 0),
		clken			=> w_OneHotState(5),
		clock 		=> CLOCK_50,
		q 				=> w_InstructionRomData
	);
	
	InstructionROMDataOutputLatch : ENTITY work.REG_32
	PORT MAP (
    d   	=> w_InstructionRomData,
    ld  	=> w_OneHotState(1),
    clr 	=> not n_reset,
    clk 	=> CLOCK_50,
    q		=> q_InstructionRomData
	);
	
	Stack_RAM : ENTITY work.BlockRam_Stack
	PORT MAP	(
		address => w_StackRamAddress(7 downto 0),
		clock => CLOCK_50,
		data => w_regDataA,
		wren => w_writeStackRamEn,
		q => w_dataFromStackRam
	);

	w_writeToDataRamEnable <= '1' when (w_OneHotState(5) = '1' and (w_Op_SDB = '1' or w_Op_SDS = '1' or w_Op_SDL = '1')) else '0';
	
	Data_RAM : ENTITY work.BlockRam_Data
	PORT MAP (
		clock => CLOCK_50,
		data => w_regDataA,
		rdaddress => w_DataRamAddress(7 downto 0),
		wraddress => w_DataRamAddress(7 downto 0),
		wren => w_writeToDataRamEnable,
		q => w_dataFromDataRam
	);
	
	w_dataIntoRegisterFile <= 
		w_dataFromDataRam when ((w_Op_LDB = '1') or (w_Op_LDS = '1') or (w_Op_LPL = '1')) else
		w_dataFromStackRam when (w_Op_PUS = '1') else
		w_dataFromPeripherals when ((w_Op_LPB = '1') or (w_Op_LPS = '1') or (w_Op_LPL = '1')) else
		w_ALUDataOut;
	
	RegisterFile : entity work.RegisterFile
	port map (
		i_clk							=> CLOCK_50,
		i_clear						=> not n_reset,
		i_enable						=> w_OneHotState(4),
		i_TakeBranch				=> w_TakeBranch,
		i_wrRegSel					=> q_InstructionRomData(23 downto 20),
		i_rdRegSelA					=> q_InstructionRomData(15 downto 12),
		i_rdRegSelB					=> q_InstructionRomData(19 downto 16),
		i_regDataIn					=> w_dataIntoRegisterFile,
		i_CCR							=> w_CondCodeBits,
		o_regDataOutA				=> w_regDataA,
		o_regDataOutB				=> w_regDataB,
		o_StackRamAddress			=> w_StackRamAddress,
		o_PeripheralAddress		=> w_PeripheralAddress,
		o_DataRamAddress			=> w_DataRamAddress,
		o_InstructionRomAddress	=> w_InstructionRomAddress,
		i_save_CCR_bits			=> w_save_CCR_bits,
		o_CCR							=> w_CCR
	);

	w_peripheralRdStrobe <= '1' when (w_OneHotState(5) = '1' and (w_Op_LPB = '1' or w_Op_LPS = '1' or w_Op_LPL = '1')) else '0';
	w_peripheralWrStrobe <= '1' when (w_OneHotState(5) = '1' and (w_Op_SPB = '1' or w_Op_SPS = '1' or w_Op_SPL = '1')) else '0';
	Peripherals : entity work.PeripheralInterface
	port MAP (
		n_reset					=>  n_reset,
		CLOCK_50					=> CLOCK_50,
		Video_Clk				=> w_Video_Clk,
		peripheralAddress		=> w_peripheralAddress,
		dataToPeripherals		=> w_regDataA,
		dataFromPeripherals	=> w_dataFromPeripherals,
		peripheralRdStrobe	=> w_peripheralRdStrobe,
		peripheralWrStrobe	=> w_peripheralWrStrobe,
		rxd						=> SerRxd,
		txd						=> SerTxd,
		rts						=> SerRts,
		VoutVect					=> VideoVect,
		PS2_CLK					=> ps2Clk,
		PS2_DATA					=> ps2Data
		);

end;
