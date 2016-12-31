/* 
	File: fn_gangSetRank.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-03 19:58:04
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-10 20:20:05
*/
#include <macro.h>

private["_unit","_unitID","_members","_action","_index"];
disableSerialization;

if((lbCurSel 2621) == -1) exitWith {hint localize "STR_GNOTF_TransferSelect"};
_unit = call compile format["%1",getSelData(2621)];

if((lbCurSel 2633) == -1) exitWith {hint "You need to select a new rank from the bottom listbox."};
_newRank = lbText[2633,(lbCurSel 2633)];
_newRank = parseNumber _newRank;

if(isNull _unit) exitWith {}; //Bad unit?

if(_unit == player) exitWith {hint "You cannot edit yourself."}; //Cant set yourself!

if(life_my_gang_rank < 3) exitWith {hint "Your rank is not high enough to do that."};
if(life_my_gang_rank <= _newRank) exitWith {hint "Your rank is not high enough to do that. You can only promote people to the level below you!";};
if(_unit getVariable["gangrank",-1] >= life_my_gang_rank) exitWith {hint "The person you are trying to edit is the same rank or higher than you.";};
if(getPlayerUID _unit == grpPlayer getVariable["gang_owner",-1]) exitWith {hint "You cannot edit the gang owner, the gang owner needs to step down by transferring ownership to someone else.";};
if(_newRank == 4) exitWith {hint "To transfer leadership use the 'Set Leader' button."};

_unitID = getPlayerUID _unit;

if(_unitID == "") exitWith {hint "Bad UID?"}; //Unlikely?
[[_unit,_newRank],"life_fnc_updateGangRank",_unit,false] spawn life_fnc_MP; //Change the level!
hint "Updated members rank.";
sleep 0.5;
[] call life_fnc_gangMenu;