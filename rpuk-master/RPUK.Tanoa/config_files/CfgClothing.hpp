/*
* @File:   CfgClothing.hpp
* @Authors: Rath "Rath" Rathy <something@somewhere.com>
*           Ciaran "Ciaran" Langton <email@ciaranlangton.com>
            Andrew "Neo" Anderson <andrew@iamneo.co.uk>
*
*   RolePlay.co.uk
*    Copyright (c) RolePlay.co.uk 2014 - 2016
*
*    The usage of this file is restricted to RolePlay.co.uk
*    You're not allowed to modify this file!
*    Licensed under the Arma EULA and Arma Tools EULA.
*    For further questions contact an author!
*/

class CfgClothing {
	class hugoross //class used for main clothes shop (used in addaction)
	{
		//this addAction["Wilco's Jeans",life_fnc_shopMenuOpen,[civilian,"clothing","wilcosjeans"],0,false,false,"",'!life_action_inUse'];
		title = "Hugo Ross"; //Title for the Dialog
		uniforms[] = {"U_C_Poloshirt_salmon", "U_C_Poloshirt_blue", "U_C_Poloshirt_burgundy", "U_C_Poloshirt_redwhite", "U_C_Poloshirt_stripped", "U_C_Poloshirt_tricolour", "U_C_Poor_2", "U_C_man_sport_1_F", "U_C_man_sport_3_F", "U_C_man_sport_2_F", "U_C_Man_casual_6_F", "U_C_Man_casual_4_F", "U_C_Man_casual_5_F", "U_I_C_Soldier_Para_4_F", "U_I_C_Soldier_Para_1_F", "U_I_C_Soldier_Para_5_F", "U_I_C_Soldier_Para_3_F", "U_I_C_Soldier_Para_2_F", "U_I_C_Soldier_Bandit_4_F", "U_I_C_Soldier_Bandit_1_F", "U_I_C_Soldier_Bandit_2_F", "U_I_C_Soldier_Bandit_5_F", "U_I_C_Soldier_Bandit_3_F", "U_C_Man_casual_2_F", "U_C_Man_casual_3_F", "U_C_Man_casual_1_F", "U_C_WorkerCoveralls", "U_OrestesBody", "U_C_Journalist","U_IG_Guerilla3_1"};
		headgear[] = {"H_Bandanna_camo", "H_Bandanna_surfer", "H_Bandanna_gry", "H_Bandanna_cbr", "H_Booniehat_tna_F", "H_Helmet_Skate", "H_Bandanna_khk", "H_Bandanna_sgg", "H_StrawHat", "H_BandMask_blk", "H_Booniehat_tan", "H_Hat_blue", "H_Hat_brown", "H_Hat_checker", "H_Hat_grey", "H_Hat_tan", "H_Cap_blu", "H_Cap_grn", "H_Cap_grn_BI", "H_Cap_oli", "H_Cap_red", "H_Cap_blk_ION", "H_Cap_oli_hs", "H_Cap_blk_Raven", "H_Cap_khaki_specops_UK", "H_Cap_blk_CMMG", "H_Cap_tan", "H_Cap_surfer", "H_Cap_press", "H_Cap_usblack", "H_StrawHat_dark"};
		goggles[] = {"G_Shades_Black", "G_Shades_Blue", "G_Sport_Blackred", "G_Sport_Checkered", "G_Sport_Blackyellow", "G_Sport_BlackWhite", "G_Squares", "G_Aviator", "G_Lady_Mirror", "G_Lady_Dark", "G_Lady_Blue", "G_Lowprofile", "G_Combat"};
		vests[] = {"V_Press_F"};
		backpacks[] = {"B_OutdoorPack_blu","B_OutdoorPack_blk","B_OutdoorPack_tan","B_Kitbag_mcamo", "B_TacticalPack_oli", "B_FieldPack_ocamo", "B_Bergen_sgg", "B_Kitbag_cbr", "B_AssaultPack_tna_F", "B_AssaultPack_cbr", "B_FieldPack_ghex_F", "B_ViperHarness_blk_F", "B_ViperHarness_ghex_F", "B_ViperHarness_hex_F", "B_ViperHarness_khk_F", "B_ViperHarness_oli_F", "B_ViperLightHarness_blk_F", "B_ViperLightHarness_ghex_F", "B_ViperLightHarness_hex_F", "B_ViperLightHarness_khk_F", "B_ViperLightHarness_oli_F", "B_Carryall_ghex_F", "B_Carryall_oli", "B_Carryall_khk"};
	};
  class busclothing {
    title = "Tanoa Bus Clothing";

