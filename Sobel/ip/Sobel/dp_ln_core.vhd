
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION LOG(e) - CORE            ***
--***                                             ***
--***   DP_LN_CORE.VHD                            ***
--***                                             ***
--***   Function: Double Precision LOG (LN) Core  ***
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
--*** SII/SIII/SIV Latency = 26 + 7*doublespeed   ***
--*** no 54x54 multipliers                        ***
--***************************************************

ENTITY dp_ln_core IS 
GENERIC (
         doublespeed : integer := 0; -- 0/1
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1 -- 0/1       
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aaman : IN STD_LOGIC_VECTOR (52 DOWNTO 1); 
      aaexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      
      ccman : OUT STD_LOGIC_VECTOR (53 DOWNTO 1);
      ccexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      ccsgn : OUT STD_LOGIC;
      zeroout : OUT STD_LOGIC
     );
END dp_ln_core;

ARCHITECTURE rtl OF dp_ln_core IS

  signal zerovec : STD_LOGIC_VECTOR (64 DOWNTO 1);
  --*** INPUT BLOCK ***
  signal aamanff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal aaexpff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal aaexpabsff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aaexppos, aaexpneg : STD_LOGIC_VECTOR (12 DOWNTO 1);
  signal aaexpabs : STD_LOGIC_VECTOR (10 DOWNTO 1);
  --*** TABLES ***
  signal lutpowaddff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal lutoneaddff, luttwoaddff : STD_LOGIC_VECTOR (9 DOWNTO 1);
  signal lutpowmanff, lutonemanff, luttwomanff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal lutpowexpff, lutoneexpff, luttwoexpff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal lutoneinvff : STD_LOGIC_VECTOR (12 DOWNTO 1); 
  signal luttwoinvff : STD_LOGIC_VECTOR (18 DOWNTO 1);  
  signal lutpowmannode, lutonemannode, luttwomannode : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal lutpowexpnode, lutoneexpnode, luttwoexpnode : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal lutoneinvnode : STD_LOGIC_VECTOR (12 DOWNTO 1); 
  signal luttwoinvnode : STD_LOGIC_VECTOR (18 DOWNTO 1);   
  signal aanum, aanumdel : STD_LOGIC_VECTOR (54 DOWNTO 1); 
  signal invonenum : STD_LOGIC_VECTOR (18 DOWNTO 1); 
  signal mulonenode : STD_LOGIC_VECTOR (65 DOWNTO 1);
  signal mulonenormff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal mulonenumdel : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal multwonode : STD_LOGIC_VECTOR (72 DOWNTO 1); 
  signal multwonormff : STD_LOGIC_VECTOR (71 DOWNTO 1);
  --*** SERIES ***
  signal squaredterm : STD_LOGIC_VECTOR (48 DOWNTO 1);
  signal onethird : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal scaledterm, scaledtermdel : STD_LOGIC_VECTOR (18 DOWNTO 1);
  signal cubedterm : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal xtermdel : STD_LOGIC_VECTOR (54 DOWNTO 1);   
  signal oneterm, twoterm, thrterm : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal oneplustwoterm : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal seriesterm : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal mantissaseries : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentseries : STD_LOGIC_VECTOR (11 DOWNTO 1);          
  --*** ADD LOGS ***
  signal zeropow, zeroone, zerotwo : STD_LOGIC;
  signal mantissapowernode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal mantissapower : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentpower : STD_LOGIC_VECTOR (11 DOWNTO 1); 
  signal numberone, numberonedel : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal mantissaone : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentone : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal mantissaaddone : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentaddone : STD_LOGIC_VECTOR (11 DOWNTO 1); 
  signal mantissatwo : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponenttwo : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal numbertwo, numbertwodel : STD_LOGIC_VECTOR (75 DOWNTO 1);
  signal mantissaaddtwo : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentaddtwo : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal numberthr, numberthrdel : STD_LOGIC_VECTOR (75 DOWNTO 1);
  signal mantissasum : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal mantissasumabs : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentsum : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal mantissanorm : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal exponentnorm : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal zeronorm : STD_LOGIC;
  signal signff : STD_LOGIC_VECTOR (25+7*doublespeed DOWNTO 1);
  
  component dp_lnlutpow
  PORT (
        add : IN STD_LOGIC_VECTOR (10 DOWNTO 1);
        logman : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        logexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1)
       );
  end component;
  
  component dp_lnlut9
  PORT (
        add : IN STD_LOGIC_VECTOR (9 DOWNTO 1);
        inv : OUT STD_LOGIC_VECTOR (12 DOWNTO 1);
        logman : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        logexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1)
       );
  end component;

  component dp_lnlut18
  PORT (
        add : IN STD_LOGIC_VECTOR (9 DOWNTO 1);
        inv : OUT STD_LOGIC_VECTOR (18 DOWNTO 1);
        logman : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        logexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1)
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
  
  component dp_fxsub
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
        borrowin : IN STD_LOGIC;
      
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
   
  component dp_lnadd
  GENERIC (
           speed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          ); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aaman : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        aaexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
        bbman : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        bbexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);

	     ccman : OUT STD_LOGIC_VECTOR (64 DOWNTO 1);
	     ccexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1)
	   );
	end component;
	
  component dp_lnnorm
  GENERIC (
           speed : integer := 1
          ); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inman : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        inexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      
        outman : OUT STD_LOGIC_VECTOR (64 DOWNTO 1);
        outexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        zero : OUT STD_LOGIC
      );	
  end component;
                  
