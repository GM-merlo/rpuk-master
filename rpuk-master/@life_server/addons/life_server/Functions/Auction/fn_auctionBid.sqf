/* 
	File: fn_auctionBid.sqf
	
	Author: Ciaran Langton
	Date: 2015-03-07 14:23:51
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-04-05 13:58:39
*/
params [
	["_unit",objNull,[objNull]],
	["_vid",-1,[-1]],
	["_ownerid","",[""]],
	["_bid",-1,[-1]]
];

if(isNull _unit || _vid == -1 || _ownerid == "" || _bid == -1) exitWith {};
if(getPlayerUID _unit == "") exitWith {};
_query = format[
	"auctionBid:%1:%2:%3:%4:%1",
	[_bid] call DB_fnc_numberSafe,
	getPlayerUID _unit,
	_vid,
	[_ownerid] call DB_fnc_mresString
];
[_query,1] call DB_fnc_preparedCall;
life_lastAuctionQueryTime = -1;
[1,format["Bid placed for the vehicle successfully. You bidded: £%1. Thank you for using aBay!",([_bid] call life_fnc_numberText)]] remoteExecCall ["life_fnc_broadcast",_unit];