/*
	File: fn_updateGangFunds.sqf
	Author: Ciaran Langton
	
	Description:
	Updates the gangs funds to the DB.
*/
_dbId = [_this,0,-1,[-1]] call BIS_fnc_param;
_cash = [_this,1,-1,[-1]] call BIS_fnc_param;
if(_dbId < 1 || _cash < 1) exitWith {};

[format["updateGangFunds:%1:%2",_cash,_dbId],1] call DB_fnc_preparedCall;