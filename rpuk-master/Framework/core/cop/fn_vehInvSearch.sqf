#include <macro.h>
/* 
	File: fn_vehInvSearch.sqf
	
	Author: Ciaran Langton
	Date: 2014-12-12 21:44:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-01-31 16:23:28
*/
private["_vehicle","_vehicleInfo","_value"];
_vehicle = cursorTarget;
if(isNull _vehicle) exitWith {};
if(!((_vehicle isKindOf "Air") OR (_vehicle isKindOf "Ship") OR (_vehicle isKindOf "LandVehicle") OR (_vehicle isKindOf "Cargo_base_F"))) exitWith {};

_vehicleInfo = _vehicle getVariable ["Trunk",[]];

_value = 0;

_output = "<t underline='true' size='1.5'>Trunk Items</t><br/>";
{
	_var = _x select 0;
	_count = _x select 1;

	_itemName = [([_var,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	_image = [([_var,0] call life_fnc_varHandle)] call life_fnc_itemImage;

	if([_itemName,18] call KRON_StrLeft != _itemName) then {
		_itemName = format["%1...",[_itemName,18] call KRON_StrLeft];
	};

	_text = format["<img image='%3' size='1.2'></img> %1 - %2<br/>",_itemName,_count,_image];
	if(_var in life_illegal_items_names) then {
		_text = format["<img image='%3' size='1.2'></img> <t color='#FF0000'>%1 - %2</t><br/>",_itemName,_count,_image];
		
		_index = [_var,life_illegal_items] call TON_fnc_index;
		if(_index != -1) then {
			_price = (life_illegal_items select _index) select 1;
			_value = _value + (_price * _count);
		};
	};
	_output = _output + _text;
} foreach (_vehicleInfo select 0);


_arr = [];
_weapons = getWeaponCargo _vehicle;
_magazines = getMagazineCargo _vehicle;
_items = getItemCargo _vehicle;
_backpacks = getBackpackCargo _vehicle;
_arr pushBack _weapons;
_arr pushBack _magazines;
_arr pushBack _items;
_arr pushBack _backpacks;

//Backpack working out revision two.
_backpackItems = [];
{
	_weaponCargo = weaponCargo _x;
	_itemCargo = itemCargo _x;
	_magazineCargo = magazineCargo _x;
	_backpackCargo = backpackCargo _x;
	_backpackItems = _backpackItems + _weaponCargo;
	_backpackItems = _backpackItems + _magazineCargo;
	_backpackItems = _backpackItems + _itemCargo;
	_backpackItems = _backpackItems + _backpackCargo;
} forEach (everyBackpack _vehicle);


_backpackArr = [[],[]];

{
	if(!(_x in (_backpackArr select 0))) then {
		_itemClassname = _x;
		_itemCount = {_x == _itemClassname} count _backpackItems;
		(_backpackArr select 0) pushBack _itemClassname;
		(_backpackArr select 1) pushBack _itemCount;
	};
} forEach _backpackItems;

_output = _output + "<t underline='true' size='1.5'>Inventory Items</t><br/>";
//Data for the items.
{
	_itemClassnames = _x select 0;
	_itemCounts = _x select 1;
	{
		_itemClassname = _x;
		_itemCount = _itemCounts select _foreachindex;
		_itemInfo = [_itemClassname] call life_fnc_fetchCfgDetails;

		_itemName = _itemInfo select 1;
		if([_itemName,18] call KRON_StrLeft != _itemName) then {
			_itemName = format["%1...",[_itemName,18] call KRON_StrLeft];
		};

		_text = format["<img image='%3' size='1.2'></img>%1 - %2<br/>",_itemName, _itemCount, _itemInfo select 2];
		if(_itemClassname in life_illegal_weapons_names) then {
			_index = [_itemClassname,life_illegal_weapons] call TON_fnc_index;
			if(_index != -1) then {
				_price = (life_illegal_weapons select _index) select 1;
				_value = _value + (_price * _itemCount);
				_text = format["<img image='%3' size='1.2'></img><t color='#FF0000'>%1 - %2</t><br/>",_itemName, _itemCount, _itemInfo select 2];
			};
		};

		_output = _output + _text;

	} forEach _itemClassnames;
} forEach _arr;

_output = _output + "<t underline='true' size='1.5'>Backpack Items</t><br/>";

//Displaying the backpack information revision two.

_itemClassnames = _backpackArr select 0;
_itemCounts = _backpackArr select 1;
{
	_itemClassname = _x;
	_itemCount = _itemCounts select _foreachindex;
	_itemInfo = [_itemClassname] call life_fnc_fetchCfgDetails;
	
	_itemName = _itemInfo select 1;
	if([_itemName,18] call KRON_StrLeft != _itemName) then {
		_itemName = format["%1...",[_itemName,18] call KRON_StrLeft];
	};

	_text = format["<img image='%3' size='1.2'></img>%1 - %2<br/>",_itemName, _itemCount, _itemInfo select 2];
	if(_itemClassname in life_illegal_weapons_names) then {
		_index = [_itemClassname,life_illegal_weapons] call TON_fnc_index;
		if(_index != -1) then {
			_price = (life_illegal_weapons select _index) select 1;
			_value = _value + (_price * _itemCount);
			_text = format["<img image='%3' size='1.2'></img><t color='#FF0000'>%1 - %2</t><br/>",_itemName, _itemCount, _itemInfo select 2];
		};
	};

	_output = _output + _text;
} forEach _itemClassnames;

hint parseText format["%1<br/> Total of Illegal Items: £%2",_output,[_value] call life_fnc_numberText];


if ((_value > 0) && (worldName == "Tanoa")) then {
	[ceil(_value / 100), false] call life_fnc_addxp; // add some value-related xp (without hint) to cop
};