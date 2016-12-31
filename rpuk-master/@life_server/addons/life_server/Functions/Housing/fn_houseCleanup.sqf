/*
	File: fn_houseCleanup.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Cleans up containers inside the house.
*/
private["_query","_houses"];
if(_this == "") exitWith {};
_houses = [format["houseCleanup:%1:%2",_this,worldName],2,true] call DB_fnc_preparedCall;

if(count _houses == 0) exitWith {};
if(count _houses > 3) exitWith {};
{
	if(count _x < 1) exitWith {};
	_pos = call compile format["%1",_x select 1];
	_house = _pos call life_fnc_getBuilding;

	if(!isNil {(_house getVariable "containers")}) then {
		{if(!isNull _x) then {deleteVehicle _x;};} foreach (_house getVariable "containers");
		_house setVariable["containers",nil,true];
	};
} foreach _houses;