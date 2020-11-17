----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:44:37 07/08/2019 
-- Design Name: 
-- Module Name:    test_ex3_mod - Behavioral 
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

entity test_ex3_mod is
	port(a, b : in std_logic;
			sel : in std_logic_vector (1 downto 0);
			y	: out std_logic);
end test_ex3_mod;

architecture Behavioral of test_ex3_mod is

begin
		y <= a and b when sel = "00" else
			  a or b when sel = "01" else
			  a xor b when sel = "10" else
			  a nand b;

end Behavioral;

