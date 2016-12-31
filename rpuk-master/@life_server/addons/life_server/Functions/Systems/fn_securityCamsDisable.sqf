/* 
	File: fn_securityCamsDisable.sqf
	Desc: Disables the security cams for X time, then reenables.
	Author: Ciaran Langton
*/
[] spawn {
	life_fed_hacked = true;
	publicVariable "life_fed_hacked";
	sleep (20 * 60);
	life_fed_hacked = false;
	publicVariable "life_fed_hacked";
	[0,format["The security camera has come back online at the bank!"]] remoteExecCall ["life_fnc_broadcast",-2];
};