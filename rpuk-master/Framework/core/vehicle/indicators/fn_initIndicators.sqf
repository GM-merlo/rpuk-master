/*
	File: fn_initIndicators.sqf
	Author: Ciaran Langton
*/
Private ["_veh","_indicator"];
_veh = _this select 0;
_indicator = _this select 1;
if(isNil "_veh" OR isNull _veh ) exitWith {}; 	
if(!(alive _veh )) exitWith {}; 			
if((driver _veh) != player) exitWith {};		
if( !(_veh isKindOf "LandVehicle"))exitWith{};

if(_veh getVariable["mode",""] == _indicator) exitWith {_veh setVariable["mode","",true];};

_veh setVariable["mode",_indicator,true];
[[_veh,_indicator],"life_fnc_indicators",true,false] spawn life_fnc_MP;