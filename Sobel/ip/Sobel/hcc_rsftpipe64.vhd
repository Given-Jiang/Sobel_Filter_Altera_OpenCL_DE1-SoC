
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_RSFTPIPE64.VHD                        ***
--***                                             ***
--***   Function: Pipelined arithmetic right      ***
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

ENTITY hcc_rsftpipe64 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_rsftpipe64;

ARCHITECTURE rtl OF hcc_rsftpipe64 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal levtwoff : STD_LOGIC_VECTOR (64 DOWNTO 1);
    
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
 
  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      shiftff <= "00";
      FOR k IN 1 TO 64 LOOP
        levtwoff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        shiftff <= shift(6 DOWNTO 5);
        levtwoff <= levtwo;

      END IF;
  
    END IF;

  END PROCESS;
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(k+32) AND     shiftff(2)  AND NOT(shiftff(1))) OR
                 (levtwoff(k+48) AND     shiftff(2)  AND     shiftff(1));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(k+32) AND     shiftff(2)  AND NOT(shiftff(1))) OR
                 (levtwoff(64) AND     shiftff(2)  AND     shiftff(1));
  END GENERATE;
  gcc: FOR k IN 33 TO 48 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(k+16) AND NOT(shiftff(2)) AND     shiftff(1)) OR
                 (levtwoff(64)   AND     shiftff(2) );
  END GENERATE;
  gcd: FOR k IN 49 TO 63 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(2)) AND NOT(shiftff(1))) OR
                 (levtwoff(64)   AND    (shiftff(2)  OR      shiftff(1)));
  END GENERATE;
  levthr(64) <= levtwoff(64);
  
  outbus <= levthr;
  
END rtl;

