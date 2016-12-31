/*
	File: fn_removeCrimes.sqf
	Desc: Wipes our wanted status.
	Author: Ciaran Langton
*/
life_crimes = [[],0]; //No crimes for me!
player setVariable["life_crimes",life_crimes,true];
//[] call life_fnc_hudUpdate;
[7] call SOCK_fnc_updatePartial;
