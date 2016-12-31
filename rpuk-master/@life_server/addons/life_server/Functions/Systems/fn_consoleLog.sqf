/*
	File: fn_consoleLog.sqf
	Author: Ciaran Langton
	Desc: Communicates with the debug console.
*/
#define ALUKAC_SYSLOG 1
#define ALUKAC_HACKLOG 2
#define ALUKAC_SCRIPTLOG 3
#define ALUKAC_WARNINGLOG 4
#define ALUKAC_CONSOLELOG 5
#define ALUKAC_ADMINMENU 6

_message = [_this,0,"",[""]] call BIS_fnc_param;
_type = [_this,1,"",[""]] call BIS_fnc_param;
if(_message == "" || _type == "") exitWith {};

diag_log _message;

_info = switch (toUpper _type) do {
	case "SYSLOG": {ALUKAC_SYSLOG};
	case "HACKLOG": {ALUKAC_HACKLOG};
	case "SCRIPTLOG": {ALUKAC_SCRIPTLOG};
	case "WARNINGLOG": {ALUKAC_WARNINGLOG};
	case "CONSOLELOG": {ALUKAC_CONSOLELOG};
	case "ADMINMENU": {ALUKAC_ADMINMENU};
	default {ALUKAC_CONSOLELOG};
};

"ALUKAC" callExtension format["%1:%2",_info,_message];
