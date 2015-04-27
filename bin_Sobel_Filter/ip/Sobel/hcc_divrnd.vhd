
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DIVRND.VHD                            ***
--***                                             ***
--***   Function: Output Stage, Rounding          ***
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
--*** Notes: Latency = 2                          ***
--***************************************************

ENTITY hcc_divrnd IS 
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
END hcc_divrnd;

ARCHITECTURE rtl OF hcc_divrnd IS

  signal zerovec : STD_LOGIC_VECTOR (51 DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal satinff, zipinff, naninff : STD_LOGIC;
  signal overflowbitff : STD_LOGIC; 
  signal roundmantissaff, mantissaff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal exponentnode : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal exponentoneff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal exponenttwoff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  
  signal manoverflow : STD_LOGIC_VECTOR (53 DOWNTO 1);
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
        
      signff <= "00";
      satinff <= '0';
      zipinff <= '0';
      naninff <= '0';
      overflowbitff <= '0';
      FOR k IN 1 TO 52 LOOP
        roundmantissaff(k) <= '0';
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 13 LOOP
        exponentoneff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        exponenttwoff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        signff(1) <= signin;
        signff(2) <= signff(1);
        satinff <= satin;
        zipinff <= zipin;
        naninff <= nanin;
        
        overflowbitff <= manoverflow(53);
        
        roundmantissaff <= mantissain(53 DOWNTO 2) + (zerovec & mantissain(1));

        FOR k IN 1 TO 52 LOOP
          mantissaff(k) <= (roundmantissaff(k) AND NOT(setmanzero)) OR setmanmax;
        END LOOP;
        
        exponentoneff(13 DOWNTO 1) <= exponentin(13 DOWNTO 1);                 
        FOR k IN 1 TO 11 LOOP
          exponenttwoff(k) <= (exponentnode(k) AND NOT(setexpzero)) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
  
  exponentnode <= exponentoneff(13 DOWNTO 1) + 
                 (zerovec(12 DOWNTO 1) & overflowbitff);

--*********************************
--*** PREDICT MANTISSA OVERFLOW ***   
--*********************************
     
  manoverflow(1) <= mantissain(1);
  gmoa: FOR k IN 2 TO 53 GENERATE
    manoverflow(k) <= manoverflow(k-1) AND mantissain(k);
  END GENERATE; 
                                                                 
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************

  -- '1' when true for all cases
  
  -- infinity if exponent >= 255
  infinitygen(1) <= exponentnode(1);
  gia: FOR k IN 2 TO 11 GENERATE
    infinitygen(k) <= infinitygen(k-1) AND exponentnode(k);
  END GENERATE;
  -- 12/05/09 - make sure exponentnode = -1 doesnt make infinity
  infinitygen(12) <= (infinitygen(11) AND NOT(exponentnode(12)) AND NOT(exponentnode(13))) OR 
                      satinff OR (exponentnode(12) AND NOT(exponentnode(13))); -- '1' if infinity
                         
  -- zero if exponent <= 0
  zerogen(1) <= exponentnode(1);
  gza: FOR k IN 2 TO 11 GENERATE
    zerogen(k) <= zerogen(k-1) OR exponentnode(k);
  END GENERATE;
  zerogen(12) <= NOT(zerogen(11)) OR zipinff OR exponentnode(13); -- '1' if zero
                    
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= infinitygen(12) OR zerogen(12);
  setmanmax <= naninff;
  -- set exponent to 0 when zero condition 
  setexpzero <= zerogen(12);
  -- set exponent to "11..11" infinity
  setexpmax <= infinitygen(12) OR naninff;
                        
--***************
--*** OUTPUTS ***
--***************

  signout <= signff(2);   
  mantissaout <= mantissaff;
  exponentout <= exponenttwoff;

END rtl;

