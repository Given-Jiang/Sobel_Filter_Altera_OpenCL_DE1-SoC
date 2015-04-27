
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NORMFP1X.VHD                          ***
--***                                             ***
--***   Function: Normalize single precision      ***
--***             number                          ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   28/12/07 - divider target uses all of     ***
--***   mantissa width                            ***
--***   06/02/08 - fix divider norm               ***
--***   21/03/08 - fix add tree output norm       ***
--***   16/04/09 - add NAN support                ***
--***   08/11/10 - +0,-0 mantissa case            ***
--***                                             ***
--***************************************************

--***************************************************
--*** LATENCY :                                   ***
--***************************************************

--***************************************************
--*** NOTES:                                      ***
--*** normalize signed numbers (x input format)   ***
--*** for 1x multipliers                          ***
--*** format signed32/36 bit mantissa and 10 bit  ***
--*** exponent                                    ***
--*** unsigned numbers for divider (S,1,23 bit    ***
--*** mantissa for divider) divider packed into   ***
--*** 32/36bit mantissa + exponent                ***
--***************************************************

ENTITY hcc_normfp1x IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
         inputnormalize : integer := 1; -- 0 = scale, 1 = normalize
         roundnormalize : integer := 1;
         normspeed : positive := 2; -- 1 or 2
         target : integer := 0 -- 0 = mult target (signed), 1 = divider target (unsigned), 2 adder tree
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      
		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_normfp1x;

