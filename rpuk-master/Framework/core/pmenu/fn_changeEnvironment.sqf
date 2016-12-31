/*
	File: fn_changeEnvironment.sqf
	Author: TinyBigJacko 01/08/16
	
	Description:
	Toggles the ambient environment (animals and audio).
	
*/

if(life_environment) then {
	enableEnvironment true;
} else {
	enableEnvironment false;
};