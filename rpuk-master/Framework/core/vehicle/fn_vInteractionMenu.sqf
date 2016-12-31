#include <macro.h>
/*
	File: fn_vInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various vehicle actions
*/
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
_isVehicle = if((_curTarget isKindOf "Cargo_base_F") OR (_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {};

if(_curTarget getVariable["scenery",false]) exitWith {};
if(typeName (_curTarget getVariable["Trunk",-1]) == typeName -1) exitWith {};

life_vInact_curTarget = _curTarget;
_output = [];

if((("ToolKit" in (ItemCargo _curTarget)) || {"ToolKit" in (items player)}) && (damage _curTarget < 1) && !(_curTarget isKindOf "Cargo_base_F")) then {
	_output pushBack[localize "STR_vInAct_Repair","[life_vInact_curTarget] spawn life_fnc_repairTruck;"];
};

if(playerSide == west) then {
	_output pushBack[localize "STR_vInAct_Registration","[life_vInact_curTarget] spawn life_fnc_searchVehAction;"];
	_output pushBack[localize "STR_vInAct_SearchVehicle","[life_vInact_curTarget] spawn life_fnc_vehInvSearch;"];

	if(count crew _curTarget != 0 || !(_curTarget isKindOf "Cargo_base_F")) then {
		_output pushBack[localize "STR_vInAct_PullOut","[life_vInact_curTarget] spawn life_fnc_pulloutAction;"];
	};

	_output pushBack[localize "STR_vInAct_Impound","[life_vInact_curTarget] spawn life_fnc_impoundAction;"];
	
	if(_curTarget isKindOf "Ship") then {
		if(local _curTarget && {count crew _curTarget == 0}) then {
			_output pushBack[localize "STR_vInAct_PushBoat","[] spawn life_fnc_pushObject; closeDialog 0;"];
		};
	} else {
		if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
			if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {
				_output pushBack[localize "STR_vInAct_GetInKart","player moveInDriver life_vInact_curTarget; closeDialog 0;"];
			};
		} else {
			if(!((count crew _curTarget == 0 && {canMove _curTarget}) || (_curTarget isKindOf "Cargo_base_F"))) then {
				_output pushBack[localize "STR_vInAct_Unflip","life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;"];
			};
		};
	};
	
	if((__GETC__(life_plodrank) > 3 OR __GETC__(life_wilcorank) > 0) && !(_curTarget isKindOf "Cargo_base_F")) then
	{
		_output pushBack[localize "STR_vInAct_Crush","[life_vInact_curTarget] spawn life_fnc_CrushAction;"];
	};	
	
} else {
	
	if(_curTarget isKindOf "Ship") then {
		if(local _curTarget && {count crew _curTarget == 0}) then {
			_output pushBack[localize "STR_vInAct_PushBoat","[] spawn life_fnc_pushObject; closeDialog 0;"];
		};
	} else {
		if(_curTarget isKindOf "Ship") then {
			if(local _curTarget && {count crew _curTarget == 0}) then {
				_output pushBack[localize "STR_vInAct_PushBoat","[] spawn life_fnc_pushObject; closeDialog 0;"];
			};
		} else {
			if(typeOf (_curTarget) in ["C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F"]) then {
				if(count crew _curTarget == 0 && {canMove _curTarget} && {locked _curTarget == 0}) then {
					_output pushBack[localize "STR_vInAct_GetInKart","player moveInDriver life_vInact_curTarget; closeDialog 0;"];
				};
			} else {
				if(!((count crew _curTarget == 0 && {canMove _curTarget}) || (_curTarget isKindOf "Cargo_base_F"))) then {
					_output pushBack[localize "STR_vInAct_Unflip","life_vInact_curTarget setPos [getPos life_vInact_curTarget select 0, getPos life_vInact_curTarget select 1, (getPos life_vInact_curTarget select 2)+0.5]; closeDialog 0;"];
				};
			};
		};
	};

	if(!(count crew _curTarget == 0 || (_curTarget isKindOf "Cargo_base_F") || !((_curTarget in life_vehicles) || call life_fnc_isRebel) )) then {
		_output pushBack[localize "STR_vInAct_PullOut","[life_vInact_curTarget] spawn life_fnc_pulloutAction;"];
	};

	if(typeOf _curTarget == "O_Truck_03_device_F") then {
		if(!(!isNil {(_curTarget getVariable "mining")} OR !local _curTarget && {_curTarget in life_vehicles})) then {
			_output pushBack[localize "STR_vInAct_DeviceMine","[life_vInact_curTarget] spawn life_fnc_deviceMine"];
		};
	};
	
	if(__GETC__(life_wilcorank) > 0 || (playerSide == independent && _curTarget in life_vehicles)) then
	{
		_output pushBack[localize "STR_vInAct_Impound","[life_vInact_curTarget] spawn life_fnc_impoundAction;"];
	};

	if(__GETC__(life_wilcorank) > 0 && !(_curTarget isKindOf "Cargo_base_F")) then
	{
		_output pushBack[localize "STR_vInAct_Crush","[life_vInact_curTarget] spawn life_fnc_CrushAction;"];
	};
};

["Vehicle Interaction",_output] call life_fnc_interactionMenuOpen;