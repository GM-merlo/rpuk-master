/*
	File: fn_insertGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Inserts the gang into the database.
*/
private["_query","_queryResult","_gangMembers","_group"];

params [
	["_ownerID",objNull,[objNull]],
	["_uid","",[""]],
	["_gangName","",[""]]
];

_group = group _ownerID;

if(isNull _ownerID OR _uid == "" OR _gangName == "") exitWith {}; //Fail

_ownerID = owner _ownerID;
_gangName = [_gangName] call DB_fnc_mresString;
_queryResult = [format["gangNameSelectID:""%1"":1",_gangName],2] call DB_fnc_preparedCall;

//Check to see if the gang name already exists.
if(count _queryResult != 0) exitWith {
	[1,"There is already a gang created with that name please pick another name."] remoteExecCall ["life_fnc_broadcast",_ownerID];
	[["life_action_gangInUse",nil,missionNamespace],"life_fnc_netSetVar",_ownerID,false] spawn life_fnc_MP;
};

_queryResult = [format["getPlayerGangId:%2%1%2",_uid,"%"],2] call DB_fnc_preparedCall;

//Check to see if this person already owns or belongs to a gang.
if(count _queryResult != 0) exitWith {
	[1,"You are currently already active in a gang, please leave the gang first."] remoteExecCall ["life_fnc_broadcast",_ownerID];
	[["life_action_gangInUse",nil,missionNamespace],"life_fnc_netSetVar",_ownerID,false] spawn life_fnc_MP;
};

//Check to see if a gang with that name already exists but is inactive.
_queryResult = [format["gangNameSelectID:""%1"":0",_gangName],2] call DB_fnc_preparedCall;
_gangMembers = [[_uid]] call DB_fnc_mresArray;

_gangId = -1;
if(count _queryResult != 0) then {
	_query = format["activateGangId:1:%1:%2:%3",_uid,_gangMembers,(_queryResult select 0)];
	[_query,1] call DB_fnc_preparedCall;
	_gangId = (_queryResult select 0);
} else {
	_query = format["insertGang:%1:""%2"":%3",_uid,_gangName,_gangMembers];
	_queryResult = [_query,2] call DB_fnc_preparedCall;
	if(_queryResult isEqualType []) exitWith {}; //Hmm... insert failed.
	_gangId = _queryResult;
};

_group setVariable["gang_name",_gangName,true];
_group setVariable["gang_owner",_uid,true];
_group setVariable["gang_bank",0,true];
_group setVariable["gang_maxMembers",8,true];
_group setVariable["gang_members",[_uid],true];
[[_group],"life_fnc_gangCreated",_ownerID,false] spawn life_fnc_MP;
_group setVariable["gang_id",_gangId,true];