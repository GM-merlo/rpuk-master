/*
    RolePlay.co.uk
    Copyright (c) RolePlay.co.uk 2014 - 2016

    The usage of this file is restricted to RolePlay.co.uk
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
*/

/*
  EXAMPLE
  MISSION.SQM
  this addAction["Wilco's Jeans",life_fnc_shopMenuOpen,[civilian,"clothing","wilcosjeans"],0,false,false,"",'!life_action_inUse'];
*/
class CfgShopSystem {
  class clothing {
    class U_C_man_sport_1_F {class price {civ = 125;};class displayName {civ = "Sports Clothes (Beach)";};};
    class U_C_man_sport_3_F {class price {civ = 125;};class displayName {civ = "Sports Clothes (Blue)";};};
    class U_C_man_sport_2_F {class price {civ = 125;};class displayName {civ = "Sports Clothes (Orange)";};};
    class U_C_Man_casual_6_F {class price {civ = 125;};class displayName {civ = "Summer Clothes (Red)";};};
    class U_C_Man_casual_4_F {class price {civ = 125;};class displayName {civ = "Summer Clothes (Sky)";};};
    class U_C_Man_casual_5_F {class price {civ = 125;};class displayName {civ = "Summer Clothes (Yellow)";};};
    class U_I_C_Soldier_Para_4_F {class price {civ = 125;};class displayName {civ = "Paramilitary Garb (Tank Top)";};};
    class U_I_C_Soldier_Para_1_F {class price {civ = 125;};class displayName {civ = "Paramilitary Garb (Tee)";};};
    class U_I_C_Soldier_Para_5_F {class price {civ = 125;};class displayName {civ = "Paramilitary Garb (Shorts)";};};
    class U_I_C_Soldier_Para_3_F {class price {civ = 125;};class displayName {civ = "Paramilitary Garb (Shirt)";};};
    class U_I_C_Soldier_Para_2_F {class price {civ = 125;};class displayName {civ = "Paramilitary Garb (Jacket)";};};
    class U_I_C_Soldier_Bandit_4_F {class price {civ = 125;};class displayName {civ = "Bandit Clothes (Checkered)";};};
    class U_I_C_Soldier_Bandit_1_F {class price {civ = 125;};class displayName {civ = "Bandit Clothes (Polo Shirt)";};};
    class U_I_C_Soldier_Bandit_2_F {class price {civ = 125;};class displayName {civ = "Bandit Clothes (Skull)";};};
    class U_I_C_Soldier_Bandit_5_F {class price {civ = 125;};class displayName {civ = "Bandit Clothes (Tank Top)";};};
    class U_I_C_Soldier_Bandit_3_F {class price {civ = 125;};class displayName {civ = "Bandit clothing (Tee)";};};
    class U_C_Man_casual_2_F {class price {civ = 125;};class displayName {civ = "Casual Clothes (Blue)";};};
    class U_C_Man_casual_3_F {class price {civ = 125;};class displayName {civ = "Casual Clothes (Green)";};};
    class U_C_Man_casual_1_F {class price {civ = 125;};class displayName {civ = "Casual Clothes (Navy)";};};
    class U_C_WorkerCoveralls {class price {civ = 95;};class displayName {civ = "Worker";};};
    class U_OrestesBody {class price {civ = 95;};class displayName {civ = "Surfer";};};
    class U_C_Journalist {class price {civ = 95;};class displayName {civ = "Journalist Clothing";};};
    class U_IG_Guerilla1_1 {class price {civ = 200;};class displayName {civ = "Guerilla Garment";};};
    class U_BG_Guerrilla_6_1 {class price {civ = 200;};class displayName {civ = "Guerilla Apparel";};};
    class U_BG_Guerilla2_1 {class price {civ = 200;};class displayName {civ = "Guerilla Outfit (Plain, Dark)";};};
    class U_BG_Guerilla2_2 {class price {civ = 200;};class displayName {civ = "Guerilla Outfit (Pattern)";};};
    class U_BG_Guerilla2_3 {class price {civ = 200;};class displayName {civ = "Guerilla Outfit (Plain, Light)";};};
    class U_BG_Guerilla3_1 {class price {civ = 200;};class displayName {civ = "Guerilla Smocks";};};
    class U_IG_Guerilla3_1 {class price {civ = 200;};class displayName {civ = "Brown Jacket";};};
    class U_O_CombatUniform_oucamo {class price {civ = 200;};class displayName {civ = "Fatigues (Urban) [CSAT]";};};
    class U_O_OfficerUniform_ocamo {class price {civ = 200;};class displayName {civ = "Officer Fatigues (Hex)";};};
    class U_OG_leader {class price {civ = 250;};class displayName {civ = "Guerilla Uniform Scarf";};};
    class U_O_SpecopsUniform_ocamo {class price {civ = 400;};class displayName {civ = "Recon Fatigues (Hex)";};};
    class U_I_HeliPilotCoveralls {class price {civ = 100;};class displayName {civ = "Heli Pilot Coveralls [AAF]";};};
    class U_I_pilotCoveralls {class price {civ = 100;};class displayName {civ = "Pilot Coveralls [AAF]";};};
    class U_I_G_Story_Protagonist_F {class price {civ = 100;};class displayName {civ = "Worn Combat Fatigues (Kerry)";};};
    class U_I_G_resistanceLeader_F {class price {civ = 100;};class displayName {civ = "Combat Fatigues (Stavrou)";};};
    class U_I_CombatUniform {class price {civ = 400;};class displayName {civ = "Combat Fatigues [AAF]";};};
    class U_I_CombatUniform_tshirt {class price {civ = 400;};class displayName {civ = "Combat Fatigues [AAF] (Officer)";};};
    class U_I_CombatUniform_shortsleeve {class price {civ = 400;};class displayName {civ = "Combat Fatigues [AAF] (Rolled-up)";};};
    class U_B_GhillieSuit {class price {civ = 800;};class displayName {civ = "Ghillie Suit [NATO]";};};
    class U_I_GhillieSuit {class price {civ = 800;};class displayName {civ = "Ghillie Suit [AAF]";};};
    class U_B_FullGhillie_lsh {class price {civ = 1000;};class displayName {civ = "Full Ghillie (Lush) [NATO]";};};
    class U_B_FullGhillie_sard {class price {civ = 1000;};class displayName {civ = "Full Ghillie (Semi-Arid) [NATO]";};};
    class U_B_FullGhillie_ard {class price {civ = 1000;};class displayName {civ = "Full Ghillie (Arid) [NATO]";};};
    class U_I_FullGhillie_lsh {class price {civ = 1000;};class displayName {civ = "Full Ghillie (Lush) [AAF]";};};
    class U_I_FullGhillie_sard {class price {civ = 1000;};class displayName {civ = "Full Ghillie (Semi-Arid) [AAF]";};};
    class U_I_FullGhillie_ard {class price {civ = 1000;};class displayName {civ = "Full Ghillie (Arid) [AAF]";};};
    class U_C_Poloshirt_blue {class price {civ = 95;};class displayName {civ = "Poloshirt Blue";};};
    class U_C_Poloshirt_burgundy {class price {civ = 95;};class displayName {civ = "Poloshirt Burgundy";};};
    class U_C_Poloshirt_redwhite {class price {civ = 95;};class displayName {civ = "Poloshirt Red/White";};};
    class U_C_Poloshirt_salmon {class price {civ = 95;};class displayName {civ = "Poloshirt Salmon";};};
    class U_C_Poloshirt_stripped {class price {civ = 95;};class displayName {civ = "Poloshirt Striped";};};
    class U_C_Poloshirt_tricolour {class price {civ = 95;};class displayName {civ = "Poloshirt Colored";};};
    class U_C_Poor_2 {class price {civ = 95;};class displayName {civ = "Beggar";};};
    class U_C_Poor_1 {class price {civ = 95;};class displayName {civ = "Fugitive";};};
    class U_NikosBody {class price {civ = 95;};class displayName {civ = "Nikos";};};
    class U_B_HeliPilotCoveralls {class price {civ = 95;};class displayName {civ = "Helicopter Pilot";};};
    class U_B_PilotCoveralls {class price {civ = 95;};class displayName {civ = "Pilot";};};
    class U_B_Wetsuit {class price {civ = 100;};class displayName {civ = "Wetsuit";};};
    class H_Bandanna_gry {class price {civ = 15;};class displayName {civ = "Bandana (Black)";};};
    class H_Bandanna_cbr {class price {civ = 15;};class displayName {civ = "Bandana (Coyote)";};};
    class H_Bandanna_khk {class price {civ = 15;};class displayName {civ = "Bandana (Khaki)";};};
    class H_Bandanna_sgg {class price {civ = 15;};class displayName {civ = "Bandana (Sage)";};};
    class H_Bandanna_camo {class price {civ = 15;};class displayName {civ = "Bandana (Camo)";};};
    class H_Bandanna_surfer {class price {civ = 15;};class displayName {civ = "Bandana (Surfer)";};};
    class H_StrawHat {class price {civ = 15;};class displayName {civ = "Straw Hat";};};
    class H_BandMask_blk {class price {civ = 15;};class displayName {civ = "Bandanna Mask (Black)";};};
    class H_Booniehat_tna_F {class price {civ = 15;};class displayName {civ = "Booniehat(Tropic)";};};
    class H_Hat_blue {class price {civ = 15;};class displayName {civ = "Hat (Blue)";};};
    class H_Hat_brown {class price {civ = 15;};class displayName {civ = "Hat (Brown)";};};
    class H_Hat_checker {class price {civ = 15;};class displayName {civ = "Hat (Checker)";};};
    class H_Hat_grey {class price {civ = 15;};class displayName {civ = "Hat (Grey)";};};
    class H_Hat_tan {class price {civ = 15;};class displayName {civ = "Hat (Tan)";};};
    class H_Cap_blu {class price {civ = 15;};class displayName {civ = "Cap (Blue)";};};
    class H_Cap_grn {class price {civ = 15;};class displayName {civ = "Cap (Green)";};};
    class H_Cap_grn_BI {class price {civ = 15;};class displayName {civ = "Cap (BI)";};};
    class H_Cap_oli {class price {civ = 15;};class displayName {civ = "Cap (Olive)";};};
    class H_Cap_red {class price {civ = 15;};class displayName {civ = "Cap (Red)";};};
    class H_Cap_blk_ION {class price {civ = 15;};class displayName {civ = "Cap (ION)";};};
    class H_Cap_oli_hs {class price {civ = 15;};class displayName {civ = "Cap (Olive, Headset)";};};
    class H_Cap_blk_Raven {class price {civ = 15;};class displayName {civ = "Cap [AAF]";};};
    class H_Cap_khaki_specops_UK {class price {civ = 15;};class displayName {civ = "Cap (UK)";};};
    class H_Cap_blk_CMMG {class price {civ = 15;};class displayName {civ = "Cap (CMMG)";};};
    class H_Cap_tan {class price {civ = 15;};class displayName {civ = "Cap (Tan)";};};
    class H_Cap_surfer {class price {civ = 15;};class displayName {civ = "Cap (Surfer)";};};
    class H_Cap_press {class price {civ = 15;};class displayName {civ = "Cap (Press)";};};
    class H_Cap_usblack {class price {civ = 15;};class displayName {civ = "Cap (US Black)";};};
    class H_StrawHat_dark {class price {civ = 15;};class displayName {civ = "Straw hat (Dark)";};};
    class H_Booniehat_khk {class price {civ = 15;};class displayName {civ = "Booniehat (Khaki)";};};
    class H_Booniehat_mcamo {class price {civ = 15;};class displayName {civ = "Booniehat (MTP)";};};
    class H_Booniehat_tan {class price {civ = 15;};class displayName {civ = "Booniehat (Sand)";};};
    class H_Booniehat_dgtl {class price {civ = 15;};class displayName {civ = "Booniehat (Digital)";};};
    class H_Booniehat_khk_hs {class price {civ = 15;};class displayName {civ = "Booniehat (Headset)";};};
    class H_MilCap_oucamo {class price {civ = 25;};class displayName {civ = "Military Cap (Urban)";};};
    class H_MilCap_rucamo {class price {civ = 25;};class displayName {civ = "Military Cap (Russia)";};};
    class H_MilCap_ocamo {class price {civ = 25;};class displayName {civ = "Military Cap (Hex)";};};
    class H_Watchcap_blk {class price {civ = 50;};class displayName {civ = "Beanie";};};
    class H_Helmet_Skate {class price {civ = 75;};class displayName {civ = "Skate Helmet";};};
    class H_ShemagOpen_tan {class price {civ = 120;};class displayName {civ = "Shemag (Tan)";};};
    class H_Shemag_olive {class price {civ = 120;};class displayName {civ = "Shemag (Olive)";};};
    class H_ShemagOpen_khk {class price {civ = 120;};class displayName {civ = "Shemag (White)";};};
    class H_Cap_headphones {class price {civ = 150;};class displayName {civ = "Rangemaster Cap";};};
    class H_HelmetO_ocamo {class price {civ = 250;};class displayName {civ = "Protector Helmet (Hex)";};};
    class H_HelmetB_plain_mcamo {class price {civ = 250;};class displayName {civ = "Combat Helmet (Camo)";};};
    class H_HelmetCrew_I {class price {civ = 250;};class displayName {civ = "Crew Helmet [AAF]";};};
    class H_CrewHelmetHeli_B {class price {civ = 250;};class displayName {civ = "Heli Crew Helmet [NATO]";};};
    class H_HelmetLeaderO_ocamo {class price {civ = 250;};class displayName {civ = "Defender Helmet (Hex)";};};
    class H_PilotHelmetHeli_O {class price {civ = 250;};class displayName {civ = "Heli Pilot Helmet [CSAT]";};};
    class H_HelmetCrew_B {class price {civ = 250;};class displayName {civ = "Crew Helmet";};};
    class H_HelmetB_grass {class price {civ = 250;};class displayName {civ = "ECH (Grass)";};};
    class H_HelmetB_snakeskin {class price {civ = 250;};class displayName {civ = "ECH (Snakeskin)";};};
    class H_HelmetB_desert {class price {civ = 250;};class displayName {civ = "Combat Goggles";};};
    
