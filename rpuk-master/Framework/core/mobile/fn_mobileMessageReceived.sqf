/* 
	File: fn_mobileMessageReceived.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-14 16:25:49
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 14:27:23
*/
disableSerialization;
_senderName = [_this,0,"",[""]] call BIS_fnc_param;
_senderPID = [_this,1,"",[""]] call BIS_fnc_param;
_cellphoneMode = [_this,2,-1,[-1]] call BIS_fnc_param;
_receiverPID = [_this,3,"-",[""]] call BIS_fnc_param;
_message = [_this,4,"",[""]] call BIS_fnc_param;
_pos = [_this,5,[[],[],[]], [[]]] call BIS_fnc_param;

if(_senderName == "" || _senderPID == "") exitWith {};
if(_cellphoneMode == -1 || _cellphoneMode == -1) exitWith {};
if(_message == "" || !(_receiverPID == "" || getPlayerUID player == _receiverPID)) exitWith {};
_hasPos = true;
if(_pos isEqualTo [-1,-1,-1]) then {_hasPos = false;};

if(isNil 'license_civ_arac' || {isNil 'license_civ_taxi'} || {isNil 'life_wilcorank'} || {isNil 'life_balevel'}) exitWith {};

_exit = false;
switch (true) do
{
	case (_cellphoneMode == 1 && playerSide != west): {_exit = true;};
	case (_cellphoneMode == 2 && playerSide != independent): {_exit = true;};
	case (_cellphoneMode == 3 && {!(license_civ_arac)}): {_exit = true;};
	case (_cellphoneMode == 4 && {!(license_civ_taxi)}): {_exit = true;};
	case (_cellphoneMode == 5 && {(call life_wilcorank) < 1}): {_exit = true;};
	case (_cellphoneMode == 6 && {(call life_balevel) < 1}): {_exit = true};
};


_msgData = switch (_cellphoneMode) do {
	case 0: {["Text Message", "icons\mobile\textmsg.paa", format["Text From: %1", _senderName]]};
	case 1: {["Police Dispatch","\A3\ui_f\data\gui\Rsc\RscDisplayMultiplayerSetup\disabledai_ca.paa","Police Dispatch Received"]};
	case 2: {["NHS Dispatch","icons\mobile\nhs.paa","NHS Dispatch Received"]};
	case 3: {["ARAC Repair","icons\mobile\arac.paa","ARAC Request Received"]};
	case 4: {["Taxi Service","icons\mobile\taxi.paa","Taxi Request Received"]};
	case 5: {["Admin Request","icons\mobile\admin.paa","Admin Request Received"]};
	case 6: {["BA Request","icons\mobile\ba.paa","BA Request Received"]};

	default {_exit = true;};
};

if(_exit) exitWith {};

["Message",_msgData] call bis_fnc_showNotification;
//                                Sender Name  Sender PID  CELLPHONE MODE  MSG TEXT  PPOS  HASREAD
life_cellphone_messages pushBack [_senderName, _senderPID, _cellphoneMode, _message, _pos, false, date];
