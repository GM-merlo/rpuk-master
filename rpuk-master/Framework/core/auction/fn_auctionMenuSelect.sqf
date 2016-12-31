/* 
	File: fn_auctionMenuSelect.sqf
	
	Author: Ciaran Langton
	Date: 2015-03-01 15:47:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-15 16:51:21
*/
disableSerialization;
_display = findDisplay 13750;
if(isNull _display) exitWith {};
_list = _display displayCtrl 1500;
_data = _list lbData (lbCurSel _list);
_data = call compile format["%1",_data];

_text = _display displayCtrl 1600;
_title = _display displayCtrl 1100;
_vehicleInfo = [(_data select 1)] call life_fnc_fetchVehInfo;

_title ctrlSetStructuredText parseText format[
	"<t size='1.1'><img image='%1' size='1.5'/> Selling: %2<br/>Minimum Bid: £%3 Current Bid: £%4</t>",
	_vehicleInfo select 2, 
	_vehicleInfo select 3,
	[_data select 7] call life_fnc_numberText,
	[_data select 10] call life_fnc_numberText
];

_message = _data select 8;
_message = [_message, "¬", ","] call KRON_Replace;
_message = [_message, "~", """"] call KRON_Replace;

_text ctrlSetStructuredText parseText _message;
if(_data select 2 == getPlayerUID player) then {ctrlEnable[2400,false];} else {ctrlEnable[2400,true];};
ctrlSetText[1400,_data select 7];

ctrlShow[1008,true];
ctrlShow[1400,true];
ctrlShow[2400,true];