
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
--***   SINGLE PRECISION LOG(e) - CORE            ***
--***                                             ***
--***   FP_LN_CORE.VHD                            ***
--***                                             ***
--***   Function: Single Precision LOG (LN) Core  ***
--***                                             ***
--***   22/02/08 ML                               ***
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
--*** Latency = 19                                ***
--***************************************************

ENTITY fp_ln_core IS 
GENERIC (synthesize : integer := 0);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aaman : IN STD_LOGIC_VECTOR (23 DOWNTO 1); 
      aaexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      
      ccman : OUT STD_LOGIC_VECTOR (24 DOWNTO 1);
      ccexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      ccsgn : OUT STD_LOGIC;
      zeroout : OUT STD_LOGIC
     );
END fp_ln_core;

ARCHITECTURE rtl OF fp_ln_core IS
    
  signal zerovec : STD_LOGIC_VECTOR (32 DOWNTO 1);
  -- input
  signal aamanff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal aaexpff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal aaexppos, aaexpneg : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal aaexpabs, aaexpabsff : STD_LOGIC_VECTOR (7 DOWNTO 1);
  -- range reduction
  signal lutpowaddff : STD_LOGIC_VECTOR (7 DOWNTO 1);
  signal lutoneaddff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal lutpowmanff, lutonemanff : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal lutpowexpff, lutoneexpff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal lutoneinvff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal lutpowmannode, lutonemannode : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal lutpowexpnode, lutoneexpnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal lutoneinvnode : STD_LOGIC_VECTOR (11 DOWNTO 1); 
  signal aanum, aanumdel : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal mulonenode : STD_LOGIC_VECTOR (35 DOWNTO 1);
  signal mulonenormff : STD_LOGIC_VECTOR (34 DOWNTO 1);    
  -- series
  signal squared : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal cubed : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal scaled : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal onethird : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal mulonedel : STD_LOGIC_VECTOR (26 DOWNTO 1);
  signal oneterm, twoterm, thrterm : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal seriesoneff, seriesonedelff, seriestwoff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal numtwo : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal exptwo : STD_LOGIC_VECTOR (8 DOWNTO 1);
  -- addition
  signal zeroone, zeropow : STD_LOGIC;
  signal numberone, numberonedel : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal numpow, numone : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal numpowsigned : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal exppow, expone : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal numpowone, numpowonedel : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal exppowone, exppowonedel : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal numsum : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal numsumabs : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal expsum : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal ccmannode : STD_LOGIC_VECTOR (24 DOWNTO 1);
  signal ccexpnode : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (18 DOWNTO 1);      

  component fp_lnlutpow
  PORT (
        add : IN STD_LOGIC_VECTOR (7 DOWNTO 1);
        logman : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        logexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1)
       );
  end component;
  
  component fp_lnlut8 
  PORT (
        add : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        inv : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        logman : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
        logexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1)
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
  
  component fp_lnadd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aaman : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        aaexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        bbman : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        bbexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);

	     ccman : OUT STD_LOGIC_VECTOR (32 DOWNTO 1);
	     ccexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1)
	   );
  end component;
  
  component fp_lnnorm
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inman : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        inexp : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
        outman : OUT STD_LOGIC_VECTOR (24 DOWNTO 1);
        outexp : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
        zero : OUT STD_LOGIC
       );
  end component;     
                 
