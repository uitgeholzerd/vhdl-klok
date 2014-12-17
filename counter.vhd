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
-- Description: 	Counter that counts to the given max, gives a carry and then resets to the given min. Can also count down
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

entity counter is
	Generic (max: positive := 59;									-- Maximum at which the counter will reset
				min: natural := 0);  								-- Minimum to which the counter will reset
   Port ( clk : in  STD_LOGIC;  									-- Clock input
          cten : in  STD_LOGIC;									-- Count enable
          rst : in  STD_LOGIC;									-- Reset
			 down : in  STD_LOGIC;									-- Count down
          count : out STD_LOGIC_VECTOR (6 downto 0);		-- Counter output
			 carry : out STD_LOGIC
			 )	;
end counter;

architecture Behavioral of counter is
begin
	cntr: process (clk)
		variable count_v: integer range max downto min;
	begin
		if rising_edge(clk) then
			--if reset is set, counter is 0
			if rst = '1' then
				count_v := min;
				carry <= '0';
			--only count if cten = 1
			elsif cten = '1' then
				case down is
					--if down is set...
					when '1' => 
						--count down 
						if count_v > min then
							count_v := count_v -1;
							carry <= '0';
						else
						--set to max after reaching min
							count_v := max;
						end if;
					--if down isn't set...
					when others => 
						--count up
						if count_v < max then
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
		count <= std_logic_vector(to_unsigned(count_v, 7));
	end process;

end Behavioral;

