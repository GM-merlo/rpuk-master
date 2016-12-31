/*
	File: fn_postBail.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called when the player attempts to post bail.
	Needs to be revised.
*/
private["_unit"];
_unit = _this select 1;
if(life_bail_paid) exitWith {};
if(isNil {life_bail_amount}) then {life_bail_amount = 10000;};
if(!isNil "life_canpay_bail") exitWith {hint localize "STR_NOTF_Bail_Post"};
if(RPUK_doshinbank < life_bail_amount) exitWith {hint format[localize "STR_NOTF_Bail_NotEnough",life_bail_amount];};

RPUK_doshinbank = RPUK_doshinbank - life_bail_amount;
life_bail_paid = true;
[0,format[localize "STR_NOTF_Bail_Bailed", _unit getVariable ["realname",name _unit]]] remoteExecCall ["life_fnc_broadcast",-2];