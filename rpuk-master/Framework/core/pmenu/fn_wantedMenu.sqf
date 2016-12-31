#include <macro.h>
/*
	File: fn_wantedMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the Wanted menu and connects to the APD.
*/
private["_display","_list","_name","_crimes","_bounty","_units"];
_isBounty = [_this,0,false,[false]] call BIS_fnc_param;
_action = [_this,3,false,[false]] call BIS_fnc_param; //Are we opening using addaction?
disableSerialization;

if(_isBounty || _action) then
{
	createDialog "life_bounty_menu";
} 
	else
{
	createDialog "life_wanted_menu";	
};

_display = findDisplay 2400;
_list = _display displayCtrl 2401;
lbClear _list;
_units = [];

ctrlSetText[2404,"Establishing connection..."];
if(!(_isBounty)) then
{
	if(__GETC__(life_plodrank) < 3 && __GETC__(life_wilcorank) == 0) then
	{
		ctrlShow[2405,false];
	};
};
[] spawn life_fnc_wantedList;