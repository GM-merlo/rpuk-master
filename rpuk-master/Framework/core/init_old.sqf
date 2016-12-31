#include <macro.h>
/*
	Master client initialization file
*/
life_firstSpawn = true;
private["_handle","_timeStamp"];

_doMsg = {
	[
		format["<t size='1.3' color='#5600FF'>%1</t><br/>%2.",_this select 0, _this select 1],
		0,
		0.2,
		99999999999999,
		0,
		0,
		8
	] spawn BIS_fnc_dynamicText;
};

//0 cutText["Setting up client, please wait...","BLACK FADED"];
["Setting up client","Your client is currently loading RPUK. Please wait."] call _doMsg;
0 cutFadeOut 9999999;
3 cutRsc ["SplashNoise","BLACK"];
//Wilco's purple menu titles!
profileNamespace setVariable ['GUI_BCG_RGB_R',0.338829];
profileNamespace setVariable ['GUI_BCG_RGB_G',0];
profileNamespace setVariable ['GUI_BCG_RGB_B',1];
profileNamespace setVariable ['GUI_BCG_RGB_A',0.937124];

diag_log "------------------------------------------------------------------------------------------------------";
diag_log "--------------------------------- Starting Altis Life Client Init ------------------------------------";
diag_log "------------------------------------------------------------------------------------------------------";
["Setting up client","Your client is currently loading RPUK. Please wait."] call _doMsg;
0 cutFadeOut 9999999;

waitUntil {!isNull player && player == player && getPlayerUID player != "" && !(isNull (findDisplay 46))};

private _mapLoadHandle = [ ] spawn life_fnc_loadMap;

player setVariable["realname",profileName,true];
0 cutFadeOut 9999999;
player allowDamage false;
_timeStamp = diag_tickTime;
life_session_completed = false;
//Setup initial client core functions
diag_log "::Life Client:: Initialization Variables";
["Loading Config Files","Your client is currently loading the RPUK config files. Please wait."] call _doMsg;
//0 cutText["Loading configuration files...","BLACK FADED"];
0 cutFadeOut 9999999;
if(!isServer) then {[] call compile PreprocessFileLineNumbers "core\configuration.sqf";}; //Already loaded on the serverside if we are on client.
diag_log "::Life Client:: Variables initialized";
diag_log "::Life Client:: Setting up Eventhandlers";
//0 cutText["Setting Up Event Handlers...","BLACK FADED"];
["Setting up Event Handlers","Creating essential event handlers to operation."] call _doMsg;
0 cutFadeOut 9999999;

[] call life_fnc_setupEVH;
diag_log "::Life Client:: Eventhandlers completed";
diag_log "::Life Client:: Setting up user actions";
//0 cutText["Setting up actions...","BLACK FADED"];
["Setting up Actions","Creating actions for scroll wheel. Please wait."] call _doMsg;
0 cutFadeOut 9999999;

[] call life_fnc_setupActions;
diag_log "::Life Client:: User actions completed";
diag_log "::Life Client:: Waiting for server functions to transfer..";

["Receiving serverside functions.","Your client is downloading some functions from the server."] call _doMsg;

//0 cutText["Serverside functions received.","BLACK FADED"];
0 cutFadeOut 9999999;

//--- Setup PP Effects
private '_ppEffect';
_ppEffect = ppEffectCreate ["ColorCorrections",2400];
_ppEffect ppEffectAdjust [0.88, 0.88, 0, [0.2, 0.29, 0.4, -0.22], [1, 1, 1, 1.3], [0.15, 0.09, 0.09, 0.0]];
_ppEffect ppEffectCommit 0;
_ppEffect ppEffectEnable true;

waitUntil {(!isNil {TON_fnc_clientGangLeader})};
waitUntil {(!isNil {life_professionCfg})};
waitUntil {(!isNil {dynamic_buy_array})};
waitUntil {(!isNil {dynamic_sell_array})};
waitUntil {(!isNil {life_mayor_settings})};
waitUntil {(!isNil {life_banks})};

life_professions = call life_professionCfg;
//Setup Profession Variables
{missionNamespace setVariable[(_x select 0),0.0];} foreach life_professions;


diag_log "::Life Client:: Received server functions.";
["Waiting for server...","The server is still setting up, please wait."] call _doMsg;
0 cutFadeOut 99999999;
diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "life_server_isReady"};
waitUntil{(life_server_isReady OR !isNil "life_server_extDB_notLoaded")};
if(!isNil "life_server_extDB_notLoaded") exitWith {
	diag_log "::Life Client:: Server did not load extDB";
	999999 cutText ["The server-side extension extDB was not loaded into the engine, report this to the server admin.","BLACK FADED"];
	999999 cutFadeOut 99999999;
};
["Loading gear from server...","You are currently in the login queue, this should not take too long. Please wait."] call _doMsg;
[] call SOCK_fnc_dataQuery;
waitUntil {life_session_completed};

