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

entity counter is
	Generic (max: positive := 59;
				min: natural := 0);  	--counter will reset instead of reaching this number
   Port ( clk : in  STD_LOGIC;  		--clock input
          cten : in  STD_LOGIC;		--count enable
          rst : in  STD_LOGIC;		--reset to 0
			 down : in  STD_LOGIC;		--count up unless this is 1
			 ld : in STD_LOGIC;			--load data
			 data : in STD_LOGIC_VECTOR (7 downto 0) ;		--data to load
          count : out STD_LOGIC_VECTOR (7 downto 0);		--counter output
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
			--if load is set, load from data
			elsif ld = '1' then
				--count_v := data;
				count_v := to_integer(unsigned(data));
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
						--or set to max after reaching min
							count_v := max;
							carry <= '1';
						end if;
					--if down isn't set...
					when others => 
						--count up
						if count_v < max then
							count_v := count_v +1;
							carry <= '0';
						else
						-- or set to min before reaching max
							count_v := min;
							carry <= '1';
						end if;
				end case;
			end if;
		end if;
		--set output to variable from procedure
		--count <= count_v;
		count <= std_logic_vector(to_unsigned(count_v, 8));
	end process;

end Behavioral;

