library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Controlador is port(
    clock: in std_logic;
    reset, enter: in std_logic;
    end_round,enter_left,enter_right : in std_logic;
    end_game, end_sequence: in std_logic;
    R1,E1,E2,E3,E4,E5,E6:out std_logic);
end Controlador;

architecture estados of Controlador is
    type STATES is (Init,Setup,Sequence,Play,Check,Waiit,Result);
signal EA, PE: STATES;
begin
    P1: process(clock, reset) begin
    	if (reset = '1') then
    		EA <= Init;
    	elsif (clock'event and clock = '1') then
    		EA <= PE;
        end if;
    end process;
	
P2: process(EA, enter, end_round, enter_left, enter_right, end_game, end_sequence) begin
	case EA is
		when Init =>
			R1 <= '1'; 
			E1 <= '0';
			E2 <= '0';
			E3 <= '0';
			E4 <= '0';
			E5 <= '0';
			E6 <= '0';
			PE <= Setup;
			
		when Setup =>
			R1 <= '0';
			E1 <= '1';
			E2 <= '0';
			E3 <= '0';
			E4 <= '0';
			E5 <= '0';
			E6 <= '0';
			if (enter = '1') then
				PE <= Sequence;
			else
				PE <= Setup; 
			end if;

		when Sequence =>
			R1 <= '0';
			E1 <= '0';
			E2 <= '1';
			E3 <= '0';
			E4 <= '0';
			E5 <= '0';
			E6 <= '0';
			if (end_sequence = '1') then
				PE <= Play;
			else
				PE <= Sequence; 
			end if;
	
		when Play =>
			R1 <= '0';
			E1 <= '0';
			E2 <= '0';
			E3 <= '1';
			E4 <= '0';
			E5 <= '0';
			E6 <= '0';
			if enter_left = '1' and enter_right = '1' then
				PE <= Check;
			else
			    PE <= Play; 
			end if;
			
		when Check =>
			R1 <= '0';
			E1 <= '0';
			E2 <= '0';
			E3 <= '0';
			E4 <= '1';
			E5 <= '0';
			E6 <= '0';
			PE <= Waiit;
		
		when Waiit =>
			R1 <= '0';
			E1 <= '0';
			E2 <= '0';
			E3 <= '0';
			E4 <= '0';
			E5 <= '1';
			E6 <= '0';
			if (end_game = '1') then
				PE <= Result;
			elsif (enter = '1') then
				PE <= Sequence;
			else
				PE <= Waiit; 
			end if;

		when Result =>
			R1 <= '0';
			E1 <= '0';
			E2 <= '0';
			E3 <= '0';
			E4 <= '0';
			E5 <= '0';
			E6 <= '1';
			if (end_round = '1') then
				PE <= Init;
			else
				PE <= Result; 
			end if;
        end case;
    end process;
end estados;