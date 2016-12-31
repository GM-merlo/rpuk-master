/* 
	File: fn_getAuctions.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-28 00:47:53
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-26 23:21:36
*/
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};

_return = [];
_title = "Last Reloaded: Just Now!";
//--CL ADD CACHE
if(life_lastAuctionQueryTime != -1 && {time - life_lastAuctionQueryTime < 120}) then {
	["Returned cached auction query result.","CONSOLELOG"] call console;
	_return = life_lastAuctionQueryResult;
	_title = format["Last Reloaded: %1 seconds ago!",round(time - life_lastAuctionQueryTime)];
} else {
	["Running auction query.","CONSOLELOG"] call console;
	_return = ["getAuctions",2,true] call DB_fnc_preparedCall;
	life_lastAuctionQueryTime = time;
	life_lastAuctionQueryResult = _return;
};

[[_return,_title],"life_fnc_auctionMenuReceive",_unit,false] spawn life_fnc_MP;