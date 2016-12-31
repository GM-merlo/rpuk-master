#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
/*
	File: fn_configuration.sqf
	Author: Ciaran Langton
	Description:
	Configuration for the serverside files.
*/

//Load the other config.
[] call compile PreprocessFileLineNumbers "core\configuration.sqf";

//Gang area Configs
//ID - Outer Marker - Name to go on screen - group owning - capture process number/100 - group capturing - Text marker - Paycheck
life_config_gangArea = [
	[0,"capture_0","Rebel Outpost #1",objNull,100,objNull,"capture_0_text",4000],
	[0,"capture_1","Rebel Outpost #2",objNull,100,objNull,"capture_1_text",2000],
	[0,"capture_2","Rebel Outpost #3",objNull,100,objNull,"capture_2_text",4000]
];

publicVariable "life_config_gangArea";

//Federal bank positions
private _bankPositions = switch (worldName) do {
	case "Altis": {[[7916.62,16150.4,3.71677],[7910.17,16143.5,3.74208],[7903.93,16138.2,3.88979],[7900.88,16143.5,3.84566],
	[7904.12,16146.5,3.77569],[7921.88,16154,3.61301],[7916.09,16156.9,3.67271],[7911.3,16155.2,3.73032],
	[7916.45,16157,0.333199],[7921.92,16154.2,0.271629],[7916.4,16149.2,0.383453],[7904.65,16146.5,0.432854],
	[7910.04,16143.8,0.408104],[7904.02,16138,0.560837],[7900.96,16143.9,0.511772]]};
	case "Stratis": {[]};
	case "Tanoa": {[
		[10018.3,11798.4,3.94705],[10018.2,11798.3,0.613098],[10018.3,11789.9,0.598572],
		[10018.2,11789.2,3.93225],[10018.3,11805.1,0.60199],[10018.3,11805,3.9364],
		[10045.9,11787.5,3.92731],[10045.5,11802.5,0.612335],[10045.9,11787.3,0.593201],
		[10046.1,11802.4,3.94629],[10045.5,11784.7,3.93677],[10045.8,11785,0.600372],
		[10018.2,11779.9,3.93918],[10018.2,11779.7,0.60556],[10012.4,11801.8,3.94687],
		[10012.4,11786.2,3.94702],[10012.4,11785.9,0.613098],[10012.4,11783.7,0.613098],
		[10050.3,11791.3,0.602325],[10012.4,11783.3,3.94705],[10012.1,11805.3,0.612823],
		[10050.4,11799.8,0.612335],[10051.5,11793.9,3.93658],[10051.5,11789.3,3.93628],
		[10051,11784.2,3.94177],[10050.4,11806.6,0.611176],[10050.8,11806.5,3.94406],
		[10050.2,11780.9,0.611359]
	]};
};


//Random bank position
fed_bank setPosATL (selectRandom _bankPositions);

life_jackpot = [0,0,0]; //Config our jackpot array.

life_item_modifier = .02;

//Mayor things.
life_lastBallotQueryTime = -1;
life_lastBallotQueryResult = [];

//Auction Things
life_lastAuctionQueryTime = -1;
life_lastAuctionQueryResult = [];

//Buildable Things
life_placedobjects = [];

//Player reporting tools
life_sessionPlayers = [];

if(isDedicated) then {
	life_wilcorank = 0;
	life_nhsrank = 0;
	life_plodrank = 0;
	life_samaritan = 0;
	life_capture_point = -1;
};

life_professionCfg = [

	//New Tanoa professions
	["profession_cocoa","civ"],
	["profession_banana","civ"],
	["profession_wood","civ"],
	["profession_sugar","civ"],
	["profession_tobacco","civ"],
	["profession_mango","civ"],
	["profession_orange","civ"],
	["profession_kiwi","civ"],
	["profession_coconut","civ"],
	["profession_crocodile","civ"],

	//Other professions
	["profession_apple","civ"],
	["profession_potato","civ"],
	["profession_peach","civ"],
	["profession_heroin","civ"],
	["profession_marijuana","civ"],
	["profession_oil","civ"],
	["profession_coke","civ"],
	["profession_diamond","civ"],
	["profession_copper","civ"],
	["profession_iron","civ"],
	["profession_sand","civ"],
	["profession_salt","civ"],
	["profession_cement","civ"],
	["profession_bounty","civ"],
	["profession_meth","civ"],
	["profession_boatwreck","civ"],
	["profession_cider","civ"],
	["profession_lsd","civ"],
	["profession_frogleg","civ"],
	["profession_impounding","cop"],
	["profession_crushing","cop"],
	["profession_reviving","med"]
];
__CONST__(life_professionCfg,life_professionCfg);


/*
	Sell / buy arrays
*/
dynamic_sell_array =
[
		["lockpick", 5],
		["kiwi", 3],
		["mango", 4],
		["goldbar", 30000],
		["salema", 13],
		["ornate", 12],
		["mackerel", 13],
		["mullet", 15],
		["tuna", 16],
		["catshark", 19],
		["coconut", 5],
		["crocshoes", 1200],
		["apple", 3],
		["copper_r", 150],
		["iron_r", 140],
		["diamondc", 250],
		["chocolate", 10],
		["tobaccoleaves", 30],
		["tobacco", 50],
		["cigarette", 130],
		["bbanana", 60],
		["lumber", 120],
		["sugar", 50],
		["frogleg", 25],
		["cocainep", 250],
		["marijuana", 195],
		["markedmoney", 4000],
		["weaponbag", 3500],
		["lsd", 225]

];
__CONST__(max_sell_array,dynamic_sell_array);

dynamic_buy_array =
[
	["water", 3],
	["rabbit", 5],
	["tbacon", 5],
	["marmite", 5],
	["redburger", 7],
	["crisps", 3],
	["chips", 5],
	["icecream", 2],
	["beer", 2],
	["Shandy", 2],
	["whiskey", 10],
	["candy", 1],
	["ratkebab", 5],
	["gyro", 5],
	["pickaxe", 20],
	["fuelF", 50],
	["defib", 1250],
	["codebreaker", 1200],
	["blastingcharge", 2500],
	["boltcutter", 15],
	["kiwi", 3],
	["mango", 4],
	["apple", 3],
	["chocolate", 10],
	["donuts",0],
	["coffee",3], //free for cops though - trapped in fn_virt_buy.sqf
	["spikeStrip",0],
	["defusekit",0],
	["lockpick", 15],
	["breathalyzer",0],
	["zipties", 150],
	["storagesmall", 200],
	["storagebig", 500]

];
__CONST__(max_buy_array,dynamic_buy_array);