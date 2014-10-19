----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:53 10/17/2014 
-- Design Name: 
-- Module Name:    poorten - vergelijkingen 
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

entity poorten is
    Port ( inA : in  STD_LOGIC;
           inB : in  STD_LOGIC;
           outAND : out STD_LOGIC;
           outOR : out STD_LOGIC;
           outNOT : out STD_LOGIC;
           outNAND : out  STD_LOGIC;
           outNOR : out STD_LOGIC);
end poorten;

architecture vergelijkingen of poorten is

begin
	outAND <= inA and inB;
	outOR <= inA or inB;
	outNOT <= not inA;
	outNAND <= not (inA and inB);
	outNOR <= not (inA or inB);
	
end vergelijkingen;

