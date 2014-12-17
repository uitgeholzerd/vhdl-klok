----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:04:35 10/23/2014 
-- Design Name: 
-- Module Name:    debouncer - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: Debounces a signal by requiring it to be held for a certain amount of clocksignals before it is allowed through
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

entity debouncer is
	Port(	clk, en : in  STD_LOGIC; 		-- Clock, enable signal
			input : in  STD_LOGIC; 			-- Input signal
			debounced : out  STD_LOGIC		-- Debounced signal
			); 
end debouncer;

architecture Behavioral of debouncer is
 signal delay1, delay2, delay3, delay4, edge1, edge2 : STD_LOGIC := '0'; 

begin 
process (clk, en) is 
begin 
	if rising_edge(clk)  then  
		if en = '1' then
		-- Delay the signal by 4 clock cycles
			delay1 <= input;
			delay2 <= delay1;
			delay3 <= delay2; 
			delay4 <= delay3;
		end if;
		edge1 <= delay1 and delay2 and delay3 and delay4;
		edge2 <= edge1;
 end if; 
end process; 
debounced <= edge1 and not edge2;

end Behavioral; 

