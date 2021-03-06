------------------------------------------------------------------------------------
-- SoundTable01 - Table with the values of the counter preloads for 7 piano octaves
-- Counter is a 20-bit counter that runs at 50 MHz
-- There is a Toggle-FF at the counter terminal count that toggles every other time.
-- Intent is to replicate the entire piano scale
-- Data is in frequency ascending order
-- First value is A,, @ 27.5 Hz
-- Last value is b'''' at 3951 Hz
------------------------------------------------------------------------------------

library ieee;
	use ieee.std_logic_1164.all;
	use ieee.numeric_std.all;
	use ieee.std_logic_unsigned.all;

ENTITY SoundTable01 IS
	PORT
	(
		address : in std_logic_vector(6 downto 0);	-- Tone selection
		q : out std_logic_vector(19 downto 0)		-- Counter pre-load value
	);
END SoundTable01;

architecture behavior of SoundTable01 is
type waveTable is array (0 to 86) of std_logic_vector(19 downto 0);
constant waveData : waveTable :=
(
x"220DD",x"2E82D",x"3A44C",x"455DD",x"4FD76",x"59BA7",x"630F8",x"6BDE7",x"742ED",x"7C07B",x"836FE",x"8A6DA",
x"9106F",x"97416",x"9D226",x"A2AEE",x"A7EBB",x"ACDD4",x"B187C",x"B5EF3",x"BA176",x"BE03E",x"C1B7F",x"C536D",
x"C8837",x"CBA0B",x"CE913",x"D1577",x"D3F5D",x"D66EA",x"D8C3E",x"DAF7A",x"DD0BB",x"DF01F",x"E0DBF",x"E29B6",
x"E441C",x"E5D06",x"E748A",x"E8ABC",x"E9FAF",x"EB375",x"EC61F",x"ED7BD",x"EE85E",x"EF80F",x"F06E0",x"F14DB",
x"F220E",x"F2E83",x"F3A45",x"F455E",x"F4FD7",x"F59BA",x"F630F",x"F6BDE",x"F742F",x"F7C08",x"F8370",x"F8A6E",
x"F9107",x"F9741",x"F9D22",x"FA2AF",x"FA7EC",x"FACDD",x"FB188",x"FB5EF",x"FBA17",x"FBE04",x"FC1B8",x"FC537",
x"FC883",x"FCBA1",x"FCE91",x"FD157",x"FD3F6",x"FD66F",x"FD8C4",x"FDAF8",x"FDD0C",x"FDF02",x"FE0DC",x"FE29B",
x"FE442",x"FE5D0",x"FE749"
);
begin
process (address)
begin
q <= waveData (to_integer(unsigned(address)));
end process;
end behavior;
