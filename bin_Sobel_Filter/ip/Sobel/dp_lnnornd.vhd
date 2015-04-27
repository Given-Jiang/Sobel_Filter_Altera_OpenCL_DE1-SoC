
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_LNNORND.VHD                            ***
--***                                             ***
--***   Function: DP LOG Output Block - Simple    ***
--***                                             ***
--***   18/02/08 ML                               ***
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

ENTITY dp_lnnornd IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signln : IN STD_LOGIC;
      exponentln : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaln : IN STD_LOGIC_VECTOR (53 DOWNTO 1);
      nanin : IN STD_LOGIC;
      infinityin : IN STD_LOGIC;
      zeroin : IN STD_LOGIC;
        
		signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      overflowout : OUT STD_LOGIC;
      zeroout : OUT STD_LOGIC
		);
END dp_lnnornd;

ARCHITECTURE rtl OF dp_lnnornd IS

  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  signal nanff : STD_LOGIC;
  signal infinityff : STD_LOGIC;
  signal zeroff : STD_LOGIC; 
  signal signff : STD_LOGIC; 
  signal mantissaff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal exponentff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  
  signal setmanzero, setexpzero, setmanmax, setexpmax : STD_LOGIC;

BEGIN

  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      nanff <= '0';
      signff <= '0';
      FOR k IN 1 TO manwidth LOOP
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        exponentff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        signff <= signln;
        nanff <= nanin;
        infinityff <= infinityin;
        zeroff <= zeroin;

        -- nan takes precedence (set max)  
        FOR k IN 1 TO manwidth LOOP
          mantissaff(k) <= (mantissaln(k+1) AND NOT(setmanzero)) OR setmanmax;
        END LOOP;
               
        FOR k IN 1 TO expwidth LOOP
          exponentff(k) <= (exponentln(k) AND NOT(setexpzero)) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
                                                  
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************
  
  -- all set to '1' when true
  
  -- set mantissa to 0 when zero or infinity condition
  setmanzero <= NOT(zeroin) OR infinityin;
  -- setmantissa to "11..11" when nan
  setmanmax <= nanin;
  -- set exponent to 0 when zero condition 
  setexpzero <= NOT(zeroin);
  -- set exponent to "11..11" when nan or infinity
  setexpmax <= nanin OR infinityin;
                             
--***************
--*** OUTPUTS ***
--***************

  signout <= signff;   
  mantissaout <= mantissaff;
  exponentout <= exponentff; 
  -----------------------------------------------
  nanout <= nanff;
  overflowout <= infinityff;
  zeroout <= zeroff;

END rtl;

