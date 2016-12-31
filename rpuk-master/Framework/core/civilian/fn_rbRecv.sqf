/*
	File: fn_rbRecv.sqf
	Author: Bryan "Tonic" Boardwine
*/
private["_cash"];
_cash = [_this,0,0,[0]] call BIS_fnc_param;
if(_cash < 0) exitWith {titleText[localize "STR_Civ_RobFail","PLAIN"]};

RPUK_dosh = RPUK_dosh + _cash;
titleText[format[localize "STR_Civ_Robbed",[_cash] call life_fnc_numberText],"PLAIN"];
[[objNull,player,_cash, "robreceive"],"TON_fnc_MoneyRecord",false,false] spawn life_fnc_MP; //log to server NDJ 11Apr14