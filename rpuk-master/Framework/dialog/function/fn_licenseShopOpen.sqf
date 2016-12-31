/*
	File: fn_licenseShopOpen.sqf
	Author: Ciaran Langton
	
	Description:
	Opens the license shop.
*/
_type = [_this,3,"",[""]] call BIS_fnc_param;
if(dialog) exitWith {};
_licenses = switch (_type) do {
	case "dvla": {["driver","boat","pilot","truck","gun","bus","home"]};
	case "police": {["cair","cg"]};
	default {[]};
};
if(count _licenses == 0) exitWith {};
if(!(createDialog "licenseshop")) exitWith {};
_display = findDisplay 8500;
_shopList = _display displayCtrl 1500;
_hasList = _display displayCtrl 1501;

{
	_long = [_x,0] call life_fnc_licenseType;
	_name = _long select 1;
	if(!(missionNamespace getVariable (_long select 0))) then
	{
		_shopList lbAdd format["£%1-%2",[[_x] call life_fnc_licensePrice] call life_fnc_numberText,_name];
		_shopList lbSetData[(lbSize _shopList-1),_x];
	} else {
		_hasList lbAdd _name;
	};
} forEach _licenses;