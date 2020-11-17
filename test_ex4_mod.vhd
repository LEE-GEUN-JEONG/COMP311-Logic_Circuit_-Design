----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:57:34 07/08/2019 
-- Design Name: 
-- Module Name:    test_ex4_mod - Behavioral 
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

entity test_ex4_mod is
	port(a, b : in std_logic;
			sel : in std_logic_vector (1 downto 0);
			y	: out std_logic);
end test_ex4_mod;

architecture Behavioral of test_ex4_mod is
	begin
	with sel select
	y <= a and b when "00",
			a or b when "01",
			a xor b when "10",
			a nand b when others;


end Behavioral;

