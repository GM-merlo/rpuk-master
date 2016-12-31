/*
	File: fn_insertRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something with inserting... Don't have time for
	descriptions... Need to write it...
*/
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_money = [_this,2,0,[0]] call BIS_fnc_param;
_bank = [_this,3,2500,[0]] call BIS_fnc_param;
_returnToSender = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param;

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

sleep (random 0.3);
_tickTime = diag_tickTime;
_queryResult = [format["playerInfo:%1",_uid],2,false,true] call DB_fnc_preparedCall;

//Double check to make sure the client isn't in the database...
if(typeName _queryResult == "STRING") exitWith {[[],"SOCK_fnc_dataQuery",_returnToSender,false] spawn life_fnc_MP;}; //There was an entry!
if(count _queryResult != 0) exitWith {[[],"SOCK_fnc_dataQuery",_returnToSender,false] spawn life_fnc_MP;};

//Clense and prepare some information.
_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars.
_alias = [[_name]] call DB_fnc_mresArray;
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

[format["Server inserting default data for %1",_uid],"CONSOLELOG"] call console;

[format["insertPlayer:%1:%2:%3:%4:%5",_uid,_name,_money,_bank,_alias],1,true] call DB_fnc_preparedCall;
[[],"SOCK_fnc_dataQuery",_returnToSender,false] spawn life_fnc_MP;
