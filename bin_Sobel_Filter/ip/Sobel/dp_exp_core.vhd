
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION EXPONENT(e) - CORE       ***
--***                                             ***
--***   DP_EXP_CORE.VHD                           ***
--***                                             ***
--***   Function: Double Precision Exponent Core  ***
--***                                             ***
--***   18/02/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   24/04/09 - SIII/SIV multiplier support    ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** SII Latency = 19 + 2*doublespeed            ***
--*** SIII/IV Latency = 17                        ***
--***************************************************

ENTITY dp_exp_core IS
GENERIC (
         doublespeed : integer := 0;   -- 0/1
         doubleaccuracy : integer := 0;  -- 0 = pruned multiplier, 1 = normal multiplier
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1      -- 0/1       
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aasgn : IN STD_LOGIC;
      aaman : IN STD_LOGIC_VECTOR (52 DOWNTO 1);
      aaexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);

      ccman : OUT STD_LOGIC_VECTOR (54 DOWNTO 1);
      ccexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      rangeerror : OUT STD_LOGIC
     );
END dp_exp_core;

ARCHITECTURE rtl OF dp_exp_core IS

  --SII mullatency = doublespeed+5, SIII/IV mullatency = 4
  constant mullatency : positive := doublespeed+5 - device*(1+doublespeed);
  constant ranlatency : positive := 15+2*doublespeed-device*(2+2*doublespeed);
  
  type expcalcfftype IS ARRAY ((ranlatency-4) DOWNTO 1) OF 
       STD_LOGIC_VECTOR (11 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (54 DOWNTO 1);
  -- INPUT BLOCK & SHIFTER
  signal signff : STD_LOGIC_VECTOR (ranlatency+3 DOWNTO 1);
  signal aamanff, aamandelff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal aaexpff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal leftshift, rightshift : STD_LOGIC_VECTOR (12 DOWNTO 1);
  signal leftshiftff, rightshiftff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal cmpexp : STD_LOGIC_VECTOR(11 DOWNTO 1);
  signal bigexpff : STD_LOGIC_VECTOR(2 DOWNTO 1);
  signal smallrightshift : STD_LOGIC;
  signal selshiftff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal powerbus : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal leftone, lefttwo : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal rightone, righttwo, rightthree : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal leftff, rightff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal powerff : STD_LOGIC_VECTOR (65 DOWNTO 1);
  signal decimalleft : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal decimalright : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal fractionalleft, fractionalright : STD_LOGIC_VECTOR (54 DOWNTO 1);
  -- TABLES
  signal addlutposff, addlutnegff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal addluttwoff, addlutthrff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal lutposmanff, lutnegmanff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal luttwomanff, lutthrmanff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal lutposexpff, lutnegexpff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal luttwoexpff : STD_LOGIC;
  signal manpos, manneg, mantwo, manthr : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal exppos, expneg : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal exptwo : STD_LOGIC;
  signal lutonemanff, luttwomandelff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal lutoneexpff : STD_LOGIC_VECTOR (11 DOWNTO 1); 
  signal luttwoexpdelff : STD_LOGIC;
  signal expcalcff : expcalcfftype;  
  -- OVER & UNDERFLOW
  signal powercheck : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal rangeff : STD_LOGIC_VECTOR (ranlatency DOWNTO 1);
  -- TAYLOR SERIES
  signal fraction : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal xterm : STD_LOGIC_VECTOR (33 DOWNTO 1);
  signal xsquareterm : STD_LOGIC_VECTOR (12 DOWNTO 1);
  signal approxff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal lutthrmandel : STD_LOGIC_VECTOR (54 DOWNTO 1);
  -- MULTIPLY
  signal resultone : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal resultonedel : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal resulttwo, resultthr : STD_LOGIC_VECTOR (72 DOWNTO 1);
  -- NORMALIZE
  signal normshift : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal manoutff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal expout, expoutff : STD_LOGIC_VECTOR (11 DOWNTO 1);
    
  component dp_explutpos
  PORT (
        add : IN STD_LOGIC_VECTOR (10 DOWNTO 1);
        manhi : OUT STD_LOGIC_VECTOR (24 DOWNTO 1);
        manlo : OUT STD_LOGIC_VECTOR (28 DOWNTO 1);
        exponent : OUT STD_LOGIC_VECTOR (11 DOWNTO 1)
       );
  end component;

  component dp_explutneg 
  PORT (
        add : IN STD_LOGIC_VECTOR (10 DOWNTO 1);
        manhi : OUT STD_LOGIC_VECTOR (24 DOWNTO 1);
        manlo : OUT STD_LOGIC_VECTOR (28 DOWNTO 1);
        exponent : OUT STD_LOGIC_VECTOR (11 DOWNTO 1)
       );
  end component;
    
  component dp_explut10 
  PORT (
        add : IN STD_LOGIC_VECTOR (10 DOWNTO 1);
        manhi : OUT STD_LOGIC_VECTOR (24 DOWNTO 1);
        manlo : OUT STD_LOGIC_VECTOR (28 DOWNTO 1);
        exponent : OUT STD_LOGIC
       );
  end component;
  
  component dp_explut20 
  PORT (
        add : IN STD_LOGIC_VECTOR (10 DOWNTO 1);
        manhi : OUT STD_LOGIC_VECTOR (24 DOWNTO 1);
        manlo : OUT STD_LOGIC_VECTOR (28 DOWNTO 1)
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
  
  --*******************
  --*** INPUT BLOCK ***
  --*******************
  
  psa: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
    
      FOR k IN 1 TO (ranlatency+3) LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 52 LOOP
        aamanff(k) <= '0';
        aamandelff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        aaexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 10 LOOP
        leftshiftff(k) <= '0';
        rightshiftff(k) <= '0';
	  END LOOP;
      selshiftff <= "00";
      FOR k IN 1 TO 64 LOOP
        leftff(k) <= '0';
        rightff(k) <= '0';
        powerff(k) <= '0';
      END LOOP;
	  powerff(65) <= '0';
	  bigexpff <= "00";
          
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
          
        signff(1) <= aasgn;
        FOR k IN 2 TO (ranlatency+3) LOOP
          signff(k) <= signff(k-1);
        END LOOP;
        aamanff <= aaman;
        aamandelff <= aamanff;
        aaexpff <= aaexp;
            
        leftshiftff <= leftshift(10 DOWNTO 1);
        rightshiftff <= rightshift(10 DOWNTO 1);
        
        selshiftff(1) <= leftshift(12);
        selshiftff(2) <= selshiftff(1);
          
        -- level 3
        leftff <= lefttwo;
		-- mask out right barrel shifter output when shifting by 64 or more positions
		FOR k IN 1 TO 64 LOOP
		  rightff(k) <= rightthree(k) AND smallrightshift;
		END LOOP;
		-- overflow of left shifter matters only when the left shifted mantissa result is to be used
		bigexpff(2) <= bigexpff(1) AND NOT(selshiftff(2));
		bigexpff(1) <= NOT(cmpexp(11));
        
        -- level 4
        FOR k IN 1 TO 54 LOOP
          powerff(k) <= (fractionalleft(k) AND NOT(selshiftff(2))) OR 
                        (fractionalright(k) AND selshiftff(2));
        END LOOP;
        FOR k IN 1 TO 10 LOOP
          powerff(k+54) <= (decimalleft(k) AND NOT(selshiftff(2))) OR 
                           (decimalright(k) AND selshiftff(2));
        END LOOP;
		powerff(65) <= (decimalleft(11) AND NOT(selshiftff(2)));
		-- overflow bit required to catch exp(-1023.frac) case
     
      END IF;
 
    END IF;    
      
      
  END PROCESS;
 
  leftshift <= ('0' & aaexpff) - "001111111111";
  rightshift <= "001111111111" - ('0' & aaexpff);
          
  powerbus <= "0000000001" & aamandelff & "00";
  
  decimalleft <= ('0' & leftff(64 DOWNTO 55)) + ("0000000000" & signff(3));
  -- decimalleft may overflow to bit 11 when exp(x), -1024 < x <= -1023
  decimalright <= rightff(64 DOWNTO 55) + ("000000000" & signff(3));
  gfa: FOR k IN 1 TO 54 GENERATE
    fractionalleft(k) <= leftff(k) XOR signff(3);
    fractionalright(k) <= rightff(k) XOR signff(3);
  END GENERATE;
  
  --**********************    
  --*** BARREL SHIFTER ***
  --**********************
  
  leftone(1) <=  powerbus(1)     AND NOT(leftshiftff(2)) AND NOT(leftshiftff(1));
  leftone(2) <= (powerbus(2)     AND NOT(leftshiftff(2)) AND NOT(leftshiftff(1))) OR
                (powerbus(1)     AND NOT(leftshiftff(2)) AND     leftshiftff(1)); 
  leftone(3) <= (powerbus(3)     AND NOT(leftshiftff(2)) AND NOT(leftshiftff(1))) OR
                (powerbus(2)     AND NOT(leftshiftff(2)) AND     leftshiftff(1)) OR
                (powerbus(1)     AND     leftshiftff(2)  AND NOT(leftshiftff(1))); 
  gla: FOR k IN 4 TO 64 GENERATE
    leftone(k) <= (powerbus(k)   AND NOT(leftshiftff(2)) AND NOT(leftshiftff(1))) OR
                  (powerbus(k-1) AND NOT(leftshiftff(2)) AND     leftshiftff(1)) OR
                  (powerbus(k-2) AND     leftshiftff(2)  AND NOT(leftshiftff(1))) OR
                  (powerbus(k-3) AND     leftshiftff(2)  AND     leftshiftff(1));
  END GENERATE;
             
  glb: FOR k IN 1 TO 4 GENERATE
    lefttwo(k) <=  leftone(k)    AND NOT(leftshiftff(4)) AND NOT(leftshiftff(3));
  END GENERATE;
  glc: FOR k IN 5 TO 8 GENERATE
    lefttwo(k) <= (leftone(k)    AND NOT(leftshiftff(4)) AND NOT(leftshiftff(3))) OR
                  (leftone(k-4)  AND NOT(leftshiftff(4)) AND     leftshiftff(3)); 
  END GENERATE;
  gld: FOR k IN 9 TO 12 GENERATE
    lefttwo(k) <= (leftone(k)    AND NOT(leftshiftff(4)) AND NOT(leftshiftff(3))) OR
                  (leftone(k-4)  AND NOT(leftshiftff(4)) AND     leftshiftff(3)) OR
                  (leftone(k-8)  AND     leftshiftff(4)  AND NOT(leftshiftff(3))); 
  END GENERATE;
  gle: FOR k IN 13 TO 64 GENERATE
    lefttwo(k) <= (leftone(k)    AND NOT(leftshiftff(4)) AND NOT(leftshiftff(3))) OR
                  (leftone(k-4)  AND NOT(leftshiftff(4)) AND     leftshiftff(3)) OR
                  (leftone(k-8)  AND     leftshiftff(4)  AND NOT(leftshiftff(3)))  OR
                  (leftone(k-12) AND     leftshiftff(4)  AND     leftshiftff(3)); 
  END GENERATE;
  cmpexp <=  ('0' & leftshiftff) - "00000001010";
  -- detect when left barrel shifter overflows (i.e. leftshiftff > 9)
  
  gra: FOR k IN 1 TO 61 GENERATE
    rightone(k) <= (powerbus(k)   AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1))) OR
                   (powerbus(k+1) AND NOT(rightshiftff(2)) AND     rightshiftff(1)) OR
                   (powerbus(k+2) AND     rightshiftff(2)  AND NOT(rightshiftff(1))) OR
                   (powerbus(k+3) AND     rightshiftff(2)  AND     rightshiftff(1));
  END GENERATE;
  rightone(62) <= (powerbus(62) AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1))) OR
                  (powerbus(63) AND NOT(rightshiftff(2)) AND     rightshiftff(1)) OR
                  (powerbus(64) AND     rightshiftff(2)  AND NOT(rightshiftff(1))); 
  rightone(63) <= (powerbus(63) AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1))) OR
                  (powerbus(64) AND NOT(rightshiftff(2)) AND     rightshiftff(1));
  rightone(64) <=  powerbus(64) AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1));
  
  grb: FOR k IN 1 TO 52 GENERATE
    righttwo(k) <= (rightone(k)    AND NOT(rightshiftff(4)) AND NOT(rightshiftff(3))) OR
                   (rightone(k+4)  AND NOT(rightshiftff(4)) AND     rightshiftff(3)) OR
                   (rightone(k+8)  AND     rightshiftff(4)  AND NOT(rightshiftff(3))) OR
                   (rightone(k+12) AND     rightshiftff(4)  AND     rightshiftff(3)); 
  END GENERATE;
  grc: FOR k IN 53 TO 56 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(rightshiftff(4)) AND NOT(rightshiftff(3))) OR
                   (rightone(k+4) AND NOT(rightshiftff(4)) AND     rightshiftff(3)) OR
                   (rightone(k+8) AND     rightshiftff(4)  AND NOT(rightshiftff(3))); 
  END GENERATE; 
  grd: FOR k IN 57 TO 60 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(rightshiftff(4)) AND NOT(rightshiftff(3))) OR
                   (rightone(k+4) AND NOT(rightshiftff(4)) AND     rightshiftff(3));
  END GENERATE; 
  gre: FOR k IN 61 TO 64 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(rightshiftff(4)) AND NOT(rightshiftff(3)));
  END GENERATE; 

  grf: FOR k IN 1 TO 16 GENERATE
    rightthree(k) <= (righttwo(k)    AND NOT(rightshiftff(6)) AND NOT(rightshiftff(5))) OR
                     (righttwo(k+16) AND NOT(rightshiftff(6)) AND     rightshiftff(5)) OR
                     (righttwo(k+32) AND     rightshiftff(6)  AND NOT(rightshiftff(5))) OR
                     (righttwo(k+48) AND     rightshiftff(6)  AND     rightshiftff(5)); 
  END GENERATE;
  grg: FOR k IN 17 TO 32 GENERATE
    rightthree(k) <= (righttwo(k)    AND NOT(rightshiftff(6)) AND NOT(rightshiftff(5))) OR
                     (righttwo(k+16) AND NOT(rightshiftff(6)) AND     rightshiftff(5)) OR
                     (righttwo(k+32) AND     rightshiftff(6)  AND NOT(rightshiftff(5)));
  END GENERATE;
  grh: FOR k IN 33 TO 48 GENERATE
    rightthree(k) <= (righttwo(k)    AND NOT(rightshiftff(6)) AND NOT(rightshiftff(5))) OR
                     (righttwo(k+16) AND NOT(rightshiftff(6)) AND     rightshiftff(5));
  END GENERATE;
  gri: FOR k IN 49 TO 64 GENERATE
    rightthree(k) <= (righttwo(k)    AND NOT(rightshiftff(6)) AND NOT(rightshiftff(5)));
  END GENERATE;
  -- is rightshiftff < 64, otherwise right barrel shifter output will be masked out
  smallrightshift <= NOT(rightshiftff(7) OR rightshiftff(8) OR rightshiftff(9) OR rightshiftff(10));
  
  --******************************************
  --*** TABLES - NO RESET, FORCE TO MEMORY ***
  --******************************************
  
  -- level: 4 in, 6 out
  pla: PROCESS (sysclk)
  BEGIN
  
    IF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        addlutposff <= powerff(64 DOWNTO 55);
        addlutnegff <= powerff(64 DOWNTO 55);
        addluttwoff <= powerff(54 DOWNTO 45);
        addlutthrff <= powerff(44 DOWNTO 35);
        
        lutposmanff <= '1' & manpos & '0';
        lutposexpff <= exppos;
        lutnegmanff <= '1' & manneg & '0';
        lutnegexpff <= expneg;
        luttwomanff <= '1' & mantwo & '0';
        luttwoexpff <= exptwo;
        lutthrmanff <= '1' & manthr & '0';
            
      END IF;
      
    END IF;
  
  END PROCESS;
  
  declut: dp_explutpos
  PORT MAP (add=>addlutposff,
            manhi=>manpos(52 DOWNTO 29),manlo=>manpos(28 DOWNTO 1),exponent=>exppos);
            
  neglut: dp_explutneg
  PORT MAP (add=>addlutnegff,
            manhi=>manneg(52 DOWNTO 29),manlo=>manneg(28 DOWNTO 1),exponent=>expneg);
                     
  frachilut: dp_explut10
  PORT MAP (add=>addluttwoff,
            manhi=>mantwo(52 DOWNTO 29),manlo=>mantwo(28 DOWNTO 1),exponent=>exptwo);
            
  fraclolut: dp_explut20
  PORT MAP (add=>addlutthrff,
            manhi=>manthr(52 DOWNTO 29),manlo=>manthr(28 DOWNTO 1));

  -- level: 6 in, 7 out
  pma: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO 54 LOOP
        lutonemanff(k) <= '0';
        luttwomandelff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        lutoneexpff(k) <= '0';
      END LOOP;
      luttwoexpdelff <= '0';
      FOR k IN 1 TO (ranlatency-4) LOOP
        expcalcff(k)(11 DOWNTO 1) <= "00000000000";
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        FOR k IN 1 TO 54 LOOP
          lutonemanff(k) <= (lutposmanff(k) AND NOT(signff(6))) OR (lutnegmanff(k) AND signff(6));
        END LOOP;
        luttwomandelff <= luttwomanff;
        FOR k IN 1 TO 11 LOOP
          lutoneexpff(k) <= (lutposexpff(k) AND NOT(signff(6))) OR (lutnegexpff(k) AND signff(6));
        END LOOP;
        luttwoexpdelff <= luttwoexpff;
        
        -- level: 8 in
        -- SII: 19+2*doublespeed out
        -- SII: 17+2*doublespeed out
        expcalcff(1)(11 DOWNTO 1) <= lutoneexpff + ("0000000000" & luttwoexpdelff);
        FOR k IN 2 TO (ranlatency-4) LOOP
          expcalcff(k)(11 DOWNTO 1) <= expcalcff(k-1)(11 DOWNTO 1);
        END LOOP;
            
      END IF;
      
    END IF;
          
  END PROCESS;
  
  --**************************************
  --*** PREDICT OVERFLOW AND UNDERFLOW ***
  --**************************************
  
  -- overflow or underflow if power > 709
  -- overflow or underflow if power != 0 and explut = 0
  
  powercheck <= powerff(65 DOWNTO 55) - "1011000110";  -- 710
  
  -- level 4 in
  -- SII: level 19+2 out
  -- SIII/IV: level 17 out
  ppca: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO ranlatency LOOP
        rangeff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
       
         rangeff(1) <= bigexpff(2) OR NOT(powercheck(11));
		 -- exp(x) -> 0 or Inf, when abs(x)>=710 or has overflowed the left shifter
         FOR k IN 2 TO (ranlatency-1) LOOP
           rangeff(k) <= rangeff(k-1);
         END LOOP;
		 rangeff(ranlatency) <= rangeff(ranlatency-1) AND NOT(signff(ranlatency+3));
		 -- overflow only if input x is large and positive, exp(x) -> Inf
       
      END IF;
      
    END IF;
          
  END PROCESS;
  
  --***********************
  --*** TAYLOR's SERIES ***
  --***********************
  
  -- approximation : sequence = 1 + x + x^2/2 + x^3/6 + x^4/24
  -- but x^3/6 term is about 62 bits down, so just try 1 + x + x^2/2
  -- ('1' & zero) + (zero(21:1) & x(34:2)) + (zero(42:1) & square(72:61))
  
  fraction <= powerff(34 DOWNTO 1) & "00";
  
  -- level: 4 in, 7 out
  mulsqr: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>12,
               pipes=>3,device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>fraction,databb=>fraction,
            result=>xsquareterm);
 
  delfrac: fp_del
  GENERIC MAP (width=>33,pipes=>3)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>powerff(34 DOWNTO 2),
            cc=>xterm); 
            
  delthr: fp_del
  GENERIC MAP (width=>54,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>lutthrmanff,
            cc=>lutthrmandel); 
           
  -- level 8
  pta: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO 54 LOOP
        approxff(k) <= '0';
      END LOOP;
     
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        approxff <= ('1' & zerovec(20 DOWNTO 1) & xterm) + (zerovec(42 DOWNTO 1) & xsquareterm);
            
      END IF;
      
    END IF;
          
  END PROCESS;          

  --*************************************
  --*** MULTIPLY ALL EXP(X) SUBRANGES ***
  --*************************************
  
  -- SII level in 7, level out 12+speed
  -- SIII/IV level in 7, level out 11
  mulone: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>54,widthcc=>72,
               pipes=>mullatency,accuracy=>doubleaccuracy,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>lutonemanff,databb=>luttwomandelff,
            result=>resultone);
  
  -- SII level in 12+speed, level out 13+speed
  -- SIII/IV level in 11, level out 12        
  delone: fp_del
  GENERIC MAP (width=>54,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>resultone(72 DOWNTO 19),
            cc=>resultonedel); 
  
  -- SII level in 8, level out 13+speed
  -- SIII/IV level in 8, level out 12 
  multwo: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>54,widthcc=>72,
               pipes=>mullatency,accuracy=>doubleaccuracy,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>lutthrmandel,databb=>approxff,
            result=>resulttwo);
  
  -- SII level in 13+speed, level out 18+2*speed
  -- SIII/IV level in 12, level out 16   
  multhr: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>54,widthcc=>72,
               pipes=>mullatency,accuracy=>doubleaccuracy,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>resultonedel,databb=>resulttwo(72 DOWNTO 19),
            result=>resultthr);

  --************************
  --*** NORMALIZE OUTPUT ***
  --************************
              
  pns: PROCESS (resultthr)
  BEGIN
      
    CASE resultthr(72 DOWNTO 69) IS
      WHEN "0000" => normshift <= "11";
      WHEN "0001" => normshift <= "11";
      WHEN "0010" => normshift <= "10";
      WHEN "0011" => normshift <= "10";
      WHEN "0100" => normshift <= "01";
      WHEN "0101" => normshift <= "01";
      WHEN "0110" => normshift <= "01";
      WHEN "0111" => normshift <= "01";
      WHEN "1000" => normshift <= "00";
      WHEN "1001" => normshift <= "00";
      WHEN "1010" => normshift <= "00";
      WHEN "1011" => normshift <= "00";
      WHEN "1100" => normshift <= "00";
      WHEN "1101" => normshift <= "00";
      WHEN "1110" => normshift <= "00";
      WHEN "1111" => normshift <= "00";   
      WHEN others => normshift <= "00";
    END CASE;
        
  END PROCESS;
  
  pna: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO 54 LOOP
        manoutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        expoutff(k) <= '0';
      END LOOP;
     
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
         
        -- SII level in 18+2*doublespeed, level out 19+2*doublespeed
        -- SIII/IV level in 16, level out 17 
        FOR k IN 1 TO 54 LOOP
          manoutff(k) <= (resultthr(k+18) AND NOT(normshift(2)) AND NOT(normshift(1))) OR
                         (resultthr(k+17) AND NOT(normshift(2)) AND     normshift(1)) OR
                         (resultthr(k+16) AND     normshift(2)  AND NOT(normshift(1))) OR
                         (resultthr(k+15) AND     normshift(2)  AND     normshift(1));
        END LOOP;
		FOR k IN 1 TO 11 LOOP
          expoutff(k) <= expout(k) AND NOT(rangeff(ranlatency-1) AND signff(ranlatency+3));
		END LOOP;
        -- IEEE exponent field is set to zero when x = large negative, exp(x) -> 0
      END IF;
      
    END IF;
          
  END PROCESS; 
  expout <= expcalcff(ranlatency-4)(11 DOWNTO 1) - ("000000000" & normshift) + "00000000011";

  --***************
  --*** OUTPUTS ***
  --***************
  
  ccman <= manoutff;
  ccexp <= expoutff;
  rangeerror <= rangeff(ranlatency);
        
END rtl;

