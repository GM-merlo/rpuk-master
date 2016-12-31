/*
	File: fn_updateVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sends updates to the DB to be saved.
*/
private["_vehicle","_plate","_uid","_query","_sql","_dbInfo","_thread", "_displayName", "_unit"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

_dbInfo = _vehicle getVariable["dbInfo",[]];
if(count _dbInfo == 0) exitWith {};
_uid = _dbInfo select 0;
_plate = _dbInfo select 1;

_color = _vehicle getVariable["Life_VEH_color",0];
_rgb = _vehicle getVariable["Life_VEH_RGB",[]];
_rgb = [_rgb] call DB_fnc_mresArray;

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

[format["updateVehicle:%1:%2:%3:%4:%5",_color,_rgb,_inv,_uid,_plate],1] call DB_fnc_preparedCall;