BEGIN
  
  gza: FOR k IN 1 TO 64 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  --*******************
  --*** INPUT BLOCK ***
  --*******************
  
  ppin: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 52 LOOP
        aamanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        aaexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 10 LOOP
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
  
  aaexppos <= ('0' & aaexpff) - "001111111111";
  aaexpneg <= "001111111111" - ('0' & aaexpff);
  gaba: FOR k IN 1 TO 10 GENERATE
    aaexpabs(k) <= (aaexppos(k) AND NOT(aaexppos(12))) OR (aaexpneg(k) AND aaexppos(12));
  END GENERATE;

  --******************************************
  --*** RANGE REDUCTION THROUGH LUT SERIES ***
  --******************************************
    
  plut: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
       
      FOR k IN 1 TO 10 LOOP 
        lutpowaddff(k) <= '0'; 
      END LOOP;
      FOR k IN 1 TO 9 LOOP
        lutoneaddff(k) <= '0';
        luttwoaddff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 52 LOOP
        lutpowmanff(k) <= '0';
        lutonemanff(k) <= '0';
        luttwomanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        lutpowexpff(k) <= '0';
        lutoneexpff(k) <= '0';
        luttwoexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 12 LOOP
        lutoneinvff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 18 LOOP
        luttwoinvff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        lutpowaddff <= aaexpabsff;  -- level 3
        lutoneaddff <= aamanff(52 DOWNTO 44);  -- level 2
        luttwoaddff <= mulonenormff(55 DOWNTO 47);  -- level 8+speed
      
        lutpowmanff <= lutpowmannode;  -- level 4
        lutpowexpff <= lutpowexpnode; -- level 4
      
        lutoneinvff <= lutoneinvnode;  -- level 3
        lutonemanff <= lutonemannode;  -- level 3
        lutoneexpff <= lutoneexpnode; -- level 3
      
        luttwoinvff <= luttwoinvnode;  -- level 9+speed
        luttwomanff <= luttwomannode;  -- level 9+speed
        luttwoexpff <= luttwoexpnode; -- level 9+speed
      
      END IF;
      
    END IF;
    
  END PROCESS;
  
  lutpow: dp_lnlutpow
  PORT MAP (add=>lutpowaddff,
            logman=>lutpowmannode,logexp=>lutpowexpnode);

  lutone: dp_lnlut9
  PORT MAP (add=>lutoneaddff,
            inv=>lutoneinvnode,logman=>lutonemannode,logexp=>lutoneexpnode);
 
  luttwo: dp_lnlut18
  PORT MAP (add=>luttwoaddff,
            inv=>luttwoinvnode,logman=>luttwomannode,logexp=>luttwoexpnode);
           
  aanum <= '1' & aamanff & '0'; 
  
  -- level 1 in, level 3 out
  delone: fp_del
  GENERIC MAP (width=>54,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aanum,cc=>aanumdel);
   
  invonenum <= lutoneinvff & "000000";
  
  --mulone <= aanum * invone; -- 53*12 = 65
  
  -- level 3 in, level 6+doublespeed out
  mulone: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>18,widthcc=>65,
               pipes=>3+doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>aanumdel,databb=>invonenum,
            result=>mulonenode);

  --multwo <= mulonenorm(64 DOWNTO 11) * invtwo;  -- 54x18=72
  
  -- level 7+speed in, level 9+speed out
  deltwo: fp_del
  GENERIC MAP (width=>54,pipes=>2)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>mulonenormff(64 DOWNTO 11),cc=>mulonenumdel);
  
  -- level 9+doublespeed in, level 12+2*doublespeed out
  multwo: fp_fxmul
  GENERIC MAP (widthaa=>54,widthbb=>18,widthcc=>72,
               pipes=>3+doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>mulonenumdel,databb=>luttwoinvff,
            result=>multwonode);

  pmna: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 64 LOOP
        mulonenormff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 71 LOOP
        multwonormff(k) <= '0';
      END LOOP;
   
    ELSIF (rising_edge(sysclk)) THEN
     
      IF (enable = '1') THEN
        
        -- normalize in case input is 1.000000 and inv is 0.5  
        -- level 7+speed
        FOR k IN 1 TO 64 LOOP
          mulonenormff(k) <= (mulonenode(k+1) AND mulonenode(65)) OR 
                             (mulonenode(k) AND NOT(mulonenode(65)));
        END LOOP;
        -- level 13+2*speed
        FOR k IN 1 TO 71 LOOP
          multwonormff(k) <= (multwonode(k+1) AND multwonode(72)) OR 
                             (multwonode(k) AND NOT(multwonode(72)));
        END LOOP;
         
      END IF;       
    END IF;
    
  END PROCESS;  
           
  --************************************
  --*** TAYLOR SERIES OF SMALL RANGE ***
  --************************************
  
  -- taylor series expansion of subrange (36 bits)
  -- x - x*x/2
  -- 16 leading bits, so x*x 16 bits down, +1 bit for 1/2
  -- 36 lower bits in multwo(54:19)
  
  --square <= multwonorm(54 DOWNTO 19) * multwonorm(54 DOWNTO 19);
  
  -- level 13+2*doublespeed in, 16+2*doublespeed out
  multhr: fp_fxmul
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>48,
               pipes=>3,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>multwonormff(54 DOWNTO 19),databb=>multwonormff(54 DOWNTO 19),
            result=>squaredterm);
  
  onethird <= "010101010101010101";
            
  -- level 13+2*doublespeed in, level 15+2*doublespeed out
  mulfor: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>18,
               pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>multwonormff(54 DOWNTO 37),databb=>onethird,
            result=>scaledterm);
  
  --level 15+2*doublespeed in, level 16+2*doublespeed out
  delthr: fp_del
  GENERIC MAP (width=>18,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>scaledterm,cc=>scaledtermdel);
            
  -- level 16+2*doublespeed in, level 18+2*doublespeed out
  mulfiv: fp_fxmul
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>32,
               pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>squaredterm(48 DOWNTO 31),databb=>scaledtermdel,
            result=>cubedterm);
            
  --level 13+2*doublespeed in, level 16+2*doublespeed out
  delfor: fp_del
  GENERIC MAP (width=>54,pipes=>3)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>multwonormff(54 DOWNTO 1),cc=>xtermdel); 
   
  -- level 16+2*doublespeed         
  oneterm <= xtermdel & zerovec(10 DOWNTO 1);
  twoterm <= zerovec(17 DOWNTO 1) & squaredterm(48 DOWNTO 2); -- x*x/2
  -- level 18+2*doublespeed
  thrterm <= zerovec(32 DOWNTO 1) & cubedterm;
  
  --level 16+2*doublespeed in, level 18+2*doublespeed out
  tayone: dp_fxsub
  GENERIC MAP (width=>64,pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>oneterm,bb=>twoterm,borrowin=>'1',
            cc=>oneplustwoterm); 
  
  --level 18+2*doublespeed in, level 19+3*doublespeed out
  taytwo: dp_fxadd
  GENERIC MAP (width=>64,pipes=>1+doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>oneplustwoterm,bb=>thrterm,carryin=>'0',
            cc=>seriesterm); 
            
  --mantissaseries <= seriesterm;
  mantissaseries <= '0' & seriesterm(64 DOWNTO 2);
  exponentseries <= conv_std_logic_vector (1006,11); 
            
  --18x18
  --cubed <= square(72 DOWNTO 55) * multwonorm(54 DOWNTO 37);
  --cubedscale <= cubed(36 DOWNTO 19) * onethird;
  
  --**************************
  --*** ADD ALL LOGARITHMS ***
  --**************************
  
  zeropow <= lutpowexpff(11) OR lutpowexpff(10) OR lutpowexpff(9) OR 
             lutpowexpff(8) OR lutpowexpff(7) OR lutpowexpff(6) OR 
             lutpowexpff(5) OR lutpowexpff(4) OR lutpowexpff(3) OR 
             lutpowexpff(2) OR lutpowexpff(1);
             
  -- level 4
  --mantissapower <= zeropow & lutpowmanff & zerovec(11 DOWNTO 1);
  --mantissapower <= '0' & zeropow & lutpowmanff & zerovec(10 DOWNTO 1);
  mantissapowernode <= '0' & zeropow & lutpowmanff & zerovec(10 DOWNTO 1);
  gmpz: FOR k IN 1 TO 64 GENERATE
    mantissapower(k) <= mantissapowernode(k) XOR signff(3);
  END GENERATE;
  exponentpower <= lutpowexpff;
  
  zeroone <= lutoneexpff(11) OR lutoneexpff(10) OR lutoneexpff(9) OR 
             lutoneexpff(8) OR lutoneexpff(7) OR lutoneexpff(6) OR 
             lutoneexpff(5) OR lutoneexpff(4) OR lutoneexpff(3) OR 
             lutoneexpff(2) OR lutoneexpff(1);
             
  -- level 3
  numberone <= zeroone & lutonemanff & lutoneexpff;
  
  -- level 3 in, level 4 out
  delfiv: fp_del
  GENERIC MAP (width=>64,pipes=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>numberone,cc=>numberonedel);
            
  --mantissaone <= numberonedel(64 DOWNTO 12) & zerovec(11 DOWNTO 1);
  mantissaone <= '0' & numberonedel(64 DOWNTO 12) & zerovec(10 DOWNTO 1);
  exponentone <= numberonedel(11 DOWNTO 1); 
  
  -- level 4 in, level 10 out
  addone: dp_lnadd
  GENERIC MAP (speed=>1,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aaman=>mantissapower,aaexp=>exponentpower,
            bbman=>mantissaone,bbexp=>exponentone,
            ccman=>mantissaaddone,ccexp=>exponentaddone);
           
  zerotwo <= luttwoexpff(11) OR luttwoexpff(10) OR luttwoexpff(9) OR 
             luttwoexpff(8) OR luttwoexpff(7) OR luttwoexpff(6) OR 
             luttwoexpff(5) OR luttwoexpff(4) OR luttwoexpff(3) OR 
             luttwoexpff(2) OR luttwoexpff(1);
             
  -- level 9+doublespeed
  --mantissatwo <= zerotwo & luttwomanff & zerovec(11 DOWNTO 1);
  mantissatwo <= '0' & zerotwo & luttwomanff & zerovec(10 DOWNTO 1);
  exponenttwo <= luttwoexpff;

  numbertwo <= mantissatwo & exponenttwo;
    
  gasa: IF (doublespeed = 0) GENERATE
    delsix: fp_del
    GENERIC MAP (width=>75,pipes=>1)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>numbertwo,cc=>numbertwodel);
  END GENERATE;
  gasb: IF (doublespeed = 1) GENERATE
    numbertwodel <= numbertwo;
  END GENERATE;

  -- level 10 in, level 16 out
  addtwo: dp_lnadd
  GENERIC MAP (speed=>1,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aaman=>mantissaaddone,aaexp=>exponentaddone,
            bbman=>numbertwodel(75 DOWNTO 12),bbexp=>numbertwodel(11 DOWNTO 1),
            ccman=>mantissaaddtwo,ccexp=>exponentaddtwo);
            
  numberthr <= mantissaaddtwo & exponentaddtwo;

  -- level 16 in, level 19+3*doublespeed out
  delsev: fp_del
  GENERIC MAP (width=>75,pipes=>3+3*doublespeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>numberthr,cc=>numberthrdel);
              
  -- level 19+3*doublespeed in, level 23+5*doublespeed out
  addthr: dp_lnadd
  GENERIC MAP (speed=>doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aaman=>mantissaseries,aaexp=>exponentseries,
            bbman=>numberthrdel(75 DOWNTO 12),bbexp=>numberthrdel(11 DOWNTO 1),
            ccman=>mantissasum,ccexp=>exponentsum);            

  gmsa: FOR k IN 1 TO 64 GENERATE
    mantissasumabs(k) <= mantissasum(k) XOR signff(22+5*doublespeed);
  END GENERATE;
  
  -- level 23+5*doublespeed in, level 26+7*doublespeed out
  norm: dp_lnnorm
  GENERIC MAP (speed=>doublespeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            inman=>mantissasumabs,inexp=>exponentsum,
            outman=>mantissanorm,outexp=>exponentnorm,
            zero=>zeronorm);
  
  psgna: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
      FOR k IN 1 TO 25+7*doublespeed LOOP
        signff(k) <= '0';
      END LOOP;
    ELSIF (rising_edge(sysclk)) THEN
      signff(1) <= aaexppos(12);
      FOR k IN 2 TO 25+7*doublespeed LOOP
        signff(k) <= signff(k-1);
      END LOOP;    
    END IF;
    
  END PROCESS;

  --***************  
  --*** OUTPUTS ***
  --***************
  
  ccman <= mantissanorm(63 DOWNTO 11);
  ccexp <= exponentnorm;          
  ccsgn <= signff(25+7*doublespeed);
  zeroout <= zeronorm;
  
END rtl;

