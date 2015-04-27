
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL54USB.VHD                          ***
--***                                             ***
--***   Function: 6 pipeline stage unsigned 54    ***
--***             bit multiplier (behavioral)     ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   31/01/08 ML see below                     ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

-- 31/01/08 - output right shifted so same as synthesable core
-- (now "001X" >= 2, "0001X" < 2

ENTITY hcc_mul54usb IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
		);
END hcc_mul54usb;

ARCHITECTURE rtl OF hcc_mul54usb IS
  
  constant normtype : integer := 0;
  
  type muldelfftype IS ARRAY (4 DOWNTO 1) OF STD_LOGIC_VECTOR (72 DOWNTO 1);
  
  signal aaff, bbff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal mulff : STD_LOGIC_VECTOR (108 DOWNTO 1);
  signal muldelff : muldelfftype;
    
BEGIN
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 54 LOOP
        mulff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 108 LOOP
        mulff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 4 LOOP
        FOR j IN 1 TO 72 LOOP
          muldelff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aa; 
        bbff <= bb;
        mulff <= aaff * bbff;
        muldelff(1)(72 DOWNTO 1) <= mulff(108 DOWNTO 37);
        FOR k IN 2 TO 4 LOOP
          muldelff(k)(72 DOWNTO 1) <= muldelff(k-1)(72 DOWNTO 1);
        END LOOP;
         
      END IF;
    
    END IF;
  
  END PROCESS;
                                  
  cc <= muldelff(4)(72 DOWNTO 9); 
  
END rtl;

