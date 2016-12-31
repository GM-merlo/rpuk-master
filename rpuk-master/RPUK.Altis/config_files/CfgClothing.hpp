/*
* @File:   CfgClothing.hpp
* @Author: Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* Copyright (C) Ciaran Langton 2016 - All Rights Reserved - https://www.roleplay.co.uk
* Unauthorized copying of this file, via any medium is strictly prohibited
* without the express permission of Ciaran "Ciaran" Langton <email@ciaranlangton.com>
*
* LAYOUT: {"Classname","DisplayName",price,"Conditional Statement"}
*/
class CfgClothing {
	class bruce {
		title = "Clothing Store";
		openCondition = "playerSide == civilian";

		uniforms[] = {
			//Custom clothing
			/*{"U_C_Commoner_shorts","Monster",250,"true",0},
			{"U_C_Commoner_shorts","Checkered Shirt",250,"true",1},
			{"U_C_Commoner_shorts","Weed Shirt",250,"true",2},
			{"U_C_Commoner_shorts","Burple",250,"true",3},*/


			//Normal Altis Life clothing
			{"U_C_Poloshirt_blue","Poloshirt Blue",250,"true"},
			{"U_C_Poloshirt_burgundy","Poloshirt Burgundy",250,"true"},
			{"U_C_Poloshirt_redwhite","Poloshirt Red/White",250,"true"},
			{"U_C_Poloshirt_salmon","Tanoa Bus Uniform",250,"true"},
			{"U_C_Poloshirt_stripped","Poloshirt stripped",250,"true"},
			{"U_C_Poloshirt_tricolour","Poloshirt Tricolor",250,"true"},
			{"U_C_Poor_2","Rag tagged clothes",250,"true"},
			{"U_IG_Guerilla2_2","Green stripped shirt & Pants",650,"true"},
			{"U_IG_Guerilla3_1","Brown Jacket & Pants",735,"true"},
			{"U_IG_Guerilla2_3","The Outback Rangler",1200,"true"},
			{"U_C_HunterBody_grn","The Hunters Look",1500,"true"},
			{"U_C_WorkerCoveralls","Mechanic Coveralls",2500,"true"},
			{"U_OrestesBody","Surfing On Land",1100,"true"},
			{"U_C_Journalist","News",20000,"true"},
			//{"U_NikosAgedBody","Suit + Tie",20000,"true"},
			{"U_C_Poor_1","Poor",100,"true"},
			{"U_NikosBody","Niko",1000,"true"},
			{"U_I_G_Story_Protagonist_F","Protagonist",1000,"true"},
			{"U_I_G_resistanceLeader_F","Resistance Leader",1000,"true"},
			{"U_I_HeliPilotCoveralls","Heli Pilot Coveralls",1000,"true"},
			{"U_B_HeliPilotCoveralls","Heli Pilot Coveralls",1000,"true"},
			{"U_B_PilotCoveralls","PilotCoveralls Blue",1000,"true"},
			{"U_I_pilotCoveralls","PilotCoveralls Green",1000,"true"}
		};

		hats[] = {
			{"H_Bandanna_camo","Camo Bandanna",120,"true"},
			{"H_Bandanna_surfer","Surfer Bandanna",130,"true"},
			{"H_Bandanna_gry","Grey Bandanna",150,"true"},
			{"H_Bandanna_cbr","",165,"true"},
			{"H_Bandanna_surfer","",135,"true"},
			{"H_Bandanna_khk","Khaki Bandanna",145,"true"},
			{"H_Bandanna_sgg","Sage Bandanna",160,"true"},
			{"H_StrawHat","Straw Fedora",225,"true"},
			{"H_BandMask_blk","Hat & Bandanna",300,"true"},
			{"H_Booniehat_tan","",425,"true"},
			{"H_Hat_blue","",310,"true"},
			{"H_Hat_brown","",276,"true"},
			{"H_Hat_checker","",340,"true"},
			{"H_Hat_grey","",280,"true"},
			{"H_Hat_tan","",265,"true"},
			{"H_Cap_blu","",150,"true"},
			{"H_Cap_grn","",150,"true"},
			{"H_Cap_grn_BI","",150,"true"},
			{"H_Cap_oli","",150,"true"},
			{"H_Cap_red","",150,"true"},
			{"H_Cap_surfer","",150,"true"},
			{"H_Cap_blk_ION","",150,"true"},
			{"H_Cap_oli_hs","",150,"true"},
			{"H_Cap_blk_Raven","",150,"true"},
			{"H_Cap_khaki_specops_UK","",150,"true"},
			{"H_Cap_blk_CMMG","",150,"true"},
			{"H_Cap_tan","",150,"true"},
			{"H_Cap_surfer","News Cap",50,"true"},
			{"H_Cap_press","Surfer Hat",500,"true"},
			{"H_Cap_usblack","USA Hat",200,"true"},
			{"H_StrawHat_dark","Dark Fedora",500,"true"}
		};

