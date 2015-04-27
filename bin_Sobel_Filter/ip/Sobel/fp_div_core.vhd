
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   SINGLE PRECISION DIVIDER - CORE           ***
--***                                             ***
--***   FP_DIV_CORE.VHD                           ***
--***                                             ***
--***   Function: Fixed Point 36 Bit Divider      ***
--***                                             ***
--***   31/01/08 ML                               ***
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

--***************************************************
--*** Notes:                                      ***
--*** Latency = 13                                ***
--***************************************************

ENTITY fp_div_core IS 
GENERIC (synthesize : integer := 1);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      dividend : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
      divisor : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		quotient : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		);
END fp_div_core;

ARCHITECTURE rtl OF fp_div_core IS

  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal guess : STD_LOGIC_VECTOR (18 DOWNTO 1);         
  signal dividenddel : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal divisordel : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal scaledivisor : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal scaledividend : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal nextguessnode : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal nextguessff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal scaledividendff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal quotientnode : STD_LOGIC_VECTOR (72 DOWNTO 1);
  
  signal leadone, leadzip, leader : STD_LOGIC;
  
  component fp_div_est IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        divisor : IN STD_LOGIC_VECTOR (19 DOWNTO 1);

		  invdivisor : OUT STD_LOGIC_VECTOR (18 DOWNTO 1)
		  );
  end component;
  
  component fp_del
  GENERIC (
           width : positive := 64;
           pipes : positive := 2
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
       
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
   end component;  
   
  component fp_fxmul 
  GENERIC (
           widthaa : positive := 18;
           widthbb : positive := 18;
           widthcc : positive := 36;
           pipes : positive := 1;
           accuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dataaa : IN STD_LOGIC_VECTOR (widthaa DOWNTO 1);
        databb : IN STD_LOGIC_VECTOR (widthbb DOWNTO 1); 
      
        result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
       );
  end component;
   
BEGIN
  
  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  estcore: fp_div_est
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>divisor(36 DOWNTO 18),invdivisor=>guess);

  deltop: fp_del
  GENERIC MAP (width=>36,pipes=>5)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>dividend,cc=>dividenddel);
            
  delbot: fp_del
  GENERIC MAP (width=>36,pipes=>5)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>divisor,cc=>divisordel);
   
  ppa: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 36 LOOP
        nextguessff(k) <= '0';
        scaledividendff(k) <= '0';
      END LOOP;
         
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
          
        nextguessff <= nextguessnode;
        scaledividendff <= scaledividend;
 
      END IF;
         
    END IF;
  
  END PROCESS;
  
  leadone <= nextguessff(35) AND nextguessff(34) AND nextguessff(33) AND 
             nextguessff(32) AND nextguessff(31) AND nextguessff(30) AND nextguessff(29) AND 
             nextguessff(28) AND nextguessff(27) AND nextguessff(26) AND nextguessff(25) AND 
             nextguessff(24) AND nextguessff(23) AND nextguessff(22) AND nextguessff(21) AND 
             nextguessff(20) AND nextguessff(19);-- AND nextguessff(18);
  
  leadzip <= NOT(nextguessff(35) OR nextguessff(34) OR nextguessff(33) OR 
                 nextguessff(32) OR nextguessff(31) OR nextguessff(30) OR nextguessff(29) OR 
                 nextguessff(28) OR nextguessff(27) OR nextguessff(26) OR nextguessff(25) OR 
                 nextguessff(24) OR nextguessff(23) OR nextguessff(22) OR nextguessff(21) OR 
                 nextguessff(20) OR nextguessff(19));-- OR nextguessff(18));
                 
  leader <= leadone XOR leadzip;
            
  -- 36 * 18, magnitude will be very close to 1 (1.00..00XXX or 0.11..11XXX)
  mulone: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>18,widthcc=>36,pipes=>3,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>divisordel,databb=>guess,
            result=>scaledivisor);            
        
  -- 36 * 18, as 1<divisor<2 and 1<dividend<1 and 0.5<guess<1, 0.5<scaledividend<2
  multwo: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>18,widthcc=>36,pipes=>3,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dividenddel,databb=>guess,
            result=>scaledividend); 

  -- 2.0 - about 1 = about 1 (1.00..00XXX or 0.11..11XXX)
  --nextguessnode <= ("10" & zerovec(35 DOWNTO 1)) - ('0' & scaledivisor);
  
  nextguessnode(20 DOWNTO 1) <= zerovec(20 DOWNTO 1) - scaledivisor(20 DOWNTO 1);
  gng: FOR k IN 21 TO 35 GENERATE
    nextguessnode(k) <= scaledivisor(36);
  END GENERATE;
  nextguessnode(36) <= scaledivisor(35);

  multthr: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>72,pipes=>3,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>scaledividendff,databb=>nextguessff,
            result=>quotientnode); 
         
  quotient <= quotientnode(71 DOWNTO 36);

END rtl;

