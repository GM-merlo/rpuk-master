/*
	File: fn_removeGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_group","_groupID"];
_group = [_this,0,grpNull,[grpNull]] call BIS_fnc_param;
if(isNull _group) exitWith {};

_groupID = _group getVariable["gang_id",-1];
if(_groupID == -1) exitWith {};

[format["deactivateGang:%1",_groupID],1] call DB_fnc_preparedCall;

[[_group],"life_fnc_gangDisbanded",(units _group),false] spawn life_fnc_MP;
sleep 5;
deleteGroup _group;