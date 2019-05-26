---------------------------------------------------------------------
-- OpCodeDecoder
-- https://github.com/douggilliland/R32V2020/wiki/Instruction-Decoder

library ieee;
use ieee.std_logic_1164.all;

entity OpCodeDecoder is
	port (
		InstrOpCode	: in std_logic_vector(7 downto 0) := x"00";
		CCR			: in std_logic_vector(31 downto 0) := x"00000000";
		-- Category = System
		Op_NOP		: buffer std_logic;	-- No Operation
		Op_HCF		: buffer std_logic;	-- Halt and Catch Fire
		Op_RES		: buffer std_logic;	-- Reset CPU
		-- Category = ALU
		Op_ADS		: buffer std_logic;	-- Add and store in reg
		Op_MUL		: buffer std_logic;	-- Multiply and store in reg
		Op_CMP		: buffer std_logic;	-- Compare two registers and set CCR bits accordingly
		Op_ORS		: buffer std_logic;	-- Logical OR registers and store in reg
		Op_ARS		: buffer std_logic;	-- Logical AND registers and store in reg
		Op_XRS		: buffer std_logic;	-- Logical XOR registers and store in reg
		Op_LS1		: buffer std_logic;	-- Logical Shift register Left by 1 and store in reg
		Op_RS1		: buffer std_logic;	-- Logical Shift register Right by 1 and store in reg
		Op_LR1		: buffer std_logic;	-- Logical Rotate register Left by 1 and store in reg
		Op_RR1		: buffer std_logic;	-- Logical Rotate register Right by 1 and store in reg
		Op_RA1		: buffer std_logic;	-- Arithmetic shift register Right by 1 and store in reg
		Op_ENS		: buffer std_logic;	-- Swap Endian of register and store in reg
		-- Category = Immediate values
		Op_LIL		: buffer std_logic;	-- Load Immediate lower short
		Op_LIU		: buffer std_logic;	-- Load Immediate upper short
		-- Category = Load/Store to/from Data Memory
		Op_LDB		: buffer std_logic;	-- Load byte from data memory (read on d7..d0)
		Op_SDB		: out std_logic;	-- Store byte to data memory (write on d7..d0)
		Op_LDS		: buffer std_logic;	-- Load short from data memory (read on d15..d0)
		Op_SDS		: out std_logic;	-- Store short to data memory (write on d15..d0)
		Op_LDL		: buffer std_logic;	-- Load long from data memory (read on d31..d0)
		Op_SDL		: out std_logic;	-- Store long to data memory (write on d31..d0)
		-- Category = Load/Store to/from Peripheral I/O space
		Op_LPB		: buffer std_logic;	-- Load byte from peripheral interface (read on d7..d0)
		Op_SPB		: out std_logic;	-- Store byte to peripheral interface (write on d7..d0)
		Op_LPS		: buffer std_logic;	-- Load short from peripheral interface (read on d15..d0)
		Op_SPS		: out std_logic;	-- Store short to peripheral interface (write on d15..d0)
		Op_LPL		: buffer std_logic;	-- Load long from peripheral interface (read on d31..d0)
		Op_SPL		: out std_logic;	-- Store long to peripheral interface (write on d31..d0)
		-- Category = Stack
		Op_PSS		: out std_logic;	-- Stack push
		Op_PUS		: buffer std_logic;	-- Stack pull
		Op_SSS		: out std_logic;	-- Store to Stack memory
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

constant NOP : std_Logic_Vector(7 downto 0) := "00000000";
constant HCF : std_Logic_Vector(7 downto 0) := "00000001";
constant RES : std_Logic_Vector(7 downto 0) := "00000010";
constant ADS : std_Logic_Vector(7 downto 0) := "00100000";
constant MUL : std_Logic_Vector(7 downto 0) := "00100001";
constant CMP : std_Logic_Vector(7 downto 0) := "00100010";
constant ORS : std_Logic_Vector(7 downto 0) := "00101000";
constant ARS : std_Logic_Vector(7 downto 0) := "00101001";
constant XRS : std_Logic_Vector(7 downto 0) := "00101010";
constant LS1 : std_Logic_Vector(7 downto 0) := "00110000";
constant RS1 : std_Logic_Vector(7 downto 0) := "00110001";
constant LR1 : std_Logic_Vector(7 downto 0) := "00110010";
constant RR1 : std_Logic_Vector(7 downto 0) := "00110011";
constant RA1 : std_Logic_Vector(7 downto 0) := "00110100";
constant ENS : std_Logic_Vector(7 downto 0) := "00111000";
constant LIL : std_Logic_Vector(7 downto 0) := "01000000";
constant LIU : std_Logic_Vector(7 downto 0) := "01000001";
constant LDB : std_Logic_Vector(7 downto 0) := "01100000";
constant SDB : std_Logic_Vector(7 downto 0) := "01100001";
constant LDS : std_Logic_Vector(7 downto 0) := "01100010";
constant SDS : std_Logic_Vector(7 downto 0) := "01100011";
constant LDL : std_Logic_Vector(7 downto 0) := "01100100";
constant SDL : std_Logic_Vector(7 downto 0) := "01100101";
constant LPB : std_Logic_Vector(7 downto 0) := "10000000";
constant SPB : std_Logic_Vector(7 downto 0) := "10000001";
constant LPS : std_Logic_Vector(7 downto 0) := "10000010";
constant SPS : std_Logic_Vector(7 downto 0) := "10000011";
constant LPL : std_Logic_Vector(7 downto 0) := "10000100";
constant SPL : std_Logic_Vector(7 downto 0) := "10000101";
constant PSS : std_Logic_Vector(7 downto 0) := "10100000";
constant PUS : std_Logic_Vector(7 downto 0) := "10100001";
constant SSS : std_Logic_Vector(7 downto 0) := "10100010";
constant LSS : std_Logic_Vector(7 downto 0) := "10100011";
constant BRA : std_Logic_Vector(7 downto 0) := "11000000";
constant BCS : std_Logic_Vector(7 downto 0) := "11000001";
constant BCC : std_Logic_Vector(7 downto 0) := "11000010";
constant BEZ : std_Logic_Vector(7 downto 0) := "11000011";
constant BE1 : std_Logic_Vector(7 downto 0) := "11000100";
constant BGT : std_Logic_Vector(7 downto 0) := "11000101";
constant BLT : std_Logic_Vector(7 downto 0) := "11000110";
constant BEQ : std_Logic_Vector(7 downto 0) := "11000111";

begin

o_WrRegFile <= '1' when (
	Op_ADS = '1' or
	Op_MUL = '1' or
	Op_ORS = '1' or
	Op_ARS = '1' or
	Op_XRS = '1' or
	Op_LS1 = '1' or
	Op_RS1 = '1' or
	Op_LR1 = '1' or
	Op_RR1 = '1' or
	Op_RA1 = '1' or
	Op_ENS = '1' or
	Op_LIL = '1' or
	Op_LIU = '1' or
	Op_LDB = '1' or
	Op_LDS = '1' or
	Op_LDL = '1' or
	Op_LPB = '1' or
	Op_LPS = '1' or
	Op_LPL = '1' or
	Op_PUS = '1' or
	Op_LSS = '1'	 
	)
	else '0';

-- System Opcodes
Op_NOP <= '1' when (System_OpCode = '1' and (InstrOpCode(4 downto 0) = NOP(4 downto 0))) else '0';
Op_HCF <= '1' when (System_OpCode = '1' and (InstrOpCode(4 downto 0) = HCF(4 downto 0))) else '0';
Op_RES <= '1' when (System_OpCode = '1' and (InstrOpCode(4 downto 0) = RES(4 downto 0))) else '0';

-- ALU Opcodes - Arithmetic
Op_ADS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ADS(4 downto 0))) else '0';
Op_MUL <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = MUL(4 downto 0))) else '0';
Op_CMP <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = CMP(4 downto 0))) else '0';
-- ALU Opcodes - Logical
Op_ORS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ORS(4 downto 0))) else '0';
Op_ARS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ARS(4 downto 0))) else '0';
Op_XRS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = XRS(4 downto 0))) else '0';
-- ALU Opcodes - Shift
Op_LS1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = LS1(4 downto 0))) else '0';
Op_RS1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = RS1(4 downto 0))) else '0';
Op_LR1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = LR1(4 downto 0))) else '0';
Op_RR1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = RR1(4 downto 0))) else '0';
Op_RA1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = RA1(4 downto 0))) else '0';
-- ALU Opcodes - Endian
Op_ENS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = ENS(4 downto 0))) else '0';
-- Immediate Opcodes
Op_LIL <= '1' when (Immed_OpCode = '1' and (InstrOpCode(4 downto 0) = LIL(4 downto 0))) else '0';
Op_LIU <= '1' when (Immed_OpCode = '1' and (InstrOpCode(4 downto 0) = LIU(4 downto 0))) else '0';
-- Load/Store Data Memory Opcodes
Op_LDB <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDB(4 downto 0))) else '0';
Op_SDB <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDB(4 downto 0))) else '0';
Op_LDS <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDS(4 downto 0))) else '0';
Op_SDS <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDS(4 downto 0))) else '0';
Op_LDL <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = LDL(4 downto 0))) else '0';
Op_SDL <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = SDL(4 downto 0))) else '0';
-- Peripheral I/O Opcodes
Op_LPB <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPB(4 downto 0))) else '0';
Op_SPB <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPB(4 downto 0))) else '0';
Op_LPS <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPS(4 downto 0))) else '0';
Op_SPS <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPS(4 downto 0))) else '0';
Op_LPL <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = LPL(4 downto 0))) else '0';
Op_SPL <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = SPL(4 downto 0))) else '0';
-- Stack Opcodes
Op_PSS <= '1' when (Stack_OpCode = '1' and (InstrOpCode(4 downto 0) = PSS(4 downto 0))) else '0';
Op_PUS <= '1' when (Stack_OpCode = '1' and (InstrOpCode(4 downto 0) = PUS(4 downto 0))) else '0';
Op_SSS <= '1' when (Stack_OpCode = '1' and (InstrOpCode(4 downto 0) = SSS(4 downto 0))) else '0';
Op_LSS <= '1' when (Stack_OpCode = '1' and (InstrOpCode(4 downto 0) = LSS(4 downto 0))) else '0';

-- Flow Control
Op_JSR <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = JSR(4 downto 0))) else '0';
Op_RTS <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = RTS(4 downto 0))) else '0';
Op_BRA <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BRA(4 downto 0))) else '0';
Op_BCS <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BCS(4 downto 0))) else '0';
Op_BCC <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BCC(4 downto 0))) else '0';
Op_BEZ <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BEZ(4 downto 0))) else '0';
Op_BE1 <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BE1(4 downto 0))) else '0';
Op_BOV <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BOV(4 downto 0))) else '0';
Op_BEQ <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = BEQ(4 downto 0))) else '0';

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
