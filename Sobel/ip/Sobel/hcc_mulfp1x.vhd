
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP1X.VHD                           ***
--***                                             ***
--***   Function: Single precision multiplier     ***
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

ENTITY hcc_mulfp1x IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         outputscale : integer := 1; -- 0 = none, 1 = scale 
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip : IN STD_LOGIC;
      
		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
		);
END hcc_mulfp1x;

ARCHITECTURE rtl OF hcc_mulfp1x IS
  
  signal mulinaa, mulinbb : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal mulinaasat, mulinaazip, mulinbbsat, mulinbbzip : STD_LOGIC;
  signal ccnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
 
  signal aaexp, bbexp, ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aaman, bbman, ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  component hcc_mulfp3236 IS 
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        bbsat, bbzip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;

  component hcc_mulfppn3236 IS 
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC; 
        bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        bbsat, bbzip : IN STD_LOGIC;
      
		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC
		  );
  end component;
  		   
BEGIN
         
  --**************************************************
  --***                                            ***
  --*** Input Section                              *** 
  --***                                            ***
  --**************************************************
  
  --********************************************************
  --*** ieee754 input when multiplier input is from cast ***
  --*** cast now creates different                       ***
  --*** formats for multiplier, divider, and alu         ***
  --*** multiplier format [S][1][mantissa....]           ***
  --********************************************************

  mulinaa <= aa;
  mulinbb <= bb;
  mulinaasat <= aasat;
  mulinaazip <= aazip;
  mulinbbsat <= bbsat; 
  mulinbbzip <= bbzip;

  --**************************
  --*** Multiplier Section *** 
  --**************************
  
  -- multiplier input in this form
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]

  gma: IF (outputscale = 0) GENERATE
    
    mulone: hcc_mulfp3236
    GENERIC MAP (mantissa=>mantissa,synthesize=>synthesize)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>mulinaa,aasat=>mulinaasat,aazip=>mulinaazip,
              bb=>mulinbb,bbsat=>mulinbbsat,bbzip=>mulinbbzip,
              cc=>ccnode,ccsat=>ccsat,cczip=>cczip);
  
  END GENERATE;

  gmb: IF (outputscale = 1) GENERATE
    
    multwo: hcc_mulfppn3236 
    GENERIC MAP (mantissa=>mantissa,synthesize=>synthesize)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>mulinaa,aasat=>mulinaasat,aazip=>mulinaazip,
              bb=>mulinbb,bbsat=>mulinbbsat,bbzip=>mulinbbzip,
              cc=>ccnode,ccsat=>ccsat,cczip=>cczip);
  
  END GENERATE;
  
  --*** OUTPUTS ***
  cc <= ccnode;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  ccexp <= ccnode(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  ccman <= ccnode(mantissa+10 DOWNTO 11);
  
END rtl;

