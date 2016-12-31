/* 
	File: fn_selectBallotMenu.sqf
	
	Author: Ciaran Langton
	Date: 2015-01-28 20:52:14
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-10 19:20:14
*/
disableSerialization;
if(isNull (findDisplay 8500)) exitWith {};
_dialog = findDisplay 8500;
_listBox = _dialog displayCtrl 1500;
_structuredText = _dialog displayCtrl 1100;

_structuredText ctrlSetStructuredText parseText format["<t size='1.5'>%1</t><br/><br/>%2",_listBox lbText (lbCurSel _listBox),(_listBox lbData (lbCurSel _listBox))];
ctrlEnable[2400,true];