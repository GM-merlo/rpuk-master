/*
	File: fn_receiveMoney.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Receives money
*/
private["_unit","_val","_from"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_val = [_this,1,"",[""]] call BIS_fnc_param;
_from = [_this,2,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _from OR _val == "") exitWith {};
if(player distance _from > 50) exitWith {};
if(player != _unit) exitWith {};
if(!([_val] call TON_fnc_isnumber)) exitWith {};
if(parseNumber(_val) <= 0) exitWith {}; //NDJ 25Mar14 - Ensure that _val is positive, so that player can't receive negative money (exploit)
if(_unit == _from) exitWith {}; //Bad boy, trying to exploit his way to riches.
if(parseNumber(_val) > 999999) exitWith {};

hint format[localize "STR_NOTF_GivenMoney",_from getVariable["realname",name _from],[(parseNumber (_val))] call life_fnc_numberText];
[[_from,_unit,_val, "cashreceive"],"TON_fnc_MoneyRecord",false,false] spawn life_fnc_MP; //log to server NDJ 07Apr14
RPUK_dosh = RPUK_dosh + (parseNumber(_val));