/*
	File: fn_copInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {}; //Bad side check?
if(player distance _curTarget > 5) exitWith {};
life_pInact_curTarget = _curTarget;
_output = [];

_output pushBack[localize "STR_pInAct_Unrestrain","[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;"];
_output pushBack[localize "STR_pInAct_checkLicenses","[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn life_fnc_MP"];
_output pushBack[localize "STR_pInAct_SearchPlayer","[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;"];

if((_curTarget getVariable["Escorting",false])) then {
	_output pushBack[
		localize "STR_pInAct_StopEscort",
		"[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;"
	];
} else {
	_output pushBack[
		localize "STR_pInAct_Escort",
		"[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;"
	];
};

_output pushBack[
	localize "STR_pInAct_TicketBtn",
	"[life_pInact_curTarget] call life_fnc_ticketAction;"
];

_output pushBack[
	localize "STR_pInAct_PutInCar",
	"[life_pInact_curTarget] call life_fnc_putInCar;"
];

_output pushBack[
	"Take Weapons",
	"[life_pInact_curTarget] spawn life_fnc_seizeWeapons;"
];

_prisonDistance = (
	(player distance (getMarkerPos "cop_spawn_1") < 50) OR  
	(player distance (getMarkerPos "cop_spawn_2") < 50) OR 
	(player distance (getMarkerPos "cop_spawn_3") < 50) OR 
	(player distance (getMarkerPos "cop_spawn_4") < 50) OR 
	(player distance (getMarkerPos "jail_marker") < 150)
);

if(_prisonDistance) then 
{
	_output pushBack[
		localize "STR_pInAct_Arrest",
		"[life_pInact_curTarget] call life_fnc_arrestAction;"
	];
};

["Criminal Interaction",_output] call life_fnc_interactionMenuOpen;