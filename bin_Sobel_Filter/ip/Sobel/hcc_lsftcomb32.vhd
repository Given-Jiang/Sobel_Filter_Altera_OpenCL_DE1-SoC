
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LSFTCOMB32.VHD                        ***
--***                                             ***
--***   Function: Combinatorial left shift, 32    ***
--***             bit number                      ***
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

ENTITY hcc_lsftcomb32 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_lsftcomb32;

ARCHITECTURE rtl OF hcc_lsftcomb32 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (32 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  levone(1) <=  (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
  levone(2) <=  (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(1) AND NOT(shift(2)) AND     shift(1));
  levone(3) <=  (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
                (levzip(1) AND     shift(2)  AND NOT(shift(1))); 
  gaa: FOR k IN 4 TO 32 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k-3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;

  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 4 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;
  gbb: FOR k IN 5 TO 8 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 9 TO 12 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3)));
  END GENERATE;
  gbd: FOR k IN 13 TO 32 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(5)));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(5))) OR
                 (levtwo(k-16) AND     shift(5));
  END GENERATE;

  outbus <= levthr;
  
END rtl;

