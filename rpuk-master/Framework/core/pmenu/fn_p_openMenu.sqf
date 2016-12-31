#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

[] spawn {
	disableSerialization;
	_display = findDisplay 2001;
	_text = _display displayCtrl 2017;
	while {!(isNull (findDisplay 2001))} do {
		_str = [serverTime,"HH:MM:SS"] call BIS_fnc_secondsToString;
		_text ctrlSetText format["%1 - Server online for: %2",localize "STR_PM_Title",_str];
		sleep 1;
	};
};

switch(playerSide) do
{
	case independent; //CL - Disable the gang menu button for medics too!
	case west: 
	{
		ctrlShow[2011,false];
	};

	case civilian:
	{
		ctrlShow[2012,false];
	};
};

if(call life_fnc_isRebel) then
{
	ctrlShow[2011,false];
};

if(!license_civ_bounty) then
{
	ctrlShow[2024,false];
};

if(__GETC__(life_wilcorank) < 1) then
{
//	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;

if(__GETC__(life_wilcorank) < 1) then
{
//	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

if(call life_fnc_isRebel) then
{
	ctrlShow[2011,false];
};

if(!license_civ_bounty) then
{
	ctrlShow[2024,false];
};