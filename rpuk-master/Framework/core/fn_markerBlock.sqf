/* 
	File: fn_markerBlock.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-24 15:54:40
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-06-02 16:23:51
*/
/*#define IDD_INSERT_MARKER 54
if(isDedicated) exitWith {}; //Server - Dont run this!
[] spawn {
	disableSerialization;
	waitUntil {getClientState == "BRIEFING SHOWN"};

	while {getClientState == "BRIEFING SHOWN"} do {
		waitUntil {!isNull (findDisplay IDD_INSERT_MARKER) || getClientState != "BRIEFING SHOWN"};
		if(getClientState != "BRIEFING SHOWN") exitWith {};
		ctrlActivate (findDisplay IDD_INSERT_MARKER displayCtrl 2);
		(findDisplay IDD_INSERT_MARKER) closeDisplay 0;
		waitUntil {isNull (findDisplay IDD_INSERT_MARKER) || getClientState != "BRIEFING SHOWN"};
		if(getClientState != "BRIEFING SHOWN") exitWith {};
		systemChat "No placing markers in the loading screen!";
	};
};*/