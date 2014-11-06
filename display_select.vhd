----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:46:19 11/05/2014 
-- Design Name: 
-- Module Name:    display_select - Behavioral 
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

entity display_select is
Port ( 
		  clk : in STD_LOGIC;
		  rst : in std_logic;
        a : out STD_LOGIC_VECTOR (3 downto 0)
		  );
end display_select;

architecture Behavioral of display_select is
	signal anod:std_logic_vector(3 downto 0);
	  begin
		  process(clk)
				variable cnt:integer;
		  begin
				if(rising_edge(clk)) then
					if(rst='1') then
						anod<="1111";
						cnt:=0;
					else
						if(cnt=4) then 
							cnt:=0;
						end if;
						anod<="1111";
						anod(cnt)<='0';
						cnt:=cnt+1;
					end if;
				end if;
		  end process;
		  a<=anod;
end Behavioral;

