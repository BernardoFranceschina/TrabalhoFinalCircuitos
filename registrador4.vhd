library ieee;
use ieee.std_logic_1164.all;
entity registrador4 is port (
    Entrada: in std_logic_vector(3 downto 0);
    Reset, Enable, CLK: in std_logic;
    S: out std_logic_vector(3 downto 0));
end registrador4;
architecture reg4 of registrador4 is
begin
    process(CLK)
    begin
        if (Reset = '1') then 
            S <= "0000";
        elsif (CLK'event and CLK = '1') then
            if (Enable = '1') then
                S <= Entrada;
            end if;
        end if;
    end process;
end reg4;