
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOAT CONVERT - CORE LEVEL                **
--***                                             ***
--***   DP_LSFTPIPE64.VHD                         ***
--***                                             ***
--***   Function: Pipelined Left Shift 64 Bits    ***
--***                                             ***
--***   01/12/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY dp_lsftpipe64 IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);      
        
      outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)    
     );
END dp_lsftpipe64;

ARCHITECTURE rtl of dp_lsftpipe64 IS

  signal levzip, levone, levtwo, levtwoff, levthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (6 DOWNTO 5);
  
BEGIN

  levzip <= inbus;
  
  gla: FOR k IN 4 TO 64 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR 
                 (levzip(k-1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k-2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k-3) AND     shift(2)  AND     shift(1));
  END GENERATE;
  levone(3) <= (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR 
               (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
               (levzip(1) AND     shift(2)  AND NOT(shift(1)));
  levone(2) <= (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR 
               (levzip(1) AND NOT(shift(2)) AND     shift(1));                
  levone(1) <= (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
                               
  glba: FOR k IN 13 TO 64 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR 
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3));
  END GENERATE;  
  glbb: FOR k IN 9 TO 12 GENERATE            
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR 
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3)));             
  END GENERATE;
  glbc: FOR k IN 5 TO 8 GENERATE            
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR 
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3));           
  END GENERATE;  
  glbd: FOR k IN 1 TO 4 GENERATE            
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3)));          
  END GENERATE;    
  
  pp: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 64 LOOP
        levtwoff(k) <= '0';
      END LOOP;
      shiftff <= "00";
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        levtwoff <= levtwo;
        shiftff <= shift(6 DOWNTO 5);
        
      END IF;
  
    END IF;
    
  END PROCESS;
  
  glca: FOR k IN 49 TO 64 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR 
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)) OR
                 (levtwoff(k-32) AND     shiftff(6)  AND NOT(shiftff(5))) OR
                 (levtwoff(k-48) AND     shiftff(6)  AND     shiftff(5));
  END GENERATE;  
  glcb: FOR k IN 33 TO 48 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR 
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)) OR
                 (levtwoff(k-32) AND     shiftff(6)  AND NOT(shiftff(5)));
  END GENERATE; 
  glcc: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR 
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5));
  END GENERATE; 
  glcd: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5)));
  END GENERATE; 
      
  outbus <= levthr;
  
END rtl;

