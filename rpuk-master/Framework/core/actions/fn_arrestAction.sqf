/*
* @File:   fn_arrestAction.sqf
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*/
params [
  ["_unit", objNull, [objNull]]
];

//Target validation
if (playerSide != west) exitWith {};
if (isNull _unit || !(_unit isKindOf "Man") || !isPlayer _unit || !alive _unit) exitWith {hint "Target no longer valid."};
if (!(_unit getVariable ["restrained", false])) exitWith {hint "This person is not in handcuffs."};
if (_unit getVariable ["civrestrained",false]) exitWith {
  hint "This person is not restrained, but ziptied. Please unziptie him then restrain him.";
};

//Send player to jail and chat broadcast.
detach _unit;
[[_unit,false],"life_fnc_jail",_unit,false] spawn life_fnc_MP;
[0,format[localize "STR_NOTF_Arrested_1", _unit getVariable["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",-2];