		glasses[] = {
			{"G_Shades_Black","",25,"true"},
			{"G_Shades_Blue","",20,"true"},
			{"G_Sport_Blackred","",20,"true"},
			{"G_Sport_Checkered","",20,"true"},
			{"G_Sport_Blackyellow","",20,"true"},
			{"G_Sport_BlackWhite","",20,"true"},
			{"G_Squares","",10,"true"},
			{"G_Aviator","",100,"true"},
			{"G_Lady_Mirror","",150,"true"},
			{"G_Lady_Dark","",150,"true"},
			{"G_Lady_Blue","",150,"true"},
			{"G_Lowprofile","",30,"true"},
			{"G_Combat","",55,"true"}
		};

		vests[] = {
			{"V_Press_F","",25000,"true"}
		};

		backpacks[] = {
			{"B_AssaultPack_cbr","",2500,"true"},
			{"B_Kitbag_mcamo","",4500,"true"},
			{"B_TacticalPack_oli","",3500,"true"},
			{"B_FieldPack_ocamo","",3000,"true"},
			{"B_Bergen_sgg","",4500,"true"},
			{"B_Kitbag_cbr","",4500,"true"},
			{"B_Carryall_oli","",5000,"true"},
			{"B_Carryall_khk","",5000,"true"}
		};
	};

	class cop {
		title = "Police Clothing Store";
		openCondition = "playerSide == west";

		uniforms[] = {
	    {"U_I_CombatUniform","CSO/PCSO Uniform",0,"(call life_plodrank < 3)"},
			{"U_IG_Guerrilla_6_1","PC Uniform",0,"(call life_plodrank >= 3)"},
			{"U_I_CombatUniform_tshirt","National Crime Agency",0,"(call life_plodrank >= 3)"},
			{"U_B_HeliPilotCoveralls","NPAS Uniform",0,"(call life_fnc_isNPAS)"},
      {"U_B_CombatUniform_mcam_worn","Armed Response",0,"(call life_fnc_isAR)"},
			{"U_B_Wetsuit","Police Wetsuit",0,"(call life_fnc_isMPU)"}
		};

		hats[] = {
			{"H_Cap_blk","",0,"(call life_plodrank < 3)"},
			{"H_Beret_blk","Police Beret",0,"(call life_plodrank >= 3)"},
      {"H_Cap_police","National Crime Agency Cap",0,"(call life_plodrank >= 3)"},
			{"H_PilotHelmetHeli_B","NPAS Helmet",0,"(call life_fnc_isNPAS || call life_fnc_isAR)"},
			{"H_HelmetB_plain_blk","AR Helmet",0,"(call life_fnc_isAR)"}
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

    	{"G_B_Diving","Diving Goggles",0,"(call life_fnc_isMPU)"},
			{"G_Balaclava_blk","AR Balaclava",0,"(call life_fnc_isAR)"}
		};

		vests[] = {
			{"V_TacVest_blk_POLICE","Police Vest",0,"(call life_plodrank >= 2)"},
			{"V_PlateCarrier2_blk","Carrier Rig",0,"(call life_plodrank >= 2)"},
			{"V_RebreatherB","Rebreather",0,"(call life_fnc_isMPU)"}
		};

		backpacks[] = {
			{"B_Carryall_mcamo","Cop Backpack",0,"true"}
		};
	};

	class bhunter {
		title = "Bounty Hunter Clothing";
		openCondition = "license_civ_bounty";