    uniforms[] = {"U_C_Poloshirt_salmon"};
    headgear[] = {};
    googles[] = {};
    vests[] = {};
    backpacks[] = {};
  };
	class scubagear //class used in addaction
	{
		title = "Small Willy's Dive & Surf";
		uniforms[] = {"U_B_Wetsuit"};
		headgear[] = {};
		goggles[] = {"G_B_Diving"};
		vests[] = {"V_RebreatherB"};
		backpacks[] = {};
	};

	class reb
	{
		Title = "The Rebel Tailors";
		uniforms[] = {"U_IG_Guerilla1_1", "U_BG_Guerrilla_6_1", "U_BG_Guerilla2_1", "U_BG_Guerilla2_2", "U_BG_Guerilla2_3", "U_BG_Guerilla3_1", "U_O_CombatUniform_oucamo", "U_O_OfficerUniform_ocamo", "U_OG_leader", "U_I_HeliPilotCoveralls", "U_I_pilotCoveralls", "U_I_G_Story_Protagonist_F", "U_I_G_resistanceLeader_F", "U_O_SpecopsUniform_ocamo", "U_B_FullGhillie_lsh", "U_B_FullGhillie_sard", "U_B_FullGhillie_ard", "U_I_CombatUniform", "U_I_CombatUniform_tshirt", "U_I_CombatUniform_shortsleeve", "U_I_FullGhillie_lsh", "U_I_FullGhillie_sard", "U_I_FullGhillie_ard", "U_B_GhillieSuit", "U_I_GhillieSuit"};
		headgear[] = {"H_ShemagOpen_tan", "H_Shemag_olive", "H_ShemagOpen_khk", "H_HelmetO_ocamo", "H_MilCap_oucamo", "H_Bandanna_camo", "H_Watchcap_blk", "H_MilCap_oucamo", "H_Bandanna_camo", "H_Booniehat_khk", "H_Booniehat_mcamo", "H_Booniehat_tan", "H_Booniehat_dgtl", "H_Booniehat_khk_hs", "H_HelmetB_plain_mcamo", "H_Cap_headphones", "H_HelmetCrew_I", "H_CrewHelmetHeli_B", "H_MilCap_rucamo", "H_MilCap_ocamo", "H_HelmetLeaderO_ocamo", "H_PilotHelmetHeli_O", "H_HelmetCrew_B", "H_HelmetB_grass", "H_HelmetB_snakeskin", "H_HelmetB_desert"};
		goggles[] = {"G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Shades_Black", "G_Shades_Blue", "G_Sport_Blackred", "G_Sport_Checkered", "G_Sport_Blackyellow", "G_Sport_BlackWhite", "G_Squares", "G_Lowprofile", "G_Combat"};
		vests[] = {"V_Press_F","V_RebreatherB","V_BandollierB_cbr","V_BandollierB_khk","V_BandollierB_blk","V_BandollierB_oli","V_HarnessO_brn","V_HarnessOGL_brn","V_HarnessO_gry","V_HarnessOGL_gry","V_HarnessOSpec_brn","V_HarnessOSpec_gry","V_TacVest_khk","V_PlateCarrierH_CTRG"};
		backpacks[] = {"B_AssaultPack_cbr", "B_Kitbag_mcamo", "B_TacticalPack_oli", "B_FieldPack_ocamo", "B_Bergen_sgg", "B_Kitbag_cbr", "B_Carryall_oli", "B_Carryall_cbr", "B_Carryall_khk"};
	};
};


class cfgClothingOldTonic { //This class is a hanger-over from Tonic's shop system until Rath is able to get custom-skins working properly.

	class cop {
		title = "Police Clothing Store";
		openCondition = "playerSide == west";

		uniforms[] = {
			{"U_B_CTRG_Soldier_F","Trainee Uniform",0,"(call life_plodrank <= 2)"},
			{"U_I_CombatUniform_shortsleeve","Patrol Uniform",0,"(call life_plodrank >= 3)"},
			{"U_I_CombatUniform","JAR Uniform",0,"(call life_plodrank >= 10 || call life_fnc_isAR)"},

			{"U_I_Wetsuit","Police Wetsuit",0,"(call life_fnc_isMPU || call life_fnc_isAR || call life_fnc_isNIU)"}
		};

		hats[] = {
			{"H_Cap_police","",0,"(call life_plodrank <= 2 || call life_fnc_isAR || call life_fnc_isNIU)"},
			{"H_Beret_gen_F","Police Beret",0,"(call life_plodrank >= 3)"},
			{"H_Watchcap_blk","",0,"(call life_plodrank >= 5)"},
			{"H_Booniehat_khk","",0,"(call life_plodrank >= 7)"},
			{"H_Beret_02","Command Beret",0,"(call life_plodrank >= 8)"},
			{"H_Booniehat_oli","",0,"(call life_plodrank >= 10 || call life_fnc_isAR)"},
			{"H_HelmetB_plain_blk","AR Helmet",0,"(call life_plodrank >= 10 || call life_fnc_isAR)"},
			{"H_CrewHelmetHeli_B","Flight Helmet",0,"(call life_plodrank >= 10)"}
		};

