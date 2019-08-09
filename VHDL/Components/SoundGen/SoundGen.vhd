----------------------------------------------------
-- VHDL code for 19-bit counter
-- 50 MHz divided by 2^19 = 45 Hz (low end of the sound) 
----------------------------------------------------
	
library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

ENTITY SoundGen IS PORT(
    clk		: IN STD_LOGIC; -- clock.
    d			: IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    ld		: IN STD_LOGIC; -- load/enable.
    clr 		: IN STD_LOGIC; -- async. clear.
    o_Note	: OUT STD_LOGIC -- output
);
END SoundGen;

ARCHITECTURE behv OF SoundGen IS

	signal w_NoteDataAddr		:	std_logic_vector(7 downto 0);
	signal w_NoteDataIn			:	std_logic_vector(19 downto 0);
	signal enableSound			:	std_logic;
	signal soundOut				:	std_logic;

BEGIN

		o_Note <= soundOut and w_NoteDataAddr(7); -- MSbit is sound enable

	-- Latch the note value (sound generator)
	NoteLatch	: entity work.REG_8
	port map (
    clk 	=> clk,
    d 	=> d,
    ld 	=> ld,
    clr  => clr,
    q    => w_NoteDataAddr
	);
	
	-- The note counter
	MusicNoteCounter : entity work.CounterLoadable
   port map (
    clock		=> clk,
    clear		=> clr,
    loadVal		=> w_NoteDataIn,
	 soundOut	=> soundOut
	 );
	
	soundTable : entity work.SoundTable01
	port map	(
		address	=> w_NoteDataAddr(6 downto 0),
		q 			=> w_NoteDataIn
	);

end behv;
