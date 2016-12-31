/*
	File: fn_wantedPardon.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Unwants / pardons a person from the wanted list.
*/
private["_uid"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {};

[_uid] call life_fnc_wantedRemove; //Change to call our remove instead of the code below.