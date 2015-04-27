
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_NORMFP2X.VHD                          ***
--***                                             ***
--***   Function: Normalize 32 or 36 bit signed   ***
--***             mantissa                        ***
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

ENTITY hcc_normsgn3236 IS 
GENERIC (
         mantissa : positive := 32;
         normspeed : positive := 1 -- 1 or 2
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      fracin : IN STD_LOGIC_VECTOR (mantissa DOWNTO 1);

	   countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1); -- 1 clock earlier than fracout
	   fracout : OUT STD_LOGIC_VECTOR (mantissa DOWNTO 1)
	  );
END hcc_normsgn3236;

ARCHITECTURE rtl OF hcc_normsgn3236 IS
  
  signal count, countff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal fracff : STD_LOGIC_VECTOR (mantissa DOWNTO 1);

  component hcc_cntsgn32 IS 
  PORT (
        frac : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		  count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		  );
  end component;
  
  component hcc_cntsgn36 IS 
  PORT (
        frac : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		  count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		  );
  end component;
 
  component hcc_lsftpipe32 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    ); 
  end component;

  component hcc_lsftcomb32 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    ); 
  end component;
    
  component hcc_lsftpipe36 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    ); 
  end component;

  component hcc_lsftcomb36 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (36 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	     outbus : OUT STD_LOGIC_VECTOR (36 DOWNTO 1)
	    ); 
  end component;
    
BEGIN
          
  pfrc: PROCESS (sysclk,reset)
  BEGIN
    IF (reset = '1') THEN
        
      countff <= "000000";
      FOR k IN 1 TO mantissa LOOP
        fracff(k) <= '0';
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN
        countff <= count;
        fracff <= fracin;
      END IF;
      
    END IF;
  END PROCESS;
        
  gna: IF (mantissa = 32) GENERATE
  
    countone: hcc_cntsgn32
    PORT MAP (frac=>fracin,count=>count);
      
    gnb: IF (normspeed = 1) GENERATE
      shiftone: hcc_lsftcomb32
      PORT MAP (inbus=>fracff,shift=>countff(5 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;

    gnc: IF (normspeed > 1) GENERATE -- if mixed single & double, 3 is possible
      shiftone: hcc_lsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>fracff,shift=>countff(5 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;
         
  END GENERATE;
  
  gnd: IF (mantissa = 36) GENERATE
  
    counttwo: hcc_cntsgn36
    PORT MAP (frac=>fracin,count=>count);
      
    gne: IF (normspeed = 1) GENERATE
      shiftthr: hcc_lsftcomb36
      PORT MAP (inbus=>fracff,shift=>countff(6 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;

    --pcc: PROCESS (sysclk,reset)
    --BEGIN
    --  IF (reset = '1') THEN  
    --    countff <= "000000";
    --  ELSIF (rising_edge(sysclk)) THEN      
    --    IF (enable = '1') THEN
    --      countff <= count;
    --    END IF;
    --  END IF;
    --END PROCESS;
  
    gnf: IF (normspeed > 1) GENERATE -- if mixed single & double, 3 is possible
      shiftfor: hcc_lsftpipe36
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>fracff,shift=>countff(6 DOWNTO 1),
                outbus=>fracout);
    END GENERATE;
                      
  END GENERATE;
    
  countout <= countff; -- same time as fracout for normspeed = 1, 1 clock earlier otherwise
   
END rtl;

