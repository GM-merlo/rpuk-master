/*
	File: fn_setupActions.sqf

	Description:
	Master addAction file handler for all client-based actions.
*/
life_actions = [];
switch (playerSide) do
{
	case civilian:
	{
		//Fishing net
		life_actions pushBack (player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
		(surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']);

		//Robbing
		life_actions pushBack (player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
		!isNull cursorTarget && {player distance cursorTarget < 3.5} && {isPlayer cursorTarget} && {animationState cursorTarget in ["incapacitated","amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"]} && {!(cursorTarget getVariable["robbed",FALSE])} ']);
	};
};

//Map ATMS
life_actions pushBack (player addAction["<t color='#ADFF2F'>Cashpoint</t>",life_fnc_atmMenu,"",0,FALSE,FALSE,"",' vehicle player == player && {[] call life_fnc_nearATM}']);
//Phone Booths
life_actions pushBack (player addAction["<t color='#CCCC00'>Smart Phonebooth</t>",{if(!dialog) then {[] spawn life_fnc_mobileOpen;};},"",0,FALSE,FALSE,"",' vehicle player == player && {[] call life_fnc_nearPhone} ']);