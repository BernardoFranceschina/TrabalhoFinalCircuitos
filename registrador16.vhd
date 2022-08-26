library ieee;
use ieee.std_logic_1164.all;
entity registrador16 is port (
    Entrada: in std_logic_vector(15 downto 0);
    Reset, Enable, CLK: in std_logic;
    S: out std_logic_vector(15 downto 0));
end registrador16;
architecture reg16 of registrador16 is
begin
    process(CLK)
    begin
        if (Reset = '1') then 
            S <= "0000000000000000";
        elsif (CLK'event and CLK = '1') then
            if (Enable = '1') then
                S <= Entrada;
            end if;
        end if;
    end process;
end reg16;
