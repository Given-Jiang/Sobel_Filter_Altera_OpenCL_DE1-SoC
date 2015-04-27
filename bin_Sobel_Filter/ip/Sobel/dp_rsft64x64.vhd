
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOAT CONVERT - CORE LEVEL                ***
--***                                             ***
--***   DP_RSFT64X64.VHD                          ***
--***                                             ***
--***   Function: Combinatorial Right Shift       ***
--***             (max 64.0 to 1.52)              ***
--***                                             ***
--***   07/12/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   29/07/09 - signed number problem fixed    ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY dp_rsft64x64 IS
PORT (
      inbus : IN STD_LOGIC_VECTOR (116 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);      
        
      outbus : OUT STD_LOGIC_VECTOR (116 DOWNTO 1)    
     );
END dp_rsft64x64;

ARCHITECTURE rtl of dp_rsft64x64 IS

  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (116 DOWNTO 1);
 
BEGIN
  
  levzip <= inbus;
  
  -- unsigned input
  
  gla: FOR k IN 1 TO 113 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR 
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1));
  END GENERATE;
  -- 29/07/65 always shift 116, else will fill with zeros
  -- fixed here and other lines
  levone(114) <= (levzip(114) AND NOT(shift(2)) AND NOT(shift(1))) OR 
                 (levzip(115) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(116) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(116) AND     shift(2)  AND     shift(1));
  levone(115) <= (levzip(115) AND NOT(shift(2)) AND NOT(shift(1))) OR 
                 (levzip(116) AND NOT(shift(2)) AND     shift(1)) OR 
                 (levzip(116) AND     shift(2)  AND NOT(shift(1))) OR 
                 (levzip(116) AND     shift(2)  AND     shift(1));                
  levone(116) <= levzip(116);
                               
  glba: FOR k IN 1 TO 104 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR 
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3));
  END GENERATE;  
  glbb: FOR k IN 105 TO 108 GENERATE            
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR 
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(116)  AND     shift(4)  AND     shift(3));             
  END GENERATE;
  glbc: FOR k IN 109 TO 112 GENERATE            
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR 
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(116)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(116)  AND     shift(4)  AND     shift(3));           
  END GENERATE;  
  glbd: FOR k IN 113 TO 116 GENERATE            
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
				 (levone(116)  AND (shift(4) OR shift(3)));
  END GENERATE;    

  glca: FOR k IN 1 TO 66 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR 
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k+32) AND     shift(6)  AND NOT(shift(5))) OR
                 (levtwo(k+48) AND     shift(6)  AND     shift(5));
  END GENERATE;  
  glcb: FOR k IN 67 TO 84 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR 
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(k+32) AND     shift(6)  AND NOT(shift(5))) OR
                 (levtwo(116)  AND     shift(6)  AND     shift(5));
  END GENERATE; 
  glcc: FOR k IN 85 TO 100 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR 
                 (levtwo(k+16) AND NOT(shift(6)) AND     shift(5)) OR
                 (levtwo(116)  AND     shift(6)  AND NOT(shift(5))) OR
                 (levtwo(116)  AND     shift(6)  AND     shift(5));
  END GENERATE; 
  glcd: FOR k IN 101 TO 116 GENERATE
    levthr(k) <= (levtwo(k)    AND NOT(shift(6)) AND NOT(shift(5))) OR
	             (levtwo(116)  AND (shift(6) OR shift(5)));
  END GENERATE; 
      
  outbus <= levthr;
  
END rtl;

