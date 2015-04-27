
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL3236B.VHD                          ***
--***                                             ***
--***   Function: 3 pipeline stage unsigned 32 or ***
--***             36 bit multiplier (behavioral)  ***
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

ENTITY hcc_mul3236b IS 
GENERIC (width : positive := 32);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		);
END hcc_mul3236b;

ARCHITECTURE rtl OF hcc_mul3236b IS

  signal aaff, bbff : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal mulff, muloutff : STD_LOGIC_VECTOR (2*width DOWNTO 1);

BEGIN
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO width LOOP
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 2*width LOOP
        mulff(k) <= '0';
        muloutff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aa; 
        bbff <= bb;
        mulff <= aaff * bbff;
        muloutff <= mulff;
         
      END IF;
    
    END IF;
  
  END PROCESS;
                                  
  cc <= muloutff; 
  
END rtl;

