#include <macro.h>
/*
	File: fn_marketPricesOpen.sqf
	Author: Ciaran Langton
	Description: Opens the market prices dialog.
*/
disableSerialization;
If(!createDialog "life_market_prices") exitWith {};
_dialog = findDisplay 1000;
_list = _dialog displayCtrl 1500;
lbClear _list;
{
	_name = [_x] call life_fnc_varToStr;
	_buyIndex = [([_x,1] call life_fnc_varHandle),dynamic_buy_array] call TON_fnc_index;
	_sellIndex = [([_x,1] call life_fnc_varHandle),dynamic_sell_array] call TON_fnc_index;

	if(_buyIndex != -1 || _sellIndex != -1) then {
		_buyPrice = 0;
		if(_buyIndex != -1) then {
			_buyPrice = round(((dynamic_buy_array) select _buyIndex) select 1);
		};
		_sellPrice = 0;
		if(_sellIndex != -1) then {
			_sellPrice = round(((dynamic_sell_array) select _sellIndex) select 1);
		};
		if(_buyPrice != 0 || _sellPrice != 0) then {
			_list lbAdd _name;
			_list lbSetData[(lbSize _list)-1,_x];

			_image = [_x] call life_fnc_itemImage;
			if(_image != "") then {
				_list lbSetPicture[(lbSize _list)-1,_image];
			};
		};
	};
} forEach life_inv_items;
lbSort _list;