ARCHITECTURE rtl OF hcc_normfp1x IS
  
  type expfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal ccnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  
  -- scale
  signal aasatff, aazipff, aananff : STD_LOGIC;
  signal countaa : STD_LOGIC_VECTOR (3 DOWNTO 1);
  
  --  normalize
  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  signal normfracnode, normnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal normfracff, normff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal countadjust : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal exptopff, expbotff : expfftype;
  signal maximumnumberff : STD_LOGIC;
  signal zeroexponent, zeroexponentff : STD_LOGIC;
  signal exponentmiddle : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aasatdelff, aazipdelff, aanandelff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal countsign : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal normsignnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  signal aaexp, ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aaman, ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  
  component hcc_normsgn3236  
  GENERIC (
           mantissa : positive := 32;
           normspeed : positive := 1 -- 1 or 2
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        fracin : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);
      
        countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1);
	     fracout : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1)
	    );
  end component;
  	  
  component hcc_scmul3236 
  GENERIC (mantissa : positive := 32);
  PORT (
        frac : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

		  scaled : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1);
		  count : OUT STD_LOGIC_VECTOR (3 DOWNTO 1)
	    );
  end component;

  BEGIN
           
  --********************************************************
  --*** scale multiplier                                 ***
  --*** multiplier format [S][1][mantissa....]           ***
  --*** one clock latency                                ***
  --********************************************************
  
  -- make sure right format & adjust exponent
  gsa: IF (inputnormalize = 0) GENERATE 
  
    psa: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        
        FOR k IN 1 TO mantissa+10 LOOP
          aaff(k) <= '0';
        END LOOP;
        aasatff <= '0';
        aazipff <= '0';
        aananff <= '0';
      
      ELSIF (rising_edge(sysclk)) THEN
        
        IF (enable = '1') THEN
   
          aaff <= aa;
          aasatff <= aasat;
          aazipff <= aazip;
          aananff <= aanan;
          
        END IF;
    
      END IF;
  
    END PROCESS;
    
    -- no rounding when scaling
    sma: hcc_scmul3236
    GENERIC MAP (mantissa=>mantissa)
    PORT MAP (frac=>aaff(mantissa+10 DOWNTO 11),
              scaled=>ccnode(mantissa+10 DOWNTO 11),count=>countaa);
        
    ccnode(10 DOWNTO 1) <= aaff(10 DOWNTO 1) + ("0000000" & countaa);
    
    cc <= ccnode;
    
    ccsat <= aasatff;
    cczip <= aazipff;
    ccnan <= aananff;
        
  END GENERATE;
 
  --********************************************************
  --*** full normalization of input - 4 stages           ***
  --*** unlike double, no round required on output, as   ***
  --*** no information lost                              ***
  --********************************************************  
  gna: IF (inputnormalize = 1) GENERATE -- normalize
  
    gza: FOR k IN 1 TO mantissa-1 GENERATE
      zerovec(k) <= '0';
    END GENERATE;
    
    -- if multiplier, "1" which is nominally in position 27, is shifted to position 31
    -- add 4 to exponent when multiplier, 0 for adder
    gxa: IF (target < 2) GENERATE
      countadjust <= conv_std_logic_vector (4,10);
    END GENERATE;
    
    gxb: IF (target = 2) GENERATE
      countadjust <= conv_std_logic_vector (4,10);
    END GENERATE;
    
    pna: PROCESS (sysclk, reset)
    BEGIN
  
      IF (reset = '1') THEN
        
        FOR k IN 1 TO mantissa+10 LOOP
          aaff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO mantissa LOOP
          normfracff(k) <= '0';
          normff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 10 LOOP
          exptopff(1)(k) <= '0';
          exptopff(2)(k) <= '0';
          expbotff(1)(k) <= '0';
          expbotff(2)(k) <= '0';
        END LOOP;
        maximumnumberff <= '0';
        zeroexponentff <= '0';
        FOR k IN 1 TO 5 LOOP
          aasatdelff(k) <= '0';
          aazipdelff(k) <= '0';
          aanandelff(k) <= '0';
        END LOOP;
      
      ELSIF (rising_edge(sysclk)) THEN
        
        IF (enable = '1') THEN
   
          aaff <= aa;
          
          normfracff <= normfracnode;
          
          --might not get used
          normff <= normnode;
          
          exptopff(1)(10 DOWNTO 1) <= aaff(10 DOWNTO 1) + countadjust;
          exptopff(2)(10 DOWNTO 1) <= exptopff(1)(10 DOWNTO 1) - ("0000" & countsign);
          
          --might not get used
          expbotff(1)(10 DOWNTO 1) <= exponentmiddle;
          expbotff(2)(10 DOWNTO 1) <= expbotff(1)(10 DOWNTO 1);
          
          -- 08/11/09 
          maximumnumberff <= aaff(mantissa+10) XOR aaff(mantissa+9);
          zeroexponentff <= zeroexponent;
      
          aasatdelff(1) <= aasat;
          aazipdelff(1) <= aazip;
          aanandelff(1) <= aanan;
          FOR k IN 2 TO 5 LOOP -- 4&5 might not get used
            aasatdelff(k) <= aasatdelff(k-1);
            aazipdelff(k) <= aazipdelff(k-1);
            aanandelff(k) <= aanandelff(k-1);
          END LOOP;
          
        END IF;
    
      END IF;
  
    END PROCESS;
    
    nrmc: hcc_normsgn3236 
    GENERIC MAP (mantissa=>mantissa,normspeed=>normspeed)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              fracin=>aaff(mantissa+10 DOWNTO 11),
              countout=>countsign, -- stage 1 or 2
              fracout=>normfracnode); -- stage 2 or 3
             
    -- 08/11/10 - also where exponentmiddle is used
    -- '1' if true : if countsign 0, then "111...111" (-0) or "000...000" (+0) case, zero exponent output 
    zeroexponent <= NOT(countsign(6) OR countsign(5) OR countsign(4) OR 
                        countsign(3) OR countsign(2) OR countsign(1) OR maximumnumberff);
                        
    gen_exp_mid: FOR k IN 1 TO 10 GENERATE
      exponentmiddle(k) <= exptopff(2)(k) AND NOT(zeroexponentff);
    END GENERATE;
            
    gnb: IF (target = 1) GENERATE
    
      gnc: FOR k IN 1 TO mantissa GENERATE
        normsignnode(k) <= normfracff(k) XOR normfracff(mantissa);
      END GENERATE;
      normnode(mantissa-1 DOWNTO 1) <= normsignnode(mantissa-1 DOWNTO 1) + 
                                      (zerovec(mantissa-2 DOWNTO 1) & normfracff(mantissa));
      -- 06/02/08 make sure signbit is packed with the mantissa
      normnode(mantissa) <= normfracff(mantissa);
      
      --*** OUTPUTS ***
      ccnode(mantissa+10 DOWNTO 11) <= normff;
      ccnode(10 DOWNTO 1) <= expbotff(normspeed)(10 DOWNTO 1);
      ccsat <= aasatdelff(3+normspeed);
      cczip <= aazipdelff(3+normspeed);
      ccnan <= aanandelff(3+normspeed);
      
    END GENERATE;
    
    gnc: IF (target = 0) GENERATE
    
      --*** OUTPUTS ***
      ccnode(mantissa+10 DOWNTO 11) <= normfracff;
      gma: IF (normspeed = 1) GENERATE
        ccnode(10 DOWNTO 1) <= exponentmiddle;
      END GENERATE;
      gmb: IF (normspeed > 1) GENERATE
        ccnode(10 DOWNTO 1) <= expbotff(1)(10 DOWNTO 1);
      END GENERATE;
      ccsat <= aasatdelff(2+normspeed);
      cczip <= aazipdelff(2+normspeed);
      ccnan <= aanandelff(2+normspeed);
        
    END GENERATE;

    gnd: IF (target = 2) GENERATE
    
      gaa: IF (roundnormalize = 1) GENERATE
        normnode <= (normfracff(mantissa) & normfracff(mantissa) & 
                     normfracff(mantissa) & normfracff(mantissa) & 
                     normfracff(mantissa DOWNTO 5)) +
                    (zerovec(mantissa-1 DOWNTO 1) & normfracff(4));
      END GENERATE;
                   
      --*** OUTPUTS ***
      gab: IF (roundnormalize = 0) GENERATE -- 21/03/08 fixed this to SSSSS1XXXXX
        ccnode(mantissa+10 DOWNTO 11) <= normfracff(mantissa) & normfracff(mantissa) & 
                                         normfracff(mantissa) & normfracff(mantissa) & 
                                         normfracff(mantissa DOWNTO 5);
      END GENERATE;
      gac: IF (roundnormalize = 1) GENERATE
        ccnode(mantissa+10 DOWNTO 11) <= normff;
      END GENERATE;
      gad: IF (normspeed = 1 AND roundnormalize = 0) GENERATE
        ccnode(10 DOWNTO 1) <= exponentmiddle;
      END GENERATE;
      gae: IF ((normspeed = 2 AND roundnormalize = 0) OR
               (normspeed = 1 AND roundnormalize = 1)) GENERATE
        ccnode(10 DOWNTO 1) <= expbotff(1)(10 DOWNTO 1);
      END GENERATE;
      gaf: IF (normspeed = 2 AND roundnormalize = 1) GENERATE
        ccnode(10 DOWNTO 1) <= expbotff(2)(10 DOWNTO 1);
      END GENERATE;
      ccsat <= aasatdelff(2+normspeed+roundnormalize);
      cczip <= aazipdelff(2+normspeed+roundnormalize);
      ccnan <= aanandelff(2+normspeed+roundnormalize);
      
    END GENERATE;
      
    cc <= ccnode;
  
  END GENERATE;  
  
  --*** DEBUG ***
  aaexp <= aa(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  ccexp <= ccnode(10 DOWNTO 1);
  ccman <= ccnode(mantissa+10 DOWNTO 11);

END rtl;

