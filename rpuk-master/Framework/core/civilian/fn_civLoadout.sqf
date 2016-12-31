/*
	File: fn_civLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the civs out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

if(life_mayor_settings select 0 == getPlayerUID player) then {
	player forceAddUniform "U_NikosAgedBody";
} else {
	_clothings = ["U_I_C_Soldier_Bandit_5_F"];
	player addUniform (_clothings select (floor(random (count _clothings))));
};

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

[] call life_fnc_saveGear;