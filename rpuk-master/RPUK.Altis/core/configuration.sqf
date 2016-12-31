#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system
	configuration.sqf

*****************************
****** Backend Variables *****
*****************************
*/

if(!isDedicated) then {
	life_disablehud = false;
	life_query_time = time;
	life_action_delay = time;
	life_trunk_vehicle = Objnull;
	life_session_completed = false;
	life_garage_store = false;
	life_session_tries = 0;
	life_crimes = [[],0]; //No crimes for me!
	life_net_dropped = false;
	life_hit_explosive = false;
	life_siren_active = false;
	life_clothing_filter = 0;
	life_clothing_uniform = -1;
	life_redgull_effect = time;
	life_is_processing = false;
	life_bail_paid = false;
	life_impound_inuse = false;
	life_atm_time = time;
	life_smartphoneTarget = objNull;
	life_smartphoneID = -1;
	life_escape = false;
	life_nametags = [];
	life_medical_bonebreak = false;
	life_medical_inPain = false;
	life_capture_point = -1;
	life_markers = [];
	life_msg_array = [];
	life_houses = [];
	life_my_gang_rank = 1;
	life_atm_lastCheckTime = time;
	life_atm_lastCheckResult = false;
	life_phone_lastCheckTime = time;
	life_phone_lastCheckResult = false;
	life_auctioning_car_data = [];
	life_adminmarkers = false;
	life_vehiclemarkers = false;
	life_vdm_time = -1;
	life_unlock_time = -1;
	life_clothing_customCache = ["",-1];
	life_cellphone_filterWorking = false;
	life_healthUpdateRunning = false;  //NDJ 21/07/2016 - appears unused anywhere!
	life_cellphone_contacts = [];
	life_cellphone_receiver = [];
	life_cellphone_messages = [];
  	life_xp = 0;
	RPUK_SpawnCam = false;
	RPUK_AGear = 4;

	__CONST__(life_priceModifier,0.5); //Price modifier for donation goals.

	//Check if we have our modpack enabled and if we do get the version number.
	life_alukmod_loaded = isClass(configFile >> "CfgPatches" >> "aluk_init");
	__CONST__(life_alukmod_loaded,life_alukmod_loaded);

	life_alukmod_missionVersion = str(getText(missionConfigFile >> "ALUK_MOD_CONFIG" >> "version"));
	life_alukmod_version = str(getText(configFile >> "CfgPatches" >> "aluk_init" >> "version"));
	__CONST__(life_alukmod_version,life_alukmod_version);
	__CONST__(life_alukmod_missionVersion,life_alukmod_missionVersion);

	life_hidden_clothing = [
		"G_Balaclava_blk",
		"H_ShemagOpen_tan",
		"H_Shemag_olive",
		"H_ShemagOpen_khk",
		"G_Balaclava_combat",
		"G_Balaclava_lowprofile",
		"G_Balaclava_oli",
		"G_Balaclava_TI_G_blk_F",
		"G_Balaclava_combat"
	];
	life_noname_clothing = [
		"U_I_GhillieSuit",
		"U_O_GhillieSuit",
		"U_B_FullGhillie_lsh",
		"U_B_FullGhillie_sard",
		"U_B_FullGhillie_ard",
		"U_O_FullGhillie_lsh",
		"U_O_FullGhillie_sard",
		"U_O_FullGhillie_ard",
		"U_I_FullGhillie_lsh",
		"U_I_FullGhillie_sard",
		"U_I_FullGhillie_ard",
		"U_VirtualMan_F" 
	];

	/*
	**************************
	***Profession Variables***
	**************************
	*/

	life_profession_expPerLevel = 100;
	life_profession_maxLevels = 10;

	/*
	**************************
	*****Other Variables******
	**************************
	*/
	life_smoke = objNull;
	life_action_inUse = false;
	life_spikestrip = ObjNull;
	life_drinkypoo = 0; //IM SOBER
	life_object = objNull;
	life_respawn_timer = 0.5; //Scaled in minutes
	life_knockingout = false;
	life_interrupted = false;
	life_respawned = false;
	life_removeWanted = false;
	life_hunting_runspawn = false;
	life_hunting_animals = [];
	life_gang_spawnpoint = "nocustom";
	life_sidechat = true;
	life_tagson = true;
	life_lowDetail = false;
	life_environment = false; //ambient environment & sounds
	life_revealObjects = true;
	life_request_timer = false;
	life_bounty = 0;
	life_wantedhud = false;
	life_refreshBackpackSpace = false;
	life_bloodActionPlaying = false;
	//Revive constant variables.
	__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
	__CONST__(life_revive_fee,2500); //Fee for players to pay when revived. //Currently switched off in fn_revived.sqf

	__CONST__(life_save_civ,TRUE);
	__CONST__(life_save_yinv,TRUE);

	//House Limit
	__CONST__(life_houseLimit,3); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

	//Gang related stuff?
	__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
	__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
	__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

	//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
	life_clothing_purchase = [-1,-1,-1,-1,-1];
	/*
	*****************************
	****** Weight Variables *****
	*****************************
	*/
	switch (playerSide) do //NDJ give cops more carry capability (to lessen requirement for backpacks).
	{
		case west:
		{
			life_maxWeight = 50; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
			life_maxWeightT = 50; //Static variable representing the players max carrying weight on start.
			life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).
		};
		case independent:
		{
			life_maxWeight = 50; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
			life_maxWeightT = 50; //Static variable representing the players max carrying weight on start.
			life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).
		};
		default
		{
			life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
			life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
			life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).
		};
	};
	/*
	*****************************
	****** Life Variables *******
	*****************************
	*/
	life_net_dropped = false;
	life_hit_explosive = false;
	life_siren_active = false;
	life_bank_fail = false;
	life_use_atm = true;
	life_is_arrested = false;
	life_delivery_in_progress = false;
	life_busdrive_in_progress = false;
	life_action_in_use = false;
	life_thirst = 100;
	life_hunger = 100;
	__CONST__(life_paycheck_period,15); //NDJ Fifteen minutes
	RPUK_dosh = 0;
	__CONST__(life_impound_car,349);  //NDJ
	__CONST__(life_impound_boat,249); //NDJ
	__CONST__(life_impound_air,849);  //NDJ
	__CONST__(life_impound_cargo,100);  //NDJ
	life_istazed = false;
	life_isknockedout = false;
	life_my_gang = ObjNull;
	life_horn_active = false; //NDJ Mar14
	life_crusher_inuse = false; //NDJ May14
	life_rebelonrun = false; //NDJ Apr14
	life_nlrtimer_stop = false;
	life_nlrtimer_running = false;
	life_spawnAnimDone = false;

	life_vehicles = [];
	life_refuelvehicle_price = 750; //NDJ 14-07-16 ALTIS VALUE!!!!!!
	life_refuel_litre_price = 15; //£/litre, nominally - NDJ 18/07/16 Altis price!

	RPUK_doshinbank = 100000; //NDJ Starting Bank Money
	switch (playerSide) do
	{
		case west:
		{
			life_paycheck = 20000; //NDJ Paycheck Amount
		};
		case civilian:
		{
			life_paycheck = 3000; //NDJ Paycheck Amount
		};
		case independent:
		{
			life_paycheck = 12000; //CL - Increase paycheck amount. Medics were not getting enough money.
		};
	};

	//--- Make paycheck static
	__CONST__(life_paycheck,life_paycheck);

	/*
		Master Array of items?
	*/
	life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
	__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

	life_inv_items =
	[
		"life_inv_oilu",
		"life_inv_oilp",
		"life_inv_heroinu",
		"life_inv_heroinp",
		"life_inv_cannabis",
		"life_inv_marijuana",
		"life_inv_apple",
		"life_inv_potato",
		"life_inv_chips",
		"life_inv_rabbit",
		"life_inv_salema",
		"life_inv_ornate",
		"life_inv_mackerel",
		"life_inv_tuna",
		"life_inv_mullet",
		"life_inv_catshark",
		"life_inv_turtle",
		"life_inv_fishingpoles",
		"life_inv_water",
		"life_inv_donuts",
		"life_inv_turtlesoup",
		"life_inv_coffee",
		"life_inv_fuelF",
		"life_inv_fuelE",
		"life_inv_pickaxe",
		"life_inv_copperore",
		"life_inv_ironore",
		"life_inv_ironr",
		"life_inv_copperr",
		"life_inv_sand",
		"life_inv_salt",
		"life_inv_saltr",
		"life_inv_glass",
		"life_inv_tbacon",
		"life_inv_lockpick",
		"life_inv_redgull",
		"life_inv_peach",
		"life_inv_diamond",
		"life_inv_coke",
		"life_inv_cokep",
		"life_inv_diamondr",
		"life_inv_spikeStrip",
		"life_inv_rock",
		"life_inv_cement",
		"life_inv_goldbar",
		"life_inv_blastingcharge",
		"life_inv_boltcutter",
		"life_inv_defusekit",
		"life_inv_storagesmall",
		"life_inv_storagebig",


		//CUSTOM
		"life_inv_zipties",
		"life_inv_medlight",
		"life_inv_roadcone",
		"life_inv_roadbarrier",
		"life_inv_tapesign",
		"life_inv_arrowleft",
		"life_inv_arrowright",
		"life_inv_frogleg",
		"life_inv_lsd",

		//Some wierd stuff we saw watching people RP with gyros and redburger...
		"life_inv_gyro",
		"life_inv_redburger",
		"life_inv_fries",
		"life_inv_icecream",
		"life_inv_ratkebab",
		"life_inv_lollipop",

		"life_inv_chicken",
		"life_inv_goat",
		"life_inv_sheep",
		"life_inv_dog",

		//Ship wreck items
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
		"life_inv_oldgoldbar",
		"life_inv_excavator",

		"life_inv_wood",
		"life_inv_woodp",

		//Drinking Items
		"life_inv_beer",
		"life_inv_whisky",
		"life_inv_shandy",
		"life_inv_breathalyzer",

		"life_inv_ephedrine",
		"life_inv_crystalmeth",
		"life_inv_cider",

		"life_inv_clam",
		"life_inv_pearl",

		"life_inv_parkingticket",
		"life_inv_marmite",

		"life_inv_tapesignsm",
		"life_inv_tapesignwarning",
		"life_inv_portablebarrier",

		"life_inv_acid",
		"life_inv_ecstacy",

		//New bank system
		"life_inv_codebreaker",
		"life_inv_markedmoney",
		"life_inv_weaponbag",

		//New Tanoa
		"life_inv_cocoa",
		"life_inv_chocolate",
		"life_inv_log",
		"life_inv_lumber",
		"life_inv_bbanana",
		"life_inv_sbanana",
		"life_inv_sugarcane",
		"life_inv_sugar",
		"life_inv_tobaccoleaves",
		"life_inv_tobacco",
		"life_inv_cigarette",
		"life_inv_mango",
		"life_inv_orange",
		"life_inv_kiwi",
		"life_inv_coconut",
		"life_inv_crocodile",
		"life_inv_crocshoes",

		"life_inv_defib"
	];

	//Setup variable inv vars.
	{missionNamespace setVariable[_x,0];} foreach life_inv_items;

	//Licenses [license var, civ/cop]
	life_licenses =
	[
		["license_cop_air","cop"],
		["license_cop_swat","cop"],
		["license_cop_cg","cop"],
		["license_civ_driver","civ"],
		["license_civ_air","civ"],
		["license_civ_heroin","civ"],
		["license_civ_marijuana","civ"],
		["license_civ_gang","civ"],
		["license_civ_boat","civ"],
		["license_civ_oil","civ"],
		["license_civ_dive","civ"],
		["license_civ_truck","civ"],
		["license_civ_bus","civ"], //bus driver licence NDJ 13/7/16
		["license_civ_gun","civ"],
		["license_civ_rebel","civ"],
		["license_civ_coke","civ"],
		["license_civ_diamond","civ"],
		["license_civ_copper","civ"],
		["license_civ_iron","civ"],
		["license_civ_sand","civ"],
		["license_civ_salt","civ"],
		["license_civ_cement","civ"],
		["license_med_air","med"],
		["license_civ_home","civ"],
		["license_civ_event","civ"], //NDJ Disco Licence
		["license_civ_bounty","civ"],
		["license_civ_meth","civ"],
		["license_civ_taxi","civ"],
		["license_civ_arac","civ"]
	];

	//Setup License Variables
	{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

	life_dp_points = [];

	_dpCount = switch (worldName) do {
		case "Altis": {25};
		case "Stratis": {6};
		case "Tanoa": {0};
	};
	for "_i" from 1 to _dpCount do {
		life_dp_points pushBack format["dp_%1",_i];
	};

	life_busdrive_points = [];
	
	_busdriveCount = switch (worldname) do {
		case "Altis": {0};
		case "Stratis": {0};
		case "Tanoa": {15};
	};
	
	for "_i" from 1 to _busdriveCount do {
		life_busdrive_points pushBack format["bus_stop_%1",_i - 1];
	};

	life_busdrive_pay_per_m = 0.09; //set for Tanoa - not used in Altis (yet)

	life_hospital_heal_cost = 500;
	//cop values
	life_illegal_weapons =
	[
		["arifle_sdar_F",7500],
		["hgun_P07_snds_F",650],
		["20Rnd_556x45_UW_mag",35],
		["arifle_Katiba_F",5000],
		["30Rnd_556x45_Stanag",65],
		["20Rnd_762x51_Mag",85],
		["30Rnd_65x39_caseless_green",50],
		["optic_ACO_grn",250],
		["acc_flashlight",100],
		["srifle_EBR_F",15000],
		["arifle_TRG21_F",3500],
		["optic_MRCO",500],
		["optic_Aco",850],
		["arifle_MX_F",7500],
		["arifle_MXC_F",5000],
		["arifle_MXM_F",8500],
		["MineDetector",500],
		["optic_Holosight",275],
		["acc_pointer_IR",175],
		["arifle_TRG20_F",2500],
		["SMG_01_F",1500],
		["arifle_Mk20C_F",4500],
		["30Rnd_45ACP_Mag_SMG_01",60],
		["30Rnd_9x21_Mag",30],
		["optic_Aco_smg",500],
		["optic_ACO_grn_smg",500],
		["200Rnd_65x39_cased_Box",1000],
		["200Rnd_65x39_cased_Box_Tracer",1000],
		["30Rnd_556x45_Stanag_Tracer_Green",100],
		["SMG_02_F",80000],
		["100Rnd_65x39_caseless_mag",1000],
		["100Rnd_65x39_caseless_mag_Tracer",1000],
		["srifle_LRR_SOS_F",1500000],
		["srifle_LRR_camo_SOS_F",1750000],
		["arifle_Mk20C_plain_F",5000],
		["arifle_Mk20_plain_F",5000],
		["SMG_01_Holo_F",2000],
		["optic_Holosight_smg",2000],
		["arifle_MXC_Black_F",22000],
		["arifle_MX_Black_F",25000],
		["arifle_MXM_Black_F",28000],
		["30Rnd_65x39_caseless_mag_Tracer",2000],
		["30Rnd_65x39_caseless_mag",2000],
		["Rangefinder",2000],
		["arifle_MX_SW_Black_F",2000],
		["100Rnd_65x39_caseless_mag",2000],
		["muzzle_snds_H",2000],
		["muzzle_snds_B",2000],
		["muzzle_snds_L",2000],
		["B_UavTerminal",2000]
	];

	life_illegal_weapons_names = [];

	{
		life_illegal_weapons_names pushBack (_x select 0);
	} forEach life_illegal_weapons;

	//sales prices for weapons
	life_weapon_shop_array =
	[
		["arifle_sdar_F",7500],
		["hgun_P07_snds_F",650],
		["hgun_P07_F",1500],
		["ItemGPS",45],
		["ToolKit",75],
		["FirstAidKit",65],
		["Medikit",0],
		["NVGoggles",0],
		["16Rnd_9x21_Mag",15],
		["20Rnd_556x45_UW_mag",35],
		["ItemMap",0],
		["ItemCompass",25],
		["Chemlight_blue",50],
		["Chemlight_yellow",50],
		["Chemlight_green",50],
		["Chemlight_red",50],
		["hgun_Rook40_F",500],
		["arifle_Katiba_F",5000],
		["30Rnd_556x45_Stanag",65],
		["20Rnd_762x51_Mag",85],
		["30Rnd_65x39_caseless_green",50],
		["DemoCharge_Remote_Mag",7500],
		["SLAMDirectionalMine_Wire_Mag",2575],
		["optic_ACO_grn",250],
		["acc_flashlight",100],
		["srifle_EBR_F",15000],
		["arifle_TRG21_F",3500],
		["optic_MRCO",500], //NDJ Was 5000
		["optic_Aco",850],
		["arifle_MX_F",7500],
		["arifle_MXC_F",5000],
		["arifle_MXM_F",8500],
		["MineDetector",500],
		["optic_Holosight",275],
		["acc_pointer_IR",175],
		["arifle_TRG20_F",2500],
		["SMG_01_F",1500],
		["arifle_Mk20C_F",4500],
		["30Rnd_45ACP_Mag_SMG_01",60],
		["30Rnd_9x21_Mag",30],
		["hgun_PDW2000_F",3000], //NDJ
		["optic_Aco_smg",500], //NDJ
		["optic_ACO_grn_smg",500], //NDJ
		["200Rnd_65x39_cased_Box",1000], //NDJ
		["200Rnd_65x39_cased_Box_Tracer",1000], //NDJ
		["9Rnd_45ACP_Mag",50], //NDJ
		["30Rnd_556x45_Stanag_Tracer_Green",100], //NDJ
		["SMG_02_F",80000],
		["100Rnd_65x39_caseless_mag",1000],
		["100Rnd_65x39_caseless_mag_Tracer",1000],
		["srifle_LRR_SOS_F",1500000],
		["srifle_LRR_camo_SOS_F",1750000],
		["arifle_Mk20C_plain_F",2000],
		["arifle_Mk20_plain_F",5000],
		["muzzle_snds_M",1000]

	];
	__CONST__(life_weapon_shop_array,life_weapon_shop_array);

	//cost of retrieving vehicle from garage
	life_garage_prices =
	[
		["B_QuadBike_01_F",100],     //NDJ Was 550
		["C_Hatchback_01_F",500],    //NDJ Was 1500
		["C_Offroad_01_F", 500],     //NDJ Was 2500
		["B_G_Offroad_01_F",500],    //NDJ Was 3500
		["C_SUV_01_F",500],          //NDJ Was 5250
		["C_Van_01_transport_F",1000],    //NDJ Was 7890
		["C_Hatchback_01_sport_F",500],   //NDJ Was 2350
		["C_Van_01_fuel_F",1000],         //NDJ Was 4500
		["I_Heli_Transport_02_F",10000],  //NDJ Was 100000
		["C_Van_01_box_F",1000],          //NDJ Was 9000
		["I_Truck_02_transport_F",4000],  //NDJ Was 12000
		["I_Truck_02_covered_F",4000],   //NDJ Was 14500
		["B_Truck_01_transport_F",4000], //NDJ Was 25650
		["B_Truck_01_box_F", 4000],      //NDJ Was 35000
		["O_MRAP_02_F",50000],            //NDJ Was 45000
		["I_MRAP_03_F",50000],
		["B_Heli_Light_01_F",10000],      //NDJ Was 45000
		["C_Heli_Light_01_civil_F",10000],
		["O_Heli_Light_02_unarmed_F",10000], //NDJ Was 65000
		["C_Rubberboat",100],              //NDJ Was 400
		["C_Boat_Civil_01_F",100],        //NDJ Was 4500
		["B_Boat_Transport_01_F",10],     //NDJ Was 450
		["C_Boat_Civil_01_police_F",100], //NDJ Was 3500
		["B_Boat_Armed_01_minigun_F",100], //NDJ Was 16500
		["B_SDV_01_F",15000],          //NDJ Was 25000
		["I_SDV_01_F",15000],          //NDJ new item
		["B_MRAP_01_F",50000]           //NDJ Was 7500
	];
	__CONST__(life_garage_prices,life_garage_prices);

	//sales prices of vehicles
	life_garage_sell =
	[
		["B_Quadbike_01_F",750],                 //NDJ Was	["B_Quadbike_01_F",950],
		["C_Hatchback_01_F",1950],               //NDJ Was	["C_Hatchback_01_F",4500],
		["C_Offroad_01_F", 2850],                //NDJ Was	["C_Offroad_01_F", 6500],
		["B_G_Offroad_01_F",3500],               //NDJ Was	["B_G_Offroad_01_F",3500],
		["C_SUV_01_F",8955],                     //NDJ Was	["C_SUV_01_F",15000],
		["C_Van_01_transport_F",2490],           //NDJ Was	["C_Van_01_transport_F",25000],
		["C_Hatchback_01_sport_F",3315],         //NDJ Was	["C_Hatchback_01_sport_F",7500],
		["C_Van_01_fuel_F",2850],                //NDJ Was	["C_Van_01_fuel_F",3850],
		["I_Heli_Transport_02_F",450015],        //NDJ Was	["I_Heli_Transport_02_F",125000],
		["C_Van_01_box_F",6015],                 //NDJ Was	["C_Van_01_box_F",35000],
		["I_Truck_02_transport_F",11265],        //NDJ Was	["I_Truck_02_transport_F",49800],
		["I_Truck_02_covered_F",15015],          //NDJ Was	["I_Truck_02_covered_F",62000],
		["B_Truck_01_transport_F",30015],        //NDJ Was	["B_Truck_01_transport_F",135000],
		["B_Truck_01_box_F", 60015],             //NDJ Was	["B_Truck_01_box_F", 150000],
		["O_MRAP_02_F",500000],                   //NDJ Was	["O_MRAP_02_F",65000],
		["I_MRAP_03_F",22515],
		["B_Heli_Light_01_F",48765],             //NDJ Was	["B_Heli_Light_01_F",57000],
		["C_Heli_Light_01_civil_F",48765],
		["O_Heli_Light_02_unarmed_F",225015],    //NDJ Was	["O_Heli_Light_02_unarmed_F",72500],
		["C_Rubberboat",764],                    //NDJ Was	["C_Rubberboat",950],
		["C_Boat_Civil_01_F",6015],              //NDJ Was	["C_Boat_Civil_01_F",6800],
		["B_Boat_Transport_01_F",6015],          //NDJ Was	["B_Boat_Transport_01_F",850],
		["C_Boat_Civil_01_police_F",6015],       //NDJ Was	["C_Boat_Civil_01_police_F",4950],
		["B_Boat_Armed_01_minigun_F",6015],      //NDJ Was	["B_Boat_Armed_01_minigun_F",21000],
		["B_SDV_01_F",149999],                   //NDJ Was	["B_SDV_01_F",45000],
		["I_SDV_01_F",149999],                   //NDJ new item
		["B_MRAP_01_F",200000],                   //NDJ Was	["B_MRAP_01_F",10000]
		["O_Truck_03_device_F",225000],
		["O_Truck_03_transport_F",20000],
		["O_Truck_03_covered_F",45000]
	];
	__CONST__(life_garage_sell,life_garage_sell);

	life_slingload_allowed =
	[
		"We_Dont_Have_Any_Vehicles_At_The_Moment"
	];

	__CONST__(life_slingload_allowed,life_slingload_allowed);
};

