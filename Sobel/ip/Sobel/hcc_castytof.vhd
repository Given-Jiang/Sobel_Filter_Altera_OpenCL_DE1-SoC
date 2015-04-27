
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_CASTYTOF.VHD                          ***
--***                                             ***
--***   Function: Cast Internal Double to         ***
--***             External Single                 ***
--***                                             ***
--***   06/03/08 ML                               ***
--***                                             ***
--***   (c) 2008 Altera Corporation               ***
--***                                             ***
--***   Change History                            ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***                                             ***
--***************************************************

ENTITY hcc_castytof IS 
GENERIC (
         roundconvert : integer := 1; -- global switch - round all conversions when '1'
         mantissa : positive := 32;
         normspeed : positive := 2 -- 1 or 2
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
      aasat, aazip : IN STD_LOGIC;

		cc : OUT STD_LOGIC_VECTOR (32 DOWNTO 1)
		);
END hcc_castytof;

ARCHITECTURE rtl OF hcc_castytof IS
   
  signal midnode : STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
  signal satnode, zipnode : STD_LOGIC; 
		  
  component hcc_castytox
  GENERIC (
           roundconvert : integer := 1; -- global switch - round all conversions when '1'
           mantissa : positive := 32
          );
  PORT (
        sysclk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        enable : IN STD_LOGIC;
        aa : IN STD_LOGIC_VECTOR (77 DOWNTO 1);
        aasat, aazip : IN STD_LOGIC;

		  cc : OUT STD_LOGIC_VECTOR (mantissa+10 DOWNTO 1);
		  ccsat, cczip : OUT STD_LOGIC 
		  );
  end component;
  
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
 
  one: hcc_castytox
  GENERIC MAP (roundconvert=>roundconvert,mantissa=>mantissa)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>aa,aasat=>aasat,aazip=>aazip,
            cc=>midnode,ccsat=>satnode,cczip=>zipnode);
            
  two: hcc_castxtof 
  GENERIC MAP (mantissa=>mantissa,normspeed=>normspeed)
  PORT MAP (sysclk=>sysclk,reset=>reset,enable=>enable,
            aa=>midnode,aasat=>satnode,aazip=>zipnode,
            cc=>cc);
            
END rtl;

