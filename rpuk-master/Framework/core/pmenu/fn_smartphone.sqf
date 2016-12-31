#include <macro.h>
/*

	file: fn_smartphone.sqf
	Author: Silex && Edits by Ciaran
	
*/
private["_display","_units","_type","_data","_rowData","_msg"];
_type = [_this,0,0] call BIS_fnc_param;
_data = [_this,1,0,["",[],0]] call BIS_fnc_param;
disableSerialization;
waitUntil {!isNull findDisplay 88888};
_display = findDisplay 88888;
_cPlayerList = _display displayCtrl 88881;
_cMessageList = _display displayCtrl 88882;
_cMessageHeader = _display displayCtrl 88886;
_cMessageHeader ctrlSetText format["From:                Message:"];
_cMessageBoxHeader = _display displayCtrl 88890;
_cMessageBox = _display displayCtrl 88887;
ctrlEnable[887892,false];
ctrlEnable[887893,false];
switch(_type) do
{
	case 0:
	{
		lbClear _cPlayerList;
		{
			if(alive _x) then
			{
				switch(side _x) do
				{
					case west: {_type = "Cop"};
					case civilian: {_type = "Civ"};
					case independent: {_type = "NHS"};
				};
				_cPlayerList lbAdd format["%1 (%2)",_x getVariable["realname", name _x],_type];
				_cPlayerList lbSetData [(lbSize _cPlayerList)-1,str(_x)];
			};
		} forEach playableUnits;
		lbSort _cPlayerList;
		
		[[getPlayerUID player, player],"CELL_fnc_msgRequest",false] spawn life_fnc_MP;
		ctrlEnable[887892,false];
	};
	case 1:
	{
		diag_log str(_data);
		{
			if(count _x == 0) exitWith {};
			_msg = [_x select 2,40] call KRON_StrLeft;
			_rowData = [_x select 0, _x select 1, _x select 2, _x select 3,_x select 5];
			_cMessageList lnbAddRow[_x select 3,format["%1 ...",_msg]];
			_cMessageList lnbSetData[[((lnbSize _cMessageList) select 0)-1,0],str(_rowData)];
		} forEach _data;
	};
	case 2:
	{
		ctrlEnable[887892,true];
		_target = lbData[88881,(lbCurSel 88881)];
		life_smartphoneTarget = call compile format["%1",_target];
	};
	
	case 4:
	{
		createDialog "Life_smartphone_schreiben";
		ctrlSetText[88886, format["Writing To: %1",name life_smartphoneTarget]];
		if((__GETC__(life_wilcorank) < 1)) then
		{
			ctrlShow[888897,false];
		};
	};

	case 5:
	{
		if(life_smartphoneID == -1) exitWith {};
		[[getPlayerUID player,life_smartphoneID],"CELL_fnc_deleteMsg"] spawn life_fnc_MP;
		life_smartphoneID = -1;
		lnbClear _cMessageList;
		[[getPlayerUID player, player],"CELL_fnc_msgRequest",false] spawn life_fnc_MP;
		_cMessageBoxHeader ctrlSetText "Select a Message...";
		_cMessageBox ctrlSetText "";
	};
};