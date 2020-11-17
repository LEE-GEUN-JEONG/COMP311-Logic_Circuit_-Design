----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:05:07 07/08/2019 
-- Design Name: 
-- Module Name:    test_struc_tb - Behavioral 
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

entity test_struc_tb is
end test_struc_tb;

architecture Behavioral of test_struc_tb is
	signal a,b,c : std_logic;
	signal y : std_logic;
begin
	entity work.test_struc_mod (Behavioral)
			port map (a=>a, b=>b, c=>c, y=>y);
	
	a <='1';
	b <='0';
	c <='1';

end Behavioral;

