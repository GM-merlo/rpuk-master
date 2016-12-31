/*
	File: fn_putInCar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finds the nearest vehicle and loads the target into the vehicle.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !isPlayer _unit) exitWith {};

_pos = [0,0,0];
_range = 10;
//MPU Fix
if(surfaceIsWater (getPosASL player)) then {
	_pos = getPosASL player;
	_range = 20;
} else {
	_pos = getPosATL player;
	_range = 10;
};

_nearestVehicle = nearestObjects[_pos,["Car","Ship","Submarine","Air"],_range] select 0;
if(isNil "_nearestVehicle") exitWith {hint localize "STR_NOTF_VehicleNear"};

detach _unit;
[[_nearestVehicle],"life_fnc_moveIn",_unit,false] call life_fnc_MP;
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",TRUE,TRUE];