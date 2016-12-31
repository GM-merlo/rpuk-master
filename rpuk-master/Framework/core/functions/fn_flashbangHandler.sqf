/* 
	File: fn_flashbangHandler.sqf
	
	Author: Ciaran Langton + Tonic
	Date: 2015-03-26 16:13:57
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-03-26 18:08:55
*/
private["_pos","_eyeDir","_pPos","_impactPos","_norm","_angle","_blurEffect","_ppEffect"];
_grenade = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_flashPlayer = [_this,1,objNull,[objNull]] call BIS_fnc_param;
if(isNull _grenade || isNull _flashPlayer) exitWith {}; //Badddd
if(!isPlayer _flashPlayer) exitWith {};
if(typeOf _grenade != "GrenadeHand_stone" || !simulationEnabled _grenade) exitWith {}; //badd
if(_flashPlayer distance player > 50) exitWith {}; //Baddd
if(side _flashPlayer != west) exitWith {}; //Baddd
if(_flashPlayer == player && playerSide != west) exitWith {}; //If i threw, and I was not west then exit.

_pos = [];
_iterations = 0;
_exit = false;
while {!isNull _grenade} do {
	if(_iterations >= 250) exitWith {_exit = true;};
	_pos = ASLtoATL (visiblePositionASL _grenade);
	_iterations = _iterations + 1;
	sleep 0.1;
};
if(_exit) exitWith {}; //Baddddd
if(player distance _pos > 25) exitWith {}; //Badd

_pos set[2,(_pos select 2)+0.2];
if(lineIntersects [eyePos player, ATLtoASL _pos,player]) exitWith {};

_eyeDir = eyeDirection player;
_pPos = getPosATL player;
_impactPos = [(_pos select 0)-(_pPos select 0),(_pos select 1)-(_pPos select 1),(_pos select 2)-(_pPos select 2)];
_norm = sqrt((_impactPos select 0)^2+(_impactPos select 1)^2+(_impactPos select 2)^2);
_angle = aCos ((_eyeDir select 0)*((_impactPos select 0) / _norm)+((_impactPos select 1) / _norm)*(_eyeDir select 1)+((_impactPos select 2) / _norm)*(_eyeDir select 2));

playSound "flashbangsound";
_blurEffect = ppEffectCreate ["DynamicBlur",500];
_blurEffect ppEffectForceInNVG true;
_blurEffect ppEffectEnable true;

if(_angle < 90) then {
	//Create white-screen
	_ppEffect = ppEffectCreate ["ColorCorrections",2500];
	_ppEffect ppEffectAdjust [1, 1, -0.01, [1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 1]];
	_ppEffect ppEffectCommit 0.1;
	_ppEffect ppEffectEnable true;
	_ppEffect ppEffectForceInNVG true;
	_blurEffect ppEffectAdjust [3];
	_blurEffect ppEffectCommit 0.2;
	6 fadeSound 0.1;
	sleep 3; //3 
	
	_ppEffect ppEffectAdjust [1, 1, -0.02, [4.5, 3.5, 1.6, -0.02],[1.8, 1.6, 1.6, 1],[-1.5,0,-0.2,1]];
	_ppEffect ppEffectCommit 2;
	sleep 1; //4
	15 fadeSound 1;
	sleep 1; //5
	_ppEffect ppEffectEnable false;
	ppEffectDestroy _ppEffect;
	
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 3;
	sleep 1; //6 secs
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect;
} else {
	_blurEffect ppEffectAdjust [2.1];
	_blurEffect ppEffectCommit 0.1;
	4 fadeSound 0.25;
	sleep 3; //3
	_blurEffect ppEffectAdjust [0];
	_blurEffect ppEffectCommit 10;
	sleep 1; //4
	15 fadeSound 1;
	sleep 1; //5
	_blurEffect ppEffectEnable false;
	ppEffectDestroy _blurEffect;
};