/*
	File: fn_medicInteractionMenu.sqf
	
	Author: Ciaran Langton
	Date: 2014-12-12 21:44:46
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-02-20 19:41:27
*/
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {};
if(!(_curTarget isKindOf "Man") || {alive _curTarget}) exitWith {}; //Bad side check?

life_pInact_curTarget = _curTarget;

[
	"Medical Interaction",
	[
		["Revive Player","[life_pInact_curTarget] spawn life_fnc_revivePlayer; closeDialog 0;"],
		["Medipad","[life_pInact_curTarget] spawn life_fnc_openMedipad; closeDialog 0;"]
	]
] call life_fnc_interactionMenuOpen;