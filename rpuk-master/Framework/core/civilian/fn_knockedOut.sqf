/*
	File: fn_knockedOut.sqf
	Author: Bryan "Tonic" Boardwine
	Modified: NDJ (TinyBigJacko) for PCSO knockdown, visual effects and random length 24Apr14
	
	Description:
	Starts and monitors the knocked out state.
*/
private["_target","_who","_obj","_copknock","_hndlBlur","_hndlGrain"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_who = [_this,1,"",[""]] call BIS_fnc_param;
_copknock = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _target) exitWith {};
if(_target != player) exitWith {};
if(_who == "") exitWith {};
if(player getVariable ["Revive",false]) exitWith {};
if(life_istazed) exitWith {};

life_isknockedout = true;
titleText[format[localize "STR_Civ_KnockedOut",_who],"PLAIN"];
player switchMove "AcinPercMstpSnonWnonDnon_agony";
sleep 3.5;
player playMoveNow "incapacitated";

//_obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL player); //NDJ 20May14 deprecated createVehicle mode - use createVehicle array
_obj = createVehicle ["Land_ClutterCutter_small_F", getPosATL player, [], 0, "NONE"];  
_obj setPosATL (getPosATL player);
player attachTo [_obj,[0,0,0]];
//NDJ 24Apr14 - 7-second 30-strength blur with 9 sec mono film grain
_hndlBlur = ppEffectCreate ["DynamicBlur",450];
_hndlBlur ppEffectEnable true;
_hndlBlur ppEffectAdjust [30];
_hndlBlur ppEffectCommit 7;
uiSleep 7;
_hndlGrain = ppEffectCreate ["filmGrain",450];
_hndlGrain ppEffectEnable true;
_hndlGrain ppEffectAdjust [1, 10, 4, 0, 0, true];
_hndlGrain ppEffectCommit 9;
uiSleep 9;
_hndlBlur ppEffectAdjust [0];
_hndlBlur ppEffectCommit 3;
uiSleep 3;
_hndlGrain ppEffectAdjust [0, 10, 4, 0, 0, true];
_hndlGrain ppEffectCommit 3;
uiSleep 3;
ppEffectDestroy _hndlBlur;
ppEffectDestroy _hndlGrain;
player playMoveNow "amovppnemstpsraswrfldnon";
detach player;
deleteVehicle _obj;
if(!(_copknock)) then {
	player setVariable["robbed",FALSE,TRUE];
};
life_isknockedout = false;
