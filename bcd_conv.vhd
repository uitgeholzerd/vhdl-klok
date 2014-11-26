----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:03:52 10/28/2014 
-- Design Name: 
-- Module Name:    bcd_conv - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
 
entity bcd_conv is
   Port ( 
		rst	: in std_logic;
      number   : in  std_logic_vector (6 downto 0);
      tens     : out std_logic_vector (3 downto 0);
      ones     : out std_logic_vector (3 downto 0)
   );
end bcd_conv;
 
architecture Behavioral of bcd_conv is
	signal sig_tens, sig_ones: std_logic_vector (3 downto 0);
begin
 
   bin_to_bcd : process (rst, number)
      -- Internal variable for storing bits
      variable shift : unsigned(18 downto 0);
 
      -- Alias for parts of shift register
      alias num is shift(6 downto 0);
      alias one is shift(10 downto 7);
      alias ten is shift(14 downto 11);
      alias hun is shift(18 downto 15);
   begin
	
	if (rst = '1') then 
		tens <= X"0";
		ones <= X"0";
		
	--elsif (rising_edge(clk)) then 
	else
      -- Clear previous number and store new number in shift register
      num := unsigned(number);
      one := X"0";
      ten := X"0";
		hun := X"0";
 
      -- Loop eight times
      for i in 1 to num'Length loop
         -- Check if any digit is greater than or equal to 5
         if one >= 5 then
            one := one + 3;
         end if;
 
         if ten >= 5 then
            ten := ten + 3;
         end if;
			
          if hun >= 5 then
            hun := hun + 3;
         end if;
         -- Shift entire register left once
         shift := shift_left(shift, 1);
      end loop;
 
      -- Push decimal numbers to output
      --sig_tens    <= std_logic_vector(ten);
      --sig_ones     <= std_logic_vector(one);
		--if rising_edge(clk) then
      tens    <= std_logic_vector(ten);
      ones     <= std_logic_vector(one);
	--	end if;
	end if;
   end process;
	
--	output: process (clk)
--	begin
--		if rising_edge(clk) then
--			tens <= sig_tens;
--			ones <= sig_ones;
--		end if;
--	end process;
end Behavioral;