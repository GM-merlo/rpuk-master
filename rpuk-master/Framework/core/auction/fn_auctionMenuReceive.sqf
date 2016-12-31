/* 
	File: fn_auctionMenuReceive.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-28 00:58:54
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-14 14:37:19
*/
disableSerialization;
_data = [_this,0,[],[[]]] call BIS_fnc_param;
_titleText = [_this,1,"",[""]] call BIS_fnc_param;
_display = findDisplay 13750;
if(isNull _display) exitWith {};
_title = _display displayCtrl 1000;
_title ctrlSetText format["aBay Online Auctions - %1",_titleText];
_list = _display displayCtrl 1500;

{
	if(count _x == 0) exitWith {};
	_vid = _x select 0;
	_classname = _x select 1;

	_vehicleInfo = [_classname] call life_fnc_fetchVehInfo;
	_name = _vehicleInfo select 3;
	_list lbAdd _name;
	_list lbSetData[(lbSize _list -1),str(_x)];
	_list lbSetValue[(lbSize _list -1),_vid];
} forEach _data;