-- Package file containing all Constants and Components used on R32V2020 RISC CPU design

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package R32V2020_Pkg is

constant NOP : std_Logic_Vector(7 downto 0) := "00000000";
constant HCF : std_Logic_Vector(7 downto 0) := "00000001";
constant RES : std_Logic_Vector(7 downto 0) := "00000010";
constant ADS : std_Logic_Vector(7 downto 0) := "00100000";
constant MUL : std_Logic_Vector(7 downto 0) := "00100001";
constant ORS : std_Logic_Vector(7 downto 0) := "00100010";
constant ARS : std_Logic_Vector(7 downto 0) := "00100011";
constant XRS : std_Logic_Vector(7 downto 0) := "00100100";
constant LS1 : std_Logic_Vector(7 downto 0) := "00100101";
constant LS8 : std_Logic_Vector(7 downto 0) := "00100110";
constant RS1 : std_Logic_Vector(7 downto 0) := "00100111";
constant RS8 : std_Logic_Vector(7 downto 0) := "00101000";
constant LR1 : std_Logic_Vector(7 downto 0) := "00101001";
constant RR1 : std_Logic_Vector(7 downto 0) := "00101010";
constant RA1 : std_Logic_Vector(7 downto 0) := "00101011";
constant CMP : std_Logic_Vector(7 downto 0) := "00110000";
constant ENS : std_Logic_Vector(7 downto 0) := "00110001";
constant LIL : std_Logic_Vector(7 downto 0) := "01000000";
constant LIU : std_Logic_Vector(7 downto 0) := "01000001";
constant LIX : std_Logic_Vector(7 downto 0) := "01000010";
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
constant BEZ : std_Logic_Vector(7 downto 0) := "11000011";
constant BE1 : std_Logic_Vector(7 downto 0) := "11000100";
constant BNZ : std_Logic_Vector(7 downto 0) := "11000111";
constant BCC : std_Logic_Vector(7 downto 0) := "11001000";
constant BCS : std_Logic_Vector(7 downto 0) := "11001011";
constant BLT : std_Logic_Vector(7 downto 0) := "11001100";
constant BGT : std_Logic_Vector(7 downto 0) := "11001111";
constant BEQ : std_Logic_Vector(7 downto 0) := "11010001";
constant BNE : std_Logic_Vector(7 downto 0) := "11010010";
constant BSR : std_Logic_Vector(7 downto 0) := "11010100";

constant CCR_BEZ : integer := 0;
constant CCR_BE1 : integer := 1;
constant CCR_BNZ : integer := 2;
constant CCR_BCC : integer := 3;
constant CCR_BCS : integer := 4;
constant CCR_BLT : integer := 5;
constant CCR_BGT : integer := 6;
constant CCR_BEQ : integer := 7;
constant CCR_BNE : integer := 8;

end package R32V2020_Pkg;
