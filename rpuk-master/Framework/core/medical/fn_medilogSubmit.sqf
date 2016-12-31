/*
	File: fn_medilogSumbit.sqf
	Author: Ciaran Langton
	Description: Submits something to the medilog of a defined player.
*/
_player = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_text = [_this,1,"",[""]] call BIS_fnc_param;
if(isNull _player || _text == "") exitWith {};
_medilog = _player getVariable["medilog",[]];

_lastNumber = date select 4;
_time = format["%1:%2",date select 3, _lastNumber];
if (_lastNumber < 10) then {
	_time = format["%1:0%2",date select 3, _lastNumber];
};

_text = format["%1 - %2",_time,_text];
_medilog = [_text] + _medilog;
_player setVariable["medilog",_medilog,true];