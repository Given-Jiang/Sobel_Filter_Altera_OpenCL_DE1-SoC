
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MUL2727S.VHD                          ***
--***                                             ***
--***   Function: 2 pipeline stage signed 27 bit  ***
--***             SV(behavioral/synthesizable)    ***
--***                                             ***
--***   30/10/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_mul2727s IS 
GENERIC (width : positive := 32);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		);
END hcc_mul2727s;

ARCHITECTURE rtl OF hcc_mul2727s IS

  signal aaff, bbff : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal multiplyff : STD_LOGIC_VECTOR (2*width DOWNTO 1);

BEGIN
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO width LOOP
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 2*width LOOP
        multiplyff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aa; 
        bbff <= bb;
        multiplyff <= aaff * bbff;
         
      END IF;
    
    END IF;
  
  END PROCESS;
                                  
  cc <= multiplyff; 
  
END rtl;

