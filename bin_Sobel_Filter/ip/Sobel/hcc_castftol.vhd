
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTFTOL.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Single Format to   ***
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

ENTITY hcc_castftol IS 
GENERIC (
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         normspeed : positive := 2; -- 1,2 pipes for conversion
         mantissa : integer := 36
        );           
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castftol;

ARCHITECTURE rtl OF hcc_castftol IS

  signal xvector : STD_LOGIC_VECTOR (42 DOWNTO 1);
  signal xvectorsat, xvectorzip : STD_LOGIC;

  component hcc_castftox 
  GENERIC (
           target : integer := 1; -- 0 (internal), 1 (multiplier), 2 (divider)
           roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
           mantissa : positive := 32;
           outputpipe : integer := 1 -- 0 no pipe, 1 output always registered
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		  );
  end component;
  
  component hcc_castxtol 
  GENERIC (
           normspeed : positive := 2; -- 1,2 pipes for conversion
           mantissa : integer := 36
          ); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aazip, aasat : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
    
BEGIN

  corein: hcc_castftox
  GENERIC MAP (target=>0,roundconvert=>roundconvert,mantissa=>32,outputpipe=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aa,
            cc=>xvector,ccsat=>xvectorsat,cczip=>xvectorzip);
            
  coreout: hcc_castxtol
  GENERIC MAP (normspeed=>normspeed,mantissa=>32)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>xvector,aasat=>xvectorsat,aazip=>xvectorzip,
            cc=>cc);
 
END rtl;

