#include <macro.h>
/*
	File: fn_vehicleShopLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when a new selection is made in the list box and
	displays various bits of information about the vehicle.
*/
disableSerialization;
private["_control","_index","_className","_basePrice","_rentPrice","_vehicleInfo","_colorArray","_ctrl"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_className = _control lbData _index;
_vIndex = _control lbValue _index;
_vehicleList = [life_veh_shop select 0] call life_fnc_vehicleListCfg;
_basePrice = (_vehicleList select _vIndex) select 1;
_vehicleInfo = [_className] call life_fnc_fetchVehInfo;
_trunkSpace = [_className] call life_fnc_vehicleWeightCfg;



if(_className == "B_Quadbike_01_F" || {_className == "C_Quadbike_01_F"}) then {
	_rentPrice = round(_basePrice * 0.25); //NDJ quadbike rental vehicle, quarter price!
} else {
	_rentPrice = round(_basePrice * 0.5); //NDJ rental vehicle, half price!
};


_basePrice = ceil(_basePrice * call life_priceModifier);
_rentPrice = ceil(_rentPrice * call life_priceModifier);

_perm = switch (_className in (__GETC__(life_vShop_rentalOnly))) do {
	case true: {"No"};
	case false: {"Yes"};
};

ctrlShow [2330,true];
(getControl(2300,2303)) ctrlSetStructuredText parseText format["<t size='1.1'><img image='%9' size='1.5'/> %10</t><br/>Permanent: %12<br/>Class: %11<br/>Purchase Price: <t color='#8cff9b'>£%1</t><br/>Rental Price: <t color='#8cff9b'>£%2</t><br/>Max Speed: %3 km/h<br/>Horse Power: %4<br/>Passenger Seats: %5<br/>Trunk Capacity: %6<br/>Fuel Capacity: %7<br/>Armour Rating: %8",
[_basePrice] call life_fnc_numberText,
[_rentPrice] call life_fnc_numberText, 
_vehicleInfo select 8,
_vehicleInfo select 11,
_vehicleInfo select 10,
if(_trunkSpace < 1) then {"None"} else {_trunkSpace},
_vehicleInfo select 12,
_vehicleInfo select 9,
_vehicleInfo select 2,
_vehicleInfo select 3,
_vehicleInfo select 4,
_perm
];

_ctrl = getControl(2300,2304);
lbClear _ctrl;
_colorArray = [_className] call life_fnc_vehicleColorCfg;

for "_i" from 0 to count(_colorArray)-1 do {
	if((_colorArray select _i) select 1 == (life_veh_shop select 2)) then {
		_temp = [_className,_i] call life_fnc_vehicleColorStr;
		_ctrl lbAdd format["%1",_temp];
		_ctrl lbSetValue [(lbSize _ctrl)-1,_i];
	};
};

if(_className in (__GETC__(life_vShop_rentalOnly)) || playerSide in [west,independent] || (life_veh_shop select 2) == "mayor") then {
	ctrlEnable [2309,false];
} else {
	if(!(life_veh_shop select 3)) then {
		ctrlEnable [2309,true];
	};
};

lbSetCurSel[2304,0];
if((lbSize _ctrl)-1 != -1) then {
	ctrlShow[2304,true];
} else {
	ctrlShow[2304,false];
};
true;