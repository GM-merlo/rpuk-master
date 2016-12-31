/*
	File: fn_goodbye.sqf
	Author: Ciaran Langton
	
	Description:
	Goodbye my lover... :(
*/
[] call SOCK_fnc_updateRequest;
//Make it so nothing goes wrong with the player.
disableSerialization;
player allowDamage false;
disableUserInput true;
showChat false;
hintSilent "";
//Turn off the player tags.
life_tagson = false;
[LIFE_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
1 fadeSound 0;
1 fadeMusic 0;
1 fadeRadio 0;
1 fadeSpeech 0;
life_disableHUD = true; //Tell our hud to clear.
[] call life_fnc_hudUpdate;

startLoadingScreen [ "", "Life_RscDisplayLoading" ];
[ "Logging out", "Saving data, please wait!" ] call life_fnc_setLoadingText;

_ui = uiNamespace getVariable ["Life_HUD_nameTags",displayNull];
if(!isNull _ui) then {
	{
		_idc = _ui displayCtrl _x;
		_idc ctrlShow false;
	} forEach life_nametags;
};

if(!life_is_arrested) then {
	player setPos (getMarkerPos "respawn_civilian");
};
sleep 4;
0 fadeSound 1;
0 fadeMusic 1;
0 fadeRadio 1;
0 fadeSpeech 1;
[[player],"TON_fnc_cleanupRequest",false,false] spawn life_fnc_MP;
sleep 1;
showChat true;
disableUserInput false;
endLoadingScreen;
["Aborted",true,false] spawn BIS_fnc_endMission;