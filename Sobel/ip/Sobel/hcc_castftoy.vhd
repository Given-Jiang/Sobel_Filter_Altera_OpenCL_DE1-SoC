
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTFTOY.VHD                          ***
--***                                             ***
--***   Function: Cast IEEE754 Single to Internal ***
--***             Double                          ***
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

-- castftoy : float <=> internal double 
ENTITY hcc_castftoy IS 
GENERIC (
         target : integer := 0; -- 1 (internal), 0 (multiplier,divider)
         roundconvert : integer := 1; -- global switch - round all ieee<=>x conversion when '1'
         mantissa : positive := 32;
         outputpipe : integer := 1 -- 0 no pipe, 1 output always registered
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (67+10*target DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC 
		);
END hcc_castftoy;

ARCHITECTURE rtl OF hcc_castftoy IS
    
  signal floatnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal satnode, zipnode : STD_LOGIC;
   
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
	
  component hcc_castxtoy 
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
  
BEGIN
    
  -- if ftoy target divider or multiplier, need unsigned output
  -- if ftoy target = 1 (internal), ftox target = 0, xtoy target = 1
  -- if ftoy target = 0 (multiplier, divider), ftox target = 2 (divider), xtoy target = 0 (mult&div)

  gaa: IF (target = 1) GENERATE
    one: hcc_castftox
    GENERIC MAP(target=>0,roundconvert=>roundconvert,
                mantissa=>mantissa,outputpipe=>outputpipe)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>floatnode,ccsat=>satnode,cczip=>zipnode);
            
    two: hcc_castxtoy
    GENERIC MAP(target=>1,mantissa=>mantissa)
    PORT MAP (aa=>floatnode,aasat=>satnode,aazip=>zipnode,
              cc=>cc,ccsat=>ccsat,cczip=>cczip);
  END GENERATE;

  gab: IF (target = 0) GENERATE
    one: hcc_castftox
    GENERIC MAP(target=>2,roundconvert=>roundconvert,
                mantissa=>mantissa,outputpipe=>outputpipe)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,
              cc=>floatnode,ccsat=>satnode,cczip=>zipnode);
            
    two: hcc_castxtoy
    GENERIC MAP(target=>0,mantissa=>mantissa)
    PORT MAP (aa=>floatnode,aasat=>satnode,aazip=>zipnode,
              cc=>cc,ccsat=>ccsat,cczip=>cczip);
  END GENERATE;

END rtl;

