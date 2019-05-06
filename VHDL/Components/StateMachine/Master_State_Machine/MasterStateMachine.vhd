ENTITY MasterStateMachine IS PORT
(
    clk 	: IN STD_LOGIC; -- clock.
    clr 	: IN STD_LOGIC; -- async. clear.
    state   : OUT STD_LOGIC_LOGIC(7 downto 0) -- output.
);
END MasterStateMachine;

ARCHITECTURE description OF MasterStateMachine IS

signal	Pre_Q	: STD_LOGIC_VECTOR (2 downto 0);
signal	state	: STD_LOGIC_VECTOR (7 downto 0);

BEGIN
	if 		Pre_Q = '000' then PreQ <= "00000001"
	elsif	Pre_Q = '001' then PreQ <= "00000010"
	elsif	Pre_Q = '011' then PreQ <= "00000100"
	elsif	Pre_Q = '010' then PreQ <= "00001000"
	elsif	Pre_Q = '100' then PreQ <= "00010000"
	elsif	Pre_Q = '110' then PreQ <= "00100000"
	elsif	Pre_Q = '111' then PreQ <= "01000000"
	elsif	Pre_Q = '100' then PreQ <= "10000000";
    process(clk, clr, Pre_Q)
    begin
        if clr = '1' then
            Pre_Q <= "000";
        elsif rising_edge(clk) then
            if 		Pre_Q = '000' then PreQ <= "001"
			elsif	Pre_Q = '001' then PreQ <= "011"
			elsif	Pre_Q = '011' then PreQ <= "010"
			elsif	Pre_Q = '010' then PreQ <= "110"
			elsif	Pre_Q = '110' then PreQ <= "111"
			elsif	Pre_Q = '111' then PreQ <= "101"
			elsif	Pre_Q = '101' then PreQ <= "100"
			elsif	Pre_Q = '100' then PreQ <= "000";
            end if;
        end if;
    end process;
END description;