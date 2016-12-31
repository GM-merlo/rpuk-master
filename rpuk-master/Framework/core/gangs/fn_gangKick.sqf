#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours...
*/
private["_unit","_unitID","_members"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_SelectKick"};
_unit = call compile format["%1",getSelData(2621)];
if(isNull _unit) exitWith {}; //Bad unit?
if(_unit == player) exitWith {hint localize "STR_GNOTF_KickSelf"};
if(_unit getVariable["gangrank",-1] >= life_my_gang_rank) exitWith {hint "The person you are trying to kick is the same rank or higher than you.";};

_unitID = getPlayerUID _unit;
_members = grpPlayer getVariable "gang_members";
if(isNil "_members") exitWith {};
if(typeName _members != "ARRAY") exitWith {};
_members = _members - [_unitID];
grpPlayer setVariable["gang_members",_members,true];

[[_unit,grpPlayer],"TON_fnc_clientGangKick",_unit,false] spawn life_fnc_MP; //Boot that bitch!
[[4,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //Update the database.
[] call life_fnc_gangMenu;