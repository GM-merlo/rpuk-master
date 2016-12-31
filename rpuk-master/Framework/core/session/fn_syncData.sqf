/*
	File: fn_syncData.sqf

	Original Author: Tonic
	Edited by: Ciaran - Remove unneeded thread, use time to determine how long the last sync was, not a thread that sleeps...
	Date: 2015-12-18 20:17:19
	Last Modified by: Ciaran
	Last Modified time: 2015-12-20 21:55:46
*/

if (RPUK_AGear < 4) exitWith{}; //Tronny don't save...


if(isNil "life_session_time") then {
	life_session_time = -300;
};

//--- Has the player already synced within the last 5 minutes?
if(time - life_session_time < 300 ) exitWith {
	[
		"RPUK Hive",
		localize "STR_Session_SyncdAlready"
	] call life_fnc_showNotification;
};

[] call SOCK_fnc_updateRequest;
life_session_time = time;

[
	"RPUK Hive",
	localize "STR_Session_SyncData"
] call life_fnc_showNotification;
