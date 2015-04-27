
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION INVERSE SQUARE ROOT      ***
--***              TOP LEVEL                      ***
--***                                             ***
--***   DP_INVSQR.VHD                             ***
--***                                             ***
--***   Function: IEEE754 DP Inverse Square Root  ***
--***   (multiplicative iterative algorithm)      ***
--***                                             ***
--***   11/08/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--***                                             ***
--*** Stratix II                                  ***
--*** Latency = 32 + 2*Speed                      ***
--*** Speed = 0 : 32                              ***
--*** Speed = 1 : 34                              ***
--***                                             ***
--*** Stratix III/IV                              ***
--*** Latency = 31 + Speed                        ***
--*** Speed = 0 : 31                              ***
--*** Speed = 1 : 32                              ***
--***                                             ***
--*************************************************** 
    
ENTITY dp_invsqr IS 
GENERIC (
         doubleaccuracy : integer := 0;  -- 0 = pruned multiplier, 1 = normal multiplier
         doublespeed : integer := 0;  -- 0/1
         device : integer := 0;  -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1  -- 0/1    
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin: IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

		  signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      invalidout : OUT STD_LOGIC
		);
END dp_invsqr;

ARCHITECTURE rtl OF dp_invsqr IS
  
  constant manwidth : positive := 52;
  constant expwidth : positive := 11;
  
  constant coredepth : positive := 31+2*doublespeed - device*(1+doublespeed);
  
  type expfftype IS ARRAY (coredepth+1 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth DOWNTO 1);

  signal maninff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expinff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (coredepth+1 DOWNTO 1);
  signal correctff : STD_LOGIC_VECTOR (3 DOWNTO 1);  -- SPR 383712
  signal expff : expfftype;
  signal radicand : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal oddexponent : STD_LOGIC;
  signal invroot : STD_LOGIC_VECTOR (54 DOWNTO 1);
  --signal invroottest : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal manff : STD_LOGIC_VECTOR (manwidth DOWNTO 1); 
  signal zerovec : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal offset : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
    
  -- conditions
  signal nanmanff, nanexpff : STD_LOGIC_VECTOR (coredepth-1 DOWNTO 1);
  signal zeroexpff, zeromanff : STD_LOGIC_VECTOR (coredepth-2 DOWNTO 1); 
  signal expinzero, expinmax : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal maninzero : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expzero, expmax, manzero : STD_LOGIC;
  signal infinityconditionff, nanconditionff, expzeroff : STD_LOGIC;
  signal correct_powers_of_two : STD_LOGIC;  -- SPR 383712
    
  component dp_invsqr_core IS 
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
  end component;
	
BEGIN
    
  gzva: FOR k IN 1 TO manwidth GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  gxoa: FOR k IN 1 TO expwidth-1 GENERATE
    offset(k) <= '1';
  END GENERATE;
  offset(expwidth) <= '0';

  pma: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN

      FOR k IN 1 TO manwidth LOOP
        maninff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        expinff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO coredepth+1 LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO coredepth+1 LOOP
        FOR j IN 1 TO expwidth LOOP
          expff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      FOR k IN 1 TO manwidth LOOP
        manff(k) <= '0';
      END LOOP;
	  correctff <= "000";  -- SPR 383712
  
    ELSIF (rising_edge(sysclk)) THEN

      maninff <= mantissain;
      expinff <= exponentin;
    
      signff(1) <= signin;
      FOR k IN 2 TO coredepth+1 LOOP
        signff(k) <= signff(k-1);
      END LOOP;
  
      expff(1)(expwidth DOWNTO 1) <= exponentin;
      expff(2)(expwidth DOWNTO 1) <= expff(1)(expwidth DOWNTO 1) - offset;
      expff(3)(expwidth DOWNTO 1) <= expff(2)(expwidth) & expff(2)(expwidth DOWNTO 2);
      expff(4)(expwidth DOWNTO 1) <= offset - expff(3)(expwidth DOWNTO 1);
      expff(5)(expwidth DOWNTO 1) <= expff(4)(expwidth DOWNTO 1) - 1 + correctff(3);
      FOR k IN 6 TO coredepth LOOP
        expff(k)(expwidth DOWNTO 1) <= expff(k-1)(expwidth DOWNTO 1);
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        expff(coredepth+1)(k) <= (expff(coredepth)(k) AND zeroexpff(coredepth-2)) OR nanexpff(coredepth-2);
      END LOOP;

	  -- SPR 383712
	  correctff(1) <= correct_powers_of_two;
	  correctff(2) <= correctff(1);
	  correctff(3) <= correctff(2);
	  
      FOR k IN 1 TO manwidth LOOP
        manff(k) <= (invroot(k+1) AND zeromanff(coredepth-2)) OR nanmanff(coredepth-2);
      END LOOP;
  
    END IF;
  
  END PROCESS;

