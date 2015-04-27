
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFPPN3236.VHD                       ***
--***                                             ***
--***   Function: Single precision multiplier     ***
--***             core function, with post-norm   ***
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

ENTITY hcc_mulfppn3236 IS
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
END hcc_mulfppn3236;

ARCHITECTURE rtl OF hcc_mulfppn3236 IS
  
  constant normtype : integer := 0;
  
  type expfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaman, bbman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexp, bbexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal mulout : STD_LOGIC_VECTOR (2*mantissa DOWNTO 1);
  
  signal aamanff, bbmanff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal manoutff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexpff, bbexpff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expff : expfftype;
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;
  signal ccsatff, cczipff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  
  signal aapos, aaneg, bbpos, bbneg : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal aanumff, bbnumff : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal selnode : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal sel, selff : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal expadjff : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal expadjnode : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  component hcc_mul3236b 
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		  );
  end component;
  
  component hcc_mul3236s
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mulaa, mulbb : IN STD_LOGIC_VECTOR (width DOWNTO 1);      

        mulcc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)  
       );
  end component; 
    
BEGIN

  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  
  -- normalization or scale turns it into
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]
  
  -- multiplier outputs (result < 2)
  -- [S....S][1 ][M*M...][U*U]
  -- [64..62][61][60..15][14....1]
  -- multiplier outputs (result >= 2)
  -- [S....S][1 ][M*M...][U*U.....]
  -- [64..63][62][61..16][15.....1]
  
  -- assume that result > 2
  -- if output likely in [62..59] shift 0, if in [58..55] shift 4, 
  -- if in [54..51] shift 8, else shift 12 (adjust exponent accordingly)
         
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
       
      FOR k IN 1 TO mantissa LOOP
        aamanff(k) <= '0';
        bbmanff(k) <= '0';
      END LOOP; 
      aaexpff <= "0000000000";
      bbexpff <= "0000000000";
      FOR k IN 1 TO 3 LOOP
        expff(k)(10 DOWNTO 1) <= "0000000000";
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      ccsatff <= "000";
      cczipff <= "000";
      aanumff <= "0000";
      bbnumff <= "0000";
      selff <= "0000";
      expadjff <= "0000";
      FOR k IN 1 TO mantissa LOOP
        manoutff(k) <= '0';
      END LOOP;  
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aamanff <= aaman; 
        bbmanff <= bbman;
        
        aasatff <= aasat;
        aazipff <= aazip;
        bbsatff <= bbsat;
        bbzipff <= bbzip;
        ccsatff(1) <= aasatff OR bbsatff;
        ccsatff(2) <= ccsatff(1);
        ccsatff(3) <= ccsatff(2);
        cczipff(1) <= aazipff OR bbzipff;
        cczipff(2) <= cczipff(1);
        cczipff(3) <= cczipff(2);
        
        aaexpff <= aaexp;
        bbexpff <= bbexp;     
        expff(1)(10 DOWNTO 1) <= aaexpff + bbexpff - "0001111111";
        FOR k IN 1 TO 10 LOOP
          expff(2)(k) <= (expff(1)(k) OR ccsatff(1)) AND NOT(cczipff(1));
        END LOOP;    
        expff(3)(10 DOWNTO 1) <= expff(2)(10 DOWNTO 1) + expadjnode;
        
        FOR k IN 1 TO 4 LOOP
          aanumff(k) <= (aapos(k) AND NOT(aa(32))) OR (aaneg(k) AND aa(32));
          bbnumff(k) <= (bbpos(k) AND NOT(bb(32))) OR (bbneg(k) AND bb(32));
        END LOOP;
        
        selff <= sel;
        
        -- "0" when sel(1), "4" when sel(2), "8" when sel(3), "12" when sel(4)
        -- don't adjust during a saturate or zero condition
        expadjff(2 DOWNTO 1) <= "00";
        expadjff(3) <= (sel(2) OR sel(4)) AND NOT(ccsatff(1) OR cczipff(1)); 
        expadjff(4) <= (sel(3) OR sel(4)) AND NOT(ccsatff(1) OR cczipff(1)); 
        
        -- output left shift 
        -- mulpipe is [64..1], 44 bit output is in [62..19] for 32 bit
        -- mulpipe is [72..1], 44 bit output is in [70..27] for 36 bits
        FOR k IN mantissa DOWNTO 1 LOOP
          manoutff(k) <= (mulout(k+mantissa-2) AND selff(1)) OR
                         (mulout(k+mantissa-6) AND selff(2)) OR
                         (mulout(k+mantissa-10) AND selff(3)) OR
                         (mulout(k+mantissa-14) AND selff(4));
          
        END LOOP;
        
      END IF;
    
    END IF;
  
  END PROCESS;

  gsa: IF (synthesize = 0) GENERATE
    bmult: hcc_mul3236b
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aaman,bb=>bbman,
              cc=>mulout);
  END GENERATE;
  
  gsb: IF (synthesize = 1) GENERATE
    smult: hcc_mul3236s
    GENERIC MAP (width=>mantissa)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aaman,mulbb=>bbman,
              mulcc=>mulout);
  END GENERATE;
   
  aapos(1) <= aamanff(mantissa-1) OR aamanff(mantissa-2) OR aamanff(mantissa-3) OR aamanff(mantissa-4);
  aapos(2) <= aamanff(mantissa-5) OR aamanff(mantissa-6) OR aamanff(mantissa-7) OR aamanff(mantissa-8);
  aapos(3) <= aamanff(mantissa-9) OR aamanff(mantissa-10) OR aamanff(mantissa-11) OR aamanff(mantissa-12);
  aapos(4) <= aamanff(mantissa-13) OR aamanff(mantissa-14) OR aamanff(mantissa-15) OR aamanff(mantissa-16);
  
  bbpos(1) <= bbmanff(mantissa-1) OR bbmanff(mantissa-2) OR bbmanff(mantissa-3) OR bbmanff(mantissa-4);
  bbpos(2) <= bbmanff(mantissa-5) OR bbmanff(mantissa-6) OR bbmanff(mantissa-7) OR bbmanff(mantissa-8);
  bbpos(3) <= bbmanff(mantissa-9) OR bbmanff(mantissa-10) OR bbmanff(mantissa-11) OR bbmanff(mantissa-12);
  bbpos(4) <= bbmanff(mantissa-13) OR bbmanff(mantissa-14) OR bbmanff(mantissa-15) OR bbmanff(mantissa-16);

  aaneg(1) <= aamanff(mantissa-1) AND aamanff(mantissa-2) AND aamanff(mantissa-3) AND aamanff(mantissa-4);
  aaneg(2) <= aamanff(mantissa-5) AND aamanff(mantissa-6) AND aamanff(mantissa-7) AND aamanff(mantissa-8);
  aaneg(3) <= aamanff(mantissa-9) AND aamanff(mantissa-10) AND aamanff(mantissa-11) AND aamanff(mantissa-12);
  aaneg(4) <= aamanff(mantissa-13) AND aamanff(mantissa-14) AND aamanff(mantissa-15) AND aamanff(mantissa-16);
  
  bbneg(1) <= bbmanff(mantissa-1) AND bbmanff(mantissa-2) AND bbmanff(mantissa-3) AND bbmanff(mantissa-4);
  bbneg(2) <= bbmanff(mantissa-5) AND bbmanff(mantissa-6) AND bbmanff(mantissa-7) AND bbmanff(mantissa-8);
  bbneg(3) <= bbmanff(mantissa-9) AND bbmanff(mantissa-10) AND bbmanff(mantissa-11) AND bbmanff(mantissa-12);
  bbneg(4) <= bbmanff(mantissa-13) AND bbmanff(mantissa-14) AND bbmanff(mantissa-15) AND bbmanff(mantissa-16);  
   
  selnode(1) <= aanumff(1) AND bbnumff(1);
  selnode(2) <= (aanumff(1) AND bbnumff(2)) OR 
                (aanumff(2) AND bbnumff(1));
  selnode(3) <= (aanumff(2) AND bbnumff(2)) OR 
                (aanumff(1) AND bbnumff(3)) OR 
                (aanumff(3) AND bbnumff(1));
        
  sel(1) <= selnode(1); -- shift 0
  sel(2) <= NOT(selnode(1)) AND selnode(2); -- shift 4
  sel(3) <= NOT(selnode(1)) AND NOT(selnode(2)) AND selnode(3); -- shift 8
  sel(4) <= NOT(selnode(1)) AND NOT(selnode(2)) AND NOT(selnode(3)); -- shift 12
            
  expadjnode <= "000000" & expadjff;  
  
  --***************
  --*** OUTPUTS ***          
  --***************          
                         
  cc <= manoutff(mantissa) & manoutff(mantissa) & manoutff(mantissa DOWNTO 3) & expff(3)(10 DOWNTO 1);
  ccsat <= ccsatff(3);
  cczip <= cczipff(3);
  
END rtl;

