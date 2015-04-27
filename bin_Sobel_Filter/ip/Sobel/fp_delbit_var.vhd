
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_DELBIT_VAR.VHD                         ***
--***                                             ***
--***   Function: Multiple Bit Delay              ***
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

ENTITY fp_delbit_var IS 
GENERIC (
         pipes : positive := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC; 
      
      cc : OUT STD_LOGIC
     );
END fp_delbit_var ;

ARCHITECTURE rtl OF fp_delbit_var  IS

  signal delff : STD_LOGIC_VECTOR (pipes DOWNTO 1);
            
BEGIN

  pda: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO pipes LOOP
        delff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
        delff(1) <= aa;
        FOR k IN 2 TO pipes LOOP
          delff(k) <= delff(k-1);
        END LOOP;
      END IF;
    
    END IF;
      
  END PROCESS;
    
  cc <= delff(pipes);
    
END rtl;

