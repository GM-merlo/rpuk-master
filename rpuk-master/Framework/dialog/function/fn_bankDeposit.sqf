/*
	File: fn_bankDeposit.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Figure it out.
*/
private["_value"];
_value = parseNumber(ctrlText 2702);

//Series of stupid checks
if(_value > 999999) exitWith {hint localize "STR_ATM_GreaterThan";};
if(_value < 0) exitWith {};
if(!([str(_value)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_value > RPUK_dosh) exitWith {hint localize "STR_ATM_NotEnoughCash"};

RPUK_dosh = RPUK_dosh - _value;
RPUK_doshinbank = RPUK_doshinbank + _value;

hint format[localize "STR_ATM_DepositMSG",[_value] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[[player, ObjNull, _value, "atmdeposit"],"TON_fnc_MoneyRecord",false,false] spawn life_fnc_MP;
[6] call SOCK_fnc_updatePartial;
