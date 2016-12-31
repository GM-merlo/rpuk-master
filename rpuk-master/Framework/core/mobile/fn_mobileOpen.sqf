#include <ALUKMobile.h>
/*
	File: fn_mobileOpen.sqf

	Author: Ciaran Langton
	Date: 2015-05-13 18:22:26
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 20:46:08
*/
disableSerialization;
if(!createDialog "ALUKMobile") exitWith {};
_dlg = findDisplay IDD_ALUKMOBILE;
_playerList = _dlg displayCtrl IDC_ALUKMOBILE_PLAYERLIST;
_messageList = _dlg displayCtrl IDC_ALUKMOBILE_MESSAGELIST;

life_cellphone_receiver = [];

//MSG TYPES  0: MSG 1: POLREQ 2: NHSREQ 3: ARAC 4: TAXI 5:Admin Request

//Format: ["Title", MSGTYPE, PID (def ""), img]
_data = [
	[format["%1Police Request",toString [1]], 1, "", "\A3\ui_f\data\gui\Rsc\RscDisplayMultiplayerSetup\disabledai_ca.paa"],
	//[format["%1NHS Request",toString [2]], 2, "", "icons\mobile\nhs.paa"],
	[format["%1ARAC Repair",toString [3]], 3, "", "icons\mobile\arac.paa"],
	[format["%1Taxi Request",toString [4]], 4, "", "icons\mobile\taxi.paa"],
	[format["%1Admin Request",toString [6]], 5, "", "icons\mobile\admin.paa"]
];

/*for "_i" from 0 to 120 do {
	_name = "";
	for "_i" from 0 to 10 + round random(10) -1 do {
		_name = _name + toString[65 + round random(25)];
	};

	_data pushBack [_name, 0, 5, "icons\mobile\arac.paa"];
};*/

{
	_name = _x getVariable["realname",name _x];
	if(!alive _x) then {_name = _x getVariable["name", name _x];};

	_icon = format["icons\mobile\%1_icon.paa",
		switch (side group _x) do {
			case west: {"police"};
			case independent: {"medic"};
			default {"civilian"};
		}
	];

	if(getPlayerUID _x != "") then {
		_data pushBack [_name, 0, getPlayerUID _x, _icon];
	};

} forEach playableUnits;

life_cellphone_contacts = _data;
[false] spawn life_fnc_mobileSwitchDialog;
[] spawn life_fnc_mobilePlayerFilter;
[] spawn life_fnc_mobileMessageShow;
