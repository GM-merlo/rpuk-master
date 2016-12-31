/* 
	File: fn_stationTimer.sqf
	Desc: Waits a bit before "unlocking" the store.

	Author: Ciaran Langton.
	For: AltisLife.co.uk and only AltisLife.co.uk
*/
_this spawn {
	params [
		["_pump",objNull,[objNull]],
		["_name","",[""]]
	];
	_pump setVariable["rob_empty",true,true];
	sleep 300 + random 50; //SLEEP FOR A EXTRA TIME OF MAXIMUM 50 SECONDS EXTRA
	_pump setVariable["rob_empty",false,true];
	[1,format["%1 is no longer under high security.",_name]] remoteExecCall ["life_fnc_broadcast",-2];
};