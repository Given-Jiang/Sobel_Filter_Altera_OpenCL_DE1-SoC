
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
--***   16/04/09 - add NAN support                ***
--***   04/05/10 - optimized structure            ***
--***   15/10/10 - bug in shiftcheckbit           ***
--***                                             ***
--***************************************************

ENTITY hcc_alufp1x IS 
GENERIC (
         mantissa : positive := 32;
         shiftspeed : integer := 0;
         outputpipe : integer := 1; -- 0 = no pipe, 1 = pipe (for this function only - input, not output pipes affected)
         addsub_resetval : std_logic
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      addsub : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aasat, aazip, aanan : IN STD_LOGIC; 
      bb : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      bbsat, bbzip, bbnan : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip, ccnan : OUT STD_LOGIC
		);
END hcc_alufp1x;

ARCHITECTURE rtl OF hcc_alufp1x IS
  
  type exponentbasefftype IS ARRAY (3+shiftspeed DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);

  -- input registers and nodes
  signal aaff, bbff : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1); 
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;
  signal aananff, bbnanff : STD_LOGIC; 
  signal addsubff : STD_LOGIC;
  signal aanode, bbnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1); 
  signal aasatnode, aazipnode, bbsatnode, bbzipnode : STD_LOGIC;
  signal aanannode, bbnannode : STD_LOGIC;  
  signal addsubnode : STD_LOGIC;
  
  signal addsubctlff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1); 
  signal mantissaleftff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal mantissarightff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal mantissaleftdelayff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal exponentshiftff : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal exponentbaseff : exponentbasefftype;
  signal invertleftff, invertrightff : STD_LOGIC_VECTOR (2+shiftspeed DOWNTO 1);
  signal shiftcheckff, shiftcheckdelayff : STD_LOGIC;
  signal aluleftff, alurightff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aluff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal ccsatff, cczipff, ccnanff : STD_LOGIC_VECTOR (3+shiftspeed DOWNTO 1);

  signal mantissaleftnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal zeroaluright : STD_LOGIC;
  signal aluleftnode, alurightnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal alucarrybitnode : STD_LOGIC;    
  signal subexponentone, subexponenttwo : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal switch : STD_LOGIC;
  signal shiftcheck : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal shiftcheckbit : STD_LOGIC;
  signal shiftbusnode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

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

  pin: PROCESS (sysclk, reset)
  BEGIN
      
    IF (reset = '1') THEN
       
      FOR k IN 1 TO mantissa+10 LOOP 
        aaff(k) <= '0';
        bbff(k) <= '0';
      END LOOP;
      aasatff <= '0';
      aazipff <= '0';
      aananff <= '0';
      bbsatff <= '0';
      bbzipff <= '0';
      bbnanff <= '0';
      addsubff <= addsub_resetval;
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN

        aaff <= aa;
        bbff <= bb;
        aasatff <= aasat;
        bbsatff <= bbsat;
        aazipff <= aazip;
        bbzipff <= bbzip;
        aananff <= aanan;
        bbnanff <= bbnan;
        addsubff <= addsub;
      
      END IF;
        
    END IF;
      
  END PROCESS;
  
  gina: IF (outputpipe = 1) GENERATE
    aanode <= aaff;
    bbnode <= bbff;
    aasatnode <= aasatff;
    bbsatnode <= bbsatff;
    aazipnode <= aazipff;
    bbzipnode <= bbzipff;
    aanannode <= aananff;
    bbnannode <= bbnanff;
    addsubnode <= addsubff;
  END GENERATE;

  ginb: IF (outputpipe = 0) GENERATE
    aanode <= aa;
    bbnode <= bb;
    aasatnode <= aasat;
    bbsatnode <= bbsat;
    aazipnode <= aazip;
    bbzipnode <= bbzip;
    aanannode <= aanan;
    bbnannode <= bbnan;
    addsubnode <= addsub;
  END GENERATE;
  
    paa: PROCESS (sysclk, reset)
    BEGIN
      
      IF (reset = '1') THEN

        FOR k IN 1 TO 3+shiftspeed LOOP
          addsubctlff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO mantissa LOOP
          mantissaleftff(k) <= '0';
          mantissarightff(k) <= '0';
          mantissaleftdelayff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 10 LOOP
          exponentshiftff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 3+shiftspeed LOOP
          FOR j IN 1 TO 10 LOOP
            exponentbaseff(k)(j) <= '0';
          END LOOP;
        END LOOP;
        FOR k IN 1 TO 2+shiftspeed LOOP
          invertleftff(k) <= '0';
          invertrightff(k) <= '0';
        END LOOP;
        shiftcheckff <= '0';
        shiftcheckdelayff <= '0';
        FOR k IN 1 TO mantissa LOOP
          aluleftff(k) <= '0';
          alurightff(k) <= '0';
          aluff(k) <= '0';
        END LOOP;
        FOR k IN 1 TO 3+shiftspeed LOOP
          ccsatff(k) <= '0';
          cczipff(k) <= '0';
          ccnanff(k) <= '0';
        END LOOP;
         
      ELSIF (rising_edge(sysclk)) THEN
            
        IF (enable = '1') THEN
          
          addsubctlff(1) <= addsubnode;
          FOR k IN 2 TO 3+shiftspeed LOOP
            addsubctlff(k) <= addsubctlff(k-1);
          END LOOP;
        
          FOR k IN 1 TO mantissa LOOP
            mantissaleftff(k) <= (aanode(k+10) AND NOT(switch)) OR (bbnode(k+10) AND switch);
            mantissarightff(k) <= (bbnode(k+10) AND NOT(switch)) OR (aanode(k+10) AND switch);
          END LOOP;
          -- only use if shiftspeed = 1
          mantissaleftdelayff <= mantissaleftff;
        
          FOR k IN 1 TO 10 LOOP
            exponentshiftff(k) <= (subexponentone(k) AND NOT(switch)) OR (subexponenttwo(k) AND switch);
          END LOOP;
          
          FOR k IN 1 TO 10 LOOP
            exponentbaseff(1)(k) <= (aanode(k) AND NOT(switch)) OR (bbnode(k) AND switch); 
          END LOOP;
          FOR k IN 2 TO 3+shiftspeed  LOOP
            exponentbaseff(k)(10 DOWNTO 1) <= exponentbaseff(k-1)(10 DOWNTO 1); 
          END LOOP;

          invertleftff(1) <= addsubnode AND switch; 
          invertrightff(1) <= addsubnode AND NOT(switch); 
          FOR k IN 2 TO 2+shiftspeed LOOP
            invertleftff(k) <= invertleftff(k-1);
            invertrightff(k) <= invertrightff(k-1);
          END LOOP;

          shiftcheckff <= shiftcheckbit;
          shiftcheckdelayff <= shiftcheckff;
          
          aluleftff <= mantissaleftnode;
          alurightff <= shiftbusnode;
        
          aluff <= aluleftnode + alurightnode + alucarrybitnode;

          ccsatff(1) <= aasatnode OR bbsatnode;
          cczipff(1) <= aazipnode AND bbzipnode;
          -- add/sub infinity is invalid OP, NAN out
          ccnanff(1) <= aanannode OR bbnannode OR aasatnode OR bbsatnode;
          FOR k IN 2 TO 3+shiftspeed LOOP
            ccsatff(k) <= ccsatff(k-1); 
            cczipff(k) <= cczipff(k-1);
            ccnanff(k) <= ccnanff(k-1);
          END LOOP;      
          
        END IF;
        
      END IF;
      
    END PROCESS;

    gmsa: IF (shiftspeed = 0) GENERATE
      mantissaleftnode <= mantissaleftff;
      zeroaluright <= shiftcheckff;
    END GENERATE;
    gmsb: IF (shiftspeed = 1) GENERATE
      mantissaleftnode <= mantissaleftdelayff;
      zeroaluright <= shiftcheckdelayff;
    END GENERATE;
    
    gma: FOR k IN 1 TO mantissa GENERATE
      aluleftnode(k) <= aluleftff(k) XOR invertleftff(2+shiftspeed);
      alurightnode(k) <= (alurightff(k) XOR invertrightff(2+shiftspeed)) AND NOT(zeroaluright);
    END GENERATE;
  
    alucarrybitnode <= addsubctlff(2+shiftspeed);
   
    subexponentone <= aanode(10 DOWNTO 1) - bbnode(10 DOWNTO 1);
    subexponenttwo <= bbnode(10 DOWNTO 1) - aanode(10 DOWNTO 1);
  
    switch <= subexponentone(10);

  gsa: IF (mantissa = 32) GENERATE
  
    -- 31 ok, 32 not
    shiftcheck <= "0000000000";
    -- if '1', then zero right bus
    -- 15/10/10 - was down to exponentshiftff(5) - zeroed any shift >= 16. Old design was ok because it
    -- used shiftcheck subtract 31, not caught because unlikely to cause differences for small designs
    shiftcheckbit <= exponentshiftff(10) OR exponentshiftff(9) OR exponentshiftff(8) OR 
                     exponentshiftff(7) OR exponentshiftff(6);
   
    gsb: IF (shiftspeed = 0) GENERATE
      shiftone: hcc_rsftcomb32
      PORT MAP (inbus=>mantissarightff,shift=>exponentshiftff(5 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;    
    gsc: IF (shiftspeed = 1) GENERATE
      shifttwo: hcc_rsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>mantissarightff,shift=>exponentshiftff(5 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;
              
  END GENERATE;

  gsd: IF (mantissa = 36) GENERATE
  
    -- 35 ok, 36 not
    shiftcheck <= exponentshiftff - "0000100100"; 
    -- if '1', then zero right bus
    shiftcheckbit <= NOT(shiftcheck(10));
    
    gse: IF (shiftspeed = 0) GENERATE
      shiftone: hcc_rsftcomb36
      PORT MAP (inbus=>mantissarightff,shift=>exponentshiftff(6 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;    
    gsf: IF (shiftspeed = 1) GENERATE
      shifttwo: hcc_rsftpipe36
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>mantissarightff,shift=>exponentshiftff(6 DOWNTO 1),
                outbus=>shiftbusnode);
    END GENERATE;
              
  END GENERATE;

  --*** OUTPUT ***
  cc <= aluff & exponentbaseff(3+shiftspeed)(10 DOWNTO 1);
  ccsat <= ccsatff(3+shiftspeed);
  cczip <= cczipff(3+shiftspeed);
  ccnan <= ccnanff(3+shiftspeed);
 
   --*** DEBUG SECTION ***
  aaexp <= aa(10 DOWNTO 1);
  bbexp <= bb(10 DOWNTO 1);
  ccexp <= exponentbaseff(3+shiftspeed)(10 DOWNTO 1);
  aaman <= aa(mantissa+10 DOWNTO 11);
  bbman <= bb(mantissa+10 DOWNTO 11);
  ccman <= aluff;
   
END rtl;

