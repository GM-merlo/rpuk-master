/*
	File: initHC.sqf

	Author: Ciaran Langton
	Date: 2015-03-29 16:25:43
	Last Modified by: Ciaran
	Last Modified time: 2015-12-10 23:27:28
*/
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
console = TON_fnc_consoleLog;
["Starting ALUK Headless Client","SYSLOG"] call console;

DB_Async_Active = false;
DB_Async_ExtraLock = false;

//Mayor things.
life_lastBallotQueryTime = -1;
life_lastBallotQueryResult = [];

//Auction Things
life_lastAuctionQueryTime = -1;
life_lastAuctionQueryResult = [];

[] execVM "\life_server\eventhandlers.sqf";

_extDB = true;
if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];

	//extDB Version
	_result = "extDB2" callExtension "9:VERSION";
	diag_log format ["extDB2: Version: %1", _result];
	[format["extDB2: Version: %1", _result],"SYSLOG"] call console;

	if(_result == "") exitWith {};
	if((parseNumber _result) < 20) exitWith {diag_log "Error: extDB version 20 or Higher Required";};

	//Initialize the database
	_result = "extDB2" callExtension "9:ADD_DATABASE:ALUK";
	if(_result != "[1]") exitWith {diag_log "extDB2: Error with Database Connection (ADDING DB)";};

	//CUSTOM SQL
	_result = "extDB2" callExtension format[
		"9:ADD_DATABASE_PROTOCOL:%1:%2:%3:%4",
		"ALUK",
		"SQL_CUSTOM_V2",
		(call life_sql_id),
		"alukdb"
	];

	if(_result != "[1]") exitWith {diag_log "extDB2: Error with Database Connection (INIT SQL CUSTOM)";};


	"extDB2" callExtension "9:LOCK";
	_extDB = true;
	["extDB2: Connected to Database","SYSLOG"] call console;
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
	_extDB = true;
	diag_log "extDB2: Still Connected to Database";
};

if (!_extDB) exitWith {
	life_server_extDB_notLoaded = true;
	publicVariable "life_server_extDB_notLoaded";
	diag_log "extDB2: Error checked extDB/logs for more info";
	["extDB2: Error checked extDB/logs for more info","WARNINGLOG"] call console;
};

/*ALUKAC_VARS = [];
_script = [] spawn ALUKAC_fnc_alukAdminMenu;
waitUntil {scriptDone _script};
ALUKAC_VARS = nil;*/

serv_sv_use = [];
["ALUK Headless Client Initiated.","SYSLOG"] call console;
