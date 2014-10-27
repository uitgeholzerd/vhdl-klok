----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:59:01 10/27/2014 
-- Design Name: 
-- Module Name:    days_in_month_calc - Behavioral 
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

entity days_in_month_calc is
    Port ( 
			clk : in std_logic;
			year : in integer range 1901 to 2099;
			month : in integer range 1 to 12;
			days_in_month : out integer range 28 to 31);
end days_in_month_calc;

architecture Behavioral of days_in_month_calc is

begin
	process (clk) is 
	variable leap_year: Boolean;
	variable days: integer range 28 to 31;
		begin
		leap_year := ((year mod 4 = 0) and not(year mod 100 = 0)) or (year mod 400 = 0);
		
		case month is 
			when 4 | 6 | 9 | 11 =>
				days := 30;
			when 1 | 3 | 5 | 7 | 8 | 10 | 12 =>
				days := 31;
			when 2 =>
				if leap_year = true then
					days := 29;
				else
					days := 28;
				end if;
		end case;
		
	days_in_month <= days;
	end process;
end Behavioral;

