#include <ALUKMobile.h>
/* 
	File: fn_mobileSwitchDialog.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-13 21:31:56
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 14:27:48
*/
disableSerialization;
_isMsg = [_this,0,false,[false]] call BIS_fnc_param;

_display = findDisplay IDD_ALUKMOBILE;
if(isNull _display) exitWith {};

_myMessages = [1002, 1501, 1003, 1004];
_sendMessage = [4000,4001,4002,4003,4004,4005,4006,4007,4008];

_replyMsg = _display displayCtrl IDC_ALUKMOBILE_REPLYTOMSG;
_cancelMsg = _display displayCtrl IDC_ALUKMOBILE_CANCELMESSAGE;
if(_isMsg) then 
{
	_replyMsg ctrlSetText "Send Message";
	_replyMsg buttonSetAction "[] call life_fnc_mobileSendMessage;";
	_cancelMsg buttonSetAction "[] call life_fnc_mobileSendMessageCancel;";
}
	else
{
	_replyMsg ctrlSetText "Reply";
	_replyMsg buttonSetAction "[] call life_fnc_mobileReply;";
};
_replyMsg ctrlShow true;

{
	_ctrl = _display displayCtrl _x;
	_ctrl ctrlShow (!_isMsg);
} forEach _myMessages;

{
	_ctrl = _display displayCtrl _x;
	_ctrl ctrlShow (_isMsg);
} forEach _sendMessage;