/*
	File: fn_giveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gives the selected amount of money to the selected player.
*/
private["_unit","_amount"];
_amount = ctrlText 2018;
ctrlShow[2001,false];
if((lbCurSel 2022) == -1) exitWith {hint "No one was selected!";ctrlShow[2001,true];};
_unit = lbData [2022,lbCurSel 2022];
_unit = call compile format["%1",_unit];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

//A series of checks *ugh*
if(!life_use_atm) exitWith {hint "You recently robbed the bank! You can't give money away just yet.";ctrlShow[2001,true];};
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "You didn't enter an actual number format.";ctrlShow[2001,true];};
if(parseNumber(_amount) <= 0) exitWith {hint "You need to enter an actual amount you want to give.";ctrlShow[2001,true];};
if(parseNumber(_amount) > RPUK_dosh) exitWith {hint "You don't have that much to give!";ctrlShow[2001,true];};
if(parseNumber(_amount) > 999999) exitWith {hint "You cannot send more than £999,999 in one transfer!";ctrlShow[2001,true];};

if(isNull _unit) exitWith {ctrlShow[2001,true];};
if(isNil "_unit") exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};
if(player distance _unit > 50) exitWith {ctrlShow[2001,true]; hint "The selected player is not within range";};

hint format["You gave £%1 to %2",[(parseNumber(_amount))] call life_fnc_numberText,_unit getVariable["realname",name _unit]];
RPUK_dosh = RPUK_dosh - (parseNumber(_amount));
[0] call SOCK_fnc_updatePartial;
[[_unit,_amount,player],"life_fnc_receiveMoney",_unit,false] spawn life_fnc_MP;
[[player,_unit,_amount, "cashgive"],"TON_fnc_MoneyRecord",false,false] spawn life_fnc_MP; //log to server NDJ 07Apr14
[] call life_fnc_p_updateMenu;
[] call SOCK_fnc_updateRequest;
ctrlShow[2001,true];