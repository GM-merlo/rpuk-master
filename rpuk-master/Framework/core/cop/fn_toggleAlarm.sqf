/*
	File: fn_toggleAlarm.sqf
	Author: Ciaran Langton
	
	Description:
	Toggles the alarm.
*/
_object = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_status = _object getVariable["alarmOn",false];
if(_status) then {
	_object setVariable["alarmOn",false,true];
	hint "Alarm turning off..";
} else {
	hint "Raising the alarm bells!";
	_object setVariable["alarmOn",true,true];
	[[_object],"POLICE_fnc_stationAlarm",false,false] spawn life_fnc_MP;	
};