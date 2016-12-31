/*
	File: fn_varToStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Takes the long-name (variable) and returns a display name for our
	virtual item.
*/
private["_var"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
if(_var == "") exitWith {""};

switch (_var) do
{
	//Virtual Inventory Items
	case "life_inv_oilu": {(localize "STR_Item_OilU")};
	case "life_inv_oilp": {(localize "STR_Item_OilP")};
	case "life_inv_heroinu": {(localize "STR_Item_HeroinU")};
	case "life_inv_heroinp": {(localize "STR_Item_HeroinP")};
	case "life_inv_cannabis": {(localize "STR_Item_Cannabis")};
	case "life_inv_marijuana": {(localize "STR_Item_Marijuana")};
	case "life_inv_apple": {(localize "STR_Item_Apple")};
	case "life_inv_potato": {"Potato"};
	case "life_inv_rabbit": {(localize "STR_Item_RabbitMeat")};
	case "life_inv_salema": {(localize "STR_Item_SalemaMeat")};
	case "life_inv_ornate": {(localize "STR_Item_OrnateMeat")};
	case "life_inv_mackerel": {(localize "STR_Item_MackerelMeat")};
	case "life_inv_tuna": {(localize "STR_Item_TunaMeat")};
	case "life_inv_mullet": {(localize "STR_Item_MulletMeat")};
	case "life_inv_catshark": {(localize "STR_Item_CatSharkMeat")};
	case "life_inv_turtle": {(localize "STR_Item_TurtleMeat")};
	case "life_inv_fishingpoles": {(localize "STR_Item_FishingPole")};
	case "life_inv_water": {(localize "STR_Item_WaterBottle")};
	case "life_inv_coffee": {(localize "STR_Item_Coffee")};
	case "life_inv_turtlesoup": {(localize "STR_Item_TurtleSoup")};
	case "life_inv_donuts": {(localize "STR_Item_Donuts")};
	case "life_inv_fuelE": {(localize "STR_Item_FuelE")};
	case "life_inv_fuelF": {(localize "STR_Item_FuelF")};
	case "life_inv_pickaxe": {(localize "STR_Item_Pickaxe")};
	case "life_inv_copperore": {(localize "STR_Item_CopperOre")};
	case "life_inv_ironore": {(localize "STR_Item_IronOre")};
	case "life_inv_ironr": {(localize "STR_Item_IronIngot")};
	case "life_inv_copperr": {(localize "STR_Item_CopperIngot")};
	case "life_inv_sand": {(localize "STR_Item_Sand")};
	case "life_inv_salt": {(localize "STR_Item_Salt")};
	case "life_inv_saltr": {(localize "STR_Item_SaltR")};
	case "life_inv_glass": {(localize "STR_Item_Glass")};
	case "life_inv_diamond": {(localize "STR_Item_DiamondU")};
	case "life_inv_diamondr": {(localize "STR_Item_DiamondC")};
	case "life_inv_tbacon": {(localize "STR_Item_TBacon")};
	case "life_inv_redgull": {(localize "STR_Item_RedGull")};
	case "life_inv_lockpick": {(localize "STR_Item_Lockpick")};
	case "life_inv_peach": {(localize "STR_Item_Peach")};
	case "life_inv_coke": {(localize "STR_Item_CocaineU")};
	case "life_inv_cokep": {(localize "STR_Item_CocaineP")};
	case "life_inv_spikeStrip": {(localize "STR_Item_SpikeStrip")};
	case "life_inv_rock": {(localize "STR_Item_Rock")};
	case "life_inv_cement": {(localize "STR_Item_CementBag")};
	case "life_inv_goldbar": {(localize "STR_Item_GoldBar")};
	case "life_inv_blastingcharge": {(localize "STR_Item_BCharge")};
	case "life_inv_boltcutter": {(localize "STR_Item_BCutter")};
	case "life_inv_defusekit": {(localize "STR_Item_DefuseKit")};
	case "life_inv_storagesmall": {(localize "STR_Item_StorageBS")};
	case "life_inv_storagebig": {(localize "STR_Item_StorageBL")};
	case "life_inv_zipties": {"Zipties"};

	case "life_inv_roadcone": {"Road Cone"};
	case "life_inv_roadbarrier": {"Road Barrier"};
	case "life_inv_tapesign": {"Tape Barrier"};
	case "life_inv_arrowleft": {"Left Arrow"};
	case "life_inv_arrowright": {"Right Arrow"};

	case "life_inv_lsd": {"Hermit LSD"};
	case "life_inv_frogleg": {"Frog Leg"};

	case "life_inv_wood": {"Log"};
	case "life_inv_woodp": {"Plank"};

	case "life_inv_gyro": {"Gyro"};
	case "life_inv_redburger": {"BlueBurger"};
	case "life_inv_chips": {"Chips"};
	case "life_inv_fries": {"Fries"};
	case "life_inv_icecream": {"Ice Cream"};
	case "life_inv_ratkebab": {"Rat Kebab"};
	case "life_inv_medlight": {"Medic Chemlight"};
	case "life_inv_lollipop": {"Lollipop"};

	//Ship Wreck
	case "life_inv_roundobject": {"Round Object"};
	case "life_inv_squareobject":  {"Square Object"};
	case "life_inv_brokenstatue": {"Broken Statue"};
	case "life_inv_oldpottery": {"Broken Pottery"};
	case "life_inv_stonetablet": {"Stone Tablet"};
	case "life_inv_brokenbell": {"Broken Bell"};
	case "life_inv_emptybottle": {"Glass Bottle"};
	case "life_inv_strangeobject": {"Strange Object"};
	case "life_inv_rustediron": {"Rusted Metal"};
	case "life_inv_foolsgold": {"Fools Gold"};
	case "life_inv_oldgoldbar": {"Old Gold Bar"};
	case "life_inv_excavator": {"Excavator"};

	case "life_inv_chicken": {"Chicken"};
	case "life_inv_goat": {"Goat"};
	case "life_inv_sheep": {"Lamb"};
	case "life_inv_dog": {"Dog"};

	//Drink
	case "life_inv_beer": {"Beer"};
	case "life_inv_whisky": {"Cardoso's Whiksy"};
	case "life_inv_shandy": {"Ciaran's Secret Shandy"};
	case "life_inv_breathalyzer": {"Breathalyzer"};

	case "life_inv_ephedrine": {"Ephedrine Barrel"};
	case "life_inv_crystalmeth": {"Crystal Meth Box"};
	case "life_inv_cider": {"Cider Bottle"};

	case "life_inv_clam": {"Clam"};
	case "life_inv_pearl": {"Pearl"};

	case "life_inv_parkingticket": {"Parking Ticket"};
	case "life_inv_marmite": {"Marmite"};

	case "life_inv_tapesignsm": {"Light Barrier"};
	case "life_inv_tapesignwarning": {"Warning Barrier"};
	case "life_inv_portablebarrier": {"Portable Barrier"};

	case "life_inv_acid": {"Acid"};
	case "life_inv_ecstacy": {"Ecstacy"};

	case "life_inv_codebreaker": {"Industrial Code Breaker"};
	case "life_inv_markedmoney": {"Marked Money Bag"};
	case "life_inv_weaponbag": {"Illegal Weapons Bag"};

  case "life_inv_defib": {"Defibrillator"};

	//Tanoa items
	case "life_inv_cocoa": {(localize "STR_Item_Cocoa")};
	case "life_inv_chocolate": {(localize "STR_Item_Chocolate")};
	case "life_inv_log": {(localize "STR_Item_Log")};
	case "life_inv_lumber": {(localize "STR_Item_Lumber")};
	case "life_inv_bbanana": {(localize "STR_Item_BBanana")};
	case "life_inv_sbanana": {(localize "STR_Item_SBanana")};
	case "life_inv_sugarcane": {(localize "STR_Item_Sugarcane")};
	case "life_inv_sugar": {(localize "STR_Item_Sugar")};
	case "life_inv_tobaccoleaves": {(localize "STR_Item_Tobaccoleaves")};
	case "life_inv_tobacco": {(localize "STR_Item_Tobacco")};
	case "life_inv_cigarette": {(localize "STR_Item_Cigarette")};
	case "life_inv_mango": {(localize "STR_Item_Mango")};
	case "life_inv_orange": {(localize "STR_Item_Orange")};
	case "life_inv_kiwi": {(localize "STR_Item_Kiwi")};
	case "life_inv_coconut": {(localize "STR_Item_Coconut")};
	case "life_inv_crocodile": {(localize "STR_Item_Crocodile")};
	case "life_inv_crocshoes": {(localize "STR_Item_CrocShoes")};


	//License Block
	case "license_civ_driver": {(localize "STR_License_Driver")};
	case "license_civ_air": {(localize "STR_License_Pilot")};
	case "license_civ_heroin": {(localize "STR_License_Heroin")};
	case "license_civ_oil": {(localize "STR_License_Oil")};
	case "license_civ_dive": {(localize "STR_License_Diving")};
	case "license_civ_boat": {(localize "STR_License_Boat")};
	case "license_civ_gun": {(localize "STR_License_Firearm")};
	case "license_cop_air": {(localize "STR_License_Pilot")};
	case "license_cop_swat": {(localize "STR_License_Swat")};
	case "license_cop_cg": {(localize "STR_License_CG")};
	case "license_civ_rebel": {(localize "STR_License_Rebel")};
	case "license_civ_truck": {(localize "STR_License_Truck")};
	case "license_civ_bus": {(localize "STR_License_Bus")};
	case "license_civ_diamond": {(localize "STR_License_Diamond")};
	case "license_civ_copper": {(localize "STR_License_Copper")};
	case "license_civ_iron": {(localize "STR_License_Iron")};
	case "license_civ_sand": {(localize "STR_License_Sand")};
	case "license_civ_salt": {(localize "STR_License_Salt")};
	case "license_civ_coke": {(localize "STR_License_Cocaine")};
	case "license_civ_marijuana": {(localize "STR_License_Marijuana")};
	case "license_civ_cement": {(localize "STR_License_Cement")};
	case "license_med_air": {(localize "STR_License_Pilot")};
	case "license_civ_home": {(localize "STR_License_Home")};
	case "license_civ_event": {(localize "STR_License_Event")};
	case "license_civ_bounty": {(localize "STR_License_Bounty")};
	case "license_civ_bus": {(localize "STR_License_Bus")};
	case "license_civ_meth": {"Meth Training"};
	case "license_civ_taxi": {"Taxi License"};
	case "license_civ_arac": {"ARAC License"};

	case "profession_apple": {"Apple Picking"};
	case "profession_potato": {"Potato Digging"};
	case "profession_peach": {"Peach Picking"};
	case "profession_heroin": {"Heroin Training"};
	case "profession_marijuana": {"Marijuana Training"};
	case "profession_oil": {"Oil Training"};
	case "profession_coke": {"Coke Training"};
	case "profession_diamond": {"Diamond Training"};
	case "profession_copper": {"Copper Training"};
	case "profession_iron": {"Iron Training"};
	case "profession_sand": {"Sand Training"};
	case "profession_salt": {"Salt Training"};
	case "profession_cement": {"Cement Training"};
	case "profession_bounty": {"Bountyhunter Skill"};
	case "profession_meth": {"Meth Cooking"};
	case "profession_boatwreck": {"Boatwreck Searching"};
	case "profession_lsd": {"LSD Training"};
	case "profession_impounding": {"Impounding"};
	case "profession_crushing": {"Crushing"};
	case "profession_reviving": {"Reviving"};
	case "profession_frogleg": {"Frog Catching"};
	case "profession_cider": {"Cider Brewing"};

	//Tanoa professions
	case "profession_chocolate": {"Chocolate Making"};
	case "profession_logging": {"Lumber Logging"};
	case "profession_banana": {"Banana Bending"};
	case "profession_sugar": {"Sugar Refining"};
	case "profession_cigarette": {"Cigarette Making"};
	case "profession_mango": {"Mango Picking"};
	case "profession_orange": {"Orange Picking"};
	case "profession_kiwi": {"Kiwi Picking"};
	case "profession_coconut": {"Coconut Picking"};
	case "profession_crocodile": {"Crocodile Shoemaking"};

};
