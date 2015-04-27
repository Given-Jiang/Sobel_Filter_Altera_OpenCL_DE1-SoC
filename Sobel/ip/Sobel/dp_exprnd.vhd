
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_EXPRND.VHD                             ***
--***                                             ***
--***   Function: DP Exponent Output Block -      ***
--***   Rounded                                   ***
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

ENTITY dp_exprnd IS 
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
END dp_exprnd;

ARCHITECTURE rtl OF dp_exprnd IS

  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  type exponentfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (manwidth-1 DOWNTO 1);
  signal nanff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal rangeerrorff : STD_LOGIC;
  signal overflownode, underflownode : STD_LOGIC;
  signal overflowff, underflowff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal manoverflowbitff : STD_LOGIC; 
  signal roundmantissaff, mantissaff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal exponentnode : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  signal exponentoneff : STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  signal exponenttwoff : STD_LOGIC_VECTOR (expwidth DOWNTO 1);
    
  signal manoverflow : STD_LOGIC_VECTOR (manwidth+1 DOWNTO 1);
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
        
      nanff <= "00";
      rangeerrorff <= '0';
      overflowff <= "00";
      underflowff <= "00";
      manoverflowbitff <= '0';
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
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        nanff(1) <= nanin;
        nanff(2) <= nanff(1);
        rangeerrorff <= rangeerror;
        overflowff(1) <= overflownode;
        overflowff(2) <= overflowff(1);
        underflowff(1) <= underflownode;
        underflowff(2) <= underflowff(1);
        
        manoverflowbitff <= manoverflow(manwidth+1);
        
        roundmantissaff <= mantissaexp(manwidth+1 DOWNTO 2) + (zerovec & mantissaexp(1));
        
        -- nan takes precedence (set max)
        -- nan takes precedence (set max)  
        FOR k IN 1 TO manwidth LOOP
          mantissaff(k) <= (roundmantissaff(k) AND setmanzero) OR setmanmax;
        END LOOP;
        
        exponentoneff(expwidth+2 DOWNTO 1) <= "00" & exponentexp;                 
        FOR k IN 1 TO expwidth LOOP
          exponenttwoff(k) <= (exponentnode(k) AND setexpzero) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
  
  exponentnode <= exponentoneff(expwidth+2 DOWNTO 1) + 
                 (zerovec(expwidth+1 DOWNTO 1) & manoverflowbitff);

--*********************************
--*** PREDICT MANTISSA OVERFLOW ***   
--*********************************
     
  manoverflow(1) <= mantissaexp(1);
  gmoa: FOR k IN 2 TO manwidth+1 GENERATE
    manoverflow(k) <= manoverflow(k-1) AND mantissaexp(k);
  END GENERATE; 
                                                                 
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************

  -- infinity if exponent == 255
  infinitygen(1) <= exponentnode(1);
  gia: FOR k IN 2 TO expwidth GENERATE
    infinitygen(k) <= infinitygen(k-1) AND exponentnode(k);
  END GENERATE;
  infinitygen(expwidth+1) <= infinitygen(expwidth) OR 
                            (exponentnode(expwidth+1) AND 
                             NOT(exponentnode(expwidth+2))); -- '1' if infinity
                                                    
  -- zero if exponent == 0
  zerogen(1) <= exponentnode(1);
  gza: FOR k IN 2 TO expwidth GENERATE
    zerogen(k) <= zerogen(k-1) OR exponentnode(k);
  END GENERATE;
  zerogen(expwidth+1) <= zerogen(expwidth) AND 
                         NOT(exponentnode(expwidth+2)); -- '0' if zero
                                           
  -- trap any other overflow errors
  -- when sign = 0 and rangeerror = 1, overflow
  -- when sign = 1 and rangeerror = 1, underflow
  overflownode <= NOT(signin) AND rangeerror;
  underflownode <= signin AND rangeerror;
  
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= NOT(infinitygen(expwidth+1)) AND zerogen(expwidth+1) AND NOT(rangeerrorff);
  -- setmantissa to "11..11" when nan
  setmanmax <= nanff(1);
  -- set exponent to 0 when zero condition 
  setexpzero <= zerogen(expwidth+1);
  -- set exponent to "11..11" when nan, infinity, or divide by 0
  setexpmax <= nanff(1) OR infinitygen(expwidth+1) OR rangeerrorff;
                             
--***************
--*** OUTPUTS ***
--***************
  
  signout <= '0';   
  mantissaout <= mantissaff;
  exponentout <= exponenttwoff; 
  -----------------------------------------------
  nanout <= nanff(2);
  overflowout <= overflowff(2);
  underflowout <= underflowff(2);

END rtl;

