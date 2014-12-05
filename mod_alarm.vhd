----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:14:47 12/02/2014 
-- Design Name: 
-- Module Name:    mod_alarm - Behavioral 
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

entity mod_alarm is
    Port ( clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           hh : out  STD_LOGIC_VECTOR (6 downto 0);
           mm : out  STD_LOGIC_VECTOR (6 downto 0);
           incr_hh : in  STD_LOGIC;
           incr_mm : in  STD_LOGIC;
           down : in  STD_LOGIC);
end mod_alarm;

architecture Behavioral of mod_alarm is
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
begin
	MIN: counter
		generic map (max => 59, min => 0)
		port map (clk => clk, rst => rst, cten => incr_mm, down=> down, count => mm, carry => open);
	HRS: counter
		generic map (max => 23, min => 0)
		port map (clk => clk, rst => rst, cten => incr_hh, down=> down, count => hh, carry => open);

end Behavioral;

