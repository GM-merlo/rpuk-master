/*
	File: fn_itemImage.sqf

	Author: Ciaran Langton
	Date: 2015-01-31 01:03:33
	Last Modified by: Ciaran Langton
	Last Modified time: 2015-05-31 18:11:06
*/
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "life_inv_oilu": {("icons\items\oil_unprocessed.paa")};
	case "life_inv_oilp": {("icons\items\oil_processed.paa")};
	case "life_inv_heroinu": {("icons\items\heroin_unprocessed.paa")};
	case "life_inv_heroinp": {("icons\items\heroin_processed.paa")};
	case "life_inv_cannabis": {("icons\items\cannabis.paa")};
	case "life_inv_marijuana": {("icons\items\marijuana.paa")};
	case "life_inv_apple": {("icons\items\apple.paa")};
	case "life_inv_potato": {("icons\items\potato.paa")};
	case "life_inv_rabbit": {("icons\items\meat.paa")};
	case "life_inv_salema": {("icons\items\fish.paa")};
	case "life_inv_ornate": {("icons\items\fish.paa")};
	case "life_inv_mackerel": {("icons\items\fish.paa")};
	case "life_inv_tuna": {("icons\items\fish.paa")};
	case "life_inv_mullet": {("icons\items\fish.paa")};
	case "life_inv_catshark": {("icons\items\fish.paa")};
	case "life_inv_turtle": {("icons\items\turtle.paa")};
	case "life_inv_fishingpoles": {("icons\items\fishingpoles.paa")};
	case "life_inv_water": {("icons\items\tea.paa")};
	case "life_inv_coffee": {("icons\items\coffee.paa")};
	case "life_inv_turtlesoup": {("icons\items\turtle_soup.paa")};
	case "life_inv_donuts": {("icons\items\donut.paa")};
	case "life_inv_fuelE": {("icons\items\fuel_can.paa")};
	case "life_inv_fuelF": {("icons\items\fuel_can.paa")};
	case "life_inv_pickaxe": {("icons\items\pickaxe.paa")};
	case "life_inv_copperore": {("icons\items\copper_ore.paa")};
	case "life_inv_ironore": {("icons\items\iron_ore.paa")};
	case "life_inv_ironr": {("icons\items\iron.paa")};
	case "life_inv_copperr": {("icons\items\copper.paa")};
	case "life_inv_sand": {("icons\items\sand.paa")};
	case "life_inv_salt": {("icons\items\salt_unprocessed.paa")};
	case "life_inv_saltr": {("icons\items\salt.paa")};
	case "life_inv_glass": {("icons\items\glass.paa")};
	case "life_inv_diamond": {("icons\items\diamond_unprocessed.paa")};
	case "life_inv_diamondr": {("icons\items\diamond.paa")};
	case "life_inv_tbacon": {("icons\items\bakedbeans.paa")};
	case "life_inv_redgull": {("icons\items\redgull.paa")};
	case "life_inv_lockpick": {("icons\items\lockpick.paa")};
	case "life_inv_peach": {("icons\items\peach.paa")};
	case "life_inv_coke": {("icons\items\cocain_unprocessed.paa")};
	case "life_inv_cokep": {("icons\items\cocain_processed.paa")};
	case "life_inv_spikeStrip": {("icons\items\spikestrip.paa")};
	case "life_inv_rock": {("icons\items\rock.paa")};
	case "life_inv_cement": {("icons\items\cement.paa")};
	case "life_inv_goldbar": {("icons\items\goldbar.paa")};
	case "life_inv_blastingcharge": {("icons\items\blastingcharge.paa")};
	case "life_inv_boltcutter": {("icons\items\boltcutter.paa")};
	case "life_inv_defusekit": {("icons\items\defusekit.paa")};
	case "life_inv_storagesmall": {("icons\items\storagesmall.paa")};
	case "life_inv_storagebig": {("icons\items\storagebig.paa")};

	case "life_inv_zipties": {("icons\items\zipties.paa")};
	case "medlight": {("icons\items\strangeobject.paa")};
	case "life_inv_frogleg": {("icons\items\froglegs.paa")};
	case "life_inv_lsd": {("icons\items\LSD.paa")};

	case "life_inv_roadcone": {("icons\items\roadcone.paa")};
	case "life_inv_roadbarrier": {("icons\items\roadbarrier.paa")};
	case "life_inv_portablebarrier": {("icons\items\roadbarrier.paa")};
	case "life_inv_tapesign": {("icons\items\tapebarrier.paa")};
	case "life_inv_tapesignsm": {("icons\items\roadbarrier.paa")};
	case "life_inv_tapesignwarning": {("icons\items\roadbarrier.paa")};
	case "life_inv_arrowleft": {("icons\items\leftarrow.paa")};
	case "life_inv_arrowright": {("icons\items\rightarrow.paa")};

	//Ship Wreck Items
	case "life_inv_roundobject": {("icons\items\roundobject.paa")};
	case "life_inv_squareobject":  {("icons\items\squareobject.paa")};
	case "life_inv_brokenstatue": {("icons\items\brokenstatue.paa")};
	case "life_inv_oldpottery": {("icons\items\oldpottery.paa")};
	case "life_inv_stonetablet": {("icons\items\stonetablet.paa")};
	case "life_inv_brokenbell": {("icons\items\brokenbell.paa")};
	case "life_inv_emptybottle": {("icons\items\emptybottle.paa")};
	case "life_inv_strangeobject": {("icons\items\strangeobject.paa")};
	case "life_inv_rustediron": {("icons\items\rustediron.paa")};
	case "life_inv_foolsgold": {("icons\items\foolsgold.paa")};
	case "life_inv_oldgoldbar": {("icons\items\oldgoldbar.paa")};
	case "life_inv_excavator": {("icons\items\excavator.paa")};

	case "life_inv_gyro": {("icons\items\redburger.paa")};
	case "life_inv_redburger": {("icons\items\redburger.paa")};
	case "life_inv_chips": {("icons\items\chips.paa")};
	case "life_inv_fries": {("icons\items\fries.paa")};
	case "life_inv_icecream": {("icons\items\icecream.paa")};
	case "life_inv_ratkebab": {("icons\items\ratkebab.paa")};
	case "life_inv_lollipop": {("icons\items\lollipop.paa")};

	case "life_inv_wood": {("icons\items\wood.paa")};
	case "life_inv_woodp": {("icons\items\woodplank.paa")};

	case "life_inv_beer": {("icons\items\beer.paa")};
	case "life_inv_whisky": {("icons\items\whisky.paa")};
	case "life_inv_shandy": {("icons\items\shandy.paa")};
	case "life_inv_breathalyzer": {("icons\items\breathalyzer.paa")};

	case "life_inv_chicken": {("icons\items\meat.paa")};
	case "life_inv_goat": {("icons\items\meat.paa")};
	case "life_inv_sheep": {("icons\items\meat.paa")};
	case "life_inv_dog": {("icons\items\meat.paa")};

	case "life_inv_ephedrine": {("icons\items\ephedrine.paa")};
	case "life_inv_crystalmeth": {("icons\items\crystalmeth.paa")};
	case "life_inv_cider": {("icons\items\cider.paa")};

	case "life_inv_clam": {("icons\items\clam.paa")};
	case "life_inv_pearl": {("icons\items\pearl.paa")};

	case "life_inv_parkingticket": {("icons\items\parkingticket.paa")};
	case "life_inv_marmite": {("icons\items\marmite.paa")};

	case "life_inv_acid": {("icons\items\acid.paa")};
	case "life_inv_ecstacy": {("icons\items\ecstacy.paa")};

	case "life_inv_codebreaker": {("icons\items\codebreaker.paa")};
	case "life_inv_markedmoney": {("icons\money.paa")};
	case "life_inv_weaponbag": {("icons\items\weaponbag.paa")};

  //New Tanoa items
	case "life_inv_cocoa": {("icons\items\cocoa.paa")};
	case "life_inv_chocolate": {("icons\items\chocolate.paa")};
	case "life_inv_log": {("icons\items\wood.paa")};
	case "life_inv_lumber": {("icons\items\woodplanks.paa")};
	case "life_inv_bbanana": {("icons\items\bbanana.paa")};
	case "life_inv_sbanana": {("icons\items\sbanana.paa")};
	case "life_inv_sugarcane": {("icons\items\sugarcane.paa")};
	case "life_inv_sugar": {("icons\items\sugar.paa")};
	case "life_inv_tobaccoleaves": {("icons\items\leaf.paa")};
	case "life_inv_tobacco": {("icons\items\tobacco.paa")};
	case "life_inv_cigarette": {("icons\items\cigarette.paa")};
	case "life_inv_mango": {("icons\items\mango.paa")};
	case "life_inv_orange": {("icons\items\orange.paa")};
	case "life_inv_kiwi": {("icons\items\kiwi.paa")};
	case "life_inv_coconut": {("icons\items\coconut.paa")};
	case "life_inv_crocodile": {("icons\items\crocodile.paa")};
	case "life_inv_crocshoes": {("icons\items\crocs.paa")};
	case "life_inv_defib": {("icons\items\defib.paa")};

	default {("")};
};
