
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

 --***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTPIPE36.VHD                        ***
--***                                             ***
--***   Function: Pipelined arithmetic right      ***
--***             shift for a 36 bit number       ***
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

ENTITY hcc_rsftpipe36 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	  );
END hcc_rsftpipe36;

ARCHITECTURE rtl OF hcc_rsftpipe36 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal levtwoff : STD_LOGIC_VECTOR (36 DOWNTO 1);
    
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
                 (levzip(36) AND     shift(2));
  levone(35) <=  (levzip(35) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(36) AND   ((shift(2)) OR     shift(1)));
  levone(36) <= levzip(36);
                              
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
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(36)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 29 TO 32 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(36)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 33 TO 35 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(36)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(36) <= levone(36);
 
  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= "00";
      FOR k IN 1 TO 36 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(6 DOWNTO 5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 4 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(k+32) AND     shiftff(2));
  END GENERATE;
  gcb: FOR k IN 5 TO 20 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(36)   AND     shiftff(2));
  END GENERATE;
  gcc: FOR k IN 21 TO 35 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(36)   AND    (shiftff(2)  OR      shiftff(1)));
  END GENERATE;
  levthr(36) <= levtwoff(36);
  
  outbus <= levthr;
  
END rtl;

