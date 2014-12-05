----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:43:04 11/14/2014 
-- Design Name: 
-- Module Name:    mod_date - Behavioral 
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
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity mod_date is
		Port ( clk, rst, cten : in  STD_LOGIC;
				incr_day, incr_month, incr_year : in STD_LOGIC;					-- Increases the days/months/years
				down : in STD_LOGIC;														-- Decreases instead of increases
				day, month, year : out  STD_LOGIC_VECTOR (6 downto 0)			-- Day/month/year output
				);
end mod_date;

architecture Behavioral of mod_date is
	component counter is
		generic (min, max		: integer :=60);
		Port ( clk : in  STD_LOGIC;  		--clock input
			 cten : in  STD_LOGIC;			--count enable
			 rst : in  STD_LOGIC;			--reset to 0
			 down : in  STD_LOGIC;			--count up unless this is 1
			 count : out STD_LOGIC_VECTOR (6 downto 0);		--counter output
			 carry : out STD_LOGIC
			 )	;
	end component;
	 
	component variable_counter is
		generic (min: natural := 0);  	-- minimum, at which the counter will reset
		Port ( clk : in  STD_LOGIC;  		-- clock input
				 cten : in  STD_LOGIC;		-- count enable
				 rst : in  STD_LOGIC;		-- reset to 0
				 down : in  STD_LOGIC;		-- count up unless this is 1
				 max : in STD_LOGIC_VECTOR (4 downto 0);			-- maximum, at which the counter should reset
				 count : out STD_LOGIC_VECTOR (6 downto 0);		-- counter output
				 carry : out STD_LOGIC									-- carry
				 )	;	
	end component;
	
	component days_in_month_calc is
		Port ( 
			year : in std_logic_vector(6 downto 0);					-- year in binary, should be between 2001 and 2099
			month : in std_logic_vector(6 downto 0);					-- month in binary, should be between 1 and 12
			days_in_month : out std_logic_vector(4 downto 0)		-- days in the month, in binary
			);		
	end component;
	
	signal carryDay, carryMonth : std_logic;
	signal ctenDay, ctenMonth, ctenYear : std_logic;
	signal daysInMonth : std_logic_vector(4 downto 0) := "11110";
	signal monthCount : std_logic_vector (6 downto 0);
	signal yearCount : std_logic_vector (6 downto 0);

begin
	ctenDay <= cten or incr_day;
	ctenMonth <= carryDay or incr_month; --and not incr_day
	ctenYear <= carryMonth or incr_year; --and not incr_month
	
	year <= yearCount;
	month <= monthCount;	

	DAY_COUNTER: variable_counter
	generic  map (min => 1)
	port map(clk => clk, cten => ctenDay, rst => rst, down => down, max => daysInMonth, count => day, carry => carryDay);
	
	MONTH_COUNTER: counter
	generic  map (min => 1, max => 12)
	port map(clk => clk, cten => ctenMonth, rst => rst, down => down, count => monthCount, carry => carryMonth);
	
	YEAR_COUNTER: counter
	generic  map (min => 00, max => 99)
	port map(clk => clk, cten => ctenYear, rst => rst, down => down, count => yearCount, carry => open);
	
	DAYS_CALC: days_in_month_calc
	port map(year => yearCount, month => monthCount, days_in_month => daysInMonth);

end Behavioral;

