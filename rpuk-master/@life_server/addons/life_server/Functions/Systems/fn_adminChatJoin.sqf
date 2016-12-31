/*
	File: fn_adminChatJoin.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	User management of whether or not they want to be on a sidechat for their side.
*/
private["_unit","_bool","_side"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {};

life_radio_admin radioChannelAdd [_unit]; //Add the admin.

