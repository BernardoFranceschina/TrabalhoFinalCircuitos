library ieee;
use ieee.std_logic_1164.all;

entity ROM1 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(79 downto 0));
    
end ROM1;

architecture Rom_Arch of ROM1 is

type memory is array (00 to 15) of std_logic_vector(79 downto 0);
constant my_Rom : memory := (

	00 => x"0C0A060503305060A0C0",  --BIN- L: 00000011 00000101 00000110 00001010 00001100  R: 11000000 10100000 01100000 01010000 00110000
	01 => x"12080503022319161413",  --BCD- L:  2  3  5  8 12  R: 13 14 16 19 23
   02 => x"E0703870E007E01CE007",  --BIN- L: 11100000 01110000 00111000 01110000 11100000  R: 00000111 00001110 00011100 00001110 00000111
	03 => x"03090210010802090110",  --BCD- L:  1 10  2  9  3  R: 10  1  9  2  8
	04 => x"018183C3C7E3C3C18180",  --BIN- L: 11000111 11000011 10000011 10000001 00000001  R: 10000000 10000001 11000001 11000011 11100011
	05 => x"40322416088072645648",  --BCD- L:  8 16 24 32 40  R: 48 56 64 72 80
	06 => x"100C0402010102040C10",  --BIN- L: 00010000 00001100 00000100 00000011 00000001  R: 00000001 00000011 00000100 00001100 00010000
	07 => x"07050302010102030507",  --BCD- L:  1  2  3  5  7  R:  7  5  3  2  1
	08 => x"01020304050504030201",  --BIN- L: 00000101 00000100 00000011 00000010 00000001  R: 00000001 00000010 00000011 00000100 00000101
	09 => x"35282114077063564942",  --BCD- L:  7 14 21 28 35  R: 42 49 56 63 70
   10 => x"CC66CC66CC66CC66CC66",  --BIN- L: 11001100 01100110 11001100 01100110 11001100  R: 01100110 11001100 01100110 11001100 01100110
	11 => x"44332211009988776655",  --BCD- L: 00 11 22 33 44  R: 55 66 77 88 99
	12 => x"80402010081008040201",  --BIN- L: 10000000 01000000 00100000 00010000 00001000  R: 00000001 00000010 00000100 00001000 00010000 
	13 => x"18161412102826242220",  --BCD- L: 10 12 14 16 18  R: 20 22 24 26 28
	14 => x"B5A5A18180ADA5858180",  --BIN- L: 10000000 10000001 10100001 10100101 10110101  R: 00000001 10000001 10000101 10100101 10101101
	15 => x"30241812066054484236"); --BCD- L:  6 12 18 24 30  R: 36 42 48 54 60   
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
