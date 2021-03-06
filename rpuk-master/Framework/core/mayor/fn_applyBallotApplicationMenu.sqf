/* 
	File: fn_applyBallotApplicationMenu.sqf
	
	Author: Ciaran Langton
	Date: 2015-02-02 17:05:36
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-10 19:20:00
*/
disableSerialization;
_dialog = findDisplay 8400;
if(isNull _dialog) exitWith {};
_input = _dialog displayCtrl 1400;
_text = ctrlText _input;

if([_text] call KRON_StrLen < 10 || [_text] call KRON_StrLen > 1000) exitWith {hint "Your text is either less than 10 characters, or greater than 1000. Please reduce/add text to allow you to proceed.";};

_textToBeSent = _text;

_filter = "'/\`:|;{}-<>";
_text = toArray _text;
_filter = toArray _filter;
_trigger = false;
{
	if(_x in _filter) exitWith {
		_trigger = true;
	};
} foreach _text;

if(_trigger) exitWith {hint "Please remove any restricted characters inside your text. Restricted Characters: '/\`:|;{}-<>"};

if(!isNil 'life_mayor_entered') exitWith {hint "You have already applied for Mayor.";};
[[player,_textToBeSent],"MAYOR_fnc_submitBallotApplication",false,false] spawn life_fnc_MP;
hint "Application sent, please wait..";
life_mayor_entered = true;
closeDialog 0;