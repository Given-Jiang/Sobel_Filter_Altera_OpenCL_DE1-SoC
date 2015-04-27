
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   SINGLE PRECISION INVERSE - TOP LEVEL      ***
--***                                             ***
--***   FP_INV.VHD                                ***
--***                                             ***
--***   Function: IEEE754 SP Inverse              ***
--***   (multiplicative iterative algorithm)      ***
--***                                             ***
--***   09/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes: Latency = 14                         ***
--***************************************************

ENTITY fp_inv IS 
GENERIC (synthesize : integer := 1);
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (23 DOWNTO 1);

		signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      invalidout : OUT STD_LOGIC;
      dividebyzeroout : OUT STD_LOGIC
		);
END fp_inv;

ARCHITECTURE div OF fp_inv IS
  
  constant expwidth : positive := 8;
  constant manwidth : positive := 23;
  
  constant coredepth : positive := 12;
  
  type expfftype IS ARRAY (coredepth-1 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
    
  signal signinff : STD_LOGIC;
  signal manff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal expinff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal expoffset : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  signal invertnum : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal quotient : STD_LOGIC_VECTOR (36 DOWNTO 1);
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

  component fp_inv_core IS 
  GENERIC (synthesize : integer := 1); 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        divisor : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		  quotient : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
		  );
  end component;
  
  component fp_divrnd 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        signin : IN STD_LOGIC;
        exponentdiv : IN STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
        mantissadiv : IN STD_LOGIC_VECTOR (manwidth+1 DOWNTO 1);
        nanin : IN STD_LOGIC;
        dividebyzeroin : IN STD_LOGIC;

		  signout : OUT STD_LOGIC;
        exponentout : OUT STD_LOGIC_VECTOR (expwidth DOWNTO 1);
        mantissaout : OUT STD_LOGIC_VECTOR (manwidth DOWNTO 1);
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
        -- inverse always less than 1, decrement exponent
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

  invertnum <= '1' & mantissain & "000000000000";

  -- will give output between 0.5 and 0.99999...
  -- will always need to be normalized
  invcore: fp_inv_core
  GENERIC MAP (synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            divisor=>invertnum,
            quotient=>quotient);

--************************
--*** ROUND AND OUTPUT ***
--************************

  rndout: fp_divrnd
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            signin=>signff(coredepth-1),
            exponentdiv=>expff(coredepth-1)(expwidth+2 DOWNTO 1),
            mantissadiv=>quotient(34 DOWNTO 11),
            nanin=>nanff(coredepth-3),dividebyzeroin=>dividebyzeroff(coredepth-3),

            signout=>signout,exponentout=>exponentout,mantissaout=>mantissaout,
            nanout=>nanout,invalidout=>invalidout,dividebyzeroout=>dividebyzeroout);
  
END div;

