#include <macro.h>
/*
	File: fn_sellGarage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells a vehicle from the garage.
*/
private["_vehicle","_vid","_pid","_unit","_price"];
disableSerialization;
ctrlEnable[2812,false];
if(lbCurSel 2802 == -1) exitWith {hint localize "STR_Global_NoSelection"; ctrlEnable[2812,true];};
_vehicle = lbData[2802,(lbCurSel 2802)];
_vehicle = (call compile format["%1",_vehicle]) select 0;
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_Selection_Error"; ctrlEnable[2812,true];};
closeDialog 0;
_price = [_vehicle,__GETC__(life_garage_sell)] call TON_fnc_index;
if(_price == -1) then {_price = 1000;} else {_price = (__GETC__(life_garage_sell) select _price) select 1;};

_price = ceil(_price * call life_priceModifier);

[[_vid,_pid,_price,player,life_garage_type],"TON_fnc_vehicleDelete",false,false] spawn life_fnc_MP;
if(playerSide != west) then
{
	[1,format[localize "STR_Garage_SoldCar",_price]] remoteExecCall ["life_fnc_broadcast",player];
	RPUK_doshinbank = RPUK_doshinbank + _price;
};