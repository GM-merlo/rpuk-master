#include <macro.h>
/*
	File: fn_initCiv.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initializes the civilian.
*/
private["_spawnPos"];

{
  _x params [
    ["_spawn", "", [""]],
    ["_radius", 250, [250]]
  ];
  private _buildings = nearestObjects[getMarkerPos _spawn, getArray(missionConfigFile >> "CfgSpawns" >> worldName >> "spawnBuildings"),_radius];

  //Store data for spawn menu.
  missionNamespace setVariable [_spawn, _buildings];
} forEach getArray(missionConfigFile >> "CfgSpawns" >> worldName >> "radiusSpawns");

waitUntil {!(isNull (findDisplay 46))};

if(life_is_arrested) then
{
	life_is_arrested = false;
	[player,true] spawn life_fnc_jail;
}
	else
{
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
};

//Setup the rebel level on the player if they are a rebel.
//if(call life_fnc_isRebel) then {player setVariable["unmcrank",(__GETC__(life_rebellevel)),true];};

player addRating 9999999;

[] call life_fnc_zoneCreator;
