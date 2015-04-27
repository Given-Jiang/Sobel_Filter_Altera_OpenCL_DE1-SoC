
-- (C) 1992-2014 Altera Corporation. All rights reserved.                         
-- Your use of Altera Corporation's design tools, logic functions and other       
-- software and tools, and its AMPP partner logic functions, and any output       
-- files any of the foregoing (including device programming or simulation         
-- files), and any associated documentation or information are expressly subject  
-- to the terms and conditions of the Altera Program License Subscription         
-- Agreement, Altera MegaCore Function License Agreement, or other applicable     
-- license agreement, including, without limitation, that your use is for the     
-- sole purpose of programming logic devices manufactured by Altera and sold by   
-- Altera or its authorized distributors.  Please refer to the applicable         
-- agreement for further details.                                                 
    



LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all;

--***************************************************
--***                                             ***
--***   SINGLE PRECISION EXPONENT(e) - CORE       ***
--***                                             ***
--***   FP_EXP_CORE.VHD                           ***
--***                                             ***
--***   Function: Single Precision Exponent Core  ***
--***                                             ***
--***   18/02/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** Latency = 14                                ***
--***************************************************

ENTITY fp_exp_core IS
GENERIC (synthesize : integer := 1);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aasgn : IN STD_LOGIC;
      aaman : IN STD_LOGIC_VECTOR (23 DOWNTO 1);
      aaexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      
      ccman : OUT STD_LOGIC_VECTOR (24 DOWNTO 1); -- includes round bit
      ccexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      rangeerror : OUT STD_LOGIC
     );
END fp_exp_core;

