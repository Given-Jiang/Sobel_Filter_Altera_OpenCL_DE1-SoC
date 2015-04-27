
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
--***   FP_RSFT32X5.VHD                           ***
--***                                             ***
--***   Function: Single Precision Right Shift    ***
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

ENTITY fp_rsft32x5 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);
      outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
    );
END fp_rsft32x5;

ARCHITECTURE rtl OF fp_rsft32x5 IS

  signal rightone, righttwo, rightthr : STD_LOGIC_VECTOR (32 DOWNTO 1);
            
BEGIN

  gra: FOR k IN 1 TO 29 GENERATE
    rightone(k) <= (inbus(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                   (inbus(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                   (inbus(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                   (inbus(k+3) AND     shift(2)  AND     shift(1));
  END GENERATE;
  rightone(30) <= (inbus(30) AND NOT(shift(2)) AND NOT(shift(1))) OR
                  (inbus(31) AND NOT(shift(2)) AND     shift(1)) OR
                  (inbus(32) AND     shift(2)  AND NOT(shift(1))); 
  rightone(31) <= (inbus(31) AND NOT(shift(2)) AND NOT(shift(1))) OR
                  (inbus(32) AND NOT(shift(2)) AND     shift(1));
  rightone(32) <=  inbus(32) AND NOT(shift(2)) AND NOT(shift(1));
  
  grb: FOR k IN 1 TO 20 GENERATE
    righttwo(k) <= (rightone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                   (rightone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                   (rightone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                   (rightone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  grc: FOR k IN 21 TO 24 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(shift(4)) AND NOT(shift(3))) OR
                   (rightone(k+4) AND NOT(shift(4)) AND     shift(3)) OR
                   (rightone(k+8) AND     shift(4)  AND NOT(shift(3))); 
  END GENERATE; 
  grd: FOR k IN 25 TO 28 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(shift(4)) AND NOT(shift(3))) OR
                   (rightone(k+4) AND NOT(shift(4)) AND     shift(3));
  END GENERATE; 
  gre: FOR k IN 29 TO 32 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;  
  
  grf: FOR k IN 1 TO 16 GENERATE
    rightthr(k) <= (righttwo(k)    AND NOT(shift(5))) OR 
                   (righttwo(k+16) AND shift(5));
  END GENERATE;
  grg: FOR k IN 17 TO 32 GENERATE
    rightthr(k) <= (righttwo(k)    AND NOT(shift(5)));
  END GENERATE;
  
  outbus <= rightthr;        
            
END rtl;

