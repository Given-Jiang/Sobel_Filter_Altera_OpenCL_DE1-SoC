
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTXTOD.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Single to IEEE754 ***
--***             Double                          ***
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

ENTITY hcc_castxtod IS 
GENERIC (
         target : integer := 1; -- 1(internal), 0 (multiplier, divider)
         mantissa : positive := 32;
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip : STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
		);
END hcc_castxtod;

ARCHITECTURE rtl OF hcc_castxtod IS
    
  signal yvector : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal yvectorsat, yvectorzip : STD_LOGIC;
   
  component hcc_castxtoy IS 
  GENERIC (
           target : integer := 1; -- 1(internal), 0 (multiplier, divider)
           mantissa : positive := 32
          );
  PORT (
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		 );
  end component;
	
  component hcc_castytod 
  GENERIC (
           roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
           normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
         );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

	     cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
  	 
BEGIN

  corein: hcc_castxtoy
  GENERIC MAP (target=>1,mantissa=>mantissa)
  PORT MAP (aa=>aa,aasat=>aasat,aazip=>aazip,
            cc=>yvector,ccsat=>yvectorsat,cczip=>yvectorzip);
            
  coreout: hcc_castytod
  GENERIC MAP (roundconvert=>roundconvert,normspeed=>normspeed,
               doublespeed=>doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>yvector,aasat=>yvectorsat,aazip=>yvectorzip,
            cc=>cc);
   
END rtl;

