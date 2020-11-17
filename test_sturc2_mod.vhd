----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:51:51 07/08/2019 
-- Design Name: 
-- Module Name:    test_sturc2_mod - Behavioral 
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

entity test_sturc2_mod is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           y : out  STD_LOGIC);
end test_sturc2_mod;

architecture Behavioral of test_sturc2_mod is
	signal s1, s2, s3 : std_logic;
begin
	gate1 : entity work.test_nand_mod (Behavioral)
		port map (a=>a, b=>s1, y=>s1);
	
	gate2 : entity work.test_and_mod (Behavioral)
		port map (a=>s1, b=>b, y=>s2);
		
	gate3 : entity work.test_or_mod (Behavioral)
		port map (a=>s2, b=>c, y=>s3);
		
	gate4 : entity work.test_xor_mod (Behavioral)
		port map (a=>s1, b=>s3, y=>y);

end Behavioral;