		uniforms[] = {
			{"U_B_CombatUniform_mcam_worn","Bounty Hunter",250,"true"}
		};

		hats[] = {
			{"H_Bandanna_camo","Camo Bandanna",120,"true"},
			{"H_Bandanna_surfer","Surfer Bandanna",130,"true"},
			{"H_Bandanna_gry","Grey Bandanna",150,"true"},
			{"H_Bandanna_cbr","",165,"true"},
			{"H_Bandanna_surfer","",135,"true"},
			{"H_Bandanna_khk","Khaki Bandanna",145,"true"},
			{"H_Bandanna_sgg","Sage Bandanna",160,"true"},
			{"H_StrawHat","Straw Fedora",225,"true"},
			{"H_BandMask_blk","Hat & Bandanna",300,"true"},
			{"H_Booniehat_tan","",425,"true"},
			{"H_Hat_blue","",310,"true"},
			{"H_Hat_brown","",276,"true"},
			{"H_Hat_checker","",340,"true"},
			{"H_Hat_grey","",280,"true"},
			{"H_Hat_tan","",265,"true"},
			{"H_Cap_blu","",150,"true"},
			{"H_Cap_grn","",150,"true"},
			{"H_Cap_grn_BI","",150,"true"},
			{"H_Cap_oli","",150,"true"},
			{"H_Cap_red","",150,"true"},
			{"H_Cap_tan","",150,"true"}
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
			{"G_Combat","",0,"true"}
		};

		vests[] = {
			{"V_Rangemaster_belt","",1000,"true"},
			{"V_TacVestIR_blk","",2500,"true"}
		};

		backpacks[] = {
			{"B_AssaultPack_cbr","",2500,"true"},
			{"B_Kitbag_mcamo","",4500,"true"}
		};
	};

	class arac {
		title = "ARAC Clothing";
		openCondition = "license_civ_arac";

		uniforms[] = {
			{"U_B_CTRG_3","ARAC Uniform",250,"true"}
		};

		hats[] = {
			{"H_Bandanna_camo","Camo Bandanna",120,"true"},
			{"H_Bandanna_surfer","Surfer Bandanna",130,"true"},
			{"H_Bandanna_gry","Grey Bandanna",150,"true"},
			{"H_Bandanna_cbr","",165,"true"},
			{"H_Bandanna_surfer","",135,"true"},
			{"H_Bandanna_khk","Khaki Bandanna",145,"true"},
			{"H_Bandanna_sgg","Sage Bandanna",160,"true"},
			{"H_StrawHat","Straw Fedora",225,"true"},
			{"H_BandMask_blk","Hat & Bandanna",300,"true"},
			{"H_Booniehat_tan","",425,"true"},
			{"H_Hat_blue","",310,"true"},
			{"H_Hat_brown","",276,"true"},
			{"H_Hat_checker","",340,"true"},
			{"H_Hat_grey","",280,"true"},
			{"H_Hat_tan","",265,"true"},
			{"H_Cap_blu","",150,"true"},
			{"H_Cap_grn","",150,"true"},
			{"H_Cap_grn_BI","",150,"true"},
			{"H_Cap_oli","",150,"true"},
			{"H_Cap_red","",150,"true"},
			{"H_Cap_tan","",150,"true"}
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
			{"G_Combat","",0,"true"}
		};

		vests[] = {
		};

		backpacks[] = {
			{"B_Carryall_mcamo","ARAC Backpack",5122,"true"}
		};
	};

	class dive {
		title = "Scuba Steve's Diving Shop";
		openCondition = "license_civ_dive";

		uniforms[] = {
			{"U_B_Wetsuit","",2000,"true"}
		};

		hats[] = {
		};

		glasses[] = {
			{"G_Diving","",500,"true"}
		};

		vests[] = {
			{"V_RebreatherB","",5000,"true"}
		};

		backpacks[] = {
		};
	};

	class kart {
		title = "Bobby's Kart-Racing Outfits";
		openCondition = "playerSide == civilian";

