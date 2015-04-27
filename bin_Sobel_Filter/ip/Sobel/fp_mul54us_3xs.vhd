
LIBRARY ieee;
LIBRARY work;
LIBRARY lpm;
LIBRARY altera_mf;
USE lpm.all;
USE altera_mf.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_signed.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   FP_MUL54US_3XS.VHD                        ***
--***                                             ***
--***   Function: 4 pipeline stage unsigned 54    ***
--***   bit multiplier                            ***
--***   3XS: Stratix 3, 10 18x18, synthesizeable  ***
--***                                             ***
--***   21/04/09 ML                               ***
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
--*** 1. For QII8.0 LPM_MULT always creates a 10  ***
--*** 18x18 multiplier 54x54 core                 ***
--*** 2. Identical to HCC_MUL54US_3XS, but 72     ***
--*** outputs                                     ***
--***                                             ***
--***************************************************

ENTITY fp_mul54us_3xs IS
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      mulaa, mulbb : IN STD_LOGIC_VECTOR (54 DOWNTO 1);      

      mulcc : OUT STD_LOGIC_VECTOR (72 DOWNTO 1)  
     );
END fp_mul54us_3xs;

ARCHITECTURE syn of fp_mul54us_3xs IS

  component lpm_mult
  GENERIC (
		     lpm_hint		: STRING;
		     lpm_pipeline		: NATURAL;
		     lpm_representation		: STRING;
		     lpm_type		: STRING;
		     lpm_widtha		: NATURAL;
		     lpm_widthb		: NATURAL;
		     lpm_widthp		: NATURAL
	      );
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (53 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (53 DOWNTO 0);
			clken	: IN STD_LOGIC ;
			aclr	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (71 DOWNTO 0)
	);
	end component;
 
BEGIN

 	lpm_mult_component : lpm_mult
	GENERIC MAP (
		lpm_hint => "MAXIMIZE_SPEED=5",
		lpm_pipeline => 4,
		lpm_representation => "UNSIGNED",
		lpm_type => "LPM_MULT",
		lpm_widtha => 54,
		lpm_widthb => 54,
		lpm_widthp => 72
	)
	PORT MAP (
		dataa => mulaa,
		datab => mulbb,
		clken => enable,
		aclr => reset,
		clock => sysclk,
		result => mulcc
	);
                                  
END syn;

