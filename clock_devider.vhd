----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:24:34 10/24/2014 
-- Design Name: 
-- Module Name:    clock_devider - Behavioral 
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

entity clock_devider is
	generic (max 	: 	positive  := 10);				-- Number by which the clock is divided
    Port ( clockIn : in  STD_LOGIC;
           clockEnable : in  STD_LOGIC;
           devidedClock : out  STD_LOGIC);
end clock_devider;

architecture Behavioral of clock_devider is

begin


end Behavioral;

