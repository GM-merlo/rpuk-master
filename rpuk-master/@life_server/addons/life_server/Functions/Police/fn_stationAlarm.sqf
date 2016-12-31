/*
	File: fn_stationAlarm.sqf
	Author: Ciaran Langton
	Description:
	Runs the alarm while the code red is still on.
*/
_object = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(!(_object getVariable["alarmOn",false])) exitWith {};
while {_object getVariable["alarmOn",false]} do {
	[[_object,"Alarm",150],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	sleep 1.4;
};