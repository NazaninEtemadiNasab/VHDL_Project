library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_bit.all;
use IEEE.numeric_std.all;

entity testbench_finalproject is
end testbench_finalproject;

architecture testsystem of testbench_finalproject is

component wateringsystem is 
	port( 	clk: in std_logic;
	      	reset : in std_logic;
		--in
		Tin : in std_logic;
		Lin : in std_logic;
		Min : in std_logic_vector(2 downto 0);
		--out
		Tout : out std_logic;
		Lout : out std_logic;
		Mout : out std_logic_vector(2 downto 0);
		output : out std_logic;  
		seg : out std_logic_vector(6 downto 0);   --7segment
		state : out std_logic_vector(1 downto 0) );
	
--end wateringsystem;
end component;


constant clockfrequency : integer := 100e6;  -- 100Mhz
constant clockperiod : time := 1000 ms / clockfrequency;  -- 10ns


signal clk : std_logic := '0';
signal reset: std_logic := '0'; 
signal T_in : std_logic := '0';
signal L_in : std_logic := '0';
signal M_in : std_logic_vector(2 downto 0) :="001";
signal Tout : std_logic := '0';
signal Lout : std_logic := '0';
signal Mout : std_logic_vector(2 downto 0) :="000";
signal output : std_logic := '0'; 

signal state1 : std_logic_vector(1 downto 0) := "11"; --st2
signal seg1 : std_logic_vector(6 downto 0) := "-------";

begin
	
	M1 : wateringsystem 
		port map(reset => reset,
		clk => clk,
		Lin => L_in,
		Tin => T_in,
		Min => M_in,
		state => state1,
		seg => seg1,
		output => output,
		Lout => Lout,
		Tout => Tout,
		Mout => Mout);	

	clockprocess : process begin
		clk <= '1';
		wait for (clockperiod / 2);
		clk <= '0';
		wait for clockperiod/2;
	end process clockprocess;

	testprocess : process begin

		--RESET <= '1' ;wait for 10 ns;RESET <= '0' ; --start st2->st1 --dige niaz nist meghdar dehi daran
--CLK <= '1' ;wait for 10 ns;

		--st0
		T_in <= '0';  L_in <= '0';  M_in <= "111";  wait for 10 ns;  -- T=0 L=0  M>"011" m=4,5,6,7 --7  st0
T_in <= '0';  L_in <= '1';  M_in <= "111";  wait for 10 ns; 
T_in <= '1';  L_in <= '0';  M_in <= "111";  wait for 10 ns; 
--CLK <= '1' ;wait for 10 ns;
		T_IN <= '0' ;L_IN <= '0' ;M_IN <= "100"; wait for 10 ns;--m=4
T_IN <= '1' ;L_IN <= '0' ;M_IN <= "100"; wait for 10 ns;--m=4
T_IN <= '0' ;L_IN <= '1' ;M_IN <= "100"; wait for 10 ns;--m=4
--CLK <= '1' ;wait for 10 ns;
		T_IN <= '0' ;L_IN <= '0' ;M_IN <= "101";wait for 10 ns; --5
T_IN <= '1' ;L_IN <= '0' ;M_IN <= "101";wait for 10 ns; --5
T_IN <= '0' ;L_IN <= '1' ;M_IN <= "101";wait for 10 ns; --5
--CLK <= '1' ;wait for 10 ns;
		T_IN <= '0' ;L_IN <= '0' ;M_IN <= "110";wait for 10 ns;--6
T_IN <= '0' ;L_IN <= '1' ;M_IN <= "110";wait for 10 ns;--6
T_IN <= '1' ;L_IN <= '0' ;M_IN <= "110";wait for 10 ns;--6
--CLK <= '1' ;wait for 10 ns;	
			
		T_in <= '0';  L_in <= '0';  M_in <= "011";  wait for 10 ns;  -- T=0 L=0 M<="011"  st0->st1
--CLK <= '1' ;wait for 10 ns;
		T_in <= '1';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" 2  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" 2  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" 1  st1->st1
T_in <= '1';  L_in <= '0';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" 2  st1->st1
T_in <= '0';  L_in <= '0';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" 1  st1->st1
		T_in <= '1';  L_in <= '1';  M_in <= "000";  wait for 10 ns;  -- T=1 L=1 M<"011" m=0  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" m=2  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" m=1  st1->st1
T_in <= '1';  L_in <= '0';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" m=1  st1->st1
T_in <= '1';  L_in <= '0';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" m=2  st1->st1
		T_in <= '1';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011"  m=1  st1->st1
--cLK <= '1' ;wait for 10 ns;
		T_in <= '1';  L_in <= '1';  M_in <= "011";  wait for 10 ns;  -- T=1 L=1 M>="011"  st1->st0

--CLK <= '1' ;wait for 10 ns;
		T_in <= '1';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M>"001"   st0->st0