//--- If the map still is not loaded, then wait.
if !( scriptDone _mapLoadHandle ) then {

	//--- Show message to user
	[ "Loading Map...", "Please wait.... the map is currently loading." ] call _doMsg;

	//--- Wait for the map to load.
	waitUntil { scriptDone _mapLoadHandle };

};

["Finished Receiving Data","Data received, Welcome to RPUK!"] call _doMsg;
0 cutFadeOut 9999999;
loadFile 'Ignore This.sqf';
switch (playerSide) do
{
	case west:
	{
		//Initialize Police Settings
		_handle = [] spawn life_fnc_initCop;
		waitUntil {scriptDone _handle};
	};

	case civilian:
	{
		//Initialize Civilian Settings
		_handle = [] spawn life_fnc_initCiv;
		waitUntil {scriptDone _handle};
	};

	case independent:
	{
		//Initialize Medics and blah
		_handle = [] spawn life_fnc_initMedic;
		waitUntil {scriptDone _handle};
	};
};

[player, true] call life_fnc_HandleUniforms; //choose uniform retexture and send it to everyone.
[] spawn life_fnc_escInterupt;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];
player setVariable["life_crimes",life_crimes,true];
player setVariable["gangrank",life_my_gang_rank,true];

diag_log "Past Settings Init";
[] execFSM "core\fsm\main.fsm";
diag_log "Executing main.fsm";
waitUntil {!(isNull (findDisplay 46))};
diag_log "Display 46 Found";
(findDisplay 46) displayAddEventHandler ["KeyDown", "_this call life_fnc_keyHandler"];
player addRating 99999999;
diag_log "------------------------------------------------------------------------------------------------------";
diag_log format["                End of Altis Life Client Init :: Total Execution Time %1 seconds ",(diag_tickTime) - _timeStamp];
diag_log "------------------------------------------------------------------------------------------------------";
life_sidechat = true;
[[player,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
if(call life_wilcorank > 0) then {[[player],"TON_fnc_adminChatJoin",false,false] spawn life_fnc_MP;}; //If admin then send a request to join adminchat channel.
0 cutText ["","BLACK IN"];
[] call life_fnc_hudSetup;
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;
[] call life_fnc_settingsInit;
[] spawn life_fnc_speaking; //Initiate the speaking loop
[] spawn life_fnc_fuelManager;

player setVariable["steam64ID",getPlayerUID player];
player setVariable["realname",profileName,true];
player enableFatigue false;
player setVariable ["BIS_noCoreConversations", true];

life_fnc_moveIn = compileFinal
"
	player moveInCargo (_this select 0);
";


life_fnc_garageRefund = compileFinal
"
	_price = _this select 0;
	_unit = _this select 1;
	if(_unit != player) exitWith {};
	RPUK_doshinbank = RPUK_doshinbank + _price;
";

life_fnc_massFix = compileFinal
"
	_vehicle = _this;
	switch (typeOf _vehicle) do
	{
		case 'C_SUV_01_F': {_vehicle setCenterOfMass [-0.010813,-0.506166,-0.7];};
	};
";

[] execVM "core\init_survival.sqf";

__CONST__(life_paycheck,life_paycheck); //Make the paycheck static.

player allowDamage true; //Player init finished.

[] spawn {
	while {true} do {
		waitUntil {sleep 5; fog > 0};
		0 setFog 0;
	};
};

[] spawn {
	while {true} do {
		waitUntil {sleep 5; overcast != 0.2};
		0 setOvercast 0.2;
	};
};

[] spawn {
	while {true} do {
		sleep (600 + random 600); //10 MIN + UPTO 10 MIN EXTRA
		[] spawn SOCK_fnc_updateRequest;
		hint "Data synced to the RPUK Hive, next sync in 10-20 minutes.";
	};
};

3 cutFadeOut 0;

_pUid = getPlayerUID player;
_allVeh = allMissionObjects "Car" + allMissionObjects "Air" + allMissionObjects "Ship";
{
	if(_x getVariable["side",sideUnknown] == playerSide) then {
		_owners = _x getVariable ["vehicle_info_owners",[]];
		_tgt = _x;
		{
			if(count _x > 0) then {
				_format = "";
				_uid = _x select 0;
				if(_uid == _pUid) then {
					life_vehicles pushBack _tgt;
				};
			};
		} foreach _owners;
	};
} foreach _allVeh;
