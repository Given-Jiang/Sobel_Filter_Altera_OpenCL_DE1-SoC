
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_EXPRNDPIPE.VHD                         ***
--***                                             ***
--***   Function: DP Exponent Output Block -      ***
--***   Rounded, Pipelined Add                    ***
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

ENTITY dp_exprndpipe IS 
GENERIC (synthesize : integer := 1); 
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
END dp_exprndpipe;

ARCHITECTURE rtl OF dp_exprndpipe IS

  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  type exponentfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (manwidth+1 DOWNTO 1);
  signal nanff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal rangeerrorff : STD_LOGIC_VECTOR (2 DOWNTO 1);
  signal overflownode, underflownode : STD_LOGIC; 
  signal overflowff, underflowff : STD_LOGIC_VECTOR (3 DOWNTO 1);  
  signal roundmantissanode : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal exponentff : exponentfftype;
       
  signal manoverflow : STD_LOGIC_VECTOR (manwidth+1 DOWNTO 1);
  signal manoverflowff : STD_LOGIC;
  signal infinitygen : STD_LOGIC_VECTOR (expwidth+1 DOWNTO 1);
  signal zerogen : STD_LOGIC_VECTOR (expwidth+1 DOWNTO 1);  
  signal setmanzero, setmanmax : STD_LOGIC;
  signal setexpzero, setexpmax : STD_LOGIC;

  component dp_fxadd 
  GENERIC (
           width : positive := 64;
           pipes : positive := 1;
           synthesize : integer := 0
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
    
  gzv: FOR k IN 1 TO manwidth+1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pra: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN

      nanff <= "000";
      rangeerrorff <= "00";
      overflowff <= "000";
      underflowff <= "000";
      manoverflowff <= '0';
      FOR k IN 1 TO manwidth LOOP
        mantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO expwidth LOOP
        exponentff(1)(k) <= '0';
        exponentff(2)(k) <= '0';
        exponentff(3)(k) <= '0';
      END LOOP;
        
    ELSIF (rising_edge(sysclk)) THEN
    
      IF(enable = '1') THEN 
      
        nanff(1) <= nanin;
        nanff(2) <= nanff(1);
        nanff(3) <= nanff(2);
        rangeerrorff(1) <= rangeerror;
        rangeerrorff(2) <= rangeerrorff(1);
        overflowff(1) <= overflownode;
        overflowff(2) <= overflowff(1);
        overflowff(3) <= overflowff(2);
        underflowff(1) <= underflownode;
        underflowff(2) <= underflowff(1);
        underflowff(3) <= underflowff(2);
        
        manoverflowff <= manoverflow(53);
        
        -- nan takes precedence (set max)
        -- nan takes precedence (set max)  
        FOR k IN 1 TO manwidth LOOP
          mantissaff(k) <= (roundmantissanode(k) AND setmanzero) OR setmanmax;
        END LOOP;
        
        exponentff(1)(expwidth+2 DOWNTO 1) <= "00" & exponentexp(expwidth DOWNTO 1);
        exponentff(2)(expwidth+2 DOWNTO 1) <= (exponentff(1)(expwidth+2 DOWNTO 1)) + 
                                              (zerovec(expwidth+1 DOWNTO 1) & manoverflowff);                 
        FOR k IN 1 TO expwidth LOOP
          exponentff(3)(k) <= (exponentff(2)(k) AND setexpzero) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
       
  rndadd: dp_fxadd 
  GENERIC MAP(width=>manwidth,pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>mantissaexp(manwidth+1 DOWNTO 2),bb=>zerovec(manwidth DOWNTO 1),
            carryin=>mantissaexp(1),
            cc=>roundmantissanode);

--*********************************
--*** PREDICT MANTISSA OVERFLOW ***   
--*********************************
     
  manoverflow(1) <= mantissaexp(1);
  gmoa: FOR k IN 2 TO 53 GENERATE
    manoverflow(k) <= manoverflow(k-1) AND mantissaexp(k);
  END GENERATE;                                           
    
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************

  -- infinity if exponent >= 255
  infinitygen(1) <= exponentff(2)(1);
  gia: FOR k IN 2 TO expwidth GENERATE
    infinitygen(k) <= infinitygen(k-1) AND exponentff(2)(k);
  END GENERATE;
  infinitygen(expwidth+1) <= infinitygen(expwidth) OR 
                            (exponentff(2)(expwidth+1) AND 
                             NOT(exponentff(2)(expwidth+2))); -- ;1' if infinity
                         
  -- zero if exponent <= 0
  zerogen(1) <= exponentff(2)(1);
  gza: FOR k IN 2 TO expwidth GENERATE
    zerogen(k) <= zerogen(k-1) OR exponentff(2)(k);
  END GENERATE;
  zerogen(expwidth+1) <= zerogen(expwidth) AND 
                         NOT(exponentff(2)(expwidth+2)); -- '0' if zero
  
    -- trap any other overflow errors
  -- when sign = 0 and rangeerror = 1, overflow
  -- when sign = 1 and rangeerror = 1, underflow
  overflownode <= NOT(signin) AND rangeerror;
  underflownode <= signin AND rangeerror;
                    
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= NOT(infinitygen(expwidth+1)) AND zerogen(expwidth+1) AND NOT(rangeerrorff(2));
  -- setmantissa to "11..11" when nan
  setmanmax <= nanff(2);
  -- set exponent to 0 when zero condition 
  setexpzero <= zerogen(expwidth+1);
  -- set exponent to "11..11" when nan, infinity, or divide by 0
  setexpmax <= nanff(2) OR infinitygen(expwidth+1) OR rangeerrorff(2);
                             
--***************
--*** OUTPUTS ***
--***************

  signout <= '0';   
  mantissaout <= mantissaff;
  exponentout <= exponentff(3)(expwidth DOWNTO 1); 
  -----------------------------------------------
  nanout <= nanff(3);
  overflowout <= overflowff(3);
  underflowout <= underflowff(3);
  
END rtl;

