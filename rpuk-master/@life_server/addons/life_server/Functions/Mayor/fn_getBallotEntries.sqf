/* 
	File: fn_getBallotEntries.sqf
	
	Author: Ciaran Langton
	Date: 2015-01-28 22:14:03
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-26 23:21:49
*/
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _player) exitWith {};

_return = [];
_title = "Last Reloaded: Just Now!";
//--CL ADD CACHE
if(life_lastBallotQueryTime != -1 && {time - life_lastBallotQueryTime < 120}) then {
	["Returned cached ballot query result.","CONSOLELOG"] call console;
	_return = life_lastBallotQueryResult;
	_title = format["Last Reloaded: %1 seconds ago!",round(time - life_lastBallotQueryTime)];
} else {
	["Running ballot query.","CONSOLELOG"] call console;
	_return = ["getBallotEntries",2,true] call DB_fnc_preparedCall;
	life_lastBallotQueryTime = time;
	life_lastBallotQueryResult = _return;
};

[[_player,_return,_title],"life_fnc_populateBallotMenu",_player] spawn life_fnc_MP;