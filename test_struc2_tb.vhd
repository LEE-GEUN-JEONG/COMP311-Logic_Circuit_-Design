----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    02:09:55 07/08/2019 
-- Design Name: 
-- Module Name:    test_struc2_tb - Behavioral 
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

entity test_struc2_tb is
end test_struc2_tb;

architecture Behavioral of test_struc2_tb is
signal a,b,c : std_logic;
signal y : std_logic;
begin
	main1 : entity work.test_struc2_mod (Behavioral)
		port map( a=>a, b=>b, c=>c, y=>y);

	a <='1';
	b <='0';
	c <='0';
end Behavioral;

