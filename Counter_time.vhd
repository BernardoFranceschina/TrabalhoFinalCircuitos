library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_signed.all;

entity Counter_time is port(
    CLK: in std_logic;
	R: in std_logic;
	E: in std_logic;
	load:in std_logic_vector(7 downto 0);
	Q:out std_logic_vector(7 downto 0);
	tc:out std_logic);
end Counter_time;

architecture counter of Counter_time is		 	  
    signal X: std_logic_vector(7 downto 0);
begin
    process(CLK, E, R, load)
    begin
	if R = '1' then
 	    X <= "01100011";
	elsif (CLK='1' and CLK'event) then
	    if E = '1' then
		    X <=  X + load;
	    end if;
	end if;
    end process;	
    Q <= X;
    tc <= '1' when (X < "00000001") else '0';
end counter;