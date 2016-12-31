/*
	File: jip.sqf
	Author: Bryan "Tonic" Boardwine / Ciaran Langton / TBJ

	Description:
	JIP functionality for JIP required things like vehicles.
*/

//Car Skins
{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Car");

//Air Skins
{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Air");

//Boat skins
{
	_index = _x getVariable "life_VEH_color";
	if(!isNil "_index") then
	{
		[_x,_index] spawn life_fnc_colorVehicle;
	};
} foreach (allMissionObjects "Boat");

//Handle our uniforms
{
	if (_x != player) then {
		[_x, false] call life_fnc_HandleUniforms;
	};
} forEach playableUnits;
