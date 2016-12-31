/* 
	Name: fn_serverSideAC.sqf
	Desc: Initiates the server-antihack.
	Author: Ciaran Langton
*/

//Load the Admin Menu
[] spawn {
	diag_log "ALUK Anticheat - Serverside Admin Menu";
	_ac = [] spawn ALUKAC_fnc_adminCode;
	waitUntil {scriptDone _ac};
	diag_log "ALUK Anticheat - Serverside Admin Menu Finished";
};