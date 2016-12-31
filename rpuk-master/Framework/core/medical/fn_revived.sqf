/*
	File: fn_revived.sqf
	Author: Bryan "Tonic" Boardwine
	Modded massively TinyBigJacko 01/08/2016

	Description:
	THANK YOU JESUS I WAS SAVED!
*/
private["_medic","_dir"];
if(isDedicated) exitWith {};

player setVariable["Revive",true,true]; //prevent any further chance of revive while this is going on (unset at end) NDJ 010816

_medic = [_this,0,"Unknown Medic",[""]] call BIS_fnc_param;
_oldGear = [life_corpse] call life_fnc_fetchDeadGear;
[_oldGear] spawn life_fnc_loadDeadGear;
life_corpse setVariable["realname",nil,true]; //Should correct the double name sinking into the ground.

//Add the revived to the log
_text = format["Revived by %1",_medic];
[life_corpse,_text] call life_fnc_medilogSubmit;
player setVariable["medilog",(life_corpse getVariable["medilog",[]]),true];

[[life_corpse],"life_fnc_corpse",nil,FALSE] spawn life_fnc_MP;
_dir = getDir life_corpse;
hint format[localize "STR_Medic_RevivePay",_medic,0];

closeDialog 0;
life_deathCamera cameraEffect ["TERMINATE","BACK"];
camDestroy life_deathCamera;

//Take fee for services.
/*if(RPUK_doshinbank > (call life_revive_fee)) then {
	RPUK_doshinbank = RPUK_doshinbank - (call life_revive_fee);
} else {
	RPUK_doshinbank = 0;
};
*/

//Retexturing of units clothing, vanilla files only retexture the EMS unit.
[player, true] call life_fnc_HandleUniforms; //NDJ 21Jul14 choose uniform retexture and send it to everyone.  - 
{_x hideObjectGlobal false;} forEach life_containers; 

//Bring me back to life.
player setDir _dir;
player setPosASL (visiblePositionASL life_corpse);


life_corpse setVariable["Revive",nil,TRUE];
life_corpse setVariable["name",nil,TRUE];
[[life_corpse],"life_fnc_corpse",true,false] spawn life_fnc_MP;
hideBody life_corpse;
//player setVariable["Revive",nil,TRUE]; //removed and set much earlier, to stop double-revive possibility during worship phase
player setVariable["name",nil,TRUE];
player setVariable["Reviving",nil,TRUE];
player setVariable["medideadtime",nil,true];
player enableFatigue false;
life_corpse = nil;
if(life_nlrtimer_running) then {life_nlrtimer_stop = true};
if !(life_disableHUD) then
{
	[0] call life_fnc_hudSetup;
};
[] spawn SOCK_fnc_updateRequest;

//Now do the combat-revive incapacitated thing... NDJ 010816

if(dialog) then {closeDialog 0}; //shut any open dialogs so the titletexts can be seen

titleText["You're revived, but messed up - badly. Just wait and hope!","PLAIN"];
player playMove "Unconscious";

//_obj = createVehicle ["Land_ClutterCutter_small_F", getPosATL player, [], 0, "NONE"];  
//_obj setPosATL (getPosATL player);
//player attachTo [_obj,[0,0,0]];

_hndlGrain = ppEffectCreate ["filmGrain", 2050];
_hndlGrain ppEffectEnable true;
_hndlGrain ppEffectAdjust [1, 0.15, 7, 0.1, 0.1, true]; //intensity,sharpness,grainsize,intensityX0, intensity X1, monochromatic
_hndlGrain ppEffectCommit 10;
waitUntil {ppEffectCommitted _hndlGrain};
titleText["This isn't looking good, pal! You might want to say a prayer...","PLAIN"];
playSound "Worship";
uiSleep 10;

_hndlBlur = ppEffectCreate ["DynamicBlur",450];
_hndlBlur ppEffectEnable true;
_hndlBlur ppEffectAdjust [10];
_hndlBlur ppEffectCommit 10;
waitUntil {ppEffectCommitted _hndlBlur};
titleText["You're really, really lousy. You're definitely having a near-death experience.","PLAIN"];
uisleep 20;

titleText["Do you have any friends or family you want to say goodbye to?","PLAIN"];
uisleep 20;

titleText["Did you even remember to make a will? Bet you didn't. You were too busy living the hobo life, weren't you?","PLAIN"];
uisleep 20;
titleText["Oh well. Time to kiss your sweet ass goodbye, maybe. You've probably lost all your stuff by now anyway...","PLAIN"];
uiSleep 20;
titleText["But wait a second... What's this? It looks like you're gonna make it! Hang in there, buddy...","PLAIN"];
uiSleep 20;

player playMove "UnconsciousFaceDown";

_hndlBlur ppEffectAdjust [0];
_hndlBlur ppEffectCommit 5; //unwind the blur 
waitUntil {ppEffectCommitted _hndlBlur};
uiSleep 5;
titleText["You're coming round! Get ready to wake up!","PLAIN"];
player playMove "UnconsciousFaceOutProne";

_hndlGrain ppEffectAdjust [0.1, 1.5, 1.7, 0.2, 1.0, false];
_hndlGrain ppEffectCommit 5; //unwind the grain
waitUntil {ppEffectCommitted _hndlGrain};
uiSleep 5;

_hndlBlur ppEffectEnable false;
ppEffectDestroy _hndlBlur;
_hndlGrain ppEffectEnable false;
ppEffectDestroy _hndlGrain;

titleText["You made it! Get up, quick - but take it easy for a while.","PLAIN"];
player playMove "AmovPneMstpSnonWnonDnon"; //back to default prone

//detach player;
//deleteVehicle _obj;
player playMove "AmovPknlMstpSnonWnonDnon"; //kneel - normal

player setVariable["Revive",nil,true]; //flush this variable now, so if killed again, revive can happen.