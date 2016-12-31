#include <ALUKMobile.h>
/* 
	File: fn_mobileMessageKeyUp.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-13 22:25:38
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-17 14:27:20
*/
disableSerialization;
_display = findDisplay IDD_ALUKMOBILE;
if(isNull _display) exitWith {};
_ctrl = _display displayCtrl 4001;
_charText = _display displayCtrl 4003;

if(count (ctrlText _ctrl) > 1500) exitWith {
	_charArr = toArray(ctrlText _ctrl);
	_charArr resize 1500;
	_ctrl ctrlSetText (toString _charArr);
}; 

_charText ctrlSetText format["%1/1500",count (ctrlText _ctrl)];