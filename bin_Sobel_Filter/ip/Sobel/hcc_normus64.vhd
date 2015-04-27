
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
--***   Function: Normalize 64 bit unsigned       ***
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

ENTITY hcc_normus64 IS 
GENERIC (pipes : positive := 1); -- currently 1,2,3
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      fracin : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
      countout : OUT STD_LOGIC_VECTOR (6 DOWNTO 1);
	  fracout : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_normus64;

ARCHITECTURE rtl OF hcc_normus64 IS
  
  type delfracfftype IS ARRAY(2 DOWNTO 1) OF STD_LOGIC_VECTOR (64 DOWNTO 1);
  
  signal count, countff : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal fracff : STD_LOGIC_VECTOR (64 DOWNTO 1);
  signal delfracff : delfracfftype;

  component hcc_cntuspipe64
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        frac : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
        count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;

  component hcc_cntuscomb64
  PORT (
        frac : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
        count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
 		
  component hcc_lsftpipe64 IS 
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	    outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	   ); 
  end component;

  component hcc_lsftcomb64 IS 
  PORT (
        inbus : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
        shift : IN STD_LOGIC_VECTOR (6 DOWNTO 1);

	    outbus : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	   ); 
  end component;
  
BEGIN
          
  pclk: PROCESS (sysclk,reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      countff <= "000000";
      FOR k IN 1 TO 64 LOOP
        fracff(k) <= '0';
        delfracff(1)(k) <= '0';
        delfracff(2)(k) <= '0';
      END LOOP;
  
    ELSIF (rising_edge(sysclk)) THEN
            
      IF (enable = '1') THEN
              
        countff <= count;
        fracff <= fracin;
        delfracff(1)(64 DOWNTO 1) <= fracin;
        delfracff(2)(64 DOWNTO 1) <= delfracff(1)(64 DOWNTO 1);
               
      END IF;
            
    END IF;
  
  END PROCESS;
    
  gpa: IF (pipes = 1) GENERATE
    ccone: hcc_cntuscomb64
    PORT MAP (frac=>fracin,
              count=>count);

    countout <= countff; -- always after 1 clock for pipes 1,2,3
    
    sctwo: hcc_lsftcomb64
    PORT MAP (inbus=>fracff,shift=>countff,
              outbus=>fracout);

  END GENERATE;

  gpb: IF (pipes = 2) GENERATE
    cctwo: hcc_cntuscomb64
    PORT MAP (frac=>fracin,
              count=>count);

    countout <= countff; -- always after 1 clock for pipes 1,2,3
    
    sctwo: hcc_lsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>fracff,shift=>countff,
              outbus=>fracout);

  END GENERATE;

  gpc: IF (pipes = 3) GENERATE
    cctwo: hcc_cntuspipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              frac=>fracin,
              count=>count);

    countout <= count; -- always after 1 clock for pipes 1,2,3
    
    sctwo: hcc_lsftpipe64
    PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
              inbus=>delfracff(2)(64 DOWNTO 1),shift=>countff,
              outbus=>fracout);

  END GENERATE;
              
END rtl;

