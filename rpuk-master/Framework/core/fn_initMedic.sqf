#include <macro.h>
/*
	File: fn_initMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initializes the medic..
*/
private["_end"];
player addRating 99999999;
waitUntil {!(isNull (findDisplay 46))};

if((__GETC__(life_nhsrank)) < 1) exitWith {
	["Notwhitelisted",FALSE,TRUE] call compile PreProcessFileLineNumbers "\a3\functions_f\Misc\fn_endMission.sqf";
	sleep 35;
};

player setVariable["nhsrank",(__GETC__(life_nhsrank)),true];

[] spawn life_fnc_welcome;
waitUntil{!isNull (findDisplay 999999)}; //Wait for the welcome to be open.
waitUntil{isNull (findDisplay 999999)}; //Wait for the welcome to be done.

[] spawn life_fnc_spawnMenu;
waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
waitUntil {life_spawnAnimDone};
