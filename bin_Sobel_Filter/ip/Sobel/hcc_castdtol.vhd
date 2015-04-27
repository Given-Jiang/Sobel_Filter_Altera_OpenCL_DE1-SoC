
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTDTOL.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Double Format to   ***
--***   Long                                      ***
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

ENTITY hcc_castdtol IS 
GENERIC (
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1;
         normspeed : positive := 2
         ); -- 1,2 pipes for conversion
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castdtol;

ARCHITECTURE rtl OF hcc_castdtol IS

  signal yvector : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal yvectorsat, yvectorzip : STD_LOGIC;
  
  component hcc_castdtoy
  GENERIC (
           target : integer := 0; -- 1(internal), 0 (multiplier, divider)
           roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
           outputpipe : integer := 0; -- if zero, dont put final pipe for some modes
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

	     cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
	     ccsat, cczip : OUT STD_LOGIC 
	    );
  end component;
  
  component hcc_castytol  
  GENERIC (normspeed : positive := 2); -- 1,2 pipes for conversion
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aazip, aasat : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );   
  end component;
  
BEGIN
 
  corein: hcc_castdtoy
  GENERIC MAP (target=>1,roundconvert=>roundconvert,outputpipe=>1,
               doublespeed=>doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aa,
            cc=>yvector,ccsat=>yvectorsat,cczip=>yvectorzip);

  coreout: hcc_castytol
  GENERIC MAP (normspeed=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>yvector,aasat=>yvectorsat,aazip=>yvectorzip,
            cc=>cc);    
  
END rtl;

