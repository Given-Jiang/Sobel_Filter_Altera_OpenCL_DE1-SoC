
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   SINGLE PRECISION DIVIDER - OUTPUT STAGE   ***
--***                                             ***
--***   FP_DIVRND.VHD                             ***
--***                                             ***
--***   Function: Output Stage, Rounding          ***
--***                                             ***
--***   31/01/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes: Latency = 2                          ***
--***************************************************

ENTITY fp_divrnd IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentdiv : IN STD_LOGIC_VECTOR (10 DOWNTO 1);
      mantissadiv : IN STD_LOGIC_VECTOR (24 DOWNTO 1); -- includes roundbit
      nanin : IN STD_LOGIC;
      dividebyzeroin : IN STD_LOGIC;

		signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (8 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (23 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      invalidout : OUT STD_LOGIC;
      dividebyzeroout : OUT STD_LOGIC
		);
END fp_divrnd;

ARCHITECTURE rtl OF fp_divrnd IS
  
  constant expwidth : positive := 8;
  constant manwidth : positive := 23;

  signal zerovec : STD_LOGIC_VECTOR (manwidth-1 DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal nanff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal dividebyzeroff : STD_LOGIC_VECTOR (2 DOWNTO 1);  
  signal roundmantissaff, mantissaff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal exponentnode : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  signal exponentoneff : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  signal exponenttwoff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal overflowbitff : STD_LOGIC;
  signal manoverflow : STD_LOGIC_VECTOR (manwidth+1 DOWNTO 1);
  
  signal infinitygen : STD_LOGIC_VECTOR (expwidth+1 DOWNTO 1);
  signal zerogen : STD_LOGIC_VECTOR (expwidth+1 DOWNTO 1);  
  signal setmanzero, setmanmax : STD_LOGIC;
  signal setexpzero, setexpmax : STD_LOGIC;
  signal setmanzeroff, setmanmaxff : STD_LOGIC;
  signal setexpzeroff, setexpmaxff : STD_LOGIC;

BEGIN
    
  gzv: FOR k IN 1 TO manwidth-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      signff <= "00";
      nanff <= "00";
      dividebyzeroff <= "00";
      FOR k IN 1 TO manwidth LOOP
        roundmantissaff(k) <= '0';
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth+2 LOOP
        exponentoneff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        exponenttwoff(k) <= '0';
      END LOOP;
      overflowbitff <= '0';
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        signff(1) <= signin;
        signff(2) <= signff(1);
        nanff(1) <= nanin;
        nanff(2) <= nanff(1);
        dividebyzeroff(1) <= dividebyzeroin;
        dividebyzeroff(2) <= dividebyzeroff(1);
        
        roundmantissaff <= mantissadiv(manwidth+1 DOWNTO 2) + (zerovec & mantissadiv(1));
        
        overflowbitff <= manoverflow(manwidth+1);
        
        -- nan takes precedence (set max)
        -- nan takes precedence (set max)  
        FOR k IN 1 TO manwidth LOOP
          mantissaff(k) <= (roundmantissaff(k) AND setmanzero) OR setmanmax;
        END LOOP;
        
        exponentoneff(expwidth+2 DOWNTO 1) <= exponentdiv(expwidth+2 DOWNTO 1);                 
        FOR k IN 1 TO expwidth LOOP
          exponenttwoff(k) <= (exponentnode(k) AND setexpzero) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;

  exponentnode <= exponentoneff(expwidth+2 DOWNTO 1) + 
                 (zerovec(expwidth+1 DOWNTO 1) & overflowbitff);
                 
--*********************************
--*** PREDICT MANTISSA OVERFLOW ***   
--*********************************
     
  manoverflow(1) <= mantissadiv(1);
  gmoa: FOR k IN 2 TO manwidth+1 GENERATE
    manoverflow(k) <= manoverflow(k-1) AND mantissadiv(k);
  END GENERATE; 
                                                                 
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************

  -- infinity if exponent >= 255
  infinitygen(1) <= exponentnode(1);
  gia: FOR k IN 2 TO expwidth GENERATE
    infinitygen(k) <= infinitygen(k-1) AND exponentnode(k);
  END GENERATE;
  infinitygen(expwidth+1) <= infinitygen(expwidth) OR 
                            (exponentnode(expwidth+1) AND 
                             NOT(exponentnode(expwidth+2))); -- ;1' if infinity
                         
  -- zero if exponent <= 0
  zerogen(1) <= exponentnode(1);
  gza: FOR k IN 2 TO expwidth GENERATE
    zerogen(k) <= zerogen(k-1) OR exponentnode(k);
  END GENERATE;
  zerogen(expwidth+1) <= zerogen(expwidth) AND 
                         NOT(exponentnode(expwidth+2)); -- '0' if zero
                    
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= NOT(infinitygen(expwidth+1)) AND zerogen(expwidth+1) AND NOT(dividebyzeroff(1));
  -- setmantissa to "11..11" when nan
  setmanmax <= nanff(1);
  -- set exponent to 0 when zero condition 
  setexpzero <= zerogen(expwidth+1);
  -- set exponent to "11..11" when nan, infinity, or divide by 0
  setexpmax <= nanff(1) OR infinitygen(expwidth+1) OR dividebyzeroff(1);
                             
--***************
--*** OUTPUTS ***
--***************

  signout <= signff(2);   
  mantissaout <= mantissaff;
  exponentout <= exponenttwoff(expwidth DOWNTO 1); 
  -----------------------------------------------
  nanout <= nanff(2);
  invalidout <= nanff(2);
  dividebyzeroout <= dividebyzeroff(2);

END rtl;

