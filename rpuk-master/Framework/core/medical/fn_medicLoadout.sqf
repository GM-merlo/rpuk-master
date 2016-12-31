/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/

_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

["U_O_OfficerUniform_ocamo",true] call life_fnc_handleItem; //we use this because that's what Wilco did the skins on!
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit"; 
player addItem "FirstAidKit";
player addItem "ItemGPS";
player assignItem "ItemGPS";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};

waitUntil {uniform player == "U_O_OfficerUniform_ocamo"};
[player, true] call life_fnc_HandleUniforms; //NDJ 21July14 choose uniform retexture and send it to everyone.
[] call life_fnc_saveGear;