		glasses[] = {
			{"G_Shades_Black","",0,"true"},
			{"G_Shades_Blue","",0,"true"},
			{"G_Sport_Blackred","",0,"true"},
			{"G_Sport_Checkered","",0,"true"},
			{"G_Sport_Blackyellow","",0,"true"},
			{"G_Sport_BlackWhite","",0,"true"},
			{"G_Aviator","",0,"true"},
			{"G_Squares","",0,"true"},
			{"G_Lowprofile","",0,"true"},
			{"G_Combat","",0,"true"},

    		{"G_I_Diving","",0,"(call life_fnc_isMPU || call life_fnc_isAR || call life_fnc_isNIU)"},
			{"G_Balaclava_blk","",0,"(call life_fnc_isAR || call life_plodrank >= 10)"},
			{"G_Balaclava_oli","",0,"(call life_fnc_isAR || call life_plodrank >= 10)"},
			{"G_Balaclava_TI_G_blk_F","",0,"(call life_fnc_isAR || call life_plodrank >= 10)"},
			{"G_Balaclava_combat","",0,"(call life_fnc_isAR || call life_plodrank >= 10)"}
		};

		vests[] = {
			{"V_TacVest_blk_POLICE","Police Vest",0,"(call life_plodrank >= 2)"},
			{"V_PlateCarrier2_blk","Carrier Rig",0,"(call life_plodrank >= 2)"},
			{"V_PlateCarrierIA2_dgtl","AR Vest",0,"(call life_fnc_isAR)"},
			{"V_RebreatherIA","Rebreather",0,"(call life_fnc_isMPU || call life_plodrank >= 10 || call life_fnc_isAR || call life_fnc_isNIU)"}
		};

		backpacks[] = {
			{"B_Carryall_mcamo","Cop Backpack",0,"true"}
		};
	};

	class reb {
		title = "Jungle Stash";
		openCondition = "license_civ_rebel";

		uniforms[] = {
			{"U_IG_Guerilla1_1","",100,"true"},
			{"U_BG_Guerrilla_6_1","",100,"true"},
			{"U_BG_Guerilla2_1","",100,"true"},
			{"U_BG_Guerilla2_2","",100,"true"},
			{"U_BG_Guerilla2_3","",100,"true"},
			{"U_BG_Guerilla3_1","",100,"true"},
			//{"U_O_CombatUniform_oucamo","",5000,"true"},
			//{"U_O_SpecopsUniform_blk","",5000,"true"},
			//{"U_O_OfficerUniform_ocamo","",5000,"true"},
			{"U_BG_Guerilla1_1","",100,"true"},
			{"U_BG_Guerilla3_2","",100,"true"},
			{"U_OG_Guerilla2_1","",100,"true"},
			{"U_OG_Guerilla2_2","",100,"true"},
			{"U_OG_Guerilla2_3","",100,"true"},
			{"U_OG_Guerilla3_1","",100,"true"},
			{"U_OG_Guerilla3_2","",100,"true"},
			{"U_OG_leader","",100,"true"},
			{"U_I_HeliPilotCoveralls","",100,"true"},
			{"U_I_pilotCoveralls","",100,"true"},
			//{"U_O_Wetsuit","",5000,"true"},
			{"U_I_G_Story_Protagonist_F","",200,"true"},
			{"U_I_G_resistanceLeader_F","",1000,"true"},
			//{"U_O_SpecopsUniform_ocamo","",17500,"true"},
			//{"U_O_PilotCoveralls","",15610,"true"},
			{"U_IG_leader","Guerilla Leader",1500,"true"},
			{"U_BG_leader","Guerilla Leader 2",1500,"true"},
			//{"U_O_GhillieSuit","",100000,"true"},
			{"U_B_FullGhillie_lsh","",2000,"true"},
			{"U_B_FullGhillie_sard","",2000,"true"},
			{"U_B_FullGhillie_ard","",2000,"true"},
			//{"U_O_FullGhillie_lsh","",200000,"true"},
			{"U_I_CombatUniform","",1000,"true"},
			{"U_I_CombatUniform_tshirt","",1000,"true"},
			{"U_I_CombatUniform_shortsleeve","",1000,"true"},
			{"U_I_CombatUniform_shortsleeve","",1000,"true"},
			//{"U_O_FullGhillie_sard","",200000,"true"},
			//{"U_O_FullGhillie_ard","",200000,"true"},
			{"U_I_FullGhillie_lsh","",20000,"true"},
			{"U_I_FullGhillie_sard","",20000,"true"},
			{"U_I_FullGhillie_ard","",20000,"true"},
			{"U_B_GhillieSuit","",15000,"true"},
			{"U_I_GhillieSuit","",15000,"true"}
		};

