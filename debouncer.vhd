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
-- Description: Debounces a signal by requiring a signal to be held for 3 clocksignals before it is allow through
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
	Port(	clk, input : in  STD_LOGIC; 
			debounced : out  STD_LOGIC
			); 
end debouncer;

architecture Behavioral of debouncer is
 signal delay1, delay2, delay3, delay4, delay5, delay6, delay7, delay8, delay9, delay10, delay11, delay12  : STD_LOGIC := '0'; 

begin 
process (clk) is 
begin 
	if rising_edge(clk) then  
		delay1 <= input;
		delay2 <= delay1;
		delay3 <= delay2; 
		delay4 <= delay3; 
		delay5 <= delay4;
		delay6 <= delay5; 
		delay7 <= delay6; 
		delay8 <= delay7; 
		delay9 <= delay8;
		delay10 <= delay9; 
		delay11 <= delay10; 
		delay12 <= delay11; 
 end if; 
end process; 

debounced <= delay1 and delay2 and delay3 and delay4 and delay5 and delay6 and delay7 and delay8 and delay9 and delay10 and delay11 and not delay12;

end Behavioral; 

