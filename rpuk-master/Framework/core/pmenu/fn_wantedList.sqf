/*
	Copyright © 2013 Bryan "Tonic" Boardwine, All rights reserved
	See http://armafiles.info/life/list.txt for servers that are permitted to use this code.
	File: fn_wantedList.sqf
	Author: Bryan "Tonic" Boardwine"
	
	Description:
	Displays wanted list information sent from the server.
*/
private["_info","_display","_list","_units","_entry"];
disableSerialization;
//_info = [_this,0,[],[[]]] call BIS_fnc_param;
_info = [];
{
	if(side _x == civilian) then {
		//this causes an Error Zero Divisor when there are no crimes for a person and they are checked on the Wanted List - not yet fixed Ciaran - this is just a tag for you!!
		if((_x getVariable["life_crimes",[[],0]]) select 1 > 0) then { //Wanted cash is above 0, means they ARE wanted.
			_crimes = _x getVariable["life_crimes",[[],0]];
			_info pushBack [_x getVariable["realname",name _x],getPlayerUID _x,_crimes select 0,_crimes select 1]; //Replicate old wanted list callback.
		};
	};
} foreach playableUnits;


_display = findDisplay 2400;
_list = _display displayctrl 2401;
_units = [];
{
	_units pushBack (_x getVariable["realname",name _x]);
} foreach playableUnits;

{
	_entry = _x;
	if((_entry select 0) in _units) then
	{
		_list lbAdd format["%1", _entry select 0];
		_list lbSetData [(lbSize _list)-1,str(_entry)];
	};
} foreach _info;

lbSort _list; //NDJ 16May14 Sort the list alphabetically

ctrlSetText[2404,"Connection Established"];

if(((lbSize _list)-1) == -1) then
{
	_list lbAdd "No criminals";
};