
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION INVERSE - TOP LEVEL      ***
--***                                             ***
--***   DP_INV.VHD                                ***
--***                                             ***
--***   Function: IEEE754 DP Inverse              ***
--***   (multiplicative iterative algorithm)      ***
--***                                             ***
--***   12/08/09 ML                               ***
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
--*** Latency = 20 + 2*DoubleSpeed +              ***
--***           RoundConvert*(1+DoubleSpeed)      ***
--*** DoubleSpeed = 0, Roundconvert = 0 : 20      ***
--*** DoubleSpeed = 1, Roundconvert = 0 : 22      ***
--*** DoubleSpeed = 0, Roundconvert = 1 : 21      ***
--*** DoubleSpeed = 1, Roundconvert = 1 : 24      ***
--***                                             ***
--*** Stratix III/IV                              ***
--*** Latency = 19 + DoubleSpeed +                ***
--***           Roundconvert*(1+DoubleSpeed)      ***
--*** DoubleSpeed = 0, Roundconvert = 0 : 19      ***
--*** DoubleSpeed = 1, Roundconvert = 0 : 20      ***
--*** DoubleSpeed = 0, Roundconvert = 1 : 20      ***
--*** DoubleSpeed = 1, Roundconvert = 1 : 22      ***
--***                                             ***
--***************************************************

ENTITY dp_inv IS 
GENERIC (
         roundconvert : integer := 0; -- 0 = no round, 1 = round
         doubleaccuracy : integer := 0; -- 0 = pruned multiplier, 1 = normal multiplier
         doublespeed : integer := 0;   -- 0/1
         device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
         synthesize : integer := 1   -- 0/1    
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (52 DOWNTO 1);

		signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      invalidout : OUT STD_LOGIC;
      dividebyzeroout : OUT STD_LOGIC
		);
END dp_inv;

ARCHITECTURE rtl OF dp_inv IS
  
  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  -- SII Latency = 19 + 2*speed                  
  -- SIII Latency = 18 + speed                   
  constant coredepth : positive := 19+2*doublespeed - device*(1+doublespeed);
  
  type expfftype IS ARRAY (coredepth-1 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
    
  signal signinff : STD_LOGIC;
  signal manff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expinff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal expoffset : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  signal invertnum : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal quotient : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (coredepth-1 DOWNTO 1);  
  signal expff : expfftype;  

  -- conditions
  signal zeroman : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal zeroexp : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal maxexp : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal zeromaninff : STD_LOGIC;
  signal zeroexpinff : STD_LOGIC;
  signal maxexpinff : STD_LOGIC;
  signal zeroinff : STD_LOGIC;
  signal infinityinff : STD_LOGIC;
  signal naninff : STD_LOGIC;
  signal dividebyzeroff, nanff : STD_LOGIC_VECTOR (coredepth-3 DOWNTO 1);

  component dp_inv_core 
  GENERIC (
           doublespeed : integer := 0;  -- 0/1
           doubleaccuracy : integer := 0;  -- 0/1
           device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
           synthesize : integer := 1      -- 0/1      
          ); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        divisor : IN STD_LOGIC_VECTOR (54 DOWNTO 1);

		  quotient : OUT STD_LOGIC_VECTOR (55 DOWNTO 1)
		  );
  end component;
  
  component dp_divnornd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentdiv : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
        mantissadiv : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        dividebyzeroin : IN STD_LOGIC;

		  signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC;
        dividebyzeroout : OUT STD_LOGIC
		  );
  end component;
       	
  component dp_divrnd
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentdiv : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
        mantissadiv : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        dividebyzeroin : IN STD_LOGIC;

		  signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC;
        dividebyzeroout : OUT STD_LOGIC
		  );
  end component;

  component dp_divrndpipe
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentdiv : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
        mantissadiv : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
        nanin : IN STD_LOGIC;
        dividebyzeroin : IN STD_LOGIC;

		  signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
        --------------------------------------------------
        nanout : OUT STD_LOGIC;
        invalidout : OUT STD_LOGIC;
        dividebyzeroout : OUT STD_LOGIC
		  );
  end component;
BEGIN
    
  gzva: FOR k IN 1 TO manwidth GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  gxa: FOR k IN 1 TO expwidth-1 GENERATE
    expoffset(k) <= '1';
  END GENERATE;
  expoffset(expwidth+2 DOWNTO expwidth) <= "000";

  pma: PROCESS (sysclk,reset)
  BEGIN

    IF (reset = '1') THEN
  
      FOR k IN 1 TO manwidth LOOP
        manff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        expinff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO coredepth-1 LOOP
        signff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO coredepth-1 LOOP
        FOR j IN 1 TO expwidth+2 LOOP
          expff(k)(j) <= '0';
        END LOOP;
      END LOOP;
    
    ELSIF (rising_edge(sysclk)) THEN

      IF (enable = '1') THEN
        
        signinff <= signin;
        manff <= mantissain;
        expinff <= exponentin;

        signff(1) <= signinff;
        FOR k IN 2 TO coredepth-1 LOOP
          signff(k) <= signff(k-1);
        END LOOP;
    
        expff(1)(expwidth+2 DOWNTO 1) <= expoffset - ("00" & expinff);
        expff(2)(expwidth+2 DOWNTO 1) <= expff(1)(expwidth+2 DOWNTO 1) + expoffset;
        FOR k IN 3 TO coredepth-2 LOOP
          expff(k)(expwidth+2 DOWNTO 1) <= expff(k-1)(expwidth+2 DOWNTO 1);
        END LOOP;
        -- quotient always <1, so decrement exponent
        expff(coredepth-1)(expwidth+2 DOWNTO 1) <= expff(coredepth-2)(expwidth+2 DOWNTO 1) - 
                                                  (zerovec(expwidth+1 DOWNTO 1) & '1');   
                                                  
      END IF;
  
    END IF;
  
  END PROCESS;

