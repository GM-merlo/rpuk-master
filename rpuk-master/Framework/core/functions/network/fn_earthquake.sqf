/* 
	File: fn_earthquake.sqf
	Author: Ciaran Langton
	Description: Initiates an earthquake.
*/
_epicentre = [_this,0,[0,0,0],[[]]] call BIS_fnc_param;
if(isNull player) exitWith {};
_distance = player distance _epicentre;

_force = switch (true) do {
	case (_distance < 5000): {4};
	case (_distance < 7500): {3};
	case (_distance < 10000): {2};
	default {1};
};

hint "Seismic Activity is currently high on the Altis Island!";
sleep 5 + random 15;

[_force] spawn BIS_fnc_earthquake;
sleep 5 + random 7;
[_force] spawn BIS_fnc_earthquake;
sleep 7 + random 9;
[_force] spawn BIS_fnc_earthquake;
