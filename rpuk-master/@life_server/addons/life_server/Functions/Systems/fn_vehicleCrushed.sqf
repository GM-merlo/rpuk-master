/*
	File: fn_vehicleCrushed.sqf
	
	Description:
	Crushes the vehicle and deletes it from the db.
*/
private["_plate","_uid","_query","_sql","_dbInfo","_thread", "_displayName"];
params [
	["_vehicle",objNull,[objNull]],
	["_unit",objNull,[objNull]]
];

if (isNull _vehicle) exitWith {
	life_crusher_inuse = false; 
	(owner _unit) publicVariableClient "life_crusher_inuse";
};

_dbInfo = _vehicle getVariable["dbInfo",[]];
if (count _dbInfo == 0) exitWith {
	life_crusher_inuse = false; 
	(owner _unit) publicVariableClient "life_crusher_inuse";
	deleteVehicle _vehicle;
};

_uid = _dbInfo select 0;
_plate = _dbInfo select 1;

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");

[format["crushVehicle:%1:%2",_uid,_plate],1] call DB_fnc_preparedCall;

if (!isNil "_vehicle" && {!isNull _vehicle}) then {
	life_crusher_inuse = false; 
	(owner _unit) publicVariableClient "life_crusher_inuse";
	deleteVehicle _vehicle;
};

//NDJ 20May2014 - send a little alert to the poor victim, if he's still around on the server
{
	if (getPlayerUID _x == _uid) exitWith {
		[2,format["Your %1 was crushed by the police. Bad luck!",_displayName]] remoteExecCall ["life_fnc_broadcast",_x];
		[format["Crushed: Player: %1 PID: %2 Vehicle: %3",_X getVariable["realname", name _x],_uid,typeOf _vehicle],"CONSOLELOG"] call console;
	};
} forEach playableUnits;