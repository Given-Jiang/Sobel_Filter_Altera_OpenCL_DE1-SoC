
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DELAY.VHD                             ***
--***                                             ***
--***   Function: Delay an arbitrary width an     ***
--***             arbitrary number of stages      ***
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

ENTITY hcc_delay IS 
GENERIC (
         width : positive := 32;
         delay : positive := 10;
         synthesize : integer := 0
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (width DOWNTO 1);

	   cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
	  );
END hcc_delay;

ARCHITECTURE rtl OF hcc_delay IS
  
  type delmemfftype IS ARRAY (delay DOWNTO 1) OF STD_LOGIC_VECTOR (width DOWNTO 1);
  
  signal delmemff : delmemfftype;
  signal delinff, deloutff : STD_LOGIC_VECTOR (width DOWNTO 1);
  
  component hcc_delmem
  GENERIC (
           width : positive := 64;
           delay : positive := 18
          ); 
  PORT (
        sysclk : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (width DOWNTO 1);
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;
    
BEGIN
   
  gda: IF (delay = 1) GENERATE
  
    pone: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        FOR k IN 1 TO width LOOP
          delinff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          delinff <= aa;
        END IF;  
      END IF;
    END PROCESS;
    
    cc <= delinff;
    
  END GENERATE;
  
  gdb: IF ( ((delay > 1) AND (delay < 5) AND synthesize = 1) OR ((delay > 1) AND synthesize = 0)) GENERATE
  
    ptwo: PROCESS (sysclk,reset)
    BEGIN
      IF (reset = '1') THEN
        FOR j IN 1 TO delay LOOP
          FOR k IN 1 TO width LOOP
            delmemff(j)(k) <= '0';
          END LOOP;
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          delmemff(1)(width DOWNTO 1) <= aa;
          FOR k IN 2 TO delay LOOP
            delmemff(k)(width DOWNTO 1) <= delmemff(k-1)(width DOWNTO 1);
          END LOOP;
        END IF;  
      END IF;
    END PROCESS;
    
    cc <= delmemff(delay)(width DOWNTO 1);
    
  END GENERATE;     

  gdc: IF (delay > 4 AND synthesize = 1) GENERATE
    
    core: hcc_delmem
    GENERIC MAP (width=>width,delay=>delay)
    PORT MAP (sysclk=>sysclk,enable=>enable,
              aa=>aa,cc=>cc);

  END GENERATE;   
    
END rtl;

