library ieee;
use ieee.std_Logic_1164.all;

entity Mux4_1x80 is port(

    S: in std_logic_vector(1 downto 0);
    L0, L1, L2, L3: in std_logic_vector(79 downto 0);
    D: out std_logic_vector(79 downto 0));
    
end Mux4_1x80;

architecture arcmux4_1 of Mux4_1x80 is begin
    D <= L0 when S = "00" else
         L1 when S = "01" else
         L2 when S = "10" else
	      L3;    
end arcmux4_1;
