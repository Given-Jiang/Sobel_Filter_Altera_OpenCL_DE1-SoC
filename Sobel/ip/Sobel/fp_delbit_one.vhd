
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_DELBIT_ONE.VHD                         ***
--***                                             ***
--***   Function: Single Bit Delay                ***
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

ENTITY fp_delbit_one IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC; 
      
      cc : OUT STD_LOGIC
     );
END fp_delbit_one ;

ARCHITECTURE rtl OF fp_delbit_one  IS

  signal delff : STD_LOGIC;
            
BEGIN

  pda: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      delff <= '0';
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        delff <= aa;
      END IF;
    
    END IF;
      
  END PROCESS;
    
  cc <= delff;
    
END rtl;

