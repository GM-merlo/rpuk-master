/*
	File: fn_addHouse.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blah
*/
private["_house","_uid","_housePos","_query"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_house = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house OR _uid == "") exitWith {};

_housePos = getPosATL _house;
_query = format["insertHouse:%1:%2:%3",_uid,_housePos,worldName];
_id = [_query,2] call DB_fnc_preparedCall;
_house setVariable["house_id",_id,true];