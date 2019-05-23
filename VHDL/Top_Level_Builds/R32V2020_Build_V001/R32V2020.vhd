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

signal	Op_NOP : std_logic := '0';		-- No operation
signal	Op_HCF : std_logic := '0';		-- Halt and Catch Fire
signal	Op_RES : std_logic := '0';		-- Reset CPU
signal	Op_ADS : std_logic := '0';		-- Add 2 regs and store in 3rd
signal	Op_CMP : std_logic := '0';		-- Compare 2 regs and set cond codes
signal	Op_MUL : std_logic := '0';		-- Multiply 2 regs and store in 3rd
--signal	Op_MAO : std_logic;
signal	Op_ORS  : std_logic := '0';	-- OR 2 regs and store in 3rd
signal	Op_ARS  : std_logic := '0';	-- AND 2 regs and store in 3rd
signal	Op_XRS  : std_logic := '0';	-- XOR 2 regs and store in 3rd
signal	Op_LS1  : std_logic := '0';	-- Logical Shift left by 1
signal	Op_RS1  : std_logic := '0';	-- Logical Shift right by 1
signal	Op_LR1  : std_logic := '0';	-- Rotate left by 1
signal	Op_RR1  : std_logic := '0';	-- Rotate right by 12
signal	Op_RA1  : std_logic := '0';	-- Right arithmetic shift
signal	Op_ENS  : std_logic := '0';	-- Swap endian
signal	Op_LIL  : std_logic := '0';	-- Load Register Immediate Lower
signal	Op_LIU  : std_logic := '0';	-- Load Register Immediate Upper
signal	Op_LDB  : std_logic := '0';	-- Load Data Byte
signal	Op_SDB  : std_logic := '0';	-- Store Data Byte
signal	Op_LDS  : std_logic := '0';	-- Load Data Short
signal	Op_SDS  : std_logic := '0';	-- Store Data Short
signal	Op_LDL  : std_logic := '0';	-- Load Data Long
signal	Op_SDL  : std_logic := '0';	-- Store Data Long
signal	Op_LPB  : std_logic := '0';	-- Load Peripheral Byte
signal	Op_SPB  : std_logic := '0';	-- Store Peripheral Byte
signal	Op_LPS  : std_logic := '0';	-- Load Peripheral Short
signal	Op_SPS  : std_logic := '0';	-- Store Peripheral Short
signal	Op_LPL  : std_logic := '0';	-- Load Peripheral Long
signal	Op_SPL  : std_logic := '0';	-- Store Peripheral Long
signal	Op_PSS  : std_logic := '0';	-- Push register to Stack
signal	Op_PUS  : std_logic := '0';	-- Pull register from Stack
signal	Op_SSS  : std_logic := '0';	-- Store to stack memory
signal	Op_SUS  : std_logic := '0';	-- Load from stack memory
signal	Op_LSS  : std_logic := '0';	-- Store to stack memory
signal	Op_JSR  : std_logic := '0';	-- Jump to Subroutine
signal	Op_RTS  : std_logic := '0';	-- Return from Subroutine
signal	Op_BRA  : std_logic := '0';	-- Branch Always
signal	Op_BCS  : std_logic := '0';	-- Branch if carry is set
signal	Op_BCC  : std_logic := '0';	-- Branch if carry is clear
signal	Op_BEZ  : std_logic := '0';	-- Branch if equal to zero
signal	Op_BE1  : std_logic := '0';	-- Branch if equal to one
signal	Op_BOV  : std_logic := '0';	-- Branch if overflow
signal	Op_BEQ  : std_logic := '0';	-- Branch if equal

signal	Video_Clk	: std_logic := '0';

signal	regDataA		: std_logic_vector(31 downto 0) := x"00000000";
signal	regDataB		: std_logic_vector(31 downto 0) := x"00000000";
signal	ALUDataOut	: std_logic_vector(31 downto 0) := x"00000000";
signal	CondCodeBits: std_logic_vector(31 downto 0) := x"00000000";
signal	CCR			: std_logic_vector(31 downto 0) := x"00000000";

