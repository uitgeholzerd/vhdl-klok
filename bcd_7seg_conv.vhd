library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity bcd_7seg_conv is
port (
        bcd : in std_logic_vector(3 downto 0);  		-- BCD input
        segment7 : out std_logic_vector(6 downto 0)  	-- 7 bit decoded output.
    );
end bcd_7seg_conv;

architecture Behavioral of bcd_7seg_conv is
begin
	process (bcd)
	BEGIN
			case  bcd is
				when "0000"=> segment7 <="1000000";  -- '0'
				when "0001"=> segment7 <="1111001";  -- '1'
				when "0010"=> segment7 <="0100100";  -- '2'
				when "0011"=> segment7 <="0110000";  -- '3'
				when "0100"=> segment7 <="0011001";  -- '4' 
				when "0101"=> segment7 <="0010010";  -- '5'
				when "0110"=> segment7 <="0000010";  -- '6'
				when "0111"=> segment7 <="1111000";  -- '7'
				when "1000"=> segment7 <="0000000";  -- '8'
				when "1001"=> segment7 <="0010000";  -- '9'
				 --nothing is displayed when a number more than 9 is given as input. 
				when others=> segment7 <="1111111"; 
			end case;
	end process;

end Behavioral;