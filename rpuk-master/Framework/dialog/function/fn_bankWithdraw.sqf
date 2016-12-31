/*
	COPY PASTE TIME
*/
private["_val"];
_val = parseNumber(ctrlText 2702);
if(_val > 999999) exitWith {hint localize "STR_ATM_WithdrawMax";};
if(_val < 0) exitwith {};
if(!([str(_val)] call life_fnc_isnumeric)) exitWith {hint localize "STR_ATM_notnumeric"};
if(_val > RPUK_doshinbank) exitWith {hint localize "STR_ATM_NotEnoughFunds"};
if(_val < 100 && RPUK_doshinbank > 20000000) exitWith {hint localize "STR_ATM_WithdrawMin"}; //Temp fix for something.

RPUK_dosh = RPUK_dosh + _val;
RPUK_doshinbank = RPUK_doshinbank - _val;
hint format [localize "STR_ATM_WithdrawSuccess",[_val] call life_fnc_numberText];
[] call life_fnc_atmMenu;
[[ObjNull, player, _val, "atmwithdraw"],"TON_fnc_MoneyRecord",false,false] spawn life_fnc_MP;
[6] call SOCK_fnc_updatePartial;