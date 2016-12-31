/* 
	File: fn_checkHouse.sqf
	
	Author: Ciaran Langton
	Date: 2015-04-04 22:40:15
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-04-05 00:53:59
*/
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_house = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isNull _unit || isNull _house) exitWith {};
_housePos = getPosATL _house;

if(!(_house isKindOf "House_F")) exitWith {_unit setVariable["life_housecheck",false,true];}; //Its not a house, say no...
if(_house getVariable["house_id",-1] != -1) exitWith {_unit setVariable["life_housecheck",false,true];}; //House Taken.

_result = [format["checkHouse:%1:%2",_housePos,worldName],2,false] call DB_fnc_preparedCall;

if(count _result == 0) exitWith {_unit setVariable["life_housecheck",false,true];}; //House query fail. For safety deny the call.
if(_result select 0 > 0) exitWith {_unit setVariable["life_housecheck",false,true];}; //House Taken.
_unit setVariable["life_housecheck",true,true]; //No errors found, tell the client they are good to go!