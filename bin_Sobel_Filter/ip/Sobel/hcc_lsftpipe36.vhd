
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_LSFTPIPE36.VHD                        ***
--***                                             ***
--***   Function: 1 pipeline stage left shift, 36 ***
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

ENTITY hcc_lsftpipe36 IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	   outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	  );
END hcc_lsftpipe36;

ARCHITECTURE rtl OF hcc_lsftpipe36 IS
  
  signal levzip, levone, levtwo, levthr : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal shiftff : STD_LOGIC_VECTOR (6 DOWNTO 5);
  signal levtwoff : STD_LOGIC_VECTOR (36 DOWNTO 1);
    
BEGIN
        
  levzip <= inbus;
  
  -- shift by 0,1,2,3
  levone(1) <=  (levzip(1) AND NOT(shift(2)) AND NOT(shift(1)));
  levone(2) <=  (levzip(2) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(1) AND NOT(shift(2)) AND     shift(1));
  levone(3) <=  (levzip(3) AND NOT(shift(2)) AND NOT(shift(1))) OR
                (levzip(2) AND NOT(shift(2)) AND     shift(1)) OR
                (levzip(1) AND     shift(2)  AND NOT(shift(1))); 
  gaa: FOR k IN 4 TO 36 GENERATE
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
  gbd: FOR k IN 13 TO 36 GENERATE
    levtwo(k) <= (levone(k)    AND NOT(shift(4)) AND NOT(shift(3))) OR
                 (levone(k-4)  AND NOT(shift(4)) AND     shift(3)) OR
                 (levone(k-8)  AND     shift(4)  AND NOT(shift(3))) OR
                 (levone(k-12) AND     shift(4)  AND     shift(3)); 
  END GENERATE;

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
  
  gca: FOR k IN 1 TO 16 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5)));
  END GENERATE;
  gcb: FOR k IN 17 TO 32 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5));
  END GENERATE;
  gcc: FOR k IN 33 TO 36 GENERATE
    levthr(k) <= (levtwoff(k)    AND NOT(shiftff(6)) AND NOT(shiftff(5))) OR
                 (levtwoff(k-16) AND NOT(shiftff(6)) AND     shiftff(5)) OR
                 (levtwoff(k-32) AND     shiftff(6)  AND NOT(shiftff(5)));
  END GENERATE;
  
  outbus <= levthr;
  
END rtl;