		hats[] = {
			{"H_ShemagOpen_tan","",15,"true"},
			{"H_Shemag_olive","",15,"true"},
			{"H_ShemagOpen_khk","",15,"true"},
			{"H_HelmetO_ocamo","",15,"true"},
			{"H_MilCap_oucamo","",15,"true"},
			{"H_Bandanna_camo","",15,"true"},
			{"H_Watchcap_blk","",15,"true"},
			{"H_HelmetO_ocamo","",15,"true"},
			{"H_MilCap_oucamo","",15,"true"},
			{"H_Bandanna_camo","",15,"true"},
			{"H_Booniehat_khk","",15,"true"},
			{"H_Booniehat_indp","",15,"true"},
			{"H_Booniehat_mcamo","",15,"true"},
			{"H_Booniehat_tan","",15,"true"},
			{"H_Booniehat_dirty","",15,"true"},
			{"H_Booniehat_dgtl","",15,"true"},
			{"H_Booniehat_khk_hs","",15,"true"},
			{"H_HelmetB_plain_mcamo","",15,"true"},
			{"H_Cap_headphones","",15,"true"},
			{"H_HelmetCrew_I","",15,"true"},
			{"H_CrewHelmetHeli_B","",15,"true"},
			{"H_MilCap_rucamo","",15,"true"},
			{"H_MilCap_ocamo","",15,"true"},
			{"H_HelmetLeaderO_ocamo","",15,"true"},
			{"H_PilotHelmetHeli_O","",15,"true"},
			{"H_HelmetCrew_B","",15,"true"},
			{"H_HelmetB_grass","",15,"true"},
			{"H_HelmetB_snakeskin","",15,"true"},
			{"H_HelmetB_desert","",15,"true"}
		};

		glasses[] = {
			{"G_Balaclava_blk","",200,"true"},
			{"G_Balaclava_combat","",200,"true"},
			{"G_Balaclava_lowprofile","",200,"true"},
			{"G_Balaclava_oli","",200,"true"},
			{"G_Shades_Black","",5,"true"},
			{"G_Shades_Blue","",5,"true"},
			{"G_Sport_Blackred","",5,"true"},
			{"G_Sport_Checkered","",5,"true"},
			{"G_Sport_Blackyellow","",5,"true"},
			{"G_Sport_BlackWhite","",5,"true"},
			{"G_Squares","",5,"true"},
			{"G_Lowprofile","",5,"true"},
			{"G_Combat","",15,"true"},
			{"H_ShemagOpen_tan","",200,"true"},
			{"H_Shemag_olive","",200,"true"},
			{"H_ShemagOpen_khk","",200,"true"}
		};

		vests[] = {
			{"V_TacVest_khk","",250,"true"},
			{"V_BandollierB_cbr","",250,"true"},
			{"V_HarnessO_brn","",250,"true"},
			{"V_BandollierB_khk","",250,"true"},
			{"V_BandollierB_blk","",250,"true"},
			{"V_BandollierB_oli","",250,"true"},
			{"V_HarnessOGL_brn","",250,"true"},
			{"V_HarnessO_gry","",250,"true"},
			{"V_HarnessOGL_gry","",250,"true"},
			{"V_HarnessOSpec_brn","",250,"true"},
			{"V_HarnessOSpec_gry","",250,"true"},
			{"V_PlateCarrierH_CTRG","",250,"true"}
		};

		backpacks[] = {
			{"B_AssaultPack_cbr","",100,"true"},
			{"B_Kitbag_mcamo","",160,"true"},
			{"B_TacticalPack_oli","",150,"true"},
			{"B_FieldPack_ocamo","",125,"true"},
			{"B_Bergen_sgg","",170,"true"},
			{"B_Kitbag_cbr","",160,"true"},
			{"B_Carryall_oli","",280,"true"},
			{"B_Carryall_khk","",280,"true"}
		};
	};

};


/*
IMPORTANT: EACH CLASSNAME BELOW !!!HAS TO!!!! BE DEFINED IN CfgShopSystem.hpp FOR PRICES AND REQUIREMENTS TO USE

class CfgClothing [
    class wilcosjeans //class for shop (used in the addaction)
    [
		///this addAction["Wilco's Jeans",life_fnc_shopMenuOpen,[civilian,"clothing","wilcosjeans"],0,false,false,"",'!life_action_inUse'];
        title = "Wilco's Jeans (c)"; //Title of Shop for Dialog
        uniforms[] = {"U_C_Driver_1_black","U_C_Driver_1_blue"};
        headgear[] = {"H_RacingHelmet_1_black_F"};
        goggles[] = {"G_Bandanna_oli"};
        vests[] = {"V_BandollierB_cbr"};
        backpacks[] = {"B_OutdoorPack_blk"};
    ];
];
*/
