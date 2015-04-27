
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_MULFP1_DOT.VHD                        ***
--***                                             ***
--***   Function: Single precision multiplier     ***
--***   (for first level of vector multiplier)    ***
--***                                             ***
--***   27/09/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--***                                             ***
--***  Optimizations:                             ***
--***  1: Signed Output                           ***
--***  2: Unsigned Output, Normalized             ***
--***  3: Unsigned Output, Scaled                 ***
--***                                             ***
--***   Optimization = 1,2                        ***
--***   Stratix II/III/IV: Latency 4              ***
--***   Stratix V: Latency 3                      ***
--***   Optimization = 3                          ***
--***   Stratix II/III/IV: Latency 3              ***
--***   Stratix V: Latency 2                      ***
--***                                             ***
--***************************************************

ENTITY hcc_mulfp1_dot IS 
GENERIC (
         mantissa : positive := 32; -- 32 or 36
			   device : integer := 2; -- 0,1 = "Stratix II/III/IV", 2 = "Stratix V"
			   optimization : positive := 1; -- 1,2,3
         synthesize : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      bb : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
	 );
END hcc_mulfp1_dot;

ARCHITECTURE rtl OF hcc_mulfp1_dot IS
  
  type exponentfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal biasvalue : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  signal aaexponentff, bbexponentff : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal exponentff : exponentfftype;
  signal aasignff, bbsignff : STD_LOGIC;
  signal signff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  signal aamantissa, bbmantissa : STD_LOGIC_VECTOR (27 DOWNTO 1);
  signal multiply : STD_LOGIC_VECTOR (54 DOWNTO 1);   
  signal normalize : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal premantissa : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal twos_complement_carry : STD_LOGIC;
  signal normalize_bit_older, normalize_bit_newer : STD_LOGIC;
  signal scale_bit : STD_LOGIC;

  signal aaexponentzero, bbexponentzero : STD_LOGIC;
  signal aaexponentmax, bbexponentmax : STD_LOGIC;

  signal aamantissabitff, bbmantissabitff : STD_LOGIC;
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (3 DOWNTO 1);

  signal aazero, aainfinity, aanan : STD_LOGIC;
  signal bbzero, bbinfinity, bbnan : STD_LOGIC;

  signal aaexp, bbexp : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal aaman, bbman : STD_LOGIC_VECTOR (23 DOWNTO 1);
  signal ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  -- SII/III/IV behavioral component
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
  
  -- SII/III/IV synthesizable component
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

  -- SV behavioral component = SV synthesizable component
  component hcc_mul2727s
  GENERIC (width : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      
		  cc : OUT STD_LOGIC_VECTOR (2*width DOWNTO 1)
		  );
  end component;
  