		uniforms[] = {
			{"U_C_Driver_1_black","",1500,"true"},
			{"U_C_Driver_1_blue","",1500,"true"},
			{"U_C_Driver_1_red","",1500,"true"},
			{"U_C_Driver_1_orange","",1500,"true"},
			{"U_C_Driver_1_green","",1500,"true"},
			{"U_C_Driver_1_white","",1500,"true"},
			{"U_C_Driver_1_yellow","",1500,"true"},
			{"U_C_Driver_2","",3500,"true"},
			{"U_C_Driver_1","",3600,"true"},
			{"U_C_Driver_3","",3700,"true"},
			{"U_C_Driver_4","",3700,"true"}
		};

		hats[] = {
			{"H_RacingHelmet_1_black_F","",1000,"true"},
			{"H_RacingHelmet_1_red_F","",1000,"true"},
			{"H_RacingHelmet_1_white_F","",1000,"true"},
			{"H_RacingHelmet_1_blue_F","",1000,"true"},
			{"H_RacingHelmet_1_yellow_F","",1000,"true"},
			{"H_RacingHelmet_1_green_F","",1000,"true"},
			{"H_RacingHelmet_1_F","",2500,"true"},
			{"H_RacingHelmet_2_F","",2500,"true"},
			{"H_RacingHelmet_3_F","",2500,"true"},
			{"H_RacingHelmet_4_F","",2500,"true"}
		};

		glasses[] = {
		};

		vests[] = {
		};

		backpacks[] = {
		};
	};

	class nhs {
		title = "NHS Clothing";
		openCondition = "playerSide == independent";

		uniforms[] = {
      {"U_O_OfficerUniform_ocamo","NHS Uniform",0,"true"},
			{"U_B_Wetsuit","",0,"true"}
		};

		hats[] = {
			{"H_Cap_blk","",0,"true"},
			{"H_Cap_oli","",0,"true"},
			{"H_Cap_red","",0,"true"},
			{"H_Cap_tan","",0,"true"},
			{"H_Cap_blu","",0,"true"},
			{"H_Hat_blue","",0,"true"},
			{"H_Hat_brown","",0,"true"},
			{"H_Hat_grey","",0,"true"}
		};

		glasses[] = {
			{"G_Shades_Black","",25,"true"},
			{"G_Shades_Blue","",20,"true"},
			{"G_Sport_Blackred","",20,"true"},
			{"G_Sport_Checkered","",20,"true"},
			{"G_Sport_Blackyellow","",20,"true"},
			{"G_Sport_BlackWhite","",20,"true"},
			{"G_Aviator","",75,"true"},
			{"G_Squares","",10,"true"},
			{"G_Lowprofile","",30,"true"},
			{"G_Combat","",55,"true"},
			{"G_Diving","",0,"true"}
		};

		vests[] = {
			{"V_RebreatherB","",0,"true"}
		};

		backpacks[] = {
			{"B_Carryall_mcamo","NHS Backpack",0,"true"}
		};
	};

	class reb {
		title = "British Hope Stores";
		openCondition = "license_civ_rebel";

