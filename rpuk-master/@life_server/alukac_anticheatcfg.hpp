/*
	File: alukac_anticheatcfg.hpp

	Author: Ciaran Langton
	Date: 2015-02-13 23:27:09
	Last Modified by: TinyBigJacko
	Last Modified time: 2016-07-20 //added access-level numbers (3 highest 1 lowest)
*/
admins[] = {
	//{"PID", "Name"}
	//--- Management Team
	{"76561198006341646","Wilco (Management Team)", 3},
	{"76561197982623579","Cardoso (Management Team)", 3},
	{"76561198077790400","Ciaran (Management Team)", 3},
	{"76561197966629087","Vladic Ka (Management Team)", 3},
	{"76561197972511437","Neo (Management Team)", 3},

	{"76561197972444269", "TinyBigJacko (Developer Team)", 3},

	//--- Staff Team
	{"76561198086041122","Gregory (Staff Team)", 1},
	{"76561197972313776","TheSoldier (Staff Team)", 1},
	{"76561198058880921","Crumble (Staff Team)", 1},
	{"76561198077783867","Connall (Staff Team)", 1},
	{"76561198046312390","WhoIsDan (Staff Team)", 1},
	{"76561198064653472","Farmer (Staff Team)", 1},
	{"76561197993918708","DainMK (Staff Team) (ACC#1)", 1},
	{"76561198158828475","DainMK (Staff Team) (ACC#2)", 1},
	{"76561198058958931","ArrogantBread (Staff Team)", 1},
	{"76561198029211922","Droge Worst (Staff Team)", 1},
	{"76561198088578689","Alexim (Staff Team)", 1},
	{"76561198157982805","Drew (Staff Team)", 1},
	{"76561198079473992","JohnJoeegan (Staff Team)", 1},
	{"76561198001355835","Khandamir (Staff Team)", 1},
	{"76561198050387886","Edgar Ville (Staff Team)", 1},
	{"76561198057062449","Junior (Staff Team)", 1}

};

openMenuAction = "timeDec"; //was Shift+E. Sucks, now - sign to right of 0.


varWhitelist[] = {
	"BIS_","life_","AH_","CBA_","AUCTION_","POLICE_","MAYOR_","ALUKAC_","CELL_","DB_","TON_","SOCK_","license_","profession_",
	"param1","param2","kron_","dynamic_buy_array","dynamic_sell_array","max_sell_array","max_buy_array","console",
	"tawvd_","0","serv_sv_use","paramsarray","houses","civ_spawn_","fed_bank_pos","jiptimenow",
	"rscdisplayloading_progressmission","ciaran_fnc_mp_packet","jxmxe_publishvehicle","RPUK_doshinbank",
	"RPUK_dosh","rscdisplay","Rsc","Weapon_Shop_Filter","playerHUD","igui_","loading_classes","gui_classes",
	"weapon_shop","gui_displays","loading_displays","rscdebug","gang_","gui_","koth","left","right","top","bottom",
	"rscdisplaycommonmessage_display","life_sitting_chair","vas","prothud","curator_","licenseshop","Federal_Safe","Interaction",
	"TrunkMenu","shops_menu","Chop_Shop","SettingsMenu","playerSettings","ciaransmodshop","DeathScreen","pInteraction_Menu",
	"mayor_ballot_menu",
	
	//Meatball Weather PublicVars
	"forecastOvercast", "forecastRain", "forecastFog", "forecastWindE", "forecastWindN", "serverWeather","randOCorRain"
};

scriptBlacklist[] = {

};
