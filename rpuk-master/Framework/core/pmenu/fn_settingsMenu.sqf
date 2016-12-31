/*
	File: fn_settingsMenu
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Setup the settings menu.
*/
if(isNull (findDisplay 2900)) then
{
	if(!createDialog "SettingsMenu") exitWith {hint "Something went wrong, the menu won't open?"};
};

disableSerialization;

ctrlSetText[2902, format["%1", tawvd_foot]];
ctrlSetText[2912, format["%1", tawvd_car]];
ctrlSetText[2922, format["%1", tawvd_air]];

//Setup Sliders range
{ slidersetRange [_x,100,12000];} foreach [2901,2911,2921];
//Setup Sliders speed
{ ((findDisplay 2900) displayCtrl _x) sliderSetSpeed [100,100,100]; } foreach [2901,2911,2921];
//Setup Sliders position
{
	sliderSetPosition[_x select 0, _x select 1];
} foreach [[2901,tawvd_foot],[2911,tawvd_car],[2921,tawvd_air]];

private["_display","_side","_tags","_objs","_fpsMode","_envMode"];
_display = findDisplay 2900;
_side = _display displayCtrl 2971;
_tags = _display displayCtrl 2970;
_objs = _display displayCtrl 2972;
_fpsMode = _display displayCtrl 2973;
_envMode = _display displayCtrl 2974;

if(life_disableHUD) then {
	_objs ctrlSetTextColor [1,0,0,1];
	_objs ctrlSetText "Disabled";
	_objs buttonSetAction "life_disableHUD = false; [0] call life_fnc_hudSetup; [] call life_fnc_settingsMenu;";
} else {
	_objs ctrlSetTextColor [0,1,0,1];
	_objs ctrlSetText "Enabled";
	_objs buttonSetAction "life_disableHUD = true; [1] call life_fnc_hudSetup; [] call life_fnc_settingsMenu;";
};

if(life_tagson) then {
	_tags ctrlSetTextColor [0,1,0,1];
	_tags ctrlSetText "ON";
	_tags buttonSetAction "[LIFE_ID_PlayerTags,""onEachFrame""] call BIS_fnc_removeStackedEventHandler; life_tagson = false; [] call life_fnc_settingsMenu;";
} else {
	_tags ctrlSetTextColor [1,0,0,1];
	_tags ctrlSetText "OFF";
	_tags buttonSetAction "LIFE_ID_PlayerTags = [""LIFE_PlayerTags"",""onEachFrame"",""life_fnc_playerTags""] call BIS_fnc_addStackedEventHandler; life_tagson = true; [] call life_fnc_settingsMenu;";
};

if(life_sidechat) then {
	_side ctrlSetTextColor [0,1,0,1];
	_side ctrlSetText "ON";
} else {
	_side ctrlSetTextColor [1,0,0,1];
	_side ctrlSetText "OFF";
};

if(life_lowDetail) then { //true if low-detail is wanted (only works when not on Tanoa)
	_fpsMode ctrlSetTextColor [0,1,0,1];
	if (worldname != "Tanoa") then {
		_fpsMode buttonSetAction "life_lowDetail = false; [] call life_fnc_changeFPS; [] call life_fnc_settingsMenu;"; //button turns OFF lowDetail
	} else {
		_fpsMode buttonSetAction "";
	};
	_fpsMode ctrlSetText "ON";
} else {
	_fpsMode ctrlSetTextColor [1,0,0,1];
	if (worldname != "Tanoa") then {
		_fpsMode buttonSetAction "life_lowDetail = true; [] call life_fnc_changeFPS; [] call life_fnc_settingsMenu;"; //button turns ON lowDetail
	} else {
		_fpsMode buttonSetAction "";
	};
	_fpsMode ctrlSetText "OFF";
};

if(life_environment) then { //true if Ambient Environment is wanted
	_envMode ctrlSetTextColor [0,1,0,1];
	_envMode buttonSetAction "life_environment = false; [] call life_fnc_changeEnvironment; [] call life_fnc_settingsMenu;"; //turns Ambient Env OFF next click
	_envMode ctrlSetText "ON";
} else {
	_envMode ctrlSetTextColor [1,0,0,1];
	_envMode buttonSetAction "life_environment = true; [] call life_fnc_changeEnvironment; [] call life_fnc_settingsMenu;"; //turns Ambient Env ON next click
	_envMode ctrlSetText "OFF";
};
