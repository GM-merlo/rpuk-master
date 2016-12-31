#include <ALUKMobile.h>
/*
	File: fn_mobilePlayerFilter.sqf

	Author: Ciaran Langton
	Date: 2015-05-13 18:22:43
	Last Modified by: Ciaran
	Last Modified time: 2015-12-31 20:06:41
*/
disableSerialization;
_dlg = findDisplay IDD_ALUKMOBILE;
if(isNull _dlg) exitWith {};
if(count life_cellphone_contacts < 1) exitWith {};
_playerList = _dlg displayCtrl IDC_ALUKMOBILE_PLAYERLIST;
_filter = ctrlText (_dlg displayCtrl IDC_ALUKMOBILE_PLAYERFILTER);
waitUntil {sleep random(.1); !life_cellphone_filterWorking};
if(_filter != ctrlText (_dlg displayCtrl IDC_ALUKMOBILE_PLAYERFILTER)) exitWith {life_cellphone_filterWorking = false;};

life_cellphone_filterWorking = true;
_queue = [];
{
	if(_filter != ctrlText (_dlg displayCtrl IDC_ALUKMOBILE_PLAYERFILTER)) exitWith {life_cellphone_filterWorking = false;};
	if(_filter == "" || {_filter == "Enter Filter..."} || { ( ( toLower ( _x select 0 ) ) find ( toLower _filter ) ) > -1 }) then {
		_queue pushBack _x;
	};
} forEach life_cellphone_contacts;

lbClear _playerList;
{
	_playerList lbAdd (_x select 0);
	_playerList lbSetData [(lbSize _playerList -1), (str _x)];
	_playerList lbSetValue [(lbSize _playerList -1),(_X select 1)];
	_playerList lbSetPicture [(lbSize _playerList -1),(_X select 3)];
} forEach _queue;
lbSort _playerList;
life_cellphone_filterWorking = false;