-- Top Level Entity for R32V2020 RISC CPU

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

library work;
use work.R32V2020_Pkg.all;

entity R32V2020 is
	port(
		n_reset						: in std_logic := '1';
		-- Clocks and states
		i_CLOCK_50					: in std_logic := '1';
		o_OneHotState				: buffer std_logic_vector(3 downto 0) := "00000";
		-- Instruction ROM connections
		i_InstructionRomData		: in std_logic_vector(31 downto 0) := x"00000000";
		o_InstructionRomAddress	: buffer std_logic_vector(31 downto 0) := x"00000000";
		o_clkInstrRomAddr			: out std_logic := '0';
--		o_clkInstrRomData			: out std_logic := '0';
		-- Stack RAM connections
		o_StackRamAddress			: out std_logic_vector(31 downto 0) := x"00000000";
		o_dataToStackRam			: out std_logic_vector(31 downto 0) := x"00000000";
		i_dataFromStackRam		: in std_logic_vector(31 downto 0) := x"00000000";
		o_writeStackRamEn			: out std_logic := '0';
		-- Data RAM connections
		o_DataRamAddress			: out std_logic_vector(31 downto 0) := x"00000000";
		o_DataOutFromRegA			: buffer std_logic_vector(31 downto 0) := x"00000000";
		i_dataFromDataRam			: in std_logic_vector(31 downto 0) := x"00000000";
		o_writeToDataRamEnable	: out std_logic := '0';
		o_loadData  				: out std_logic := '0';
		o_storeData 				: out std_logic := '0';
		o_longData  				: out std_logic := '0';
		o_shortData 				: out std_logic := '0';
		o_ByteData  				: out std_logic := '0';

		-- Peripheral Space Connections
		o_peripheralAddress		: out std_logic_vector(31 downto 0) := x"00000000";
		i_dataFromPeripherals	: in std_logic_vector(31 downto 0) := x"00000000";
		o_peripheralRdStrobe		: out std_logic := '0';
		o_peripheralWrStrobe		: out std_logic := '0'
		);
end R32V2020;

architecture struct of R32V2020 is

attribute syn_keep: boolean;

