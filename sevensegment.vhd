library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

entity \7seg\ is
    Port( input1: in std_logic_vector(3 downto 0);
	   seg: out std_logic_vector(6 downto 0));
         
end entity;

architecture sevenseg of \7seg\ is

begin

    p1:process(input1)begin
  	  case input1 is
            when "0000" =>seg <= "0000001"; -- 0 --0faal
            when "0001" =>seg <= "1001111"; -- 1
            when "0010" =>seg <= "0010010"; -- 2
            when "0011" =>seg <= "0000110"; -- 3
            when "0100" =>seg <= "1001100"; -- 4
            when "0101" =>seg <= "0100100"; -- 5
            when "0110" =>seg <= "0100000"; -- 6
            when "0111" =>seg <= "0001111"; -- 7
            when "1000" =>seg <= "0000000"; -- 8
            when "1001" =>seg <= "0000100"; -- 9
            when "1010" =>seg <= "0001000"; -- A
            when "1011" =>seg <= "1100000"; -- B
            when "1100" =>seg <= "0110001"; -- C
            when "1101" =>seg <= "1000010"; -- D
            when "1110" =>seg <= "0110000"; -- E
            when "1111" =>seg <= "0111000"; -- F
            when others =>seg <= "1111111"; -- turn off all segments
        end case;
    end process;

--seg<= "0000001" when input1='0' else --1faal
	--	   "1011011" when input1='1' else
	--	   "UUUUUUU";

end architecture ;
