/*
	File: fn_seizeWeaponsClient.sqf
	Author: Ciaran Langton
	
	Description:
	"Seizes" the weapons
*/
params [
	["_unit",objNull,[objNull]],
	["_mode",false,[false]]
];

if(isNull _unit) exitWith {};
if(side _unit != west) exitWith {};

if(_mode) then {
	if(primaryWeapon player == "") exitWith {[0,"No primary weapon was found to remove!"] remoteExecCall ["life_fnc_broadcast",_unit];};
	player removeWeapon (primaryWeapon player); //Remove that primary!
	[0,"Removed primary weapon from player!"] remoteExecCall ["life_fnc_broadcast",_unit];
} else {
	if(handgunWeapon player == "") exitWith {[0,"No handgun was found to remove!"] remoteExecCall ["life_fnc_broadcast",_unit];};
	player removeWeapon (handgunWeapon player); //Remove that handgun!
	[0,"Removed handgun from player!"] remoteExecCall ["life_fnc_broadcast",_unit];	
};