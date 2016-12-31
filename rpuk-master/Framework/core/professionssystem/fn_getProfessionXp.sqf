/*
	File: fn_getProfessionXp.sqf
	Author: Ciaran Langton
	Part of the Profession System by Ciaran
	
	Desc:
	Gets the points. ----ALTISLIFE.CO.UK ONLY----
*/
_profession = [_this,0,"",[""]] call BIS_fnc_param;
if(_profession == "") exitWith {0};
//Compile the variable name.
_current = missionNamespace getVariable[_profession,0];
_current