BEGIN
  
  gza: FOR k IN 1 TO 32 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  --*******************
  --*** INPUT BLOCK ***
  --*******************
  
  ppin: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 23 LOOP
        aamanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        aaexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 7 LOOP
        aaexpabsff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
     
      IF (enable = '1') THEN       
      
        aamanff <= aaman;  -- level 1
        aaexpff <= aaexp;  -- level 1
      
        aaexpabsff <= aaexpabs;  -- level 2
      
      END IF;
 
    END IF;
    
  END PROCESS;
  
  aaexppos <= ('0' & aaexpff) - "001111111";
  aaexpneg <= "001111111" - ('0' & aaexpff);
  gaba: FOR k IN 1 TO 7 GENERATE
    aaexpabs(k) <= (aaexppos(k) AND NOT(aaexppos(9))) OR (aaexpneg(k) AND aaexppos(9));
  END GENERATE;
  
  --******************************************
  --*** RANGE REDUCTION THROUGH LUT SERIES ***
  --******************************************
    
  plut: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
       
      FOR k IN 1 TO 7 LOOP 
        lutpowaddff(k) <= '0'; 
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        lutoneaddff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 23 LOOP
        lutpowmanff(k) <= '0';
        lutonemanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 8 LOOP
        lutpowexpff(k) <= '0';
        lutoneexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        lutoneinvff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        lutpowaddff <= aaexpabsff;  -- level 3
        lutoneaddff <= aamanff(23 DOWNTO 16);  -- level 2
   
        lutpowmanff <= lutpowmannode;  -- level 4
        lutpowexpff <= lutpowexpnode; -- level 4
      
        lutoneinvff <= lutoneinvnode;  -- level 3
        lutonemanff <= lutonemannode;  -- level 3
        lutoneexpff <= lutoneexpnode; -- level 3
      
      END IF;
      
    END IF;
    
  END PROCESS;
  
  lutpow: fp_lnlutpow
  PORT MAP (add=>lutpowaddff,
            logman=>lutpowmannode,logexp=>lutpowexpnode);
              
  lutone: fp_lnlut8
  PORT MAP (add=>lutoneaddff,
            inv=>lutoneinvnode,logman=>lutonemannode,logexp=>lutoneexpnode);
  
  aanum <= '1' & aamanff;
  
  -- level 1 in, level 3 out
  delone: fp_del
  GENERIC MAP (width=>24,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aanum,cc=>aanumdel);
            
  --mulone <= aanum * invone; -- 24*11 = 35
  
  -- level 3 in, level 6 out
  mulone: fp_fxmul
  GENERIC MAP (widthaa=>24,widthbb=>11,widthcc=>35,
               pipes=>3,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>aanumdel,databb=>lutoneinvff,
            result=>mulonenode);

  pmna: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 34 LOOP
        mulonenormff(k) <= '0';
      END LOOP;
   
    ELSIF (rising_edge(sysclk)) THEN
     
      IF (enable = '1') THEN
        
        -- normalize in case input is 1.000000 and inv is 0.5  
        -- level 7
        FOR k IN 1 TO 34 LOOP
          mulonenormff(k) <= (mulonenode(k+1) AND mulonenode(35)) OR 
                             (mulonenode(k) AND NOT(mulonenode(35)));
        END LOOP;
         
      END IF;       
    END IF;
    
  END PROCESS;
  
  --***********************************************************
  --*** taylor series expansion of subrange (15 bits)       ***
  --*** x - x*x/2                                           ***
  --*** 7 leading bits, so x*x 7 bits down, +1 bit for 1/2  ***
  --***********************************************************
  
  --square <= mulonenorm(25 DOWNTO 8) * mulonenorm(25 DOWNTO 8);
  --cubed <= square(36 DOWNTO 19) * mulonenorm(25 DOWNTO 8);
  --cubedscale <= cubed(36 DOWNTO 19) * onethird;
  
  onethird <= "010101010101010101";
  
  -- level 7 in, level 9 out
  multwo: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>36,
               pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>mulonenormff(26 DOWNTO 9),databb=>mulonenormff(26 DOWNTO 9),
            result=>squared);
            
  -- level 7 in, level 9 out
  multhr: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>36,
               pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>mulonenormff(26 DOWNTO 9),databb=>onethird,
            result=>scaled); 
            
  -- level 9 in, level 11 out
  mulfor: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>36,
               pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>squared(36 DOWNTO 19),databb=>scaled(36 DOWNTO 19),
            result=>cubed);
                               
  oneterm <= mulonenormff(26 DOWNTO 1) & zerovec(6 DOWNTO 1);
  twoterm <= zerovec(7 DOWNTO 1) & squared(36 DOWNTO 12);
  thrterm <= zerovec(14 DOWNTO 1) & cubed(36 DOWNTO 19);
  
  --numtwo <= '0' & ((mulonenorm(25 DOWNTO 1) & zerovec(6 DOWNTO 1)) -
  --                 (zerovec(9 DOWNTO 1) & square(36 DOWNTO 15)) +
  --                 (zerovec(16 DOWNTO 1) & cubedscale(36 DOWNTO 22)));
  
  -- level 7 in, level 9 out
  deltwo: fp_del
  GENERIC MAP (width=>26,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>mulonenormff(26 DOWNTO 1),cc=>mulonedel);
            
  ptay: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 32 LOOP
        seriesoneff(k) <= '0';
        seriesonedelff(k) <= '0';
        seriestwoff(k) <= '0';
      END LOOP;
   
    ELSIF (rising_edge(sysclk)) THEN
     
      IF (enable = '1') THEN
        
        -- level 10
        seriesoneff <= (mulonedel & zerovec(6 DOWNTO 1)) -
                       (zerovec(8 DOWNTO 1) & squared(36 DOWNTO 13));
        seriesonedelff <= seriesoneff;
        -- level 12          
        seriestwoff <= seriesonedelff + (zerovec(14 DOWNTO 1) & cubed(36 DOWNTO 19));
         
      END IF;       

    END IF;
    
  END PROCESS;
            
  numtwo <= '0' & seriestwoff(32 DOWNTO 2);
  -- exponent for subrange 127-8 = 119              
  exptwo <= "01110111";
  
  --***********************************************************
  --*** add logarithm values                                ***
  --***********************************************************
  
  zeroone <= lutoneexpff(8) OR lutoneexpff(7) OR lutoneexpff(6) OR lutoneexpff(5) OR 
             lutoneexpff(4) OR lutoneexpff(3) OR lutoneexpff(2) OR lutoneexpff(1);
             
  numberone <= zeroone & lutonemanff & lutoneexpff;
  
  -- level 3 in, level 4 out
  delthr: fp_del
  GENERIC MAP (width=>32,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>numberone,cc=>numberonedel);
    
  numone <= '0' & numberonedel(32 DOWNTO 9) & zerovec(7 DOWNTO 1);
  expone <= numberonedel(8 DOWNTO 1);
          
  zeropow <= lutpowexpff(8) OR lutpowexpff(7) OR lutpowexpff(6) OR lutpowexpff(5) OR 
             lutpowexpff(4) OR lutpowexpff(3) OR lutpowexpff(2) OR lutpowexpff(1);
 
  numpow <= '0' & zeropow & lutpowmanff & zerovec(7 DOWNTO 1);
  exppow <= lutpowexpff;

  gmpz: FOR k IN 1 TO 32 GENERATE
    numpowsigned(k) <= numpow(k) XOR signff(3);
  END GENERATE;
  
  -- level 4 in, level 8 out
  addone: fp_lnadd
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aaman=>numpowsigned,aaexp=>exppow,
            bbman=>numone,bbexp=>expone,
            ccman=>numpowone,ccexp=>exppowone);
  
  -- level 8 in, level 12 out
  delfor: fp_del
  GENERIC MAP (width=>32,pipes=>4)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>numpowone,cc=>numpowonedel);
  delfiv: fp_del
  GENERIC MAP (width=>8,pipes=>4)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>exppowone,cc=>exppowonedel);
             
  -- level 12 in, level 16 out         
  addtwo: fp_lnadd
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aaman=>numpowonedel,aaexp=>exppowonedel,
            bbman=>numtwo,bbexp=>exptwo,
            ccman=>numsum,ccexp=>expsum);          
  
  gmsa: FOR k IN 1 TO 32 GENERATE
    numsumabs(k) <= numsum(k) XOR signff(15);
  END GENERATE;
  
  -- level 16 in, level 19 out
  norm: fp_lnnorm
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            inman=>numsumabs,inexp=>expsum,
            outman=>ccmannode,outexp=>ccexpnode,
            zero=>zeroout);
  
  psgna: PROCESS (sysclk)
  BEGIN
      
    IF (reset = '1') THEN
      FOR k IN 1 TO 18 LOOP
        signff(k) <= '0';
      END LOOP;
    ELSIF (rising_edge(sysclk)) THEN
      signff(1) <= aaexppos(9);
      FOR k IN 2 TO 18 LOOP
        signff(k) <= signff(k-1);
      END LOOP;    
    END IF;
    
  END PROCESS;
      
  ccsgn <= signff(18);
  ccman <= ccmannode;
  ccexp <= ccexpnode;
          
END rtl;

