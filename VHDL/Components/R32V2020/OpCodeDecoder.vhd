---------------------------------------------------------------------
-- OpCodeDecoder
-- https://github.com/douggilliland/R32V2020/wiki/Instruction-Decoder

library ieee;
use ieee.std_logic_1164.all;

library work;
use work.R32V2020_Pkg.all;

entity OpCodeDecoder is
	port (
		InstrOpCode	: in std_logic_vector(7 downto 0) := x"00";
		CCR			: in std_logic_vector(31 downto 0) := x"00000000";
		-- Category = System
		Op_NOP		: buffer std_logic;	-- No Operation
		Op_HCF		: buffer std_logic;	-- Halt and Catch Fire
		-- Category = ALU
		Op_ADD		: buffer std_logic;	-- Add regs and store in reg
		Op_ADDI		: buffer std_logic;	-- Add reg and immediate and store in reg
		Op_SUB		: buffer std_logic;	-- Subtract and store in reg
		Op_SUBI		: buffer std_logic;	-- Subtract reg and immediate and store in reg
		Op_MUL		: buffer std_logic;	-- Multiply and store in reg
		Op_MULI		: buffer std_logic;	-- Multiply reg and immediate and store in reg
		Op_CMP		: buffer std_logic;	-- Compare two registers and set CCR bits accordingly
		Op_CMPI		: buffer std_logic;	-- Compare reg and immediate and set CCR bits accordingly
		Op_OR 		: buffer std_logic;	-- Logical OR registers and store in reg
		Op_ORI 		: buffer std_logic;	-- Logical OR reg and immediate and store in reg
		Op_AND		: buffer std_logic;	-- Logical AND registers and store in reg
		Op_ANDI		: buffer std_logic;	-- Logical AND reg and immediate and store in reg
		Op_XOR		: buffer std_logic;	-- Logical XOR registers and store in reg
		Op_XORI		: buffer std_logic;	-- Logical XOR reg and immediate and store in reg
		Op_SL1		: buffer std_logic;	-- Logical Shift register Left by 1 and store in reg
		Op_SL8		: buffer std_logic;	-- Logical Shift register Left by 8 and store in reg
		Op_SR1		: buffer std_logic;	-- Logical Shift register Right by 1 and store in reg
		Op_SR8		: buffer std_logic;	-- Logical Shift register Right by 8 and store in reg
		Op_ROL1		: buffer std_logic;	-- Logical Rotate register Left by 1 and store in reg
		Op_ROR1		: buffer std_logic;	-- Logical Rotate register Right by 1 and store in reg
		Op_ASR		: buffer std_logic;	-- Arithmetic shift register Right by 1 and store in reg
		Op_ENS		: buffer std_logic;	-- Swap Endian of register and store in reg
		-- Category = Immediate values
		Op_LIL		: buffer std_logic;	-- Load Immediate lower short
		Op_LIU		: buffer std_logic;	-- Load Immediate upper short
		Op_LIX		: buffer std_logic;	-- Load Immediate lower short sign extended up
		-- Category = Load/Store to/from Data Memory
		Op_LDB		: buffer std_logic;	-- Load byte from data memory (read on d7..d0)
		Op_SDB		: out std_logic;		-- Store byte to data memory (write on d7..d0)
		Op_LDS		: buffer std_logic;	-- Load short from data memory (read on d15..d0)
		Op_SDS		: out std_logic;		-- Store short to data memory (write on d15..d0)
		Op_LDL		: buffer std_logic;	-- Load long from data memory (read on d31..d0)
		Op_SDL		: out std_logic;		-- Store long to data memory (write on d31..d0)
		Op_LDBP		: buffer std_logic;	-- Load byte from data memory (read on d31..d0)
		Op_SDBP		: out std_logic;		-- Store byte to data memory (write on d31..d0)
		Op_LDSP		: buffer std_logic;	-- Load short from data memory (read on d31..d0)
		Op_SDSP		: out std_logic;		-- Store short to data memory (write on d31..d0)
		Op_LDLP		: buffer std_logic;	-- Load long from data memory (read on d31..d0)
		Op_SDLP		: out std_logic;		-- Store long to data memory (write on d31..d0)
		-- Category = Load/Store to/from Peripheral I/O space
		Op_LPB		: buffer std_logic;	-- Load byte from peripheral interface (read on d7..d0)
		Op_SPB		: out std_logic;		-- Store byte to peripheral interface (write on d7..d0)
		Op_LPS		: buffer std_logic;	-- Load short from peripheral interface (read on d15..d0)
		Op_SPS		: out std_logic;		-- Store short to peripheral interface (write on d15..d0)
		Op_LPL		: buffer std_logic;	-- Load long from peripheral interface (read on d31..d0)
		Op_SPL		: out std_logic;		-- Store long to peripheral interface (write on d31..d0)
		Op_LPBP		: buffer std_logic;	-- Load byte from peripheral interface (read on d31..d0)
		Op_SPBP		: out std_logic;		-- Store byte to peripheral interface (write on d31..d0)
		Op_LPSP		: buffer std_logic;	-- Load short from peripheral interface (read on d31..d0)
		Op_SPSP		: out std_logic;		-- Store short to peripheral interface (write on d31..d0)
		Op_LPLP		: buffer std_logic;	-- Load long from peripheral interface (read on d31..d0)
		Op_SPLP		: out std_logic;		-- Store long to peripheral interface (write on d31..d0)
		-- Category = Stack
		Op_PUSH		: out std_logic;		-- Stack push (was Op_PUSH)
		Op_PULL		: buffer std_logic;	-- Stack pull (was (Op_PULL)
		Op_SSS		: out std_logic;		-- Store to Stack memory
		Op_LSS		: buffer std_logic;	-- Load from Stack memory
		-- Category = Flow Control
		Op_BRA 		: out std_logic;	-- Branch Always
		Op_BCS 		: out std_logic;	-- Branch if Carry Set
		Op_BCC 		: out std_logic;	-- Branch if Carry Clear
		Op_BEZ 		: out std_logic;	-- Branch if ALU result is Equal to Zero
		Op_BE1 		: out std_logic;	-- Branch if ALU result is Equal to One
		Op_BGT 		: out std_logic;	-- Branch if Greater Than
		Op_BLT 		: out std_logic;	-- Branch if Less Than
		Op_BEQ 		: out std_logic;	-- Branch if Equal
		Op_BNE 		: out std_logic;	-- Branch if Not Equal
		Op_BNZ 		: out std_logic;	-- Branch if Not Zero
		Op_BSR 		: out std_logic;	-- Branch Subroutine
		o_WrRegFile	: out std_logic	-- Register File gets output of opcode
	);
end OpCodeDecoder;

architecture struct of OpCodeDecoder is

signal	System_OpCode	: std_logic;
signal	ALU_OpCode		: std_logic;
signal	Immed_OpCode	: std_logic;
signal	LdSt_OpCode		: std_logic;
signal	Perip_OpCode	: std_logic;
signal	Stack_OpCode	: std_logic;
signal	FlowCtl_OpCode	: std_logic;

begin

o_WrRegFile <= Op_ADD or Op_ADDI or Op_SUB or Op_SUBI or Op_MUL or Op_MULI or 
	Op_OR or Op_ORI or Op_AND or Op_ANDI or Op_XOR or Op_XORI or 	
	Op_SL1 or Op_SL8 or Op_SR1 or Op_SR8 or
	Op_ROL1 or Op_ROR1 or Op_ASR or
	Op_ENS or
	Op_LIL or Op_LIU or Op_LIX or 
	Op_LDB or Op_LDS or Op_LDL or Op_LDBP or Op_LDSP or Op_LDLP or 
	Op_LPB or Op_LPS or Op_LPL or Op_LPBP or Op_LPSP or Op_LPLP or 
	Op_PULL or Op_LSS;

-- System Opcodes
Op_NOP <= '1' when (System_OpCode = '1' and (InstrOpCode(4 downto 0) = NOP_OP(4 downto 0))) else '0';
Op_HCF <= '1' when (System_OpCode = '1' and (InstrOpCode(4 downto 0) = HCF_OP(4 downto 0))) else '0';

-- ALU Opcodes - Arithmetic
Op_ADD <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ADD_OP(4 downto 0))) else '0';
Op_ADDI <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ADDI_OP(4 downto 0))) else '0';
Op_SUB <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = SUB_OP(4 downto 0))) else '0';
Op_SUBI <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = SUBI_OP(4 downto 0))) else '0';
Op_MUL <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = MUL_OP(4 downto 0))) else '0';
Op_MULI <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = MULI_OP(4 downto 0))) else '0';
-- ALU Opcodes - Logical
Op_OR  <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = OR_OP(4 downto 0))) else '0';
Op_ORI  <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ORI_OP(4 downto 0))) else '0';
Op_AND <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = AND_OP(4 downto 0))) else '0';
Op_ANDI <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ANDI_OP(4 downto 0))) else '0';
Op_XOR <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = XOR_OP(4 downto 0))) else '0';
Op_XORI <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = XORI_OP(4 downto 0))) else '0';
-- ALU Opcodes - Shift
Op_SL1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = SL1_OP(4 downto 0))) else '0';
Op_SL8 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = SL8_OP(4 downto 0))) else '0';
Op_SR1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = SR1_OP(4 downto 0))) else '0';
Op_SR8 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = SR8_OP(4 downto 0))) else '0';
Op_ROL1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ROL1_OP(4 downto 0))) else '0';
Op_ROR1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ROR1_OP(4 downto 0))) else '0';
Op_ASR <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ASR_OP(4 downto 0))) else '0';
-- ALU Opcodes - Compare
Op_CMP <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = CMP_OP(4 downto 0))) else '0';
Op_CMPI <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = CMPI_OP(4 downto 0))) else '0';
-- ALU Opcodes - Endian
Op_ENS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ENS_OP(4 downto 0))) else '0';
-- Immediate Opcodes
Op_LIL <= '1' when (Immed_OpCode = '1' and (InstrOpCode(4 downto 0) = LIL_OP(4 downto 0))) else '0';
Op_LIU <= '1' when (Immed_OpCode = '1' and (InstrOpCode(4 downto 0) = LIU_OP(4 downto 0))) else '0';
Op_LIX <= '1' when (Immed_OpCode = '1' and (InstrOpCode(4 downto 0) = LIX_OP(4 downto 0))) else '0';
-- Load/Store Data Memory Opcodes
Op_LDB <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDB_OP(4 downto 0))) else '0';
Op_SDB <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDB_OP(4 downto 0))) else '0';
Op_LDS <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDS_OP(4 downto 0))) else '0';
Op_SDS <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDS_OP(4 downto 0))) else '0';
Op_LDL <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDL_OP(4 downto 0))) else '0';
Op_SDL <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDL_OP(4 downto 0))) else '0';
Op_LDBP <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDBP_OP(4 downto 0))) else '0';
Op_SDBP <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDBP_OP(4 downto 0))) else '0';
Op_LDSP <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDSP_OP(4 downto 0))) else '0';
Op_SDSP <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDSP_OP(4 downto 0))) else '0';
Op_LDLP <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDLP_OP(4 downto 0))) else '0';
Op_SDLP <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDLP_OP(4 downto 0))) else '0';
-- Peripheral I/O Opcodes
Op_LPB <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPB_OP(4 downto 0))) else '0';
Op_SPB <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPB_OP(4 downto 0))) else '0';
Op_LPS <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPS_OP(4 downto 0))) else '0';
Op_SPS <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPS_OP(4 downto 0))) else '0';
Op_LPL <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPL_OP(4 downto 0))) else '0';
Op_SPL <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPL_OP(4 downto 0))) else '0';
Op_LPBP <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPBP_OP(4 downto 0))) else '0';
Op_SPBP <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPBP_OP(4 downto 0))) else '0';
Op_LPSP <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPSP_OP(4 downto 0))) else '0';
Op_SPSP <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPSP_OP(4 downto 0))) else '0';
Op_LPLP <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPLP_OP(4 downto 0))) else '0';
Op_SPLP <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPLP_OP(4 downto 0))) else '0';
-- Stack Opcodes
Op_PUSH <= '1' when (Stack_OpCode = '1' and (InstrOpCode(4 downto 0) = PUSH_OP(4 downto 0))) else '0';
Op_PULL <= '1' when (Stack_OpCode = '1' and (InstrOpCode(4 downto 0) = PULL_OP(4 downto 0))) else '0';
Op_SSS <= '1' when (Stack_OpCode = '1' and (InstrOpCode(4 downto 0) = SSS_OP(4 downto 0))) else '0';
Op_LSS <= '1' when (Stack_OpCode = '1' and (InstrOpCode(4 downto 0) = LSS_OP(4 downto 0))) else '0';
-- Flow Control
Op_BRA <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BRA_OP(4 downto 0))) else '0';
Op_BCS <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BCS_OP(4 downto 0))) else '0';
Op_BCC <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BCC_OP(4 downto 0))) else '0';
Op_BEZ <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BEZ_OP(4 downto 0))) else '0';
Op_BE1 <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BE1_OP(4 downto 0))) else '0';
Op_BGT <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BGT_OP(4 downto 0))) else '0';
Op_BLT <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BLT_OP(4 downto 0))) else '0';
Op_BEQ <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BEQ_OP(4 downto 0))) else '0';
Op_BNE <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BNE_OP(4 downto 0))) else '0';
Op_BNZ <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BNZ_OP(4 downto 0))) else '0';
Op_BSR <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BSR_OP(4 downto 0))) else '0';

opc_Cat_Decoder : work.OpCode_Cat_Decoder port map (
		InstrOpCodeCat	=> InstrOpCode(7 downto 5),
		System_OpCode	=> System_OpCode,
		ALU_OpCode		=> ALU_OpCode,
		Immed_OpCode	=> Immed_OpCode,
		LdSt_OpCode		=> LdSt_OpCode,
		Perip_OpCode	=> Perip_OpCode,
		Stack_OpCode	=> Stack_OpCode,
		FlowCtl_OpCode	=> FlowCtl_OpCode
	);

end struct;
