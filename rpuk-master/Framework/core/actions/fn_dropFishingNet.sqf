/*
	File: fn_dropFishingNet.sqf
	Author: Bryan "Tonic" Boardwine
	Recoded to work without physical objects by Ciaran

	Description:
	Drops a virtual fishing net from the boat.
*/
private["_fish","_type","_typeName"];
if(!(vehicle player isKindOf "Ship")) exitWith {};
if((getPosATL vehicle player) select 2 < 27) exitWith {hint "You need to be in deeper waters to catch fish!";};
life_net_dropped = true;
titleText[localize "STR_NOTF_NetDrop","PLAIN"];
sleep 5;

//random chance of catching nothing at all
if(random 100 < 30) exitWith {titleText[localize "STR_NOTF_NetDropFail","PLAIN"]; life_net_dropped = false;};


_numfish = (ceil(random 7) + 1); //roll dice to catch between 1 and 8 fish overall, 1 per loop
for "_i" from 0 to _numfish do {
	
	//idiot player got out of the boat. Lose XP and get a warning.
	if(vehicle player == player) exitWith {
		titleText["You need to stay in your boat if you want to catch fish!","PLAIN"];
		if (worldName == "Tanoa") then {[-2] call life_fnc_addxp};
	};
	
	_rand = [
		"Salema_F","Salema_F","Salema_F","Ornate_numfish_F",
		"Mackerel_F","Mackerel_F","Mackerel_F","Tuna_F",
		"Mullet_F","Mullet_F","Mullet_F","CatShark_F"
	] call BIS_fnc_selectRandom; //rare or valuable fish appear fewer times.

	sleep 3; //time passes...

	switch(_rand) do //grab the types and text-strings for display
	{
		case "Salema_F": {_typeName = localize "STR_ANIM_Salema"; _type = "salema";};
		case "Ornate_numfish_F": {_typeName = localize "STR_ANIM_Ornate"; _type = "ornate";};
		case "Mackerel_F": {_typeName = localize "STR_ANIM_Mackerel"; _type = "mackerel";};
		case "Tuna_F": {_typeName = localize "STR_ANIM_Tuna"; _type = "tuna";};
		case "Mullet_F": {_typeName = localize "STR_ANIM_Mullet"; _type = "mullet";};
		case "CatShark_F": {_typeName = localize "STR_ANIM_Catshark"; _type = "catshark";};
		default {_type = "";};
	};

	if(([true,_type,1] call life_fnc_handleInv)) then
	{
		titleText[format[(localize "STR_NOTF_Fishing"),_typeName],"PLAIN"];
		if(_type == "catshark" && worldname == "Tanoa") then {[10] call life_fnc_addxp};
	} else {
		titleText[format["You caught a %1 but had to let it go! Your hands are full...",_type],"PLAIN"];
		if(_type == "catshark" && worldname == "Tanoa") then {[-5] call life_fnc_addxp}; //Lose XP for letting a great fish go!
		_i = _numfish + 1; //chuck us out of the loop
	};
};

sleep 1.5;
titleText[localize "STR_NOTF_NetUp","PLAIN"];
life_net_dropped = false;
