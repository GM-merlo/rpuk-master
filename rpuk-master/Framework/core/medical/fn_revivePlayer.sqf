/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the revive process on the targeted player.
*/
private["_target","_revivable","_targetName","_ui","_progressBar","_titleText","_cP","_title"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _target) exitWith {}; //DAFUQ?@!%$!R?EFFD?TGSF?HBS?DHBFNFD?YHDGN?D?FJH

_revivable = _target getVariable["Revive",FALSE];
if(_revivable) exitWith {hint "You can't revive this guy - he's too far gone!"};
if(_target getVariable ["Reviving",ObjNull] == player) exitWith {hint localize "STR_Medic_AlreadyReviving";};
if(player distance _target > 5) exitWith {}; //Not close enough.

if ((isNil "life_inv_defib") || (life_inv_defib isEqualTo 0)) exitWith {hint "You do not have a defib in your inventory.";};

//Fetch their name so we can shout it.
_targetName = _target getVariable["name","Unknown"];
_title = format[localize "STR_Medic_Progress",_targetName];
life_action_inUse = true; //Lockout the controls.

_target setVariable["Reviving",player,TRUE];
//Setup our progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable ["life_progress",displayNull];
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	_previous = animationState player;
	if(animationState player == _previous) then {
		player playMoveNow "AinvPknlMstpSnonWnonDr_medic0";
	};

	sleep 0.10;
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed OR life_isknockedout) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _target > 4) exitWith {_badDistance = true;};
	if(_target getVariable["Revive",FALSE]) exitWith {};
	if(_target getVariable["Reviving",ObjNull] != player) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(_target getVariable ["Reviving",ObjNull] != player) exitWith {hint localize "STR_Medic_AlreadyReviving"; life_action_inUse = false;};
_target setVariable["Reviving",NIL,TRUE];
if(!alive player OR life_istazed OR life_isknockedout) exitWith {life_action_inUse = false;};
if(_target getVariable["Revive",FALSE]) exitWith {hint localize "STR_Medic_RevivedRespawned"; life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_Medic_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};

if !([false, "defib", 1] call life_fnc_handleInv) exitWith {hint "Your defib has been taken away while reviving!"; life_action_inUse = false;};

RPUK_doshinbank = RPUK_doshinbank + 1500;
if (worldName == "Tanoa") then {[10] call life_fnc_addXP;};
life_action_inUse = false;
_target setVariable["Revive",TRUE,TRUE];
[[profileName],"life_fnc_revived",_target,FALSE] spawn life_fnc_MP;
if (worldName == "Altis") then { ["reviving",20] call life_fnc_addProfessionPoints; };
sleep 0.6;
player reveal _target;
