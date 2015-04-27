
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION DIVIDER - CORE           ***
--***                                             ***
--***   DP_DIV_CORE.VHD                           ***
--***                                             ***
--***   Function: Fixed Point 54 Bit Divider      ***
--***                                             ***
--***   Multiplier Convergence Algorithm          ***
--***                                             ***
--***   31/01/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   24/04/09 - SIII/SIV multiplier support    ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** SII Latency = 19 + 4*doublespeed            ***
--*** SIII/IV Latency = 18 + 2*doublespeed        ***
--***************************************************

ENTITY dp_div_core IS 
GENERIC (
         doublespeed : integer := 0; -- 0/1
         doubleaccuracy : integer := 0;  -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1      -- 0/1      
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      dividend : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      divisor : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

		quotient : OUT STD_LOGIC_VECTOR (55 DOWNTO 1)
		);
END dp_div_core;

ARCHITECTURE rtl OF dp_div_core IS

  --SII mullatency = doublespeed+5, SIII/IV mullatency = 4
  constant mullatency : positive := doublespeed+5 - device*(1+doublespeed);
  --SII addlatency = 2*doublespeed+1, SIII/IV addlatency = doublespeed+1
  constant addlatency : positive := 2*doublespeed+1 - device*doublespeed;
 
  signal zerovec : STD_LOGIC_VECTOR (54 DOWNTO 1);
  
  -- estimate
  signal invdivisor : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal dividenddel, divisordel : STD_LOGIC_VECTOR (54 DOWNTO 1);
  -- scale
  signal scaleden, scalenum : STD_LOGIC_VECTOR (54 DOWNTO 1);
  -- iteration
  signal twonode, subscaleden : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal guessone : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal guessonevec : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal absoluteval : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal absolutevalff, absoluteff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal abscarryff : STD_LOGIC;
  signal delscalenum : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal iteratenumnode : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal iteratenum : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal absoluteerror : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal mulabsguesslower : STD_LOGIC_VECTOR (19 DOWNTO 1);
  signal mulabsguessnode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal mulabsguess : STD_LOGIC_VECTOR (54 DOWNTO 1);

  signal quotientnode : STD_LOGIC_VECTOR (72 DOWNTO 1);
  
  component fp_div_est IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        divisor : IN STD_LOGIC_VECTOR (19 DOWNTO 1);

		  invdivisor : OUT STD_LOGIC_VECTOR (18 DOWNTO 1)
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
  
  component dp_fxadd 
  GENERIC (
           width : positive := 64;
           pipes : positive := 1;
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
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
       
BEGIN
  
  gza: FOR k IN 1 TO 54 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  invcore: fp_div_est 
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>divisor(54 DOWNTO 36),invdivisor=>invdivisor);
  
  delinone: fp_del
  GENERIC MAP (width=>54,pipes=>5)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>dividend,cc=>dividenddel);
            
  delintwo: fp_del
  GENERIC MAP (width=>54,pipes=>5)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>divisor,cc=>divisordel);
            
  --**********************************
  --*** ITERATION 0 - SCALE INPUTS ***
  --**********************************
  
  -- in level 5, out level 8+doublespeed
  mulscaleone: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>18,widthcc=>54,
               pipes=>3+doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>divisordel,databb=>invdivisor,
            result=>scaleden);
  
  mulscaletwo: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>18,widthcc=>54,
               pipes=>3+doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dividenddel,databb=>invdivisor,
            result=>scalenum);
  
  --********************
  --*** ITERATION 1  ***
  --********************
  
  twonode <= '1' & zerovec(54 DOWNTO 1);
  
  gta: FOR k IN 1 TO 54 GENERATE
    subscaleden(k) <= NOT(scaleden(k));
  END GENERATE;
  subscaleden(55) <= '1';

  -- in level 8+speed, outlevel 9+2*speed
  addtwoone: dp_fxadd 
  GENERIC MAP (width=>55,pipes=>doublespeed+1,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>twonode,bb=>subscaleden,carryin=>'1',
            cc=>guessone);  
  
  guessonevec <= guessone(54 DOWNTO 1);
  
  -- absolute value of guess lower 36 bits
  -- this is still correct, because (for positive), value will be 1.(17 zeros)error
  -- can also be calculated from guessonevec (code below)
  -- gabs: FOR k IN 1 TO 36 GENERATE
  --   absoluteval(k) <= guessonevec(k) XOR NOT(guessonevec(54));
  -- END GENERATE;
  gabs: FOR k IN 1 TO 36 GENERATE
    absoluteval(k) <= scaleden(k) XOR NOT(scaleden(54));
  END GENERATE;
  
  pta: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 36 LOOP
        absolutevalff(k) <= '0';
        absoluteff(k) <= '0';
      END LOOP;
      abscarryff <= '0';
      
    ELSIF (rising_edge(sysclk)) THEN
      
      IF (enable = '1') THEN
          
        absolutevalff <= absoluteval; -- out level 9+speed
        abscarryff <= NOT(scaleden(54)); 
        absoluteff <= absolutevalff + 
                     (zerovec(35 DOWNTO 1) & abscarryff); -- out level 10+speed
        
      END IF;
    
    END IF;
    
  END PROCESS;

  deloneone: fp_del
  GENERIC MAP (width=>54,pipes=>doublespeed+1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>scalenum,
            cc=>delscalenum);
    
  -- in level 9+2*doublespeed
  -- SII out level 14+3*doublespeed
  -- SIII/IV out level 13+2*doublespeed
  muloneone: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>54,widthcc=>72,pipes=>mullatency,
               accuracy=>doubleaccuracy,device=>device,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>delscalenum,databb=>guessonevec,
            result=>iteratenumnode);
         
  gia: IF (device = 0) GENERATE     
    iteratenum <= iteratenumnode(71 DOWNTO 18);
  END GENERATE;

  gib: IF (device = 1) GENERATE 
    -- SIII/IV out level 14+2*doublespeed
    delit: fp_del
    GENERIC MAP (width=>54,pipes=>1)   
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>iteratenumnode(71 DOWNTO 18),
              cc=>iteratenum);
  END GENERATE;
  
  -- in level 10+doublespeed, out level 13+doublespeed
  mulonetwo: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>72,pipes=>3,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>absoluteff,databb=>absoluteff,
            result=>absoluteerror);

  -- if speed = 0, delay absoluteerror 1 clock, else 2
  -- this guess always positive (check??)
  -- change here, error can be [19:1], not [18:1] - this is because (1.[17 zeros].error)^2
  -- gives 1.[34 zeros].error
  
  -- in level 13+speed
  -- SII out level 14+3*speed
  -- SIII/IV out level 14+2*speed
  addtwotwo: dp_fxadd 
  GENERIC MAP (width=>19,pipes=>addlatency,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>absoluteerror(72 DOWNTO 54),
            bb=>zerovec(19 DOWNTO 1),
            carryin=>absoluteerror(53),
            cc=>mulabsguesslower);  
            
  mulabsguessnode(19 DOWNTO 1) <= mulabsguesslower;
  gmga: FOR k IN 20 TO 53 GENERATE
    mulabsguessnode(k) <= '0';
  END GENERATE;
  mulabsguessnode(54) <= '1';

  mulabsguess <= mulabsguessnode;
  
  --*********************
  --*** OUTPUT SCALE  ***
  --*********************
  
  -- SII: in level 14+3*doublespeed, out level 19+4*doublespeed
  -- SIII/IV: in level 14+2*doublespeed, out level 18+2*doublespeed
  mulout: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>54,widthcc=>72,pipes=>mullatency,
               accuracy=>doubleaccuracy,device=>device,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>iteratenum,databb=>mulabsguess,
            result=>quotientnode);
            
  quotient <= quotientnode(71 DOWNTO 17);
                  
END rtl;

