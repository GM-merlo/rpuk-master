/*
	File: fn_searchBoatWreck.sqf
	Author: Ciaran Langton

	Description:
	Searches a random boat wreck to see what it has inside it, then "excavate" it into the players inventory to be investigated at the
	archeologist, and then finally sold at the stores.
*/

//Series Of Checks
if(life_action_inUse) exitWith {};
_boat = nearestObject[player,"Land_UWreck_FishingBoat_F"];
if(player distance _boat > 60) exitWith {hint "You are not near enough to a boat to use the excavator.";};
life_action_inUse = true;

titleText["You begin searching the underwater wreck for items of value...","PLAIN"];
_bad = false;

_items = [];
if(_boat getVariable ["isGoldboat",false]) then {
	_items = [
		"life_inv_oldgoldbar"
	];
} else {
	_items = [
		"life_inv_roundobject",
		"life_inv_squareobject",
		"life_inv_brokenstatue",
		"life_inv_oldpottery",
		"life_inv_stonetablet",
		"life_inv_brokenbell",
		"life_inv_emptybottle",
		"life_inv_strangeobject",
		"life_inv_rustediron",
		"life_inv_foolsgold",
		"life_inv_oldgoldbar"
	];
};

while {life_carryWeight < life_maxWeight} do
{
	if(speed player > 2.5) exitWith {_bad = true;};
	if(player distance _boat > 60) exitWith {_bad = true;};
	if(life_carryWeight >= life_maxWeight) exitWith {}; 
	_count = _boat getVariable ["count",[]];
	if(_count == 0) exitWith {}; 
	_randomItem = _items call BIS_fnc_selectRandom;
	_randomItemLong = _randomItem;
	_randomItem = [_randomItem,1] call life_fnc_varHandle;
	_sum = [_randomItem,1,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
	if(_sum > 0) then { 
		if (([true,_randomItem,1] call life_fnc_handleInv)) then {
			_count = _boat getVariable ["count",[]];
			_boat setVariable ["count",(_count - 1),true];

			sleep 3.5;
			_obj = [_randomItemLong] call life_fnc_varToStr;
			titleText[format["You found one %1 lodged inside of the ship, you are sure it must be worth something!",_obj],"PLAIN"];
			//systemChat format["Debug: item found was %1",_randomItem];
		};
	};
};

life_action_inUse = false;

if(!(_bad)) then {
	titleText["Either the excavator is full, or you have emptied the ship of all its items. Check your cargo!","PLAIN"];
} else {
	titleText["Either you moved too far away, or you moved while the excavator was working. Please try again.","PLAIN"];
};