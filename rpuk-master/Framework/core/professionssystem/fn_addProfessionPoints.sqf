/*
	File: fn_addProfessionPoints.sqf
	Author: Ciaran Langton
	Part of the Profession System by Ciaran

	Desc:
	Adds points to the profession once they complete it. ----ALTISLIFE.CO.UK ONLY----
*/
_profession = [_this,0,"",[""]] call BIS_fnc_param;
_points = [_this,1,-1,[0]] call BIS_fnc_param;
if(_profession == "" || _points == -1) exitWith {};
//Compile the variable name.
_id = format["profession_%1",_profession];
_current = missionNamespace getVariable[_id,-1];
if(_current == -1) exitWith {};
//Make the more levels, the harder to level up.
_levels = [_profession] call life_fnc_getProfessionlevel;
_levels = _levels / 1.5;
//if it was diving by one level, then set it to one as we want them to get the full amount on first level.
if(_levels < 1) then {_levels = 1};
//Now divide the points by the levels, and then floor it down.
_points = floor(_points / _levels);
//Now set the points onto the addition.
_current = missionNamespace getVariable[_id,-1];
_current = _current + _points;

[
	"ALUK Professions",
	format["Leveled up %1 by <t color='#2E2EFE'>%2 XP!</t>",[_id] call life_fnc_varToStr,_points]
] call life_fnc_showNotification;

//Save the variable and send to the database!
missionNamespace setVariable[_id,_current];
[9] call SOCK_fnc_updatePartial;