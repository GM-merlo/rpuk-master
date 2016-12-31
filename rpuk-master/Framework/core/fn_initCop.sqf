#include <macro.h>
/*
	File: fn_initCop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Cop Initialization file.
*/
private["_end"];
player addRating 9999999;
waitUntil {!(isNull (findDisplay 46))};
_end = false;
if(life_blacklisted) exitWith
{
	["Blacklisted",false,true] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	sleep 30;
};

if((__GETC__(life_plodrank) > 0) OR (__GETC__(life_wilcorank) > 0)) then {

	player setVariable["policerank",(__GETC__(life_plodrank)),true];

	/*
	[] spawn life_fnc_welcome;
	waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
	waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.
	*/
	[] spawn life_fnc_spawnMenuSetup;
	waitUntil{!isNull (findDisplay 42500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 42500)};
	
	[] spawn life_fnc_spawnMenu;
	waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
	waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
	waitUntil {life_spawnAnimDone};
}
else
{	
	["NotWhitelisted",false,true] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	sleep 35;
};

enableRadio false;
enableSentences false;
