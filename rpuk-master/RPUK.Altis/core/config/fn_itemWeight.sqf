/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "water": {2};
	case "rabbit": {2};
	case "tbacon": {3};
	case "marmite": {3};
	case "redburger": {2};
	case "Crisps": {2};
	case "Chips": {3};
	case "Icecream": {1};
	case "beer": {3};
	case "Shandy": {3};
	case "whiskey": {3};
	case "candy": {1};
	case "ratkebab": {2};
	case "Gyro": {2};
	case "pickaxe": {5};
	case "fuelF": {5};
	case "fuelE": {2};
	case "defib": {5};
	case "codebreaker": {4};
	case "spikeStrip": {15};
	case "blastingcharge": {15};
	case "boltcutter": {5};
	case "kiwi": {2};
	case "mango": {2};
	case "goldbar": {18};
	case "salema": {1};
	case "ornate": {1};
	case "mackerel": {2};
	case "mullet": {2};
	case "tuna": {4};
	case "catshark": {4};
	case "coconut": {3};
	case "crocodile": {50};
	case "crocshoes": {30};
	case "apple": {1};
	case "copper": {5};
	case "copper_r": {3};
	case "iron": {5};
	case "iron_r": {3};
	case "diamond": {6};
	case "diamondc": {4};
	case "cocoa": {3};
	case "chocolate": {2};
	case "tobaccoleaves": {6};
	case "tobacco": {5};
	case "cigarette": {3};
	case "sbanana": {4};
	case "bbanana": {2};
	case "log": {6};
	case "lumber": {5};
	case "sugarcane": {5};
	case "sugar": {3};
	case "frogleg": {3};
	case "cocaine": {6};
	case "cocainep": {4};
	case "cannabis": {4};
	case "marijuana": {3};
	case "lsd": {4};

	//Ship Wreck Items
	case "roundobject": {3};
	case "squareobject":  {4};
	case "brokenstatue": {6};
	case "oldpottery": {4};
	case "stonetablet": {8};
	case "brokenbell": {4};
	case "emptybottle": {1};
	case "strangeobject": {6};
	case "rustediron": {6};
	case "foolsgold": {5};
	case "oldgoldbar": {8};
	case "excavator": {5};

	case "chicken": {2};
	case "goat": {4};
	case "sheep": {4};
	case "dog": {3};
	case "roadcone": {2};
	case "roadbarrier": {5};
	case "tapesign": {5};
	case "tapesignwarning": {5};
	case "tapesignsm": {5};
	case "portablebarrier": {10};
	case "arrowleft": {3};
	case "arrowright": {3};
	case "markedmoney": {12};
	case "weaponbag": {16};
	case "money": {0};
	case "defib": {5};

  default {1};
};