/* 
	File: fn_buildableDeleted.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-22 16:13:41
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-25 16:40:10
*/
_item = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _item) exitWith {};
if(!(_item getVariable["inPickup",false])) exitWith {};
if(!(typeOf _item in (call life_placeables_classes))) exitWith {}; //Not a buildable item.
if(_item in life_placedobjects) then {
	life_placedobjects = life_placedobjects - [_item];
	deleteVehicle _item;
};