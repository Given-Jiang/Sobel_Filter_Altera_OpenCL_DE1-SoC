
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   FLOATING POINT CORE LIBRARY               ***
--***                                             ***
--***   DP_LNCLZPIPE.VHD                          ***
--***                                             ***
--***   Function: Double Precision CLZ pipelined  ***
--***                                             ***
--***   18/02/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY dp_lnclzpipe IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mantissa : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
      leading : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
     );
END dp_lnclzpipe;

ARCHITECTURE rtl of dp_lnclzpipe IS

  type positiontype IS ARRAY (11 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal position, positionff, positionmux : positiontype;
  signal zerogroup, zerogroupff, firstzero : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal lastman : STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  component dp_pos
  GENERIC (start: integer := 0);
  PORT 
       (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1); 
        
        position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
  
BEGIN
     
  zerogroup(1) <= mantissa(64) OR mantissa(63) OR mantissa(62) OR mantissa(61) OR mantissa(60) OR mantissa(59);
  zerogroup(2) <= mantissa(58) OR mantissa(57) OR mantissa(56) OR mantissa(55) OR mantissa(54) OR mantissa(53);
  zerogroup(3) <= mantissa(52) OR mantissa(51) OR mantissa(50) OR mantissa(49) OR mantissa(48) OR mantissa(47);
  zerogroup(4) <= mantissa(46) OR mantissa(45) OR mantissa(44) OR mantissa(43) OR mantissa(42) OR mantissa(41);
  zerogroup(5) <= mantissa(40) OR mantissa(39) OR mantissa(38) OR mantissa(37) OR mantissa(36) OR mantissa(35);
  zerogroup(6) <= mantissa(34) OR mantissa(33) OR mantissa(32) OR mantissa(31) OR mantissa(30) OR mantissa(29);
  zerogroup(7) <= mantissa(28) OR mantissa(27) OR mantissa(26) OR mantissa(25) OR mantissa(24) OR mantissa(23);
  zerogroup(8) <= mantissa(22) OR mantissa(21) OR mantissa(20) OR mantissa(19) OR mantissa(18) OR mantissa(17);
  zerogroup(9) <= mantissa(16) OR mantissa(15) OR mantissa(14) OR mantissa(13) OR mantissa(12) OR mantissa(11);
  zerogroup(10) <= mantissa(10) OR mantissa(9) OR mantissa(8) OR mantissa(7) OR mantissa(6) OR mantissa(5);
  zerogroup(11) <= mantissa(4) OR mantissa(3) OR mantissa(2) OR mantissa(1);

  pa: dp_pos 
  GENERIC MAP (start=>0) 
  PORT MAP (ingroup=>mantissa(64 DOWNTO 59),position=>position(1)(6 DOWNTO 1));
  pb: dp_pos 
  GENERIC MAP (start=>6) 
  PORT MAP (ingroup=>mantissa(58 DOWNTO 53),position=>position(2)(6 DOWNTO 1));
  pc: dp_pos 
  GENERIC MAP (start=>12) 
  PORT MAP (ingroup=>mantissa(52 DOWNTO 47),position=>position(3)(6 DOWNTO 1));
  pd: dp_pos 
  GENERIC MAP (start=>18) 
  PORT MAP (ingroup=>mantissa(46 DOWNTO 41),position=>position(4)(6 DOWNTO 1));
  pe: dp_pos 
  GENERIC MAP (start=>24) 
  PORT MAP (ingroup=>mantissa(40 DOWNTO 35),position=>position(5)(6 DOWNTO 1));
  pf: dp_pos 
  GENERIC MAP (start=>30) 
  PORT MAP (ingroup=>mantissa(34 DOWNTO 29),position=>position(6)(6 DOWNTO 1));
  pg: dp_pos 
  GENERIC MAP (start=>36) 
  PORT MAP (ingroup=>mantissa(28 DOWNTO 23),position=>position(7)(6 DOWNTO 1));
  ph: dp_pos 
  GENERIC MAP (start=>42) 
  PORT MAP (ingroup=>mantissa(22 DOWNTO 17),position=>position(8)(6 DOWNTO 1));
  pi: dp_pos 
  GENERIC MAP (start=>48) 
  PORT MAP (ingroup=>mantissa(16 DOWNTO 11),position=>position(9)(6 DOWNTO 1));
  pj: dp_pos 
  GENERIC MAP (start=>54) 
  PORT MAP (ingroup=>mantissa(10 DOWNTO 5),position=>position(10)(6 DOWNTO 1));
  pk: dp_pos 
  GENERIC MAP (start=>60) 
  PORT MAP (ingroup=>lastman,position=>position(11)(6 DOWNTO 1));
      
  lastman <= mantissa(4 DOWNTO 1) & "00";

  ppa: PROCESS (sysclk,reset)
  BEGIN
      
    IF (reset = '1') THEN
        
      FOR k IN 1 TO 11 LOOP
        zerogroupff(k) <= '0';
      END LOOP;
      FOR k IN 1 TO 11 LOOP
        FOR j IN 1 TO 6 LOOP
          positionff(k)(j) <= '0';
        END LOOP;
      END LOOP;
      
    ELSIF (rising_edge(sysclk)) THEN
    
      zerogroupff <= zerogroup;
      FOR k IN 1 TO 11 LOOP
        positionff(k)(6 DOWNTO 1) <= position(k)(6 DOWNTO 1);
      END LOOP;
              
    END IF;
      
  END PROCESS;
  
  firstzero(1) <= zerogroupff(1);
  firstzero(2) <= NOT(zerogroupff(1)) AND zerogroupff(2);
  firstzero(3) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND zerogroupff(3);
  firstzero(4) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND NOT(zerogroupff(3)) AND zerogroupff(4);
  firstzero(5) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND NOT(zerogroupff(3)) AND 
                  NOT(zerogroupff(4)) AND zerogroupff(5);
  firstzero(6) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND NOT(zerogroupff(3)) AND 
                  NOT(zerogroupff(4)) AND NOT(zerogroupff(5)) AND zerogroupff(6);                
  firstzero(7) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND NOT(zerogroupff(3)) AND 
                  NOT(zerogroupff(4)) AND NOT(zerogroupff(5)) AND NOT(zerogroupff(6)) AND zerogroupff(7); 
  firstzero(8) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND NOT(zerogroupff(3)) AND 
                  NOT(zerogroupff(4)) AND NOT(zerogroupff(5)) AND NOT(zerogroupff(6)) AND 
                  NOT(zerogroupff(7)) AND zerogroupff(8); 
  firstzero(9) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND NOT(zerogroupff(3)) AND 
                  NOT(zerogroupff(4)) AND NOT(zerogroupff(5)) AND NOT(zerogroupff(6)) AND 
                  NOT(zerogroupff(7)) AND NOT(zerogroupff(8)) AND zerogroupff(9); 
  firstzero(10) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND NOT(zerogroupff(3)) AND 
                   NOT(zerogroupff(4)) AND NOT(zerogroupff(5)) AND NOT(zerogroupff(6)) AND 
                   NOT(zerogroupff(7)) AND NOT(zerogroupff(8)) AND NOT(zerogroupff(9)) AND zerogroupff(10); 
  firstzero(11) <= NOT(zerogroupff(1)) AND NOT(zerogroupff(2)) AND NOT(zerogroupff(3)) AND 
                   NOT(zerogroupff(4)) AND NOT(zerogroupff(5)) AND NOT(zerogroupff(6)) AND 
                   NOT(zerogroupff(7)) AND NOT(zerogroupff(8)) AND NOT(zerogroupff(9)) AND 
                   NOT(zerogroupff(10)) AND zerogroupff(11); 
                
gma: FOR k IN 1 TO 6 GENERATE
  positionmux(1)(k) <= positionff(1)(k) AND firstzero(1);
  gmb: FOR j IN 2 TO 11 GENERATE
    positionmux(j)(k) <= positionmux(j-1)(k) OR (positionff(j)(k) AND firstzero(j));
  END GENERATE;
END GENERATE;
  
leading <= positionmux(11)(6 DOWNTO 1);
                                               
END rtl;

