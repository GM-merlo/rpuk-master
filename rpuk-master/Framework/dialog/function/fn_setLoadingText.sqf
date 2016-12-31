disableSerialization;
/*
	File: fn_setLoadingText.sqf

	Author: Ciaran
	Date: 2015-12-30 22:16:32
	Last Modified by: Ciaran
	Last Modified time: 2015-12-30 22:16:51
*/
params [
	[ "_title", "", [ "" ] ],
	[ "_text", "", [ "" ] ]
];

//--- Fetch display, and get the text control
private _display = uiNamespace getVariable "Life_RscDisplayLoading";
private _ctrlText = _display displayCtrl 100;

//--- Set the text
_ctrlText ctrlSetStructuredText parseText format [

	"<t size='1.3' color='#5600FF'>%1</t><br/>%2.",
	_title,
	_text

];

true