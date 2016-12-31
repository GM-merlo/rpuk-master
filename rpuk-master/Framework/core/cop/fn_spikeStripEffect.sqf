/*
	File: fn_spikeStripEffect.sqf
	Author: Bryan "Tonic" Boardwine && Refactored by Ciaran to work with new changes.
	
	Description:
	Doesn't work without the server-side effect but shifted part of it clientside
	so code can easily be changed. Ultimately it just pops the tires.
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vehicle) exitWith {}; //Bad vehicle type
if(!(_vehicle isKindOf "Car")) exitWith {}; //Bad vehicle type.
_hitPts = ["HitLFWheel","HitLF2Wheel","HitRFWheel"];

_noneDamaged = true;

{
	if(_vehicle getHitPointDamage _x < 1) then {_noneDamaged = false;};
} forEach _hitPts;

if(_noneDamaged) exitWith {}; //If the wheels are all damaged then do not bother!

[[_vehicle, "spike",20],"life_fnc_playSound",true,false] spawn life_fnc_MP;

{
	_vehicle setHitPointDamage[_x,1];
} forEach _hitPts;