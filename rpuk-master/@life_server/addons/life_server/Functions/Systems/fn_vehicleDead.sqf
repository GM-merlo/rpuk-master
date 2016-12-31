/*
	File: fn_vehicleDead.sqf
	
	Description:
	Tells the database that this vehicle has died and can't be recovered.
*/
private["_plate","_uid","_query","_sql","_dbInfo","_thread"];
params [
	["_vehicle",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {}; //NULL
_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

_dbInfo = _vehicle getVariable["dbInfo",[]];
if (count _dbInfo == 0) exitWith {};
_uid = _dbInfo select 0;

//Get players name.
_name = "";
{
	if (getPlayerUID _x == _uid) exitWith {
		_name = _x getVariable["realname",name _x];
		[2,format["Your %1 was destroyed. (It will return next reboot.)",_displayName]] remoteExecCall ["life_fnc_broadcast",_x];
	};
} forEach playableUnits;

[format["VehDead: Player: %1 PID: %2 Vehicle: %3",_name,_uid,typeOf _vehicle],"CONSOLELOG",true] call console;
sleep 2;
if (!isNil "_vehicle" && {!isNull _vehicle}) then {
	deleteVehicle _vehicle;
};