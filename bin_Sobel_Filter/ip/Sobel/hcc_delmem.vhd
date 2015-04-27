
LIBRARY ieee;
USE ieee.std_logic_1164.all;

LIBRARY altera_mf;
USE altera_mf.all;

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_DELMEM.VHD                            ***
--***                                             ***
--***   Function: Delay an arbitrary width an     ***
--***             arbitrary number of stages      ***
--***                                             ***
--***   Note: this code megawizard generated      ***
--***                                             ***
--***   12/12/07 ML                               ***
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

ENTITY hcc_delmem IS
GENERIC (
         width : positive := 79;
         delay : positive := 7
        );
PORT (
      sysclk : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa : IN STD_LOGIC_VECTOR (width DOWNTO 1);

	  cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
	 );
END hcc_delmem;

ARCHITECTURE SYN OF hcc_delmem IS

  signal dummy : STD_LOGIC_VECTOR (width DOWNTO 1);
   
  COMPONENT altshift_taps
  GENERIC (
		     lpm_hint		: STRING;
		     lpm_type		: STRING;
		     number_of_taps		: NATURAL;
		     tap_distance		: NATURAL;
		     width		: NATURAL
	       );
  PORT (
		  taps	: OUT STD_LOGIC_VECTOR (width-1 DOWNTO 0);
		  clken	: IN STD_LOGIC ;
		  clock	: IN STD_LOGIC ;
		  shiftout	: OUT STD_LOGIC_VECTOR (width-1 DOWNTO 0);
		  shiftin	: IN STD_LOGIC_VECTOR (width-1 DOWNTO 0)
	    );
  END COMPONENT;
	
BEGIN

	delcore: altshift_taps
	GENERIC MAP (
		          lpm_hint => "RAM_BLOCK_TYPE=M512",
		          lpm_type => "altshift_taps",
		          number_of_taps => 1,
		          tap_distance => delay,
		          width => width
	            )
	PORT MAP (
		       clock => sysclk,
		       clken => enable,
		       shiftin => aa,
		       taps => dummy,
		       shiftout => cc
	         );

END SYN;

