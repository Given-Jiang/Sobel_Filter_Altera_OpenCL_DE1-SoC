
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ADDPIPEB.VHD                          ***
--***                                             ***
--***   Function: Behavioral Pipelined Adder      ***
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

ENTITY hcc_addpipeb IS
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
END hcc_addpipeb;

ARCHITECTURE rtl of hcc_addpipeb IS

  type pipefftype IS ARRAY (pipes DOWNTO 1) OF STD_LOGIC_VECTOR (width DOWNTO 1);
  
  signal delff : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal pipeff : pipefftype;
  signal ccnode : STD_LOGIC_VECTOR (width DOWNTO 1);
  signal zerovec : STD_LOGIC_VECTOR (width-1 DOWNTO 1);

BEGIN
  
  gza: FOR k IN 1 TO width-1 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  ccnode <= aa + bb + (zerovec & carryin);
  
  gda: IF (pipes = 1) GENERATE
  
    pda: PROCESS (sysclk,reset)
    BEGIN

      IF (reset = '1') THEN
    
        FOR k IN 1 TO width LOOP
          delff(k) <= '0';
        END LOOP;
     
      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN   
          delff <= ccnode;
        END IF;

      END IF;

    END PROCESS;
    
    cc <= delff;
    
  END GENERATE;
  
  gpa: IF (pipes > 1) GENERATE
  
    ppa: PROCESS (sysclk,reset)
    BEGIN

      IF (reset = '1') THEN
        
        FOR k IN 1 TO pipes LOOP 
          FOR j IN 1 TO width LOOP
            pipeff(k)(j) <= '0';
          END LOOP;
        END LOOP;
   
      ELSIF (rising_edge(sysclk)) THEN

        IF (enable = '1') THEN   
          pipeff(1)(width DOWNTO 1) <= ccnode;
          FOR k IN 2 TO pipes LOOP
            pipeff(k)(width DOWNTO 1) <= pipeff(k-1)(width DOWNTO 1);
          END LOOP;
        END IF;

      END IF;

    END PROCESS;

    cc <= pipeff(pipes)(width DOWNTO 1);
          
  END GENERATE;
  
END rtl;

