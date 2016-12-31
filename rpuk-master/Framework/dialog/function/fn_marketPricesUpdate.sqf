#include <macro.h>
/*
	File: fn_marketPricesUpdate.sqf
	Author: Ciaran Langton
	Description: Updates the market prices dialog.
*/
disableSerialization;
if(!dialog) exitWith {};
_dialog = findDisplay 1000;
if(isNull _dialog) exitWith {};
_list = _dialog displayCtrl 1500;
_text = _dialog displayCtrl 1100;

_selection = lbCurSel _list;
_data = _list lbData _selection;
if(isNil '_data') exitWith {};

_name = [_data] call life_fnc_varToStr;
_buyIndex = [([_data,1] call life_fnc_varHandle),dynamic_buy_array] call TON_fnc_index;
_sellIndex = [([_data,1] call life_fnc_varHandle),dynamic_sell_array] call TON_fnc_index;

_buyPrice = "N/A";
if(_buyIndex != -1) then {
	_buyPrice = round(((dynamic_buy_array) select _buyIndex) select 1);
	_buyPrice = format["£%1",[_buyPrice] call life_fnc_numberText];
};
_sellPrice = "N/A";
if(_sellIndex != -1) then {
	_sellPrice = round(((dynamic_sell_array) select _sellIndex) select 1);
	_sellPrice = format["£%1",[_sellPrice] call life_fnc_numberText];
};

_text ctrlSetStructuredText parseText format["<t size='2'>%1</t><br/><br/>Sell Price: %2<br/>Buy Price: %3",_name,_sellPrice,_buyPrice];