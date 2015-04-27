-- safe_path for SqrtDPStratixVf400 given rtl dir is . (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE SqrtDPStratixVf400_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END SqrtDPStratixVf400_safe_path;

PACKAGE body SqrtDPStratixVf400_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./") & path;
	END FUNCTION safe_path;
END SqrtDPStratixVf400_safe_path;