		uniforms[] = {
			{"U_IG_Guerilla1_1","",5000,"true"},
			{"U_BG_Guerrilla_6_1","",5000,"true"},
			{"U_BG_Guerilla2_1","",5000,"true"},
			{"U_BG_Guerilla2_2","",5000,"true"},
			{"U_BG_Guerilla2_3","",5000,"true"},
			{"U_BG_Guerilla3_1","",5000,"true"},
			//{"U_O_CombatUniform_oucamo","",5000,"true"},
			//{"U_O_SpecopsUniform_blk","",5000,"true"},
			//{"U_O_OfficerUniform_ocamo","",5000,"true"},
			{"U_BG_Guerilla1_1","",5000,"true"},
			{"U_BG_Guerilla3_2","",5000,"true"},
			{"U_OG_Guerilla2_1","",5000,"true"},
			{"U_OG_Guerilla2_2","",5000,"true"},
			{"U_OG_Guerilla2_3","",5000,"true"},
			{"U_OG_Guerilla3_1","",5000,"true"},
			{"U_OG_Guerilla3_2","",5000,"true"},
			{"U_OG_leader","",5000,"true"},
			{"U_I_HeliPilotCoveralls","",5000,"true"},
			{"U_I_pilotCoveralls","",5000,"true"},
			//{"U_O_Wetsuit","",5000,"true"},
			{"U_I_G_Story_Protagonist_F","",7500,"true"},
			{"U_I_G_resistanceLeader_F","",11500,"true"},
			//{"U_O_SpecopsUniform_ocamo","",17500,"true"},
			//{"U_O_PilotCoveralls","",15610,"true"},
			{"U_IG_leader","Guerilla Leader",15340,"true"},
			{"U_BG_leader","Guerilla Leader 2",15340,"true"},
			//{"U_O_GhillieSuit","",100000,"true"},
			{"U_B_FullGhillie_lsh","",200000,"true"},
			{"U_B_FullGhillie_sard","",200000,"true"},
			{"U_B_FullGhillie_ard","",200000,"true"},
			//{"U_O_FullGhillie_lsh","",200000,"true"},
			{"U_I_CombatUniform","",10000,"true"},
			{"U_I_CombatUniform_tshirt","",10000,"true"},
			{"U_I_CombatUniform_shortsleeve","",10000,"true"},
			{"U_I_CombatUniform_shortsleeve","",10000,"true"},
			//{"U_O_FullGhillie_sard","",200000,"true"},
			//{"U_O_FullGhillie_ard","",200000,"true"},
			{"U_I_FullGhillie_lsh","",200000,"true"},
			{"U_I_FullGhillie_sard","",200000,"true"},
			{"U_I_FullGhillie_ard","",200000,"true"},
			{"U_B_GhillieSuit","",150000,"true"},
			{"U_I_GhillieSuit","",150000,"true"}
		};

		hats[] = {
			{"H_ShemagOpen_tan","",850,"true"},
			{"H_Shemag_olive","",850,"true"},
			{"H_ShemagOpen_khk","",800,"true"},
			{"H_HelmetO_ocamo","",2500,"true"},
			{"H_MilCap_oucamo","",1200,"true"},
			{"H_Bandanna_camo","",650,"true"},
			{"H_Watchcap_blk","",500,"true"},
			{"H_HelmetO_ocamo","",2500,"true"},
			{"H_MilCap_oucamo","",1200,"true"},
			{"H_Bandanna_camo","",650,"true"},
			{"H_Booniehat_khk","",850,"true"},
			{"H_Booniehat_indp","",850,"true"},
			{"H_Booniehat_mcamo","",850,"true"},
			{"H_Booniehat_tan","",850,"true"},
			{"H_Booniehat_dirty","",850,"true"},
			{"H_Booniehat_dgtl","",850,"true"},
			{"H_Booniehat_khk_hs","",850,"true"},
			{"H_HelmetB_plain_mcamo","",850,"true"},
			{"H_Cap_headphones","",850,"true"},
			{"H_HelmetCrew_I","",850,"true"},
			{"H_CrewHelmetHeli_B","",850,"true"},
			{"H_MilCap_rucamo","",850,"true"},
			{"H_MilCap_ocamo","",850,"true"},
			{"H_HelmetLeaderO_ocamo","",850,"true"},
			{"H_PilotHelmetHeli_O","",850,"true"},
			{"H_HelmetCrew_B","",850,"true"},
			{"H_HelmetB_grass","",850,"true"},
			{"H_HelmetB_snakeskin","",850,"true"},
			{"H_HelmetB_desert","",850,"true"}
		};

		glasses[] = {
			{"G_Balaclava_blk","",75000,"true"},
			{"G_Balaclava_combat","",75000,"true"},
			{"G_Balaclava_lowprofile","",75000,"true"},
			{"G_Balaclava_oli","",75000,"true"},
			{"G_Shades_Black","",25,"true"},
			{"G_Shades_Blue","",20,"true"},
			{"G_Sport_Blackred","",20,"true"},
			{"G_Sport_Checkered","",20,"true"},
			{"G_Sport_Blackyellow","",20,"true"},
			{"G_Sport_BlackWhite","",20,"true"},
			{"G_Squares","",10,"true"},
			{"G_Lowprofile","",30,"true"},
			{"G_Combat","",55,"true"},
			{"H_ShemagOpen_tan","",75000,"true"},
			{"H_Shemag_olive","",75000,"true"},
			{"H_ShemagOpen_khk","",75000,"true"}
		};

