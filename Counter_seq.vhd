library ieee ;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Counter_seq is port(
    CLK: in std_logic;
	R: in std_logic;
	E: in std_logic;
	Q:out std_logic_vector(1 downto 0);
	tc:out std_logic);
end Counter_seq;

architecture counter of Counter_seq is		 	  
    signal count: std_logic_vector(2 downto 0) := "000";
begin
    process(CLK, R)
    begin
    	if R = '1' then
     	    count <= "000";
    	elsif (CLK='1' and CLK'event) then
    	    if E = '1' then
    		    count <=  count + 1;
    	    end if;
    	end if;
    end process;	
    Q <= count(1 downto 0);
    tc <= '1' when (count = "100") else '0';
end counter;