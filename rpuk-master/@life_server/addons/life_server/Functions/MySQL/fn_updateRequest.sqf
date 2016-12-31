/*
	File: fn_updateRequest.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Ain't got time to describe it, READ THE FILE NAME!
*/
private["_uid","_side","_cash","_bank","_licenses","_gear","_name","_query","_thread"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[civilian]] call BIS_fnc_param;
_cash = [_this,3,0,[0]] call BIS_fnc_param;
_bank = [_this,4,5000,[0]] call BIS_fnc_param;
_licenses = [_this,5,[],[[]]] call BIS_fnc_param;
_gear = [_this,6,[],[[]]] call BIS_fnc_param;
_professions = [_this,7,[],[[]]] call BIS_fnc_param;

//Get to those error checks.
if((_uid == "") OR (_name == "")) exitWith {};
if(_name == "Error: No vehicle" || _name == "Error: No unit") exitWith {};
//Parse and setup some data.
_name = [_name] call DB_fnc_mresString;
_gear = [_gear] call DB_fnc_mresArray;
_cash = [_cash] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Does something license related but I can't remember I only know it's important?
for "_i" from 0 to count(_licenses)-1 do {
	_bool = [(_licenses select _i) select 1] call DB_fnc_bool;
	_licenses set[_i,[(_licenses select _i) select 0,_bool]];
};

for "_i" from 0 to count(_professions)-1 do {
	_arr = _professions select _i;
	_num = _arr select 1;
	_num = [_num] call DB_fnc_numberSafe;
	_arr set[1,_num];
	_professions set[_i,_arr];
};

_licenses = [_licenses] call DB_fnc_mresArray;

_professions = [_professions] call DB_fnc_mresArray;

switch (_side) do {
	case west: {
    	_xp = [_this,8,-1,[-1]] call BIS_fnc_param;
		_query = format[
			"updateWest:%1:%2:%3:%4:%5:%6:%7:%8:%9",
			_name, //1
			_cash, //2
			_bank, //3
			_gear, //4
			_licenses, //5
			_uid, //6
			_professions, //7
			_xp, //8
			_uid //9
		];
	};
	case civilian: {
		_wanted = [_this,9,[[],0],[[]]] call BIS_fnc_param;
		_gangRank = [_this,10,-1,[-1]] call BIS_fnc_param;
    _xp = [_this,11,-1,[-1]] call BIS_fnc_param;
		_query = format[
			"updateCiv:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12",
			_name, //1
			_cash, //2
			_bank, //3
			_licenses, //4
			_gear, //5
			[_this select 8] call DB_fnc_bool, //6
			[_wanted] call DB_fnc_mresArray, //7
			_uid, //8
			_professions, //9
			[_gangRank] call DB_fnc_numberSafe, //10
      _xp, //11
			_uid //12
		];
	};
	case independent: {
		_query = format[
			"updateNHS:%1:%2:%3:%4:%5:%6:%7:%8",
			_name, //1
			_cash, //2
			_bank, //3
			_licenses, //4
			_gear, //5
			_uid, //6
			_professions, //7
			_uid //8
		];
	};
};

_queryResult = [_query,1] call DB_fnc_preparedCall;
