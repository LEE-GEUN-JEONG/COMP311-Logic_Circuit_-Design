----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:11:27 07/08/2019 
-- Design Name: 
-- Module Name:    test_ex1_mod - Behavioral 
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

entity test_ex1_mod is
	port(a,b,c : in std_logic;
			y : out std_logic);
end test_ex1_mod;

architecture Behavioral of test_ex1_mod is
	signal w,x : std_logic;
	
begin
	pro1 : process(a,b)
		begin
		w <= a or b;
	end process pro1;
	
	pro2 : process(b,c)
		begin
		x <= b nand c;
	end process pro2;

	pro3 : process(w,x)
		begin
		y <= w xor x;
	end process pro3;

end Behavioral;

