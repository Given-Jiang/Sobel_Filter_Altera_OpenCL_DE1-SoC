-- safe_path for CosDPStratixVf400 given rtl dir is . (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE CosDPStratixVf400_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END CosDPStratixVf400_safe_path;

PACKAGE body CosDPStratixVf400_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./") & path;
	END FUNCTION safe_path;
END CosDPStratixVf400_safe_path;
