-- Project data
-------------------------------------------------------------------------------------------------------------------------------------
-- Title         : 1- GATE-LEVEL implementation COMBINATIONAL CIRCUIT
-- Project       :  1-2 Gate-level implementation of a 2-bits comparator
-------------------------------------------------------------------------------------------------------------------------------------
-- File          : twobitscomparator.vhd
-- Author        : KHLIFI Fadila (khlifi.ing@gmail.com)
--------------------------------------------------------------------------------------------------------------------------------------
-- Description   : This package contains a set of 2 bits comparator 

-- Truth table of 2-bits  equality comparator (when a=b)
--------------------------------------------------------------------------------------------------------------------------------------
--    input                     output 
-- a1  a0   b1  b0        a>b   a=b   a<b
--------------------------------------------------------------------------------------------------------------------------------------
-- 0    0   0    0         0     1     0
-- 0    0   0    1         0     0     1
-- 0    0   1    0         0     0     1
-- 0    0   1    1         0     0     1
-- 0    1   0    0         1     0     0
-- 0    1   0    1         0     1     0
-- 0    1   1    0         0     0     1
-- 0    1   1    1         0     0     1
-- 1    0   0    0         1     0     0
-- 1    0   0    1         1     0     0
-- 1    0   1    0         0     1     0
-- 1    0   1    1         0     0     1
-- 1    1   0    0         1     0     0
-- 1    1   0    1         1     0     0
-- 1    1   1    0         1     0     0
-- 1    1   1    1         0     1     0

-- Equation : aeqb = (a1 and a0 and b1 and b0)' or (a1'and a0 and b1' and a0) or (a1 and a0'and b1 and b0') or (a1 and a0 and b1 and b0)
--                  
--            aeqb =          p0                or           p1               or            p2             or           p3

-- Revisions  :---------------------------------------------------------------------------------------------------------------------------
-- Date       :  6/23/2022 - creation
------------------------------------------------------------------------------------------------------------------------------------------
library ieee;
library ieee; 
use ieee. std_logic_1164.all ; 

entity comp_2in is 

   port ( 
          a,b : in std_logic_vector(1 downto 0);

         aeqb: out std_logic 
        ); 
end comp_2in; 

architecture arch of comp_2in is 
  signal pO,pl,p2,p3: std_logic; 
  begin 
  -- product terms 
     PO <= ((not a(1)) and (not b(1))) and ((not a(0)) and (not b(0))); 
     pl <= ((not a(1)) and (not b(1))) and (a(0) and b(0)); 
     p2 <= (a(1) and b(1)) and ((not a(0)) and (not b(0))); 
     p3 <= (a(1) and b(1)) and (a(0) and b(0)); 
 
  -- sum of product terms 
     aeqb <= PO or pl or p2 or p3;
end arch; 