/*
	File: fn_chopShopSell.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks whether or not the vehicle is persistent or temp and sells it.
*/
params [
	["_unit",objNull,[objNull]],
	["_vehicle",objNull,[objNull]],
	["_price",500,[0]],
	["_cash",0,[0]]
];

private _uid = "";
//Error checks
if(isNull _vehicle OR isNull _unit) exitWith
{
	[["life_action_inUse",false],"life_fnc_netSetVar",nil,false] spawn life_fnc_MP;
};

_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName");
_unit = owner _unit;

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo > 0) then 
{
	_uid = _dbInfo select 0;
	_plate = _dbInfo select 1;
	[format["crushVehicle:%1:%2",_uid,_plate],1] call DB_fnc_preparedCall;
};

deleteVehicle _vehicle;
//NDJ 30Apr2014 - send a little alert to the poor victim, if he's still around on the server
{
	if (getPlayerUID _x == _uid) exitWith {
		[2,format["Police report that your stolen %1 was sold to a scrap dealer. Bad luck!",_displayName]] remoteExecCall ["life_fnc_broadcast",_x];
	};
} forEach playableUnits;

[["life_action_inUse",false],"life_fnc_netSetVar",_unit,false] spawn life_fnc_MP;
[["RPUK_dosh",_cash],"life_fnc_netSetVar",_unit,false] spawn life_fnc_MP;
[2,format[(localize "STR_NOTF_ChopSoldCar"),_displayName,[_price] call life_fnc_numberText]] remoteExecCall ["life_fnc_broadcast",_unit];