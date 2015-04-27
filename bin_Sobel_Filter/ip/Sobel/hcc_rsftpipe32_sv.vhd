
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTPIPE32.VHD                        ***
--***                                             ***
--***   Function: Pipelined arithmetic right      ***
--***             shift for a 32 bit number       ***
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

ENTITY hcc_rsftpipe32 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_rsftpipe32;

ARCHITECTURE rtl OF hcc_rsftpipe32 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal shiftff : STD_LOGIC;
  signal levtwoff : STD_LOGIC_VECTOR (32 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  gaa: FOR k IN 1 TO 29 GENERATE
    levone(k) <= (levzip(k)   AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(k+1) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(k+2) AND     shift(2)  AND NOT(shift(1))) OR
                 (levzip(k+3) AND     shift(2)  AND     shift(1)); 
  END GENERATE;
  levone(30) <=  (levzip(30) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(31) AND NOT(shift(2)) AND     shift(1)) OR
                 (levzip(32) AND     shift(2));
  levone(31) <=  (levzip(31) AND NOT(shift(2)) AND NOT(shift(1))) OR
                 (levzip(32) AND   ((shift(2)) OR     shift(1)));
  levone(32) <= levzip(32);
                              
  -- shift by 0,4,8,12
  gba: FOR k IN 1 TO 20 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k+12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;
  gbb: FOR k IN 21 TO 24 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k+8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(32)   AND     shift(4)  AND     shift(3));
  END GENERATE;
  gbc: FOR k IN 25 TO 28 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k+4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(32)   AND     shift(4));
  END GENERATE;
  gbd: FOR k IN 29 TO 31 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(32)   AND    (shift(4) OR shift(3)));
  END GENERATE;
  levtwo(32) <= levone(32);
 
  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= '0';
      FOR k IN 1 TO 32 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff)) OR
                 (levtwoff(k+16) AND     shiftff);
  END GENERATE;
  gcb: FOR k IN 17 TO 31 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff)) OR
                 (levtwoff(32)   AND     shiftff);
  END GENERATE;
  levthr(32) <= levtwoff(32);
  
  outbus <= levthr;
  
END rtl;

