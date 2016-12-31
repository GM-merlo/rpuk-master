/*
	File: fn_civInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {}; //Bad target
if(!isPlayer _curTarget) exitWith {}; //Bad Target
life_pInact_curTarget = _curTarget;
_output = [];

//Set Unrestrain Button
_output pushBack [
	localize "STR_pInAct_Unrestrain",
	"[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;"
];

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_output pushBack [
		localize "STR_pInAct_StopEscort",
		"[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;"
	];
} else {
	_output pushBack [
		localize "STR_pInAct_Escort",
		"[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;"
	];
};

_output pushBack [
	localize "STR_pInAct_PutInCar",
	"[life_pInact_curTarget] call life_fnc_putInCar;"
];

_prisonDistance = (
	(player distance (getMarkerPos "cop_spawn_1") < 50) OR  
	(player distance (getMarkerPos "cop_spawn_2") < 50) OR 
	(player distance (getMarkerPos "cop_spawn_3") < 50) OR 
	(player distance (getMarkerPos "cop_spawn_4") < 50) OR 
	(player distance (getMarkerPos "jail_marker") < 150)
);

if(_prisonDistance && license_civ_bounty) then 
{
	_output pushBack [
		localize "STR_pInAct_Arrest",
		"[life_pInact_curTarget] call life_fnc_arrestAction;"
	];
};

["Hostage Menu",_output] call life_fnc_interactionMenuOpen;