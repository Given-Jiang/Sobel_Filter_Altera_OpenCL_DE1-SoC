
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTYTOL.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Double Format to  ***
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

ENTITY hcc_castytol IS 
GENERIC (normspeed : positive := 2); -- 1,2 pipes for conversion
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aazip, aasat : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castytol;

ARCHITECTURE rtl OF hcc_castytol IS

  signal leftshiftnum, rightshiftnum : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal midpoint, maxpoint, minpoint : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal leftshiftmax, rightshiftmin : STD_LOGIC_VECTOR (13 DOWNTO 1);
  signal leftshiftbus, rightshiftbus : STD_LOGIC_VECTOR (64 DOWNTO 1);
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

  component hcc_lsftcomb64
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;

  component hcc_lsftpipe64
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

  	     outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
    
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
    
BEGIN
 
  midpoint <= conv_std_logic_vector (1054,13);
  maxpoint <= conv_std_logic_vector (1118,13);
  minpoint <= conv_std_logic_vector (1022,13);
  
  leftshiftnum <= aa(13 DOWNTO 1) - midpoint; -- 1054 is 1.0 point
  rightshiftnum <= midpoint - aa(13 DOWNTO 1); 
     
  -- because of 64 bit Y mantissa > 32 bit long, left shift range > right shift rangre
  leftshiftmax <= aa(13 DOWNTO 1) - maxpoint; -- 1118 is the max - if +ve, saturate
  rightshiftmin <= aa(13 DOWNTO 1) - minpoint; -- 1022 is the min - if -ve, zero
    
  selectleftbit <= rightshiftnum(13);
    
  satshiftbit <= selectleftbit AND NOT(leftshiftmax(13));
  zipshiftbit <= NOT(selectleftbit) AND rightshiftmin(13);
    
  gsa: IF (normspeed = 1) GENERATE
    
    sftlc: hcc_lsftcomb64
    PORT MAP (inbus=>aa(77 DOWNTO 14),shift=>leftshiftnum(6 DOWNTO 1),
              outbus=>leftshiftbus);
                
    sftrc: hcc_rsftcomb64
    PORT MAP (inbus=>aa(77 DOWNTO 14),shift=>rightshiftnum(6 DOWNTO 1),
              outbus=>rightshiftbus);
                
  END GENERATE;

  gsb: IF (normspeed > 1) GENERATE
    
    sftlp: hcc_lsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>aa(77 DOWNTO 14),shift=>leftshiftnum(6 DOWNTO 1),
              outbus=>leftshiftbus);
                
    sftrp: hcc_rsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>aa(77 DOWNTO 14),shift=>rightshiftnum(6 DOWNTO 1),
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
            
      FOR k IN 1 TO 64 LOOP
        leftshiftbusff(k) <= '0';
        rightshiftbusff(k) <= '0';
        shiftmuxff(k) <= '0';
      END LOOP;
          
    ELSIF (rising_edge(sysclk)) THEN
              
      IF (enable = '1') THEN
          
        leftshiftbusff <= leftshiftbus(64 DOWNTO 33);
        rightshiftbusff <= rightshiftbus(64 DOWNTO 33);
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

