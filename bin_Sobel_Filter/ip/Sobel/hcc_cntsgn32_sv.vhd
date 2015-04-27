
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTSGN32.VHD                          ***
--***                                             ***
--***   Function: Count leading bits in a signed  ***
--***             32 bit number                   ***
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

ENTITY hcc_cntsgn32 IS 
PORT (
      frac : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)
		);
END hcc_cntsgn32;

ARCHITECTURE rtl OF hcc_cntsgn32 IS
    
  type positiontype IS ARRAY (8 DOWNTO 1) OF STD_LOGIC_VECTOR (5 DOWNTO 1);
  
  signal possec, negsec, sec, sel : STD_LOGIC_VECTOR (8 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (4 DOWNTO 1);
  signal position : positiontype;
  
  component hcc_sgnpstn 
  GENERIC (offset : integer := 0;
         width : positive := 5);
  PORT (
        signbit : IN STD_LOGIC;
        inbus : IN STD_LOGIC_VECTOR (4 DOWNTO 1);

		  position : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
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
  possec(1) <= frac(31) OR frac(30) OR frac(29) OR frac(28);
  possec(2) <= frac(27) OR frac(26) OR frac(25) OR frac(24);
  possec(3) <= frac(23) OR frac(22) OR frac(21) OR frac(20);
  possec(4) <= frac(19) OR frac(18) OR frac(17) OR frac(16);
  possec(5) <= frac(15) OR frac(14) OR frac(13) OR frac(12);
  possec(6) <= frac(11) OR frac(10) OR frac(9) OR frac(8);
  possec(7) <= frac(7) OR frac(6) OR frac(5) OR frac(4);
  possec(8) <= frac(3) OR frac(2) OR frac(1);

  -- find first leading '0' in inexact portion for 32 bit negative number
  negsec(1) <= frac(31) AND frac(30) AND frac(29) AND frac(28);
  negsec(2) <= frac(27) AND frac(26) AND frac(25) AND frac(24);
  negsec(3) <= frac(23) AND frac(22) AND frac(21) AND frac(20);
  negsec(4) <= frac(19) AND frac(18) AND frac(17) AND frac(16);
  negsec(5) <= frac(15) AND frac(14) AND frac(13) AND frac(12);
  negsec(6) <= frac(11) AND frac(10) AND frac(9) AND frac(8);
  negsec(7) <= frac(7) AND frac(6) AND frac(5) AND frac(4);
  negsec(8) <= frac(3) AND frac(2) AND frac(1);
  
  gaa: FOR k IN 1 TO 8 GENERATE
    sec(k) <= (possec(k) AND NOT(frac(32))) OR (NOT(negsec(k)) AND frac(32));
  END GENERATE;
  
  sel(1) <= sec(1);
  sel(2) <= sec(2) AND NOT(sec(1));
  sel(3) <= sec(3) AND NOT(sec(2)) AND NOT(sec(1));
  sel(4) <= sec(4) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(5) <= sec(5) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(6) <= sec(6) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND NOT(sec(2)) AND NOT(sec(1));
  sel(7) <= sec(7) AND NOT(sec(6)) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND 
            NOT(sec(2)) AND NOT(sec(1));
  sel(8) <= sec(8) AND NOT(sec(7)) AND NOT(sec(6)) AND NOT(sec(5)) AND NOT(sec(4)) AND NOT(sec(3)) AND 
            NOT(sec(2)) AND NOT(sec(1));
            
  pone: hcc_sgnpstn 
  GENERIC MAP (offset=>0,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(31 DOWNTO 28),
            position=>position(1)(5 DOWNTO 1));
  ptwo: hcc_sgnpstn 
  GENERIC MAP (offset=>4,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(27 DOWNTO 24),
            position=>position(2)(5 DOWNTO 1));
  pthr: hcc_sgnpstn 
  GENERIC MAP (offset=>8,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(23 DOWNTO 20),
            position=>position(3)(5 DOWNTO 1));   
  pfor: hcc_sgnpstn 
  GENERIC MAP (offset=>12,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(19 DOWNTO 16),
            position=>position(4)(5 DOWNTO 1));
  pfiv: hcc_sgnpstn 
  GENERIC MAP (offset=>16,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(15 DOWNTO 12),
            position=>position(5)(5 DOWNTO 1));
  psix: hcc_sgnpstn 
  GENERIC MAP (offset=>20,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(11 DOWNTO 8),
            position=>position(6)(5 DOWNTO 1));
  psev: hcc_sgnpstn 
  GENERIC MAP (offset=>24,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>frac(7 DOWNTO 4),
            position=>position(7)(5 DOWNTO 1));
  pegt: hcc_sgnpstn 
  GENERIC MAP (offset=>28,width=>5)
  PORT MAP (signbit=>frac(32),inbus=>lastfrac,
            position=>position(8)(5 DOWNTO 1));  
            
  lastfrac <= frac(3 DOWNTO 1) & frac(32);          
 
  gmc: FOR k IN 1 TO 5 GENERATE
    count(k) <= (position(1)(k) AND sel(1)) OR 
                (position(2)(k) AND sel(2)) OR 
                (position(3)(k) AND sel(3)) OR 
                (position(4)(k) AND sel(4)) OR 
                (position(5)(k) AND sel(5)) OR 
                (position(6)(k) AND sel(6)) OR 
                (position(7)(k) AND sel(7)) OR
                (position(8)(k) AND sel(8));
  END GENERATE;
  count(6) <= '0';
  
END rtl;

