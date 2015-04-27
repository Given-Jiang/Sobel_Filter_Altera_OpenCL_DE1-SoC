
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DIVNORND.VHD                          ***
--***                                             ***
--***   Function: Output Stage, No Rounding       ***
--***                                             ***
--***                                             ***
--***   24/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   22/04/09 - added NAN support, IEEE NAN    ***
--***   output                                    ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes: Latency = 1                          ***
--***************************************************

ENTITY hcc_divnornd IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      signin : IN STD_LOGIC;
      exponentin : IN STD_LOGIC_VECTOR (13 DOWNTO 1);
      mantissain : IN STD_LOGIC_VECTOR (53 DOWNTO 1); -- includes roundbit
      satin, zipin, nanin : IN STD_LOGIC;

		signout : OUT STD_LOGIC;
      exponentout : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      mantissaout : OUT STD_LOGIC_VECTOR (52 DOWNTO 1)
		);
END hcc_divnornd;

ARCHITECTURE rtl OF hcc_divnornd IS

  type exponentfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (51 DOWNTO 1);
  signal signff : STD_LOGIC;
  signal nanff : STD_LOGIC;
  signal dividebyzeroff : STD_LOGIC;  
  signal mantissaff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal exponentff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  
  signal infinitygen : STD_LOGIC_VECTOR (12 DOWNTO 1);
  signal zerogen : STD_LOGIC_VECTOR (12 DOWNTO 1);  
  signal setmanzero, setmanmax : STD_LOGIC;
  signal setexpzero, setexpmax : STD_LOGIC;

BEGIN
    
  gzv: FOR k IN 1 TO 51 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      signff <= '0';
      FOR k IN 1 TO 52 LOOP
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        exponentff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        signff <= signin;
  
        FOR k IN 1 TO 52 LOOP
          mantissaff(k) <= (mantissain(k+1) AND NOT(setmanzero)) OR setmanmax;
        END LOOP;
               
        FOR k IN 1 TO 11 LOOP
          exponentff(k) <= (exponentin(k) AND NOT(setexpzero)) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
                                                  
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************

  -- '1' when true for all cases
  
  -- infinity if exponent >= 255
  infinitygen(1) <= exponentin(1);
  gia: FOR k IN 2 TO 11 GENERATE
    infinitygen(k) <= infinitygen(k-1) AND exponentin(k);
  END GENERATE;
  -- 12/05/09 - make sure exponentin = -1 doesnt make infinity
  infinitygen(12) <= (infinitygen(11) AND NOT(exponentin(12)) AND NOT(exponentin(13))) OR 
                     satin OR (exponentin(12) AND NOT(exponentin(13))); -- '1' if infinity
                         
  -- zero if exponent <= 0
  zerogen(1) <= exponentin(1);
  gza: FOR k IN 2 TO 11 GENERATE
    zerogen(k) <= zerogen(k-1) OR exponentin(k);
  END GENERATE;
  zerogen(12) <= NOT(zerogen(11)) OR zipin OR exponentin(13); -- '1' if zero
                    
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= infinitygen(12) OR zerogen(12);
  setmanmax <= nanin;
  -- set exponent to 0 when zero condition 
  setexpzero <= zerogen(12);
  -- set exponent to "11..11" infinity
  setexpmax <= infinitygen(12) OR nanin;
                             
--***************
--*** OUTPUTS ***
--***************

  signout <= signff;   
  mantissaout <= mantissaff;
  exponentout <= exponentff; 

END rtl;

