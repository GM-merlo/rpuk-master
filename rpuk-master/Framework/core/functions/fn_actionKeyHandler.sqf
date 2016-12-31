#include <macro.h>
/*
	File: fn_actionKeyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master action key handler, handles requests for picking up various items and
	interacting with other players (Cops = Cop Menu for unrestrain,escort,stop escort, arrest (if near cop hq), etc).
*/
private["_curTarget","_isWater"];
disableSerialization;
_curTarget = cursorTarget;
if(life_action_inUse) exitWith {}; //Action is in use, exit to prevent spamming.
if(life_interrupted) exitWith {life_interrupted = false;};
if(dialog) exitWith {}; //Don't bother when a dialog is open.
if(player getVariable["Revive",FALSE]) exitWith {}; //no soup for you, if you're in mid revive-worship mode! NDJ 01/08/16
life_action_inUse = true;


_isWater = surfaceIsWater (getPosASL player);

if(vehicle player != player) exitWith {

	//--- Driver check
	if (driver (vehicle player) == player && side player == civilian) then {

		//--- Locate nearest modshop
		private [ "_dist" ];
		_dist = 999999999;
		{

			private [ "_locDist" ];
			_locDist = (vehicle player) distance (markerPos _x);

			if (_locDist < _dist) then {

				_dist = _locDist;

			};

		} forEach ["modshop_1","modshop_2"];

		//--- Maximum Distance
		if (_dist < 15) then {

			[] spawn life_fnc_modShopInit;

		};

	};

}; //He's in a vehicle, check for modshop

if(isNull _curTarget) exitWith {
	/*if(_isWater) then {
		private["_fish"];
		_fish = (nearestObjects[getPos player,["Fish_Base_F"],3]) select 0;
		if(!isNil "_fish") then {
			[_fish] call life_fnc_catchFish;
		};
	} else {*/
	if(playerSide == civilian) then {
		_handle = [] spawn life_fnc_gather;
		waitUntil {scriptDone _handle};
	};
 	//};
};

if((_curTarget isKindOf "House_F" && {player distance _curTarget < 12}) OR (_curTarget getVariable ["isBank", false])) exitWith {
	[_curTarget] call life_fnc_houseMenu;
};


//Temp fail safe. Two minute timer, release life_action_inUse if set
[] spawn {
	sleep 120;
	life_action_inUse = false;
};

//Check if it's a dead body.
if(_curTarget isKindOf "Man" && {!alive _curTarget} && {player distance _curTarget < 4}) exitWith {
  [_curTarget] call life_fnc_medicInteractionMenu;
};


//If target is a player then check if we can use the cop menu.
if(isPlayer _curTarget && _curTarget isKindOf "Man" && {player distance _curTarget < 4}) then {
	if((_curTarget getVariable["restrained",false]) && !dialog && playerSide == west) then {
		[_curTarget] call life_fnc_copInteractionMenu;
	};
	if((_curTarget getVariable["civrestrained",false]) && !dialog && playerSide == civilian) then {
		[_curTarget] call life_fnc_civInteractionMenu;
	};
	if(playerSide == civilian && !(_curTarget getVariable["civrestrained",false]) && (_curTarget getVariable["restrained",false])) then
	{
		hint "This person appears to be handcuffed by a cop, maybe I could lockpick him out?";
	};
} else {
	//OK, it wasn't a player so what is it?
	private["_isVehicle","_miscItems","_money"];
	_isVehicle = if((_curTarget isKindOf "Cargo_base_F") OR (_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (_curTarget isKindOf "Air")) then {true} else {false};
	_miscItems = ["Land_BottlePlastic_V1_F","Land_TacticalBacon_F","Land_Can_V3_F","Land_CanisterFuel_F","Land_Suitcase_F"];
	_animalTypes = [
		"Salema_F","Ornate_random_F","Mackerel_F","Tuna_F","Mullet_F","CatShark_F","Turtle_F","Rabbit_F",
		"Cock_random_F", "Hen_random_F", "Goat_random_F", "Sheep_random_F"
	];
	_money = "Land_Money_F";

	//It's a vehicle! open the vehicle interaction key!
	if(_isVehicle && !(typeOf _curTarget == "RoadCone_L_F") && {player distance _curTarget < 4}) then {
		if(!dialog) then {
			if(player distance _curTarget < ((boundingBox _curTarget select 1) select 0) + 2) then {
				[_curTarget] call life_fnc_vInteractionMenu;
			};
		};
	} else {
		//Is it a animal type?
		if((typeOf _curTarget) in _animalTypes) then {
			if((typeOf _curTarget) == "Turtle_F" && !alive _curTarget) then {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_catchTurtle;
				waitUntil {scriptDone _handle};
			} else {
				if(_curTarget isKindOf "Fish_Base_F") then {
					private["_handle"];
					_handle = [_curTarget] spawn life_fnc_catchFish;
					waitUntil {scriptDone _handle};
				} else {
					private["_handle"];
					_handle = [_curTarget] spawn life_fnc_skinAnimal;
					waitUntil {scriptDone _handle};
				};
			};
		} else {
			//OK, it wasn't a vehicle so let's see what else it could be?
			/*if((typeOf _curTarget) in _miscItems) then {
				//OK, it was a misc item (food,water,etc).
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_pickupItem;
				waitUntil {scriptDone _handle};
			} else {*/
			if((_curTarget isKindOf "Land_Sack_F") && {player distance _curTarget < 4}) then {
				private["_handle"];
				_handle = [_curTarget] spawn life_fnc_openInventory;
				waitUntil {scriptDone _handle};
			} else {
				if((_curTarget getVariable["bankItem",false]) && {player distance _curTarget < 6}) then {
					private["_handle"];
					_handle = [_curTarget] spawn life_fnc_bankLoot;
					waitUntil {scriptDone _handle};
				} else {
					//It wasn't a misc item so is it money?
					if((typeOf _curTarget) == _money && {!(_curTarget getVariable["inUse",false])} && {player distance _curTarget < 4}) then {
						private["_handle"];
						_curTarget setVariable["inUse",TRUE,TRUE];
						_handle = [_curTarget] spawn life_fnc_pickupMoney;
						waitUntil {scriptDone _handle};
					} else {
						if((typeOf _curTarget) in (call life_placeables_classes) && {playerSide in [west,independent]} && {player distance _curTarget < 12}) then {
							[] spawn life_fnc_removeObject;
						};
					};
				};
			};
		};
	};
};
