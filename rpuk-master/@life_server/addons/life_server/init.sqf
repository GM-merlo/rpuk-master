/*
	File: init.sqf

	Author: Ciaran Langton
	Date: 2014-08-05 14:47:14
	Last Modified by: Ciaran
	Last Modified time: 2015-12-31 22:41:33
*/
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
console = TON_fnc_consoleLog;
[] call TON_fnc_configuration;
["Starting ALUK Server","SYSLOG"] call console;

DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
publicVariable "life_server_isReady";

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";


//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally.
//Only need to setup extDB once.
private _extDB = true;
if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];

	//extDB Version
	private _result = "extDB2" callExtension "9:VERSION";
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

["Running mysql events","SYSLOG"] call console;
//Run procedures for SQL cleanup on mission start.
["startupCalls",1] spawn DB_fnc_preparedCall;

private _mayor = ["getMayorInOffice",2,false] call DB_fnc_preparedCall;
if(count _mayor < 1) then {
	_mayor = ["76561198006341646","Wilco"]; //Default to Wilco
};
life_mayor_settings = [(_mayor select 0),(_mayor select 1)];
publicVariable "life_mayor_settings";

life_rebelgang = createGroup civilian;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "OOC Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "OOC Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "OOC Channel", "%UNIT_NAME", []];
life_radio_services = radioChannelCreate [[1, 0.65, 0, 0.8], "Police-NHS", "%UNIT_NAME", []];
life_radio_admin = radioChannelCreate [[1, 0, 0, 0.8], "Admin Channel", "%UNIT_NAME", []];

serv_sv_use = [];

fed_bank setVariable["safe",(count playableUnits),true];

//General cleanup for clients disconnecting.
_onDisconnect = ["SERV_onClientDisconnect","onPlayerDisconnected",{[_uid,_id,_name] call TON_fnc_clientDisconnect}] call BIS_fnc_addStackedEventHandler;

[] spawn TON_fnc_cleanup;

[] execFSM "\life_server\cleanup.fsm";

[] spawn
{
	while {true} do
	{
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable ["BIS_fnc_MP_queue",[]];
		waitUntil {sleep 15; count _queue > 0};
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn TON_fnc_federalUpdate;
//[] spawn TON_fnc_wreckManager;
[] spawn TON_fnc_bankServerSetup;

//--- Do actions that the server needs to do to the map.
if ( isDedicated ) then { [ ] call life_fnc_loadMap };

[] spawn
{
	private ["_obj"];
	while {true} do
	{
		sleep (30 * 60);


		{
			//grab the object from namespace using the foreach string given
			_obj = missionNamespace getVariable _x;
			
			if (!isNil "_obj") then //check that this dealer exists before attempting to setvariable
			{
				_obj setVariable["sellers",[],true];
			};
		} foreach ["Dealer_1","Dealer_2","Dealer_3","Dealer_Meth"];
	};
};

//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[] spawn TON_fnc_initHouses;

//LOCK FED BANK BUILDING(S)
if (worldName == "Tanoa") then {
	_barracks = nearestObjects [[10018.373, 11792.511,0], ["Land_Barracks_01_grey_F"], 200]; //find all barracks with 200m - should only be two
	_doors = getNumber(configFile >> "CfgVehicles" >> "Land_Barracks_01_grey_F" >> "NumberOfDoors");
	{
		//Lock up all the doors on the building.
		for "_i" from 1 to _doors do {
			_x setVariable[format["bis_disabled_Door_%1",_i],1,true];
			_x animate [format["Door_%1_rot",_i],0];
		};
		_x allowDamage false;
	} forEach _barracks;
	
} else { //it's Altis, we hope
	_building = nearestObject [[7912.02,16148.6,0.396378],"Land_i_Barracks_V2_F"];
	_doors = getNumber(configFile >> "CfgVehicles" >> "Land_i_Barracks_V2_F" >> "NumberOfDoors");
	//Lock up all the doors on the building.
	for "_i" from 1 to _doors do {
		_building setVariable[format["bis_disabled_Door_%1",_i],1,true];
		_building animate [format["Door_%1_rot",_i],0];
	};
	_building allowDamage false;
};



_markers = ["nodamage_1","nodamage_2","nodamage_3","nodamage_4","nodamage_5","nodamage_6","nodamage_7","nodamage_8"];
[_markers,750] spawn TON_fnc_noDamage;

life_server_isReady = true;
publicVariable "life_server_isReady";
["Serverside init started.","SYSLOG"] call console;

[] spawn {
	while {true} do {
		{
			if(count (units _x) == 0 && _x != life_rebelgang) then {
				deleteGroup _x;
			};
		} forEach allGroups;
		sleep 125;
	};
};

//Earthquake logic
/*[] spawn {
	_earthquakeMarker = createMarker["epicentre",[17915.6,16750,0.00170898]];
	_earthquakeMarker setMarkerText "Epicentre";
	_earthquakeMarker setMarkerColor "ColorRed";
	_earthquakeMarker setMarkerShape "ICON";
	_earthquakeMarker setMarkerType "mil_dot";

	while {true} do {
		//1 HOUR + RANDOM 5 MIN
		sleep 3600 + random 300;
		_obj = 'C_man_1' createVehicle [0,0,0];
		_obj addMPEventHandler ['MPKilled','
			if (!isDedicated && !isNull player) then {
				[markerPos "epicentre"] spawn life_fnc_earthquake;
			};
		'];
		_obj setDamage 5;
		deleteVehicle _obj;
	};
};*/

[] spawn {
	//Three hours + 57 minutes.
	_time = time + (((60 * 60) * 3) + (60 * 57));
	waitUntil {_time - time <= 0};
	[[],"SOCK_fnc_updateRequest",true,false] spawn life_fnc_MP;
	[[1,0,2],"Your data was saved by the server automatically as the restart is coming soon."] remoteExec ["life_fnc_broadcast",-2];

	//Save all the car inventories!
	{
		_veh = _x;
		_vehicleClass = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "vehicleClass");

		if(_vehicleClass in ["Car","Air","Ship","Armored","Submarine"] && !(_veh getVariable["scenery",false])) then
		{
			_dbInfo = _veh getVariable["dbInfo",[]];

			if(count _dbInfo > 0) then
			{
				[_veh] spawn TON_fnc_updateVehicle;
			};
		};
	} foreach vehicles;
};

publicVariable "life_professionCfg";
publicVariable "ALUKAC_fnc_broadcastAlert";

publicVariable "dynamic_sell_array";
publicVariable "dynamic_buy_array";


ALUKAC_VARS = getArray(configFile >> "alukac_anticheatcfg" >> "varWhitelist");
for "_i" from 0 to 50 do {
	ALUKAC_VARS pushBack format["cheat%1",_i];
};
_script = [] spawn ALUKAC_fnc_alukAdminMenu;
waitUntil {scriptDone _script};
[] spawn ALUKAC_fnc_alukAC;
[] spawn ALUKAC_fnc_serverSideAC;


