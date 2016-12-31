#include <ALUKMobile.h>
/* 
	File: fn_mobileSendMessage.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-13 21:01:09
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 18:08:09
*/
disableSerialization;
if(count life_cellphone_receiver < 1) exitWith {};
_dlg = findDisplay IDD_ALUKMOBILE;
if(isNull _dlg) exitWith {};
_sendLoc = cbChecked (_dlg displayCtrl IDC_ALUKMOBILE_SENDGRIDREFCHECKBOX);
_text = ctrlText (_dlg displayCtrl IDC_ALUKMOBILE_YOURMESSAGETEXT);
if(count _text < 1) exitWith {}; 

_textToFilter = _text;

_filter = "`{}<>";
_textToFilter = toArray _textToFilter;
_filter = toArray _filter;
_trigger = false;
{
	if(_x in _filter) exitWith {
		_trigger = true;
	};
} foreach _textToFilter;

if(_trigger) exitWith {hint "Please remove any restricted characters inside your text. Restricted Characters: `{}<>"};

_exit = false;
_receiver = switch (life_cellphone_receiver select 1) do
{
	case 0:
	{
		_pid = life_cellphone_receiver select 2;
		_player = objNull;
		{if(getPlayerUID _x == _pid) exitWith {_player = _x};} forEach playableUnits;
		if(isNull _player) exitWith {_exit = true;};
		_player;
	};

	case 1: {west};
	case 2: {independent};
	case 3: {civilian};
	case 4: {civilian};
	case 5: {true};
	case 6: {civilian};

	default {_exit = true;};
};
if(_exit) exitWith {};

_pos = [-1,-1,-1];
if(_sendLoc) then {_pos = position player;};
[[profileName, getPlayerUID player, (life_cellphone_receiver select 1), (life_cellphone_receiver select 2), _text, _pos], "life_fnc_mobileMessageReceived", _receiver] spawn life_fnc_MP;
closeDialog 0;
[] spawn life_fnc_mobileOpen;
hint "Message Sent!";