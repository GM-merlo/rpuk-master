/*
	File: fn_stashReport.sqf
	Author: Ciaran Langton

	Description:
	Reports cheaters to the server and logs it to the external console.
*/
private _ok = params [
	[ "_pName", "", [ "" ] ],
	[ "_pUID", "", [ "" ] ],
	[ "_pReason", "", [ "" ] ],
	[ "_isScriptLog", false, [ false ] ]
];

if !( _ok ) exitWith {}; //Bad params passed..

diag_log format["ALUKAC:%1:%2:%3",_pName,_pUID,_pReason]; //Outputs to RPT

if(_isScriptLog) then {
	[format["ALUKAC:%1:%2:%3",_pName,_pUID,_pReason],"SCRIPTLOG"] call console;
} else {
	[format["ALUKAC:%1:%2:%3",_pName,_pUID,_pReason],"HACKLOG"] call console;
};

//[format["insertACLog:%1:%2:%3",_pName,_pUID,_pReason],1] call DB_fnc_preparedCall;