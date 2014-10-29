----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:11:31 10/19/2014 
-- Design Name: 
-- Module Name:    counter - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_days is
   Port ( clk : in  STD_LOGIC;  		--clock input
          cten : in  STD_LOGIC;		--count enable
          rst : in  STD_LOGIC;		--reset to 0
			 down : in  STD_LOGIC;		--count up unless this is 1
			 max : in STD_LOGIC_VECTOR (4 downto 0) ;
          count : out STD_LOGIC_VECTOR (4 downto 0);		--counter output
			 carry : out STD_LOGIC
			 )	;
end counter_days;

architecture Behavioral of counter_days is
begin
	cntr: process (clk)
		variable count_v: integer range 31 downto 1;
		variable max_v: positive range 31 downto 28;
		variable carry_v: std_logic;
	begin
		if rising_edge(clk) then
			carry_v := '0';
			max_v := to_integer(unsigned(max));
			--if reset is set, counter is 0
			if rst = '1' then
				count_v := 1;
			--only count if cten = 1
			elsif cten = '1' then
				case down is
					--if down is set...
					when '1' => 
						--count down 
						if count_v >1 then
							count_v := count_v -1;
							
						else
						--or set to max-1 after reaching min
							count_v := max_v-1;
							carry_v := '1';
						end if;
					--if down isn't set...
					when others => 
						--count up
						if count_v < max_v-1 then
							count_v := count_v +1;
							
						else
						-- or set to min before reaching max
							count_v := 1;
							carry_v := '1';
						end if;
				end case;
			end if;
		end if;
		--set output to variable from procedure
		count <= std_logic_vector(to_unsigned(count_v, 5));
		carry <= carry_v;
	end process;

end Behavioral;

