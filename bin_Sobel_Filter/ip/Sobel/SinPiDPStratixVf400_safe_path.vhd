-- safe_path for SinPiDPStratixVf400 given rtl dir is . (quartus)
LIBRARY ieee;
USE ieee.std_logic_1164.all;

PACKAGE SinPiDPStratixVf400_safe_path is
	FUNCTION safe_path( path: string ) RETURN string;
END SinPiDPStratixVf400_safe_path;

PACKAGE body SinPiDPStratixVf400_safe_path IS
	FUNCTION safe_path( path: string )
		RETURN string IS
	BEGIN
		return string'("./") & path;
	END FUNCTION safe_path;
END SinPiDPStratixVf400_safe_path;
