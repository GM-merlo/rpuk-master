/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];

switch (true) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};

	/*case (_item in (call life_placeables_names)):
	{
		[_item] spawn life_fnc_placeObject;
	};*/

	case (_item == "excavator"): {
		[] spawn life_fnc_searchBoatWreck;
		closeDialog 0;
	};

	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};

	case (_item == "codebreaker"): {
		[cursorTarget] spawn life_fnc_codebreaker;
		closeDialog 0;
	};

	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
	};

	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};

	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};

	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};

	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(playerSide != west) exitWith {};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};

	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};

	case (_item in ["marijuana","heroinp","cocainep"]):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[_item] spawn life_fnc_drugUse;
		};
	};

	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};

	//Police Item for getting players BAC (Blood Alchol Content)
	case (_item == "breathalyzer"):
	{
		[] spawn life_fnc_breathalyse;
	};

	case (_item in ["beer","whisky","shandy","cider"]):
	{
		[_item] spawn life_fnc_drink;
	};

	case (_item == "parkingticket"):
	{
		[] spawn life_fnc_parkingTicket;
	};

	case (_item in ["marmite","chicken","goat","sheep","apple","potato","chips","lollipop","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","gyro","redburger","chips","fries","icecream","ratkebab","chocolate","bbanana","sbanana","sugar","mango","orange","kiwi"]):
	{
		if (life_hunger < 96) then {
		[_item] call life_fnc_eatFood;
		} else {
			hint "You're too full to eat any more right now.";
		};
	};
/*	 NDJ 290716 - removed pickaxe from USE button. Everyone hates it and it has problem co-existing with ActionKey/Gather mutexes anyway. Good riddance!
	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
*/
	case (_item == "medlight"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn {
				hint "You get out your medlight and attach it to your left hand.";
				_chemlight = "Chemlight_red" createVehicle [0,0,0];
				_chemlight attachTo[player,[0,0,0],"lefthand"];
				sleep 600;
				deleteVehicle _chemlight;
				hint "Your medlight has ran out.";
			};
		};
	};

	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};

[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;