		vests[] = {
			{"V_TacVest_khk","",12500,"true"},
			{"V_BandollierB_cbr","",4500,"true"},
			{"V_HarnessO_brn","",7500,"true"},
			{"V_BandollierB_khk","",7500,"true"},
			{"V_BandollierB_blk","",7500,"true"},
			{"V_BandollierB_oli","",7500,"true"},
			{"V_HarnessOGL_brn","",7500,"true"},
			{"V_HarnessO_gry","",7500,"true"},
			{"V_HarnessOGL_gry","",7500,"true"},
			{"V_HarnessOSpec_brn","",7500,"true"},
			{"V_HarnessOSpec_gry","",7500,"true"},
			{"V_PlateCarrierH_CTRG","",7500,"true"}
		};

		backpacks[] = {
			{"B_AssaultPack_cbr","",2500,"true"},
			{"B_Kitbag_mcamo","",4500,"true"},
			{"B_TacticalPack_oli","",3500,"true"},
			{"B_FieldPack_ocamo","",3000,"true"},
			{"B_Bergen_sgg","",4500,"true"},
			{"B_Kitbag_cbr","",4500,"true"},
			{"B_Carryall_oli","",5000,"true"},
			{"B_Carryall_khk","",5000,"true"}
		};
	};

	class wreb {
		title = "UNMC Clothing";
		openCondition = "call life_fnc_isRebel";

		uniforms[] = {
	    {"U_O_CombatUniform_oucamo","UNMC Uniform",5000,"true"},
			{"U_O_PilotCoveralls","UNMC Pilot",5000,"(call life_rebellevel > 2)"},
			{"B_diver_F","UNMC Diver",5000,"(call life_rebellevel > 2)"}
		};

		hats[] = {
			{"H_MilCap_gry","UNMC Miltary Cap",500,"(call life_rebellevel > 2)"},
			{"H_HelmetO_oucamo","UNMC Helmet",1000,"true"},
			{"H_PilotHelmetFighter_B","UNMC Pilot Helmet",2000,"(call life_rebellevel > 2)"},
			{"H_Beret_ocamo","UNMC Beret",5000,"(call life_rebellevel > 6)"},
			{"H_Beret_Colonel","UNMC General Beret",5000,"(call life_rebellevel > 10)"}
		};

		glasses[] = {
			{"G_B_Diving","UNMC Diving Goggles",500,"(call life_rebellevel > 2)"},
			{"G_Bandanna_shades","Bandanna Shades",1000,"(call life_rebellevel > 2)"},
			{"G_Bandanna_aviator","Bandanna Aviator",1000,"(call life_rebellevel > 2)"},
			{"G_Bandanna_blk","Bandanna Black",1000,"(call life_rebellevel > 2)"},
			{"G_Balaclava_blk","Balaclava Black",5000,"(call life_rebellevel > 2)"},
			{"G_Balaclava_combat","Balaclava Goggles",5000,"(call life_rebellevel > 2)"},
			{"G_Balaclava_lowprofile","Balaclava Low Goggles",5000,"(call life_rebellevel > 2)"}
		};

		vests[] = {
			{"V_PlateCarrier1_blk","UNMC Plate Black",1000,"true"},
			{"V_RebreatherB","UNMC Rebreather",2500,"(call life_rebellevel > 2)"}
		};

		backpacks[] = {
			{"B_Carryall_oucamo","UNMC Carryall",1000,"true"},
			{"B_FieldPack_oucamo","UNMC Fieldpack",1000,"true"},
			{"B_TacticalPack_blk","UNMC Tactical Black",1000,"true"},
			{"B_Parachute","UNMC Parachute",3000,"(call life_rebellevel > 2)"}
		};
	};

	class mayor {
		title = "Mayor Shop";
		openCondition = "(life_mayor_settings select 0) == getPlayerUID player";

		uniforms[] = {
			{"U_NikosAgedBody","Mayor Suit",0,"true"}
		};

		hats[] = {
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
			{"G_Combat","",0,"true"}
		};

		vests[] = {
		};

		backpacks[] = {
		};
	};
};
