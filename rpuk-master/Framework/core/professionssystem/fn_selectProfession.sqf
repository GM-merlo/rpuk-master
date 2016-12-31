/*
	File: fn_selectProfession.sqf
	Author: Ciaran Langton
	Part of the Profession System by Ciaran
	
	Desc:
	Handles the GUI when they make a selection. ----ALTISLIFE.CO.UK ONLY----
*/
_dialog = findDisplay 1000;
_list = _dialog displayCtrl 1500;
_level = _dialog displayCtrl 1103;
_curPoints = _dialog displayCtrl 1105;
_nextPoints = _dialog displayCtrl 1107;
_neededPoints = _dialog displayCtrl 1109;
_sel = _list lbData (lbCurSel _list);

if(isNil '_sel') exitWith {};

_level ctrlSetStructuredText parseText format[
	"<t align='center' size='10'>%1</t>",
	[([_sel] call life_fnc_getProfessionLevel)] call life_fnc_numberText
];
_curPoints ctrlSetStructuredText parseText format[
	"<t align='center' size='3'>%1</t>",
	[([_sel] call life_fnc_getProfessionXp)] call life_fnc_numberText
];
_nextPoints ctrlSetStructuredText parseText format[
	"<t align='center' size='3'>%1</t>",
	[([_sel] call life_fnc_getProfessionNextLevel) * 100] call life_fnc_numberText
];
_neededPoints ctrlSetStructuredText parseText format[
	"<t align='center' size='3'>%1</t>",
	[(([_sel] call life_fnc_getProfessionNextLevel) * 100) - ([_sel] call life_fnc_getProfessionXp)] call life_fnc_numberText
];