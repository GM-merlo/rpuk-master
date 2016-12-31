#include <ALUKMobile.h>
/*
	File: fn_mobileMessageSelect.sqf

	Author: Ciaran Langton
	Date: 2015-05-17 14:26:49
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 18:10:33
*/
disableSerialization;
_dlg = findDisplay IDD_ALUKMOBILE;
if(isNull _dlg) exitWith {};
_messageList = _dlg displayCtrl IDC_ALUKMOBILE_MESSAGELIST;
_messageViewer = _dlg displayCtrl IDC_ALUKMOBILE_MESSAGEVIEWER;
if(lbCurSel _messageList < 0) exitWith {};
_messageIndex = _messageList lnbValue[(lbCurSel _messageList),0];
_messageData = life_cellphone_messages select _messageIndex;

_postion = "Sender Position: Withheld";
if(!((_messageData select 4) isEqualTo [-1,-1,-1])) then {
	_postion = format["Sender Position: %1", mapGridPosition (_messageData select 4)];
};

_text = _messageData select 3;

_text = [_text, "&", "&amp;"] call KRON_Replace;
_text = [_text, "<", ""] call KRON_Replace;
_text = [_text, ">", ""] call KRON_Replace;

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
if(_trigger) exitWith {};

_text = [_text, "\n", "<br/>"] call KRON_Replace;
_messageViewer ctrlSetStructuredText parseText format[
	"Sender: %1<br/>Date: %4/%5/%6<br/>%2<br/><br/>%3",
	_messageData select 0,
	_postion,
	_text,
	(_messageData select 6) select 2,
	(_messageData select 6) select 1,
	(_messageData select 6) select 0
];

(life_cellphone_messages select _messageIndex) set [5, true];
[] call life_fnc_mobileMessageShow;
