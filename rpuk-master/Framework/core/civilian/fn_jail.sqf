/*
	File: fn_jail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the initial process of jailing.
*/
private["_bad","_unit","_index", "_data", "_crimes"]; //NDJ
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Dafuq?
if(_unit != player) exitWith {}; //Dafuq?
if(life_is_arrested) exitWith {}; //Dafuq i'm already arrested
_bad = [_this,1,false,[false]] call BIS_fnc_param;
player setVariable["restrained",false,true];
player setVariable["Escorting",false,true];
player setVariable["transporting",false,true];

titleText[localize "STR_Jail_Warn","PLAIN"];
hint localize "STR_Jail_LicenseNOTF";

player setPos (getMarkerPos "jail_marker");

if(_bad) then
{
	waitUntil {alive player};
	sleep 1;
};

//Check to make sure they goto check
if(player distance (getMarkerPos "jail_marker") > 40) then
{
	player setPos (getMarkerPos "jail_marker");
};

//Bye illegal Items!
{
	_long = [(_x select 0),0] call life_fnc_varHandle;
	[false,(_x select 0),(missionNamespace getVariable [_long,0])] call life_fnc_handleInv;
} forEach life_illegal_items;

life_is_arrested = true;
license_civ_bounty = false; //Requested by Wilco
removeAllWeapons player;
{player removeMagazine _x} foreach (magazines player);

[[player,_bad],"life_fnc_jailSys",false,false] spawn life_fnc_MP;
[5] call SOCK_fnc_updatePartial;