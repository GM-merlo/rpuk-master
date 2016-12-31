disableSerialization;
/*
	File: fn_init.sqf

	Author: Ciaran
	Date: 2015-12-30 21:11:30
	Last Modified by: Ciaran
	Last Modified time: 2015-12-31 20:50:57
*/
scopeName "ALUK_CLIENT_INIT";

//--- Start loading screen (this disables rendering, so the script engine can run faster.)
startLoadingScreen [ "", "Life_RscDisplayLoading" ];

//--- Set initial loading text
[ "Starting RPUK Client", "Please wait..." ] call life_fnc_setLoadingText;

//--- Load configuration
[ "Starting RPUK Client", "Loading Configuration..." ] call life_fnc_setLoadingText;
if !( isServer ) then { [ ] call compile PreprocessFileLineNumbers "core\configuration.sqf"; };

//--- This is the first spawn
life_firstSpawn = true;

//--- Setup Burple Colors
{

	//--- Set the variable into the profileNamespace
	profileNamespace setVariable _x

} forEach [

	[ 'GUI_BCG_RGB_R', 0.10196078431372549019607843137255 ],
	[ 'GUI_BCG_RGB_G', 0.10196078431372549019607843137255 ],
	[ 'GUI_BCG_RGB_B', 0.10196078431372549019607843137255 ],
	[ 'GUI_BCG_RGB_A', 0.937124 ]

];

//--- Save the changes to the profileNamesace
saveProfileNamespace;

//--- Disable some features of the ArmA engine.
enableRadio false; //--- Radio messages
enableSentences false; //--- Radio messages
enableEnvironment false; //--- Environment
disableRemoteSensors true; //--- Raycasting

//--- Compile list of all vehicles
private _vehicles = allMissionObjects "Car";
_vehicles append allMissionObjects "Air";
_vehicles append allMissionObjects "Boat";

//--- Get count of all vehicles
private _vehicleCount = count _vehicles;

//--- Load each vehicle's texture.
{

	private _vehicle = _x;

	[ "Skinning Vehicles", format[ "Vehicle %1/%2", _forEachIndex + 1, _vehicleCount ] ] call life_fnc_setLoadingText;

	//--- Fetch variable from vehicle
	private _textureIndex = _vehicle getVariable "life_veh_color";

	//--- If the variable exists, then setup the vehicle.
	if !( isNil '_textureIndex' ) then {

		//--- Setup vehicle
		[ _vehicle, _textureIndex ] call life_fnc_colorVehicle;

	};

	//--- Load keys if the vehicle is the player's, but first ensure that the side is the player's side.
	if ( _vehicle getVariable [ "side", sideUnknown ] == playerSide ) then {

		//--- Get the owners of the vehicle
		private _owners = _vehicle getVariable [ "vehicle_info_owners", [ ] ];
		private _myUID = getPlayerUID player;

		//--- Loop over owners
		{

			_x params [
				[ "_uid", "", [ "" ] ]
			];

			//--- Am I one of the owners?
			if ( _uid == _myUID ) then {

				//--- Add it to my keychain
				life_vehicles pushBack _vehicle

			};

		} forEach _owners;

	};

} forEach _vehicles;

//--- Setup ATM Markers
private _atmPositions = getArray ( missionConfigFile >> "CfgAtms" >> worldName );
private _atmCount = count _atmPositions;
{

	[ "Setting up ATMs", format[ "ATM %1/%2", _forEachIndex + 1, _atmCount ] ] call life_fnc_setLoadingText;

	//--- Create marker
	private _mk = createMarkerLocal [ format[ "atm_%1", _x ], _x ];

	//--- Setup marker
	_mk setMarkerTypeLocal "loc_Tourism";
	_mk setMarkerColorLocal "ColorGreen";
	_mk setMarkerShapeLocal "ICON";

} forEach _atmPositions;

//--- Setup Player Skins
{
	if (_x != player) then {
		[_x, false] call life_fnc_HandleUniforms;
	};
} forEach allPlayers;

