
LIBRARY ieee;
LIBRARY work;
LIBRARY lpm;
USE lpm.all;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
USE ieee.std_logic_arith.all; 

--***************************************************
--***                                             ***
--***   ALTERA FLOATING POINT DATAPATH COMPILER   ***
--***                                             ***
--***   HCC_ADDPIPES.VHD                          ***
--***                                             ***
--***   Function: Synthesizable Pipelined Adder   ***
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

ENTITY hcc_addpipes IS
GENERIC (
         width : positive := 64;
         pipes : positive := 1
        );
PORT (
      sysclk : IN STD_LOGIC;
      reset : IN STD_LOGIC;
      enable : IN STD_LOGIC;
      aa, bb : IN STD_LOGIC_VECTOR (width DOWNTO 1); 
      carryin : IN STD_LOGIC;
      
      cc : OUT STD_LOGIC_VECTOR (width DOWNTO 1)
     );
END hcc_addpipes;

ARCHITECTURE syn of hcc_addpipes IS

  component lpm_add_sub
  GENERIC (
		     lpm_direction		: STRING;
		     lpm_hint		: STRING;
		     lpm_pipeline		: NATURAL;
		     lpm_type		: STRING;
		     lpm_width		: NATURAL
	       );
	PORT (
			dataa	: IN STD_LOGIC_VECTOR (lpm_width-1 DOWNTO 0);
			datab	: IN STD_LOGIC_VECTOR (lpm_width-1 DOWNTO 0);
			cin	: IN STD_LOGIC ;
			clken	: IN STD_LOGIC ;
			aclr	: IN STD_LOGIC ;
			clock	: IN STD_LOGIC ;
			result	: OUT STD_LOGIC_VECTOR (lpm_width-1 DOWNTO 0)
	     );
  end component;

BEGIN
  
  addtwo: lpm_add_sub
  GENERIC MAP (
		       lpm_direction => "ADD",
		       lpm_hint => "ONE_INPUT_IS_CONSTANT=NO,CIN_USED=YES",
		       lpm_pipeline => pipes,
		       lpm_type => "LPM_ADD_SUB",
		       lpm_width => width
	           )
  PORT MAP (
  		    dataa => aa,
		    datab => bb,
		    cin => carryin,
		    clken => enable,
		    aclr => reset,
		    clock => sysclk,
		    result => cc
	       );  
  
END syn;

