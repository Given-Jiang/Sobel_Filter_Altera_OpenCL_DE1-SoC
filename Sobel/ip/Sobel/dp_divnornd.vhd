
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   DOUBLE PRECISION DIVIDER - OUTPUT STAGE   ***
--***                                             ***
--***   DP_DIVNORND.VHD                           ***
--***                                             ***
--***   Function: Output Stage, No Rounding       ***
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
--*** Notes: Latency = 1                          ***
--***************************************************

ENTITY dp_divnornd IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentdiv : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
      mantissadiv : IN STD_LOGIC_VECTOR (53 DOWNTO 1); -- includes roundbit
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
END dp_divnornd;

ARCHITECTURE rtl OF dp_divnornd IS

  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  type exponentfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (manwidth-1 DOWNTO 1);
  signal signff : STD_LOGIC;
  signal nanff : STD_LOGIC;
  signal dividebyzeroff : STD_LOGIC;  
  signal mantissaff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal exponentff : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  
  signal infinitygen : STD_LOGIC_VECTOR (expwidth+1 DOWNTO 1);
  signal zerogen : STD_LOGIC_VECTOR (expwidth+1 DOWNTO 1);  
  signal setmanzero, setmanmax : STD_LOGIC;
  signal setexpzero, setexpmax : STD_LOGIC;

BEGIN
    
  gzv: FOR k IN 1 TO manwidth-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      signff <= '0';
      nanff <= '0';
      dividebyzeroff <= '0';
      FOR k IN 1 TO manwidth LOOP
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        exponentff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        signff <= signin;
        nanff <= nanin;
        dividebyzeroff <= dividebyzeroin;

        -- nan takes precedence (set max)
        -- nan takes precedence (set max)  
        FOR k IN 1 TO manwidth LOOP
          mantissaff(k) <= (mantissadiv(k+1) AND setmanzero) OR setmanmax;
        END LOOP;
               
        FOR k IN 1 TO expwidth LOOP
          exponentff(k) <= (exponentdiv(k) AND setexpzero) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
                                                  
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************

  -- infinity if exponent >= 255
  infinitygen(1) <= exponentdiv(1);
  gia: FOR k IN 2 TO expwidth GENERATE
    infinitygen(k) <= infinitygen(k-1) AND exponentdiv(k);
  END GENERATE;
  infinitygen(expwidth+1) <= infinitygen(expwidth) OR 
                            (exponentdiv(expwidth+1) AND 
                             NOT(exponentdiv(expwidth+2))); -- ;1' if infinity
                         
  -- zero if exponent <= 0
  zerogen(1) <= exponentdiv(1);
  gza: FOR k IN 2 TO expwidth GENERATE
    zerogen(k) <= zerogen(k-1) OR exponentdiv(k);
  END GENERATE;
  zerogen(expwidth+1) <= zerogen(expwidth) AND 
                         NOT(exponentdiv(expwidth+2)); -- '0' if zero
                    
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= NOT(infinitygen(expwidth+1)) AND zerogen(expwidth+1) AND NOT(dividebyzeroin);
  -- setmantissa to "11..11" when nan
  setmanmax <= nanin;
  -- set exponent to 0 when zero condition 
  setexpzero <= zerogen(expwidth+1);
  -- set exponent to "11..11" when nan, infinity, or divide by 0
  setexpmax <= nanin OR infinitygen(expwidth+1) OR dividebyzeroin;
                             
--***************
--*** OUTPUTS ***
--***************

  signout <= signff;   
  mantissaout <= mantissaff;
  exponentout <= exponentff(expwidth DOWNTO 1); 
  -----------------------------------------------
  nanout <= nanff;
  invalidout <= nanff;
  dividebyzeroout <= dividebyzeroff;

END rtl;

