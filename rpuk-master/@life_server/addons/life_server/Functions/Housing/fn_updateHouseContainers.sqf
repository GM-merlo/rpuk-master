/* 
	File: fn_updateHouseContainers.sqf
	
	Author: Ciaran Langton
	Date: 2015-03-15 01:40:11
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-18 19:48:25
*/
private["_house","_houseID","_containers","_query"];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {systemChat "House null";};
_houseID = _house getVariable["house_id",-1];
if(_houseID == -1) exitWith {systemChat "HouseID invalid";};

_containers = _house getVariable ["containers",[]];

_arr = [];
{
	_className = typeOf _x;
	_weapons = getWeaponCargo _x;
	_magazines = getMagazineCargo _x;
	_items = getItemCargo _x;
	_backpacks = getBackpackCargo _x;
	
	_arr pushBack [_className,[_weapons,_magazines,_items,_backpacks]];
} foreach _containers;

_arr = [_arr] call DB_fnc_mresArray;
[format["updateHouseContainers:%1:%2:%3",_arr,_houseID,worldName],1] call DB_fnc_preparedCall;