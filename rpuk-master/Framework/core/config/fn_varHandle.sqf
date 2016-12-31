/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "potato": {"life_inv_potato"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "money": {"RPUK_dosh"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "cocaine": {"life_inv_coke"};
			case "cocainep": {"life_inv_cokep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "zipties": {"life_inv_zipties"};
			case "medlight": {"life_inv_medlight"};

			//Ship Wreck Items
			case "roundobject": {"life_inv_roundobject"};
			case "squareobject":  {"life_inv_squareobject"};
			case "brokenstatue": {"life_inv_brokenstatue"};
			case "oldpottery": {"life_inv_oldpottery"};
			case "stonetablet": {"life_inv_stonetablet"};
			case "brokenbell": {"life_inv_brokenbell"};
			case "emptybottle": {"life_inv_emptybottle"};
			case "strangeobject": {"life_inv_strangeobject"};
			case "rustediron": {"life_inv_rustediron"};
			case "foolsgold": {"life_inv_foolsgold"};
			case "oldgoldbar": {"life_inv_oldgoldbar"};
			case "excavator": {"life_inv_excavator"};

			case "gyro": {"life_inv_gyro"};
			case "redburger": {"life_inv_redburger"};
			case "chips": {"life_inv_chips"};
			case "fries": {"life_inv_fries"};
			case "icecream": {"life_inv_icecream"};
			case "ratkebab": {"life_inv_ratkebab"};

			case "lollipop": {"life_inv_lollipop"};


			case "chicken": {"life_inv_chicken"};
			case "goat": {"life_inv_goat"};
			case "sheep": {"life_inv_sheep"};
			case "dog": {"life_inv_sheep"};

			case "roadcone": {"life_inv_roadcone"};
			case "roadbarrier": {"life_inv_roadbarrier"};
			case "tapesign": {"life_inv_tapesign"};
			case "arrowleft": {"life_inv_arrowleft"};
			case "arrowright": {"life_inv_arrowright"};

			case "wood": {"life_inv_wood"};
			case "woodp": {"life_inv_woodp"};

			case "frogleg": {"life_inv_frogleg"};
			case "lsd": {"life_inv_lsd"};

			//Beer

			case "beer": {"life_inv_beer"};
			case "whisky": {"life_inv_whisky"};
			case "shandy": {"life_inv_shandy"};
			case "breathalyzer": {"life_inv_breathalyzer"};

			case "ephedrine": {"life_inv_ephedrine"};
			case "crystalmeth": {"life_inv_crystalmeth"};
			case "cider": {"life_inv_cider"};
			case "chips": {"life_inv_chips"};

			case "clam": {"life_inv_clam"};
			case "pearl": {"life_inv_pearl"};

			case "parkingticket": {"life_inv_parkingticket"};
			case "marmite": {"life_inv_marmite"};

			case "tapesignsm": {"life_inv_tapesignsm"};
			case "tapesignwarning": {"life_inv_tapesignwarning"};
			case "portablebarrier": {"life_inv_portablebarrier"};

			case "ecstacy": {"life_inv_ecstacy"};
			case "acid": {"life_inv_acid"};

			case "codebreaker": {"life_inv_codebreaker"};
			case "markedmoney": {"life_inv_markedmoney"};
			case "weaponbag": {"life_inv_weaponbag"};

		  //Cocoa Job
		  case "cocoa": {"life_inv_cocoa"};
		  case "chocolate": {"life_inv_chocolate"};

		  //Tree Job
		  case "log": {"life_inv_log"};
		  case "lumber": {"life_inv_lumber"};

		  //Banana Job
		  case "bbanana": {"life_inv_bbanana"};
		  case "sbanana": {"life_inv_sbanana"};

		  //Sugar Job
		  case "sugarcane": {"life_inv_sugarcane"};
		  case "sugar": {"life_inv_sugar"};

		  //Tobacco
		  case "tobaccoleaves": {"life_inv_tobaccoleaves"};
		  case "tobacco": {"life_inv_tobacco"};
		  case "cigarette": {"life_inv_cigarette"};

			//Croc Shoes
		  case "crocodile": {"life_inv_crocodile"};
		  case "crocshoes": {"life_inv_crocshoes"};
			

		  //Hobo Jobs
		  case "mango": {"life_inv_mango"};
		  case "orange": {"life_inv_orange"};
		  case "kiwi": {"life_inv_kiwi"};
		  case "coconut": {"life_inv_coconut"};
		  
		  
		  case "defib": {"life_inv_defib"};
		};
	};

	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_potato": {"potato"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_roadcone": {"roadcone"};
			case "life_inv_roadbarrier": {"roadbarrier"};
			case "life_inv_tapesign": {"tapesign"};
			case "life_inv_arrowleft": {"arrowleft"};
			case "life_inv_arrowright": {"arrowright"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_fuelF": {"fuelF"};
			case "RPUK_dosh": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_salt": {"salt"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_coke": {"cocaine"};
			case "life_inv_cokep": {"cocainep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_zipties": {"zipties"};
			case "life_inv_medlight": {"medlight"};
			case "life_inv_frogleg": {"frogleg"};
			case "life_inv_lsd": {"lsd"};

			//Ship Wreck Items
			case "life_inv_roundobject": {"roundobject"};
			case "life_inv_squareobject":  {"squareobject"};
			case "life_inv_brokenstatue": {"brokenstatue"};
			case "life_inv_oldpottery": {"oldpottery"};
			case "life_inv_stonetablet": {"stonetablet"};
			case "life_inv_brokenbell": {"brokenbell"};
			case "life_inv_emptybottle": {"emptybottle"};
			case "life_inv_strangeobject": {"strangeobject"};
			case "life_inv_rustediron": {"rustediron"};
			case "life_inv_foolsgold": {"foolsgold"};
			case "life_inv_oldgoldbar": {"oldgoldbar"};
			case "life_inv_excavator": {"excavator"};

			case "life_inv_gyro": {"gyro"};
			case "life_inv_redburger": {"redburger"};
			case "life_inv_chips": {"chips"};
			case "life_inv_fries": {"fries"};
			case "life_inv_icecream": {"icecream"};
			case "life_inv_ratkebab": {"ratkebab"};
			case "life_inv_lollipop": {"lollipop"};

			case "life_inv_chicken": {"chicken"};
			case "life_inv_goat": {"goat"};
			case "life_inv_sheep": {"sheep"};
			case "life_inv_dog": {"dog"};

			case "life_inv_wood": {"wood"};
			case "life_inv_woodp": {"woodp"};

			case "life_inv_beer": {"beer"};
			case "life_inv_whisky": {"whisky"};
			case "life_inv_shandy": {"shandy"};
			case "life_inv_breathalyzer": {"breathalyzer"};

			case "life_inv_ephedrine": {"ephedrine"};
			case "life_inv_crystalmeth": {"crystalmeth"};
			case "life_inv_cider": {"cider"};
			case "life_inv_chips": {"chips"};

			case "life_inv_clam": {"clam"};
			case "life_inv_pearl": {"pearl"};

			case "life_inv_parkingticket": {"parkingticket"};
			case "life_inv_marmite": {"marmite"};

			case "life_inv_tapesignsm": {"tapesignsm"};
			case "life_inv_tapesignwarning": {"tapesignwarning"};
			case "life_inv_portablebarrier": {"portablebarrier"};

			case "life_inv_ecstacy": {"ecstacy"};
			case "life_inv_acid": {"acid"};

			case "life_inv_codebreaker": {"codebreaker"};
			case "life_inv_markedmoney": {"markedmoney"};
			case "life_inv_weaponbag": {"weaponbag"};

			//Cocoa Job
			case "life_inv_cocoa": {"cocoa"};
			case "life_inv_chocolate": {"chocolate"};
			
			//Tree Job
			case "life_inv_log": {"log"};
			case "life_inv_lumber": {"lumber"};
			
			//Banana Job
			case "life_inv_bbanana": {"bbanana"};
			case "life_inv_sbanana": {"sbanana"};
			
			//Sugar Job
			case "life_inv_sugarcane": {"sugarcane"};
			case "life_inv_sugar": {"sugar"};
			
			//Tobacco
			case "life_inv_tobaccoleaves": {"tobaccoleaves"};
			case "life_inv_tobacco": {"tobacco"};
			case "life_inv_cigarette": {"cigarette"};
			
			//Hobo Jobs
			case "life_inv_mango": {"mango"};
			case "life_inv_orange": {"orange"};
			case "life_inv_kiwi": {"kiwi"};
			case "life_inv_coconut": {"coconut"};
			case "life_inv_crocodile": {"crocodile"};
			case "life_inv_crocshoes": {"crocshoes"};
			
			case "life_inv_defib": {"defib"};
		};
	};
};
