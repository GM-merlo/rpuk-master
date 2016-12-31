/*
	File: fn_gangFundAdd.sqf
	Author: Ciaran Langton
	
	Description:
	Adds to the gang fund based on the gangs status..
*/
_flag = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_amount = [_this,1,-1,[-1]] call BIS_fnc_param;
if(isNull _flag) exitWith {};
if(_amount < 1) exitWith {};

_gangIngame = _flag getVariable["gangOwner",grpNull];
_gangDBId = _flag getVariable["gangOwnerId",-1];
if(_gangDBId == -1) exitWith {}; //Nobody owns!

if(!isNull _gangIngame) then {
	//Gang is active ingame... Easy.
	_currentFund = _gangIngame getVariable ["gang_bank",0];
	_currentFund = _currentFund + _amount;
	_gangIngame setVariable["gang_bank",_currentFund];
	[[1,_gangIngame],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	[[_gangDBId,_amount],"TON_fnc_updateGangFunds",false,false] spawn life_fnc_MP;
};