
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DELAYBIT.VHD                          ***
--***                                             ***
--***   Function: Delay a single bit an           ***
--***             arbitrary number of stages      ***
--***                                             ***
--***   13/12/07 ML                               ***
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

ENTITY hcc_delaybit IS 
GENERIC (delay : positive := 32);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC;

	   cc : OUT STD_LOGIC
	  );
END hcc_delaybit;

ARCHITECTURE rtl OF hcc_delaybit IS

  signal delff : STD_LOGIC_VECTOR (delay DOWNTO 1);
    
BEGIN
   
  gda: IF (delay = 1) GENERATE
  
    pone: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        delff(1) <= '0';
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          delff(1) <= aa;
        END IF;  
      END IF;
    END PROCESS;
    
    cc <= delff(1);
    
  END GENERATE;
  
  gdb: IF (delay > 1) GENERATE
  
    ptwo: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        FOR k IN 1 TO delay LOOP
            delff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          delff(1) <= aa;
          FOR k IN 2 TO delay LOOP
            delff(k) <= delff(k-1);
          END LOOP;
        END IF;  
      END IF;
    END PROCESS;
    
    cc <= delff(delay);
    
  END GENERATE;     

END rtl;

