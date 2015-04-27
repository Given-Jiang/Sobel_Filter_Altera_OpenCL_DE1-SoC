
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULLONGB.VHD                          ***
--***                                             ***
--***   Function: 3 pipeline stage fixed point    ***
--***             (long, signed & unsigned)       ***
--***             behavioral                      ***
--***                                             ***
--***   14/12/07 ML                               ***
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

ENTITY hcc_mullongb IS 
GENERIC (unsigned : integer := 0);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		);
END hcc_mullongb;

ARCHITECTURE rtl OF hcc_mullongb IS

  signal aabit, bbbit : STD_LOGIC;
  signal aaff, bbff : STD_LOGIC_VECTOR (33 DOWNTO 1);
  signal mulff : STD_LOGIC_VECTOR (66 DOWNTO 1);
  signal muloutff : STD_LOGIC_VECTOR (32 DOWNTO 1);

BEGIN
  
  gxa: IF (unsigned = 0) GENERATE
    aabit <= aa(32);
    bbbit <= bb(32);
  END GENERATE;
  
  gxb: IF (unsigned = 1) GENERATE
    aabit <= '0';
    bbbit <= '0';
  END GENERATE;
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 33 LOOP
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 66 LOOP
        mulff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 32 LOOP
        muloutff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aabit & aa; 
        bbff <= bbbit & bb;
        mulff <= aaff * bbff;
        muloutff <= mulff(32 DOWNTO 1);
         
      END IF;
    
    END IF;
  
  END PROCESS;
                                  
  cc <= muloutff; 
  
END rtl;

