----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    19:30:11 10/19/2014 
-- Design Name: 
-- Module Name:    teller - Behavioral 
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

entity teller is
	Generic (n: positive := 60);
   Port ( clk : in  STD_LOGIC;
          cten : in  STD_LOGIC;
          rst : in  STD_LOGIC;
			 up : in  STD_LOGIC;
          count : out integer range n-1 downto 0);
end teller;

architecture Behavioral of teller is
begin
	cntr: process (clk)
		variable count_v: integer range n-1 downto 0;
	begin
		if rising_edge(clk) then
			if rst = '1' then
				count_v := 0;
			elsif cten = '1' then
				case up is
					when '1' => count_v := count_v +1;
					when others => count_v := count_v -1;
				end case;
			end if;
		end if;
		count <= count_v;
	end process;
end Behavioral;