ARCHITECTURE rtl OF fp_exp_core IS

  -- latency 14
  
  type expcalcfftype IS ARRAY (6 DOWNTO 1) OF STD_LOGIC_VECTOR (8 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (32 DOWNTO 1);
  -- INPUT AND SHIFT STAGE
  signal signff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal aamanff, aamandelff : STD_LOGIC_VECTOR (23 DOWNTO 1); 
  signal aaexpff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal selshiftff : STD_LOGIC_VECTOR (2 DOWNTO 1); 
  signal leftshift, rightshift : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal leftshiftff, rightshiftff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal leftff, rightff : STD_LOGIC_VECTOR (32 DOWNTO 1); 
  signal powerff : STD_LOGIC_VECTOR (7 DOWNTO 1);
  signal fractionalff : STD_LOGIC_VECTOR (25 DOWNTO 1); 
  signal powerbus : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal decimalleft, decimalright : STD_LOGIC_VECTOR (7 DOWNTO 1);
  signal fractionalleft, fractionalright : STD_LOGIC_VECTOR (25 DOWNTO 1); 
  signal leftone, rightone : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal lefttwo, righttwo : STD_LOGIC_VECTOR (32 DOWNTO 1);
  -- TABLE STAGE
  signal addlutposff, addlutnegff : STD_LOGIC_VECTOR (7 DOWNTO 1);
  signal addlutoneff : STD_LOGIC_VECTOR (7 DOWNTO 1);  
  signal lutposmanff, lutnegmanff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal lutonemanff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal lutposexpff, lutnegexpff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal lutoneexpff : STD_LOGIC;
  signal manpos, manneg, manone : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal exppos, expneg : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal expone : STD_LOGIC;
  signal lutmanpowerff, lutmanfractionalff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal lutexppowerff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal lutexpfractionalff : STD_LOGIC; 
  signal expcalcff : expcalcfftype;
  signal manpowernode, manfractionalnode : STD_LOGIC_VECTOR (32 DOWNTO 1);
  -- MULTIPLY STAGE
  signal manmultone, manmulttwo : STD_LOGIC_VECTOR (32 DOWNTO 1);
  -- RANGE
  signal powercheck : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal rangeff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  -- SERIES STAGE
  signal squareterm : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal scaleterm : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal onesixth : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal cubedterm : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal xtermnode, xterm : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal xxterm, xxxterm : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal seriesoneff, seriesoneterm : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal seriestwoff, seriesterm : STD_LOGIC_VECTOR (32 DOWNTO 1);
  -- NORMALIZE
  signal normshift : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal mantissaoutff : STD_LOGIC_VECTOR (25 DOWNTO 1);
  signal exponentoutff : STD_LOGIC_VECTOR (8 DOWNTO 1);     

  component fp_explutpos 
  PORT (
        address : IN STD_LOGIC_VECTOR (7 DOWNTO 1);
        mantissa : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        exponent : OUT STD_LOGIC_VECTOR (8 DOWNTO 1)
       );
  end component;
  
  component fp_explutneg 
  PORT (
        address : IN STD_LOGIC_VECTOR (7 DOWNTO 1);
        mantissa : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        exponent : OUT STD_LOGIC_VECTOR (8 DOWNTO 1)
       );
  end component;
  
  component fp_explut7
  PORT (
        address : IN STD_LOGIC_VECTOR (7 DOWNTO 1);
        mantissa : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        exponent : OUT STD_LOGIC
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
    
  gza: FOR k IN 1 TO 32 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pin: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
    
      FOR k IN 1 TO 6 LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 23 LOOP 
        aamanff(k) <= '0';
        aamandelff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        aaexpff(k) <= '0';
      END LOOP;
      selshiftff <= "00";
      leftshiftff <= "000";
      rightshiftff <= "000";
      FOR k IN 1 TO 32 LOOP
        leftff(k) <= '0';
        rightff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 7 LOOP
        powerff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 25 LOOP
        fractionalff(k) <= '0';
      END LOOP;
     
    ELSIF (rising_edge(sysclk)) THEN
    
      IF (enable = '1') THEN
      
        signff(1) <= aasgn;
        FOR k IN 2 TO 6 LOOP
          signff(k) <= signff(k-1);
        END LOOP;
    
        aamanff <= aaman;  -- level 1
        aamandelff <= aamanff; -- level 2
        
        aaexpff <= aaexp;
    
        selshiftff(1) <= leftshift(9); -- level 2
        selshiftff(2) <= selshiftff(1); -- level 3
            
        leftshiftff <= leftshift(3 DOWNTO 1); -- level 2
        rightshiftff <= rightshift(3 DOWNTO 1); -- level 2
        
        leftff <= lefttwo; -- level 3
        rightff <= righttwo; -- level 3
        
        -- level 4
        FOR k IN 1 TO 7 LOOP
          powerff(k) <= (decimalleft(k) AND NOT(selshiftff(2))) OR
                        (decimalright(k) AND selshiftff(2));
        END LOOP;
        FOR k IN 1 TO 25 LOOP
          fractionalff(k) <= (fractionalleft(k) AND NOT(selshiftff(2))) OR
                             (fractionalright(k) AND selshiftff(2));
        END LOOP;
        
      END IF;
    
    END IF;    
      
  END PROCESS;

  leftshift <= ('0' & aaexpff) - "001111111"; 
  rightshift <= "001111111" - ('0' & aaexpff); 
        
  powerbus <= "0000001" & aamandelff & "00";
  
  decimalleft <= leftff(32 DOWNTO 26) +  ("000000" & signff(3));
  decimalright <= rightff(32 DOWNTO 26) +  ("000000" & signff(3));
  gfa: FOR k IN 1 TO 25 GENERATE
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
                (powerbus(2)     AND NOT(leftshiftff(2)) AND NOT(leftshiftff(1))) OR
                (powerbus(1)     AND     leftshiftff(2)  AND NOT(leftshiftff(1))); 
  gla: FOR k IN 4 TO 32 GENERATE
    leftone(k) <= (powerbus(k)   AND NOT(leftshiftff(2)) AND NOT(leftshiftff(1))) OR
                  (powerbus(k-1) AND NOT(leftshiftff(2)) AND     leftshiftff(1)) OR
                  (powerbus(k-2) AND     leftshiftff(2)  AND NOT(leftshiftff(1))) OR
                  (powerbus(k-3) AND     leftshiftff(2)  AND     leftshiftff(1));
  END GENERATE;
             
  glb: FOR k IN 1 TO 4 GENERATE
    lefttwo(k) <=  leftone(k)    AND NOT(leftshiftff(3));
  END GENERATE;
  glc: FOR k IN 5 TO 32 GENERATE
    lefttwo(k) <= (leftone(k)    AND NOT(leftshiftff(3))) OR
                  (leftone(k-4)  AND     leftshiftff(3)); 
  END GENERATE;
 
  gra: FOR k IN 1 TO 29 GENERATE
    rightone(k) <= (powerbus(k)   AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1))) OR
                   (powerbus(k+1) AND NOT(rightshiftff(2)) AND     rightshiftff(1)) OR
                   (powerbus(k+2) AND     rightshiftff(2)  AND NOT(rightshiftff(1))) OR
                   (powerbus(k+3) AND     rightshiftff(2)  AND     rightshiftff(1));
  END GENERATE;
  rightone(30) <= (powerbus(30) AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1))) OR
                  (powerbus(31) AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1))) OR
                  (powerbus(32) AND     rightshiftff(2)  AND NOT(rightshiftff(1))); 
  rightone(31) <= (powerbus(31) AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1))) OR
                  (powerbus(32) AND NOT(rightshiftff(2)) AND     rightshiftff(1));
  rightone(32) <=  powerbus(32) AND NOT(rightshiftff(2)) AND NOT(rightshiftff(1));
  
  grb: FOR k IN 1 TO 28 GENERATE
    righttwo(k) <= (rightone(k)    AND NOT(rightshiftff(3))) OR
                   (rightone(k+4)  AND     rightshiftff(3));
  END GENERATE;
  grc: FOR k IN 29 TO 32 GENERATE
    righttwo(k) <= (rightone(k)   AND NOT(rightshiftff(3)));
  END GENERATE;
  
  --******************************************
  --*** TABLES - NO RESET, FORCE TO MEMORY ***
  --******************************************
  
  -- level: 4 in, 6 out
  pla: PROCESS (sysclk)
  BEGIN
  
    IF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        addlutposff <= powerff;
        addlutnegff <= powerff;
        addlutoneff <= fractionalff(25 DOWNTO 19);
      
        lutposmanff <= manpos;
        lutposexpff <= exppos;
        lutnegmanff <= manneg;
        lutnegexpff <= expneg;
        lutonemanff <= manone;
        lutoneexpff <= expone;
            
      END IF;
      
    END IF;
  
  END PROCESS;
 
  declut: fp_explutpos
  PORT MAP (address=>addlutposff,
            mantissa=>manpos,exponent=>exppos);
            
  neglut: fp_explutneg
  PORT MAP (address=>addlutnegff,
            mantissa=>manneg,exponent=>expneg);
                     
  fraclut: fp_explut7
  PORT MAP (address=>addlutoneff,
            mantissa=>manone,exponent=>expone);
  
  -- level: 6 in, 7 out
  pma: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO 23 LOOP
        lutmanpowerff(k) <= '0';
        lutmanfractionalff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        lutexppowerff(k) <= '0';
      END LOOP;
      lutexpfractionalff <= '0';
      
      FOR k IN 1 TO 6 LOOP
        expcalcff(k)(8 DOWNTO 1) <= "00000000";
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        FOR k IN 1 TO 23 LOOP
          lutmanpowerff(k) <= (lutposmanff(k) AND NOT(signff(6))) OR (lutnegmanff(k) AND signff(6));
        END LOOP;
        lutmanfractionalff <= lutonemanff;
        FOR k IN 1 TO 8 LOOP
          lutexppowerff(k) <= (lutposexpff(k) AND NOT(signff(6))) OR (lutnegexpff(k) AND signff(6));
        END LOOP;
        lutexpfractionalff <= lutoneexpff;
        
        -- level: 7 in, 13 out
        expcalcff(1)(8 DOWNTO 1) <= lutexppowerff + ("0000000" & lutexpfractionalff);
        FOR k IN 2 TO 6 LOOP
          expcalcff(k)(8 DOWNTO 1) <= expcalcff(k-1)(8 DOWNTO 1);
        END LOOP;
            
      END IF;
      
    END IF;
          
  END PROCESS;  
  
  manpowernode(32) <= '1';
  manpowernode(31 DOWNTO 9) <= lutmanpowerff;
  manpowernode(8 DOWNTO 1) <= "00000000";
 
  manfractionalnode(32) <= '1';
  manfractionalnode(31 DOWNTO 9) <= lutmanfractionalff;
  manfractionalnode(8 DOWNTO 1) <= "00000000"; 
  
  --*************************************
  --*** MULTIPLY ALL EXP(X) SUBRANGES ***
  --*************************************
  
  -- level 7 in, 10 out
  mulone: fp_fxmul
  GENERIC MAP (widthaa=>32,widthbb=>32,widthcc=>32,
               pipes=>3,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>manpowernode,databb=>manfractionalnode,
            result=>manmultone);

  -- level 10 in, 13 out
  multwo: fp_fxmul
  GENERIC MAP (widthaa=>32,widthbb=>32,widthcc=>32,
               pipes=>3,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>manmultone,databb=>seriesterm,
            result=>manmulttwo);
            
  --**************************************
  --*** PREDICT OVERFLOW AND UNDERFLOW ***
  --**************************************
  
  -- overflow or underflow if power > 88
  -- overflow or underflow if power != 0 and explut = 0
  
  powercheck <= ('0' & powerff) - "01011001";  -- 89
  
  -- level 4 in, level 14 out
  ppca: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO 10 LOOP
        rangeff(k) <= '0';
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
       
         rangeff(1) <= NOT(powercheck(8));
         FOR k IN 2 TO 10 LOOP
           rangeff(k) <= rangeff(k-1);
         END LOOP;
       
      END IF;
      
    END IF;
          
  END PROCESS;
  
  --***********************
  --*** TAYLOR's SERIES ***
  --***********************
  
  --*** calculate lowest 18 bits ***
  -- sequence is 1 + x + x^2/2 + x^3/6 + x^4/24
  -- x*x/2 term is (7+7+1=15 bits down)
  -- x*x*x/6 is (7+7+7+2=23 bits) down
  
  -- level 4 in, 6 out
  mulsqr: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>18,
               pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>fractionalff(18 DOWNTO 1),
            databb=>fractionalff(18 DOWNTO 1),
            result=>squareterm);  
  
  -- level 4 in, 6 out
  mulscl: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>18,
               pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>fractionalff(18 DOWNTO 1),
            databb=>onesixth,
            result=>scaleterm); 
                      
  onesixth <= "001010101010101011";
  
  -- level 6 in, 8 out
  mulcub: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>18,
               pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>squareterm,
            databb=>scaleterm,
            result=>cubedterm);
       
  xtermnode <= "10000000" & fractionalff(18 DOWNTO 1) & "000000"; -- '1' + x term   
  xxterm <= (zerovec(16 DOWNTO 1) & squareterm(18 DOWNTO 3));
  xxxterm <= (zerovec(22 DOWNTO 1) & cubedterm(18 DOWNTO 9));
  
  -- level 4 in, level 6 out
  delone: fp_del
  GENERIC MAP (width=>32,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>xtermnode,cc=>xterm);
            
  -- level 7 in, level 8 out
  deltwo: fp_del
  GENERIC MAP (width=>32,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>seriesoneff,cc=>seriesoneterm);
    
  ptsa: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO 32 LOOP
        seriesoneff(k) <= '0';
        seriestwoff(k) <= '0';
      END LOOP;
 
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        seriesoneff <= xterm + xxterm; -- level 7
        seriestwoff <= seriesoneterm + xxxterm; -- level 9
             
      END IF;
      
    END IF;
          
  END PROCESS;            
  
  -- level 9 in, level 10 out
  delthr: fp_del
  GENERIC MAP (width=>32,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>seriestwoff,cc=>seriesterm);
                      
  --square <= powerfractional(18 DOWNTO 1) * powerfractional(18 DOWNTO 1);
  --scaleterm <= powerfractional(18 DOWNTO 1) * onesixth;
  --onesixth <= "001010101010101011";
  --cubedterm <= square(36 DOWNTO 19) * scaleterm(36 DOWNTO 19);
  --manseries <= ('1' & zerovec(31 DOWNTO 1)) +  -- 1 term
  --             (zerovec(8 DOWNTO 1) & powerfractional(18 DOWNTO 1) & zerovec(6 DOWNTO 1)) + -- x term
  --             (zerovec(16 DOWNTO 1) & square(36 DOWNTO 21)) + 
  --             (zerovec(22 DOWNTO 1) & cubedterm(36 DOWNTO 27));
  --xterm <= (zerovec(7 DOWNTO 1) & powerfractional(18 DOWNTO 1) & zerovec(7 DOWNTO 1));
  --xxterm <= (zerovec(15 DOWNTO 1) & square(36 DOWNTO 20));
  --xxxterm <= (zerovec(21 DOWNTO 1) & cubedterm(36 DOWNTO 26));
  
  --************************
  --*** NORMALIZE OUTPUT ***
  --************************
   
  pns: PROCESS (manmulttwo)
  BEGIN
      
    CASE manmulttwo(32 DOWNTO 30) IS
      WHEN "000" => normshift <= "11";
      WHEN "001" => normshift <= "10";
      WHEN "010" => normshift <= "01";
      WHEN "011" => normshift <= "01";
      WHEN "100" => normshift <= "00";
      WHEN "101" => normshift <= "00";
      WHEN "110" => normshift <= "00";
      WHEN "111" => normshift <= "00"; 
      WHEN others => normshift <= "00";
    END CASE;
        
  END PROCESS;
  
  pna: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
    
      FOR k IN 1 TO 25 LOOP
        mantissaoutff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        exponentoutff(k) <= '0';
      END LOOP;
        
 
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        FOR k IN 1 TO 25 LOOP
          mantissaoutff(k) <= (manmulttwo(k+7) AND NOT(normshift(2)) AND NOT(normshift(1))) OR
                              (manmulttwo(k+6) AND NOT(normshift(2)) AND     normshift(1)) OR
                              (manmulttwo(k+5) AND     normshift(2)  AND NOT(normshift(1))) OR
                              (manmulttwo(k+4) AND     normshift(2)  AND     normshift(1));
        END LOOP;
        -- correction factor of 2 due to two multiplications (double has 3)
        exponentoutff <= expcalcff(6)(8 DOWNTO 1) - ("000000" & normshift) + "00000010";
             
      END IF;
      
    END IF;
          
  END PROCESS; 

  --**************
  --*** OUTPUT ***
  --**************
  
  ccman <= mantissaoutff(24 DOWNTO 1);
  ccexp <= exponentoutff;
  rangeerror <= rangeff(10);
        
END rtl;

