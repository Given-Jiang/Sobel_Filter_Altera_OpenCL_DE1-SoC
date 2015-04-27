
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_EXPNORND.VHD                           ***
--***                                             ***
--***   Function: DP Exponent Output Block -      ***
--***   Simple                                    ***
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

ENTITY dp_expnornd IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaexp : IN STD_LOGIC_VECTOR (53 DOWNTO 1); -- includes roundbit
      nanin : IN STD_LOGIC;
      rangeerror : IN STD_LOGIC;

		signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1);
      --------------------------------------------------
      nanout : OUT STD_LOGIC;
      overflowout : OUT STD_LOGIC;
      underflowout : OUT STD_LOGIC
		);
END dp_expnornd;

ARCHITECTURE rtl OF dp_expnornd IS

  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  signal nanff : STD_LOGIC;
  signal overflownode, underflownode : STD_LOGIC;
  signal overflowff, underflowff : STD_LOGIC;  
  signal mantissaff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal exponentff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  
  signal infinitygen : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  signal zerogen : STD_LOGIC_VECTOR (expwidth DOWNTO 1);  
  signal setmanzero, setmanmax : STD_LOGIC;
  signal setexpzero, setexpmax : STD_LOGIC;

BEGIN

  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      nanff <= '0';
      overflowff <= '0';
      underflowff <= '0';
      FOR k IN 1 TO manwidth LOOP
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        exponentff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        nanff <= nanin;
        overflowff <= overflownode;
        underflowff <= underflownode;

        -- nan takes precedence (set max)  
        FOR k IN 1 TO manwidth LOOP
          mantissaff(k) <= (mantissaexp(k+1) AND setmanzero) OR setmanmax;
        END LOOP;
               
        FOR k IN 1 TO expwidth LOOP
          exponentff(k) <= (exponentexp(k) AND setexpzero) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
                                                  
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************

  -- infinity if exponent == 255
  infinitygen(1) <= exponentexp(1);
  gia: FOR k IN 2 TO expwidth GENERATE
    infinitygen(k) <= infinitygen(k-1) AND exponentexp(k);
  END GENERATE;
                         
  -- zero if exponent == 0
  zerogen(1) <= exponentexp(1);
  gza: FOR k IN 2 TO expwidth GENERATE
    zerogen(k) <= zerogen(k-1) OR exponentexp(k);
  END GENERATE;
                    
  -- trap any other overflow errors
  -- when sign = 0 and rangeerror = 1, overflow
  -- when sign = 1 and rangeerror = 1, underflow
  overflownode <= NOT(signin) AND rangeerror;
  underflownode <= signin AND rangeerror;
  
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= NOT(infinitygen(expwidth)) AND zerogen(expwidth) AND NOT(rangeerror);
  -- setmantissa to "11..11" when nan
  setmanmax <= nanin;
  -- set exponent to 0 when zero condition 
  setexpzero <= zerogen(expwidth);
  -- set exponent to "11..11" when nan, infinity, or divide by 0
  setexpmax <= nanin OR infinitygen(expwidth) OR rangeerror;
                             
--***************
--*** OUTPUTS ***
--***************

  signout <= '0';   
  mantissaout <= mantissaff;
  exponentout <= exponentff; 
  -----------------------------------------------
  nanout <= nanff;
  overflowout <= overflowff;
  underflowout <= underflowff;

END rtl;

