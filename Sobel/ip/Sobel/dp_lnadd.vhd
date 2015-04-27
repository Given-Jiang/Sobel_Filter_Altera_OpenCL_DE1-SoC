
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_LNADD.VHD                              ***
--***                                             ***
--***   Function: Double Precision Addition of    ***
--***   LN elements                               ***
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
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** Latency = 4 + 2*Speed                       ***
--***************************************************

ENTITY dp_lnadd IS 
GENERIC (
         speed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aaman : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      aaexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      bbman : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      bbexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);

	   ccman : OUT STD_LOGIC_VECTOR (64 DOWNTO 1);
	   ccexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1)
	 );
END dp_lnadd;

ARCHITECTURE rtl OF dp_lnadd IS
  
  type expbasefftype IS ARRAY (3+2*speed DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  
  signal aamanff, bbmanff : STD_LOGIC_VECTOR (64 DOWNTO 1); 
  signal aaexpff, bbexpff : STD_LOGIC_VECTOR (11 DOWNTO 1);  
  signal manleftff, manrightff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal aluleftff, alurightff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal expbaseff : expbasefftype;
  signal shiftff : STD_LOGIC_VECTOR (5 DOWNTO 1);
  signal subexpone, subexptwo : STD_LOGIC_VECTOR (12 DOWNTO 1);
  signal switch : STD_LOGIC;
  signal shiftleftnode, shiftrightnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal alunode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  
    component dp_rsft64x5 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);
        outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
      );
  end component;
  
  component dp_rsft64x5pipe IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);
        outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
      );
  end component;

  component fp_del
  GENERIC (
           width : positive := 64;
           pipes : positive := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
  
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
     
  paa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
       
      FOR k IN 1 TO 64 LOOP 
        aamanff(k) <= '0';
        bbmanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP 
        aaexpff(k) <= '0';
        bbexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 64 LOOP
        manleftff(k) <= '0';
        manrightff(k) <= '0';
        aluleftff(k) <= '0';
        alurightff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        FOR j IN 1 TO 3+speed LOOP
          expbaseff(j)(k) <= '0';
        END LOOP;
      END LOOP;
      shiftff <= "00000";
        
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        --*** LEVEL 1 ***
        aamanff <= aaman;
        bbmanff <= bbman;
        aaexpff <= aaexp;
        bbexpff <= bbexp;
        
        --*** LEVEL 2 ***
        FOR k IN 1 TO 64 LOOP
          manleftff(k) <= (aamanff(k) AND NOT(switch)) OR (bbmanff(k) AND switch);
          manrightff(k) <= (bbmanff(k) AND NOT(switch)) OR (aamanff(k) AND switch);
        END LOOP;
          
        FOR k IN 1 TO 11 LOOP
          expbaseff(1)(k) <= (aaexpff(k) AND NOT(switch)) OR (bbexpff(k) AND switch); 
        END LOOP;
        FOR k IN 2 TO (3+2*speed) LOOP
          expbaseff(k)(11 DOWNTO 1) <= expbaseff(k-1)(11 DOWNTO 1);  -- level 3 to 4/6
        END LOOP;
        
        FOR k IN 1 TO 5 LOOP
          shiftff(k) <= (subexpone(k) AND NOT(switch)) OR (subexptwo(k) AND switch);
        END LOOP;
        
        aluleftff <= shiftleftnode;
        alurightff <= shiftrightnode;
      
      END IF;
        
    END IF;
      
  END PROCESS;
  
  subexpone <= ('0' & aaexpff) - ('0' & bbexpff);
  subexptwo <= ('0' & bbexpff) - ('0' & aaexpff);

  switch <= subexpone(12);

  gsa: IF (speed = 0) GENERATE
  
    shifter: dp_rsft64x5
    PORT MAP (inbus=>manrightff,shift=>shiftff,
              outbus=>shiftrightnode);
              
    shiftleftnode <= manleftff;
              
  END GENERATE;

  gsb: IF (speed = 1) GENERATE
  
    shifter: dp_rsft64x5pipe
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>manrightff,shift=>shiftff,
              outbus=>shiftrightnode);
   
    sftdel: fp_del
    GENERIC MAP (width=>64,pipes=>1)
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              aa=>manleftff,
              cc=>shiftleftnode);

  END GENERATE;

  -- level 3+speed in, level 4+2*speed out
  adder: dp_fxadd
  GENERIC MAP (width=>64,pipes=>speed+1,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aluleftff,bb=>alurightff,carryin=>'0',
            cc=>alunode);

  --*** OUTPUTS ***
  ccman <= alunode;
  ccexp <= expbaseff(3+2*speed)(11 DOWNTO 1);

END rtl;

