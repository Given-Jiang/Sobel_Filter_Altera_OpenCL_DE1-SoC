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
--***   FP_RSFT36.VHD                             ***
--***                                             ***
--***   Function: 36 bit Unsigned Right Shift     ***
--***                                             ***
--***   22/12/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_rsft36 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	  );
END fp_rsft36;

ARCHITECTURE rtl OF fp_rsft36 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (36 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 33 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(34) <=  (levzip(34) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(35) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(36) AND     shift(2)  AND NOT(shift(1)));
  levone(35) <=  (levzip(35) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(36) AND NOT(shift(2)) AND     shift(1));
  levone(36) <= levzip(36)   AND NOT(shift(2)) AND NOT(shift(1));
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 24 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 25 TO 28 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbc: FOR k IN 29 TO 32 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbd: FOR k IN 33 TO 36 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  
  gca: FOR k IN 1 TO 4 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k+32) AND     shift(6));
  END GENERATE;
  gcb: FOR k IN 5 TO 20 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5));
  END GENERATE;
  gcc: FOR k IN 21 TO 36 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5)));
  END GENERATE;

  outbus <= levthr;
  
END rtl;

