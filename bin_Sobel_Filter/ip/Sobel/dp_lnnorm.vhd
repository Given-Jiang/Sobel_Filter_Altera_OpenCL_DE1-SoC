
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_LNNORM.VHD                             ***
--***                                             ***
--***   Function: Double Precision Normalization  ***
--***   of LN calculation                         ***
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
--*** Latency = 3 + 2*Speed                       ***
--*************************************************** 

ENTITY dp_lnnorm IS 
GENERIC (
         speed : integer := 1
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      inman : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      inexp : IN STD_LOGIC_VECTOR (11 DOWNTO 1);
      
      outman : OUT STD_LOGIC_VECTOR (64 DOWNTO 1);
      outexp : OUT STD_LOGIC_VECTOR (11 DOWNTO 1);
      zero : OUT STD_LOGIC
    );
END dp_lnnorm;

ARCHITECTURE rtl OF dp_lnnorm IS

  -- 3+2*speed
  
  signal shift, shiftff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal zerochk : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal inmanff, outmanff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal inexpff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal inmandelbus : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal outmanbus : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal expaddbus, expsubbus : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal expmidbus, expoutbus : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal zeroff : STD_LOGIC_VECTOR (2+2*speed DOWNTO 1);

  component dp_lnclz
  PORT (
        mantissa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
  
  component dp_lnclzpipe
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        mantissa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
     
  component dp_lsft64x6
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
        outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
      );
  end component;
  
  component dp_lsft64x6pipe
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
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
             
BEGIN
  
  ppin: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 64 LOOP
        inmanff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        inexpff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 2+2*speed LOOP
        zeroff(k) <= '0';
      END LOOP;
      shiftff <= "000000";
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
          
        inmanff <= inman;
        inexpff <= inexp;
      
        zeroff(1) <= zerochk(64);
        FOR k IN 2 TO 2+2*speed LOOP
          zeroff(k) <= zeroff(k-1);
        END LOOP;
      
        shiftff <= shift;
        
      END IF;
  
    END IF;
    
  END PROCESS;
  
  zerochk(1) <= inmanff(1);
  gza: FOR k IN 2 TO 64 GENERATE
    zerochk(k) <= zerochk(k-1) OR inmanff(k);
  END GENERATE;
  
  delma: fp_del
  GENERIC MAP (width=>64,pipes=>1+speed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>inmanff,cc=>inmandelbus);
  
  gsa: IF (speed = 0) GENERATE
  
    clz: dp_lnclz
    PORT MAP (mantissa=>inmanff,leading=>shift);
  
    sft: dp_lsft64x6
    PORT MAP (inbus=>inmandelbus,shift=>shiftff,
              outbus=>outmanbus);
  
  END GENERATE;

  gsb: IF (speed = 1) GENERATE
  
    clzp: dp_lnclzpipe
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              mantissa=>inmanff,
              leading=>shift);
  
    sftp: dp_lsft64x6pipe
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>inmandelbus,shift=>shiftff,
              outbus=>outmanbus);
  
  END GENERATE;
  
  -- add 2 - 1 for right shift to avoid overflow 
  expaddbus <= inexpff + 1;
  
  delxa: fp_del
  GENERIC MAP (width=>11,pipes=>1+speed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>expaddbus,cc=>expmidbus);
          
  expsubbus <= expmidbus - ("00000" & shiftff);
  
  delxb: fp_del
  GENERIC MAP (width=>11,pipes=>1+speed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>expsubbus,cc=>expoutbus);

  ppout: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 64 LOOP
        outmanff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN    
        outmanff <= outmanbus;
      END IF;

    END IF;
    
  END PROCESS;
  
  --*** OUTPUTS ***
  outman <= outmanff;
  outexp <= expoutbus;
  zero <= zeroff(2+2*speed);
      
END rtl;

