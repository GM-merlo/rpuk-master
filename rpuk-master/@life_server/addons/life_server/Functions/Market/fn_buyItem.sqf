/*
	File: fn_buyItem.sqf
	Author: Ciaran Langton
	
	Description:
	Handles the Supply and Demand Model.
*/
_item = [_this,0,"",[""]] call BIS_fnc_param;
_count = [_this,1,-1,[0]] call BIS_fnc_param;
if(_item == "") exitWith {};
if(_count < 1) exitWith {};

_buyIndex = [_item,dynamic_buy_array] call TON_fnc_index;
_sellIndex = [_item,dynamic_sell_array] call TON_fnc_index;

_maxBuyIndex = [_item,call max_buy_array] call TON_fnc_index;
_maxSellIndex = [_item,call max_sell_array] call TON_fnc_index;

_newBuyPrice = -1;
_newSellPrice = -1;

_maxBuyPrice = -1;
_maxSellPrice = -1;

_buyPrice = -1;
_sellPrice = -1;

if(_maxBuyIndex == -1 && _maxSellIndex == -1) exitWith {};
if(_buyIndex == -1 && _sellIndex == -1) exitWith {};

if(_maxBuyIndex != -1 && _buyIndex != -1) then {
	_maxBuyPrice = ((call max_buy_array) select _maxBuyIndex) select 1;
	_buyPrice = (dynamic_buy_array select _buyIndex) select 1;
	if(_maxBuyPrice != 0 && _buyPrice != 0) then {
		_addPrice = (_maxBuyPrice/100) * life_item_modifier; //1 Percent
		_newBuyPrice = _buyPrice + (_addPrice * _count);
	};
};

if(_maxSellIndex != -1 && _sellIndex != -1) then {
	_maxSellPrice = ((call max_sell_array) select _maxSellIndex) select 1;
	_sellPrice = (dynamic_sell_array select _sellIndex) select 1;
	if(_maxSellPrice != 0 && _sellPrice != 0) then {
		_addPrice = (_maxSellPrice/100) * life_item_modifier; //1 Percent
		_newSellPrice = _sellPrice + (_addPrice * _count);
	};	
};

_exit = false;
if(_newBuyPrice != -1 && _newSellPrice != -1) then {
	if(_newBuyPrice < _newSellPrice) exitWith {
		dynamic_sell_array set[_sellIndex,[_item,1]];
		dynamic_buy_array set[_buyIndex,[_item,1]];
		publicVariable "dynamic_sell_array";
		publicVariable "dynamic_buy_array";
		_exit = true;
	};
};
if(_exit) exitWith {};


if(_newSellPrice != -1 && _maxSellPrice != -1) then {
	if(_newSellPrice <= _maxSellPrice) then {
		dynamic_sell_array set[_sellIndex,[_item,_newSellPrice]];
	} else {
		dynamic_sell_array set[_sellIndex,[_item,_maxSellPrice]];
	};
};

if(_newBuyPrice != -1 && _maxBuyPrice != -1) then {
	if(_newBuyPrice <= _maxBuyPrice) then {
		dynamic_buy_array set[_buyIndex,[_item,_newBuyPrice]];
	} else {
		//Set max as it needs to be.
		dynamic_buy_array set[_buyIndex,[_item,_maxBuyPrice]];
	};
};

publicVariable "dynamic_sell_array";
publicVariable "dynamic_buy_array";

