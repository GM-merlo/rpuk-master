/*
	File: fn_eatFood.sqf
	Author: Bryan "Tonic" Boardwine
	Modded out of all recognition by NDJ 27/07/16
	
	Description:
	Main handling system for eating food.
*/
private["_food","_val","_sum","_thirst","_foodname"];
_food = [_this,0,"",[""]] call BIS_fnc_param;
if(_food == "") exitWith {};

if([false,_food,1] call life_fnc_handleInv) then {
	switch (_food) do
	{
		case "apple": {_val = 10};
		case "potato": {_val = 5};
		case "rabbit":{ _val = 20};
		case "salema": {_val = 30};
		case "ornate": {_val = 25};
		case "mackerel": {_val = 30};
		case "tuna": {_val = 100};
		case "mullet": {_val = 80};
		case "catshark": {_val = 100};
		case "turtle": {_val = 100};
		case "turtlesoup": {_val = 100};
		case "donuts": {_val = 30};
		case "tbacon": {_val = 40}; //baked beans
		case "peach": {_val = 10};
		case "gyro": {_val = 10};
		case "redburger": {_val = 40};
		case "fries": {_val = 20};
		case "icecream": {_val = 40};
		case "ratkebab": {_val = 30};
		case "lollipop": {_val = 5};
		case "marmite": {_val = 20};
		
		//New Tanoa edibles
		case "chocolate": {_val = 10};
		case "bbanana": {_val = 10};
		case "sbanana": {_val = 10};
		case "sugar": {_val = 10};
		case "mango": {_val = 10};
		case "orange": {_val = 10};
		case "kiwi": {_val = 10};
		case "coconut": {_val = 10};
		
		default {_val = 50};
	};

	_sum = life_hunger + _val;
	switch (true) do {
		case ((_sum > 100) && (_sum <= 110)): {
			hint "You have overeaten a bit, but you're OK.";
			life_hunger = 100;
		};
		case ((_sum > 110) && (_sum <= 150)): {
			hint "You've overeaten quite a lot.\nYou're feeling a bit ill!";
			life_hunger = 100;
			player setdamage ((damage player) + ((( _sum - 110 ) * 0.5)/100)); //0.5% damage per point over
		};
		case (_sum > 150): {
			hint "You've overeaten massively, and puked!\nYou're feeling very ill!";
			player setdamage ((damage player) + ((( _sum - 110 ) * 0.5)/100)); //0.5% damage per point over

			life_hunger = 100 - (floor random [0,50,95]); //randomly lose some hunger (empty stomach)
			
			_thirst = life_thirst - (floor random [0,50,95]);
			if (_thirst > life_thirst) then { 
				life_thirst = 0;
			} else {
				life_thirst = life_thirst - _thirst;
			};
		};
		default {
			_foodname = [_food, 0] call life_fnc_varHandle;
			_foodname = _foodname call life_varToStr;
			uiSleep 1;
			hint format["You eat the %1. Yummy!", _foodname]; 
			life_hunger = _sum;
		};
	};
} else {
	hint "You can't eat THAT, you fool!";
};