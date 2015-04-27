-- safe_path for CosPiDPStratixVf400 given rtl dir is . (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE CosPiDPStratixVf400_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END CosPiDPStratixVf400_safe_path;

PACKAGE body CosPiDPStratixVf400_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./") & path;
	END FUNCTION safe_path;
END CosPiDPStratixVf400_safe_path;
