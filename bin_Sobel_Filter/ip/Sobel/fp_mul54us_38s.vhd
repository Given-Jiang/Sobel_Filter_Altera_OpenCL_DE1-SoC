
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   FP_MUL54US_38S.VHD                        ***
--***                                             ***
--***   Function: 4 pipeline stage unsigned 54    ***
--***   bit multiplier                            ***
--***   38S: Stratix 3, 8 18x18, synthesizeable   ***
--***                                             ***
--***   20/08/09 ML                               ***
--***                                             ***
--***   (c) 2009 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

--***************************************************
--*** Notes:                                      ***
--*** Build explicitlyout of two SIII/SIV         ***
--*** DSP Blocks                                  ***
--***************************************************

ENTITY fp_mul54us_38s IS 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      
		  mulcc : OUT STD_LOGIC_VECTOR (72 DOWNTO 1)
		);
END fp_mul54us_38s;

ARCHITECTURE rtl OF fp_mul54us_38s IS

  signal zerovec : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal multone : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal multtwo : STD_LOGIC_VECTOR (55 DOWNTO 1);
  signal addmultff : STD_LOGIC_VECTOR (72 DOWNTO 1);
  
  component fp_mul3s
  GENERIC (
           widthaa : positive := 18;
           widthbb : positive := 18;
           widthcc : positive := 36
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        dataaa : IN STD_LOGIC_VECTOR (widthaa DOWNTO 1);
        databb : IN STD_LOGIC_VECTOR (widthbb DOWNTO 1);

	      result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
	     );
  end component;

  component fp_sum36x18
	PORT (
		    aclr3		: IN STD_LOGIC  := '0';
		    clock0		: IN STD_LOGIC  := '1';
		    dataa_0		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		    dataa_1		: IN STD_LOGIC_VECTOR (17 DOWNTO 0) :=  (OTHERS => '0');
		    datab_0		: IN STD_LOGIC_VECTOR (35 DOWNTO 0) :=  (OTHERS => '0');
		    datab_1		: IN STD_LOGIC_VECTOR (35 DOWNTO 0) :=  (OTHERS => '0');
		    ena0		: IN STD_LOGIC  := '1';
		    result		: OUT STD_LOGIC_VECTOR (54 DOWNTO 0)
	    );
	end component;
	
BEGIN
  
  gza: FOR k IN 1 TO 36 GENERATE
    zerovec(k) <= '0';
  END GENERATE;

  mone: fp_mul3s
  GENERIC MAP (widthaa=>36,widthbb=>36,widthcc=>72)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>mulaa(54 DOWNTO 19),databb=>mulbb(54 DOWNTO 19),
            result=>multone);
      
  mtwo: fp_sum36x18
  PORT MAP (aclr3=>reset,clock0=>sysclk,
            dataa_0=>mulaa(18 DOWNTO 1),
            dataa_1=>mulbb(18 DOWNTO 1),
            datab_0=>mulbb(54 DOWNTO 19),
            datab_1=>mulaa(54 DOWNTO 19),
            ena0=>enable,
            result=>multtwo);
            
  paa: PROCESS (sysclk,reset)
  BEGIN
    
    IF (reset = '1') THEN
      FOR k IN 1 TO 72 LOOP
        addmultff(k) <= '0';
      END LOOP;
    ELSIF (rising_edge(sysclk)) THEN
      IF (enable = '1') THEN
        addmultff <= multone + (zerovec(35 DOWNTO 1) & multtwo(55 DOWNTO 19));
      END IF;
    END IF;
    
  END PROCESS;
        
  mulcc <= addmultff;
         
END rtl;


	