signal	w_Op_NOP : std_logic := '0';		-- No Operation (advance PC)
signal	w_Op_HCF : std_logic := '0';		-- Halt and Catch Fire
signal	w_Op_ADD : std_logic := '0';		-- Add 2 regs and store in 3rd
signal	w_Op_SUB : std_logic := '0';		-- Subtract 2 regs and store in 3rd
signal	w_Op_CMP : std_logic := '0';		-- Compare 2 regs and set cond codes
signal	w_Op_MUL	: std_logic := '0';		-- Multiply 2 regs and store in 3rd
signal	w_Op_OR	: std_logic := '0';		-- OR 2 regs and store in 3rd
signal	w_Op_AND	: std_logic := '0';		-- AND 2 regs and store in 3rd
signal	w_Op_XOR	: std_logic := '0';		-- XOR 2 regs and store in 3rd
--
signal	w_Op_SL1  : std_logic := '0';		-- Logical Shift left by 1
signal	w_Op_SL8  : std_logic := '0';		-- Logical Shift left by 8
signal	w_Op_SR1  : std_logic := '0';		-- Logical Shift right by 1
signal	w_Op_SR8  : std_logic := '0';		-- Logical Shift right by 8
signal	w_Op_ROL1 : std_logic := '0';		-- Rotate left by 1
signal	w_Op_ROR1 : std_logic := '0';		-- Rotate right by 12
signal	w_Op_ASR  : std_logic := '0';		-- Right arithmetic shift
signal	w_Op_ENS  : std_logic := '0';		-- Swap endian
--
signal	w_Op_LIL  : std_logic := '0';		-- Load Register Immediate Lower
signal	w_Op_LIU  : std_logic := '0';		-- Load Register Immediate Upper
signal	w_Op_LIX  : std_logic := '0';		-- Load Register Immediate Extend Lower
-- Data
signal	w_Op_LDB  : std_logic := '0';		-- Load Data Byte
signal	w_Op_SDB  : std_logic := '0';		-- Store Data Byte
signal	w_Op_LDS  : std_logic := '0';		-- Load Data Short
signal	w_Op_SDS  : std_logic := '0';		-- Store Data Short
signal	w_Op_LDL  : std_logic := '0';		-- Load Data Long
signal	w_Op_SDL  : std_logic := '0';		-- Store Data Long
signal	w_Op_LDBP  : std_logic := '0';		-- Load Data Byte
signal	w_Op_SDBP  : std_logic := '0';		-- Store Data Byte
signal	w_Op_LDSP  : std_logic := '0';		-- Load Data Short
signal	w_Op_SDSP  : std_logic := '0';		-- Store Data Short
signal	w_Op_LDLP  : std_logic := '0';		-- Load Data Long
signal	w_Op_SDLP  : std_logic := '0';		-- Store Data Long
--
signal	w_Op_LPB  : std_logic := '0';		-- Load Peripheral Byte
signal	w_Op_SPB  : std_logic := '0';		-- Store Peripheral Byte
signal	w_Op_LPS  : std_logic := '0';		-- Load Peripheral Short
signal	w_Op_SPS  : std_logic := '0';		-- Store Peripheral Short
signal	w_Op_LPL  : std_logic := '0';		-- Load Peripheral Long
signal	w_Op_SPL  : std_logic := '0';		-- Store Peripheral Long
signal	w_Op_LPBP  : std_logic := '0';		-- Load Peripheral Byte
signal	w_Op_SPBP  : std_logic := '0';		-- Store Peripheral Byte
signal	w_Op_LPSP  : std_logic := '0';		-- Load Peripheral Short
signal	w_Op_SPSP  : std_logic := '0';		-- Store Peripheral Short
signal	w_Op_LPLP  : std_logic := '0';		-- Load Peripheral Long
signal	w_Op_SPLP  : std_logic := '0';		-- Store Peripheral Long
--
signal	w_Op_PUSH  : std_logic := '0';		-- Push register to Stack
signal	w_Op_PULL  : std_logic := '0';		-- Pull register from Stack
signal	w_Op_SSS  : std_logic := '0';		-- Store to stack memory
signal	w_Op_LSS  : std_logic := '0';		-- Load from stack memory
signal	w_Op_BRA  : std_logic := '0';		-- Branch Always
signal	w_Op_BCS  : std_logic := '0';		-- Branch if carry is set
signal	w_Op_BCC  : std_logic := '0';		-- Branch if carry is clear
signal	w_Op_BEZ  : std_logic := '0';		-- Branch if equal to zero
signal	w_Op_BE1  : std_logic := '0';		-- Branch if equal to one
signal	w_Op_BGT  : std_logic := '0';		-- Branch if greater than
signal	w_Op_BLT  : std_logic := '0';		-- Branch if less than
signal	w_Op_BEQ  : std_logic := '0';		-- Branch if equal
signal	w_Op_BNE  : std_logic := '0';		-- Branch if not equal
signal	w_Op_BNZ  : std_logic := '0';		-- Branch if not zero
signal	w_Op_BSR  : std_logic := '0';		-- Branch to subroutine
--attribute syn_keep of w_Op_PULL: signal is true;

signal	w_regDataB					: std_logic_vector(31 downto 0) := x"00000000";
signal	w_ALUDataOut				: std_logic_vector(31 downto 0) := x"00000000";
signal	w_CondCodeBits				: std_logic_vector(31 downto 0) := x"00000000";
signal	w_CCR							: std_logic_vector(31 downto 0) := x"00000000";

signal	w_ldDestRegister			: std_logic := '0';
signal	w_dataIntoRegisterFile	: std_logic_vector(31 downto 0) := x"00000000";
--attribute syn_keep of w_dataIntoRegisterFile: signal is true;

signal	w_BranchAddress			: std_logic_vector(31 downto 0) := x"00000000";

signal	w_InstructionRomData		: std_logic_vector(31 downto 0) := x"00000000";
attribute syn_keep of w_InstructionRomData : signal is true;

signal	w_StackRamAddress			: std_logic_vector(31 downto 0) := x"00000000";
signal	w_writeStackRamEn			: std_logic := '0';
signal	w_dataFromStackRam		: std_logic_vector(31 downto 0) := x"00000000";

signal	w_DataRamAddress			: std_logic_vector(31 downto 0) := x"00000000";
-- signal	w_dataToDataRam			: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataRamWriteAddress	: std_logic_vector(31 downto 0) := x"00000000";
signal	w_writeToDataRamEnable	: std_logic;
signal	w_dataFromDataRam			: std_logic_vector(31 downto 0) := x"00000000";

signal	w_displayed_number		: std_logic_vector(15 downto 0) := x"0000";

signal	w_peripheralAddress		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataFromPeripherals	: std_logic_vector(31 downto 0) := x"00000000";
signal	w_dataToPeripherals		: std_logic_vector(31 downto 0) := x"00000000";
signal	w_peripheralRdStrobe		: std_logic := '0';
signal	w_peripheralWrStrobe		: std_logic := '0';