//--- Disable player damage
player allowDamage false;

//--- Setup Pre-Session Player Variables
[ "Setting up player", "Setting player variables..." ] call life_fnc_setLoadingText;
{

	player setVariable _x

} forEach [

	[ "realname", profileName, true ],
	[ "BIS_noCoreConversations", true, false ],
	[ "steam64ID", getPlayerUID player, true ],
	[ "steamname", profileNameSteam, true ]

];

//--- Disable Fatigue
player enableFatigue false;

//--- Setup event handlers
[ "Setting up player", "Configuring events..." ] call life_fnc_setLoadingText;
[ ] call life_fnc_setupEVH;

//--- Setup Actions
[ "Setting up player", "Configuring actions..." ] call life_fnc_setLoadingText;
[ ] call life_fnc_setupActions;

//--- Setup ColorCorrections - only on older versions of A3 before Apex.
if ((productVersion select 2) < 159) then {
	[ "Setting up player", "Configuring Color Effects..." ] call life_fnc_setLoadingText;
	private _ppEffect = ppEffectCreate ["ColorCorrections",2400];
	_ppEffect ppEffectAdjust [ 0.88, 0.88, 0, [ 0.2, 0.29, 0.4, -0.22 ], [ 1, 1, 1, 1.3 ], [ 0.15, 0.09, 0.09, 0.0 ] ];
	_ppEffect ppEffectCommit 0;
	_ppEffect ppEffectEnable true;
};

//--- Wait for some server vars TODO: PUt these clientside
[ "Receiving serverside functions", "Please wait..." ] call life_fnc_setLoadingText;
{

	if ( isNil _x ) then {

		waitUntil { !isNil _x }

	};

} forEach [

	"TON_fnc_clientGangLeader",
	"life_professionCfg",
	"dynamic_buy_array",
	"dynamic_sell_array",
	"life_mayor_settings",
	"life_banks"

];

//--- Setup Professions
[ "Configuring Professions", "Please wait..." ] call life_fnc_setLoadingText;
life_professions = call life_professionCfg;
{ missionNamespace setVariable[ ( _x select 0 ), 0.0 ]; } foreach life_professions;

//--- Wait for server
if ( isNil 'life_server_isReady' || { !life_server_isReady } ) then {

	[ "Waiting for server...", "Please wait..." ] call life_fnc_setLoadingText;
	waitUntil{ ( life_server_isReady || !isNil "life_server_extDB_notLoaded" ) };

	if !( isNil "life_server_extDB_notLoaded" ) exitWith {

		[ "There was an error!", "There was an error setting up the RPUK server. Please report this to an admin on our ts: ts.roleplay.co.uk!" ] call life_fnc_setLoadingText;

		//--- Break out of init script
		breakOut "ALUK_CLIENT_INIT";

	};

};

//--- Request gear
[ "Requesting player information...", "We are currently loading your player from the database, please wait!" ] call life_fnc_setLoadingText;
[ ] call SOCK_fnc_dataQuery;

//--- Wait for gear
private _startRequestTime = diag_tickTime;
waitUntil { ( diag_tickTime - _startRequestTime > 30 ) || life_session_completed };

//--- If the session request timed out, then error.
if !( life_session_completed ) then {

	//--- Show error message
	[

		"There was an error!",
		"The request for your data timed out, please try again. If trying again does not work, please report this to an admin at ts.roleplay.co.uk! Returning to lobby in 5 seconds."

	] call life_fnc_setLoadingText;

	//--- Wait for five seconds
	uiSleep 5;

	//--- End loading screen
	endLoadingScreen;

	//--- End the mission
	endMission "END1";

	//--- Break out of init script
	breakOut "ALUK_CLIENT_INIT";

};

//--- Wait for map to load
[ "Loading RPUK Map...", "Please wait, we are currently loading all of the ALUK custom map objects." ] call life_fnc_setLoadingText;
[ ] call life_fnc_loadMap;

