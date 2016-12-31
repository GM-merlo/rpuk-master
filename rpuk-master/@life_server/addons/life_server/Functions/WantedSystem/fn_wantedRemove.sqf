/*
	File: fn_wantedRemove.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Removes a person from the wanted list.
*/
private["_uid","_index"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
if(_uid == "") exitWith {}; //Bad data

_player = objNull;
{
	if(getPlayerUID _x == _uid) then {
		_player = _x;
	};
} forEach playableUnits;
if(isNull _player) exitWith {};

[[],"life_fnc_removeCrimes",_player,false] spawn life_fnc_MP; //Tell the player they are clearing the list.