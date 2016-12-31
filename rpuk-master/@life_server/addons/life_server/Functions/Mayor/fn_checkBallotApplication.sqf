/* 
	File: fn_checkBallotApplication.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-03 15:46:58
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-18 20:18:06
*/
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;

if(isNull _player) exitWith {};
_pid = getPlayerUID _player;

_result = [format["checkBallotApplication:%1",_pid],2,false] call DB_fnc_preparedCall;
if(_result select 0 > 0) exitWith {[[_player,false],"life_fnc_openBallotApplicationMenuClient",_player] spawn life_fnc_MP;};
[[_player,true],"life_fnc_openBallotApplicationMenuClient",_player] spawn life_fnc_MP;