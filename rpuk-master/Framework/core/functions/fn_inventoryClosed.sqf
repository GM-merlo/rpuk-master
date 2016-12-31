/*
	File: fn_inventoryClosed.sqf

	Author: Ciaran Langton
	Date: 2015-03-30 19:59:37
	Last Modified by: Ciaran
	Last Modified time: 2015-12-01 19:29:58
*/
private["_container"];
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _container) exitWith {}; //MEH
_house = objNull;
if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_nearest = (getPosATL _container) call life_fnc_getBuilding;
	if(_container in (_nearest getVariable ["containers",[]])) then {_house = _nearest;} else {
		_nearest = nearestObjects[_container,["House_F"],10];
		{if(_container in (_x getVariable ["containers",[]])) exitWith {_house = _x;};} forEach _nearest;
	};

	if(isNull _house) exitWith {hint "Sorry, we could not locate the house associated with this container. Sync Failed.";};
	[[_house],"TON_fnc_updateHouseContainers",(call life_fnc_findTransactionMethod),false] spawn life_fnc_MP;
};