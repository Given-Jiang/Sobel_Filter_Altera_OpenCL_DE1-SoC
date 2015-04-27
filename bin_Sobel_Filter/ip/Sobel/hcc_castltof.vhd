
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTLTOF.VHD                          ***
--***                                             ***
--***   Function: Cast Long to IEEE754 Single     ***
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

ENTITY hcc_castltof IS 
GENERIC (
         mantissa : integer := 36;
         normspeed: positive := 1;
         unsigned : integer := 0 -- 0 = signed, 1 = unsigned
        ); 
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (32 DOWNTO 1);

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	  );
END hcc_castltof;

ARCHITECTURE rtl OF hcc_castltof IS

  signal fit : STD_LOGIC;
  signal xvector : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal exponentfit, exponentnofit : STD_LOGIC_VECTOR (10 DOWNTO 1);
  
  component hcc_castxtof
  GENERIC (
           mantissa : positive := 32; -- 32 or 36
           normspeed : positive := 2 -- 1 or 2 
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

	     cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
	    );
	end component;
	
BEGIN
        
  gxa: IF (unsigned = 0) GENERATE
    cc(mantissa+10 DOWNTO mantissa+5) <= aa(32) & aa(32) & aa(32) & aa(32) & aa(32);
  END GENERATE;

  gxb: IF (unsigned = 1) GENERATE
    cc(mantissa+10 DOWNTO mantissa+5) <= "00000";
  END GENERATE;
  
  gmaa: IF (mantissa = 32) GENERATE
    
    -- 27 significant bits can be fit directly
    gmab: IF (unsigned = 0) GENERATE -- signed
      fit <= NOT(aa(32) OR aa(31) OR aa(30) OR aa(29) OR aa(28)) OR
                (aa(32) AND aa(31) AND aa(30) AND aa(29) AND aa(28));
    END GENERATE;
    gmac: IF (unsigned = 1) GENERATE -- unsigned
      fit <= NOT(aa(32) OR aa(31) OR aa(30) OR aa(29) OR aa(28));
    END GENERATE; 
    
    gmad: FOR k IN 1 TO 27 GENERATE
      xvector(k+10) <= (aa(k) AND fit) OR (aa(k+5) AND NOT(fit));
    END GENERATE;

    exponentfit <= "0010011010";    -- exponent = 154 due right shift by 27
    exponentnofit <= "0010011111";  -- exponent = 159 due right shift by 32
    gmae: FOR k IN 1 TO 10 GENERATE
      xvector(k) <= (exponentfit(k) AND fit) OR (exponentnofit(k) AND NOT(fit));
    END GENERATE;
    
  END GENERATE;

  gmba: IF (mantissa = 36) GENERATE
    
    -- 31 significant bits can be fit directly
    gmbb: IF (unsigned = 0) GENERATE -- signed
      fit <= NOT(aa(32) OR aa(31)) OR
                (aa(32) AND aa(31));
    END GENERATE;
    gmbc: IF (unsigned = 1) GENERATE -- unsigned
      fit <= NOT(aa(32));
    END GENERATE; 
    
    gmbd: FOR k IN 1 TO 31 GENERATE
      xvector(k+10) <= (aa(k) AND fit) OR (aa(k+1) AND NOT(fit));
    END GENERATE;
  
    exponentfit <= "0010011110";    -- exponent = 158 due right shift by 31
    exponentnofit <= "0010011111";  -- exponent = 159 due right shift by 32
    gmbe: FOR k IN 1 TO 10 GENERATE
      xvector(k) <= (exponentfit(k) AND fit) OR (exponentnofit(k) AND NOT(fit));
    END GENERATE;
    
  END GENERATE;
  
  core: hcc_castxtof
  GENERIC MAP (mantissa=>mantissa,normspeed=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>xvector,aasat=>'0',aazip=>'0',
            cc=>cc);
            
END rtl;

