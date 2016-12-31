/*
	File: fn_lockpick.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for lock-picking.
*/
private["_curTarget","_distance","_isVehicle","_title","_progressBar","_cP","_titleText","_dice","_badDistance"];
_curTarget = cursorTarget;
life_interrupted = false;
if(life_action_inUse) exitWith {};
if(isNull _curTarget) exitWith {}; //Bad type
if(_curTarget getVariable["scenery",false]) exitWith {};
_distance = ((boundingBox _curTarget select 1) select 0) + 2;
if(player distance _curTarget > _distance) exitWith {}; //Too far
_isVehicle = if((_curTarget isKindOf "LandVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(_isVehicle && _curTarget in life_vehicles) exitWith {hint localize "STR_ISTR_Lock_AlreadyHave"};
if(_curTarget getVariable["side",civilian] == independent) exitWith {hint "You cannot lockpick NHS vehicles!";};

//More error checks
if(!_isVehicle && !isPlayer _curTarget) exitWith {};
if(!_isVehicle && !(_curTarget getVariable["restrained",false])) exitWith {};

_title = format[localize "STR_ISTR_Lock_Process",if(!_isVehicle) then {"Handcuffs"} else {getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName")}];
life_action_inUse = true; //Lock out other actions

//Setup the progress bar
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

_addCp = 0.01; //Default delay.

_lightStatus = !(isLightOn _curTarget);
_beforeStatus = isLightOn _curTarget;

 for "_i" from 0 to 1 step 0 do
 {
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.560;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _addCp;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed OR life_isknockedout) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};
	if(player distance _curTarget > _distance) exitWith {_badDistance = true;};

	if(_isVehicle) then {
		_action = "lightOff";
		if(_lightStatus) then {_lightStatus = false; _action = "lightOn";} else {_lightStatus = true;};
		player action[_action,_curTarget];
		[[_curTarget,"lockpick",150],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	};
};

_action = "lightOff";
if(_beforeStatus) then {_action = "lightOn";};
player action[_action,_curTarget];

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed OR life_isknockedout) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(!isNil "_badDistance") exitWith {titleText[localize "STR_ISTR_Lock_TooFar","PLAIN"]; life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(!([false,"lockpick",1] call life_fnc_handleInv)) exitWith {life_action_inUse = false;};

life_action_inUse = false;

if(!_isVehicle) then {
	_curTarget setVariable["restrained",false,true];
	_curTarget setVariable["Escorting",false,true];
	_curTarget setVariable["transporting",false,true];
} else {
	_dice = random(100);
	//Random Chance not to appear on the wanted list.
	if(_dice < 30) then {
		titleText[localize "STR_ISTR_Lock_Success","PLAIN"];
		life_vehicles pushBack _curTarget;
	} else {
		[0,format[localize "STR_ISTR_Lock_FailedNOTF",profileName]] remoteExecCall ["life_fnc_broadcast",west];
		titleText[localize "STR_ISTR_Lock_Failed","PLAIN"];
	};
	//Alarm Bell
	_curTarget spawn {
		_beforeStatus = isLightOn _this;

		for "_i" from 0 to 20 do {
			[[_this,"lockpick",150],"life_fnc_playSound",true,false] spawn life_fnc_MP;
			sleep 0.565;
			_action = "lightOff";
			if(_i % 2 == 0) then {_action = "lightOn";};
			player action[_action,_this];
		};

		_action = "lightOff";
		if(_beforeStatus) then {_action = "lightOn";};
		player action[_action,_this];
	};
};
