
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTCOMB64.VHD                        ***
--***                                             ***
--***   Function: Combinatorial arithmetic right  ***
--***             shift for a 64 bit number       ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_rsftcomb64 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_rsftcomb64;

ARCHITECTURE rtl OF hcc_rsftcomb64 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 61 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(62) <=  (levzip(62) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(63) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(64) AND     shift(2));
  levone(63) <=  (levzip(63) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(64) AND   ((shift(2)) OR     shift(1)));
  levone(64) <= levzip(64);
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 52 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 53 TO 56 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(64)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 57 TO 60 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(64)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 61 TO 63 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(64)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(64) <= levone(64);
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k+32) AND     shift(6)  AND NOT(shift(5))) OR
                 (levtwo(k+48) AND     shift(6)  AND     shift(5));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k+32) AND     shift(6)  AND NOT(shift(5))) OR
                 (levtwo(64) AND       shift(6)  AND     shift(5));
  END GENERATE;
  gcc: FOR k IN 33 TO 48 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(64)   AND     shift(6) );
  END GENERATE;
  gcd: FOR k IN 49 TO 63 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
                 (levtwo(64)   AND    (shift(6)  OR      shift(5)));
  END GENERATE;
  levthr(64) <= levtwo(64);
  
  outbus <= levthr;
  
END rtl;