BEGIN
         
  gen_bias_norm: IF (optimization = 1 OR optimization = 2) GENERATE
    biasvalue <= conv_std_logic_vector (127,10);
  END GENERATE;
  gen_bias_scale: IF (optimization = 3) GENERATE
    biasvalue <= conv_std_logic_vector (126,10);  -- bias is subtract 127, add 1 for scale right shift
  END GENERATE; 
  
  --**************************************************
  --***                                            ***
  --*** Input Section                              *** 
  --***                                            ***
  --**************************************************

  paa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN

      FOR k IN 1 TO 8 LOOP
        aaexponentff(k) <= '0';
        bbexponentff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3 LOOP
        FOR j IN 1 TO 10 LOOP
          exponentff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      aasignff <= '0';
      bbsignff <= '0';
      signff <= "000";
      FOR k IN 1 TO mantissa LOOP
        mantissaff(k) <= '0';
      END LOOP;
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        aaexponentff <= aa(31 DOWNTO 24);
        bbexponentff <= bb(31 DOWNTO 24);    
        exponentff(1)(10 DOWNTO 1) <= ("00" & aaexponentff) + ("00" & bbexponentff) - biasvalue;
        exponentff(2)(10 DOWNTO 1) <= exponentff(1)(10 DOWNTO 1) + normalize_bit_newer;
        exponentff(3)(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1) + normalize_bit_older;
        
        aasignff <= aa(32);
        bbsignff <= bb(32);
        signff(1) <= aasignff XOR bbsignff;
        signff(2) <= signff(1);
        signff(3) <= signff(2);
        
        mantissaff <= premantissa + twos_complement_carry; 
    
      END IF;
        
    END IF;
      
  END PROCESS;
  
  gen_twos_one: IF (device < 2 AND optimization = 1) GENERATE
    twos_complement_carry <= signff(2);
	  normalize_bit_newer <= '0';
	  normalize_bit_older <= multiply(52);
	  scale_bit <= '0';
  END GENERATE;
  
  gen_twos_two: IF (device = 2 AND optimization = 1) GENERATE
    twos_complement_carry <= signff(1);
	  normalize_bit_older <= '0';
	  normalize_bit_newer <= multiply(52);
	  scale_bit <= '0';
  END GENERATE;

  gen_twos_thr: IF (device < 2 AND optimization = 2) GENERATE
    twos_complement_carry <= '0';
	  normalize_bit_newer <= '0';
	  normalize_bit_older <= multiply(52);
	  scale_bit <= '0';
  END GENERATE;

  gen_twos_for: IF (device = 2 AND optimization = 2) GENERATE
    twos_complement_carry <= '0';
	  normalize_bit_older <= '0';
	  normalize_bit_newer <= multiply(52);
	  scale_bit <= '0';
  END GENERATE;
      
  gen_twos_other: IF (optimization = 3) GENERATE
    twos_complement_carry <= '0';
    normalize_bit_older <= '0';
	  normalize_bit_newer <= '0';
	  scale_bit <= '1';
  END GENERATE;

  --**************************
  --*** Multiplier Section *** 
  --**************************
  
  -- multiplier input in this form
  -- [S ][1 ][M...M][U..U]
  -- [32][31][30..8][7..1]
  
  aamantissa <= "01" & aa(23 DOWNTO 1) & "00";
  bbmantissa <= "01" & bb(23 DOWNTO 1) & "00";

  gen_mul_one: IF (device < 2 AND synthesize = 0) GENERATE
    bmult: hcc_mul3236b
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aamantissa,bb=>bbmantissa,
              cc=>multiply);
  END GENERATE;
  
  gen_mul_two: IF (device < 2 AND synthesize = 1) GENERATE
    smult: hcc_mul3236s
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mulaa=>aamantissa,mulbb=>bbmantissa,
              mulcc=>multiply);
  END GENERATE;
 
  gen_mul_thr: IF (device = 2) GENERATE
    bmult5: hcc_mul2727s
    GENERIC MAP (width=>27)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>aamantissa,bb=>bbmantissa,
              cc=>multiply);
  END GENERATE;
  
  -- output will either be "0001XXXX" or "001XXXX", normalize multiplier
  normalize(mantissa DOWNTO mantissa-2) <= "000";
  gnma: FOR k IN 1 TO mantissa-3 GENERATE
    normalize(k) <= (multiply(57-mantissa+k) AND multiply(52)) OR
                    (multiply(56-mantissa+k) AND NOT(multiply(52)));
  END GENERATE; 
  
  gpma: FOR k IN 1 TO mantissa GENERATE
    premantissa(k) <= normalize(k) XOR twos_complement_carry;
  END GENERATE;
  
  --*** EXCEPTIONS ***
  -- condition = 1 when true
  aaexponentzero <= NOT(aaexponentff(8) OR aaexponentff(7) OR aaexponentff(6) OR aaexponentff(5) OR 
                        aaexponentff(4) OR aaexponentff(3) OR aaexponentff(2) OR aaexponentff(1));
  bbexponentzero <= NOT(bbexponentff(8) OR bbexponentff(7) OR bbexponentff(6) OR bbexponentff(5) OR 
                        bbexponentff(4) OR bbexponentff(3) OR bbexponentff(2) OR bbexponentff(1));
  aaexponentmax <= aaexponentff(8) AND aaexponentff(7) AND aaexponentff(6) AND aaexponentff(5) AND 
                   aaexponentff(4) AND aaexponentff(3) AND aaexponentff(2) AND aaexponentff(1);
  bbexponentmax <= bbexponentff(8) AND bbexponentff(7) AND bbexponentff(6) AND bbexponentff(5) AND 
                   bbexponentff(4) AND bbexponentff(3) AND bbexponentff(2) AND bbexponentff(1);
    
  -- exceptions
  -- a x 0 = 0 : if (expaa = 0 OR expbb = 0) AND multiply = 0
  -- a x inf = inf : if (expaa = inf OR expbb = inf) AND multiply = 0
  -- 0 x inf = nan : if (expaa = inf AND expbb = 0) OR (expaa = 0 AND expbb = inf) AND multiply = 0
  -- a x nan = nan : if (expaa = inf OR expbb = inf) AND multiply = !0
 
  pxa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN

	    aamantissabitff <= '0';
		  bbmantissabitff <= '0';
      cczipff <= "000";
      ccsatff <= "000";
		  ccnanff <= "000";
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
		    aamantissabitff <= aa(23);
		    bbmantissabitff <= bb(23);
		  
		    -- a x 0 = 0
        cczipff(1) <= (aazero AND NOT(bbexponentmax)) OR (bbexponentzero AND NOT(aaexponentmax));
		    cczipff(2) <= cczipff(1);
		    cczipff(3) <= cczipff(2);
		  
		    -- a x inf = inf
        ccsatff(1) <= (NOT(aazero) AND NOT(aaexponentmax) AND bbinfinity) OR
		                  (NOT(bbzero) AND NOT(bbexponentmax) AND aainfinity);
		    ccsatff(2) <= ccsatff(1);
		    ccsatff(3) <= ccsatff(2);					 
        
		    -- 0 x inf = nan
		    -- a x nan = nan
		    ccnanff(1) <= (aazero AND bbinfinity) OR (bbzero AND aainfinity) OR aanan OR bbnan;
		    ccnanff(2) <= ccnanff(1);
		    ccnanff(3) <= ccnanff(2);
        
      END IF;
        
    END IF;
      
  END PROCESS; 
   
  aazero <= aaexponentzero;
  aainfinity <= aaexponentmax AND NOT(aamantissabitff);
  aanan <= aaexponentmax AND aamantissabitff;
  bbzero <= bbexponentzero;
  bbinfinity <= bbexponentmax AND NOT(bbmantissabitff);
  bbnan <= bbexponentmax AND bbmantissabitff;
  
  --***************
  --*** OUTPUTS ***
  --***************

  -- if device = 0,1 (SII,III,IV) and optimization = 1 (signed output)
  -- latency = 4
  gen_out_older_one: IF (device < 2 AND optimization = 1) GENERATE
    cc(mantissa+10 DOWNTO 11) <= mantissaff;
    cc(10 DOWNTO 1) <= exponentff(3)(10 DOWNTO 1);
	ccsat <= ccsatff(3);
    cczip <= cczipff(3);
    ccnan <= ccnanff(3);
  END GENERATE;
  -- if device = 0,1 (SII,III,IV) and optimization = 2 (unsigned output, normalized)
  -- latency = 4
  gen_out_older_two: IF (device < 2 AND optimization = 2) GENERATE
    cc(mantissa+10) <= signff(3); -- sign bit packed into MSB
    cc(mantissa+9 DOWNTO 11) <= mantissaff(mantissa-1 DOWNTO 1); 
    cc(10 DOWNTO 1) <= exponentff(3)(10 DOWNTO 1);
	ccsat <= ccsatff(3);
    cczip <= cczipff(3);
    ccnan <= ccnanff(3);
  END GENERATE;
  -- if device = 0,1 (SII,III,IV) and optimization = 3 (unsigned output, scaled)
  -- latency = 3
  gen_out_older_thr: IF (device < 2 AND optimization = 3) GENERATE
    cc(mantissa+10) <= signff(2); -- sign bit packed into MSB
    cc(mantissa+9 DOWNTO 11) <= "00" & multiply(54 DOWNTO 58-mantissa); -- right shifted
    cc(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1);
	ccsat <= ccsatff(2);
    cczip <= cczipff(2);
    ccnan <= ccnanff(2);
  END GENERATE;
  
  
  gen_out_newer_one: IF (device = 2 AND optimization = 1) GENERATE
    cc(mantissa+10 DOWNTO 11) <= mantissaff;
    cc(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1);
	ccsat <= ccsatff(2);
    cczip <= cczipff(2);
    ccnan <= ccnanff(2);
  END GENERATE;

  gen_out_newer_two: IF (device = 2 AND optimization = 2) GENERATE
    cc(mantissa+10) <= signff(2); -- sign bit packed into MSB
    cc(mantissa+9 DOWNTO 11) <= mantissaff(mantissa-1 DOWNTO 1); 
    cc(10 DOWNTO 1) <= exponentff(2)(10 DOWNTO 1);
	ccsat <= ccsatff(2);
    cczip <= cczipff(2);
    ccnan <= ccnanff(2);
  END GENERATE;

  gen_out_newer_thr: IF (device = 2 AND optimization = 3) GENERATE
    cc(mantissa+10) <= signff(1); -- sign bit packed into MSB
    cc(mantissa+9 DOWNTO 11) <= "00" & multiply(54 DOWNTO 58-mantissa); -- right shifted
    cc(10 DOWNTO 1) <= exponentff(1)(10 DOWNTO 1);
	ccsat <= ccsatff(1);
    cczip <= cczipff(1);
    ccnan <= ccnanff(1);
  END GENERATE;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(31 DOWNTO 24);
  bbexp <= bb(31 DOWNTO 24);
  gen_debug_older: IF (device < 2) GENERATE
    ccexp <= exponentff(3)(10 DOWNTO 1);
  END GENERATE;
  gen_debug_newer: IF (device = 2) GENERATE
    ccexp <= exponentff(2)(10 DOWNTO 1);
  END GENERATE;
  aaman <= aa(23 DOWNTO 1);
  bbman <= bb(23 DOWNTO 1);
  ccman <= mantissaff;
  
END rtl;

