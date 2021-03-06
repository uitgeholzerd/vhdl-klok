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

entity variable_counter is
	Generic (min: natural := 0);  	-- minimum, at which the counter will reset
	
   Port ( clk : in  STD_LOGIC;  									-- Clock input
          cten : in  STD_LOGIC;									-- Count enable
          rst : in  STD_LOGIC;									-- Reset
			 down : in  STD_LOGIC;									-- Count down
			 max : in STD_LOGIC_VECTOR (4 downto 0);			-- Maximum at which the counter should reset
          count : out STD_LOGIC_VECTOR (6 downto 0);		-- Counter output
			 carry : out STD_LOGIC									-- Carry
			 )	;	
end variable_counter;

architecture Behavioral of variable_counter is
begin
	cntr: process (clk, max)
		variable int_max: integer range 31 downto 28; 
		variable count_v: integer range 31 downto min;
	begin
		int_max := to_integer(unsigned(max));
		if rising_edge(clk) then
			--if reset is set, counter is 0
			if rst = '1' then
				count_v := min;
				carry <= '0';
			--only count if cten = 1
			elsif cten = '1' then
				case down is
					--if down is set
					when '1' => 
						--count down 
						if count_v > min then
							count_v := count_v -1;
							carry <= '0';
						else
						--or set to max after reaching min
							count_v := int_max;
						end if;
					--if down isn't set...
					when others => 
						--count up
						if count_v < int_max then
							count_v := count_v +1;
							carry <= '0';
						else
						-- or set to min after reaching max
							count_v := min;
							carry <= '1';
						end if;
				end case;
			else
				carry <= '0';
			end if;
		end if;
		--set output to variable from procedure
		count <= std_logic_vector(to_unsigned(count_v, count'length));
	end process;

end Behavioral;

