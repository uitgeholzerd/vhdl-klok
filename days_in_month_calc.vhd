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
-- Description: Calculate the amount of days in the month, given the month and year
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
			year : in std_logic_vector(6 downto 0);					-- Last 2 digits of the year in binary, should be between 00 and 99
			month : in std_logic_vector(6 downto 0);					-- Month in binary, should be between 1 and 12
			days_in_month : out std_logic_vector(4 downto 0));		-- Days in the month, in binary
end days_in_month_calc;

architecture Behavioral of days_in_month_calc is

begin
	process (year, month) is 
	variable int_year: integer range 00 to 99;
	variable int_month: integer range 1 to 12;
	
	variable leap_year: Boolean;
	variable days: integer range 28 to 31;
		begin	
				int_year := to_integer(unsigned(year));
				int_month := to_integer(unsigned(month));
				
				-- Check if year is leapyear
				case int_year is
					when 00 | 04 | 08 | 12 | 16 | 20 | 24 | 28 | 32 | 36 | 40 | 44 | 48 | 52 | 56 | 60 | 64 | 68 | 72 | 76 | 80 | 84 | 88 | 92 | 96 =>
						leap_year := true;
					when others =>
						leap_year := false;
				end case;
				
				-- Calculate days in month based on current month and leapyear
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