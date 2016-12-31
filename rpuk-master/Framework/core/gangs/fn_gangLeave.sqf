#include <macro.h>
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	32 hours later...
*/
private["_grp","_grpMembers"];
if(steamid == (grpPlayer getVariable "gang_owner")) exitWith {hint localize "STR_GNOTF_LeaderLeave"};

_grp = grpPlayer;
_grpMembers = grpPlayer getVariable ["gang_members",[]];
_grpMembers = _grpMembers - [steamid];
_grp setVariable["gang_members",_grpMembers,true];

[[4,_grp,player],"TON_fnc_updateGang",false,false] spawn life_fnc_MP; //UPDATED TO FIX TONICS BUGS ARGG TONIC FIX YO SHIT

closeDialog 0;
life_gangData = [];