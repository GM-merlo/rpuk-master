/* 
	File: fn_vehSync.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-19 01:00:17
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-19 13:04:03
*/
_veh = life_trunk_vehicle;
if(isNull _veh) exitWith {};
if(_veh isKindOf "House_F") exitWith {hint "Houses save automatically...";};
if(serverTime - (_veh getVariable["lastSync",-99999]) < 900) exitWith {hint "You can only sync vehicle data every 15 minutes!";};
_veh setVariable["lastSync",serverTime,true];
[[_veh],"TON_fnc_updateVehicle",false,false] spawn life_fnc_MP;
hint "Vehicle data synced to the RPUK hive. Vehicle sync button disabled for 15 minutes.";
ctrlEnable[3509,false];