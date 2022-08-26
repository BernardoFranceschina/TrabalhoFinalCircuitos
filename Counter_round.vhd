library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter_round is port(
    CLK: in std_logic;
	Set: in std_logic;
	E: in std_logic;
	Q:out std_logic_vector(3 downto 0);
	tc:out std_logic);
end Counter_round;

architecture counter of Counter_round is		 	  
    signal X: std_logic_vector(3 downto 0) := "1111";
begin
    process(CLK, E, Set)
    begin
	if Set = '1' then
 	    X <= "1111";
	elsif (CLK='1' and CLK'event) then
	    if E = '1' then
		    X <=  X - 1;
	    end if;
	end if;
    end process;	
    Q <= X;
    tc <= '1' when (X = "0000") else '0';
end counter;