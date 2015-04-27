
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_RSFT56X20.VHD                          ***
--***                                             ***
--***   Function: 56 bit Unsigned Right Shift     ***
--***   (Maximum 20 bit Shift)                    ***
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

ENTITY fp_rsft56x20 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (56 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (56 DOWNTO 1)
	  );
END fp_rsft56x20;

ARCHITECTURE rtl OF fp_rsft56x20 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (56 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 53 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(54) <=  (levzip(54) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(55) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(56) AND     shift(2)  AND NOT(shift(1)));
  levone(55) <=  (levzip(55) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(56) AND NOT(shift(2)) AND     shift(1));
  levone(56) <= levzip(56)   AND NOT(shift(2)) AND NOT(shift(1));
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 44 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 45 TO 48 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbc: FOR k IN 49 TO 52 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbd: FOR k IN 53 TO 56 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  
  gca: FOR k IN 1 TO 40 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(5))) OR
                 (levtwo(k+16) AND     shift(5));
  END GENERATE;
  gcc: FOR k IN 41 TO 56 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(5)));
  END GENERATE;

  outbus <= levthr;
  
END rtl;

