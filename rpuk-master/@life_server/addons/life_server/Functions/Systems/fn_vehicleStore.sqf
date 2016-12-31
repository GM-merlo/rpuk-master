/*
	File: fn_vehicleStore.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the 'Garage'
*/
private["_vInfo","_vInfo","_plate","_uid","_query","_sql"];
params [
	["_vehicle",objNull,[objNull]],
	["_impound",false,[true]],
	["_unit",objNull,[objNull]]
];

if(isNull _vehicle OR isNull _unit) exitWith {life_impound_inuse = false; (owner _unit) publicVariableClient "life_impound_inuse";life_garage_store = false;(owner _unit) publicVariableClient "life_garage_store";}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then
{
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

if(_impound) then
{
	if(count _vInfo == 0) then 
	{
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} 
		else
	{
		_thread = [format["impoundVehicle:%1:%2",_uid,_plate],1] call DB_fnc_preparedCall;
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
		life_impound_inuse = false;
		(owner _unit) publicVariableClient "life_impound_inuse";
	};
}
	else
{
	if(count _vInfo == 0) exitWith
	{
		[1,(localize "STR_Garage_Store_NotPersistent")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
	};
	
	if(_uid != getPlayerUID _unit) exitWith
	{
		[1,(localize "STR_Garage_Store_NoOwnership")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
		life_garage_store = false;
		(owner _unit) publicVariableClient "life_garage_store";
	};

	//VEHICLE INV SAVING
	_inv = call compile str(_vehicle getVariable["Trunk",[[],0]]);
	_items = _inv select 0;
	_weight = 0;
	{
		if((_x select 0) in life_illegal_items_names) then {
			_items set[_forEachIndex,-1];
		} else {
			_itemWeight = ([(_x select 0)] call life_fnc_itemWeight) * (_x select 1);
			_weight = _weight + _itemWeight;
		};
	} forEach _items;
	_items = _items - [-1];

	_inv = [_items,_weight];
	_inv = [_inv] call DB_fnc_mresArray;
	//END SAVING

	_thread = [format["garageVehicle:%1:%2:%3",_inv,_uid,_plate],1] call DB_fnc_preparedCall;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
	life_garage_store = false;
	(owner _unit) publicVariableClient "life_garage_store";
	[1,(localize "STR_Garage_Store_Success")] remoteExecCall ["life_fnc_broadcast",(owner _unit)];
};