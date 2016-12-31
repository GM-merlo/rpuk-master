#include <macro.h>
/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default cop configuration.
*/
//Strip the player down
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
_uniform = "U_I_CombatUniform";
if(__GETC__(life_plodrank) >= 3) then {_uniform = "U_IG_Guerrilla_6_1";};
player forceAddUniform _uniform;


//NDJ 03May14 - if cop, retexture me
[player, true] call life_fnc_HandleUniforms; //choose uniform retexture and send it to everyone.
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemRadio";
player assignItem "ItemRadio";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] call life_fnc_saveGear;