//--- Setup Post-Session player variables
[ "Setting up Player", "Setting up player variables, please wait." ] call life_fnc_setLoadingText;
{

	player setVariable _x

} forEach [

	[ "restrained", false, true ],
	[ "escorting", false, true ],
	[ "transporting", false, true ],
	[ "life_crimes", life_crimes, true ],
	[ "gangrank", life_my_gang_rank, true ]

];

//--- Finished setup
[ "Setup Finished", "Welcome to Roleplay UK!" ] call life_fnc_setLoadingText;
loadFile "Ignore This.sqf";

//--- Call the init script for the player's side
endLoadingScreen;
private _initScriptHandle = switch ( playerSide ) do {

	case west: {

		[ ] spawn life_fnc_initCop

	};

	case civilian: {

		[ ] spawn life_fnc_initCiv

	};

	case independent: {

		[ ] spawn life_fnc_initMedic

	};

	default {

		false

	};

};

//--- Ensure that the player is on a supported side.
if ( _initScriptHandle isEqualType false ) exitWith { };

//--- Wait for init script to complete
waitUntil { scriptDone _initScriptHandle };

//--- Start ESC Interruption Script
[ ] spawn life_fnc_escInterupt;

//--- Start Paycheck Manager
[] execFSM "core\fsm\main.fsm";

//--- Add Keyboard Event Handler
( findDisplay 46 ) displayAddEventHandler [ "KeyDown", "_this call life_fnc_keyHandler" ];

//--- Setup player rating (wierd arma engine thing for AI)
player addRating 10E+1;

//--- Setup Sidechat
[ [ player, life_sidechat, playerSide ], "TON_fnc_managesc", false ] call life_fnc_mp;

//--- Setup Adminchat
if(call life_wilcorank > 0) then {
	[[player],"TON_fnc_adminChatJoin",false,false] spawn life_fnc_MP;
};

//--- Setup Player Tags
LIFE_ID_PlayerTags = ["LIFE_PlayerTags","onEachFrame","life_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;

//--- Setup Object Reveal
LIFE_ID_RevealObjects = ["LIFE_RevealObjects","onEachFrame","life_fnc_revealObjects"] call BIS_fnc_addStackedEventHandler;

//--- Setup Settings (View Distance exetra)
[] call life_fnc_settingsInit;

//--- Start speaking loop
[] spawn life_fnc_speaking;

//-- Empty all the petrol station pumps on the map and attach addaction handlers for RPUK Refuel method
//[] execVM "fn_initFuelPumps.sqf";


//--- Start the fuel manager
[] spawn life_fnc_fuelManager;

//--- Define some small functions. TODO: Move to own files... this is shit.
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

//--- Start Survival Script
[] execVM "core\init_survival.sqf";


//--- Init has completed, allow player to be damaged.
player allowDamage true;

//--- Spawn a thread to handle weather and data synching
[] spawn {

	scriptName "Weather and Sync thread";

	private _lastSync = diag_tickTime;

	while { true } do {
/*
		//--- Remove any sort of excessive clouds
		if ( overcast > 0.6 ) then {

			//--- Remove the excessive clouds
			0 setOvercast 0.5;

		};

		//--- Remove any sort of excessive fog
		if ( fog > 0.2 ) then {

			//--- Reset fog
			0 setFog 0;

		};
*/
		//--- If the difference is larger than 10 minutes + upto 5 minutes, then do a sync.
		if ( diag_tickTime - _lastSync > ( 600 + random 300 ) ) then {

			//--- Send request
			[ ] spawn SOCK_fnc_updateRequest;

			//--- Show sync notification
			[ "RPUK Hive", "Data synced to the RPUK Hive, next sync in 10-15 minutes." ] call life_fnc_showNotification;

			//--- Update last sync time
			_lastSync = diag_tickTime;

		};

		//--- Wait for 15 seconds beween running these tasks again.
		uiSleep 15;

	};

};
true