--attribute syn_keep of w_peripheralRdStrobe: signal is true;
--attribute syn_keep of w_peripheralWrStrobe: signal is true;

signal	w_OneHotState				: std_logic_vector(4 downto 0) := "00000";
signal	w_save_CCR_bits			: std_logic := '0';

signal	w_holdHaltCatchFire		: std_logic := '0';
signal	w_wrRegFile					: std_logic := '0';
--attribute syn_keep of w_wrRegFile : signal is true;

signal	w_TakeBranch				: std_logic := '0';
-- attribute syn_keep of w_TakeBranch: signal is true;

begin

	o_loadData  <= w_Op_LDB or w_Op_LDS or w_Op_LDL or w_Op_LDBP or w_Op_LDSP or w_Op_LDLP;
	o_storeData <= w_Op_SDB or w_Op_SDS or w_Op_SDL or w_Op_SDBP or w_Op_SDSP or w_Op_SDLP;

	o_longData  <= w_Op_LDL or w_Op_SDL or w_Op_LDLP or w_Op_SDLP;
	o_shortData <= w_Op_LDS or	w_Op_SDS or w_Op_LDSP or w_Op_SDSP;
	o_ByteData  <= w_Op_LDB or w_Op_SDB or w_Op_LDBP or w_Op_SDBP;

 	w_holdHaltCatchFire		<= '1' when (o_OneHotState(2) = '1' and  w_Op_HCF = '1' and n_reset  = '1') else '0';
	o_writeStackRamEn 		<= '1' when  o_OneHotState(2) = '1' and (w_Op_PUSH = '1' or  w_Op_SSS = '1' or  w_Op_BSR = '1') and n_reset  = '1'   else '0';
	o_peripheralRdStrobe 	<= '1' when (o_OneHotState(3) = '1' and (w_Op_LPB = '1' or  w_Op_LPS = '1'  or  w_Op_LPL = '1' or w_Op_LPBP = '1' or  w_Op_LPSP = '1'  or  w_Op_LPLP = '1')) else '0';
	o_peripheralWrStrobe 	<= '1' when (o_OneHotState(3) = '1' and (w_Op_SPB = '1' or  w_Op_SPS = '1'  or  w_Op_SPL = '1' or w_Op_SPBP = '1' or  w_Op_SPSP = '1'  or  w_Op_SPLP = '1')) else '0';
	o_clkInstrRomAddr 		<= o_OneHotState(0) or (not n_reset);
	o_writeToDataRamEnable 	<= '1' when o_OneHotState(3) = '1' and (w_Op_SDB = '1' or w_Op_SDS = '1'or w_Op_SDL = '1' or w_Op_SDBP = '1' or w_Op_SDSP = '1'or w_Op_SDLP = '1') and n_reset = '1' else '0';

	w_BranchAddress <=  (i_InstructionRomData(19) &  i_InstructionRomData(19) &  i_InstructionRomData(19) &  i_InstructionRomData(19) &  -- sign extend
								i_InstructionRomData(19) &  i_InstructionRomData(19) &  i_InstructionRomData(19) &  i_InstructionRomData(19) &  
								i_InstructionRomData(19) &  i_InstructionRomData(19) &  i_InstructionRomData(19) &  i_InstructionRomData(19) &  
								i_InstructionRomData(19 downto 0)) + o_InstructionRomAddress;
	
	StateMachine : entity work.OneHotStateMachine
	PORT map (
		clk 	=> i_CLOCK_50,
		clr 	=> not n_reset,
		hold	=> w_holdHaltCatchFire,
		state	=> o_OneHotState
	);
	
	opcodeDecoder : entity work.OpCodeDecoder
	port map (
		InstrOpCode => i_InstructionRomData(31 downto 24),
		-- Category = System
		Op_NOP => w_Op_NOP,
		Op_HCF => w_Op_HCF,
		-- Category = ALU
		Op_ADD => w_Op_ADD,
		Op_SUB => w_Op_SUB,
		Op_MUL => w_Op_MUL,
		Op_CMP => w_Op_CMP,
		Op_OR  => w_Op_OR,
		Op_AND => w_Op_AND,
		Op_XOR => w_Op_XOR,
		Op_SL1 => w_Op_SL1,
		Op_SL8 => w_Op_SL8,
		Op_SR1 => w_Op_SR1,
		Op_SR8 => w_Op_SR8,
		Op_ROL1 => w_Op_ROL1,
		Op_ROR1 => w_Op_ROR1,
		Op_ASR => w_Op_ASR,
		Op_ENS => w_Op_ENS,
		-- Category = Immediate values
		Op_LIL => w_Op_LIL,
		Op_LIU => w_Op_LIU,
		Op_LIX => w_Op_LIX,
		-- Category = Load/Store
		Op_LDB => w_Op_LDB,
		Op_SDB => w_Op_SDB,
		Op_LDS => w_Op_LDS,
		Op_SDS => w_Op_SDS,
		Op_LDL => w_Op_LDL,
		Op_SDL => w_Op_SDL,
		Op_LDBP => w_Op_LDBP,
		Op_SDBP => w_Op_SDBP,
		Op_LDSP => w_Op_LDSP,
		Op_SDSP => w_Op_SDSP,
		Op_LDLP => w_Op_LDLP,
		Op_SDLP => w_Op_SDLP,
		-- Category = Peripheral I/O
		Op_LPB => w_Op_LPB,
		Op_SPB => w_Op_SPB,
		Op_LPS => w_Op_LPS,
		Op_SPS => w_Op_SPS,
		Op_LPL => w_Op_LPL,
		Op_SPL => w_Op_SPL,
		Op_LPBP => w_Op_LPBP,
		Op_SPBP => w_Op_SPBP,
		Op_LPSP => w_Op_LPSP,
		Op_SPSP => w_Op_SPSP,
		Op_LPLP => w_Op_LPLP,
		Op_SPLP => w_Op_SPLP,
		-- Category = Stack
		Op_PUSH => w_Op_PUSH,
		Op_PULL => w_Op_PULL,
		Op_SSS => w_Op_SSS,
		Op_LSS => w_Op_LSS,		
		-- Category = Flow Control
		Op_BRA => w_Op_BRA,
		Op_BCS => w_Op_BCS,
		Op_BCC => w_Op_BCC,
		Op_BEZ => w_Op_BEZ,
		Op_BE1 => w_Op_BE1,
		Op_BGT => w_Op_BGT,
		Op_BLT => w_Op_BLT,
		Op_BEQ => w_Op_BEQ,
		Op_BNE => w_Op_BNE,
		Op_BNZ => w_Op_BNZ,
		Op_BSR => w_Op_BSR,
		o_WrRegFile => w_wrRegFile
	);
	
