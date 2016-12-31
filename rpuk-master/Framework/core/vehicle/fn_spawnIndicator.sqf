/* 
	File: fn_spawnIndicator.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-08 02:11:18
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-08 11:57:08
*/
if(!(_this isKindOf "LandVehicle") && !(_this isKindOf "Air") && !(_this isKindOf "Ship")) exitWith {};
if(!local _this) exitWith {};
_oldPos = position _this;
_bb = boundingBox _this;
_hOffsetOrigin = (_bb select 1) select 2;
_vpOrigin = visiblePosition _this;

_type = [
	"Sign_Arrow_Large_Blue_F","Sign_Arrow_Large_Cyan_F","Sign_Arrow_Large_F",
	"Sign_Arrow_Large_Green_F","Sign_Arrow_Large_Pink_F","Sign_Arrow_Large_Yellow_F"
] call BIS_fnc_selectRandom;

_arrow = _type createVehicleLocal [0,0,0];
for "_i" from 0 to 40 do {
	if((position _this) distance _oldPos > 3) exitWith {};
	_newPos = _vpOrigin vectorAdd[0,0,_hOffsetOrigin + 0.8];
	_arrow setPos _newPos;
	for "_i" from 0 to 5 do {
		if((position _this) distance _oldPos > 3) exitWith {};
		_newPos = _vpOrigin vectorAdd[0,0,_hOffsetOrigin + 0.8 - _i/10];
		_arrow setPos _newPos;
		sleep 0.05;
	};
	for "_i" from 0 to 5 do {
		if((position _this) distance _oldPos > 3) exitWith {};
		_newPos = _vpOrigin vectorAdd[0,0,_hOffsetOrigin + 0.3 + _i/10];
		_arrow setPos _newPos;
		sleep 0.05;
	};
};
deleteVehicle _arrow;