/*
	File: fn_jailBreakoutCompleted.sqf
	Author: Ciaran Langton
	Date: 19/10/2014
	Desc: Breaks the client out of jail.
*/
if(isDedicated) exitWith {};
if(!life_is_arrested) exitWith {}; //We dont need to be broken out, as we are not in jail!

_action = [
	format["%1 has broken into the jail from the outside, escape now?",_this select 0],
	"Breakout",
	localize "STR_Global_Yes",
	localize "STR_Global_No"
] call BIS_fnc_guiMessage;

if(_action) then {
	hint "You decided to run for it!";
	life_escape = true;
} else {
	hint "You decided to serve your time.";
	life_escape = false;
};