/* 
	File: fn_removeObject.sqf
	
	Author: Ciaran Langton
	Date: 2014-12-12 21:44:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-25 17:26:18
*/
private["_obj"];
_obj = nearestObjects[getPos player,(call life_placeables_classes),5] select 0;
if(isNil "_obj") exitWith {};
if(_obj getVariable ["item",""] != "objectDeployed") exitWith {};
sleep (random 0.25);
if(_obj getVariable ["inPickup",false]) exitWith {};
_obj setVariable["inPickup",true,true];
_type = typeof _obj;

_name = "";
{if(_x select 1 == _type) exitWith {_name = _x select 0;};} forEach (call life_placeables); //Index Function
if(_name == "") exitWith {};

[[_obj],"TON_fnc_buildableDeleted",false,false] call life_fnc_MP; //Tell the server that we are picking up.
waitUntil {isNull _obj};

if(([true,_name,1] call life_fnc_handleInv)) then
{
	titleText["Picked up item.","PLAIN DOWN"];
};