//Global Config

//sales price of drugs etc
//[shortVar,reward]
life_illegal_items = [
	["heroinu",500],
	["heroinp",1300],
	["cocaine",1200],
	["cocainep",3500],
	["marijuana",1200],
	["cannabis",2400],
	["turtle",3000],
	["blastingcharge",10000],
	["boltcutter",500],
	["cannabis",1800],
	["goldbar",40000],
	["lsd",2500],
	["ecstacy",2500],
	["acid",2500]
];

life_illegal_items_names = [];

{
	life_illegal_items_names pushBack (_x select 0);
} forEach life_illegal_items;

life_placeables = [
	["roadcone","RoadCone_L_F"],
	["roadbarrier","RoadBarrier_F"],
	["roadcone", "RoadCone_L_F"],
	["tapesignsm", "RoadBarrier_small_F"],
	["tapesignwarning", "Land_PlasticBarrier_03_F"],
	["tapesign", "TapeSign_F"],
	["arrowleft", "ArrowDesk_L_F"],
	["arrowright", "ArrowDesk_R_F"],
	["portablebarrier", "Land_BarGate_F"]
];

__CONST__(life_placeables,life_placeables);

if(isNil 'life_placeables_classes') then {
	life_placeables_classes = [];
	{life_placeables_classes pushBack (_x select 1);} forEach (call life_placeables);
	__CONST__(life_placeables_classes,life_placeables_classes);
};
if(isNil 'life_placeables_names') then {
	life_placeables_names = [];
	{life_placeables_names pushBack (_x select 0);} forEach (call life_placeables);
	__CONST__(life_placeables_names,life_placeables_names);
};
