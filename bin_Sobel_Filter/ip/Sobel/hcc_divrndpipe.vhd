
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DIVRNDPIPE.VHD                        ***
--***                                             ***
--***   Function: Output Stage, Pipelined Round   ***
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
--*** Notes: Latency = 3                          ***
--***************************************************

ENTITY hcc_divrndpipe IS 
GENERIC (synthesize : integer := 1); 
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
END hcc_divrndpipe;

ARCHITECTURE rtl OF hcc_divrndpipe IS

  signal zerovec : STD_LOGIC_VECTOR (53 DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal satinff, zipinff, naninff : STD_LOGIC_VECTOR (2 DOWNTO 1);  
  signal roundmantissanode : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (52 DOWNTO 1);
  signal exponentoneff, exponenttwoff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal exponentff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  
  signal manoverflow : STD_LOGIC_VECTOR (53 DOWNTO 1);
  signal manoverflowff : STD_LOGIC;
  signal infinitygen : STD_LOGIC_VECTOR (12 DOWNTO 1);
  signal zerogen : STD_LOGIC_VECTOR (12 DOWNTO 1);  
  signal setmanzero, setmanmax : STD_LOGIC;
  signal setexpzero, setexpmax : STD_LOGIC;

  component hcc_addpipeb
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;

  component hcc_addpipes
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
  
BEGIN
    
  gzv: FOR k IN 1 TO 53 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      signff <= "000";
      satinff <= "00";
      zipinff <= "00";
      naninff <= "00";
      manoverflowff <= '0';
      FOR k IN 1 TO 52 LOOP
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 13 LOOP
        exponentoneff(k) <= '0';
        exponenttwoff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        exponentff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        signff(1) <= signin;
        signff(2) <= signff(1);
        signff(3) <= signff(2);
        
        satinff(1) <= satin;
        satinff(2) <= satinff(1);
        zipinff(1) <= zipin;
        zipinff(2) <= zipinff(1);
        naninff(1) <= nanin;
        naninff(2) <= naninff(1);
         
        FOR k IN 1 TO 52 LOOP
          mantissaff(k) <= (roundmantissanode(k) AND NOT(setmanzero)) OR setmanmax;
        END LOOP;
        
        exponentoneff(13 DOWNTO 1) <= exponentin;
        exponenttwoff(13 DOWNTO 1) <= exponentoneff(13 DOWNTO 1) + 
                                      (zerovec(12 DOWNTO 1) & manoverflowff);                 
        FOR k IN 1 TO 11 LOOP
          exponentff(k) <= (exponenttwoff(k) AND NOT(setexpzero)) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;

  gaa: IF (synthesize = 0) GENERATE
    addb: hcc_addpipeb
    GENERIC MAP (width=>52,pipes=>2)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>mantissain(53 DOWNTO 2),bb=>zerovec(52 DOWNTO 1),
              carryin=>mantissain(1),
              cc=>roundmantissanode);
  END GENERATE;
         
  gab: IF (synthesize = 1) GENERATE
    addb: hcc_addpipes
    GENERIC MAP (width=>52,pipes=>2)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>mantissain(53 DOWNTO 2),bb=>zerovec(52 DOWNTO 1),
              carryin=>mantissain(1),
              cc=>roundmantissanode);
  END GENERATE;
  
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

  -- infinity if exponent >= 255
  infinitygen(1) <= exponenttwoff(1);
  gia: FOR k IN 2 TO 11 GENERATE
    infinitygen(k) <= infinitygen(k-1) AND exponenttwoff(k);
  END GENERATE;
  -- 12/05/09 - make sure exponent = -1 doesnt make infinity
  infinitygen(12) <= (infinitygen(11) AND NOT(exponenttwoff(12)) AND NOT(exponenttwoff(13))) OR 
                      satinff(2) OR (exponenttwoff(12) AND NOT(exponenttwoff(13))); -- '1' if infinity
                         
  -- zero if exponent <= 0
  zerogen(1) <= exponenttwoff(1);
  gza: FOR k IN 2 TO 11 GENERATE
    zerogen(k) <= zerogen(k-1) OR exponenttwoff(k);
  END GENERATE;
  zerogen(12) <= NOT(zerogen(11)) OR zipinff(2) OR exponenttwoff(13); -- '1' if zero
                    
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= infinitygen(12) OR zerogen(12);
  setmanmax <= naninff(2);
  -- set exponent to 0 when zero condition 
  setexpzero <= zerogen(12);
  -- set exponent to "11..11" infinity
  setexpmax <= infinitygen(12) OR naninff(2);
                             
--***************
--*** OUTPUTS ***
--***************

  signout <= signff(3);   
  mantissaout <= mantissaff;
  exponentout <= exponentff; 

END rtl;