T_in <= '0';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M>"001"   st0->st0
T_in <= '1';  L_in <= '0';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M>"001"   st0->st0
--CLK <= '1' ;wait for 10 ns;
		T_in <= '0';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=0 L=0 M>"011"   st0->st0
T_in <= '0';  L_in <= '0';  M_in <= "001";  wait for 10 ns;  -- T=0 L=0 M>"011"   st0->st0
T_in <= '1';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=0 L=0 M>"011"   st0->st0
--CLK <= '1' ;wait for 10 ns;
		--reset1 <= '1';				wait for 10 ns;
		T_in <= '1';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=0 L=0 M<="111"  st0->st1
--CLK <= '1' ;wait for 10 ns;
		T_in <= '0';  L_in <= '0';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" m=1  st1->st1	
T_in <= '1';  L_in <= '0';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" m=1  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" m=1  st1->st1
		T_in <= '0';  L_in <= '0';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" m=2  st1->st1
T_in <= '1';  L_in <= '0';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" m=2  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" m=2  st1->st1
		T_in <= '0';  L_in <= '0';  M_in <= "011";  wait for 10 ns;  -- T=1 L=1 M<"011" m=3  st1->st1
T_in <= '1';  L_in <= '0';  M_in <= "011";  wait for 10 ns;  -- T=1 L=1 M<"011" m=3  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "011";  wait for 10 ns;  -- T=1 L=1 M<"011" m=3  st1->st1
		T_in <= '0';  L_in <= '0';  M_in <= "100";  wait for 10 ns;  -- T=1 L=1 M<"011" m=4  st1->st1
T_in <= '1';  L_in <= '0';  M_in <= "100";  wait for 10 ns;  -- T=1 L=1 M<"011" m=4  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "100";  wait for 10 ns;  -- T=1 L=1 M<"011" m=4  st1->st1
		T_in <= '0';  L_in <= '0';  M_in <= "101";  wait for 10 ns;  -- T=1 L=1 M<"011" m=5  st1->st1
T_in <= '1';  L_in <= '0';  M_in <= "101";  wait for 10 ns;  -- T=1 L=1 M<"011" m=5  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "101";  wait for 10 ns;  -- T=1 L=1 M<"011" m=5  st1->st1
		T_in <= '1';  L_in <= '1';  M_in <= "011";  wait for 10 ns;  -- T=1 L=1 M>="011"  st1->st0
T_in <= '0';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M>"001"   st0->st0
T_in <= '1';  L_in <= '0';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M>"001"   st0->st0
		T_in <= '0';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=0 L=0 M>"011"   st0->st0
		T_in <= '1';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=0 L=0 M<="111"  st0->st1
T_in <= '0';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M<"011" m=2  st1->st1
T_in <= '0';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" m=1  st1->st1
T_in <= '1';  L_in <= '0';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011" m=1  st1->st1
		T_in <= '1';  L_in <= '1';  M_in <= "100";  wait for 10 ns;  -- T=1 L=1 M>="011"  st1->st0
T_in <= '1';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 M>"001"   st0->st0
		T_in <= '1';  L_in <= '1';  M_in <= "111";  wait for 10 ns;  -- T=0 L=0 M<="111"  st0->st1
T_in <= '1';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 M<"011"  m=1  st1->st1	
		T_in <= '0';  L_in <= '1';  M_in <= "101";  wait for 10 ns;  -- T=1 L=1 M>="011"  st1->st0	
T_in <= '0';  L_in <= '0';  M_in <= "110";  wait for 10 ns;  -- T=0 L=0 M>"011"   st0->st0
T_in <= '1';  L_in <= '1';  M_in <= "100";  wait for 10 ns;  -- T=0 L=0 M>"011"   st0->st0
		T_in <= '1';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=0 L=0 M<="111"  st0->st1		



		--T_in <= '1';  L_in <= '1';  M_in <= "001";  wait for 10 ns;  -- T=1 L=1 m=1 M<="001"   st0->st1
		--T_in <= '0';  L_in <= '0';  M_in <= "011";  wait for 10 ns;  -- T=1 L=1 m=3 M<="011"  st0->st1
		
		--st1
		--T_in <= '1';  L_in <= '1';  M_in <= "010";  wait for 10 ns;  -- T=1 L=1 m=2 M<"011"   st1->st1
		--T_in <= '1';  L_in <= '1';  M_in <= "011";  wait for 10 ns;  -- T=1 L=1 m=3 M>="011"  st1->st0
		
		--T_in <= '0';  L_in <= '0';  M_in <= "110";  wait for 10 ns;  -- T=0 L=0 m=6 M<="011"  st0->st1

		--M_in <="111" wait for 10 ns --m7 M>="111" st1->st0
		--T_in <= '0';  L_in <= '0';  M_in <= "111";  wait for 10 ns;  -- T=0 L=0 M<="011"  st0->st1

		wait;
	end process testprocess;
	

end testsystem;
	