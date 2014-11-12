----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:54:20 10/31/2014 
-- Design Name: 
-- Module Name:    time - Behavioral 
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

entity mod_time is

    Port ( clk, rst, cten : in  STD_LOGIC;
			  incr_hour, incr_min, reset_sec : in STD_LOGIC;
			  down : in STD_LOGIC;
           hours, mins, secs : out  STD_LOGIC_VECTOR (6 downto 0);
           carry : out  STD_LOGIC
			  );
end mod_time;

architecture Behavioral of mod_time is
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
	 signal carryS, carryM, carryH : std_logic;
	 signal ctenS, ctenM, ctenH : std_logic;
	 signal reset_seconds : std_logic;
begin
	ctenS <= not (incr_min or incr_hour);
	ctenM <= carryS or incr_min;
	ctenH <= carryM or incr_hour;
	carry <= carryH;
	
	reset_seconds <= rst or reset_sec;
	
	SEC: counter
		generic map (max => 59, min => 0)
		port map (clk => clk, rst => reset_seconds, cten => ctenS, down=> down, count => secs, carry => carryS);
	MIN: counter
		generic map (max => 59, min => 0)
		port map (clk => clk, rst => rst, cten => ctenM, down=> down, count => mins, carry => carryM);
	HRS: counter
		generic map (max => 23, min => 0)
		port map (clk => clk, rst => rst, cten => ctenH, down=> down, count => hours, carry => carryH);
		
end Behavioral;

