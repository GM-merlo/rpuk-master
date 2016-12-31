#include <ALUKMobile.h>
/*
	File: fn_mobileMessageShow.sqf

	Author: Ciaran Langton
	Date: 2015-05-17 13:54:20
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 17:27:47
*/
disableSerialization;
_dlg = findDisplay IDD_ALUKMOBILE;
_messageList = _dlg displayCtrl IDC_ALUKMOBILE_MESSAGELIST;
lnbClear _messageList;

for "_i" from count life_cellphone_messages -1 to 0 step -1 do {
	_item = life_cellphone_messages select _i;
	_excerpt = [_item select 3,23] call KRON_StrLeft;
	if(_excerpt != _item select 3) then {_excerpt = _excerpt + "...";};

  //Remove \n from preview.
  _excerpt = [_excerpt, "\n", ""] call KRON_Replace;

	_msgType = switch (_item select 2) do
	{
		case 0: {"Text Message"};
		case 1: {"Police Dispatch"};
		case 2: {"NHS Dispatch"};
		case 3: {"ARAC Dispatch"};
		case 4: {"Taxi Dispatch"};
		case 5: {"Admin Message"};
		case 6: {"BA Request"};
	};

	_messageList lnbAddRow [_item select 0, _msgType, _excerpt, if(_item select 5) then {"Viewed"} else {"New"}];
	//_messageList lnbSetData[[((lnbSize _messageList) select 0)-1,0],str(_item)];
	_messageList lnbSetValue[[((lnbSize _messageList) select 0)-1,0],_i];
};
