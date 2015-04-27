
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   FP_NEG.VHD                                ***
--***                                             ***
--***   Function: Single Precision Negative Value ***
--***                                             ***
--***   Created 11/09/09                          ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_neg IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

		  signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
		  satout, zeroout, nanout : OUT STD_LOGIC
		);
END fp_neg;

ARCHITECTURE rtl OF fp_neg IS
 
  signal signff : STD_LOGIC;
  signal exponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal expnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal expzerochk, expmaxchk : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal expzero, expmax : STD_LOGIC;
  signal manzerochk : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal manzero, mannonzero : STD_LOGIC; 

BEGIN
    
  pin: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      signff <= '0';
      FOR k IN 1 TO 8 LOOP
        exponentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 23 LOOP
        mantissaff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
          
        signff <= NOT(signin);
        exponentff <= exponentin;
        mantissaff <= mantissain;
        
      END IF;
    
    END IF;  
      
  END PROCESS;

  expzerochk(1) <= exponentff(1);
  expmaxchk(1) <= exponentff(1);
  gxa: FOR k IN 2 TO 8 GENERATE
    expzerochk(k) <= expzerochk(k-1) OR exponentff(k);
    expmaxchk(k) <= expmaxchk(k-1) AND exponentff(k);
  END GENERATE;
  expzero <= NOT(expzerochk(8));
  expmax <= expmaxchk(8);
  
  manzerochk(1) <= mantissaff(1);
  gma: FOR k IN 2 TO 23 GENERATE
    manzerochk(k) <= manzerochk(k-1) OR mantissaff(k);
  END GENERATE;
  manzero <= NOT(manzerochk(23));
  mannonzero <= manzerochk(23);
  
  signout <= signff;
  exponentout <= exponentff;
  mantissaout <= mantissaff;
  satout <= expmax AND manzero;
  zeroout <= expzero;
  nanout <= expmax AND mannonzero;

END rtl;

