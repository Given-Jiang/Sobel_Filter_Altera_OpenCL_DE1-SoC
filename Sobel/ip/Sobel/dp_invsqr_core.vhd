
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION INVERSE SQUARE ROOT      ***
--***                 CORE                        ***
--***                                             ***
--***   DP_INVSQR_CORE.VHD                        ***
--***                                             ***
--***   Function: 54 bit Inverse Square Root      ***
--***   (multiplicative iterative algorithm)      ***
--***                                             ***
--***   09/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   24/04/09 - SIII/SIV multiplier support    ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** SII Latency = 31 + 2*doublespeed            ***
--*** SIII/IV Latency = 30 + doublespeed          ***
--*** 1. Output is rounded already, LSB always 0  ***
--***************************************************

ENTITY dp_invsqr_core IS 
GENERIC (
         doublespeed : integer := 0;  -- 0/1
         doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1  -- 0/1      
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      radicand : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      odd : IN STD_LOGIC;

		invroot : OUT STD_LOGIC_VECTOR (54 DOWNTO 1)
		);
END dp_invsqr_core;

ARCHITECTURE rtl OF dp_invsqr_core IS

  --SII mullatency = speed+5, SIII/IV mullatency = 4
  constant mullatency : positive := doublespeed+5 - device*(1+doublespeed);
    
  signal zerovec : STD_LOGIC_VECTOR (54 DOWNTO 1);
  
  signal evennum : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal oddnum : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal guessvec : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal oddff : STD_LOGIC_VECTOR (25+doublespeed DOWNTO 1);
  signal scalenumff : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal guess : STD_LOGIC_VECTOR (18 DOWNTO 1);

  -- 1st iteration
  signal radicanddelone : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal guessdel : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal multoneone : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multonetwo : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal multonetwoff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal suboneff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multonethr : STD_LOGIC_VECTOR (37 DOWNTO 1);
  signal guessonevec : STD_LOGIC_VECTOR (36 DOWNTO 1);
      
  -- 2ns iteration
  signal radicanddeltwo : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal guessonevecdelone : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal guessonevecdeltwo : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multtwoone : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal multtwotwo : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal multtwotwoff : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal finaladdsub : STD_LOGIC;
  signal finaladdsubff : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal finaladdff : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal multtwothr : STD_LOGIC_VECTOR (36 DOWNTO 1);  
  signal finalguessvec : STD_LOGIC_VECTOR (53 DOWNTO 1);
  signal invrootvec : STD_LOGIC_VECTOR (53 DOWNTO 1);

  component fp_invsqr_est IS 
  GENERIC (synthesize : integer := 0); -- 0 = behavioral, 1 = syntheziable
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        radicand : IN STD_LOGIC_VECTOR (19 DOWNTO 1);

		  invroot : OUT STD_LOGIC_VECTOR (18 DOWNTO 1)
		  );
  end component;
  
  component dp_fxadd IS 
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
  
  component fp_fxmul IS 
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
 
  component fp_del 
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
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
    
  oddnum <= conv_std_logic_vector(185363,18); -- mult by 2^-.5 (odd exp)
  evennum <= conv_std_logic_vector(262143,18); -- mult by 1 (even exp)
  
  gza: FOR k IN 1 TO 54 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  -- in level 0, out level 5
  look: fp_invsqr_est
  GENERIC MAP (synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            radicand=>radicand(54 DOWNTO 36),invroot=>guessvec);
              
  pta: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
    
      FOR k IN 1 TO 25+doublespeed LOOP
        oddff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 18 LOOP
        scalenumff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
        
        oddff(1) <= odd;
        FOR k IN 2 TO 25+doublespeed LOOP
          oddff(k) <= oddff(k-1);
        END LOOP; 
        
        FOR k IN 1 TO 18 LOOP
          scalenumff(k) <= (oddnum(k) AND oddff(4)) OR (evennum(k) AND NOT(oddff(4)));
        END LOOP;
          
      END IF;
    
    END IF;    
      
  END PROCESS;

  -- in level 5, out level 7
  mulscale: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>18,pipes=>2,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>guessvec,databb=>scalenumff,
            result=>guess);

  --*********************
  --*** ITERATION ONE ***
  --*********************
  --X' = X/2(3-YXX)
  
  deloneone: fp_del
  GENERIC MAP(width=>54,pipes=>9)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>radicand,cc=>radicanddelone);
            
  delonetwo: fp_del
  GENERIC MAP(width=>18,pipes=>7)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>guess,cc=>guessdel);
            
  -- in level 7, out level 9 (18x18=36)
  oneone: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>36,pipes=>2,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>guess,databb=>guess,
            result=>multoneone);
                   
  -- in level 9, out level 12 (36x36=37)
  onetwo: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>37,pipes=>3,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>radicanddelone(54 DOWNTO 19),databb=>multoneone,
            result=>multonetwo);
                   
  -- multonetwo is about 1 - either 1.000000XXX or 0.9999999
  -- mult by 2 if odd exponent (37 DOWNTO 2), otherwise (38 DOWNTO 3)
  -- round bit in position 1 or 2
  pone: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 36 LOOP
        multonetwoff(k) <= '0';
        suboneff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
        
        --invert here so that borrow can be added in simple expression
        -- level 13
        FOR k IN 1 TO 36 LOOP
          multonetwoff(k) <= NOT((multonetwo(k) AND oddff(12)) OR (multonetwo(k+1) AND NOT(oddff(12))));
        END LOOP;
        -- level 14
        suboneff <= ("11" & zerovec(34 DOWNTO 1)) + 
                    ('1' & multonetwoff(36 DOWNTO 2)) +
                    (zerovec(35 DOWNTO 1) & multonetwoff(1));
          
      END IF;
    
    END IF;    
      
  END PROCESS;    

  -- in level 14, out level 17 (36x18=37)
  onethr: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>18,widthcc=>37,pipes=>3,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>suboneff,databb=>guessdel,
            result=>multonethr); 
            
  -- mult by 2 - subone is about 1 (1.000 or 0.9999) so will effectively multiply by 0.5
  guessonevec <= multonethr(36 DOWNTO 1);
  
  --************************
  --*** SECOND ITERATION ***
  --************************
  --X' = X/2(3-YXX)
  
  deltwoone: fp_del
  GENERIC MAP(width=>54,pipes=>11)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>radicanddelone,cc=>radicanddeltwo);
            
  -- SII level in 17, level out 26+doublespeed
  -- SIII/IV level in 17, level out 25
  deltwotwo: fp_del
  GENERIC MAP(width=>36,pipes=>(9+doublespeed-device*(1+doublespeed)))
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>guessonevec,cc=>guessonevecdelone);
            
  deltwothr: fp_del
  GENERIC MAP (width=>36,pipes=>4)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>guessonevecdelone,cc=>guessonevecdeltwo);
            
  -- in level 17, out level 20 (36x36=54)
  twoone: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>54,pipes=>3,
               accuracy=>doubleaccuracy,device=>device,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>guessonevec,databb=>guessonevec,
            result=>multtwoone); 
            
  -- in level 20, 
  -- SII out level 25/26 - 25+doublespeed
  -- SIII/SIV out level 24   
  twotwo: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>54,widthcc=>72,pipes=>mullatency,
               accuracy=>doubleaccuracy,device=>device,
               synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>multtwoone,databb=>radicanddeltwo,
            result=>multtwotwo); 

  -- multtwotwo is about 1 - either 1.000000XXX or 0.9999999
  -- mult by 2 if odd exponent (55 DOWNTO 2), otherwise (56 DOWNTO 3)
  -- round bit in position 1 or 2
  ptwo: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 36 LOOP
        multtwotwoff(k) <= '0';
      END LOOP;
      finaladdsubff <= "0000";
      FOR k IN 1 TO 55 LOOP
        finaladdff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
        
        -- SII in level 25+doublespeed, out level 26+doublespeed
        -- SIII in level 24, out level 25
        -- if multwotwo > 1, subtwo negative, subtract multwothr from guessonevec
        -- if multwotwo <= 1, subtwo positive, add multwothr to guessonevec
        FOR k IN 1 TO 36 LOOP
          multtwotwoff(k) <= ((multtwotwo(k+6) AND oddff(25+doublespeed-device*(1+doublespeed))) OR 
                              (multtwotwo(k+7) AND NOT(oddff(25+doublespeed-device*(1+doublespeed))))) XOR finaladdsub;
        END LOOP;
        
        finaladdsubff(1) <= finaladdsub;
        FOR k IN 2 TO 4 LOOP
          finaladdsubff(k) <= finaladdsubff(k-1);
        END LOOP;

        -- makes sure no overflow happens here, for example if less than 30 leading 1s/0s
        -- in multtwotwoff
        -- SII level in 29+doublespeed level out 30+doublespeed
        -- SIII level in 28 level out 29
        FOR k IN 1 TO 26 LOOP
          finaladdff(k) <= multtwothr(k+10) XOR NOT(finaladdsubff(4));
        END LOOP;
        FOR k IN 27 TO 55 LOOP
          finaladdff(k) <= NOT(finaladdsubff(4));
        END LOOP;
          
      END IF;
    
    END IF;    
      
  END PROCESS;  
  
  -- doesnt have to be near msb
  finaladdsub <= multtwotwo(60);  

  -- SII level in (26+doublespeed), level out (29+doublespeed)
  -- SII level in 25, level out 28
  twothr: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>36,pipes=>3,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>multtwotwoff,databb=>guessonevecdelone,
            result=>multtwothr);
                      
  finalguessvec <= guessonevecdeltwo & zerovec(17 DOWNTO 1);
   
  -- SII level in 30+doublespeed, level out 31+2*doublespeed
  -- SIII level in 29, level out 30+doublespeed
  final: dp_fxadd
  GENERIC MAP (width=>53,pipes=>doublespeed+1,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>finalguessvec,bb=>finaladdff(55 DOWNTO 3),carryin=>finaladdff(2),
            cc=>invrootvec);
  
  invroot <= invrootvec & '0';
   
END rtl;
