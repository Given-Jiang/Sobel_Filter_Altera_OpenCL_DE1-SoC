
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTDTOX.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Double to Internal ***
--***             Single                          ***
--***                                             ***
--***   14/07/07 ML                               ***
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

ENTITY hcc_castdtox IS 
GENERIC (
         target : integer := 0; -- 0 (internal), 1 (multiplier), 2 (divider)
         mantissa : positive := 32;
         roundconvert : integer := 1; -- global switch - round all ieee<=>y conversion when '1'
         doublespeed : integer := 0 -- '0' for unpiped adder, '1' for piped adder
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC 
		);
END hcc_castdtox;

ARCHITECTURE rtl OF hcc_castdtox IS
    
  signal ccprenode : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal ccnode : STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
  signal satnode, zipnode : STD_LOGIC;
  
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

  component hcc_castytox IS 
  GENERIC (
           target : integer := 0; -- 1 (signed 64 bit), 0 (unsigned "S1"+52bit)
           roundconvert : integer := 1; -- global switch - round all conversions when '1'
           mantissa : positive := 32
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		  );
    end component;		
    
BEGIN
  
-- if x target is internal (0), output of dtoy is internal (1)
-- if x target is multiplier(1), output of dtoy is internal (1)
-- if x target is divider(2), output of dtoy is divider (0)

  -- if x target is internal (0), output of dtoy is internal (1)
  gda: IF (target = 0) GENERATE
    castinone: hcc_castdtoy
    GENERIC MAP (target=>1,roundconvert=>roundconvert,doublespeed=>doublespeed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>ccnode,ccsat=>satnode,cczip=>zipnode);
  END GENERATE;

  -- if x target is multiplier(1), output of dtoy is internal (1)
  -- leftshift y (SSSSS1XXX) to signed multiplier format (S1XXX)
  gdb: IF (target = 1) GENERATE
    castintwo: hcc_castdtoy
    GENERIC MAP (target=>1,roundconvert=>roundconvert,doublespeed=>doublespeed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>ccprenode,ccsat=>satnode,cczip=>zipnode);
              
    ccnode <= ccprenode(73 DOWNTO 5) & "0000";
  END GENERATE;
  
  gdc: IF (target = 2) GENERATE
    castintwo: hcc_castdtoy
    GENERIC MAP (target=>0,roundconvert=>roundconvert,doublespeed=>doublespeed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>ccnode,ccsat=>satnode,cczip=>zipnode);
  END GENERATE;
  
  castout: hcc_castytox
  GENERIC MAP (target=>target,roundconvert=>roundconvert,mantissa=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>ccnode,aasat=>satnode,aazip=>zipnode,
              cc=>cc,ccsat=>ccsat,cczip=>cczip);
  
END rtl;

