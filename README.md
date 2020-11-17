# COMP311 / 논리회로설계 / 2019년도 / 여름학기 / 김찬용
## 가상 리눅스 머신을 이용하여 xilinx사의 VHDL을 사용하였다. VHDL 코딩을 통하여 HW를 설계하였다.
## 본 수업을 수강하며 정리한 VHDL HW 설계 자료와 소스코드, 그리고 Term Project 자료를 정리하였다.

### 1. ALU 설계 term project
#### 1) 설계 보고서

![image](https://user-images.githubusercontent.com/58419421/99385358-37f7bf00-2914-11eb-97fe-f01fe38d012b.png)
![image](https://user-images.githubusercontent.com/58419421/99385393-43e38100-2914-11eb-93e3-34dd58965c05.png)
![image](https://user-images.githubusercontent.com/58419421/99385401-4940cb80-2914-11eb-8dde-a23a983a43b5.png)
![image](https://user-images.githubusercontent.com/58419421/99385409-4d6ce900-2914-11eb-8f47-7639a4a5f57b.png)
![image](https://user-images.githubusercontent.com/58419421/99385418-51007000-2914-11eb-9918-18c9151dec78.png)
![image](https://user-images.githubusercontent.com/58419421/99385424-53fb6080-2914-11eb-84a4-92c6993a9dff.png)
![image](https://user-images.githubusercontent.com/58419421/99385454-5eb5f580-2914-11eb-87b0-54a62b93c621.png)
![image](https://user-images.githubusercontent.com/58419421/99385464-637aa980-2914-11eb-9f37-a0be2770430e.png)
![image](https://user-images.githubusercontent.com/58419421/99385476-67a6c700-2914-11eb-9e96-be098a71a7e1.png)
![image](https://user-images.githubusercontent.com/58419421/99385490-6bd2e480-2914-11eb-8880-a37eb70efea7.png)
![image](https://user-images.githubusercontent.com/58419421/99385507-6ecdd500-2914-11eb-8f68-423f15594830.png)
![image](https://user-images.githubusercontent.com/58419421/99385520-72615c00-2914-11eb-8a07-4fd15499cf36.png)
![image](https://user-images.githubusercontent.com/58419421/99385533-768d7980-2914-11eb-8795-76581624f735.png)
![image](https://user-images.githubusercontent.com/58419421/99385548-7a210080-2914-11eb-849b-b1b87961ede9.png)

#### 2) 소스코드
	     Z(0) := '0';
      end loop;
    return Z;
 end;
------------------------------------------------------------------------------------------------------ function1 Shift_Left
 function Shift_Right( A : std_logic_vector(7 downto 0)) return std_logic_vector is
  variable Z : std_logic_vector(7 downto 0);
   begin
      for k in 0 to 6 loop
        Z(k) := A(k+1);
	     Z(7) := '0';
	   end loop;
    return Z;
 end;
------------------------------------------------------------------------------------------------------ function2 Shift_Right
begin
 process(A,B,SEL)
  variable Arithmetic_Unit, Logic_Unit, Shift_Unit : std_logic_vector(7 downto 0);
 begin
     Compute : case sel(1 downto 0) is
	                 when "00"   => Arithmetic_Unit :=  A;    Logic_Unit := (A and B); Shift_Unit := A;  
	                 when "01"   => Arithmetic_Unit := (A+1); Logic_Unit := (A or B);  Shift_Unit := Shift_Left(A);  
	                 when "10"   => Arithmetic_Unit := (A+B); Logic_Unit := (A xor B); Shift_Unit := Shift_Right(A); 
	                 when others => Arithmetic_Unit := (A-1); Logic_Unit := (not A);   Shift_Unit := (others => '0');
	            end case Compute;
------------------------------------------------------------------------------------------------------ Computing Mode Select	  
	  Mode : if(sel(3 downto 2) = "00")    then Y <= Arithmetic_Unit;
	         elsif(sel(3 downto 2) = "01") then Y <= Logic_Unit;
				elsif(sel(3 downto 2) = "10") then Y <= Shift_Unit;
				else NULL; 
				end if Mode;
------------------------------------------------------------------------------------------------------ Unit Mode Select				
 end process;
end Behavioral;

### 2. VHDL Hardware 설계자료
#### 파일 첨부 하였음.

### 3. hw 설계 소스코드
<test_fulladder_mod>
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_fulladder_mod is
   port(a,b,cin : in std_logic;
	     sum,cout : out std_logic);
end test_fulladder_mod;

architecture Behavioral of test_fulladder_mod is
 signal s : std_logic_vector(1 to 6);
begin
   s(1) <= a xor b;
	s(2) <= cin; -- buffer
	sum <= s(1) xor s(2);
	s(3) <= a and b;
	s(4) <= b and cin;
	s(5) <= s(3) or s(4);
	s(6) <= cin and a;
	cout <= s(5) or s(6);
end Behavioral;

<test_signal_mod>
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_signal_mod is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           y : out  STD_LOGIC);
end test_signal_mod;
architecture Behavioral of test_signal_mod is
  signal s1,s2 : std_logic;
begin
   y <= s1 or s2; -- no series
   s1 <= a nand b;
	s2 <= a xor b;
end Behavioral;

<test_pro_mod>
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_pro_mod is
   port( a,b,c : in std_logic;
	 sum : out std_logic);
end test_pro_mod;

architecture Behavioral of test_pro_mod is
begin
   process(a,b,c)
	 variable v1 : std_logic;
	   begin
		  v1 := a xor b;
		  sum <= v1 xor c;
		end process;
	--	sum <= v1 xor c; (X)
end Behavioral;

<test_ex1_mod>
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_ex1_mod is
   port( a,b : in std_logic;
           y : out std_logic);	
end test_ex1_mod;

architecture Behavioral of test_ex1_mod is
begin
   process(a,b)
	 variable v1,v2 : std_logic;
	  begin
v1 := a nand b; -- 순서를 지켜야 함.
v2 := a and b; -- variable은 순차문에 지배 받음.
y <= v1 or v2;
	  end process;
end Behavioral;

<test_if_mod>
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_if_mod is
    port (a,b,sel : in std_logic;
       y : out std_logic);
end test_if_mod;

architecture Behavioral of test_if_mod is
begin
   process (a,b,sel)
	  begin
	     y <= b;
		  if(sel='1') then
		  y <= a;
	end if;
	end process;    
end Behavioral;	

<test_ex1_mod>
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_ex1_mod is
 port (a,b,sel : in std_logic;
       y : out std_logic);
end test_ex1_mod;

architecture Behavioral of test_ex1_mod is
   signal s1,s2 : std_logic;
begin
   s1 <= a xor b;
	s2 <= a nand b;
   process (s1,s2,sel)
	variable v1 : std_logic;
	begin	
		if (sel = '1') then
		v1:= s1;
		else
		v1 := s2;
		end if;
		y <= s2 or v1;	
	end process;
end Behavioral;

<test_elsif2_mod>
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity test_elsif_2_mod is
   port (a,b: in std_logic;
	      sel: in std_logic_vector(1 to 3);
			y  : out std_logic);
end test_elsif_2_mod;

architecture Behavioral of test_elsif_2_mod is
begin
  process(a,b,sel)
  begin
     if (sel(2) = '0') then  
       if (sel(3) = '0') then
         y <= a xor b;
        else y <= a nand b;
       end if;	 
     elsif (sel(1) = '1') then
      y <= a and b;	
     else y <= a or b;
	  end if;
  end process;
end Behavioral;
