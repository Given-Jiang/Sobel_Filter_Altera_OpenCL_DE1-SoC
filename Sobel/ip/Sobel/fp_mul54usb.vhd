
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   FP_MUL54USB.VHD                           ***
--***                                             ***
--***   Function: 4/5/6 pipeline stage unsigned   ***
--***             54 bit multiplier (behavioral)  ***
--***                                             ***
--***   24/04/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   31/01/08 ML see below                     ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_mul54usb IS 

 GENERIC (
          latency : positive := 5; -- 4/5/6
          device : integer := 0; -- 0 = "Stratix II", 1 = "Stratix III" (also 4)
          prune : integer := 0 -- 0 = pruned multiplier, 1 = normal multiplier
         );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      
	cc : OUT STD_LOGIC_VECTOR (72 DOWNTO 1)
	);
END fp_mul54usb;

ARCHITECTURE rtl OF fp_mul54usb IS
 
  constant delaydepth : integer := latency - 2;
  
  type muldelfftype IS ARRAY (delaydepth DOWNTO 1) OF STD_LOGIC_VECTOR (72 DOWNTO 1);
  
  signal zerovec : STD_LOGIC_VECTOR (72 DOWNTO 1);
  
  signal aaff, bbff : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal mulff : STD_LOGIC_VECTOR (108 DOWNTO 1);
  signal muldelff : muldelfftype;
  
  signal mulnode : STD_LOGIC_VECTOR (108 DOWNTO 1);
  signal mulonenode, multwonode : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal multhrnode : STD_LOGIC_VECTOR (72 DOWNTO 1);
    
BEGIN
    
  gza: FOR k IN 1 TO 72 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  pma: PROCESS (sysclk, reset)
  BEGIN
  
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 54 LOOP
        mulff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 108 LOOP
        mulff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO delaydepth LOOP
        FOR j IN 1 TO 72 LOOP
          muldelff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
        
      IF (enable = '1') THEN

        aaff <= aa; 
        bbff <= bb;
        mulff <= mulnode;
        muldelff(1)(72 DOWNTO 1) <= mulff(108 DOWNTO 37);
        FOR k IN 2 TO delaydepth LOOP
          muldelff(k)(72 DOWNTO 1) <= muldelff(k-1)(72 DOWNTO 1);
        END LOOP;
         
      END IF;
                 
    END IF;
  
  END PROCESS;
  
  -- full multiplier
  gpa: IF (prune = 1) GENERATE
    mulonenode <= zerovec(54 DOWNTO 1);
    multwonode <= zerovec(54 DOWNTO 1);
    multhrnode <= zerovec(72 DOWNTO 1);
    mulnode <= aaff * bbff;
  END GENERATE;
    
  -- pruned multiplier (18x18 LSB contribution missing)
  gpb: IF (prune = 0) GENERATE
    mulonenode <= aaff(18 DOWNTO 1) * bbff(54 DOWNTO 19);
    multwonode <= bbff(18 DOWNTO 1) * aaff(54 DOWNTO 19);
    multhrnode <= aaff(54 DOWNTO 19) * bbff(54 DOWNTO 19);
    mulnode <= (multhrnode & zerovec(36 DOWNTO 1)) +  
               (zerovec(36 DOWNTO 1) & mulonenode & zerovec(18 DOWNTO 1)) + 
               (zerovec(36 DOWNTO 1) & multwonode & zerovec(18 DOWNTO 1));
  END GENERATE; 
                               
  cc <= muldelff(delaydepth)(72 DOWNTO 1); 
  
END rtl;

