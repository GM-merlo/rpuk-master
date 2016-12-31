/* 
	File: fn_isNPAS.sqf
	Description: Determines if the player is a NPAS member.
	Author: Ciaran Langton
*/
if(call life_npasrank > 0) then {true} else {false};