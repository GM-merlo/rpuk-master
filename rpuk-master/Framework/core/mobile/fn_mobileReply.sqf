#include <ALUKMobile.h>
/* 
	File: fn_mobileReply.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-13 22:59:27
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 17:23:55
*/
disableSerialization;
_display = findDisplay IDD_ALUKMOBILE;
if(isNull _display) exitWith {};
_messageList = _display displayCtrl IDC_ALUKMOBILE_MESSAGELIST;
_id = lbCurSel _messageList;
if(_id < 0) exitWith {hint "Please select a message that you want to reply to."};
_messageIndex = _messageList lnbValue[(lbCurSel _messageList),0];
_receiver = life_cellphone_messages select _messageIndex;
if(!([_receiver select 1] call life_fnc_isUIDActive)) exitWith {hint "The player is no longer online!";};
_writingTo = _display displayCtrl IDC_ALUKMOBILE_WRITINGTOHEADER;
[true] call life_fnc_mobileSwitchDialog; //Change our dialog over.

//MSG TYPES  0: MSG 1: POLREQ 2: NHSREQ 3: ARAC 4: TAXI
life_cellphone_receiver = [_receiver select 0, 0, _receiver select 1, ""];
_writingTo ctrlSetText format["Writing to %1", _receiver select 0];