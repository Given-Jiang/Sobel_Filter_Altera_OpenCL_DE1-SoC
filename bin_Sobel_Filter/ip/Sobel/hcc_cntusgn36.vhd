
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTUSGN36.VHD                         ***
--***                                             ***
--***   Function: Count leading bits in an        ***
--***             unsigned 36 bit number          ***
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

ENTITY hcc_cntusgn36 IS 
PORT (
      frac : IN STD_LOGIC_VECTOR (36 DOWNTO 1);

		count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		);
END hcc_cntusgn36;

ARCHITECTURE rtl OF hcc_cntusgn36 IS
    
  type positiontype IS ARRAY (6 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal sec, sel : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (6 DOWNTO 1);
  signal position : positiontype;
  
  component hcc_usgnpos IS
  GENERIC (start : integer := 10);
  PORT (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1);
      
        position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)   
       );
  end component;
  
BEGIN
  
  -- for single 32 bit mantissa 
  -- [S ][O....O][1 ][M...M][RGS]
  -- [32][31..28][27][26..4][321] - NB underflow can run into RGS
  -- for single 36 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [36][35..32][31][30..8][7..4][321] 
  -- for double 64 bit mantissa 
  -- [S ][O....O][1 ][M...M][O..O][RGS]
  -- [64][63..60][59][58..7][6..4][321] - NB underflow less than overflow
  
  -- find first leading '1' in inexact portion for 32 bit positive number
  sec(1) <= frac(35) OR frac(34) OR frac(33) OR frac(32) OR frac(31) OR frac(30);
  sec(2) <= frac(29) OR frac(28) OR frac(27) OR frac(26) OR frac(25) OR frac(24);
  sec(3) <= frac(23) OR frac(22) OR frac(21) OR frac(20) OR frac(19) OR frac(18);
  sec(4) <= frac(17) OR frac(16) OR frac(15) OR frac(14) OR frac(13) OR frac(12);
  sec(5) <= frac(11) OR frac(10) OR frac(9) OR frac(8) OR frac(7) OR frac(6);
  sec(6) <= frac(5) OR frac(4) OR frac(3) OR frac(2) OR frac(1);
  
  sel(1) <= sec(1);
  sel(2) <= sec(2) AND NOT(sec(1));
  sel(3) <= sec(3) AND NOT(sec(2)) AND NOT(sec(1));
  sel(4) <= sec(4) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(5) <= sec(5) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(6) <= sec(6) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
            
  pone: hcc_usgnpos 
  GENERIC MAP (start=>0)
  PORT MAP (ingroup=>frac(35 DOWNTO 30),
            position=>position(1)(6 DOWNTO 1));
  ptwo: hcc_usgnpos 
  GENERIC MAP (start=>6)
  PORT MAP (ingroup=>frac(29 DOWNTO 24),
            position=>position(2)(6 DOWNTO 1));
  pthr: hcc_usgnpos 
  GENERIC MAP (start=>12)
  PORT MAP (ingroup=>frac(23 DOWNTO 18),
            position=>position(3)(6 DOWNTO 1));          
  pfor: hcc_usgnpos 
  GENERIC MAP (start=>18)
  PORT MAP (ingroup=>frac(17 DOWNTO 12),
            position=>position(4)(6 DOWNTO 1));
  pfiv: hcc_usgnpos 
  GENERIC MAP (start=>24)
  PORT MAP (ingroup=>frac(11 DOWNTO 6),
            position=>position(5)(6 DOWNTO 1));
  psix: hcc_usgnpos 
  GENERIC MAP (start=>30)
  PORT MAP (ingroup=>lastfrac,
            position=>position(6)(6 DOWNTO 1));          
             
  lastfrac <= frac(5 DOWNTO 1) & '0';          
 
  gmc: FOR k IN 1 TO 6 GENERATE
    count(k) <= (position(1)(k) AND sel(1)) OR 
                (position(2)(k) AND sel(2)) OR 
                (position(3)(k) AND sel(3)) OR 
                (position(4)(k) AND sel(4)) OR 
                (position(5)(k) AND sel(5)) OR 
                (position(6)(k) AND sel(6));
  END GENERATE;
  
END rtl;

