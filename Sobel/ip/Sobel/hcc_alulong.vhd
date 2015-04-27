
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ALULONG.VHD                           ***
--***                                             ***
--***   Function: fixed point adder (long)        ***
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

ENTITY hcc_alulong IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      addsub : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		);
END hcc_alulong;

ARCHITECTURE rtl OF hcc_alulong IS

  signal zerovec : STD_LOGIC_VECTOR (31 DOWNTO 1);
  signal bbvec : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal aluff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  
BEGIN

  gza: FOR k IN 1 TO 31 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  gaa: FOR k IN 1 TO 32 GENERATE
    bbvec(k) <= bb(k) XOR addsub;
  END GENERATE;
  
  paa: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
    
      FOR k IN 1 TO 32 LOOP
        aluff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
        aluff <= aa + bbvec + (zerovec & addsub);
      END IF;
      
    END IF;    
      
  END PROCESS;
  
  cc <= aluff;
  
END rtl;

