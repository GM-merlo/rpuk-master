/*
	File: fn_unrestrain.sqf
*/
params [
	["_unit",objNull,[objNull]]
];

if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

if(!(_unit getVariable ["civrestrained",false]) && playerSide == civilian) exitWith {hint "This person is not ziptied! He is handcuffed.";};

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
_unit setVariable["civrestrained",FALSE,TRUE];
detach _unit;

[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",west];