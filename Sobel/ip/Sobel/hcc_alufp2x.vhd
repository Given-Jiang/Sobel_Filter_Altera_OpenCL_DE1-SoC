
LIBRARY ieee;
LIBRARY lpm;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ALUFP2X.VHD                           ***
--***                                             ***
--***   Function: Double Precision Floating Point ***
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

ENTITY hcc_alufp2x IS 
GENERIC (
         shiftspeed : integer := 1; -- '0' for comb. shift, '1' for piped shift
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      addsub : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      bbsat, bbzip : IN STD_LOGIC;

	  cc : OUT STD_LOGIC_VECTOR (77 DOWNTO 1);
	  ccsat, cczip : OUT STD_LOGIC
	 );
END hcc_alufp2x;

ARCHITECTURE rtl OF hcc_alufp2x IS
  
  type expbasefftype IS ARRAY (3+shiftspeed+doublespeed DOWNTO 1) OF STD_LOGIC_VECTOR (13 DOWNTO 1);
  type manfftype IS ARRAY (3 DOWNTO 1) OF STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  signal aaff, bbff : STD_LOGIC_VECTOR (77 DOWNTO 1); 
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;  
  signal manleftff, manrightff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal manleftdelff, manleftdeldelff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal manalignff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal expbaseff : expbasefftype;
  signal expshiftff : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal subexpone, subexptwo : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal switch : STD_LOGIC;
  signal expzerochk : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal expzerochkff : STD_LOGIC;
  signal addsubff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1); 
  signal ccsatff, cczipff : STD_LOGIC_VECTOR (3+shiftspeed+doublespeed DOWNTO 1);  
  signal invertleftff, invertrightff : STD_LOGIC;
  signal invertleftdelff, invertrightdelff : STD_LOGIC;
  signal shiftbusnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal aluleftnode, alurightnode : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal alunode, aluff : STD_LOGIC_VECTOR (64 DOWNTO 1);

  signal aaexp, bbexp, ccexp : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal aaman, bbman, ccman : STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  component hcc_rsftpipe64
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;

  component hcc_rsftcomb64
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	    outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	   );
  end component;
 
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
     
  paa: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
       
      FOR k IN 1 TO 77 LOOP 
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 64 LOOP
        manleftff(k) <= '0';
        manrightff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 13 LOOP
        FOR j IN 1 TO 3+shiftspeed+doublespeed LOOP
          expbaseff(j)(k) <= '0';
        END LOOP;
        expshiftff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3+shiftspeed LOOP
        addsubff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 3+shiftspeed+doublespeed LOOP
        ccsatff(k) <= '0';
        cczipff(k) <= '0';
      END LOOP; 
      invertleftff <= '0';
      invertrightff <= '0';
        
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
        FOR k IN 1 TO 64 LOOP
          manleftff(k) <= (aaff(k+13) AND NOT(switch)) OR (bbff(k+13) AND switch);
          manrightff(k) <= (bbff(k+13) AND NOT(switch)) OR (aaff(k+13) AND switch);
        END LOOP;
          
        FOR k IN 1 TO 13 LOOP
          expbaseff(1)(k) <= (aaff(k) AND NOT(switch)) OR (bbff(k) AND switch); 
        END LOOP;
        FOR k IN 2 TO (3+shiftspeed+doublespeed) LOOP
          expbaseff(k)(13 DOWNTO 1) <= expbaseff(k-1)(13 DOWNTO 1);  -- level 3 to 4/5/6
        END LOOP;
        
        FOR k IN 1 TO 13 LOOP
          expshiftff(k) <= (subexpone(k) AND NOT(switch)) OR (subexptwo(k) AND switch);
        END LOOP;
        
        invertleftff <= addsubff(1) AND switch;  
        invertrightff <= addsubff(1) AND NOT(switch); 
    
        ccsatff(1) <= aasatff OR bbsatff;
        -- once through add/sub, output can only be ieee754"0" if both inputs are ieee754"0"
        cczipff(1) <= aazipff AND bbzipff;
        FOR k IN 2 TO (3+shiftspeed+doublespeed) LOOP
          ccsatff(k) <= ccsatff(k-1);  -- level 3 to 4/5/6
          cczipff(k) <= cczipff(k-1);  -- level 3 to 4/5/6
        END LOOP;
      
      END IF;
        
    END IF;
      
  END PROCESS;
  
  subexpone <= aaff(13 DOWNTO 1) - bbff(13 DOWNTO 1);
  subexptwo <= bbff(13 DOWNTO 1) - aaff(13 DOWNTO 1);
  
  switch <= subexpone(13);
  
  expzerochk <= expshiftff - "0000001000000"; -- 63 ok, 64 not

  gsa: IF (shiftspeed = 0) GENERATE

    sftslow: hcc_rsftcomb64
    PORT MAP (inbus=>manrightff,shift=>expshiftff(6 DOWNTO 1),
              outbus=>shiftbusnode);

    psa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN
        
        FOR k IN 1 TO 64 LOOP
          manleftdelff(k) <= '0';
          manalignff(k) <= '0';  
        END LOOP;

      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN

          --*** LEVEL 3 ***
          FOR k IN 1 TO 64 LOOP
            manleftdelff(k) <= manleftff(k) XOR invertleftff;
            manalignff(k) <= (shiftbusnode(k) XOR invertrightff) AND expzerochk(13);
          END LOOP;

        END IF;

      END IF;

    END PROCESS;

    aluleftnode <= manleftdelff;
    alurightnode <= manalignff;

  END GENERATE;

  gsb: IF (shiftspeed = 1) GENERATE

    sftfast: hcc_rsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>manrightff,shift=>expshiftff(6 DOWNTO 1),
              outbus=>shiftbusnode);

    psa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN
        
        FOR k IN 1 TO 64 LOOP
          manleftdelff(k) <= '0';
          manleftdeldelff(k) <= '0';
          manalignff(k) <= '0';  
        END LOOP;
        invertleftdelff <= '0';
        invertrightdelff <= '0';
        expzerochkff <= '0';

      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN

          --*** LEVEL 3 ***
          manleftdelff <= manleftff;
          invertleftdelff <= invertleftff;
          invertrightdelff <= invertrightff;
          expzerochkff <= expzerochk(13);

		  --*** LEVEL 4 ***
          FOR k IN 1 TO 64 LOOP
            manleftdeldelff(k) <= manleftdelff(k) XOR invertleftdelff;
            manalignff(k) <= (shiftbusnode(k) XOR invertrightdelff) AND expzerochkff;
          END LOOP;

        END IF;

      END IF;

    END PROCESS;

    aluleftnode <= manleftdeldelff;
    alurightnode <= manalignff;

  END GENERATE;

  gaa: IF (doublespeed = 0) GENERATE

    paa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN
        
        FOR k IN 1 TO 64 LOOP
          aluff(k) <= '0';  
        END LOOP;

      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN

          aluff <= aluleftnode + alurightnode + addsubff(3+shiftspeed);

        END IF;

      END IF;

    END PROCESS;

    alunode <= aluff;

    --*** OUTPUTS ***
    cc <= alunode & expbaseff(3+shiftspeed)(13 DOWNTO 1);
    ccsat <= ccsatff(3+shiftspeed);
    cczip <= cczipff(3+shiftspeed);

  END GENERATE;
  
  gab: IF (doublespeed = 1) GENERATE
  
    gac: IF (synthesize = 0) GENERATE
      addone: hcc_addpipeb
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>aluleftnode,bb=>alurightnode,carryin=>addsubff(3+shiftspeed),
                cc=>alunode);
    END GENERATE;

    gad: IF (synthesize = 1) GENERATE
      addtwo: hcc_addpipes
      GENERIC MAP (width=>64,pipes=>2)
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                aa=>aluleftnode,bb=>alurightnode,carryin=>addsubff(3+shiftspeed),
                cc=>alunode);            
    END GENERATE;

    cc <= alunode & expbaseff(4+shiftspeed)(13 DOWNTO 1);
    ccsat <= ccsatff(4+shiftspeed);
    cczip <= cczipff(4+shiftspeed);
  	
  END GENERATE;
  
  --*** DEBUG SECTION ***
  aaexp <= aa(13 DOWNTO 1);
  bbexp <= bb(13 DOWNTO 1);
  ccexp <= expbaseff(3+shiftspeed+doublespeed)(13 DOWNTO 1);
  aaman <= aa(77 DOWNTO 14);
  bbman <= bb(77 DOWNTO 14);
  ccman <= alunode;

END rtl;