signal	ldDestRegister			: std_logic := '0';
signal	dataIntoRegisterFile	: std_logic_vector(31 downto 0) := x"00000000";

signal	o_InstructionRomAddress	: std_logic_vector(31 downto 0) := x"00000000";
signal	InstructionRomData		: std_logic_vector(31 downto 0) := x"00000000";
signal	q_InstructionRomData		: std_logic_vector(31 downto 0) := x"00000000";

signal	StackRamAddress		: std_logic_vector(31 downto 0) := x"00000000";
--signal	dataToStackRam			: std_logic_vector(31 downto 0) := x"00000000";
signal	writeStackRamEn		: std_logic := '0';
signal	dataFromStackRam		: std_logic_vector(31 downto 0) := x"00000000";

signal	DataRamAddress				: std_logic_vector(31 downto 0) := x"00000000";
signal	dataToDataRam				: std_logic_vector(31 downto 0) := x"00000000";
signal	dataRamWriteAddress		: std_logic_vector(31 downto 0) := x"00000000";
signal	writeToDataRamEnable		: std_logic;
signal	dataFromDataRam			: std_logic_vector(31 downto 0) := x"00000000";

signal	q_displayed_number		: std_logic_vector(15 downto 0) := x"0000";

signal	peripheralAddress		: std_logic_vector(31 downto 0) := x"00000000";
signal	dataFromPeripherals	: std_logic_vector(31 downto 0) := x"00000000";
signal	dataToPeripherals		: std_logic_vector(31 downto 0) := x"00000000";
signal	peripheralRdStrobe	: std_logic;
signal	peripheralWrStrobe	: std_logic;

signal	OneHotState				: std_logic_vector(5 downto 0) := "000000";

signal	holdHaltCatchFire		: std_logic := '0';

signal	Inc1Branch0				: std_logic := '0';

begin

	holdHaltCatchFire	<= '1' when OneHotState(3) = '1' and Op_HCF = '1' and n_reset = '1' else '0';
	ldDestRegister <= '1' when (OneHotState(3) = '1' and Inc1Branch0 = '0' and n_reset = '1') else '0';
	writeStackRamEn <= '1' when (OneHotState(3) = '1' and (Op_PSS = '1' or Op_SSS = '1') and n_reset = '1') else '0';

	clockGen : ENTITY work.VideoClk_SVGA_800x600
	PORT map 	(
		areset	=> not n_reset,
		inclk0	=> CLOCK_50,
		c0			=> Video_Clk
	);
	
	StateMachine : entity work.OneHotStateMachine
	PORT map (
		clk 	=> CLOCK_50,
		clr 	=> not n_reset,
		hold	=> holdHaltCatchFire,
		state	=> OneHotState
	);
	
	SevenSegDisplay : entity work.Loadable_7S4D_LED
    Port map ( 
		i_clock_50Mhz 			=> CLOCK_50,
      i_reset					=> not n_reset,
		i_displayed_number	=> q_displayed_number,
      o_Anode_Activate		=> Anode_Activate,
      o_LED_out 				=> LED_out		-- Cathode patterns of 7-segment display
	);

	SevenSegmentDisplayLatch : ENTITY work.REG_16
	PORT MAP (
    d   	=> q_InstructionRomData(31 downto 24)&o_InstructionRomAddress(7 downto 0),
    ld  	=> OneHotState(4),
    clr 	=> not n_reset,
    clk 	=> CLOCK_50,
    q		=> q_displayed_number
	);
	
	opcodeDecoder : entity work.OpCodeDecoder
	port map (
		InstrOpCode => q_InstructionRomData(31 downto 24),
		-- Category = System
		Op_NOP => Op_NOP,
		Op_HCF => Op_HCF,
		Op_RES => Op_RES,
		-- Category = ALU
		Op_ADS => Op_ADS,
		Op_MUL => Op_MUL,
		Op_CMP => Op_CMP,
		Op_ORS => Op_ORS,
		Op_ARS => Op_ARS,
		Op_XRS => Op_XRS,
		Op_LS1 => Op_LS1,
		Op_RS1 => Op_RS1,
		Op_LR1 => Op_LR1,
		Op_RR1 => Op_RR1,
		Op_RA1 => Op_RA1,
		Op_ENS => Op_ENS,
		-- Category = Immediate values
		Op_LIL => Op_LIL,
		Op_LIU => Op_LIU,
		-- Category = Load/Store
		Op_LDB => Op_LDB,
		Op_SDB => Op_SDB,
		Op_LDS => Op_LDS,
		Op_SDS => Op_SDS,
		Op_LDL => Op_LDL,
		Op_SDL => Op_SDL,
		-- Category = Peripheral I/O
		Op_LPB => Op_LPB,
		Op_SPB => Op_SPB,
		Op_LPS => Op_LPS,
		Op_SPS => Op_SPS,
		Op_LPL => Op_LPL,
		Op_SPL => Op_SPL,
		-- Category = Stack
		Op_PSS => Op_PSS,
		Op_PUS => Op_PUS,
		Op_SSS => Op_SSS,
		Op_LSS => Op_LSS,		
		-- Category = Flow Control
		Op_JSR => Op_JSR,
		Op_RTS => Op_RTS,
		Op_BRA => Op_BRA,
		Op_BCS => Op_BCS,
		Op_BCC => Op_BCC,
		Op_BEZ => Op_BEZ,
		Op_BE1 => Op_BE1,
		Op_BOV => Op_BOV,
		Op_BEQ => Op_BEQ
	);
	
