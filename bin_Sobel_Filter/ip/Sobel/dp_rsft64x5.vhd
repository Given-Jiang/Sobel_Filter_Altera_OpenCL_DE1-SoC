
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_RSFT64X6.VHD                           ***
--***                                             ***
--***   Function: Double Precision Right Shift    ***
--***   (Combinatorial)                           ***
--***                                             ***
--***   18/02/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY dp_rsft64x5 IS 
PORT (
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);
      outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
    );
END dp_rsft64x5;

ARCHITECTURE rtl OF dp_rsft64x5 IS

  signal rightone, righttwo, rightthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
            
BEGIN

  gra: FOR k IN 1 TO 61 GENERATE
    rightone(k) <= (inbus(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                   (inbus(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                   (inbus(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                   (inbus(k+3) AND     shift(2)  AND     shift(1));
  END GENERATE;
  rightone(62) <= (inbus(62) AND NOT(shift(2)) AND NOT(shift(1))) OR
                  (inbus(63) AND NOT(shift(2)) AND     shift(1)) OR
                  (inbus(64) AND     shift(2)  AND NOT(shift(1))); 
  rightone(63) <= (inbus(63) AND NOT(shift(2)) AND NOT(shift(1))) OR
                  (inbus(64) AND NOT(shift(2)) AND     shift(1));
  rightone(64) <=  inbus(64) AND NOT(shift(2)) AND NOT(shift(1));
  
  grb: FOR k IN 1 TO 52 GENERATE
    righttwo(k) <= (rightone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                   (rightone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                   (rightone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                   (rightone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  grc: FOR k IN 53 TO 56 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(shift(4)) AND NOT(shift(3))) OR
                   (rightone(k+4) AND NOT(shift(4)) AND     shift(3)) OR
                   (rightone(k+8) AND     shift(4)  AND NOT(shift(3))); 
  END GENERATE; 
  grd: FOR k IN 57 TO 60 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(shift(4)) AND NOT(shift(3))) OR
                   (rightone(k+4) AND NOT(shift(4)) AND     shift(3));
  END GENERATE; 
  gre: FOR k IN 61 TO 64 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(shift(4)) AND NOT(shift(3)));
  END GENERATE;  
  
  grf: FOR k IN 1 TO 48 GENERATE
    rightthr(k) <= (righttwo(k)    AND NOT(shift(5))) OR 
                   (righttwo(k+16) AND shift(5));
  END GENERATE;
  grg: FOR k IN 49 TO 64 GENERATE
    rightthr(k) <= (righttwo(k)    AND NOT(shift(5)));
  END GENERATE;
  
  outbus <= rightthr;        
            
END rtl;

