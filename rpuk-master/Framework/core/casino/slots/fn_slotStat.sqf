/* 
	File: fn_slotStat.sqf
	Desc: Receives the slot jackpot from the server and sets it on the diag.

	Author: Ciaran Langton
*/
disableSerialization;

_maxPayout = _this select 0;
if(typeName _maxPayout != typeName 1) exitWith {}; //DaFuck?
if(!dialog) exitWith {}; //Looks like they quit before our server responded.
_ui = findDisplay 8500;

_slotText = _ui displayCtrl 1100;
_slotText ctrlSetStructuredText parseText format["Current Jackpot = £%1",[_maxPayout] call life_fnc_numberText];