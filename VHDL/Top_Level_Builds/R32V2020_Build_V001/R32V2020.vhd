-- Top Level Entity for R32V2020

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity R32V2020 is
	port(
		n_reset		: in std_logic;
		CLOCK_50		: in std_logic;
		
		rxd			: in std_logic;
		txd			: out std_logic;
		rts			: out std_logic;

		VoutVect		: out std_logic_vector(17 downto 0); -- rrrrr,gggggg,bbbbb,hsync,vsync
		
		switch0		: in std_logic;
		switch1		: in std_logic;
		switch2		: in std_logic;

		LED1			: out std_logic;
		LED2			: out std_logic;
		LED3			: out std_logic;
		LED4			: out std_logic;

		BUZZER		: out std_logic;

		ps2Clk		: in std_logic;
		ps2Data		: in std_logic;
		
		Anode_Activate : out std_logic_vector(3 downto 0);
		LED_out			: out std_logic_vector(6 downto 0)

		);
end R32V2020;

architecture struct of R32V2020 is

signal	Op_HCF : std_logic;
signal	Op_NOP : std_logic;
signal	Op_RES : std_logic;
signal	Op_ADS : std_logic;
signal	Op_CMP : std_logic;
signal	Op_MUL : std_logic;
signal	Op_MAO : std_logic;
signal	Op_ORS  : std_logic;
signal	Op_ARS  : std_logic;
signal	Op_XRS  : std_logic;
signal	Op_LS1  : std_logic;
signal	Op_RS1  : std_logic;
signal	Op_LR1  : std_logic;
signal	Op_RR1  : std_logic;
signal	Op_RA1  : std_logic;
signal	Op_ENS  : std_logic;
signal	Op_LIL  : std_logic;
signal	Op_LIU  : std_logic;
signal	Op_LDB  : std_logic;
signal	Op_SDB  : std_logic;
signal	Op_LDS  : std_logic;
signal	Op_SDS  : std_logic;
signal	Op_SDL  : std_logic;
signal	Op_LPB  : std_logic;
signal	Op_SPB  : std_logic;
signal	Op_LPS  : std_logic;
signal	Op_SPS  : std_logic;
signal	Op_LPL  : std_logic;
signal	Op_SPL  : std_logic;
signal	Op_PSS  : std_logic;
signal	Op_PUS  : std_logic;
signal	Op_JSR  : std_logic;
signal	Op_RTS  : std_logic;
signal	Op_BRA  : std_logic;
signal	Op_BCS  : std_logic;
signal	Op_BCC  : std_logic;
signal	Op_BOV  : std_logic;
signal	Op_BEQ  : std_logic;

signal	Video_Clk	: std_logic;

signal	regDataA		: std_logic_vector(31 downto 0);
signal	regDataB		: std_logic_vector(31 downto 0);
signal	ALUDataOut	: std_logic_vector(31 downto 0);
signal	CondCodeBits: std_logic_vector(31 downto 0);
signal	CCR			: std_logic_vector(31 downto 0);

signal	writeRegFileStrobe	: std_logic;
signal	dataIntoRegisterFile	: std_logic_vector(31 downto 0);

signal	InstructionAddress	: std_logic_vector(31 downto 0);
signal	BlockInstructionRamData					: std_logic_vector(31 downto 0);

signal	StackAddress	: std_logic_vector(31 downto 0);
signal	dataToStackRam			: std_logic_vector(31 downto 0);
signal	writeStackRam			: std_logic;
signal	dataFromStackRam		: std_logic_vector(31 downto 0);

signal	dataToDataRam				: std_logic_vector(31 downto 0);
signal	DataAddress		: std_logic_vector(31 downto 0);
signal	dataRamWriteAddress		: std_logic_vector(31 downto 0);
signal	writeToDataRamEnable		: std_logic;
signal	dataFromDataRam			: std_logic_vector(31 downto 0);

signal	peripheralAddress		: std_logic_vector(31 downto 0);
signal	peripheralDataIn		: std_logic_vector(31 downto 0);
signal	peripheralDataOut		: std_logic_vector(31 downto 0);
signal	peripheralRdStrobe	: std_logic;
signal	peripheralWrStrobe	: std_logic;

begin

	clockGen : ENTITY work.VideoClk_SVGA_800x600
	PORT map 	(
		areset	=> not n_reset,
		inclk0	=> CLOCK_50,
		c0			=> Video_Clk
	);
	
	opcodeDecoder : entity work.OpCodeDecoder
	port map (
		InstrOpCode => BlockInstructionRamData(31 downto 24),
		-- Category = System
		Op_HCF => Op_HCF,
		Op_NOP => Op_NOP,
		Op_RES => Op_RES,
		-- Category = ALU
		Op_ADS => Op_ADS,
		Op_MUL => Op_MUL,
		Op_MAO => Op_MAO,
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
		-- Category = Flow Control
		Op_JSR => Op_JSR,
		Op_RTS => Op_RTS,
		Op_BRA => Op_BRA,
		Op_BCS => Op_BCS,
		Op_BCC => Op_BCC,
		Op_BOV => Op_BOV,
		Op_BEQ => Op_BEQ
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
		address => InstructionAddress(7 downto 0),
		clock => CLOCK_50,
		q => BlockInstructionRamData
	);

	StackRAM : ENTITY work.BlockRam_Stack
	PORT MAP	(
		address => StackAddress(7 downto 0),
		clock => CLOCK_50,
		data => dataToStackRam,
		wren => writeStackRam,
		q => dataFromStackRam
	);

	RegisterFile : entity work.RegisterFile
	port map (
		clk			=> CLOCK_50,
		clear			=> not n_reset,
		wrStrobe		=> writeRegFileStrobe,
		wrRegSel		=> BlockInstructionRamData(23 downto 20),
		rdRegSelA	=> BlockInstructionRamData(15 downto 12),
		rdRegSelB	=> BlockInstructionRamData(19 downto 16),
		regDataIn	=> dataIntoRegisterFile,
		regDataOutA	=> regDataA,
		regDataOutB	=> regDataB,
		i_CCR						=> CondCodeBits,
		o_StackAddress			=> StackAddress,
		o_PeripheralAddress	=> PeripheralAddress,
		o_DataAddress			=> DataAddress,
		o_InstructionAddress	=> InstructionAddress,
		o_CCR						=> CCR
	);

	DataRAM : ENTITY work.BlockRam_Data
	PORT MAP (
		clock => CLOCK_50,
		data => dataToDataRam,
		rdaddress => DataAddress(7 downto 0),
		wraddress => DataAddress(7 downto 0),
		wren => writeToDataRamEnable,
		q => dataFromDataRam
	);

	Peripherals : entity work.PeripheralInterface
	port MAP (
		n_reset					=> n_reset,
		CLOCK_50					=> CLOCK_50,
		Video_Clk				=> Video_Clk,
		peripheralAddress		=> peripheralAddress,
		peripheralDataIn		=> peripheralDataIn,
		peripheralDataOut		=> peripheralDataOut,
		peripheralRdStrobe	=> peripheralRdStrobe,
		peripheralWrStrobe	=> peripheralWrStrobe,
		rxd						=> rxd,
		txd						=> txd,
		VoutVect					=> VoutVect,
		PS2_CLK					=> ps2Clk,
		PS2_DATA					=> ps2Data

		);

end;