--*******************
--*** CONDITIONS ***
--*******************

  pcc: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
      
      FOR k IN 1 TO coredepth-1 LOOP
        nanmanff(k) <= '0';
        nanexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO coredepth-2 LOOP
        zeroexpff(k) <= '0';
        zeromanff(k) <= '0';
      END LOOP;
      infinityconditionff <= '0'; 
      nanconditionff <= '0';
      expzeroff <= '0';

    ELSIF (rising_edge(sysclk)) THEN
     
      infinityconditionff <= manzero AND expmax;
      nanconditionff <= signff(1) OR expzero OR (expmax AND manzero);
      expzeroff <= expzero;
 
      nanmanff(1) <= nanconditionff; -- level 3
      nanexpff(1) <= nanconditionff OR infinityconditionff; -- also max exp when infinity
      FOR k IN 2 TO coredepth-1 LOOP
        nanmanff(k) <= nanmanff(k-1);
        nanexpff(k) <= nanexpff(k-1);
      END LOOP;

      zeromanff(1) <= NOT(expzeroff) AND NOT(infinityconditionff); -- level 3
      zeroexpff(1) <= NOT(expzeroff); -- level 3
      FOR k IN 2 TO coredepth-2 LOOP
        zeromanff(k) <= zeromanff(k-1);
        zeroexpff(k) <= zeroexpff(k-1);
      END LOOP;
    
    END IF;
  
  END PROCESS;

--*******************
--*** SQUARE ROOT ***
--*******************
  
  radicand <= '1' & mantissain & '0';
  -- sub 1023, so 1023 (odd) = 2^0 => even
  oddexponent <= NOT(exponentin(1));

  -- does not require rounding, output of core rounded already, LSB always 0
  isqr: dp_invsqr_core
  GENERIC MAP (doublespeed=>doublespeed,doubleaccuracy=>doubleaccuracy,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            radicand=>radicand,odd=>oddexponent,
            invroot=>invroot);

--*********************
--*** SPECIAL CASES ***
--*********************
-- 1. if negative input, invalid operation, NAN 
-- 2. 0 in, invalid operation, NAN
-- 3. infinity in, invalid operation, infinity out
-- 4. NAN in, invalid operation, NAN

  -- '1' if 0 
  expinzero(1) <= expinff(1);
  gxza: FOR k IN 2 TO expwidth GENERATE
    expinzero(k) <= expinzero(k-1) OR expinff(k);
  END GENERATE;
  expzero <= NOT(expinzero(expwidth)); -- '0' when zero
                 
  -- '1' if nan or infinity
  expinmax(1) <= expinff(1);
  gxia: FOR k IN 2 TO expwidth GENERATE
    expinmax(k) <= expinmax(k-1) AND expinff(k);
  END GENERATE;
  expmax <= expinmax(expwidth); -- '1' when true
          
  -- '1' if zero or infinity
  maninzero(1) <= maninff(1);
  gmza: FOR k IN 2 TO manwidth GENERATE
    maninzero(k) <= maninzero(k-1) OR maninff(k);
  END GENERATE;
  manzero <= NOT(maninzero(manwidth)); 
  -- 09/03/11 ML
  -- if mantissa is 0 and exponent is odd (...123,125,127,129,131...) then dont subtract 1 from offset corrected exponent
  -- '1' is subtracted as any value, no matter how small, in the mantissa will reduce the inverse below the mirrored exponent (around 127)
  -- if the exponent is odd (with mantissa 0) the value is a power of 2 (...0.25,0.5,1,2,4...) and the mirrored exponent is correct
  -- if the exponent is even (with mantissa 0), the inverse square root will have a non zero mantissa and can be handled normally
  correct_powers_of_two <= manzero AND expinff(1);  -- SPR 383712
       
--***************
--*** OUTPUTS ***
--***************

  signout <= signff(coredepth+1);
  exponentout <= expff(coredepth+1)(expwidth DOWNTO 1);   
  mantissaout <= manff;
  -----------------------------------------------
  nanout <= nanmanff(coredepth-1);
  invalidout <= nanmanff(coredepth-1);

END rtl;

