/* 
	File: fn_bankLoot.sqf
	
	Author: Ciaran Langton
	Date: 2015-05-24 01:17:07
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-06-01 19:45:13
*/
_lootable = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if(playerSide != civilian) exitWith {};
if(isNull _lootable) exitWith {};
if(!(_lootable getVariable ["bankItem", false])) exitWith {};

_return = switch (typeOf _lootable) do 
{
	case "Land_Money_F": {"markedmoney"};
	case "Land_WoodenBox_F": {"weaponbag"};
	default {""};
};

if(_return == "") exitWith {};

//--- Weapon bag validation
if( _return == "weaponbag" && ( count ( lineIntersectsWith [ eyePos player, visiblePosition _lootable, player, _lootable ] ) != 0 ) ) exitWith { 
	hint "Sneaky sneaky... Please ensure there is nothing in the way to loot this. (Especially a building)"; 
};

//--- Ensure at least two doors are open on the building
_bank = nearestBuilding player;
_doors = getNumber(configFile >> "CfgVehicles" >> (typeof _bank) >> "NumberOfDoors");
_doorsOpen = 0;
for "_i" from 1 to _doors do {
	if(_bank getVariable[format["bis_disabled_Door_%1",_i],1] == 0) then {
		_doorsOpen = _doorsOpen + 1;
	};
};

if(_doorsOpen < 2) exitWith {
	hint "At least two doors need to be open on the building to proceed.";
};

life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = "Bagging item...";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		[[player,"AinvPknlMstpSnonWnonDnon_medic_1",true],"life_fnc_animSync",true,false] call life_fnc_MP;
		player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.5;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed OR life_isknockedout) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
	if(isNull _lootable) exitWith {};
};

sleep (random .5);
//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed OR life_isknockedout) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
if(isNull _lootable) exitWith {hint "Someone else took the item instead!";};
if([true,_return,1] call life_fnc_handleInv) then {
	hint "Bagged item.";
	deleteVehicle _lootable;
} else {
	hint "The bagging failed as you do not have enough space.";
};
life_action_inUse = false;