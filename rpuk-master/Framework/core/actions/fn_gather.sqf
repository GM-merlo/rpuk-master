/*
	File: fn_gather.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main functionality for gathering.
*/
//moved life_action var to top in case it speeds up the antispam. NDJ 16-07-2016
life_action_inUse = true;

closeDialog 0;
private["_gather","_itemWeight","_diff","_itemName","_val","_resourceZones","_zone"];
_resourceZones = [
	"apple_1","apple_2","apple_3","apple_4","peaches_1","peaches_2","peaches_3",
	"peaches_4","heroin_1","heroin_2","cocaine_1","cocaine_2","weed_1","weed_2",
	"frog_1","frog_2","clams_1","clams_2","potato_1","potato_2",
	"cocoa_1","cocoa_2","cocoa_3","cocoa_4",
	"tree_1","tree_2","tree_3","tree_4",
	"banana_1","banana_2","banana_3","banana_4",
	"sugar_1","sugar_2","sugar_3","sugar_4",
	"tobacco_1","tobacco_2","tobacco_3","tobacco_4",
	"mango_1","mango_2","mango_3","mango_4",
	"orange_1","orange_2","orange_3","orange_4",
	"kiwi_1","kiwi_2","kiwi_3","kiwi_4",
	"coconut_1","coconut_2","coconut_3","coconut_4",
	"crocodile_1","crocodile_2","crocodile_3","crocodile_4"
];
_zone = "";


//Find out what zone we're near
{
	_dist = 30;
	if(_x in ["frog_1", "frog_2"]) then {_dist = 525;};
	if(_x in ["clams_1","clams_2"]) then {
		_dist = 1326;
		if(player distance (getMarkerPos _x) < _dist && ((getPosATL player) select 2) < 20 ) exitWith {_zone = _x;};
	};

	if(player distance (getMarkerPos _x) < _dist && !(_x in ["clams_1","clams_2"])) exitWith {_zone = _x;};
} foreach _resourceZones;

if(_zone == "" && ((isNil "life_inv_pickaxe") || (life_inv_pickaxe isEqualTo 0))) exitWith {/*hint localize "STR_NOTF_notNearResource";*/ life_action_inUse = false;}; //no pickaxe, so just leave.
if(_zone == "") exitWith {[] call life_fnc_pickAxeUse; 	}; //go to pickaxe routine instead and check for mines


//Get the resource that will be gathered from the zone name...
switch(true) do {
	case (_zone in ["apple_1","apple_2","apple_3","apple_4"]): {_gather = "apple"; _val = 3;};
	case (_zone in ["potato_1","potato_2"]): {_gather = "potato"; _val = 3;};
	case (_zone in ["peaches_1","peaches_2","peaches_3","peaches_4"]): {_gather = "peach"; _val = 3;};
	case (_zone in ["heroin_1","heroin_2"]): {_gather = "heroinu"; _val = 1;};
	case (_zone in ["cocaine_1","cocaine_2"]): {_gather = "cocaine"; _val = 1;};
	case (_zone in ["weed_1","weed_2"]): {_gather = "cannabis"; _val = 1;};
	case (_zone in ["frog_1","frog_2"]): {_gather = "frogleg"; _val = 2;};
	case (_zone in ["clams_1","clams_2"]): {_gather = "clam"; _val = 1;};
	case (_zone in ["cocoa_1","cocoa_2","cocoa_3","cocoa_4"]): {_gather = "cocoa"; _val = 1;};
	case (_zone in ["tree_1","tree_2","tree_3","tree_4"]): {_gather = "log"; _val = 1;};
	case (_zone in ["banana_1","banana_2","banana_3","banana_4"]): {_gather = "sbanana"; _val = 1;};
	case (_zone in ["sugar_1","sugar_2","sugar_3","sugar_4"]): {_gather = "sugarcane"; _val = 1;};
	case (_zone in ["tobacco_1","tobacco_2","tobacco_3","tobacco_4"]): {_gather = "tobaccoleaves"; _val = 1;};
	case (_zone in ["mango_1","mango_2","mango_3","mango_4"]): {_gather = "mango"; _val = 1;};
	case (_zone in ["orange_1","orange_2","orange_3","orange_4"]): {_gather = "orange"; _val = 1;};
	case (_zone in ["kiwi_1","kiwi_2","kiwi_3","kiwi_4"]): {_gather = "kiwi"; _val = 1;};
	case (_zone in ["coconut_1","coconut_2","coconut_3","coconut_4"]): {_gather = "coconut"; _val = 1;};
	case (_zone in ["crocodile_1","crocodile_2","crocodile_3","crocodile_4"]): {_gather = "crocodile"; _val = 1;};
	default {""};
};
//gather check??
if(vehicle player != player) exitWith {life_action_inUse = false;/*hint localize "STR_NOTF_GatherVeh";*/};

_diff = [_gather,_val,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if(_diff == 0) exitWith {hint localize "STR_NOTF_InvFull"};
//life_action_inUse = true;
for "_i" from 0 to 2 do
{
	player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";
	waitUntil{animationState player != "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";};
	sleep 0.611;
};

if(random 100 > 75 && _gather == "clam") exitWith {hint "You pickup the clam, yet no rattle inside. You put it back.";};
if(([true,_gather,_diff] call life_fnc_handleInv)) then
{
	_itemName = [([_gather,0] call life_fnc_varHandle)] call life_fnc_varToStr;
	titleText[format[localize "STR_NOTF_Gather_Success",_itemName,_diff],"PLAIN"];
};

life_action_inUse = false;