--********************
--*** CHECK INPUTS ***
--********************

  zeroman(1) <= manff(1);
  gca: FOR k IN 2 TO manwidth GENERATE
    zeroman(k) <= zeroman(k-1) OR manff(k);
  END GENERATE; 
  zeroexp(1) <= expinff(1);
  gcb: FOR k IN 2 TO expwidth GENERATE
    zeroexp(k) <= zeroexp(k-1) OR expinff(k);
  END GENERATE;
  maxexp(1) <= expinff(1);
  gcc: FOR k IN 2 TO expwidth GENERATE
    maxexp(k) <= maxexp(k-1) AND expinff(k);
  END GENERATE;

  pcc: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
      
      zeromaninff <= '0';  
      zeroexpinff <= '0'; 
      maxexpinff <= '0';  
      zeroinff <= '0';
      infinityinff <= '0';
      naninff <= '0';
      FOR k IN 1 TO coredepth-3 LOOP
        dividebyzeroff(k) <= '0';
        nanff(k) <= '0';
      END LOOP;
     
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
     
        zeromaninff <= zeroman(manwidth);
        zeroexpinff <= zeroexp(expwidth);
        maxexpinff <= maxexp(expwidth);
    
        -- zero when man = 0, exp = 0
        -- infinity when man = 0, exp = max
        -- nan when man != 0, exp = max
    
        -- all ffs '1' when condition true
        zeroinff <= NOT(zeromaninff OR zeroexpinff); 
        infinityinff <= NOT(zeromaninff) AND maxexpinff;
        naninff <= zeromaninff AND maxexpinff;

        -- nan output when nan input
        nanff(1) <= naninff;
        FOR k IN 2 TO coredepth-3 LOOP
          nanff(k) <= nanff(k-1);
        END LOOP;
        
        dividebyzeroff(1) <= zeroinff;
        FOR k IN 2 TO coredepth-3 LOOP
          dividebyzeroff(k) <= dividebyzeroff(k-1);
        END LOOP;
      
      END IF;
   
    END IF;

  END PROCESS;


--*******************
--*** DIVIDE CORE ***
--*******************

  invertnum <= '1' & mantissain & '0';

  invcore: dp_inv_core
  GENERIC MAP (doublespeed=>doublespeed,doubleaccuracy=>doubleaccuracy,
               device=>device,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>invertnum,
            quotient=>quotient);
  -- quotient always <1
  
--************************
--*** ROUND AND OUTPUT ***
--************************

  -- in depth coredepth+1 (core + normalff)

  gra: IF (roundconvert = 0) GENERATE

    norndout: dp_divnornd
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signin=>signff(coredepth-1),
              exponentdiv=>expff(coredepth-1)(expwidth+2 DOWNTO 1),
              mantissadiv=>quotient(53 DOWNTO 1),
              nanin=>nanff(coredepth-3),
              dividebyzeroin=>dividebyzeroff(coredepth-3),

              signout=>signout,exponentout=>exponentout,mantissaout=>mantissaout,
              nanout=>nanout,invalidout=>invalidout,dividebyzeroout=>dividebyzeroout);
            
  END GENERATE;
  
  grb: IF (roundconvert = 1 AND doublespeed = 0) GENERATE

    rndout: dp_divrnd
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signin=>signff(coredepth-1),
              exponentdiv=>expff(coredepth-1)(expwidth+2 DOWNTO 1),
              mantissadiv=>quotient(53 DOWNTO 1),
              nanin=>nanff(coredepth-3),
              dividebyzeroin=>dividebyzeroff(coredepth-3),

              signout=>signout,exponentout=>exponentout,mantissaout=>mantissaout,
              nanout=>nanout,invalidout=>invalidout,dividebyzeroout=>dividebyzeroout);
            
  END GENERATE;

  grc: IF (roundconvert = 1 AND doublespeed = 1) GENERATE
    
    rndoutpipe: dp_divrndpipe
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              signin=>signff(coredepth-1),
              exponentdiv=>expff(coredepth-1)(expwidth+2 DOWNTO 1),
              mantissadiv=>quotient(53 DOWNTO 1),
              nanin=>nanff(coredepth-3),
              dividebyzeroin=>dividebyzeroff(coredepth-3),

              signout=>signout,exponentout=>exponentout,mantissaout=>mantissaout,
              nanout=>nanout,invalidout=>invalidout,dividebyzeroout=>dividebyzeroout);
            
  END GENERATE;
  
END rtl;

