//--- Disable saving.
enableSaving [ false, false ];


//--- Ensure that any variables are not left in the mission name space.
{

	if ( !isNil _x ) exitWith {

		//--- Report to server.
		[

			profileName,
			getPlayerUID player,
			format[ "VariablesAlreadySet - VAR: %1 VAL:%2 ", _x, missionNamespace getVariable _x ]

		] remoteExecCall [ "ALUKAC_fnc_stashReport", 2, false ];

		sleep 0.9;
		endMission "ALUKAC";
		["ALUKAC",false,false] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";

	};

} forEach [

	"life_wilcorank",
	"life_plodrank",
	"life_samaritan",
	"life_rebellevel",
	"life_nhsrank"

];

//--- Execute briefing script
[ ] execVM "briefing.sqf";

//--- Load KRON Dependencies - TODO: Remove the need for these.
[ ] execVM "KRON_Strings.sqf";

//--- Disable some features of the ArmA engine.
enableRadio false; //--- Radio messages
enableSentences false; //--- Radio messages
enableEnvironment false; //--- Environment
disableRemoteSensors true; //--- Raycasting


//add fuel pump actions
[] execVM "core\fuelpumps\fn_initFuelPumps.sqf";
diag_log "fn_initFuelPumps done client-side";

[] execVM "core\fuelpumps\fn_initFuelShopRobbery.sqf";
diag_log "fn_initFuelShopRobbery done client-side";

[] execVM "core\housing\fn_setNPCHousesDisallow.sqf";

/*[] spawn {
  waitUntil {!isNull player};
  player addAction ['Give 5XP', {5 call life_fnc_addXP}];
  player addAction ['Give 10XP', {10 call life_fnc_addXP}];
  player addAction ['Give 15XP', {15 call life_fnc_addXP}];
  player addAction ['Give 20XP', {20 call life_fnc_addXP}];
};*/

//Launch Meatballs weather
[] execVM "core\weather\randomWeather.sqf";