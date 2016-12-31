#include <Macro.h>
/*
	File: fn_ropeBlock.sqf
	Author: Ciaran Langton
	
	Description:
	Fixes the VDM cunts that think it is funny to drop fucking tempests on kavala.
*/
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //The fuck...
if(isNil 'life_slingload_allowed') exitWith {};
_type = typeOf _vehicle;

//If it is not in the allowed list for lifting, stop them!
if(!(typeOf _vehicle in __GETC__(life_slingload_allowed)) && playerSide != west) then {
	_vehicle enableRopeAttach false;
};