/*
	File: fn_initHouses.sqf

	Author: TAW_Tonic
	Date: 2015-03-30 19:59:37
	Last Modified by: Ciaran
	Last Modified time: 2015-12-01 18:55:27
*/
if(count life_houses == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_house = _position call life_fnc_getBuilding;
	_house setVariable["uid",round(random 99999),true];
	_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

	_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],_position];
	_marker setMarkerTextLocal _houseName;
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTypeLocal "loc_Lighthouse";

} foreach life_houses;