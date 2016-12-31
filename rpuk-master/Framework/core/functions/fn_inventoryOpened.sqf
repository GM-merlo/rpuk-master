/*
	File: fn_inventoryOpened.sqf
	
	Author: Bryan "Tonic" Boardwine

	Description:
	For the mean time it blocks the player from opening another persons backpack
*/
private["_container","_unit"];
if(count _this == 1) exitWith {false};
_unit = _this select 0;
_container = _this select 1;

_isPack = getNumber(configFile >> "CfgVehicles" >> (typeOf _container) >> "isBackpack");
if(_isPack == 1) then {
	[] spawn {
		waitUntil {!(findDisplay 602 isEqualTo displayNull)};
		closeDialog 0;
	};
	[[player, "bagopen",20],"life_fnc_playSound",true,false] spawn life_fnc_MP;
	hint localize "STR_MISC_Backpack";
};

//STOP HOUSING CONTAINERS BEING ACCESSED IF LOCK VARIABLE IS TRUE
if((typeOf _container) in ["Box_IND_Grenades_F","B_supplyCrate_F"]) exitWith {
	_house = ( (getPosATL player) call life_fnc_getBuilding );
	if(!(_house in life_vehicles) && {(_house getVariable ["housestoragelocked",false])}) then {
		[] spawn {
			waitUntil {!(findDisplay 602 isEqualTo displayNull)};
			closeDialog 0;
		};
		hint localize "STR_House_ContainerDeny";
	};
};

if(_container isKindOf "LandVehicle" OR _container isKindOf "Ship" OR _container isKindOf "Air") exitWith {
	if(!(_container in life_vehicles) && {(locked _container) == 2}) exitWith {
		[[_container, "car_unlock",20],"life_fnc_playSound",true,false] spawn life_fnc_MP;
		[] spawn {
			waitUntil {!(findDisplay 602 isEqualTo displayNull)};
			closeDialog 0;
		};
		hint localize "STR_MISC_VehInventory";
	};
};

//Allow alive players who've been knocked out to be looted, just not the dead ones
if(_container isKindOf "Man" && !alive _container) exitWith {
	[] spawn {
		waitUntil {!(findDisplay 602 isEqualTo displayNull)};
		closeDialog 0;
	};
	hint localize "STR_NOTF_NoLootingPerson";
};