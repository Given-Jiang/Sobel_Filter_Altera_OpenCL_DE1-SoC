
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ALUFP1X.VHD                           ***
--***                                             ***
--***   Function: Single Precision Floating Point ***
--***             Adder                           ***
--***                                             ***
--***   14/07/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_alufp1x IS 
GENERIC (
         mantissa : positive := 36;
         shiftspeed : integer := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      addsub : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		ccsat, cczip : OUT STD_LOGIC
		);
END hcc_alufp1x;

ARCHITECTURE rtl OF hcc_alufp1x IS
  
  type expbasefftype IS ARRAY (3+shiftspeed DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);
  type aluleftdelfftype IS ARRAY (2 DOWNTO 1) OF STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (mantissa-1 DOWNTO 1);
  
  signal aaff, bbff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1); 
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;  
  signal ccsatff, cczipff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1);
  signal addsubff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1); 
  signal manleftff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal shiftbusnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal manrightff, manalignff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal invertleftff, invertrightff : STD_LOGIC;
  signal invertleftdelff, invertrightdelff : STD_LOGIC;
  signal invertleftnode, invertrightnode : STD_LOGIC;
  signal aluff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aluleftnode, alurightnode, alucarrynode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aluleftff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aluleftdelff : aluleftdelfftype;
  signal subexpone, subexptwo : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expshiftff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal switch : STD_LOGIC;
  signal expzerochk : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal expzerochkff : STD_LOGIC;
  signal expzerochknode : STD_LOGIC;
  signal expbaseff : expbasefftype;

  signal aaexp, bbexp, ccexp : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal aaman, bbman, ccman : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  
  component hcc_rsftpipe32 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
  component hcc_rsftpipe36 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
  end component;

  component hcc_rsftcomb32 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
  component hcc_rsftcomb36 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    );
  end component;
    
