
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ALUFP1_DOT.VHD                        ***
--***                                             ***
--***   Function: Single Precision Floating Point ***
--***   Adder (Signed Magnitude for first level   ***
--***   Vector Optimized Structure)               ***
--***                                             ***
--***   15/10/10 ML                               ***
--***                                             ***
--***   (c) 2010 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--*** TBD - what if exponents negative ***

ENTITY hcc_alufp1_dot IS 
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
END hcc_alufp1_dot;

ARCHITECTURE rtl OF hcc_alufp1_dot IS
  
  type exponentbasefftype IS ARRAY (3+shiftspeed DOWNTO 1) OF STD_LOGIC_VECTOR (10 DOWNTO 1);

  -- input registers and nodes
  signal aasignff, bbsignff : STD_LOGIC;
  signal aamantissaff, bbmantissaff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexponentff, bbexponentff : STD_LOGIC_VECTOR (10 DOWNTO 1); 
  signal aasatff, aazipff, bbsatff, bbzipff : STD_LOGIC;
  signal aananff, bbnanff : STD_LOGIC; 
  signal addsubff : STD_LOGIC;
  signal aasignnode, bbsignnode : STD_LOGIC;
  signal aamantissanode, bbmantissanode : STD_LOGIC_VECTOR (mantissa DOWNTO 1);
  signal aaexponentnode, bbexponentnode : STD_LOGIC_VECTOR (10 DOWNTO 1); 
  signal aasatnode, aazipnode, bbsatnode, bbzipnode : STD_LOGIC;
  signal aanannode, bbnannode : STD_LOGIC;  
  signal addsubnode : STD_LOGIC;
  
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
       
      aasignff <= '0';
      bbsignff <= '0';
      FOR k IN 1 TO mantissa LOOP 
        aamantissaff(k) <= '0';
        bbmantissaff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 10 LOOP 
        aaexponentff(k) <= '0';
        bbexponentff(k) <= '0';
      END LOOP;
      aasatff <= '0';
	  bbsatff <= '0';
      aazipff <= '0';
	  bbzipff <= '0';
      aananff <= '0';
	  bbnanff <= '0';
      addsubff <= addsub_resetval;
         
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN

        aasignff <= aa(mantissa+10);
        bbsignff <= bb(mantissa+10);
        aamantissaff <= '0'& aa(mantissa+9 DOWNTO 11);
        bbmantissaff <= '0'& bb(mantissa+9 DOWNTO 11);
        aaexponentff <= aa(10 DOWNTO 1);
        bbexponentff <= bb(10 DOWNTO 1);
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
    aasignnode <= aasignff;
    aamantissanode <= aamantissaff;
    aaexponentnode <= aaexponentff;
    bbsignnode <= bbsignff;
    bbmantissanode <= bbmantissaff;
    bbexponentnode <= bbexponentff;
    aasatnode <= aasatff;
    bbsatnode <= bbsatff;
    aazipnode <= aazipff;
    bbzipnode <= bbzipff;
    aanannode <= aananff;
    bbnannode <= bbnanff;
    addsubnode <= addsubff;
  END GENERATE;

  ginb: IF (outputpipe = 0) GENERATE
    aasignnode <= aa(mantissa+10);
    bbsignnode <= bb(mantissa+10);
    aamantissanode <= '0'& aa(mantissa+9 DOWNTO 11);
    bbmantissanode <= '0'& bb(mantissa+9 DOWNTO 11);
    aaexponentnode <= aa(10 DOWNTO 1);
    bbexponentnode <= bb(10 DOWNTO 1);
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

          FOR k IN 1 TO mantissa LOOP
            mantissaleftff(k) <= (aamantissanode(k) AND NOT(switch)) OR (bbmantissanode(k) AND switch);
            mantissarightff(k) <= (bbmantissanode(k) AND NOT(switch)) OR (aamantissanode(k) AND switch);
          END LOOP;
          -- only use if shiftspeed = 1
          mantissaleftdelayff <= mantissaleftff;
        
          FOR k IN 1 TO 10 LOOP
            exponentshiftff(k) <= (subexponentone(k) AND NOT(switch)) OR (subexponenttwo(k) AND switch);
          END LOOP;
          
          FOR k IN 1 TO 10 LOOP
            exponentbaseff(1)(k) <= (aaexponentnode(k) AND NOT(switch)) OR (bbexponentnode(k) AND switch); 
          END LOOP;
          FOR k IN 2 TO 3+shiftspeed  LOOP
            exponentbaseff(k)(10 DOWNTO 1) <= exponentbaseff(k-1)(10 DOWNTO 1); 
          END LOOP;

          invertleftff(1) <= ((aasignnode AND NOT(switch)) OR (bbsignnode AND switch)) XOR (addsubnode AND switch);
          invertrightff(1) <= ((bbsignnode AND NOT(switch)) OR (aasignnode AND switch)) XOR (addsubnode AND NOT(switch));
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
  
    -- carrybit into ALU only if larger value is negated
    alucarrybitnode <= invertleftff(2+shiftspeed);
   
    subexponentone <= aaexponentnode(10 DOWNTO 1) - bbexponentnode(10 DOWNTO 1);
    subexponenttwo <= bbexponentnode(10 DOWNTO 1) - aaexponentnode(10 DOWNTO 1);
  
    switch <= subexponentone(10);

  gsa: IF (mantissa = 32) GENERATE
  
    -- 31 ok, 32 not
    shiftcheck <= "0000000000";
    -- if '1', then zero right bus
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
    
END rtl;

