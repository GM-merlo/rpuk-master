/*
	File: fn_setNPCHousesDisallow.sqf
	Author: TinyBigJacko 11/Aug/2016

	Description:
	Iterates the master_group NPC group, locates any houses they are in, and sets them as "disallowbuy" so players can't buy them.
*/

private ["_building"];

diag_log "Marking NPC houses unbuyable...";
{
	_building = _x call life_fnc_getBuilding;
	if (!isNull _building) then {
		_building setVariable [ "disallowbuy", true ];
	};
} forEach units(missionNamespace getvariable "master_group");
diag_log "NPC house marking finished.";