BEGIN
    
  gza: FOR k IN 1 TO mantissa-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
     
  paa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
       
      FOR k IN 1 TO mantissa+10 LOOP 
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO mantissa LOOP
        manleftff(k) <= '0';
        manrightff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 10 LOOP
        expshiftff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3+shiftspeed LOOP
        FOR j IN 1 TO 10 LOOP
          expbaseff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      invertleftff <= '0';
      invertrightff <= '0';
      FOR k IN 1 TO mantissa LOOP
        manalignff(k) <= '0';
        aluff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3+shiftspeed LOOP
        addsubff(k) <= '0';
        ccsatff(k) <= '0';
        cczipff(k) <= '0';
      END LOOP;
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
          
        --*** LEVEL 1 ***
        aaff <= aa;
        bbff <= bb;
        aasatff <= aasat;
        bbsatff <= bbsat;
        aazipff <= aazip;
        bbzipff <= bbzip;
        addsubff(1) <= addsub;
        FOR k IN 2 TO 3+shiftspeed LOOP 
          addsubff(k) <= addsubff(k-1);
        END LOOP;
        
        --*** LEVEL 2 ***
        FOR k IN 1 TO mantissa LOOP
          manleftff(k) <= (aaff(k+10) AND NOT(switch)) OR (bbff(k+10) AND switch);
          manrightff(k) <= (bbff(k+10) AND NOT(switch)) OR (aaff(k+10) AND switch);
        END LOOP;
 
        FOR k IN 1 TO 10 LOOP
          expshiftff(k) <= (subexpone(k) AND NOT(switch)) OR (subexptwo(k) AND switch);
        END LOOP;
          
        FOR k IN 1 TO 10 LOOP
          expbaseff(1)(k) <= (aaff(k) AND NOT(switch)) OR (bbff(k) AND switch); 
        END LOOP;
        FOR k IN 2 TO 3+shiftspeed LOOP
          expbaseff(k)(10 DOWNTO 1) <= expbaseff(k-1)(10 DOWNTO 1); 
        END LOOP;
        
        invertleftff <= addsubff(1) AND switch; 
        invertrightff <= addsubff(1) AND NOT(switch); 
    
        ccsatff(1) <= aasatff OR bbsatff;
        cczipff(1) <= aazipff AND bbzipff;
        FOR k IN 2 TO 3+shiftspeed LOOP
          ccsatff(k) <= ccsatff(k-1); 
          cczipff(k) <= cczipff(k-1);
        END LOOP;

        --*** LEVEL 3 or 4 ***
        FOR k IN 1 TO mantissa LOOP
          manalignff(k) <= (shiftbusnode(k) XOR invertrightnode) AND expzerochknode;
        END LOOP;
        
        --*** LEVEL 4 or 5 ***
        aluff <= aluleftnode + alurightnode + alucarrynode;
      
      END IF;
        
    END IF;
      
  END PROCESS;
   
  gssa: IF (shiftspeed = 0) GENERATE
  
    psa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN
       
        FOR k IN 1 TO mantissa LOOP 
          aluleftff(k) <= '0';
        END LOOP;
         
      ELSIF (rising_edge(sysclk)) THEN
             
        IF (enable = '1') THEN
          FOR k IN 1 TO mantissa LOOP
            aluleftff(k) <= manleftff(k) XOR invertleftnode;
          END LOOP;
        END IF;
    
      END IF;
      
    END PROCESS;
  
    invertleftnode <= invertleftff;
    invertrightnode <= invertrightff;
    expzerochknode <= expzerochk(10);
    
    aluleftnode <= aluleftff;
    alucarrynode <= zerovec(mantissa-1 DOWNTO 1) & addsubff(3);
    
  END GENERATE;
  
  gssb: IF (shiftspeed = 1) GENERATE
  
    psa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN
       
        FOR k IN 1 TO mantissa LOOP 
          aluleftdelff(1)(k) <= '0';
          aluleftdelff(2)(k) <= '0';
        END LOOP;
        invertleftdelff <= '0';
        invertrightdelff <= '0';
        expzerochkff <= '0';
         
      ELSIF (rising_edge(sysclk)) THEN
             
        IF (enable = '1') THEN
            
          aluleftdelff(1)(mantissa DOWNTO 1) <= manleftff;
          FOR k IN 1 TO mantissa LOOP
            aluleftdelff(2)(k) <= aluleftdelff(1)(k) XOR invertleftnode;
          END LOOP;
          invertleftdelff <= invertleftff;
          invertrightdelff <= invertrightff;
          expzerochkff <= expzerochk(10);
          
        END IF;
    
      END IF;
      
    END PROCESS;
  
    invertleftnode <= invertleftdelff;
    invertrightnode <= invertrightdelff;
    expzerochknode <= expzerochkff;
    
    aluleftnode <= aluleftdelff(2)(mantissa DOWNTO 1);
    alucarrynode <= zerovec(mantissa-1 DOWNTO 1) & addsubff(4);
    
  END GENERATE;
   
  alurightnode <= manalignff;
 
  subexpone <= aaff(10 DOWNTO 1) - bbff(10 DOWNTO 1);
  subexptwo <= bbff(10 DOWNTO 1) - aaff(10 DOWNTO 1);
  
  switch <= subexpone(10);
  
  gsa: IF (mantissa = 32) GENERATE
  
    expzerochk <= expshiftff - "0000100000"; -- 31 ok, 32 not

    gsb: IF (shiftspeed = 0) GENERATE
      shiftone: hcc_rsftcomb32
      PORT MAP (inbus=>manrightff,shift=>expshiftff(5 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;    
    gsc: IF (shiftspeed = 1) GENERATE
      shifttwo: hcc_rsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>manrightff,shift=>expshiftff(5 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;
              
  END GENERATE;

  gsd: IF (mantissa = 36) GENERATE
  
    expzerochk <= expshiftff - "0000100100"; -- 35 ok, 36 not
    
    gse: IF (shiftspeed = 0) GENERATE
      shiftone: hcc_rsftcomb36
      PORT MAP (inbus=>manrightff,shift=>expshiftff(6 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;    
    gsf: IF (shiftspeed = 1) GENERATE
      shifttwo: hcc_rsftpipe36
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>manrightff,shift=>expshiftff(6 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;
              
  END GENERATE;

  --*** OUTPUT ***
  cc <= aluff & expbaseff(3+shiftspeed)(10 DOWNTO 1);
  ccsat <= ccsatff(3+shiftspeed);
  cczip <= cczipff(3+shiftspeed);
 
   --*** DEBUG SECTION ***
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  ccexp <= expbaseff(3+shiftspeed)(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  ccman <= aluff;
   
END rtl;

