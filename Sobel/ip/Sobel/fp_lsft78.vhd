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
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_LSFT78.VHD                             ***
--***                                             ***
--***   Function: 78 bit Left Shift               ***
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

ENTITY fp_lsft78 IS
PORT (
      inbus : IN STD_LOGIC_VECTOR (78 DOWNTO 1); 
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1); 

      outbus : OUT STD_LOGIC_VECTOR (78 DOWNTO 1)
     );
END fp_lsft78;

ARCHITECTURE rtl of fp_lsft78 IS

  signal levzip, levone, levtwo : STD_LOGIC_VECTOR (78 DOWNTO 1);
  signal levthr, levfor, levfiv : STD_LOGIC_VECTOR (78 DOWNTO 1);
  signal levsix : STD_LOGIC_VECTOR (78 DOWNTO 1);
  
BEGIN

  levzip <= inbus;
  
  levone(1) <= levzip(1) AND NOT(shift(1));
  gaa: FOR k IN 2 TO 78 GENERATE
    levone(k) <= (levzip(k) AND NOT(shift(1))) OR (levzip(k-1) AND shift(1));
  END GENERATE;
  
  levtwo(1) <= levone(1) AND NOT(shift(2));
  levtwo(2) <= levone(2) AND NOT(shift(2));
  gba: FOR k IN 3 TO 78 GENERATE
    levtwo(k) <= (levone(k) AND NOT(shift(2))) OR (levone(k-2) AND shift(2));
  END GENERATE;
  
  gca: FOR k IN 1 TO 4 GENERATE
    levthr(k) <= levtwo(k) AND NOT(shift(3));
  END GENERATE;
  gcb: FOR k IN 5 TO 78 GENERATE
    levthr(k) <= (levtwo(k) AND NOT(shift(3))) OR (levtwo(k-4) AND shift(3));
  END GENERATE;
  
  gda: FOR k IN 1 TO 8 GENERATE
    levfor(k) <= levthr(k) AND NOT(shift(4));
  END GENERATE;
  gdb: FOR k IN 9 TO 78 GENERATE
    levfor(k) <= (levthr(k) AND NOT(shift(4))) OR (levthr(k-8) AND shift(4));
  END GENERATE;
  
  gea: FOR k IN 1 TO 16 GENERATE
    levfiv(k) <= levfor(k) AND NOT(shift(5));
  END GENERATE;
  geb: FOR k IN 17 TO 78 GENERATE
    levfiv(k) <= (levfor(k) AND NOT(shift(5))) OR (levfor(k-16) AND shift(5));
  END GENERATE;
  
  gfa: FOR k IN 1 TO 32 GENERATE
    levsix(k) <= levfiv(k) AND NOT(shift(6));
  END GENERATE;
  gfb: FOR k IN 33 TO 78 GENERATE
    levsix(k) <= (levfiv(k) AND NOT(shift(6))) OR (levfiv(k-32) AND shift(6));
  END GENERATE;
  
  outbus <= levsix;
  
END;

