/* 
	File: fn_codebreaker.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-23 21:09:56
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-06-01 19:43:12
*/
#define TEXT_SIZE (((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 40)

params [
	["_bank",objNull,[objNull]]
];

if(!(_bank getVariable ["isBank", false])) exitWith {hint "You are not looking at a bank."};
if({side _x == west} count playableUnits < 10) exitWith {hint "There are not enough cops online for you to rob this! (10 Minimum)"};

_doors = 1;
while {true} do {
	if(!isClass(configFile >> "CfgVehicles" >> (typeOf _bank) >> "AnimationSources" >> format["Door_%1_source",_doors])) exitWith {};
	_doors = _doors + 1;
};

_door = 0;
_worldSpace = [];
for "_i" from 1 to _doors do {
	_selPos = _bank selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _bank modelToWorld _selPos;
	if(player distance _worldSpace < 2) exitWith {_door = _i;};
};

if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"};
if((_bank getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
if(_door in (_bank getVariable["bankBlocked",[]])) exitWith {hint "This door appears to be sealed off.";};
_bankName = _bank getVariable["bankName", ""];
if(_bankName == "") exitWith {};
[[1,2],format["The bank alarm has just been set off at the %1", _bankName]] remoteExec ["life_fnc_broadcast",west];

_times = 15 + ceil (random 5);

disableSerialization;
9 cutRsc ["ALUK_codebreaker","PLAIN"];
_ui = uiNamespace getVariable "ALUK_codebreaker";
_codeCtrl = _ui displayCtrl 65656;
life_action_inUse = true;
for "_i" from 0 to _times -1 do {
	_codeCtrl ctrlSetText "";
	_text = "";
	for "_b" from 0 to 3 do {
		_text = format["%1%2",_text,round(random 9)];
		_codeCtrl ctrlSetStructuredText parseText format["<t size='%2'>%1</t>",_text,TEXT_SIZE];
		if(isServer) then {sleep .05;} else {sleep .50;};
		if(life_istazed OR life_isknockedout) exitWith {};
		if(!alive player) exitWith {};
		if(player distance _worldSpace > 5) exitWith {};
		if((player getVariable["restrained",false])) exitWith {};
	};

	if(life_istazed OR life_isknockedout) exitWith {};
	if(!alive player) exitWith {};
	if(player distance _worldSpace > 5) exitWith {};
	if((player getVariable["restrained",false])) exitWith {};

	playSound "codebeep";
	if((_times - 1) == _i) then {
		_codeCtrl ctrlSetStructuredText parseText format["<t size='%2' color='#00FF00'>%1</t>",_text,TEXT_SIZE];
		sleep 0.5;
		playSound "codebeep";
		sleep 0.5;
	} else {
		_codeCtrl ctrlSetStructuredText parseText format["<t size='%2' color='#FF0000'>%1</t>",_text,TEXT_SIZE];
		if(isServer) then {sleep .05;} else {sleep 1;};
	};
};

9 cutText ["","PLAIN"];
if(!alive player OR life_istazed OR life_isknockedout) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(player distance _worldSpace > 5) exitWith {life_action_inUse = false;};
life_action_inUse = false;
_bank setVariable[format["bis_disabled_Door_%1",_door],0,true];
_bank animate [format["Door_%1_rot",_door], 1];
hint "Code Crack Complete - Door Unlocked";