FlowControl : ENTITY work.FlowControl PORT MAP
(
	CCR				=> w_CCR,
	-- Category = Flow Control
	Op_BRA			=> w_Op_BRA,
	Op_BEZ 			=> w_Op_BEZ,
	Op_BE1 			=> w_Op_BE1,
	Op_BNZ 			=> w_Op_BNZ,
	Op_BCC 			=> w_Op_BCC,
	Op_BCS 			=> w_Op_BCS,
	Op_BLT 			=> w_Op_BLT,
	Op_BGT 			=> w_Op_BGT,
	Op_BEQ 			=> w_Op_BEQ,
	Op_BNE 			=> w_Op_BNE,
	Op_BSR 			=> w_Op_BSR,
	-- increment or branch?
	o_TakeBranch	=> w_TakeBranch
);

CCR_Store : ENTITY work.CCRControl PORT map 
	(
	-- Category = ALU
	Op_ADD	=> w_Op_ADD,
	Op_SUB	=> w_Op_SUB,
	Op_MUL	=> w_Op_MUL,
	Op_OR		=> w_Op_OR,
	Op_AND	=> w_Op_AND,
	Op_XOR	=> w_Op_XOR,
	Op_SL1	=> w_Op_SL1,
	Op_SL8	=> w_Op_SL8,
	Op_SR1	=> w_Op_SR1,
	Op_SR8	=> w_Op_SR8,
	Op_ROL1	=> w_Op_ROL1,
	Op_ROR1	=> w_Op_ROR1,
	Op_ASR	=> w_Op_ASR,
	Op_CMP	=> w_Op_CMP,
	o_save_CCR_bits => w_save_CCR_bits
	);

	ALU : entity work.ALU
	port map (
		i_regDataA => o_DataOutFromRegA,
		i_regDataB => w_regDataB,
		i_Op_ADD => w_Op_ADD,
		i_Op_SUB => w_Op_SUB,
		i_Op_MUL => w_Op_MUL,
		i_Op_CMP => w_Op_CMP,
		i_Op_AND => w_Op_AND,
		i_Op_XOR => w_Op_XOR,
		i_Op_OR => w_Op_OR,
		i_Op_SL1 => w_Op_SL1,
		i_Op_SL8 => w_Op_SL8,
		i_Op_SR1 => w_Op_SR1,
		i_Op_SR8 => w_Op_SR8,
		i_Op_ROL1 => w_Op_ROL1,
		i_Op_ROR1 => w_Op_ROR1,
		i_Op_ASR => w_Op_ASR,
		i_Op_ENS => w_Op_ENS,
 		o_ALUDataOut => w_ALUDataOut,
		o_CondCodeBits => w_CondCodeBits
	);

	w_dataIntoRegisterFile <= 
		i_InstructionRomData(15 downto 0)&x"0000" when (w_Op_LIU = '1') else		-- Load Immediate into upper half of register - other half gets ignored
		x"0000"&i_InstructionRomData(15 downto 0) when (w_Op_LIL = '1') else		-- Load Immediate into lower half of register - other half gets ignored
		i_InstructionRomData(19) & i_InstructionRomData(19) & i_InstructionRomData(19) & i_InstructionRomData(19) &
		i_InstructionRomData(19) & i_InstructionRomData(19) & i_InstructionRomData(19) & i_InstructionRomData(19) &
		i_InstructionRomData(19) & i_InstructionRomData(19) & i_InstructionRomData(19) & i_InstructionRomData(19) & i_InstructionRomData(19 downto 0) when (w_Op_LIX = '1') else	
		i_dataFromDataRam when ((w_Op_LDB = '1') or (w_Op_LDS = '1') or (w_Op_LDL = '1') or (w_Op_LDBP = '1') or (w_Op_LDSP = '1') or (w_Op_LDLP = '1')) else
		i_dataFromStackRam when ((w_Op_PULL = '1') or (w_Op_LSS = '1')) else
		i_dataFromPeripherals when ((w_Op_LPB = '1') or (w_Op_LPS = '1') or (w_Op_LPL = '1') or (w_Op_LPBP = '1') or (w_Op_LPSP = '1') or (w_Op_LPLP = '1')) else
		w_ALUDataOut;
		
	o_dataToStackRam <= o_DataOutFromRegA when (w_Op_BSR = '0') else
							(o_InstructionRomAddress + 1) when (w_Op_BSR = '1') ;
		
	RegisterFile : entity work.RegisterFile
	port map (
		i_clk							=> i_CLOCK_50,
		i_clear						=> not n_reset,
		i_OneHotState				=> o_OneHotState,
		i_TakeBranch				=> w_TakeBranch,
		i_BranchAddress			=> w_BranchAddress,
		i_wrRegSel					=> i_InstructionRomData(23 downto 20),
		i_rdRegSelA					=> i_InstructionRomData(15 downto 12),
		i_rdRegSelB					=> i_InstructionRomData(19 downto 16),
		i_regDataIn					=> w_dataIntoRegisterFile,
		i_CCR							=> w_CondCodeBits,
		i_OP_LIL						=> w_Op_LIL,
		i_OP_LIU						=> w_Op_LIU,
		i_OP_LIX						=> w_Op_LIX,
		i_Op_PUSH					=> w_Op_PUSH,
		i_Op_PULL					=> w_Op_PULL,
		i_OP_BSR						=> w_Op_BSR,
		i_Op_LDBP 					=> w_Op_LDBP,
		i_Op_SDBP 					=> w_Op_SDBP,
		i_Op_LDSP 					=> w_Op_LDSP,
		i_Op_SDSP 					=> w_Op_SDSP,
		i_Op_LDLP 					=> w_Op_LDLP,
		i_Op_SDLP 					=> w_Op_SDLP,
		i_Op_LPBP 					=> w_Op_LPBP,
		i_Op_SPBP 					=> w_Op_SPBP,
		i_Op_LPSP 					=> w_Op_LPSP,
		i_Op_SPSP 					=> w_Op_SPSP,
		i_Op_LPLP 					=> w_Op_LPLP,
		i_Op_SPLP 					=> w_Op_SPLP,
		i_save_CCR_bits			=> w_save_CCR_bits,
		i_wrRegFile					=> w_wrRegFile,
		o_regDataOutA				=> o_DataOutFromRegA,
		o_regDataOutB				=> w_regDataB,
		o_StackRamAddress			=> o_StackRamAddress,
		o_PeripheralAddress		=> o_PeripheralAddress,
		o_DataRamAddress			=> o_DataRamAddress,
		o_InstructionRomAddress	=> o_InstructionRomAddress,
		o_CCR							=> w_CCR
	);

end;
