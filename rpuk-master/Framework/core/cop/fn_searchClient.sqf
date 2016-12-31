/* 
	File: fn_searchClient.sqf
	
	Author: Ciaran Langton
	Date: 2014-12-12 21:44:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-01 01:57:47
*/
private["_cop","_inv","_var","_val","_robber"];
_cop = [_this,0,Objnull,[objNull]] call BIS_fnc_param;
if(isNull _cop) exitWith {};

_output = "<t underline='true' size='1.5'>Virtual Items</t><br/>";
_value = 0;

{
	_var = _x;
	_count = missionNamespace getVariable _var;
	if(_count > 0) then {
		_itemName = [_var] call life_fnc_varToStr;
		_image = [_var] call life_fnc_itemImage;

		if([_itemName,18] call KRON_StrLeft != _itemName) then {
			_itemName = format["%1...",[_itemName,18] call KRON_StrLeft];
		};

		_text = format["<img image='%3' size='1.2'></img> %1 - %2<br/>",_itemName,_count,_image];
		if(([_var,1] call life_fnc_varHandle) in life_illegal_items_names) then {
			_text = format["<img image='%3' size='1.2'></img> <t color='#FF0000'>%1 - %2</t><br/>",_itemName,_count,_image];
			
			_index = [([_var,1] call life_fnc_varHandle),life_illegal_items] call TON_fnc_index;
			if(_index != -1) then {
				_price = (life_illegal_items select _index) select 1;
				_value = _value + (_price * _count);
				[false,([_var,1] call life_fnc_varHandle),_count] call life_fnc_handleInv;
			};
		};
		_output = _output + _text;
	};
} forEach life_inv_items;

_output = _output + "<br/><t underline='true' size='1.5'>Physical Items</t><br/>";
_items = [];

//Weapons
if(primaryWeapon player != "") then {_items pushBack primaryWeapon player};
if(secondaryWeapon player != "") then {_items pushBack secondaryWeapon player};
if(handgunWeapon player != "") then {_items pushBack handgunWeapon player};
//Weapon Magazine
{if(_x != "") then {_items pushBack _x}} forEach primaryWeaponMagazine player;
{if(_x != "") then {_items pushBack _x}} forEach secondaryWeaponMagazine player;
{if(_x != "") then {_items pushBack _x}} forEach handgunMagazine player;
//Weapon Attachments
{if(_x != "") then {_items pushBack _x}} forEach primaryWeaponItems player;
{if(_x != "") then {_items pushBack _x}} forEach secondaryWeaponItems player;
{if(_x != "") then {_items pushBack _x}} forEach handgunItems player;
//Items
_items = _items + assignedItems player;
_items = _items + uniformItems player;
_items = _items + vestItems player;
_items = _items + backpackItems player;
//Goggles and othert slots.
if(headgear player != "") then {_items pushBack headgear player};
if(goggles player != "") then {_items pushBack goggles player};
//Finally, the clothing.
if(uniform player != "") then {_items pushBack uniform player};
if(vest player != "") then {_items pushBack vest player};
if(backpack player != "") then {_items pushBack backpack player};

_itemArr = [[],[]];

{
	if(!(_x in (_itemArr select 0))) then {
		_itemClassname = _x;
		_itemCount = {_x == _itemClassname} count _items;
		(_itemArr select 0) pushBack _itemClassname;
		(_itemArr select 1) pushBack _itemCount;
	};
} forEach _items;


_itemClassnames = _itemArr select 0;
_itemCounts = _itemArr select 1;
{
	_itemClassname = _x;
	_itemCount = _itemCounts select _foreachindex;
	_itemInfo = [_itemClassname] call life_fnc_fetchCfgDetails;

	_itemName = _itemInfo select 1;
	if([_itemName,18] call KRON_StrLeft != _itemName) then {
		_itemName = format["%1...",[_itemName,18] call KRON_StrLeft];
	};

	_text = format["<img image='%3' size='1.2'></img> %1 - %2<br/>",_itemName, _itemCount, _itemInfo select 2];
	if(_itemClassname in life_illegal_weapons_names) then {
		_index = [_itemClassname,life_illegal_weapons] call TON_fnc_index;
		if(_index != -1) then {
			_price = (life_illegal_weapons select _index) select 1;
			_value = _value + (_price * _itemCount);
			_text = format["<img image='%3' size='1.2'></img> <t color='#FF0000'>%1 - %2</t><br/>",_itemName, _itemCount, _itemInfo select 2];
		};
	};

	_output = _output + _text;

} forEach _itemClassnames;

[[player,_output,_value],"life_fnc_copSearch",_cop,false] spawn life_fnc_MP;