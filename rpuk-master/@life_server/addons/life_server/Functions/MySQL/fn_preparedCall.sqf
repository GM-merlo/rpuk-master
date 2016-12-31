/*
	File: fn_preparedCall.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Commits an asynchronous call to extDB
	Gets result via extDB  4:x + uses 5:x if message is Multi-Part
	Parameters:
		0: STRING (Query to be ran).
		1: INTEGER (1 = ASYNC + not return for update/insert, 2 = ASYNC + return for query's).
		3: BOOL (False to return a single array, True to return multiple entries mainly for garage).
*/

waitUntil {uiSleep (random .25); !DB_Async_Active};
private["_queryStmt","_queryResult","_key","_mode","_return","_loop"];

_tickTime = diag_tickTime;

_queryStmt = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,1,[0]] call BIS_fnc_param;
_multiarr = [_this,2,false,[false]] call BIS_fnc_param;

DB_Async_Active = true;

_key = "extDB2" callExtension format["%1:%2:%3",_mode, (call life_sql_id), _queryStmt];

if(_mode isEqualTo 1) exitWith {DB_Async_Active = false; true};

_key = call compile format["%1",_key];
_key = _key select 1;

waitUntil{uisleep (random .25); !DB_Async_ExtraLock};
DB_Async_ExtraLock = true;

// Get Result via 4:x (single message return)  v19 and later
_fetchTime = diag_tickTime;

_queryResult = "";
_loop = true;
while{_loop} do
{
	_queryResult = "extDB2" callExtension format["4:%1", _key];
	if (_queryResult isEqualTo "[5]") then {
		// extDB2 returned that result is Multi-Part Message
		_queryResult = "";
		while{true} do {
			_pipe = "extDB2" callExtension format["5:%1", _key];
			if(_pipe isEqualTo "") exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
	}
	else
	{
		if (_queryResult isEqualTo "[3]") then
		{
			diag_log format ["extDB2: uisleep [4]: %1", diag_tickTime];
			uisleep 0.25;
		} else {
			_loop = false;
		};
	};
};

diag_log format ["extDB2: QUERY: %1 ALLTIME: %3 GETTIME: %4 RESULT: %2", _queryStmt,_queryResult,diag_tickTime - _tickTime,diag_tickTime - _fetchTime];

DB_Async_ExtraLock = false;
DB_Async_Active = false;

_queryResult = call compile _queryResult;

// Not needed, its SQF Code incase extDB ever returns error message i.e Database Died
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["extDB2: Protocol Error: %1", _queryResult]; []};

//Multiarray request, but the array was empty... Instead of returning [[]] (Causes an error in scripts that loop)
//Return [], therefore the forEaches in all the scripts such as the garage will not run. Backwards Compatible.
/*if(
	_multiarr &&
	{typeName ((_queryResult select 1) select 0) == "ARRAY"} &&
	{count ((_queryResult select 1) select 0) == 0}
) exitWith {[]};*/

_return = (_queryResult select 1);

if(!_multiarr && count _return > 0) then {
	_return = _return select 0;
};

_return;
