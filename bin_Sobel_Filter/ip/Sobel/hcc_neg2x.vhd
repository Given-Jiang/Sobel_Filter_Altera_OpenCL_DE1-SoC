
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NEG2X.VHD                             ***
--***                                             ***
--***   Function: Negation (for unary -ve)        ***
--***                                             ***
--***   13/03/08 ML                               ***
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

ENTITY hcc_neg2x IS 
GENERIC (
         ieeeoutput : integer := 0; -- 1 = ieee754 (1/u52/11)
         xoutput : integer := 1; -- 1 = double x format (s64/13)
         funcoutput : integer := 1 -- function output (S'1'u54/13)
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (64+13*xoutput+3*funcoutput DOWNTO 1);
      aasat, aazip : IN STD_LOGIC;
      
      cc : OUT STD_LOGIC_VECTOR (64+13*xoutput+3*funcoutput DOWNTO 1);
      ccsat, cczip : OUT STD_LOGIC
	  );
END hcc_neg2x;

ARCHITECTURE rtl OF hcc_neg2x IS
  
  signal aaff : STD_LOGIC_VECTOR (64+13*xoutput+3*funcoutput DOWNTO 1);
  signal aasatff, aazipff : STD_LOGIC;
    
BEGIN
  
  ppa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
        
      FOR k IN 1 TO 64+13*xoutput+3*funcoutput LOOP
        aaff(k) <= '0';
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
          
        aaff <= aa;
        aasatff <= aasat;
        aazipff <= aazip;

      END IF;
  
    END IF;

  END PROCESS;
  
  goa: IF (ieeeoutput = 1) GENERATE
    cc(64) <= NOT(aaff(64));
    cc(63 DOWNTO 1) <= aaff(63 DOWNTO 1);
    ccsat <= '0';
    cczip <= '0';
  END GENERATE;
  
  gob: IF (xoutput = 1) GENERATE
    gxa: FOR k IN 14 TO 77 GENERATE
      cc(k) <= NOT(aaff(k));
    END GENERATE;
    cc(13 DOWNTO 1) <= aaff(13 DOWNTO 1);
    ccsat <= aasatff;
    cczip <= aazipff;
  END GENERATE;
  
  goc: IF (funcoutput = 1) GENERATE
    cc(67) <= NOT(aaff(67));
    cc(66 DOWNTO 1) <= aaff(66 DOWNTO 1);
    ccsat <= aasatff;
    cczip <= aazipff;
  END GENERATE;
  
END rtl;

