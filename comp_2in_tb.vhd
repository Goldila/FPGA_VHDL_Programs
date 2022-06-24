--Testbensh for 2 bit comparator 

library ieee; 
use ieee.std_logic_1164.all ;
--*********************** 
entity comp_2in_tb is 
end comp_2in_tb; 

--**********************
architecture tb_arch of comp_2in_tb is 
component comp_2in
port ( 
a: in std_logic_vector(1 downto 0); 
b: in std_logic_vector(1 downto 0); 
aeqb: out std_logic);
end component;
      signal test_in0, test_in1 : std_logic_vector (1 downto 0) ; 
      signal test_out : std_logic; 
begin 
-- instantiate the circuit under test 
porte:comp_2in
 port  map(
  a=>test_in0,
  b=>test_in1 , 
  aeqb=>test_out); 
--test vector generator 
process_simulation : process 
begin 
-- test vector I 
test_in0 <= "00"; 
test_in1 <= "00";
wait for 200 ns; 
--test vector 2 
test_in0 <= "01" ;
test_in1 <= "00" ;
wait for 200 ns; 
--test vector 3 
test_in0 <= "01"; 
test_in1 <= "11"; 
wait for 200 ns; 
--test vector 4 
test_in0 <= "10" ;
test_in1 <= "10"; 
wait for 200 ns; 
--test vector 5 
test_in0 <= "10" ;
test_in1 <= "00" ;
wait for 200 ns; 
--test vector 6 
test_in0 <= "11" ;
test_in1 <= "11" ;
wait for 200 ns; 
--test vector 7 
test_in0 <= "11"; 
test_in1 <= "01"; 
wait for 200 ns; 
end process; 
 end tb_arch; 