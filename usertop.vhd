library ieee;
use ieee.std_logic_1164.all;

entity usertop is port (
   KEY: in std_logic_vector(3 downto 0);
   SW: in std_logic_vector(17 downto 0);
   CLK: in std_logic;
   LEDR: out std_logic_vector(17 downto 0);
   HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7: out std_logic_vector(6 downto 0));
end usertop;

architecture rtl of usertop is
    signal R1, E1, E2, E3, E4, E5, E6, end_game, end_sequence, end_round, enter_left, enter_right: std_logic; 
    signal enter_sync, reset_sync: std_logic;
    signal enter_left_play, enter_right_play: std_logic;

component ButtonSync is port(
    KEY1, KEY0, CLK: in  std_logic;
    BTN1, BTN0: out std_logic);
end component;

component ButtonPlay is port(
    KEY1, KEY0: in  std_logic;
    Reset, clk: in  std_Logic;
    BTN1, BTN0: out std_logic); 
end component;

component datapath is port(
    SW: in std_logic_vector(17 downto 0);
    CLK: in std_logic;
	Enter_left, Enter_right: in std_logic;
    R1, E1, E2, E3, E4, E5, E6: in std_logic;
	end_game, end_sequence, end_round, end_left, end_right: out std_logic;
    HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0: out std_logic_vector(6 downto 0);
    LEDR: out std_logic_vector(17 downto 0));
end component;

component Controlador is port(
    clock: in std_logic;
    reset, enter: in std_logic;
    end_round,enter_left,enter_right : in std_logic;
    end_game, end_sequence: in std_logic;
    R1,E1,E2,E3,E4,E5,E6:out std_logic);
end component;

begin
    sync: ButtonSync port map(KEY(1), KEY(0), CLK, enter_sync, reset_sync);
    play: ButtonPlay port map(KEY(3), KEY(2), E2, CLK, enter_left_play, enter_right_play);
    controler: Controlador port map(CLK, reset_sync, enter_sync, end_round, enter_left, enter_right, end_game, end_sequence, R1, E1, E2, E3, E4, E5, E6);
    datapth: datapath port map(SW, CLK, enter_left_play, enter_right_play, R1, E1, E2, E3, E4, E5, E6, end_game, end_sequence, end_round, enter_left, enter_right, HEX7, HEX6, HEX5, HEX4, HEX3, HEX2, HEX1, HEX0, LEDR);
end rtl;