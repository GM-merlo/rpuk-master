/* 
	File: fn_isAR.sqf
	Description: Determines if the player is a Armed Response Member.
	Author: Ciaran Langton
*/
if(call life_arrank > 0) then {true} else {false};