/* 
	File: fn_auctionEnlist.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-27 18:38:44
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-04-05 13:41:39
*/
disableSerialization;
if(count life_auctioning_car_data < 1) exitWith {}; //ERROR - VEHICLE DATA NOT THERE!
_vid = [life_auctioning_car_data,0,-1,[-1]] call BIS_fnc_param;
_car = [life_auctioning_car_data,1,"",[""]] call BIS_fnc_param;
if(_vid == -1 || _car == "") exitWith {};
_display = findDisplay 13750;
_minBid = ctrlText (_display displayCtrl 1400);  
if(!([_minBid] call TON_fnc_isnumber)) exitWith {hint "Please enter a number for the minimum bid.";};
_minBid = parseNumber _minBid; //To number.
if(_minBid < 100) exitWith {hint "The minimum lowest bid is £100.";};
if(_minBid > 30000000) exitWith {hint "The maximum minimum bid is £30,000,000";};
_text = ctrlText (_display displayCtrl 1600);

if([_text] call KRON_StrLen < 10 || [_text] call KRON_StrLen > 1000) exitWith {hint "Your text is either less than 10 characters, or greater than 1000. Please reduce/add text to allow you to proceed.";};

_textToBeSent = _text;

_filter = "'/\`:|;{}-<>";
_text = toArray _text;
_filter = toArray _filter;
_trigger = false;
{if(_x in _filter) exitWith {_trigger = true;};} foreach _text;
if(_trigger) exitWith {hint "Please remove any restricted characters inside your text. Restricted Characters: '/\`:|;{}-<>"};

[[_vid,_car,_minBid,_textToBeSent,player,getPlayerUID player],"AUCTION_fnc_auctionEnlist",(call life_fnc_findTransactionMethod),false] spawn life_fnc_MP;
hint "Your car has been enlisted onto the aBay marketing system. The action is set to run for two days.";

[] spawn {
	while {dialog} do {
		closeDialog 0;
	};
};