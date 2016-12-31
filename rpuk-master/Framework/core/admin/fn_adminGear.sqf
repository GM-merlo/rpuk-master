/*
	File: fn_adminGear.sqf
	Author: Ciaran Langton
	Description:
	Equips admin uniform and gear.
*/
if(call life_wilcorank < 1) exitWith {};

if (RPUK_AGear == 4) then {
	[] call life_fnc_saveGear;
	RPUK_AGear = 0;
} else {
	RPUK_AGear = RPUK_AGear + 1;
};

_script = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _script};


if(!(RPUK_AGear == 4)) then {
	
	_AGearU = ["U_B_Protagonist_VR","U_O_Protagonist_VR","U_I_Protagonist_VR","U_VirtualMan_F"] select RPUK_AGear;
	player addHeadgear "H_Cap_headphones";
	player addGoggles "G_Goggles_VR";
	player forceAddUniform _AGearU;
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
	player addItem "NVGoggles";
	player assignItem "NVGoggles";
} else {
	
	life_gear set [16,[]]; //wipe all the food and vitems for now - they'll come back in the loadGear if entitled.
	
	//Load gear and return to normal life
	[] call life_fnc_loadGear;
	
	//player may not have had all these beforehand, but they don't seem to come back automatically from the loadGear func
	//so let's pop them in anyway. Most admins will have had them on their characters in the first place anyway - NDJ 19/07/16
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
};


