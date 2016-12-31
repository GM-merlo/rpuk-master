#include <ALUKMobile.h>
/*
	File: fn_mobileStartMessage.sqf

	Author: Ciaran Langton
	Date: 2015-05-13 22:59:27
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 14:27:44
*/
disableSerialization;
_display = findDisplay IDD_ALUKMOBILE;
if(isNull _display) exitWith {};
_playerList = _display displayCtrl IDC_ALUKMOBILE_PLAYERLIST;
_id = lbCurSel _playerList;
if(_id < 0) exitWith {hint "Please select a player/service."};
_receiver = _playerList lbData (lbCurSel _playerList);
_receiver = call compile _receiver;
_writingTo = _display displayCtrl IDC_ALUKMOBILE_WRITINGTOHEADER;
[true] call life_fnc_mobileSwitchDialog; //Change our dialog over.

//MSG TYPES  0: MSG 1: POLREQ 2: NHSREQ 3: ARAC 4: TAXI

_receiverName = switch (_receiver select 1) do
{
	case 0: {_receiver select 0;};
	case 1: {"Police Dispatch Centre"};
	case 2: {"NHS Dispatch Centre"};
	case 3: {"ARAC Dispatch Centre"};
	case 4: {"Altis Taxis Dispatch"};
	case 5: {"Admin Message - Emergencies Only!"};
};

life_cellphone_receiver = _receiver;
_writingTo ctrlSetText format["Writing to %1", _receiverName];
