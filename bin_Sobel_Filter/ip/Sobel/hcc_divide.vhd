
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 


--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DIVIDE.VHD                            ***
--***                                             ***
--***   Function: Fixed point divide - used by    ***
--***             single and double dividers      ***
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

ENTITY hcc_divide IS 
GENERIC (
         width : positive := 24;
         precision : positive := 28 -- minimum width+4
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      top : IN STD_LOGIC_VECTOR (width DOWNTO 1);
      bot : IN STD_LOGIC_VECTOR (width DOWNTO 1);

		fpquotient : OUT STD_LOGIC_VECTOR (width+2 DOWNTO 1)
		);
END hcc_divide;

ARCHITECTURE div OF hcc_divide IS
  
  type nodetype IS ARRAY (width+2 DOWNTO 1) OF STD_LOGIC_VECTOR (precision DOWNTO 1);
  type qfftype IS ARRAY (width+1 DOWNTO 1) OF STD_LOGIC_VECTOR (width+1 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (precision-1 DOWNTO 1);
  signal topone, botone : STD_LOGIC_VECTOR (precision DOWNTO 1);
  signal addsub, botnode : nodetype;
  signal levff, botff : nodetype;
  signal qff : qfftype;
  signal quotientnode : STD_LOGIC_VECTOR (width+2 DOWNTO 1);
    
BEGIN

-- NOTES     
-- non restoring divider
-- check for "0" intermediate remainder not required as both inputs 1.XXXXX format
-- 2 extra output bits - pentium compatibility requires round to nearest, not round to nearest even
-- trailing zeros optimizations do not appear to improve size or speed, removed here

zerovec <= conv_std_logic_vector (0,precision-1);

topone <= '0' & top & zerovec(precision-width-1 DOWNTO 1);
botone <= '0' & bot & zerovec(precision-width-1 DOWNTO 1);

addsub(1)(precision DOWNTO 1) <= topone - botone;

addsub(2)(precision DOWNTO 1) <= '0' & ( levff(1)(precision-1 DOWNTO 1) + 
                                         botnode(1)(precision-1 DOWNTO 1) + 
                                        (zerovec(precision-2 DOWNTO 1) & NOT(levff(1)(precision))) ); 
                                                                    
gsa: FOR k IN 3 TO width+2 GENERATE
  addsub(k)(precision DOWNTO 1) <= zerovec(k-1 DOWNTO 1) & ( levff(k-1)(precision+1-k DOWNTO 1) + 
                                                             botnode(k-1)(precision+1-k DOWNTO 1) + 
                                                            (zerovec(precision-k DOWNTO 1) & NOT(levff(k-1)(precision+2-k))) );
END GENERATE;  

gxa: FOR k IN 1 TO width+1 GENERATE
  gxb: FOR j IN 1 TO precision GENERATE
    botnode(k)(j) <= botff(k)(j) XOR NOT(levff(k)(precision+1-k));
  END GENERATE;
END GENERATE;

pma: PROCESS (sysclk,reset)
BEGIN

  IF (reset = '1') THEN
      
  ELSIF (rising_edge(sysclk)) THEN
     
    IF (enable = '1') THEN
    
      botff(1)(precision DOWNTO 1) <= "00" & bot & zerovec(precision-width-2 DOWNTO 1);
      FOR k IN 2 TO width+1 LOOP
        botff(k)(precision DOWNTO 1) <= '0' & botff(k-1)(precision DOWNTO 2);
      END LOOP;
   
      FOR k IN 1 TO width+1 LOOP
        levff(k)(precision DOWNTO 1) <= addsub(k)(precision DOWNTO 1);
      END LOOP;
   
      FOR k IN 1 TO width+1 LOOP
        qff(k)(1) <= addsub(k)(precision+1-k);
        FOR j IN 2 TO width+1 LOOP
          qff(k)(j) <= qff(k)(j-1);
        END LOOP;
      END LOOP;
   
    END IF;
      
  END IF;

END PROCESS;

quotientnode(1) <= NOT(addsub(width+2)(precision-width-1));
gqo: FOR k IN 2 TO width+2 GENERATE
  quotientnode(k) <= NOT(qff(width+3-k)(k-1));
END GENERATE;

fpquotient <= quotientnode;

END div;

