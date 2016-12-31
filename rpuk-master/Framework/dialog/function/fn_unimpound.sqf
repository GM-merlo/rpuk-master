#include <macro.h>
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Yeah... Gets the vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"};


_price = [_vehicle,__GETC__(life_garage_prices)] call TON_fnc_index;
if(playerSide == west) then {_price = 0;}; //Override the price for cops!
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_prices) select _price) select 1;};
if(RPUK_doshinbank < _price) exitWith {hint format[(localize "STR_Garage_CashError"),[_price] call life_fnc_numberText];};
_exit = false;

if(typeName life_garage_sp == "ARRAY") then {
	if(_vehicle isKindOf "Truck_F") exitWith {hint "This vehicle must be taken out at a commercial garage! (Any city garage)!"; _exit = true;};
	[[_vid,_pid,life_garage_sp select 0,_unit,_price,life_garage_sp select 1],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
} else {
	if(life_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then {
		[[_vid,_pid,life_garage_sp,_unit,_price],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	} else {
		//
		// NDJ 24/07/16 -spawn dir debug. This below will give us an ARRAY in select 2 (spawnpt) and a NUMBER in select 5 (dir)
		// This is currently the branch that most garage spawns are still using...
		[[_vid,_pid,(getMarkerPos life_garage_sp),_unit,_price,(markerDir life_garage_sp)],"TON_fnc_spawnVehicle",false,false] spawn life_fnc_MP;
	};
};

if(_exit) exitWith {};

hint localize "STR_Garage_SpawningVeh";

RPUK_doshinbank = RPUK_doshinbank - _price;