    class G_Shades_Blue {class price {civ = 80;};class displayName {civ = "Shades (Blue)";};};
    class G_Shades_Black {class price {civ = 80;};class displayName {civ = "Shades (Black)";};};
    class G_Sport_Blackred {class price {civ = 100;};class displayName {civ = "Sports (Black/Red)";};};
    class G_Sport_Checkered {class price {civ = 100;};class displayName {civ = "Sports (Chequered)";};};
    class G_Sport_Blackyellow {class price {civ = 100;};class displayName {civ = "Sports (Black/Yellow)";};};
    class G_Sport_BlackWhite {class price {civ = 100;};class displayName {civ = "Sports (Black/White)";};};
    class G_Squares {class price {civ = 80;};class displayName {civ = "Square Glasses";};};
    class G_Lowprofile {class price {civ = 120;};class displayName {civ = "Low Profiles";};};
    class G_Combat {class price {civ = 150;};class displayName {civ = "Combat Glasses";};};
    class G_Aviator {class price {civ = 75;};class displayName {civ = "Glasses Aviator";};};
    class G_Lady_Mirror {class price {civ = 40;};class displayName {civ = "Glasses Mirror";};};
    class G_Lady_Dark {class price {civ = 40;};class displayName {civ = "Glasses Dark";};};
    class G_Lady_Blue {class price {civ = 40;};class displayName {civ = "Glasses Blue";};};
    class G_B_Diving {class price {civ = 80;};class displayName {civ = "Diving Goggles";};};
    class G_Balaclava_blk {class price {civ = 120;};class displayName {civ = "Balaclava (Black)";};};
    class G_Balaclava_combat {class price {civ = 120;};class displayName {civ = "Balaclava Combat Goggles";};};
    class G_Balaclava_lowprofile {class price {civ = 120;};class displayName {civ = "Balaclava Low Profile Goggles";};};
    class G_Balaclava_oli {class price {civ = 120;};class displayName {civ = "Balaclava (Olive)";};};
    class V_Press_F {class price {civ = 650;};class displayName {civ = "Press Vest";};};
    class V_RebreatherB {class price {civ = 379;};class displayName {civ = "Rebreather";};};
    class V_BandollierB_cbr {class price {civ = 400;};class displayName {civ = "Slash Bandolier (Coyote)";};};
    class V_BandollierB_khk {class price {civ = 400;};class displayName {civ = "Slash Bandolier (Khaki)";};};
    class V_BandollierB_blk {class price {civ = 400;};class displayName {civ = "Slash Bandolier (Black)";};};
    class V_BandollierB_oli {class price {civ = 400;};class displayName {civ = "Slash Bandolier (Olive)";};};
    class V_HarnessO_brn {class price {civ = 500;};class displayName {civ = "LBV Harness";};};
    class V_HarnessOGL_brn {class price {civ = 500;};class displayName {civ = "LBV Grenadier Harness";};};
    class V_HarnessO_gry {class price {civ = 500;};class displayName {civ = "LBV Harness (Gray)";};};
    class V_HarnessOGL_gry {class price {civ = 500;};class displayName {civ = "LBV Grenadier Harness (Gray)";};};
    class V_HarnessOSpec_brn {class price {civ = 500;};class displayName {civ = "ELBV Harness";};};
    class V_HarnessOSpec_gry {class price {civ = 500;};class displayName {civ = "ELBV Harness (Gray)";};};
    class V_TacVest_khk {class price {civ = 800;};class displayName {civ = "Tactical Vest (Khaki)";};};
    class V_PlateCarrierH_CTRG {class price {civ = 1200;};class displayName {civ = "CTRG Plate Carrier Rig Mk.2 (Heavy)";};};
    class B_OutdoorPack_tan {class price {civ = 75;};class displayName {civ = "Outdoor Pack (tan)";};};
    class B_OutdoorPack_blu {class price {civ = 75;};class displayName {civ = "Outdoor Pack (Blue)";};};
    class B_OutdoorPack_blk {class price {civ = 75;};class displayName {civ = "Outdoor Pack (Black)";};};
    class B_AssaultPack_tna_F {class price {civ = 100;};class displayName {civ = "Assault Pack (Tropic)";};};
    class B_AssaultPack_cbr {class price {civ = 100;};class displayName {civ = "Assault Pack (Coyote)";};};
    class B_FieldPack_ocamo {class price {civ = 125;};class displayName {civ = "Field Pack (Hex)";};};
    class B_FieldPack_ghex_F {class price {civ = 125;};class displayName {civ = "Field Pack (Green Hex)";};};
    class B_TacticalPack_oli {class price {civ = 150;};class displayName {civ = "Tactical Backpack (Olive)";};};
    class B_Kitbag_mcamo {class price {civ = 160;};class displayName {civ = "Kitbag (camo)";};};
    class B_Kitbag_cbr {class price {civ = 160;};class displayName {civ = "Kitbag";};};
    class B_Bergen_sgg {class price {civ = 170;};class displayName {civ = "Bergen (Sage)";};};
    class B_ViperLightHarness_blk_F {class price {civ = 220;};class displayName {civ = "Viper Light Harness (Black)";};};
    class B_ViperLightHarness_ghex_F {class price {civ = 220;};class displayName {civ = "Viper Light Harness (Green Hex)";};};
    class B_ViperLightHarness_hex_F {class price {civ = 220;};class displayName {civ = "Viper Light Harness (Hex)";};};
    class B_ViperLightHarness_khk_F {class price {civ = 220;};class displayName {civ = "Viper Light Harness (Khaki)";};};
    class B_ViperLightHarness_oli_F {class price {civ = 220;};class displayName {civ = "Viper Light Harness (Olive)";};};
    class B_ViperHarness_blk_F {class price {civ = 250;};class displayName {civ = "Viper Harness (Black)";};};
    class B_ViperHarness_ghex_F {class price {civ = 250;};class displayName {civ = "Viper Harness (Green Hex)";};};
    class B_ViperHarness_hex_F {class price {civ = 250;};class displayName {civ = "Viper Harness (Hex)";};};
    class B_ViperHarness_khk_F {class price {civ = 250;};class displayName {civ = "Viper Harness (Khaki)";};};
    class B_ViperHarness_oli_F {class price {civ = 250;};class displayName {civ = "Viper Harness (Olive)";};};
    class B_Carryall_ghex_F {class price {civ = 280;};class displayName {civ = "Carryall (Green Hex)";};};
    class B_Carryall_oli {class price {civ = 280;};class displayName {civ = "Carryall (Olive)";};};
    class B_Carryall_khk {class price {civ = 280;};class displayName {civ = "Carryall (Khaki)";};};
    class B_Carryall_cbr {class price {civ = 280;};class displayName {civ = "Carryall Backpack (Coyote)";};};
    class B_Bergen_mcamo_F {class price {civ = 2000;};class displayName {civ = "Bergen (Digital)";};};



    /*
    EXAMPLE:
    class arifle_SDAR_F //classname of item
    {
      class price //price for each side
      {
        guer = 0;
        west = 1050;
        civ = 15000;
      };
      class requirement //requirements to find item in shops
      {
        west = "(call life_coplevel) > 1";
        civ = "licence_civ_diver";
      };
      class displayName //Custom Display Name for item (Stun Grenade etc.)
      {
        west = "Taser Rifle";
      };
      class description //Custom Description for Item
      {
        west = "Taser Rifle";
      };
    };
    */
  };
  class weapons {

  };
};
