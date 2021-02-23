-- Package file containing all Constants and Components used on R32V2020 RISC CPU design
-- Instruction constants are automatically generated from the op.csv file by the assembler
--		python assembler.py --gen-constants

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package R32V2020_Pkg is

constant NOP_OP 	: std_logic_vector(7 downto 0) := "00000000";
constant HCF_OP 	: std_logic_vector(7 downto 0) := "00000001";
constant ADD_OP 	: std_logic_vector(7 downto 0) := "00100000";
constant ADDI_OP 	: std_logic_vector(7 downto 0) := "00100001";
constant SUB_OP 	: std_logic_vector(7 downto 0) := "00100010";
constant SUBI_OP 	: std_logic_vector(7 downto 0) := "00100011";
constant MUL_OP 	: std_logic_vector(7 downto 0) := "00100100";
constant MULI_OP 	: std_logic_vector(7 downto 0) := "00100101";
constant OR_OP 	: std_logic_vector(7 downto 0) := "00101000";
constant ORI_OP 	: std_logic_vector(7 downto 0) := "00101001";
constant AND_OP 	: std_logic_vector(7 downto 0) := "00101010";
constant ANDI_OP 	: std_logic_vector(7 downto 0) := "00101011";
constant XOR_OP 	: std_logic_vector(7 downto 0) := "00101100";
constant XORI_OP 	: std_logic_vector(7 downto 0) := "00101101";
constant SL1_OP 	: std_logic_vector(7 downto 0) := "00110000";
constant SL8_OP 	: std_logic_vector(7 downto 0) := "00110001";
constant SR1_OP 	: std_logic_vector(7 downto 0) := "00110010";
constant SR8_OP 	: std_logic_vector(7 downto 0) := "00110011";
constant ROL1_OP 	: std_logic_vector(7 downto 0) := "00110100";
constant ROR1_OP 	: std_logic_vector(7 downto 0) := "00110101";
constant ASR_OP 	: std_logic_vector(7 downto 0) := "00110110";
constant CMP_OP 	: std_logic_vector(7 downto 0) := "00111000";
constant CMPI_OP 	: std_logic_vector(7 downto 0) := "00111001";
constant ENS_OP 	: std_logic_vector(7 downto 0) := "00111010";
constant LIL_OP 	: std_logic_vector(7 downto 0) := "01000000";
constant LIU_OP 	: std_logic_vector(7 downto 0) := "01000001";
constant LIX_OP 	: std_logic_vector(7 downto 0) := "01000010";
constant LDB_OP 	: std_logic_vector(7 downto 0) := "01100000";
constant SDB_OP 	: std_logic_vector(7 downto 0) := "01100001";
constant LDS_OP 	: std_logic_vector(7 downto 0) := "01100010";
constant SDS_OP 	: std_logic_vector(7 downto 0) := "01100011";
constant LDL_OP 	: std_logic_vector(7 downto 0) := "01100100";
constant SDL_OP 	: std_logic_vector(7 downto 0) := "01100101";
constant LDBP_OP 	: std_logic_vector(7 downto 0) := "01101000";
constant SDBP_OP 	: std_logic_vector(7 downto 0) := "01101001";
constant LDSP_OP 	: std_logic_vector(7 downto 0) := "01101010";
constant SDSP_OP 	: std_logic_vector(7 downto 0) := "01101011";
constant LDLP_OP 	: std_logic_vector(7 downto 0) := "01101100";
constant SDLP_OP 	: std_logic_vector(7 downto 0) := "01101101";
constant LPB_OP 	: std_logic_vector(7 downto 0) := "10000000";
constant SPB_OP 	: std_logic_vector(7 downto 0) := "10000001";
constant LPS_OP 	: std_logic_vector(7 downto 0) := "10000010";
constant SPS_OP 	: std_logic_vector(7 downto 0) := "10000011";
constant LPL_OP 	: std_logic_vector(7 downto 0) := "10000100";
constant SPL_OP 	: std_logic_vector(7 downto 0) := "10000101";
constant LPBP_OP 	: std_logic_vector(7 downto 0) := "10001000";
constant SPBP_OP 	: std_logic_vector(7 downto 0) := "10001001";
constant LPSP_OP 	: std_logic_vector(7 downto 0) := "10001010";
constant SPSP_OP 	: std_logic_vector(7 downto 0) := "10001011";
constant LPLP_OP 	: std_logic_vector(7 downto 0) := "10001100";
constant SPLP_OP 	: std_logic_vector(7 downto 0) := "10001101";
constant PUSH_OP 	: std_logic_vector(7 downto 0) := "10100000";
constant PULL_OP 	: std_logic_vector(7 downto 0) := "10100001";
constant SSS_OP 	: std_logic_vector(7 downto 0) := "10100010";
constant LSS_OP 	: std_logic_vector(7 downto 0) := "10100011";
constant SSO_OP 	: std_logic_vector(7 downto 0) := "10100110";
constant LSO_OP 	: std_logic_vector(7 downto 0) := "10100111";
constant BRA_OP 	: std_logic_vector(7 downto 0) := "11000000";
constant BEZ_OP 	: std_logic_vector(7 downto 0) := "11000011";
constant BE1_OP 	: std_logic_vector(7 downto 0) := "11000100";
constant BNZ_OP 	: std_logic_vector(7 downto 0) := "11000111";
constant BCC_OP 	: std_logic_vector(7 downto 0) := "11001000";
constant BCS_OP 	: std_logic_vector(7 downto 0) := "11001011";
constant BLT_OP 	: std_logic_vector(7 downto 0) := "11001100";
constant BGT_OP 	: std_logic_vector(7 downto 0) := "11001111";
constant BEQ_OP 	: std_logic_vector(7 downto 0) := "11010001";
constant BNE_OP 	: std_logic_vector(7 downto 0) := "11010010";
constant BSR_OP 	: std_logic_vector(7 downto 0) := "11010100";

constant CCR_BEZ : integer := 0;
constant CCR_BE1 : integer := 1;
constant CCR_BNZ : integer := 2;
constant CCR_BCC : integer := 3;
constant CCR_BCS : integer := 4;
constant CCR_BLT : integer := 5;
constant CCR_BGT : integer := 6;
constant CCR_BEQ : integer := 7;
constant CCR_BNE : integer := 8;

constant STATE0 : std_Logic_Vector(3 downto 0) := "0001";
constant STATE1 : std_Logic_Vector(3 downto 0) := "0010";
constant STATE2 : std_Logic_Vector(3 downto 0) := "0100";
constant STATE3 : std_Logic_Vector(3 downto 0) := "1000";

end package R32V2020_Pkg;
