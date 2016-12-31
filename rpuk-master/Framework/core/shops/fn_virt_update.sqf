#include <macro.h>
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_item_list","_gear_list","_shop_data","_name","_price"];
disableSerialization;

//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;
_gear_list = _display displayCtrl 2402;

(_display displayCtrl 2406) ctrlEnable false;
(_display displayCtrl 2407) ctrlEnable false;

//Purge list
lbClear _item_list;
lbClear _gear_list;

_shopTitle = getText(missionConfigFile >> "CfgVirtualShop" >> life_shop_type >> "displayname");
_shopItems = getArray(missionConfigFile >> "CfgVirtualShop" >> life_shop_type >> "items");

ctrlSetText[2403,_shopTitle];

_shopHandle = [_item_list,_shopItems] spawn {
	disableSerialization;
	_item_list = _this select 0;
	_shopItems = _this select 1;
	{
		_name = [([_x,0] call life_fnc_varHandle)] call life_fnc_vartostr;
		_index = [_x,dynamic_buy_array] call TON_fnc_index;
		if(_index != -1) then
		{
			_price = round((dynamic_buy_array select _index) select 1);
			_item_list lbAdd format["%1 (£%2)",_name,[_price] call life_fnc_numberText];
			_item_list lbSetData [(lbSize _item_list)-1,_x];
			_item_list lbSetValue [(lbSize _item_list)-1,_price];


			_pic = [([_x,0] call life_fnc_varHandle)] call life_fnc_itemImage;
			if(_pic != "") then {
				_item_list lbSetPicture [(lbSize _item_list)-1,_pic];
			};
		};
	} foreach _shopItems;
};

_playerHandle = [_gear_list,_shopItems] spawn {
	disableSerialization;
	_gear_list = _this select 0;
	_shopItems = _this select 1;
	{
		_var = [_x,0] call life_fnc_varHandle;
		_val = missionNameSpace getVariable _var;
		_name = [_var] call life_fnc_vartostr;

		if(_val > 0) then
		{
			_gear_list lbAdd format["%1x %2",_val,_name];
			_gear_list lbSetData [(lbSize _gear_list)-1,_x];

			_pic = [_var] call life_fnc_itemImage;
			if(_pic != "") then {
				_gear_list lbSetPicture [(lbSize _gear_list)-1,_pic];
			};
		};
	} foreach _shopItems;
};

waitUntil {scriptDone _shopHandle && scriptDone _playerHandle};
(_display displayCtrl 2406) ctrlEnable true;
(_display displayCtrl 2407) ctrlEnable true;
