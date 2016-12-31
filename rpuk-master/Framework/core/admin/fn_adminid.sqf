/*
	File: fn_adminid.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Output information received to admin menu.
*/
private["_display","_ret","_text"];
disableSerialization;
_ret = _this select 0;
_display = findDisplay 2900;
_text = _display displayCtrl 2903;
_text2 = _display displayCtrl 2904;
_text2 ctrlSetText format["%1",_ret];
_text ctrlSetStructuredText parseText format["ID: %1",_ret];