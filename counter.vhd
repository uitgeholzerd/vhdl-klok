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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
	Generic (max: positive := 60);  	--counter will reset instead of reaching this number
   Port ( clk : in  STD_LOGIC;  		--clock input
          cten : in  STD_LOGIC;		--count enable
          rst : in  STD_LOGIC;		--reset to 0
			 down : in  STD_LOGIC;			--count up unless this is one
          count : out integer range max-1 downto 0);
end counter;

architecture Behavioral of counter is
begin
	cntr: process (clk)
		variable count_v: integer range max-1 downto 0;
	begin
		if rising_edge(clk) then
			if rst = '1' then
				count_v := 0;
			elsif cten = '1' then
				case down is
					when '1' => if count_v > 0 then
							count_v := count_v -1;
						else
							count_v := max-1;
						end if;
					when others => if count_v < max-1 then
							count_v := count_v +1;
						else
							count_v := 0;
						end if;
				end case;
			end if;
		end if;
		count <= count_v;
	end process;

end Behavioral;

