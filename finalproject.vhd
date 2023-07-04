library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity wateringsystem is 
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
		seg : out std_logic_vector(6 downto 0);  --7segment
		state : out std_logic_vector(1 downto 0) ); 
	   
end wateringsystem;

architecture system of wateringsystem is

	--constant st0 :std_logic_vector(1 downto 0) := "00";
	--constant st1 :std_logic_vector(1 downto 0) := "01";
	--constant st2 :std_logic_vector(1 downto 0) := "11";

	subtype states_type is std_logic_vector(1 downto 0);
	constant st0 :states_type := "00";
	constant st1 :states_type := "01";
	constant st2 :states_type := "11";
	signal next_state : states_type; 
	signal current_state : states_type := "11"; --st2=11
	signal state1 : std_logic_vector(1 downto 0);
	
--	function checkideal_fun(T : std_logic:='0'; L : std_logic:='0') return boolean is
--		begin
--	case ideal_case is
--			when T='0' and L='0' =>return true;      
--			when others =>  return false;
--	end case;	
--	end function;

signal ideal: boolean ;
function checkideal_fun (T : std_logic:='0'; L : std_logic:='0') return boolean is
		begin
		if(T='0' and L='0') then 
			return true;
		else 	
		 	return false;
		end if;
	end function;

begin
	Process1: process (clk,reset) begin    --taghir state
		
			if reset = '1' then 
				current_state <= st2 ;
				state1 <= st2 ;
			elsif clk'event and clk = '1' then 
				current_state <= next_state ;
				state <= next_state;
				Mout <= Min;
				Lout <= Lin;
				Tout <= Tin;
			end if ;
	end process Process1;

	Process2: process (Tin,Lin,Min,current_state) begin
		ideal <= checkideal_fun(Tin,Lin);
		case current_state is

			when st0 => if(ideal ) and (Min>"011") then   --halat1
				--if(T='0' and L='0' and Min>"011" ) then
					next_state <= st0;
					-- Tout <= Tin; 
					-- Lout <= Lin;
					-- Mout <= Min;
					end if;

				    if(not ideal) and (Min>"001") then  --halat2
					--if(T='1' and L='1' and Min>"011" ) then
					next_state <= st0;
					-- Tout <= Tin; 
					-- Lout <= Lin;
					-- Mout <= Min;
					end if;

				    if(ideal) and (Min<="011") then --halat3
					--if(T='0' and L='0' and Min<="011" ) then
					next_state <= st1;
					-- Tout <= Tin; 
					-- Lout <= Lin;
					-- Mout <= Min;
					end if;

				    if(not ideal) and (Min<="001") then  --halat4
					--if(T='1' and L='1' and Min<="001") then
					next_state <= st1;
					-- Tout <= Tin; 
					-- Lout <= Lin;
					-- Mout <= Min;
					end if;


			when st1 => if(ideal) and (Min<"111") then --halat1
				--if(T='0' and L='0' and Min<"111") then
					next_state <= st1;
					-- Tout <= Tin; 
					-- Lout <= Lin;
					-- Mout <= Min;
					end if;

				    if(not ideal) and (Min<"011") then --halat2
					--if(T='1' and L='1' and Min<"011") then
					next_state <= st1;
					-- Tout <= Tin; 
					-- Lout <= Lin;
					-- Mout <= Min;
					end if;

				     if(Min>="111" ) then --halat3
					next_state <= st0;
					-- Tout <= Tin; 
					-- Lout <= Lin;
					-- Mout <= Min;
					end if;

				     if(not ideal) and (Min>="011") then --halat4
					--if(T='1' and L='1' and Min>="011") then
					next_state <= st0;
					-- Tout <= Tin; 
					-- Lout <= Lin;
					-- Mout <= Min;
					end if;

			when st2 => next_state <= st0; 

			when others => next_state <= "UU";

		end case;
	end process Process2;
	
	--Process3: process(current_state) begin --output
	--	case current_state is
	--		when st0 => output <= '0';
		--	when st2 => output <= '0';
		--	when st1 => output <= '1'; 
	--		when others => output <= 'U'; 
	---	end case;	
	--end process Process3;

	--state1 <= current_state;
--		Tout <= Tin;
--		Lout <= Lin;
--		Mout <= Min;		
		
--	seg <= "0000001"  when state1=st2 or state1=st0 
--		else
--		"1011011" when state1=st1 
--		else  --H
--		 "UUUUUUU";
	
--	output <= '0' when state1=st2 or state1=st0 
--		else
--		  '1' when state1=st1 
--		else
--		  'U';
process3 : process ( current_state ) begin
			if current_state = st1 then--1faal
				seg <=  "1011011" ;
				output <= '1' ;
			else
				seg <=  "0000001" ;
				output <= '0' ;
			end if ;
		end process process3 ;
	
end system ;

