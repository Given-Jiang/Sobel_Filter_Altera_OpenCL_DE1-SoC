
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULLONG.VHD                           ***
--***                                             ***
--***   Function: 3 pipeline stage fixed point    ***
--***             (long, signed & unsigned)       ***
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

ENTITY hcc_mullong IS 
GENERIC (
         unsigned : integer := 0; -- 0 = signed, 1 = unsigned
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		);
END hcc_mullong;

ARCHITECTURE rtl OF hcc_mullong IS

  component hcc_mullongb
  GENERIC (unsigned : integer := 0); -- 0 = signed, 1 = unsigned
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		  );
  end component;
  
  component hcc_mullongs
  GENERIC (unsigned : integer := 0); -- 0 = signed, 1 = unsigned
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		  );
  end component;

BEGIN

  gba: IF (synthesize = 0) GENERATE
    
    mulb: hcc_mullongb
    GENERIC MAP (unsigned=>unsigned)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,bb=>bb,
              cc=>cc);
              
  END GENERATE;
  
  gsa: IF (synthesize = 1) GENERATE
    
    muls: hcc_mullongs
    GENERIC MAP (unsigned=>unsigned)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aa,bb=>bb,
              cc=>cc);
              
  END GENERATE;
  
END rtl;

