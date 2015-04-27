
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   FP_MUL5418S.VHD                           ***
--***                                             ***
--***   Function: Fixed Point Multiplier          ***
--***   54x18=54, 3 18x18 architecture,           ***
--***   Stratix II/III, 3 or 4 pipeline,          ***
--***   synthesizable                             ***
--***                                             ***
--***   09/12/07 ML                               ***
--***                                             ***
--***   (c) 2007 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***   15/01/08 - outputs up to 72 bits now      ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY fp_mul5418s IS 
GENERIC (
         widthcc : positive := 36;
         pipes : positive := 3  --3/4
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      dataaa : IN STD_LOGIC_VECTOR (54 DOWNTO 1);
      databb : IN STD_LOGIC_VECTOR (18 DOWNTO 1);
      
		result : OUT STD_LOGIC_VECTOR (widthcc DOWNTO 1)
		);
END fp_mul5418s;

ARCHITECTURE rtl OF fp_mul5418s IS

  signal zerovec : STD_LOGIC_VECTOR (18 DOWNTO 1);

  signal muloneout, multwoout, multhrout : STD_LOGIC_VECTOR (36 DOWNTO 1);
  signal aavec, bbvec : STD_LOGIC_VECTOR (54 DOWNTO 1);
  signal resultnode : STD_LOGIC_VECTOR (72 DOWNTO 1);
  signal lowff, lowdelff : STD_LOGIC_VECTOR (18 DOWNTO 1);
  
  component dp_fxadd IS 
  GENERIC (
           width : positive := 64;
           pipes : positive := 1;
           synthesize : integer := 0
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
        carryin : IN STD_LOGIC;
      
        cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
       );
  end component;

  component fp_mul2s IS
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
  
BEGIN
  
  gza: FOR k IN 1 TO 18 GENERATE
    zerovec(k) <= '0';
  END GENERATE;
  
  mulone: fp_mul2s
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>36)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dataaa(18 DOWNTO 1),databb=>databb(18 DOWNTO 1),
            result=>muloneout);
            
  multwo: fp_mul2s
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>36)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dataaa(36 DOWNTO 19),databb=>databb(18 DOWNTO 1),
            result=>multwoout);
            
  multhr: fp_mul2s
  GENERIC MAP (widthaa=>18,widthbb=>18,widthcc=>36)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            dataaa=>dataaa(54 DOWNTO 37),databb=>databb(18 DOWNTO 1),
            result=>multhrout);
  
  aavec <= multhrout & muloneout(36 DOWNTO 19);
  bbvec <= zerovec(18 DOWNTO 1) & multwoout;
  
  adder: dp_fxadd
  GENERIC MAP (width=>54,pipes=>pipes-2,synthesize=>1)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aavec,bb=>bbvec,carryin=>'0',
            cc=>resultnode(72 DOWNTO 19));
            
  gda: IF (pipes = 3) GENERATE  
         
    pda: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
        FOR k IN 1 TO 18 LOOP
          lowff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          lowff <= muloneout(18 DOWNTO 1);
        END IF;
      END IF;
      
    END PROCESS;
    
    resultnode(18 DOWNTO 1) <= lowff;
    
  END GENERATE;

  gdb: IF (pipes = 4) GENERATE  
         
    pdb: PROCESS (sysclk,reset)
    BEGIN
    
      IF (reset = '1') THEN
        FOR k IN 1 TO 18 LOOP
          lowff(k) <= '0';
          lowdelff(k) <= '0';
        END LOOP;
      ELSIF (rising_edge(sysclk)) THEN
        IF (enable = '1') THEN
          lowff <= muloneout(18 DOWNTO 1);
          lowdelff <= lowff;
        END IF;
      END IF;
      
    END PROCESS;
    
    resultnode(18 DOWNTO 1) <= lowdelff;
    
  END GENERATE;
  
  result <= resultnode(72 DOWNTO 73-widthcc);
              
END rtl;

