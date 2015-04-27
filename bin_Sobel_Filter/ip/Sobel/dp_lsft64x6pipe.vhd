
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_LSFT64X6PIPE.VHD                       ***
--***                                             ***
--***   Function: Double Precision Left Shift     ***
--***   (Pipelined)                               ***
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

ENTITY dp_lsft64x6pipe IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
      outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
    );
END dp_lsft64x6pipe;

ARCHITECTURE rtl OF dp_lsft64x6pipe IS

  signal leftone, lefttwo, leftthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal lefttwoff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (6 DOWNTO 5);
            
BEGIN
  
  leftone(1) <=  inbus(1)     AND NOT(shift(2)) AND NOT(shift(1));
  leftone(2) <= (inbus(2)     AND NOT(shift(2)) AND NOT(shift(1))) OR
                (inbus(1)     AND NOT(shift(2)) AND     shift(1)); 
  leftone(3) <= (inbus(3)     AND NOT(shift(2)) AND NOT(shift(1))) OR
                (inbus(2)     AND NOT(shift(2)) AND     shift(1)) OR
                (inbus(1)     AND     shift(2)  AND NOT(shift(1))); 
  gla: FOR k IN 4 TO 64 GENERATE
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
  gle: FOR k IN 13 TO 64 GENERATE
    lefttwo(k) <= (leftone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                  (leftone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                  (leftone(k-8)  AND     shift(4)  AND NOT(shift(3)))  OR
                  (leftone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  
  ppa: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 64 LOOP
        lefttwoff(k) <= '0';
      END LOOP;
      shiftff <= "00";
      
    ELSIF (rising_edge(sysclk)) THEN
    
      lefttwoff <= lefttwo;
      shiftff <= shift(6 DOWNTO 5);
              
    END IF;
      
  END PROCESS;
  
  glf: FOR k IN 1 TO 16 GENERATE
    leftthr(k) <=  lefttwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5));
  END GENERATE;
  glg: FOR k IN 17 TO 32 GENERATE
    leftthr(k) <= (lefttwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                  (lefttwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)); 
  END GENERATE;
  glh: FOR k IN 33 TO 48 GENERATE
    leftthr(k) <= (lefttwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                  (lefttwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)) OR
                  (lefttwoff(k-32) AND     shiftff(6)  AND NOT(shiftff(5))); 
  END GENERATE;
  gli: FOR k IN 49 TO 64 GENERATE
    leftthr(k) <= (lefttwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                  (lefttwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)) OR
                  (lefttwoff(k-32) AND     shiftff(6)  AND NOT(shiftff(5)))  OR
                  (lefttwoff(k-48) AND     shiftff(6)  AND     shiftff(5)); 
  END GENERATE;
    
  outbus <= leftthr;        
            
END rtl;