flowControl : ENTITY work.CCRControl PORT map 
	(
	CCR		=> CCR,
	Op_NOP => Op_NOP,
	Op_HCF => Op_HCF,
	Op_RES => Op_RES,
	-- Category = ALU
	Op_ADS => Op_ADS,
	Op_MUL => Op_MUL,
	Op_ORS => Op_ORS,
	Op_ARS => Op_ARS,
	Op_XRS => Op_XRS,
	Op_LS1 => Op_LS1,
	Op_RS1 => Op_RS1,
	Op_LR1 => Op_LR1,
	Op_RR1 => Op_RR1,
	Op_RA1 => Op_RA1,
	Op_ENS => Op_ENS,
	Op_CMP => Op_CMP,
	-- Category = Immediate values
	Op_LIL => Op_LIL,
	Op_LIU => Op_LIU,
	-- Category = Load/Store to/from Data Memory
	Op_LDB => Op_LDB,
	Op_SDB => Op_SDB,
	Op_LDS => Op_LDS,
	Op_SDS => Op_SDS,
	Op_LDL => Op_LDL,
	Op_SDL => Op_SDL,
	-- Category = Load/Store to/from Peripheral I/O space
	Op_LPB => Op_LPB,
	Op_SPB => Op_SPB,
	Op_LPS => Op_LPS,
	Op_SPS => Op_SPS,
	Op_LPL => Op_LPL,
	Op_SPL => Op_SPL,
	-- Category = Stack
	Op_PSS => Op_PSS,
	Op_PUS => Op_PUS,
	Op_SSS => Op_SSS,
	Op_LSS => Op_LSS,
	-- Category = Flow Control
	Op_JSR => Op_JSR,
	Op_RTS => Op_RTS,
	Op_BRA => Op_BRA,
	Op_BCS => Op_BCS,
	Op_BCC => Op_BCC,
	Op_BEZ => Op_BEZ,
	Op_BE1 => Op_BE1,
	Op_BOV => Op_BOV,
	Op_BEQ => Op_BEQ,
	-- increment or branch?
	o_Inc1Branch0 => Inc1Branch0
	);

	ALU : entity work.ALU
	port map (
		i_regDataA => regDataA,
		i_regDataB => regDataB,
		i_Op_ADS => Op_ADS,
		i_Op_MUL => Op_MUL,
		i_Op_CMP => Op_CMP,
		i_Op_ARS => Op_ARS,
		i_Op_XRS => Op_XRS,
		i_Op_ORS => Op_ORS,
		i_Op_LS1 => Op_LS1,
		i_Op_RS1 => Op_RS1,
		i_Op_LR1 => Op_LR1,
		i_Op_RR1 => Op_RR1,
		i_Op_RA1 => Op_RA1,
		
 		o_ALUDataOut => ALUDataOut,
		o_CondCodeBits => CondCodeBits
	);

	Instr_ROM : ENTITY work.BlockRom_Instruction
	PORT MAP (
		address		=> o_InstructionRomAddress(7 downto 0),
		clken			=> OneHotState(5),
		clock 		=> CLOCK_50,
		q 				=> InstructionRomData
	);
	
	InstructionROMDataOutputLatch : ENTITY work.REG_32
	PORT MAP (
    d   	=> InstructionRomData,
    ld  	=> OneHotState(1),
    clr 	=> not n_reset,
    clk 	=> CLOCK_50,
    q		=> q_InstructionRomData
	);
	
	Stack_RAM : ENTITY work.BlockRam_Stack
	PORT MAP	(
		address => StackRamAddress(7 downto 0),
		clock => CLOCK_50,
		data => regDataA,
		wren => writeStackRamEn,
		q => dataFromStackRam
	);

	writeToDataRamEnable <= '1' when (OneHotState(5) = '1' and (Op_SDB = '1' or Op_SDS = '1' or Op_SDL = '1')) else '0';
	
	Data_RAM : ENTITY work.BlockRam_Data
	PORT MAP (
		clock => CLOCK_50,
		data => regDataA,
		rdaddress => DataRamAddress(7 downto 0),
		wraddress => DataRamAddress(7 downto 0),
		wren => writeToDataRamEnable,
		q => dataFromDataRam
	);
	
	dataIntoRegisterFile <= 
		dataFromDataRam when ((Op_LDB = '1') or (Op_LDS = '1') or (Op_LPL = '1')) else
		dataFromStackRam when (Op_PUS = '1') else
		dataFromPeripherals when ((Op_LPB = '1') or (Op_LPS = '1') or (Op_LPL = '1')) else
		ALUDataOut;

	RegisterFile : entity work.RegisterFile
	port map (
		clk							=> CLOCK_50,
		clear							=> not n_reset,
		enable						=> ldDestRegister and OneHotState(4),
		wrRegSel						=> q_InstructionRomData(23 downto 20),
		rdRegSelA					=> q_InstructionRomData(15 downto 12),
		rdRegSelB					=> q_InstructionRomData(19 downto 16),
		regDataIn					=> dataIntoRegisterFile,
		regDataOutA					=> regDataA,
		regDataOutB					=> regDataB,
		i_CCR							=> CondCodeBits,
		o_StackRamAddress			=> StackRamAddress,
		o_PeripheralAddress		=> PeripheralAddress,
		o_DataRamAddress			=> DataRamAddress,
		o_InstructionRomAddress	=> o_InstructionRomAddress,
		o_CCR							=> CCR
	);

	peripheralRdStrobe <= '1' when (OneHotState(5) = '1' and (Op_LPB = '1' or Op_LPS = '1' or Op_LPL = '1')) else '0';
	peripheralWrStrobe <= '1' when (OneHotState(5) = '1' and (Op_SPB = '1' or Op_SPS = '1' or Op_SPL = '1')) else '0';
	Peripherals : entity work.PeripheralInterface
	port MAP (
		n_reset					=>  n_reset,
		CLOCK_50					=> CLOCK_50,
		Video_Clk				=> Video_Clk,
		peripheralAddress		=> peripheralAddress,
		dataToPeripherals		=> regDataA,
		dataFromPeripherals	=> dataFromPeripherals,
		peripheralRdStrobe	=> peripheralRdStrobe,
		peripheralWrStrobe	=> peripheralWrStrobe,
		rxd						=> SerRxd,
		txd						=> SerTxd,
		rts						=> SerRts,
		VoutVect					=> VideoVect,
		PS2_CLK					=> ps2Clk,
		PS2_DATA					=> ps2Data
		);

end;
