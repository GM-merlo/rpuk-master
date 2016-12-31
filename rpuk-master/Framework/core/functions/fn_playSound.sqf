/*
	File: fn_playSound.sqf
	Author: Ciaran Langton
	
	Description:
	Plays a sound through the network.
*/

private["_source","_sound","_distance"];
_source = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_sound = [_this,1,"",[""]] call BIS_fnc_param;
_distance = [_this,2,0,[0]] call BIS_fnc_param;

if(_source distance player > _distance) exitWith {};
if(_sound in ["flashbangsound"]) exitWith {};
_source say3D _sound;