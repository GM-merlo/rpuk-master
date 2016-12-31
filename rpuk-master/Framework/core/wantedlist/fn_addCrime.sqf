/*
	File: fn_addCrime.sqf
	Desc: Adds the user for a crime
	Author: Ciaran Langton
*/
_type = [_this,0,[],[[]]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_uid = [_this,2,"",[""]] call BIS_fnc_param;
if(count _type < 0 || _name == "" || _uid == "" || getPlayerUID player != _uid) exitWith {}; //Pah

_crime = _type select 0;
_amount = _type select 1;

_currentCrimes = life_crimes select 0;
_currentCrimes pushBack _crime; //Add to the array
life_crimes set[0,_currentCrimes]; //Update array

_currentAmount = life_crimes select 1;
_currentAmount = _currentAmount + _amount;
life_crimes set[1,_currentAmount]; //Update wanted array

hint format["You are now wanted for %1, your current bounty is £%2",_crime,[_currentAmount] call life_fnc_numberText]; //Tell player.

player setVariable["life_crimes",life_crimes,true];
//[] call life_fnc_hudUpdate;
[7] call SOCK_fnc_updatePartial;
