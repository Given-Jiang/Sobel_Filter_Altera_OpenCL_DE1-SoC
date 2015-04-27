
LIBRARY ieee;
LIBRARY work;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CNTUSPIPE64.VHD                       ***
--***                                             ***
--***   Function: Count leading bits in an        ***
--***             unsigned 64 bit number          ***
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

ENTITY hcc_cntuspipe64 IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      frac : IN STD_LOGIC_VECTOR (64 DOWNTO 1);
      
      count : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
     );
END hcc_cntuspipe64;

ARCHITECTURE rtl of hcc_cntuspipe64 IS

  type positiontype IS ARRAY (11 DOWNTO 1) OF STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  signal position, positionff, positionmux : positiontype;
  signal zerogroup, firstzeroff : STD_LOGIC_VECTOR (11 DOWNTO 1);
  signal lastfrac : STD_LOGIC_VECTOR (6 DOWNTO 1);
  
  component hcc_usgnpos
  GENERIC (start: integer := 0);
  PORT 
       (
        ingroup : IN STD_LOGIC_VECTOR (6 DOWNTO 1); 
        
        position : OUT STD_LOGIC_VECTOR (6 DOWNTO 1)    
       );
  end component;
  
BEGIN

pp: PROCESS (sysclk,reset)
BEGIN
    
  IF (reset = '1') THEN
      
    FOR k IN 1 TO 11 LOOP
      FOR j IN 1 TO 6 LOOP
        positionff(k)(j) <= '0';
      END LOOP;
    END LOOP;
  
  ELSIF (rising_edge(sysclk)) THEN
     
    IF (enable = '1') THEN

      firstzeroff(1) <= zerogroup(1);
      firstzeroff(2) <= NOT(zerogroup(1)) AND zerogroup(2);
      firstzeroff(3) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND zerogroup(3);
      firstzeroff(4) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND zerogroup(4);
      firstzeroff(5) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND zerogroup(5);
      firstzeroff(6) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND NOT(zerogroup(5)) AND zerogroup(6);                
      firstzeroff(7) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND zerogroup(7); 
      firstzeroff(8) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND zerogroup(8); 
      firstzeroff(9) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                      AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                      AND zerogroup(9); 
      firstzeroff(10) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                       AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                       AND NOT(zerogroup(9)) AND zerogroup(10);
      firstzeroff(11) <= NOT(zerogroup(1)) AND NOT(zerogroup(2)) AND NOT(zerogroup(3)) AND NOT(zerogroup(4)) 
                       AND NOT(zerogroup(5)) AND NOT(zerogroup(6)) AND NOT(zerogroup(7)) AND NOT(zerogroup(8)) 
                       AND NOT(zerogroup(9)) AND NOT(zerogroup(10)) AND zerogroup(11);

      FOR k IN 1 TO 11 LOOP
        positionff(k)(6 DOWNTO 1) <= position(k)(6 DOWNTO 1);
      END LOOP;
     
    END IF;
    
  END IF;
  
END PROCESS;

  zerogroup(1) <= frac(63) OR frac(62) OR frac(61) OR frac(60) OR frac(59) OR frac(58);
  zerogroup(2) <= frac(57) OR frac(56) OR frac(55) OR frac(54) OR frac(53) OR frac(52);
  zerogroup(3) <= frac(51) OR frac(50) OR frac(49) OR frac(48) OR frac(47) OR frac(46);
  zerogroup(4) <= frac(45) OR frac(44) OR frac(43) OR frac(42) OR frac(41) OR frac(40);
  zerogroup(5) <= frac(39) OR frac(38) OR frac(37) OR frac(36) OR frac(35) OR frac(34);
  zerogroup(6) <= frac(33) OR frac(32) OR frac(31) OR frac(30) OR frac(29) OR frac(28);
  zerogroup(7) <= frac(27) OR frac(26) OR frac(25) OR frac(24) OR frac(23) OR frac(22);
  zerogroup(8) <= frac(21) OR frac(20) OR frac(19) OR frac(18) OR frac(17) OR frac(16);
  zerogroup(9) <= frac(15) OR frac(14) OR frac(13) OR frac(12) OR frac(11) OR frac(10);
  zerogroup(10) <= frac(9) OR frac(8) OR frac(7) OR frac(6) OR frac(5) OR frac(4);
  zerogroup(11) <= frac(3) OR frac(2) OR frac(1);

pone: hcc_usgnpos 
GENERIC MAP (start=>0) 
PORT MAP (ingroup=>frac(63 DOWNTO 58),position=>position(1)(6 DOWNTO 1));
ptwo: hcc_usgnpos 
GENERIC MAP (start=>6) 
PORT MAP (ingroup=>frac(57 DOWNTO 52),position=>position(2)(6 DOWNTO 1));
pthr: hcc_usgnpos 
GENERIC MAP (start=>12) 
PORT MAP (ingroup=>frac(51 DOWNTO 46),position=>position(3)(6 DOWNTO 1));
pfor: hcc_usgnpos 
GENERIC MAP (start=>18) 
PORT MAP (ingroup=>frac(45 DOWNTO 40),position=>position(4)(6 DOWNTO 1));
pfiv: hcc_usgnpos 
GENERIC MAP (start=>24) 
PORT MAP (ingroup=>frac(39 DOWNTO 34),position=>position(5)(6 DOWNTO 1));
psix: hcc_usgnpos 
GENERIC MAP (start=>30) 
PORT MAP (ingroup=>frac(33 DOWNTO 28),position=>position(6)(6 DOWNTO 1));
psev: hcc_usgnpos 
GENERIC MAP (start=>36) 
PORT MAP (ingroup=>frac(27 DOWNTO 22),position=>position(7)(6 DOWNTO 1));
pegt: hcc_usgnpos 
GENERIC MAP (start=>42) 
PORT MAP (ingroup=>frac(21 DOWNTO 16),position=>position(8)(6 DOWNTO 1));
pnin: hcc_usgnpos 
GENERIC MAP (start=>48) 
PORT MAP (ingroup=>frac(15 DOWNTO 10),position=>position(9)(6 DOWNTO 1));
pten: hcc_usgnpos 
GENERIC MAP (start=>54) 
PORT MAP (ingroup=>frac(9 DOWNTO 4),position=>position(10)(6 DOWNTO 1));
pelv: hcc_usgnpos 
GENERIC MAP (start=>60) 
PORT MAP (ingroup=>lastfrac,position=>position(11)(6 DOWNTO 1));
    
lastfrac <= frac(3 DOWNTO 1) & "000";
                                
gma: FOR k IN 1 TO 6 GENERATE
  positionmux(1)(k) <= positionff(1)(k) AND firstzeroff(1);
  gmb: FOR j IN 2 TO 11 GENERATE
    positionmux(j)(k) <= positionmux(j-1)(k) OR (positionff(j)(k) AND firstzeroff(j));
  END GENERATE;
END GENERATE;
  
count <= positionmux(11)(6 DOWNTO 1);
                                               
END rtl;

