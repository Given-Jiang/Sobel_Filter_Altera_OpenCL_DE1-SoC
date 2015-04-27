
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_LNRNDPIPE.VHD                          ***
--***                                             ***
--***   Function: DP LOG Output Block - Pipelined ***
--***   Round                                     ***
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

ENTITY dp_lnrndpipe IS 
GENERIC (synthesize : integer := 1); 
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
END dp_lnrndpipe;

ARCHITECTURE rtl OF dp_lnrndpipe IS

  constant expwidth : positive := 11;
  constant manwidth : positive := 52;
  
  type exponentfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (expwidth+2 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (manwidth+1 DOWNTO 1);
  signal nanff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal zeroff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal infinityff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal signff : STD_LOGIC_VECTOR (3 DOWNTO 1);
  signal roundmantissanode : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal mantissaff : STD_LOGIC_VECTOR (manwidth DOWNTO 1);
  signal exponentff : exponentfftype;
       
  signal manoverflow : STD_LOGIC_VECTOR (manwidth+1 DOWNTO 1);
  signal manoverflowff : STD_LOGIC;
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
      signff <= "000";
      infinityff <= "000";
      zeroff <= "000";
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
        infinityff(1) <= infinityin;
        infinityff(2) <= infinityff(1);
        infinityff(3) <= infinityff(2);
        zeroff(1) <= zeroin;
        zeroff(2) <= zeroff(1);
        zeroff(3) <= zeroff(2);
        signff(1) <= signln;
        signff(2) <= signff(1);
        signff(3) <= signff(2);
        
        manoverflowff <= manoverflow(53);
        
        -- nan takes precedence (set max)  
        FOR k IN 1 TO manwidth LOOP
          mantissaff(k) <= (roundmantissanode(k) AND NOT(setmanzero)) OR setmanmax;
        END LOOP;
        
        exponentff(1)(expwidth+2 DOWNTO 1) <= "00" & exponentln(expwidth DOWNTO 1);
        exponentff(2)(expwidth+2 DOWNTO 1) <= (exponentff(1)(expwidth+2 DOWNTO 1)) + 
                                              (zerovec(expwidth+1 DOWNTO 1) & manoverflowff);                 
        FOR k IN 1 TO expwidth LOOP
          exponentff(3)(k) <= (exponentff(2)(k) AND NOT(setexpzero)) OR setexpmax;
        END LOOP;
      
      END IF;
             
    END IF;
      
  END PROCESS;
       
  rndadd: dp_fxadd 
  GENERIC MAP(width=>manwidth,pipes=>2,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>mantissaln(manwidth+1 DOWNTO 2),bb=>zerovec(manwidth DOWNTO 1),
            carryin=>mantissaln(1),
            cc=>roundmantissanode);

--*********************************
--*** PREDICT MANTISSA OVERFLOW ***   
--*********************************
     
  manoverflow(1) <= mantissaln(1);
  gmoa: FOR k IN 2 TO 53 GENERATE
    manoverflow(k) <= manoverflow(k-1) AND mantissaln(k);
  END GENERATE;                                           
    
--**********************************
--*** CHECK GENERATED CONDITIONS ***   
--**********************************
                    
  -- all set to '1' when true
  
  -- set mantissa to 0 when infinity or zero condition
  setmanzero <= infinityff(2) OR NOT(zeroff(2));
  -- setmantissa to "11..11" when nan
  setmanmax <= nanff(2);
  -- set exponent to 0 when zero condition 
  setexpzero <= NOT(zeroff(2));
  -- set exponent to "11..11" when nan or infinity
  setexpmax <= nanff(2) OR infinityff(2);
            
--***************
--*** OUTPUTS ***
--***************

  signout <= signff(3);
  mantissaout <= mantissaff;
  exponentout <= exponentff(3)(expwidth DOWNTO 1); 
  -----------------------------------------------
  nanout <= nanff(3);
  overflowout <= infinityff(3);
  zeroout <= zeroff(3);
  
END rtl;

