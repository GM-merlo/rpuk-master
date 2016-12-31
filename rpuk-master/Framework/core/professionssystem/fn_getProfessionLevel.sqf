/*
	File: fn_getProfessionLevel.sqf
	Author: Ciaran Langton
	Part of the Profession System by Ciaran
	
	Desc:
	Gets the level from the points. ----ALTISLIFE.CO.UK ONLY----
*/
_profession = [_this,0,"",[""]] call BIS_fnc_param;
if(_profession == "") exitWith {0};
//Compile the variable name.
_current = missionNamespace getVariable[_profession,0];

//Divide EXP by the amount of XP per level. Resulting in the amount of levels with a decimal left over, then floor (Round down always) it off.
floor(_current / life_profession_expPerLevel)