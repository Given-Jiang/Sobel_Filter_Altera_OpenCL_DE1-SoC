
-- (C) 1992-2014 Altera Corporation. All rights reserved.                         
-- Your use of Altera Corporation's design tools, logic functions and other       
-- software and tools, and its AMPP partner logic functions, and any output       
-- files any of the foregoing (including device programming or simulation         
-- files), and any associated documentation or information are expressly subject  
-- to the terms and conditions of the Altera Program License Subscription         
-- Agreement, Altera MegaCore Function License Agreement, or other applicable     
-- license agreement, including, without limitation, that your use is for the     
-- sole purpose of programming logic devices manufactured by Altera and sold by   
-- Altera or its authorized distributors.  Please refer to the applicable         
-- agreement for further details.                                                 
    



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_LSFT32X5.VHD                           ***
--***                                             ***
--***   Function: Single Precision Left Shift     ***
--***                                             ***
--***   22/02/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_lsft32x5 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);
      outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
    );
END fp_lsft32x5;

ARCHITECTURE rtl OF fp_lsft32x5 IS

  signal leftone, lefttwo, leftthr : STD_LOGIC_VECTOR (32 DOWNTO 1);
            
BEGIN
  
  leftone(1) <=  inbus(1)     AND NOT(shift(2)) AND NOT(shift(1));
  leftone(2) <= (inbus(2)     AND NOT(shift(2)) AND NOT(shift(1))) OR
                (inbus(1)     AND NOT(shift(2)) AND     shift(1)); 
  leftone(3) <= (inbus(3)     AND NOT(shift(2)) AND NOT(shift(1))) OR
                (inbus(2)     AND NOT(shift(2)) AND     shift(1)) OR
                (inbus(1)     AND     shift(2)  AND NOT(shift(1))); 
  gla: FOR k IN 4 TO 32 GENERATE
    leftone(k) <= (inbus(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                  (inbus(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                  (inbus(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                  (inbus(k-3) AND     shift(2)  AND     shift(1));
  END GENERATE;
             
  glb: FOR k IN 1 TO 4 GENERATE
    lefttwo(k) <=  leftone(k)    AND NOT(shift(4)) AND NOT(shift(3));
  END GENERATE;
  glc: FOR k IN 5 TO 8 GENERATE
    lefttwo(k) <= (leftone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                  (leftone(k-4)  AND NOT(shift(4)) AND     shift(3)); 
  END GENERATE;
  gld: FOR k IN 9 TO 12 GENERATE
    lefttwo(k) <= (leftone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                  (leftone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                  (leftone(k-8)  AND     shift(4)  AND NOT(shift(3))); 
  END GENERATE;
  gle: FOR k IN 13 TO 32 GENERATE
    lefttwo(k) <= (leftone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                  (leftone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                  (leftone(k-8)  AND     shift(4)  AND NOT(shift(3)))  OR
                  (leftone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  
  glf: FOR k IN 1 TO 16 GENERATE
    leftthr(k) <=  lefttwo(k)    AND NOT(shift(5));
  END GENERATE;
  glg: FOR k IN 17 TO 32 GENERATE
    leftthr(k) <= (lefttwo(k)    AND NOT(shift(5))) OR
                  (lefttwo(k-16) AND     shift(5)); 
  END GENERATE;
    
  outbus <= leftthr;        
            
END rtl;

