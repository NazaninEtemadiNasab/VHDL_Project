library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.all;

package wateringsystem_package is
component wateringsystem 
	port(   CLK : in std_logic;
	      	Reset : in std_logic;
		--in
		Tin : in std_logic;
		Lin : in std_logic;
		Min : in std_logic_vector(2 downto 0);
		--out
		Tout : out std_logic;
		Lout : out std_logic;
		Mout : out std_logic_vector(2 downto 0);
		output : out std_logic;  
		seg : out std_logic_vector(6 downto 0) );  --7segment
	 

end component;
end package;
