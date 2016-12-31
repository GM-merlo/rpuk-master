/*
* @File:   CfgSpawns.hpp
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* LAYOUT:
* {"DisplayName","MarkerName","Logo","Conditional Statement"}
*/
class CfgSpawns {
  class Tanoa {
    spawnBuildings[] = { //WARNING! ALWAYS ENSURE SOME BUILDINGS IN SPAWN ARRAY ARE NON-OWNABLE!! (or people will be unable to spawn if all are bought!)
    	"Land_Shop_Town_03_F", "Land_Shop_City_01_F", "Land_Shop_City_02_F", "Land_Hotel_01_F", "Land_Hotel_02_F",
    	"Land_House_Big_01_F", "Land_House_Big_02_F", "Land_House_Big_03_F", "Land_House_Big_04_F", "Land_House_Small_01_F",
    	"Land_House_Small_02_F", "Land_House_Small_03_F", "Land_House_Small_04_F", "Land_House_Small_05_F",
    	"Land_House_Small_06_F", "Land_GarageShelter_01_F", "Land_Slum_01_F", "Land_Slum_03_F","Land_Shed_02_F","Land_Shed_05_F","Land_Addon_04_F"
    	};
    radiusSpawns[] = {
	{"georgetown_spawn", 500},
	{"lijnhaven_spawn", 300},
	{"katkoula_spawn", 300},
	{"oumere_spawn", 300}
    };

    WEST[] = {
			{"GeorgeTown Station", "cop_spawn_1", "\a3\ui_f\data\map\MapControl\watertower_ca.paa", "true"},
			{"Harcourt Station", "cop_spawn_2", "\a3\ui_f\data\map\MapControl\watertower_ca.paa", "true"},
			{"Port Police", "cop_spawn_3", "\a3\ui_f\data\map\MapControl\watertower_ca.paa", "true"},
			{"Airport Police", "cop_spawn_4", "\a3\ui_f\data\map\MapControl\watertower_ca.paa", "true"}
    };

    GUER[] = {

    };

    CIV[] = {
			{"Tanoa Airport","tanoa_airport_spawn","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"Oumere","oumere_spawn","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"Georgetown","georgetown_spawn","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"Lijnhaven","lijnhaven_spawn","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"Katkoula","katkoula_spawn","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"}
    };
  };
};
