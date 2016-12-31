/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Handles the incoming request and sends an asynchronous query
	request to the database.

	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

_wholeQueryTime = diag_tickTime;
if(isNull _ownerID) exitWith {};
[format["%1 (%2) is getting their data from the RPUK Hive.",name _ownerID, _uid],"CONSOLELOG"] call console;

_query = switch(_side) do {
	case west: {_returnCount = 18; format["queryWest:%1",_uid];};
	case civilian: {_returnCount = 13; format["queryCiv:%1",_uid];};
	case independent: {_returnCount = 11; format["queryNHS:%1",_uid];};
};

_tickTime = diag_tickTime;
_queryResult = [_query,2,false,true] call DB_fnc_preparedCall;

if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

if(count _queryResult == 0) exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

_aliasesId = switch (_side) do {case west: {16}; case independent: {11}; case civilian: {14};};
_aliases = [(_queryResult select _aliasesId)] call DB_fnc_mresToArray;
if(typeName _aliases == "STRING") then {_aliases = call compile format["%1",_aliases];};
_name = _ownerID getVariable["realname", name _ownerID];
if(!(_name in _aliases)) then {
	[format["New Alias For %1 detected, updating records...",_name],"CONSOLELOG"] call console;
	_aliases pushBack _name;
	_count = count _aliases;
	_aliases = [_aliases] call DB_fnc_mresArray; //tomres
	[format["updateAliases:%1:%2", _aliases, _uid], 1] spawn DB_fnc_preparedCall;
	[format["Alias For %1 updated in records... Total Aliases: %2",_name, _count],"CONSOLELOG"] call console;
};


_dbID = -1;
//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];

//Parse data for specific side.
switch (_side) do {
	case west: {
		_queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];

		_professions = [(_queryResult select 10)] call DB_fnc_mresToArray;
		if(typeName _professions == "STRING") then {_professions = call compile format["%1", _professions];};
		for "_i" from 0 to count(_professions)-1 do {
			_arr = _professions select _i;
			_num = _arr select 1;
			_num = parseNumber(_num);
			_arr set[1,_num];
			_professions set[_i,_arr];
		};
		_queryResult set[10,_professions];

		_dbID = _queryResult select 15;
	};

	case independent: {
		_professions = [(_queryResult select 9)] call DB_fnc_mresToArray;
		if(typeName _professions == "STRING") then {_professions = call compile format["%1", _professions];};
		for "_i" from 0 to count(_professions)-1 do {
			_arr = _professions select _i;
			_num = _arr select 1;
			_num = parseNumber(_num);
			_arr set[1,_num];
			_professions set[_i,_arr];
		};
		_queryResult set[9,_professions];
		_dbID = _queryResult select 11;
	};

	case civilian: {
		_wanted = [(_queryResult select 10)] call DB_fnc_mresToArray;
		if(typeName _wanted == "STRING") then {_wanted = call compile format["%1", _wanted];};
		_queryResult set[10,_wanted];

		_professions = [(_queryResult select 11)] call DB_fnc_mresToArray;
		if(typeName _professions == "STRING") then {_professions = call compile format["%1", _professions];};
		for "_i" from 0 to count(_professions)-1 do {
			_arr = _professions select _i;
			_num = _arr select 1;
			_num = parseNumber(_num);
			_arr set[1,_num];
			_professions set[_i,_arr];
		};
		_queryResult set[11,_professions];

		_dbID = _queryResult select 13;

		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		_houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone _houseData};
		_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]);
		missionNamespace setVariable[format["houses_%1",_uid],nil];
		_gangData = _uid spawn TON_fnc_queryPlayerGang;
		waitUntil {scriptDone _gangData};
		_queryResult pushBack (missionNamespace getVariable[format["gang_%1",_uid],[]]);
		missionNamespace setVariable[format["gang_%1",_uid],nil];
	};
};

[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] spawn life_fnc_MP;

[format["%1 (PID:%2) has received their data. Time: %3",name _ownerID, _uid, (diag_tickTime - _wholeQueryTime)],"CONSOLELOG"] call console;
