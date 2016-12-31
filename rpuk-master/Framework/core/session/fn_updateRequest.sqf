/*
	File: fn_updateRequest.sqf
	Author: Tonic, Ciaran
*/
private _packet = [getPlayerUID player,(profileName),playerSide,RPUK_dosh,RPUK_doshinbank];
if(isNull player) exitWith {};
if(getPlayerUID player == "") exitWith {};
if(!(life_session_completed)) exitWith {};
if (RPUK_AGear < 4) exitWith{}; //Tronny don't save...

private _array = [];
private _flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"};};
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_licenses;
_packet pushBack _array;

[] call life_fnc_saveGear;
_packet pushBack life_gear;

_array = [];
{
	if(_x select 1 == _flag) then
	{
		_array pushBack [_x select 0,(missionNamespace getVariable (_x select 0))];
	};
} foreach life_professions;
_packet pushBack _array;

switch (playerSide) do {
	case civilian: {
		_packet pushBack life_is_arrested;
		_packet pushBack life_crimes; //Set the crimes onto the array.
		_packet pushBack life_my_gang_rank; //Set the gang rank onto the array.
    _packet pushBack life_xp; //will become input element #11 for civ

		private _cUnf = player getVariable["customUniform",["", -1]];
		if(_cUnf select 1 != -1 && _cUnf select 0 != "") then {
			profileNamespace setVariable["8743391951",_cUnf];
		} else {
			profileNamespace setVariable["8743391951",nil];
		};
		saveProfileNamespace;
	};
	case west: {
    _packet pushBack life_xp; //will become input element #8 for cop
	};
};

[_packet,"DB_fnc_updateRequest",(call life_fnc_findTransactionMethod),false] spawn life_fnc_MP;
