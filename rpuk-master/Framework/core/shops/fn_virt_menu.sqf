/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "medic" && playerSide != independent) exitWith {hint localize "STR_NOTF_NotACop"};


if(_shop == "chem" && playerSide != civilian) exitWith {hint "You are not a civilian!"};
/*if(_shop == "chem" && {side _x == west} count playableUnits < 5) exitWith {
	hint "The WilcoChem factory store is only open when 5 cops are on duty! This is to prevent drug abuse!";
};*/
createDialog "shops_menu";

[] call life_fnc_virt_update;