------------------------------------------------------------------
-- OpCode_Decoder
-- https://github.com/douggilliland/R32V2020/wiki/Instruction-Decoder

library ieee;
use ieee.std_logic_1164.all;
use  IEEE.STD_LOGIC_ARITH.all;
use  IEEE.STD_LOGIC_UNSIGNED.all;

entity OpCode_Decoder is
	port (
		clk			: in std_logic;
		InstrOpCode	: in std_logic_vector(7 downto 0);
		-- Category = System
		Op_HCF		: out std_logic;	-- Halt and Catch Fire
		Op_NOP		: out std_logic;	-- No Operation
		Op_RES		: out std_logic;	-- Reset CPU
		-- Category = ALU
		Op_ADS		: out std_logic;	-- Add and store in reg
		Op_MUL		: out std_logic;	-- Multiply and store in reg
		Op_MAO		: out std_logic;	-- Math/Other and store in reg
		Op_ORS		: out std_logic;	-- Logical OR registers and store in reg
		Op_ARS		: out std_logic;	-- Logical AND registers and store in reg
		Op_XRS		: out std_logic;	-- Logical XOR registers and store in reg
		Op_LS1		: out std_logic;	-- Logical Shift register Left by 1 and store in reg
		Op_RS1		: out std_logic;	-- Logical Shift register Right by 1 and store in reg
		Op_LR1		: out std_logic;	-- Logical Rotate register Left by 1 and store in reg
		Op_RR1		: out std_logic;	-- Logical Rotate register Right by 1 and store in reg
		Op_RA1		: out std_logic;	-- Arithmetic shift register Right by 1 and store in reg
		Op_ENS		: out std_logic;	-- Swap Endian of register and store in reg
		-- Category = Immediate values
		Op_LIL		: out std_logic;	-- Load Immediate lower short
		Op_LIU		: out std_logic;	-- Load Immediate upper short
		-- Category = Load/Store
		Op_LDB		: out std_logic;	-- Load byte from data memory (read on d7..d0)
		Op_SDB		: out std_logic;	-- Store byte to data memory (write on d7..d0)
		Op_LDS		: out std_logic;	-- Load short from data memory (read on d15..d0)
		Op_SDS		: out std_logic;	-- Store short to data memory (write on d15..d0)
		Op_LDL		: out std_logic;	-- Load long from data memory (read on d31..d0)
		Op_SDL		: out std_logic;	-- Store long to data memory (write on d31..d0)
		-- Category = Peripheral I/O
		Op_LPB		: out std_logic;	-- Load byte from peripheral interface (read on d7..d0)
		Op_SPB		: out std_logic;	-- Store byte to peripheral interface (write on d7..d0)
		Op_LPS		: out std_logic;	-- Load short from peripheral interface (read on d15..d0)
		Op_SPS		: out std_logic;	-- Store short to peripheral interface (write on d15..d0)
		Op_LPL		: out std_logic;	-- Load long from peripheral interface (read on d31..d0)
		Op_SPL		: out std_logic;	-- Store long to peripheral interface (write on d31..d0)
		-- Category = Flow Control
		Op_JSR 		: out std_logic;	-- Jump Subroutine
		Op_RTS 		: out std_logic;	-- Return Subroutine
		Op_BRA 		: out std_logic;	-- Branch Always
		Op_BCS 		: out std_logic;	-- Branch if Carry Set
		Op_BCC 		: out std_logic;	-- Branch if Carry Clear
		Op_BOV 		: out std_logic;	-- Branch if Overflow
		Op_BEQ 		: out std_logic	-- Branch if Equal
	);
end OpCode_Decoder;

architecture struct of OpCode_Decoder is

signal	System_OpCode	: std_logic := '0';
signal	ALU_OpCode		: std_logic := '0';
signal	Immed_OpCode	: std_logic := '0';
signal	LdSt_OpCode		: std_logic := '0';
signal	Perip_OpCode	: std_logic := '0';
signal	FlowCtl_OpCode	: std_logic := '0';

begin

-- System Opcodes
Op_HCF <= '1' when (System_OpCode = '1' and (InstrOpCode(4 downto 0) = "00000")) else '0';
Op_NOP <= '1' when (System_OpCode = '1' and (InstrOpCode(4 downto 0) = "00001")) else '0';
Op_RES <= '1' when (System_OpCode = '1' and (InstrOpCode(4 downto 0) = "00010")) else '0';

-- ALU Opcodes - Arithmetic
Op_ADS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "00000")) else '0';
Op_MUL <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "00001")) else '0';
Op_MAO <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "00010")) else '0';
-- ALU Opcodes - Logical
Op_ORS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "01000")) else '0';
Op_ARS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "01001")) else '0';
Op_XRS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "01010")) else '0';
-- ALU Opcodes - Shift
Op_LS1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "10000")) else '0';
Op_RS1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "10001")) else '0';
Op_LR1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "10010")) else '0';
Op_RR1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "10011")) else '0';
Op_RA1 <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "10100")) else '0';
-- ALU Opcodes - Endian
Op_ENS <= '1' when (ALU_OpCode = '1' and (InstrOpCode(4 downto 0) = "00000")) else '0';
-- Immediate Opcodes
Op_LIL <= '1' when (Immed_OpCode = '1' and (InstrOpCode(4 downto 0) = "00000")) else '0';
Op_LIU <= '1' when (Immed_OpCode = '1' and (InstrOpCode(4 downto 0) = "00001")) else '0';
-- Load/Store Data Memory Opcodes
Op_LDB <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = "00000")) else '0';
Op_SDB <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = "00001")) else '0';
Op_LDS <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = "00010")) else '0';
Op_SDS <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = "00011")) else '0';
Op_LDL <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = "00100")) else '0';
Op_SDL <= '1' when (LdSt_OpCode = '1' and (InstrOpCode(4 downto 0) = "00101")) else '0';
-- Peripheral I/O Opcodes
Op_LPB <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = "00000")) else '0';
Op_SPB <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = "00001")) else '0';
Op_LPS <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = "00010")) else '0';
Op_SPS <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = "00011")) else '0';
Op_LPL <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = "00100")) else '0';
Op_SPL <= '1' when (Perip_OpCode = '1' and (InstrOpCode(4 downto 0) = "00101")) else '0';
-- Flow Control
Op_JSR <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = "00000")) else '0';
Op_RTS <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = "00001")) else '0';
Op_BRA <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = "01000")) else '0';
Op_BCS <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = "01001")) else '0';
Op_BCC <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = "01011")) else '0';
Op_BOV <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = "01011")) else '0';
Op_BEQ <= '1' when (FlowCtl_OpCode = '1' and (InstrOpCode(4 downto 0) = "01100")) else '0';

opc_Cat_Decoder : work.OpCode_Cat_Decoder port map (
		clk				=> clk,
		InstrOpCodeCat	=> InstrOpCode(2 downto 0),
		System_OpCode	=> System_OpCode,
		ALU_OpCode		=> ALU_OpCode,
		Immed_OpCode	=> Immed_OpCode,
		LdSt_OpCode		=> LdSt_OpCode,
		Perip_OpCode	=> Perip_OpCode,
		FlowCtl_OpCode	=> FlowCtl_OpCode
	);

end struct;
