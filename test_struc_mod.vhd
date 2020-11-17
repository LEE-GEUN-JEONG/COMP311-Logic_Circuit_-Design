----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:36:02 07/08/2019 
-- Design Name: 
-- Module Name:    test_struc_mod - Behavioral 
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

entity test_struc_mod is
	port(a,b,c : in std_logic;
			y : out std_logic);
end test_struc_mod;

architecture Behavioral of test_struc_mod is
	signal s : std_logic;
begin
	gate1 : entity work.test_xor_mod(Behavioral)
				port map(a=>a, b=>b, y=>s);
				
	gate2 : entity work.test_or_mod(Behavioral)
				port map(a=>s, b=>c, y=>y);


end Behavioral;

