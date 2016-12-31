/*
	File: fn_updateGang.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Updates the gang information?
*/
private["_mode","_group","_groupID","_bank","_maxMembers","_members","_query","_owner"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_group = [_this,1,grpNull,[grpNull]] call BIS_fnc_param;

if(isNull _group) exitWith {}; //FAIL

_groupID = _group getVariable["gang_id",-1];
if(_groupID == -1) exitWith {};

switch (_mode) do {
	case 0: {
		_bank = [(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe;
		_maxMembers = _group getVariable ["gang_maxMembers",8];
		_members = [(_group getVariable "gang_members")] call DB_fnc_mresArray;
		_owner = _group getVariable ["gang_owner",""];
		if(_owner == "") exitWith {};
		//updateGangInfo
		_query = format["updateGangInfo:%1:%2:%3:%4",_bank,_maxMembers,_owner,_groupID];
	};
	
	case 1: {
		_query = format["updateGangBank:%1:%2",([(_group getVariable ["gang_bank",0])] call DB_fnc_numberSafe),_groupID];
	};
	
	case 2: {
		_query = format["updateGangMaxMembers:%1:%2",(_group getVariable ["gang_maxMembers",8]),_groupID];
	};
	
	case 3: {
		_owner = _group getVariable["gang_owner",""];
		if(_owner == "") exitWith {};
		_query = format["updateGangOwner:%1:%2",_owner,_groupID];
	};
	
	case 4: {
		_members = _group getVariable ["gang_members",[]];
		if(count _members > (_group getVariable ["gang_maxMembers",8])) then {
			_membersFinal = [];
			for "_i" from 0 to _maxMembers -1 do {
				_membersFinal pushBack (_members select _i);
			};
		};
		_membersFinal = [(_group getVariable ["gang_members",[]])] call DB_fnc_mresArray;
		_query = format["updateGangMembers:%1:%2",_membersFinal,_groupID];
		//CIARAN - OFFLOAD THIS
		_member = [_this,2,objNull,[objNull]] call BIS_fnc_param;
		[[_member,_group],"TON_fnc_clientGangKick",_member,false] spawn life_fnc_MP; //Boot that bitch!
	};
};

if(!isNil "_query") then {[_query,1] call DB_fnc_preparedCall;};