/*
* @File:   initPlayerLocal.sqf
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
//--- Ensure that BIS_fnc_MP requests are null routed. Do this ASAP
"BIS_fnc_MP_packet" addPublicVariableEventHandler {};

//--- If it is a headless client, then run HC script.
if !(hasInterface) exitWith {[] call compile preprocessFileLineNumbers "\life_server\initHC.sqf";};

//--- Ensure that any variables are not left in the mission name space.
{
	if !(isNil _x) exitWith {

		//--- Report in to server.
		[
			[
				profileName,
				getPlayerUID player,
				format[ "VariablesAlreadySet - VAR: %1 VAL:%2", _x, missionNamespace getVariable _x ]
			],
			"ALUKAC_fnc_stashReport",
			false
		] call life_fnc_mp;

		//--- Wait a bit to ensure that the message gets there
		sleep 0.9;

		//--- Terminate Mission
		endMission "ALUKAC";
	};
} forEach [
	"life_wilcorank",
	"life_plodrank",
	"life_samaritan",
	"life_rebellevel",
	"life_nhsrank"
];

//--- Define a script to be executed after the preloading screen is finished.
onPreloadFinished {
	//--- Reset onPreloadFinished event. (It will be called after every loading screen otherwise)
	onPreloadFinished { };

	//--- Execute client init.
	[ ] spawn life_fnc_init;
};
