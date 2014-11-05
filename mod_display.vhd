----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    20:05:45 11/05/2014 
-- Design Name: 
-- Module Name:    top_klok - Behavioral 
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

entity mod_display is
    Port ( clk : in  STD_LOGIC;
			  rst: in STD_LOGIC;
           num1 : in  STD_LOGIC_VECTOR (6 downto 0);
           num2 : in  STD_LOGIC_VECTOR (6 downto 0);
			  seg7 : out  STD_LOGIC_VECTOR (6 downto 0);
			  anode : out STD_LOGIC_VECTOR (3 downto 0)
	 );
end mod_display;

architecture Behavioral of mod_display is
	component bcd_conv is
		Port ( 
			number   : in  std_logic_vector (6 downto 0);
			tens     : out std_logic_vector (3 downto 0);
			ones     : out std_logic_vector (3 downto 0)
		);
	end component;
	component bcd_7seg is
		port (
			clk : in std_logic;
			bcd : in std_logic_vector(3 downto 0);  --BCD input
			segment7 : out std_logic_vector(6 downto 0)  -- 7 bit decoded output.
		);
	end component;
	component display_select is 
		port (
		   clk : IN  std_logic;
         rst : IN  std_logic;
         a : OUT  std_logic_vector(3 downto 0)
        );
	end component;
begin


end Behavioral;

