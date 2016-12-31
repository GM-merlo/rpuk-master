/* 
	File: fn_updateGangRank.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-03 19:53:45
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-10 20:06:12
*/
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_newLevel = [_this,1,-1,[-1]] call BIS_fnc_param;

if(isNull _unit || _newLevel < 1 || _newLevel > 4) exitWith {};
life_my_gang_rank = _newLevel;
[] call SOCK_fnc_updateRequest;
player setVariable["gangrank",life_my_gang_rank,true];