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
	life_disableHUD = false;
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

	__CONST__(life_priceModifier,1); //Price modifier for donation goals. (Not in TANOA! - NDJ 160716)

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
	__CONST__(life_gangPrice,1000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
	__CONST__(life_gangUpgradeBase,100); //MASDASDASD
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
	__CONST__(life_impound_car,20);  //NDJ
	__CONST__(life_impound_boat,15); //NDJ
	__CONST__(life_impound_air,50);  //NDJ
	__CONST__(life_impound_cargo,5);  //NDJ
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
	life_refuelvehicle_price = 50; //NDJ 14-07-16 TANOA VALUE!!!!!!
	life_refuel_litre_price = 1; //�/litre, nominally - NDJ 18/07/16 TANOA Price

	RPUK_doshinbank = 5000; //NDJ Starting Bank Money (Tanoa launch)
	switch (playerSide) do
	{
		case west:
		{
			life_paycheck = 500; //NDJ Paycheck Amount (Tanoa launch)
		};
		case civilian:
		{
			life_paycheck = 10; //NDJ Paycheck Amount (Tanoa launch)
		};
		case independent:
		{
			life_paycheck = 10; //NDJ Paycheck Amount (Tanoa launch)
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

	life_busdrive_pay_per_m = 0.09; //abt 12km per round, 30mins, equiv abt £1080 per round. 
	//Fuel currently around £140 round, so net income £968 per round. 
	//To pay back hire (£1000), uniform (£75) and license (£8000) will take about 10 rounds (5hrs RL)
	//After breaking-even, will then make profit at abt £2k/hr minus hire cost.
	
	life_hospital_heal_cost = 100;

	//cop values
	life_illegal_weapons =
	[
		["arifle_Mk20C_plain_F", 0],
		["arifle_Mk20_plain_F", 0],
		["srifle_DMR_03_F", 0],
		["hgun_PDW2000_F", 2200],
		["SMG_02_F", 2500],
		["SMG_05_F", 2800],
		["SMG_01_F", 4000],
		["arifle_AKS_F", 4500],
		["arifle_SDAR_F", 2000],
		["arifle_Mk20C_F", 4000],
		["arifle_Mk20_F", 5000],
		["arifle_SPAR_01_blk_F", 6750],
		["arifle_SPAR_01_khk_F", 9050],
		["arifle_SPAR_01_snd_F", 4250],
		["arifle_TRG21_F", 6000],
		["arifle_TRG20_F", 5000],
		["arifle_CTAR_blk_F", 6000],
		["arifle_CTAR_ghex_F", 8000],
		["arifle_CTAR_hex_F", 10000],
		["arifle_Katiba_F", 6850],
		["arifle_Katiba_C_F", 5850],
		["arifle_MXC_F", 7500],
		["arifle_MXC_Black_F", 10000],
		["arifle_MXC_khk_F", 12500],
		["arifle_MX_F", 8000],
		["arifle_MX_Black_F", 10500],
		["arifle_MX_khk_F", 13000],
		["arifle_MX_SW_F", 8500],
		["arifle_MX_SW_Black_F", 11500],
		["arifle_MX_SW_khk_F", 13500],
		["arifle_MXM_F", 10500],
		["arifle_MXM_Black_F", 13000],
		["arifle_MXM_khk_F", 15500],
		["srifle_DMR_07_blk_F", 12500],
		["srifle_DMR_07_ghex_F", 15000],
		["srifle_DMR_07_hex_F", 17500],
		["srifle_DMR_01_F", 25500],
		["srifle_EBR_F", 31500],
		["srifle_DMR_03_khaki_F", 36500],
		["srifle_DMR_03_tan_F", 36500],
		["srifle_DMR_03_multicam_F", 36500],
		["srifle_DMR_03_woodland_F", 36500],
		["srifle_DMR_06_camo_F", 29000],
		["srifle_DMR_06_olive_F", 29000],
		["srifle_DMR_06_camo_khs_F", 29000],
		["arifle_AK12_F", 12000],
		["arifle_AKM_F", 14000],
		["arifle_SPAR_03_blk_F", 41500],
		["arifle_SPAR_03_khk_F", 41500],
		["arifle_SPAR_03_snd_F", 41500],
		["30Rnd_9x21_Mag", 500],
		["30Rnd_9x21_Mag_SMG_02", 500],
		["30Rnd_9x21_Mag_SMG_02_Tracer_Green", 600],
		["30Rnd_9x21_Mag_SMG_02_Tracer_Red", 600],
		["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", 600],
		["30Rnd_9x21_Green_Mag", 600],
		["30Rnd_9x21_Red_Mag", 600],
		["30Rnd_9x21_Yellow_Mag", 600],
		["30Rnd_45ACP_Mag_SMG_01", 400],
		["30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 500],
		["30Rnd_545x39_Mag_F", 400],
		["30Rnd_545x39_Mag_Tracer_Green_F", 500],
		["30Rnd_545x39_Mag_Tracer_F", 500],
		["30Rnd_545x39_Mag_Green_F", 450],
		["20Rnd_556x45_UW_mag", 500],
		["30Rnd_556x45_Stanag", 550],
		["30Rnd_556x45_Stanag_Tracer_Green", 650],
		["30Rnd_556x45_Stanag_Tracer_Red", 650],
		["30Rnd_556x45_Stanag_Tracer_Yellow", 650],
		["30Rnd_556x45_Stanag_green", 600],
		["30Rnd_556x45_Stanag_red", 600],
		["30Rnd_580x42_Mag_F", 600],
		["30Rnd_580x42_Mag_Tracer_F", 700],
		["30Rnd_65x39_caseless_green", 750],
		["30Rnd_65x39_caseless_mag", 750],
		["30Rnd_65x39_caseless_green_mag_Tracer", 850],
		["30Rnd_65x39_caseless_mag_Tracer", 850],
		["30Rnd_762x39_Mag_F", 900],
		["30Rnd_762x39_Mag_Tracer_Green_F", 1200],
		["30Rnd_762x39_Mag_Tracer_F", 1200],
		["30Rnd_762x39_Mag_Green_F", 1000],
		["10Rnd_762x54_Mag", 1000],
		["20Rnd_762x51_Mag", 1500],
		["SmokeShell", 150],
		["O_IR_Grenade", 150],
		["optic_LRPS_tna_F", 0],
		["optic_LRPS_ghex_F", 0],
		["optic_LRPS", 0],
		["acc_flashlight", 300],
		["optic_Aco", 400],
		["optic_ACO_grn", 400],
		["optic_Aco_smg", 400],
		["optic_ACO_grn_smg", 400],
		["muzzle_snds_L", 500],
		["optic_Holosight_blk_F", 500],
		["optic_Holosight", 500],
		["optic_Holosight_khk_F", 500],
		["optic_Holosight_smg_blk_F", 500],
		["optic_Holosight_smg", 500],
		["muzzle_snds_acp", 600],
		["acc_pointer_IR", 600],
		["muzzle_snds_m_snd_F", 750],
		["muzzle_snds_M", 800],
		["optic_Arco_blk_F", 800],
		["optic_Arco", 800],
		["optic_Arco_ghex_F", 800],
		["optic_Hamr", 800],
		["optic_Hamr_khk_F", 800],
		["optic_MRCO", 800],
		["muzzle_snds_m_khk_F", 850],
		["muzzle_snds_H", 900],
		["bipod_01_F_snd", 900],
		["bipod_01_F_blk", 900],
		["bipod_01_F_mtp", 900],
		["bipod_02_F_blk", 900],
		["bipod_02_F_tan", 900],
		["bipod_02_F_hex", 900],
		["bipod_03_F_blk", 900],
		["bipod_03_F_oli", 900],
		["bipod_01_F_khk", 900],
		["muzzle_snds_H_khk_F", 1000],
		["optic_ERCO_blK_F", 1000],
		["optic_ERCO_snd_F", 1000],
		["optic_ERCO_khk_F", 1000],
		["muzzle_snds_H_MG", 1200],
		["muzzle_snds_H_MG_blk_F", 1400],
		["optic_DMS", 1500],
		["optic_DMS_ghex_F", 1500],
		["muzzle_snds_H_MG_khk_F", 1600],
		["muzzle_snds_B_snd_F", 2000],
		["muzzle_snds_B", 2200],
		["muzzle_snds_B_khk_F", 2400],
		["optic_AMS_snd", 2400],
		["optic_AMS_khk", 2400],
		["optic_AMS", 2400],
		["optic_KHS_old", 2500],
		["optic_KHS_blk", 2500],
		["optic_KHS_hex", 2500],
		["optic_KHS_tan", 2500],
		["muzzle_snds_65_TI_blk_F", 3000],
		["muzzle_snds_65_TI_hex_F", 3500],
		["muzzle_snds_65_TI_ghex_F", 3500]
	];

	life_illegal_weapons_names = [];

	{
		life_illegal_weapons_names pushBack (_x select 0);
	} forEach life_illegal_weapons;

	//sales prices for weapons
	life_weapon_shop_array =
	[
		["ToolKit", 25],
		["FirstAidKit", 19],
		["ItemGPS", 25],
		["Binocular", 13],
		["ItemCompass", 25],
		["ItemWatch", 13],
		["ItemMap", 3],
		["Rangefinder", 125],
		["NVGoggles", 50],
		["NVGoggles_OPFOR", 63],
		["NVGoggles_INDEP", 75],
		["hgun_Pistol_Signal_F", 150],
		["hgun_Pistol_01_F", 300],
		["hgun_Rook40_F", 313],
		["hgun_ACPC2_F", 350],
		["hgun_Pistol_heavy_01_F", 438],
		["hgun_Pistol_heavy_02_F", 375],
		["hgun_PDW2000_F", 550],
		["SMG_02_F", 625],
		["SMG_05_F", 700],
		["SMG_01_F", 1000],
		["arifle_AKS_F", 1125],
		["arifle_SDAR_F", 500],
		["arifle_Mk20C_F", 1000],
		["arifle_Mk20_F", 1250],
		["arifle_SPAR_01_blk_F", 1688],
		["arifle_SPAR_01_khk_F", 2263],
		["arifle_SPAR_01_snd_F", 1063],
		["arifle_TRG21_F", 1500],
		["arifle_TRG20_F", 1250],
		["arifle_CTAR_blk_F", 1500],
		["arifle_CTAR_ghex_F", 2000],
		["arifle_CTAR_hex_F", 2500],
		["arifle_Katiba_F", 1713],
		["arifle_Katiba_C_F", 1463],
		["arifle_MXC_F", 1875],
		["arifle_MXC_Black_F", 2500],
		["arifle_MXC_khk_F", 3125],
		["arifle_MX_F", 2000],
		["arifle_MX_Black_F", 2625],
		["arifle_MX_khk_F", 3250],
		["arifle_MX_SW_F", 2125],
		["arifle_MX_SW_Black_F", 2875],
		["arifle_MX_SW_khk_F", 3375],
		["arifle_MXM_F", 2625],
		["arifle_MXM_Black_F", 3250],
		["arifle_MXM_khk_F", 3875],
		["srifle_DMR_07_blk_F", 3125],
		["srifle_DMR_07_ghex_F", 3750],
		["srifle_DMR_07_hex_F", 4375],
		["srifle_DMR_01_F", 6375],
		["srifle_EBR_F", 7875],
		["srifle_DMR_03_khaki_F", 9125],
		["srifle_DMR_03_tan_F", 9125],
		["srifle_DMR_03_multicam_F", 9125],
		["srifle_DMR_03_woodland_F", 9125],
		["srifle_DMR_06_camo_F", 7250],
		["srifle_DMR_06_olive_F", 7250],
		["srifle_DMR_06_camo_khs_F", 7250],
		["arifle_AK12_F", 3000],
		["arifle_AKM_F", 3500],
		["arifle_SPAR_03_blk_F", 10375],
		["arifle_SPAR_03_khk_F", 10375],
		["arifle_SPAR_03_snd_F", 10375],
		["10Rnd_9x21_Mag", 63],
		["16Rnd_9x21_Mag", 63],
		["16Rnd_9x21_red_Mag", 75],
		["16Rnd_9x21_green_Mag", 75],
		["16Rnd_9x21_yellow_Mag", 75],
		["9Rnd_45ACP_Mag", 88],
		["11Rnd_45ACP_Mag", 100],
		["6Rnd_45ACP_Cylinder", 75],
		["30Rnd_9x21_Mag", 125],
		["30Rnd_9x21_Mag_SMG_02", 125],
		["30Rnd_9x21_Mag_SMG_02_Tracer_Green", 150],
		["30Rnd_9x21_Mag_SMG_02_Tracer_Red", 150],
		["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", 150],
		["30Rnd_9x21_Green_Mag", 150],
		["30Rnd_9x21_Red_Mag", 150],
		["30Rnd_9x21_Yellow_Mag", 150],
		["30Rnd_45ACP_Mag_SMG_01", 100],
		["30Rnd_45ACP_Mag_SMG_01_Tracer_Green", 125],
		["30Rnd_545x39_Mag_F", 100],
		["30Rnd_545x39_Mag_Tracer_Green_F", 125],
		["30Rnd_545x39_Mag_Tracer_F", 125],
		["30Rnd_545x39_Mag_Green_F", 113],
		["20Rnd_556x45_UW_mag", 125],
		["30Rnd_556x45_Stanag", 138],
		["30Rnd_556x45_Stanag_Tracer_Green", 163],
		["30Rnd_556x45_Stanag_Tracer_Red", 163],
		["30Rnd_556x45_Stanag_Tracer_Yellow", 163],
		["30Rnd_556x45_Stanag_green", 150],
		["30Rnd_556x45_Stanag_red", 150],
		["30Rnd_580x42_Mag_F", 150],
		["30Rnd_580x42_Mag_Tracer_F", 175],
		["30Rnd_65x39_caseless_green", 188],
		["30Rnd_65x39_caseless_mag", 188],
		["30Rnd_65x39_caseless_green_mag_Tracer", 213],
		["30Rnd_65x39_caseless_mag_Tracer", 213],
		["30Rnd_762x39_Mag_F", 225],
		["30Rnd_762x39_Mag_Tracer_Green_F", 300],
		["30Rnd_762x39_Mag_Tracer_F", 300],
		["30Rnd_762x39_Mag_Green_F", 250],
		["10Rnd_762x54_Mag", 250],
		["20Rnd_762x51_Mag", 375],
		["SmokeShell", 38],
		["O_IR_Grenade", 38],
		["acc_flashlight", 75],
		["optic_Aco", 100],
		["optic_ACO_grn", 100],
		["optic_Aco_smg", 100],
		["optic_ACO_grn_smg", 100],
		["muzzle_snds_L", 125],
		["optic_Holosight_blk_F", 125],
		["optic_Holosight", 125],
		["optic_Holosight_khk_F", 125],
		["optic_Holosight_smg_blk_F", 125],
		["optic_Holosight_smg", 125],
		["muzzle_snds_acp", 150],
		["acc_pointer_IR", 150],
		["muzzle_snds_m_snd_F", 188],
		["muzzle_snds_M", 200],
		["optic_Arco_blk_F", 200],
		["optic_Arco", 200],
		["optic_Arco_ghex_F", 200],
		["optic_Hamr", 200],
		["optic_Hamr_khk_F", 200],
		["optic_MRCO", 200],
		["muzzle_snds_m_khk_F", 213],
		["muzzle_snds_H", 225],
		["bipod_01_F_snd", 225],
		["bipod_01_F_blk", 225],
		["bipod_01_F_mtp", 225],
		["bipod_02_F_blk", 225],
		["bipod_02_F_tan", 225],
		["bipod_02_F_hex", 225],
		["bipod_03_F_blk", 225],
		["bipod_03_F_oli", 225],
		["bipod_01_F_khk", 225],
		["muzzle_snds_H_khk_F", 250],
		["optic_ERCO_blK_F", 250],
		["optic_ERCO_snd_F", 250],
		["optic_ERCO_khk_F", 250],
		["muzzle_snds_H_MG", 300],
		["muzzle_snds_H_MG_blk_F", 350],
		["optic_DMS", 375],
		["optic_DMS_ghex_F", 375],
		["muzzle_snds_H_MG_khk_F", 400],
		["muzzle_snds_B_snd_F", 500],
		["muzzle_snds_B", 550],
		["muzzle_snds_B_khk_F", 600],
		["optic_AMS_snd", 600],
		["optic_AMS_khk", 600],
		["optic_AMS", 600],
		["optic_KHS_old", 625],
		["optic_KHS_blk", 625],
		["optic_KHS_hex", 625],
		["optic_KHS_tan", 625],
		["muzzle_snds_65_TI_blk_F", 750],
		["muzzle_snds_65_TI_hex_F", 875],
		["muzzle_snds_65_TI_ghex_F", 875]
	];
	__CONST__(life_weapon_shop_array,life_weapon_shop_array);

	//cost of retrieving vehicle from garage
	life_garage_prices =

	[
		["C_Quadbike_01_F", 100],
		["C_Hatchback_01_F", 100],
		["C_Offroad_01_F", 125],
		["C_SUV_01_F", 100],
		["I_C_Offroad_02_unarmed_F", 100],
		["C_Offroad_02_unarmed_F", 100],
		["O_LSV_02_unarmed_F", 200],

		["C_Van_01_transport_F", 300],
		["C_Van_01_box_F", 360],

		["I_Truck_02_covered_F", 791],
		["I_Truck_02_transport_F", 100],


		["O_Truck_03_transport_F", 932],
		["O_Truck_03_covered_F", 970],

		["O_Truck_03_device_F", 1645],

		["B_Truck_01_transport_F", 1932],
		["B_Truck_01_covered_F", 2001],
		["B_Truck_01_mover_F", 2500],
		["B_Truck_01_box_F", 2070],


		["C_Heli_Light_01_civil_F", 1250],
		["O_Heli_Light_02_unarmed_F", 2500],
		["I_Heli_Transport_02_F", 4500],
		["C_Plane_Civil_01_F", 2500],
		["C_Plane_Civil_01_racing_F", 3000],

		["B_Heli_Transport_03_unarmed_F", 7000],
		["B_Heli_Light_01_F", 1750],
		["I_Heli_light_03_unarmed_F", 2750],
		["B_UAV_01_F", 0],
		["C_Rubberboat", 100],
		["C_Boat_Civil_01_F", 200],
		["C_Boat_Transport_02_F", 150],
		["C_Scooter_Transport_01_F", 100],
		["I_SDV_01_F", 700]
	];

	__CONST__(life_garage_prices,life_garage_prices);

	//sales prices of vehicles
	life_garage_sell =
	[
		["C_Quadbike_01_F", 10],
		["C_Hatchback_01_F", 1000],
		["C_Offroad_01_F", 3125],
		["C_SUV_01_F", 2500],
		["I_C_Offroad_02_unarmed_F", 2250],
		["C_Offroad_02_unarmed_F", 2375],
		["O_LSV_02_unarmed_F", 5000],

		["C_Van_01_transport_F", 7500],
		["C_Van_01_box_F", 9000],

		["I_Truck_02_covered_F", 19775],
		["I_Truck_02_transport_F", 375],


		["O_Truck_03_transport_F", 23288],
		["O_Truck_03_covered_F", 24258],

		["O_Truck_03_device_F", 41125],

		["B_Truck_01_transport_F", 48300],
		["B_Truck_01_covered_F", 50025],
		["B_Truck_01_mover_F", 62500],
		["B_Truck_01_box_F", 51750],


		["C_Heli_Light_01_civil_F", 31250],
		["O_Heli_Light_02_unarmed_F", 62500],
		["I_Heli_Transport_02_F", 112500],
		["C_Plane_Civil_01_F", 62500],
		["C_Plane_Civil_01_racing_F", 75000],

		["B_Heli_Transport_03_unarmed_F", 175000],
		["B_Heli_Light_01_F", 43750],
		["I_Heli_light_03_unarmed_F", 68750],


		["C_Rubberboat", 1750],
		["C_Boat_Civil_01_F", 5000],
		["C_Boat_Transport_02_F", 3750],
		["C_Scooter_Transport_01_F", 1250],
		["I_SDV_01_F", 17500]
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
		["codebreaker", 1200],
		["spikeStrip", 2000],
		["blastingcharge", 2500],
		["boltcutter", 15],
		["crocodile", 600],
		["crocshoes", 1200],
		["cocaine", 125],
		["cocainep", 250],
		["cannabis", 98],
		["marijuana", 195],
		["markedmoney", 4000],
		["weaponbag", 3500],
		["lsd", 225]
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
