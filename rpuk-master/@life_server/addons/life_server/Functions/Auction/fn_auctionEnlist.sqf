/* 
	File: fn_auctionEnlist.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-27 23:03:31
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-15 17:01:19
*/
_vid = [_this,0,-1,[-1]] call BIS_fnc_param;
_classname = [_this,1,"",[""]] call BIS_fnc_param;
_minBid = [_this,2,-1,[-1]] call BIS_fnc_param;
_description = [_this,3,"",[""]] call BIS_fnc_param;
_unit = [_this,4,objNull,[objNull]] call BIS_fnc_param;
_pid = [_this,5,"",[""]] call BIS_fnc_param;

if(_vid == -1 || _classname == "" || _minBid == -1 || _description == "" || isNull _unit || _pid == "" || getPlayerUID _unit != _pid) exitWith {};

_description = [_description, ",", "¬"] call KRON_Replace;
_description = [_description, """", "~"] call KRON_Replace;
_description = [_description] call DB_fnc_mresString;
_classname = [_classname] call DB_fnc_mresString;
_minBid = [_minBid] call DB_fnc_numberSafe;
_vid = [_vid] call DB_fnc_numberSafe;

_query = format[
	"auctionEnlist:%1:%2:%3:%4",
	_minBid,
	_description,
	_vid,
	_pid
];

[_query,1] call DB_fnc_preparedCall;
life_lastAuctionQueryTime = -1;