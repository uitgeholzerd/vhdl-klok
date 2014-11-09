----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:28:25 10/24/2014 
-- Design Name: 
-- Module Name:    clock_divider - Behavioral 
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

entity clock_divider is
	generic (max 	: 	positive  := 10);				-- Number by which the clock should be divided
	Port (	clk, ena : in  STD_LOGIC;
				div : out  STD_LOGIC);
end clock_divider;

architecture Behavioral of clock_divider is
	signal 	count_int : integer range 0 to max;

begin
	counter: process (clk, ena)                  						-- Begin counting
		Begin
			If rising_edge(clk) and (ena = '1') then		
				if count_int = max then										-- If counter reached max, reset it
					count_int <= 0;				
				Else
					count_int <= count_int + 1;   						-- Else add 1 to the counter
				End if;                                      	
			End if;                                     			
		End process;                             						
---------------------------------------------------------
div <= '1' when (count_int = max) and (ena = '1') else '0';	-- Put 1 signal on the div outpunt when counter has reached max


end Behavioral;

