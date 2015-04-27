
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   DP_FABS.VHD                               ***
--***                                             ***
--***   Function: Single Precision Absolute Value ***
--***                                             ***
--***   abs(x)                                    ***
--***                                             ***
--***   Created 12/09/09                          ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY dp_fabs IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

		  signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
		  satout, zeroout, nanout : OUT STD_LOGIC
		);
END dp_fabs;

ARCHITECTURE rtl OF dp_fabs IS
 
  signal signff : STD_LOGIC;
  signal exponentff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal expnode : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal expzerochk, expmaxchk : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal expzero, expmax : STD_LOGIC;
  signal manzerochk : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal manzero, mannonzero : STD_LOGIC; 

BEGIN
    
  pin: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      signff <= '0';
      FOR k IN 1 TO 11 LOOP
        exponentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 52 LOOP
        mantissaff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
          
        signff <= '0';
        exponentff <= exponentin;
        mantissaff <= mantissain;
        
      END IF;
    
    END IF;  
      
  END PROCESS;

  expzerochk(1) <= exponentff(1);
  expmaxchk(1) <= exponentff(1);
  gxa: FOR k IN 2 TO 11 GENERATE
    expzerochk(k) <= expzerochk(k-1) OR exponentff(k);
    expmaxchk(k) <= expmaxchk(k-1) AND exponentff(k);
  END GENERATE;
  expzero <= NOT(expzerochk(11));
  expmax <= expmaxchk(11);
  
  manzerochk(1) <= mantissaff(1);
  gma: FOR k IN 2 TO 52 GENERATE
    manzerochk(k) <= manzerochk(k-1) OR mantissaff(k);
  END GENERATE;
  manzero <= NOT(manzerochk(52));
  mannonzero <= manzerochk(52);
  
  signout <= signff;
  exponentout <= exponentff;
  mantissaout <= mantissaff;
  satout <= expmax AND manzero;
  zeroout <= expzero;
  nanout <= expmax AND mannonzero;

END rtl;

