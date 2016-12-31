/* 
	File: fn_deleteMsg.sqf
	Author: by Ciaran
	
	'Deletes' the message
*/
private["_query","_queryResult","_uid","_player"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_id = [_this,1,-1,[-1]] call BIS_fnc_param;

if(_id == -1 || _uid == "") exitWith {};

[format["deleteMsg:%1:%2",_uid,_id],1] call DB_fnc_preparedCall;