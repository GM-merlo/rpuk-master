/* 
	File: fn_initWantedAdd.sqf
	Desc: Initiates the dialog for cops adding to the wanted list.
	Author: Ciaran Langton
	Date: Cant remember. Was about xx/06/2014
*/
private["_display","_list","_offencelist","_offences"];
disableSerialization;
waitUntil {!isNull (findDisplay 2900)};
_display = findDisplay 2900;
_list = _display displayCtrl 2902;
_offencelist = _display displayCtrl 2903;
//Purge Lists
lbClear _list;
lbClear _offencelist;

{
	if(side _x == civilian) then {
		_list lbAdd format["%1", _X getVariable["realname",name _x]];
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	};
} foreach playableUnits;

_offences = [
	//Vehicle Offences
	["Dangerous Driving","1"],
	["Resisting Arrest","2"],
	["Failing to Stop","3"],
	["Public Firearm Exposure","4"],
	["Terrorism","5"],
	["Improper use of Aviation","6"],
	["Attempted Murder","7"],
	["GBH","8"],
	["ABH","9"],
	["Public Order Act","10"],
	["Perverting course of Justice","11"],
	["Possession of an illegal firearm","12"],
	["Harbouring a fugitive","13"],
	["Escaping custody","14"],
	["Rioting","15"],
	["Harassment","16"],
	["Driving under the Influence","17"],
	["Conspiring to Murder","18"],
	["Kidnapping","19"],
	["Attempt to Kidnap","20"],
	["Attempt to Kidnap","20"],
	["Verbal Assault","21"],
	["Speeding - populated","22"],
	["Speeding - unpopulated","23"],
	["Vandalism","24"],
	["Driving without Headlights","25"],
	["Urinating in a Public Place","25"]


];

{
	_offencelist lbAdd format["%1",(_x select 0)];
	_offencelist lbSetData [(lbSize _offencelist)-1,(_x  select 1)];
} forEach _offences;