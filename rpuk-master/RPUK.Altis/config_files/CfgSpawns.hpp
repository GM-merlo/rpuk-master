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
	class Altis {
    spawnBuildings[] = {"Land_i_Shop_01_V1_F", "Land_i_Shop_02_V1_F", "Land_i_Shop_03_V1_F", "Land_i_Stone_HouseBig_V1_F"};
    radiusSpawns[] = {
      {"civ_spawn_1", 250},
      {"civ_spawn_2", 250},
      {"civ_spawn_3", 250}
    };

		WEST[] = {
			{"Kavala Station", "cop_spawn_1", "\a3\ui_f\data\map\MapControl\watertower_ca.paa", "true"},
			{"Athira Station", "cop_spawn_3", "\a3\ui_f\data\map\MapControl\watertower_ca.paa", "true"},
			{"NPAS HQ", "cop_spawn_4", "\a3\ui_f\data\map\Markers\NATO\b_air.paa", "true"},
			{"Police Harbour", "cop_spawn_mpu", "\a3\ui_f\data\map\MapControl\watertower_ca.paa", "true"}
		};

		GUER[] = {
			{"Kavala NHS","medic_spawn_1","\a3\ui_f\data\map\MapControl\hospital_ca.paa","true"},
			{"Agios Clinic","medic_spawn_3","\a3\ui_f\data\map\MapControl\hospital_ca.paa","true"},
			{"Athira NHS","medic_spawn_2","\a3\ui_f\data\map\MapControl\hospital_ca.paa","true"}
		};

		CIV[] = {
			{"Kavala","civ_spawn_1","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"Athira","civ_spawn_3","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},
			{"Agios","civ_spawn_2","\a3\ui_f\data\map\MapControl\watertower_ca.paa","true"},

			{"VIP Club","vip_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(call life_samaritan == 5)"},
			{"UNMC Base","unmc_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(call life_fnc_isRebel)"},
			{"UNMC Outpost","unmc_spawn_2","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(call life_fnc_isRebel)"},

			{"Taxi HQ","taxi_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(license_civ_taxi)"},
			{"ARAC HQ","arac_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(license_civ_arac)"},
			{"Gang Spawn","life_gang_spawnpoint","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(!(call life_fnc_isRebel) && life_gang_spawnpoint != 'nocustom')","life_gang_spawnpoint"},
			{"BA Spawn","ba_spawn","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa","(call life_balevel == 1)"}
		};
	};
};
