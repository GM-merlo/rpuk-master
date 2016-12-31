/*
	File: fn_breakLeg.sqf
	Author: Ciaran Langton

	Description:
	Handles the breaking leg...
*/
_broken = [_this,0,false,[false]] call BIS_fnc_param;

_exit = false;
if(_broken) then {
	if(life_medical_bonebreak) exitWith {_exit = true;};
	life_medical_bonebreak = true;
	titleText["You feel your leg break...","PLAIN DOWN"];
	player setVariable["legbroken",true,true];
	player playActionNow "PlayerProne"; 
} else {
	if(!(life_medical_bonebreak)) exitWith {_exit = true;};
	life_medical_bonebreak = false;
	player setVariable["legbroken",false,true];
	_exit = true;
};

[] call life_fnc_hudUpdate;
if(_exit) exitWith {};

if (_broken) then
{
	while {life_medical_bonebreak} do
	{
		sleep 2;
		if (stance player != "PRONE" && !(player getVariable ["restrained",false]) && !(player getVariable ["Escorting",false])) then { player playActionNow "PlayerProne"; };
	};
};