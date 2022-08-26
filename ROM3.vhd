library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(79 downto 0));
    
end ROM3;

architecture Rom_Arch of ROM3 is
  
type memory is array (00 to 15) of std_logic_vector(79 downto 0);
constant my_Rom : memory := (

	00 => x"2DB76EB8C0B4ED761D03",  --BIN- L: 11000000 10111000 01101110 10110111 00101101  R: 00000011 00011101 01110110 11101101 10110100
	01 => x"FF00FF00FF00FF00FF00",  --BCD- L: 9 18 27 36 45  R: 54 63 72 81 90
   02 => x"0C0A060503305060A0C0",  --BIN- L: 00000011 00000101 00000110 00001010 00001100  R: 11000000 10100000 01100000 01010000 00110000
	03 => x"FF00FF00FF00FF00FF00",  --BCD- L: 4 8 12 16 20  R: 24 28 32 36 40 
	04 => x"FFE7C3810000183C7EFF",  --BIN- L: 11111111 11100111 11000011 10000001 00000000  R: 00000000 00011000 00111100 01111110 11111111
	05 => x"FF00FF00FF00FF00FF00",  --BCD- L: 00 11 22 33 44 R: 55 66 77 88 99
	06 => x"CC66CC66CC66CC66CC66",  --BIN- L: 11001100 01100110 11001100 01100110 11001100  R: 01100110 11001100 01100110 11001100 01100110
	07 => x"FF00FF00FF00FF00FF00",  --BCD- L: 1 2 3 5 7 R: 11 13 17 19 23
	08 => x"80402010081008040201",  --BIN- L: 10000000 01000000 00100000 00010000 00001000  R: 00000001 00000010 00000100 00001000 00010000 
	09 => x"FF00FF00FF00FF00FF00",  --BCD- L: 3 6 9 12 15  R: 18 21 24 27 30
   10 => x"01020304050504030201",  --BIN- L: 00000101 00000100 00000011 00000010 00000001  R: 00000001 00000010 00000011 00000100 00000101
	11 => x"FF00FF00FF00FF00FF00",  --BCD- L:  2  4  6  8  10  R: 12 14 16 18 20
	12 => x"0C0A060503305060A0C0",  --BIN- L: 00000011 00000101 00000110 00001010 00001100  R: 11000000 10100000 01100000 01010000 00110000
	13 => x"25201510055045403530",  --BCD- L:  5 10 15 20 25  R: 30 35 40 45 50
	14 => x"33CC330C03CC33CC30C0",  --BIN- L: 00000011 00001100 00110011 11001100 00110011  R: 11000000 00110000 11001100 00110011 11001100
	15 => x"05040302011009080706",  --BCD- L:  1  2  3  4  5  R:  6  7  8  9 10 
	    -- a ordem eh da direita pra esquerda: 5<-4<-3<-2<-1      5<-4<-3<-2<-1
    	 -- e de baixo pra cima, a primeira rodada eh a linha 15, depois a 14, etc. 
	 
	
begin
   process (address)
   begin
       case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
	    when "1010" => data <= my_rom(10);
	    when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
	    when "1101" => data <= my_rom(13);
	    when "1110" => data <= my_rom(14);
	    when others => data <= my_rom(15);
     end case;
  end process;
end architecture Rom_Arch;
