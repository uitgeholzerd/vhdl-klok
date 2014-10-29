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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity days_in_month_calc is
    Port ( 
			clk : in std_logic;												-- clock input
			year : in std_logic_vector(11 downto 0);					-- year in binary, should be between 2001 and 2099
			month : in std_logic_vector(3 downto 0);					-- month in binary, should be between 1 and 12
			days_in_month : out std_logic_vector(4 downto 0));		-- days in the month, in binary
end days_in_month_calc;

architecture Behavioral of days_in_month_calc is

begin
	process (year, month) is 
	variable int_year: integer range 2001 to 2099;
	variable int_month: integer range 1 to 12;
	
	variable leap_year: Boolean;
	variable days: integer range 28 to 31;
		begin
		int_year := to_integer(unsigned(year));
		int_month := to_integer(unsigned(month));
		-- leap_year := ((year mod 4 = 0) and not(year mod 100 = 0)) or (year mod 400 = 0);
		case int_year is
			when 2004 | 2008 | 2012 | 2016 | 2020 | 2024 | 2028 | 2032 | 2036 | 2040 | 2044 | 2048 | 2052 | 2056 | 2060 | 2064 | 2068 | 2072 | 2076 | 2080 | 2084 | 2088 | 2092 | 2096 =>
				leap_year := true;
			when others =>
				leap_year := false;
		end case;
		
		case int_month is 
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
		
	days_in_month <= std_logic_vector(to_unsigned(days, days_in_month'length));
	end process;
end Behavioral;

