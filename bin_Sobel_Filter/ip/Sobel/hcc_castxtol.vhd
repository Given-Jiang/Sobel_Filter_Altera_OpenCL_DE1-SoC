
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTXTOL.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Single Format to  ***
--***   Long                                      ***
--***                                             ***
--***   13/12/07 ML                               ***
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

ENTITY hcc_castxtol IS 
GENERIC (
         normspeed : positive := 2; -- 1,2 pipes for conversion
         mantissa : integer := 36
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
      aazip, aasat : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castxtol;

ARCHITECTURE rtl OF hcc_castxtol IS

  signal leftshiftnum, rightshiftnum : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal leftshiftmax, rightshiftmin : STD_LOGIC_VECTOR (10 DOWNTO 1);
  signal leftshiftbus, rightshiftbus : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal selectleftbit, selectleftbitdel : STD_LOGIC;
  signal satshiftbit, satshiftout : STD_LOGIC;
  signal zipshiftbit, zipshiftout : STD_LOGIC;
  signal satout, zipout : STD_LOGIC;
  signal leftshiftbusff, rightshiftbusff : STD_LOGIC_VECTOR (32 DOWNTO 1);
  signal shiftmuxff : STD_LOGIC_VECTOR (32 DOWNTO 1);
   
  component hcc_delaybit IS 
  GENERIC (delay : positive := 32);
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC;

	     cc : OUT STD_LOGIC
	    );
  end component;
	  
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

  component hcc_lsftcomb32 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
  
  component hcc_lsftpipe32 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;

  component hcc_rsftcomb32 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (32 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (5 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
  end component;
    
BEGIN

  leftshiftnum <= aa(10 DOWNTO 1) - "0010011010"; -- 154 is 1.0 point
  rightshiftnum <= "0010011010" - aa(10 DOWNTO 1); 
    
  leftshiftmax <= aa(10 DOWNTO 1) - "0010111010"; -- 186 is the max - if +ve, saturate
  rightshiftmin <= aa(10 DOWNTO 1) - "0001111010"; -- 122 is the min - if -ve, zero
    
  selectleftbit <= rightshiftnum(10);
    
  satshiftbit <= selectleftbit AND NOT(leftshiftmax(10));
  zipshiftbit <= NOT(selectleftbit) AND rightshiftmin(10);
    
  gmab: IF (normspeed = 1) GENERATE
    
    sftlc: hcc_lsftcomb32
    PORT MAP (inbus=>aa(42 DOWNTO 11),shift=>leftshiftnum(5 DOWNTO 1),
              outbus=>leftshiftbus);
                
    sftrc: hcc_rsftcomb32
    PORT MAP (inbus=>aa(42 DOWNTO 11),shift=>rightshiftnum(5 DOWNTO 1),
              outbus=>rightshiftbus);
                
    END GENERATE;

    gmac: IF (normspeed = 2) GENERATE
    
      sftlp: hcc_lsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>aa(42 DOWNTO 11),shift=>leftshiftnum(5 DOWNTO 1),
                outbus=>leftshiftbus);
                
      sftrp: hcc_rsftpipe32
      PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
                inbus=>aa(42 DOWNTO 11),shift=>rightshiftnum(5 DOWNTO 1),
                outbus=>rightshiftbus); 
                
    END GENERATE;
  
  --*** DELAY CONTROL AND CONDITION SIGNALS ***

  dbmux: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>selectleftbit,cc=>selectleftbitdel); 
                
  dbsat: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aasat,cc=>satout); 
                
  dbzip: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aazip,cc=>zipout); 

  dbsftsat: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>satshiftbit,cc=>satshiftout); 
                
  dbsftzip: hcc_delaybit
  GENERIC MAP (delay=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>zipshiftbit,cc=>zipshiftout); 
            
  --*** OUTPUT MUX ***
  
  pao: PROCESS (sysclk,reset)
  BEGIN
       
    IF (reset = '1') THEN
            
      FOR k IN 1 TO 32 LOOP
        leftshiftbusff(k) <= '0';
        rightshiftbusff(k) <= '0';
        shiftmuxff(k) <= '0';
      END LOOP;
          
    ELSIF (rising_edge(sysclk)) THEN
              
      IF (enable = '1') THEN
          
        leftshiftbusff <= leftshiftbus;
        rightshiftbusff <= rightshiftbus;
        FOR k IN 1 TO 32 LOOP
          shiftmuxff(k) <= (((leftshiftbusff(k) AND selectleftbitdel) OR
                             (rightshiftbusff(k) AND NOT(selectleftbitdel))) OR 
                            (satout OR satshiftout)) AND 
                            NOT(zipout OR zipshiftout);
        END LOOP;
        
      END IF;
              
    END IF;
             
  END PROCESS;

  --**************
  --*** OUTPUT ***
  --**************
  
  cc <= shiftmuxff;
  
END rtl;

