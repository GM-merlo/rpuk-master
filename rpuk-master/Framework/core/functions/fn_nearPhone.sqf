/* 
	File: fn_nearPhone.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-07 16:32:31
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-25 22:54:52
*/
if(time - life_phone_lastCheckTime < 0.75) exitWith {life_phone_lastCheckResult}; 

_near = nearestObjects[player,[],3];
_ret = false;
{
	if(["phonebooth_",str(_x)] call BIS_fnc_inString) exitWith {_ret = true;};
} forEach _near;

life_phone_lastCheckResult = _ret;
life_phone_lastCheckTime = time;
_ret;