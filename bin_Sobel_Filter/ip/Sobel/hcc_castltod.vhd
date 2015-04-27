
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTLTOD.VHD                          ***
--***                                             ***
--***   Function: Cast Long to IEEE754 Double     ***
--***   Format                                    ***
--***                                             ***
--***   13/12/07 ML                               ***
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

ENTITY hcc_castltod IS 
GENERIC (
         roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
         normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
         doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
         synthesize : integer := 1;
         unsigned : integer := 0 -- 0 = signed, 1 = unsigned
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	  );
END hcc_castltod;

ARCHITECTURE rtl OF hcc_castltod IS

  signal fit : STD_LOGIC;
  signal yvector : STD_LOGIC_VECTOR (77 DOWNTO 1);
  signal exponentfit, exponentnofit : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  component hcc_castytod  
  GENERIC (
           roundconvert : integer := 0; -- global switch - round all ieee<=>y conversion when '1'
           normspeed : positive := 3; -- 1,2, or 3 pipes for norm core
           doublespeed : integer := 1; -- '0' for unpiped adder, '1' for piped adder
           synthesize : integer := 1
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

	     cc : OUT STD_LOGIC_VECTOR (64 DOWNTO 1)
	    );
  end component;
  
BEGIN
        
  gxa: IF (unsigned = 0) GENERATE
    yvector(77 DOWNTO 73) <= aa(32) & aa(32) & aa(32) & aa(32) & aa(32);
  END GENERATE;

  gxb: IF (unsigned = 1) GENERATE
    yvector(77 DOWNTO 73) <= "00000";
  END GENERATE;
  
  yvector(72 DOWNTO 41) <= aa;
  
  gza: FOR k IN 14 TO 40 GENERATE
    yvector(k) <= '0';
  END GENERATE;

  yvector(13 DOWNTO 1) <= conv_std_logic_vector (1054,13); -- account for 31bit right shift

  core: hcc_castytod
  GENERIC MAP (roundconvert=>roundconvert,normspeed=>normspeed,
               doublespeed=>doublespeed,synthesize=>synthesize)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>yvector,aasat=>'0',aazip=>'0',
            cc=>cc);

END rtl;

