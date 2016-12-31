/* 
	File: fn_buildablePlaced.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-22 15:51:53
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-25 16:35:21
*/
_item = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _item) exitWith {};
if(!(typeOf _item in (call life_placeables_classes))) exitWith {}; //Not a buildable.
_pos = getPosATL _item;
_dir = direction _item;
_type = typeOf _item;
deleteVehicle _item;

//Recreate the item.
_item = _type createVehicle [0,0,0]; 
_item setVariable["item","objectDeployed",true];
_item setDir _dir;
_item allowDamage false;
_item setPosATL _pos;
//Update simulation
if(_type in ["RoadCone_L_F","RoadBarrier_small_F"]) then {
	_pos = getPosATL _item;
	_dir = direction _item;
	_item enableSimulationGlobal true; //needs to flash, enable that simulation!
	if(isDedicated) then {_item enableSimulation false;}; //Its the actual gameserver, disable the simulation here.
	sleep 0.25;
	_item setPosATL _pos;
	_item setDir _dir;
} else {
	_item enableSimulationGlobal false; //All other items do NOT need to have simulation!
};
life_placedobjects pushBack _item;