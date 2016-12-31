/*
	File: fn_msgRequest.sqf
	Author: Silex && Edits by Ciaran
	
	Fills the Messagelist
*/
private["_query","_queryResult","_uid","_player"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_player = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _player || _uid == "") exitWith {};

_queryResult = [format["msgRequest:%1",_uid],2,true] call DB_fnc_preparedCall;
if(count _queryResult == 0) exitWith {};
[[1,_queryResult],"life_fnc_smartphone",_player,false] spawn life_fnc_MP;