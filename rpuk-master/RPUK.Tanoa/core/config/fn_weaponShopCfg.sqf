#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for the weapon shops.

	Return:
	String: Close the menu
	Array:
	[Shop Name,
		[ //Array of items to add to the store
			[classname,Custom Name (set nil for default),price]
		]
	]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};

			case (call life_fnc_isAR):
			{
				["Tanoa SRG Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						["hgun_Pistol_heavy_02_F","Zubr .45",0],
						["hgun_Pistol_heavy_01_MRD_F","4-five .45",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun", 0],
						["SMG_02_F","Sting 9mm", 0],
						["arifle_SPAR_01_blk_F","SPAR-16", 0],
						["arifle_MXC_Black_F","MXC", 0],
						["arifle_MX_Black_F","MX", 0],
						["arifle_MXM_Black_F","MXM", 0],
						//["arifle_MX_SW_Black_F"," MX SW (SRG)", 0],
						["arifle_SPAR_02_blk_F","SPAR-16S", 0],
						["arifle_SPAR_01_GL_blk_F","SPAR-16 GL", 0],
						["srifle_DMR_03_F","Mk-I EMR 7.62mm", 0],
						["srifle_EBR_F","Mk18 EBR 7.62 mm", 0],
						["arifle_SPAR_03_blk_F","SPAR-17 7.62mm", 0],
						["arifle_SDAR_F","SDAR", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150x Rnd Drum TRACER",0],
						["150Rnd_556x45_Drum_Mag_F","5.56 150x Rnd Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						["20Rnd_762x51_Mag","7.62mm 20x Rnd Mag",0],
						["20Rnd_556x45_UW_mag","SDAR 20x Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						["optic_Holosight_blk_F","Holographic", 0],
						["optic_Hamr","RCO", 0],
						["optic_MRCO","MRCO", 0],
						["optic_ERCO_blk_F","ERCO", 0],
						["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						["muzzle_snds_L","Sting Suppressor 9mm", 0],
						["optic_ARCO","ARCO", 0],
						["optic_Arco_blk_F","ARCO Black", 0],
						["acc_pointer_IR","IR Pointer", 0],
						["bipod_01_F_blk","Bipod", 0],
						["optic_DMS","DMS", 0],
						["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						["SmokeShell","Smoke Grenade", 0],
						["HandGrenade_Stone","Flashbang", 0],
						["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

case (call life_fnc_isNIU):
			{
				["Tanoa NIU Armoury",
					[
						//Pistols
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","Taser 16x Rnd",0],
						["hgun_Rook40_F","Rook",0],
						["16Rnd_9x21_Mag","Rook 16x Rnd",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						["10Rnd_9x21_Mag","Lethal Pistol 10x Rnd",0],

						["SMG_05_F","Rubber Bullet Gun", 0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets 30x Rnd",0],
						
						["SMG_02_F","Sting 9mm", 0],
						["30Rnd_9x21_Mag_SMG_02","Sting 9mm Lethal 30x Rnd",0],
						
						["arifle_SPAR_01_blk_F","SPAR-16", 0],
						["30Rnd_556x45_Stanag","Lethal SPAR 30x Rnd",0],

						//MX Section
						["arifle_MX_Black_F","MX Black",0],
						["30Rnd_65x39_caseless_mag","MX 30x Rnd",0],
						["30Rnd_65x39_caseless_mag_Tracer","MX 30x Tracer",0],

						["arifle_SDAR_F","SDAR",0],
						["20Rnd_556x45_UW_mag","20x Rnd 5.56 SDAR Ammo",0],

						["muzzle_snds_M","5.56mm Silencer",0],
						["muzzle_snds_L","Sting Suppressor",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight_blk_F","Holographic Scope",0],
						["optic_Holosight_smg","Holographic SMG Scope",0],
						["optic_Holosight_smg_blk_F","Holographic SMG (Black)",0],
						["optic_Hamr","RCO Scope",0],
						["optic_MRCO","MRCO Scope",0],
						["optic_ARCO","ARCO Scope",0],
						["optic_Arco_blk_F","ARCO Scope (Black)",0],
						["optic_ERCO_blk_F","ERCO Scope",0],
						["acc_pointer_IR","IR Pointer",0],
						["bipod_01_F_blk","Bipod",0],

						["Rangefinder","Rangefinders",0],
						["acc_flashlight","Flashlight",0],

						//Equipment Section
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
//						["Binocular","Binocular", 0],
						["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0],
						["B_UavTerminal","UAV Terminal", 0]
					]
				];
			};
			//END OF NIU Section


			case (__GETC__(life_plodrank) == 11 || __GETC__(life_plodrank) == 12):
			{
				["Tanoa CSI Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						["hgun_Pistol_heavy_02_F","Zubr .45 (CSI)",0],
						["hgun_Pistol_heavy_01_MRD_F","4-five .45 (CSI)",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun (CSI)", 0],
						["SMG_02_F","Sting 9mm (CSI)", 0],
						["arifle_SPAR_01_blk_F","SPAR-16 (CSI)", 0],
						["arifle_MXC_Black_F","MXC (CSI)", 0],
						["arifle_MX_Black_F","MX (CSI)", 0],
						["arifle_MXM_Black_F","MXM (CSI)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (CSI)", 0],
						["arifle_SPAR_02_blk_F","SPAR-16S (CSI)", 0],
						["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (CSI)", 0],
						["srifle_DMR_03_F","Mk-I EMR 7.62mm (CSI)", 0],
						["srifle_EBR_F","Mk18 EBR 7.62 mm (CSI)", 0],
						["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (CSI)", 0],
						["arifle_SDAR_F","SDAR (CSI)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						["optic_Holosight_blk_F","Holographic", 0],
						["optic_Hamr","RCO", 0],
						["optic_MRCO","MRCO", 0],
						["optic_ERCO_blk_F","ERCO", 0],
						["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						["muzzle_snds_L","Sting Suppressor 9mm", 0],
						["optic_ARCO","ARCO", 0],
						["optic_Arco_blk_F","ARCO Black", 0],
						["acc_pointer_IR","IR Pointer", 0],
						["bipod_01_F_blk","Bipod", 0],
						["optic_DMS","DMS", 0],
						["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						["SmokeShell","Smoke Grenade", 0],
						["HandGrenade_Stone","Flashbang", 0],
						["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 10):
			{
				["Tanoa SI Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						["hgun_Pistol_heavy_02_F","Zubr .45 (SI)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (SI)",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun (SI)", 0],
						["SMG_02_F","Sting 9mm (SI)", 0],
						["arifle_SPAR_01_blk_F","SPAR-16 (SI)", 0],
						["arifle_MXC_Black_F","MXC (SI)", 0],
						["arifle_MX_Black_F","MX (SI)", 0],
						["arifle_MXM_Black_F","MXM (SI)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (SI)", 0],
						["arifle_SPAR_02_blk_F","SPAR-16S (SI)", 0],
						["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (SI)", 0],
						["srifle_DMR_03_F","Mk-I EMR 7.62mm (SI)", 0],
						["srifle_EBR_F","Mk18 EBR 7.62 mm (SI)", 0],
						["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (SI)", 0],
						["arifle_SDAR_F","SDAR (SI)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						["optic_Holosight_blk_F","Holographic", 0],
						["optic_Hamr","RCO", 0],
						["optic_MRCO","MRCO", 0],
						["optic_ERCO_blk_F","ERCO", 0],
						["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						["muzzle_snds_L","Sting Suppressor 9mm", 0],
						["optic_ARCO","ARCO", 0],
						["optic_Arco_blk_F","ARCO Black", 0],
						["acc_pointer_IR","IR Pointer", 0],
						["bipod_01_F_blk","Bipod", 0],
						["optic_DMS","DMS", 0],
						["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						["SmokeShell","Smoke Grenade", 0],
						["HandGrenade_Stone","Flashbang", 0],
						["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 9):
			{
				["Tanoa CI Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (CI)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (CI)",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun (CI)", 0],
						["SMG_02_F","Sting 9mm (CI)", 0],
						["arifle_SPAR_01_blk_F","SPAR-16 (CI)", 0],
						["arifle_MXC_Black_F","MXC (CI)", 0],
						["arifle_MX_Black_F","MX (CI)", 0],
						["arifle_MXM_Black_F","MXM (CI)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (CI)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (CI)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (CI)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (CI)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (CI)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (CI)", 0],
						//["arifle_SDAR_F","SDAR (CI)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						["optic_Holosight_blk_F","Holographic", 0],
						["optic_Hamr","RCO", 0],
						["optic_MRCO","MRCO", 0],
						["optic_ERCO_blk_F","ERCO", 0],
						["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						["muzzle_snds_L","Sting Suppressor 9mm", 0],
						["optic_ARCO","ARCO", 0],
						["optic_Arco_blk_F","ARCO Black", 0],
						["acc_pointer_IR","IR Pointer", 0],
						["bipod_01_F_blk","Bipod", 0],
						["optic_DMS","DMS", 0],
						["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 8):
			{
				["Tanoa DI Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (DI)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (DI)",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun (DI)", 0],
						["SMG_02_F","Sting 9mm (DI)", 0],
						["arifle_SPAR_01_blk_F","SPAR-16 (DI)", 0],
						["arifle_MXC_Black_F","MXC (DI)", 0],
						["arifle_MX_Black_F","MX (DI)", 0],
						//["arifle_MXM_Black_F","MXM (DI)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (DI)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (DI)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (DI)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (DI)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (DI)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (DI)", 0],
						//["arifle_SDAR_F","SDAR (DI)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						["optic_Holosight_blk_F","Holographic", 0],
						["optic_Hamr","RCO", 0],
						["optic_MRCO","MRCO", 0],
						["optic_ERCO_blk_F","ERCO", 0],
						["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						["muzzle_snds_L","Sting Suppressor 9mm", 0],
						["optic_ARCO","ARCO", 0],
						["optic_Arco_blk_F","ARCO Black", 0],
						["acc_pointer_IR","IR Pointer", 0],
						["bipod_01_F_blk","Bipod", 0],
						//["optic_DMS","DMS", 0],
						//["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 7):
			{
				["Tanoa Inspector Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (Ins)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (Ins)",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun (Ins)", 0],
						["SMG_02_F","Sting 9mm (Ins)", 0],
						["arifle_SPAR_01_blk_F","SPAR-16 (Ins)", 0],
						["arifle_MXC_Black_F","MXC (Ins)", 0],
						//["arifle_MX_Black_F","MX (Ins)", 0],
						//["arifle_MXM_Black_F","MXM (Ins)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (Ins)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (Ins)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (Ins)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (Ins)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (Ins)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (Ins)", 0],
						//["arifle_SDAR_F","SDAR (Ins)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						["optic_Holosight_blk_F","Holographic", 0],
						["optic_Hamr","RCO", 0],
						["optic_MRCO","MRCO", 0],
						["optic_ERCO_blk_F","ERCO", 0],
						//["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						["muzzle_snds_L","Sting Suppressor 9mm", 0],
						["optic_ARCO","ARCO", 0],
						["optic_Arco_blk_F","ARCO Black", 0],
						["acc_pointer_IR","IR Pointer", 0],
						["bipod_01_F_blk","Bipod", 0],
						//["optic_DMS","DMS", 0],
						//["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						//["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 6):
			{
				["Tanoa DSGT Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (DSGT)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (DSGT)",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun (DSGT)", 0],
						["SMG_02_F","Sting 9mm (DSGT)", 0],
						["arifle_SPAR_01_blk_F","SPAR-16 (DSGT)", 0],
						//["arifle_MXC_Black_F","MXC (DSGT)", 0],
						//["arifle_MX_Black_F","MX (DSGT)", 0],
						//["arifle_MXM_Black_F","MXM (DSGT)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (DSGT)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (DSGT)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (DSGT)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (DSGT)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (DSGT)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (DSGT)", 0],
						//["arifle_SDAR_F","SDAR (DSGT)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						//["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						//["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						["optic_Holosight_blk_F","Holographic", 0],
						//["optic_Hamr","RCO", 0],
						["optic_MRCO","MRCO", 0],
						//["optic_ERCO_blk_F","ERCO", 0],
						//["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						//["muzzle_snds_L","Sting Suppressor 9mm", 0],
						["optic_ARCO","ARCO", 0],
						["optic_Arco_blk_F","ARCO Black", 0],
						//["acc_pointer_IR","IR Pointer", 0],
						//["bipod_01_F_blk","Bipod", 0],
						//["optic_DMS","DMS", 0],
						//["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						//["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						//["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 5):
			{
				["Tanoa SGT Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (SGT)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (SGT)",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun (SGT)", 0],
						["SMG_02_F","Sting 9mm (SGT)", 0],
						//["arifle_SPAR_01_blk_F","SPAR-16 (SGT)", 0],
						//["arifle_MXC_Black_F","MXC (SGT)", 0],
						//["arifle_MX_Black_F","MX (SGT)", 0],
						//["arifle_MXM_Black_F","MXM (SGT)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (SGT)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (SGT)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (SGT)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (SGT)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (SGT)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (SGT)", 0],
						//["arifle_SDAR_F","SDAR (SGT)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						//["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						//["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						//["optic_Holosight_blk_F","Holographic", 0],
						//["optic_Hamr","RCO", 0],
						["optic_MRCO","MRCO", 0],
						//["optic_ERCO_blk_F","ERCO", 0],
						//["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						//["muzzle_snds_L","Sting Suppressor 9mm", 0],
						//["optic_ARCO","ARCO", 0],
						//["optic_Arco_blk_F","ARCO Black", 0],
						//["acc_pointer_IR","IR Pointer", 0],
						//["bipod_01_F_blk","Bipod", 0],
						//["optic_DMS","DMS", 0],
						//["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						//["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						//["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 4):
			{
				["Tanoa SPC Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						//["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (SPC)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (SPC)",0],

						//Rifles
						["SMG_05_F", "Rubber Bullet Gun (SPC)", 0],
						//["SMG_02_F","Sting 9mm (SPC)", 0],
						//["arifle_SPAR_01_blk_F","SPAR-16 (SPC)", 0],
						//["arifle_MXC_Black_F","MXC (SPC)", 0],
						//["arifle_MX_Black_F","MX (SPC)", 0],
						//["arifle_MXM_Black_F","MXM (SPC)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (SPC)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (SPC)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (SPC)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (SPC)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (SPC)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (SPC)", 0],
						//["arifle_SDAR_F","SDAR (SPC)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						//["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						//["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						//["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						//["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						//["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						["acc_flashlight","Flashlight", 0],
						["optic_Aco","ACO (Red)", 0],
						["optic_ACO_grn","ACO (Green)", 0],
						//["optic_Holosight_blk_F","Holographic", 0],
						//["optic_Hamr","RCO", 0],
						//["optic_MRCO","MRCO", 0],
						//["optic_ERCO_blk_F","ERCO", 0],
						//["muzzle_snds_M","5.56 Suppressor", 0],
						["optic_Holosight_smg","Holographic SMG", 0],
						["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						//["muzzle_snds_L","Sting Suppressor 9mm", 0],
						//["optic_ARCO","ARCO", 0],
						//["optic_Arco_blk_F","ARCO Black", 0],
						//["acc_pointer_IR","IR Pointer", 0],
						//["bipod_01_F_blk","Bipod", 0],
						//["optic_DMS","DMS", 0],
						//["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						//["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						//["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 3):
			{
				["Tanoa PC Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						//["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (SPC)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (SPC)",0],

						//Rifles
						//["SMG_05_F", "Rubber Bullet Gun (SPC)", 0],
						//["SMG_02_F","Sting 9mm (SPC)", 0],
						//["arifle_SPAR_01_blk_F","SPAR-16 (SPC)", 0],
						//["arifle_MXC_Black_F","MXC (SPC)", 0],
						//["arifle_MX_Black_F","MX (SPC)", 0],
						//["arifle_MXM_Black_F","MXM (SPC)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (SPC)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (SPC)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (SPC)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (SPC)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (SPC)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (SPC)", 0],
						//["arifle_SDAR_F","SDAR (SPC)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						//["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						//["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						//["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						//["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						//["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						//["acc_flashlight","Flashlight", 0],
						//["optic_Aco","ACO (Red)", 0],
						//["optic_ACO_grn","ACO (Green)", 0],
						//["optic_Holosight_blk_F","Holographic", 0],
						//["optic_Hamr","RCO", 0],
						//["optic_MRCO","MRCO", 0],
						//["optic_ERCO_blk_F","ERCO", 0],
						//["muzzle_snds_M","5.56 Suppressor", 0],
						//["optic_Holosight_smg","Holographic SMG", 0],
						//["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						//["muzzle_snds_L","Sting Suppressor 9mm", 0],
						//["optic_ARCO","ARCO", 0],
						//["optic_Arco_blk_F","ARCO Black", 0],
						//["acc_pointer_IR","IR Pointer", 0],
						//["bipod_01_F_blk","Bipod", 0],
						//["optic_DMS","DMS", 0],
						//["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						//["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						//["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 2):
			{
				["Tanoa PCSO Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Standard Taser",0],
						//["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						//["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (SPC)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (SPC)",0],

						//Rifles
						//["SMG_05_F", "Rubber Bullet Gun (SPC)", 0],
						//["SMG_02_F","Sting 9mm (SPC)", 0],
						//["arifle_SPAR_01_blk_F","SPAR-16 (SPC)", 0],
						//["arifle_MXC_Black_F","MXC (SPC)", 0],
						//["arifle_MX_Black_F","MX (SPC)", 0],
						//["arifle_MXM_Black_F","MXM (SPC)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (SPC)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (SPC)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (SPC)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (SPC)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (SPC)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (SPC)", 0],
						//["arifle_SDAR_F","SDAR (SPC)", 0],

						//Ammunition
						["16Rnd_9x21_Mag","Taser Cartridge",0],
						//["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						//["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						//["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						//["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						//["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						//["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						//["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						//["acc_flashlight","Flashlight", 0],
						//["optic_Aco","ACO (Red)", 0],
						//["optic_ACO_grn","ACO (Green)", 0],
						//["optic_Holosight_blk_F","Holographic", 0],
						//["optic_Hamr","RCO", 0],
						//["optic_MRCO","MRCO", 0],
						//["optic_ERCO_blk_F","ERCO", 0],
						//["muzzle_snds_M","5.56 Suppressor", 0],
						//["optic_Holosight_smg","Holographic SMG", 0],
						//["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						//["muzzle_snds_L","Sting Suppressor 9mm", 0],
						//["optic_ARCO","ARCO", 0],
						//["optic_Arco_blk_F","ARCO Black", 0],
						//["acc_pointer_IR","IR Pointer", 0],
						//["bipod_01_F_blk","Bipod", 0],
						//["optic_DMS","DMS", 0],
						//["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						//["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						//["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};

			default
			{
				["Tanoa CSO Store",
					[
						//Pistols
						//["hgun_P07_snds_F","Standard Taser",0],
						//["hgun_Rook40_snds_F"," Advanced Taser (Black)",0],
						//["hgun_Pistol_01_F","Lethal Pistol",0],
						//["hgun_Pistol_heavy_02_F","Zubr .45 (SPC)",0],
						//["hgun_Pistol_heavy_01_MRD_F","4-five .45 (SPC)",0],

						//Rifles
						//["SMG_05_F", "Rubber Bullet Gun (SPC)", 0],
						//["SMG_02_F","Sting 9mm (SPC)", 0],
						//["arifle_SPAR_01_blk_F","SPAR-16 (SPC)", 0],
						//["arifle_MXC_Black_F","MXC (SPC)", 0],
						//["arifle_MX_Black_F","MX (SPC)", 0],
						//["arifle_MXM_Black_F","MXM (SPC)", 0],
						//["arifle_MX_SW_Black_F"," MX SW (SPC)", 0],
						//["arifle_SPAR_02_blk_F","SPAR-16S (SPC)", 0],
						//["arifle_SPAR_01_GL_blk_F","SPAR-16 GL (SPC)", 0],
						//["srifle_DMR_03_F","Mk-I EMR 7.62mm (SPC)", 0],
						//["srifle_EBR_F","Mk18 EBR 7.62 mm (SPC)", 0],
						//["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (SPC)", 0],
						//["arifle_SDAR_F","SDAR (SPC)", 0],

						//Ammunition
						//["16Rnd_9x21_Mag","Taser Cartridge",0],
						//["30Rnd_9x21_Mag_SMG_02_Tracer_Red","Rubber Bullets",0],
						//["10Rnd_9x21_Mag","Lethal Pistol Ammo",0],
						//["30Rnd_556x45_Stanag","5.56mm SPAR-16 Ammo",0],
						//["30Rnd_556x45_Stanag_Tracer_Red","5.56mm SPAR-16 Tracers",0],
						//["30Rnd_9x21_Mag_SMG_02","Sting Ammo",0],
						//["30Rnd_65x39_caseless_mag","6.5mm Ammo",0],
						//["30Rnd_65x39_caseless_mag_Tracer","6.5mm Ammo (Tracer)",0],
						//["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder",0],
						//["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag",0],
						//["100Rnd_65x39_caseless_mag","6.5mm 100rnd mag",0],
						//["150Rnd_556x45_Drum_Mag_Tracer_F","5.56 150RND Drum TRACER",0],
						//["150Rnd_556x45_Drum_Mag_F","5.56 150RND Drum",0],
						//["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100rnd mag (Tracer)",0],
						//["1Rnd_Smoke_Grenade_shell","GL Smoke Rounds (White)",0],
						//["20Rnd_762x51_Mag","7.62mm 20Rnd Mag",0],
						//["20Rnd_556x45_UW_mag","SDAR 20Rnd Dual Purpose Mag",0],

						//Attachments
						//["acc_flashlight","Flashlight", 0],
						//["optic_Aco","ACO (Red)", 0],
						//["optic_ACO_grn","ACO (Green)", 0],
						//["optic_Holosight_blk_F","Holographic", 0],
						//["optic_Hamr","RCO", 0],
						//["optic_MRCO","MRCO", 0],
						//["optic_ERCO_blk_F","ERCO", 0],
						//["muzzle_snds_M","5.56 Suppressor", 0],
						//["optic_Holosight_smg","Holographic SMG", 0],
						//["optic_Holosight_smg_blk_F","Holographic  SMG (Black)", 0],
						//["muzzle_snds_L","Sting Suppressor 9mm", 0],
						//["optic_ARCO","ARCO", 0],
						//["optic_Arco_blk_F","ARCO Black", 0],
						//["acc_pointer_IR","IR Pointer", 0],
						//["bipod_01_F_blk","Bipod", 0],
						//["optic_DMS","DMS", 0],
						//["muzzle_snds_H","6.5mm Suppressor", 0],
						//["optic_LRPS","LRPS", 0],
						//["optic_AMS","AMS", 0],
						//["muzzle_snds_B","7.62mm Suppressor", 0],

						//Equipment Section
						//["SmokeShell","Smoke Grenade", 0],
						//["HandGrenade_Stone","Flashbang", 0],
						//["B_UavTerminal","UAV Terminal", 0],
						["ToolKit","Toolkit", 0],
						["Medikit","Medikit", 0],
						["FirstAidKit","First Aid Kit", 0],
						["ItemRadio","Radio", 0],
						["ItemGPS","GPS", 0],
						["ItemMap","Map", 0],
						["ItemCompass","Compass", 0],
						["ItemWatch","Watch", 0],
						["Binocular","Binocular", 0],
						//["Rangefinder","Rangefinders", 0],
						["NVGoggles_OPFOR","Night Vision (Black)", 0]
					]
				];
			};
		};
	};

	case "fireworks":
	{
		["Fireworks",
			[
				["hgun_Pistol_Signal_F","Firework Launcher",0],
				["6Rnd_RedSignal_F","Red Rocket",0],
				["6Rnd_GreenSignal_F","Green Rocket",0]
			]
		];
	};

	case "pharmacy":
	{
		["Welly's Pharmacy",
			[
				["FirstAidKit","First Aid Kit", 145]
			]
		];
	};

		case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have Rebel Membership!"};
			default
			{
				["Blackmarket Weapon Shop",
					[
						["ItemGPS","GPS", 200],
						["NVGoggles_OPFOR","NV Goggles (Black)", 250],
						["NVGoggles_INDEP","NV Goggles (Green)", 300],
						["FirstAidKit","First Aid Kit", 145],
						["hgun_Pistol_01_F","PM 9mm", 1200],
						["hgun_Rook40_F","Rook-40 9 mm", 1250],
						["hgun_ACPC2_F","ACP-C2 .45", 1400],
						["hgun_Pistol_heavy_01_F","4-five .45", 1750],
						["hgun_Pistol_heavy_02_F","Zubr .45", 1500],
						//Main Weapons Start
						["hgun_PDW2000_F","PDW2000 9 mm", 2200],
						["SMG_02_F","Sting 9 mm", 2500],
						["SMG_05_F","Protector 9mm", 2800],
						["SMG_01_F","Vermin SMG .45 ACP", 4000],
						["arifle_AKS_F","AKS-74U 5.45mm", 4500],
						["arifle_SDAR_F","SDAR 5.56 mm", 2000],
						["arifle_Mk20C_F","Mk20C 5.56 mm (Camo)", 4000],
						["arifle_Mk20_F","Mk20 5.56 mm (Camo)", 5000],
						["arifle_SPAR_01_blk_F","SPAR-16 5.56mm (Black)", 6750],
						["arifle_SPAR_01_khk_F","SPAR-16 5.56mm (Khaki)", 9050],
						["arifle_SPAR_01_snd_F","SPAR-16 5.56mm (Sand)", 4250],
						["arifle_TRG21_F","TRG-21 5.56 mm (lb)", 6000],
						["arifle_TRG20_F","TRG-20 5.56 mm (sb)", 5000],
						["arifle_CTAR_blk_F","CAR-95 5.8mm(Black)", 6000],
						["arifle_CTAR_ghex_F","CAR-95 5.8mm(Greenhex)", 8000],
						["arifle_CTAR_hex_F","CAR-95 5.8mm(Hex)", 10000],
						["arifle_Katiba_F","Katiba 6.5 mm", 6850],
						["arifle_Katiba_C_F","Katiba Carbine 6.5 mm", 5850],
						["arifle_MXC_F","MXC 6.5 mm (Sand)", 7500],
						["arifle_MXC_Black_F","MXC 6.5 mm (Black)", 10000],
						["arifle_MXC_khk_F","MXC 6.5mm (Khaki)", 12500],
						["arifle_MX_F","MX 6.5 mm (Sand)", 8000],
						["arifle_MX_Black_F","MX 6.5 mm (Black)", 10500],
						["arifle_MX_khk_F","MX 6.5mm (Khaki)", 13000],
						["arifle_MX_SW_F","MX SW 6.5 mm (Sand)", 8500],
						["arifle_MX_SW_Black_F","MX SW 6.5 mm (Black)", 11500],
						["arifle_MX_SW_khk_F","MX SW 6.5mm (Khaki)", 13500],
						["arifle_MXM_F","MXM 6.5 mm (Sand)", 10500],
						["arifle_MXM_Black_F","MXM 6.5 mm (Black)", 13000],
						["arifle_MXM_khk_F","MXM 6.5mm (Khaki)", 15500],
						["srifle_DMR_07_blk_F","CMR-76 6.5mm (Black)", 12500],
						["srifle_DMR_07_ghex_F","CMR-76 6.5mm (Greenhex)", 15000],
						["srifle_DMR_07_hex_F","CMR-76 6.5mm (Hex)", 17500],
						["srifle_DMR_01_F","Rahim 7.62 mm", 25500],
						["srifle_EBR_F","Mk18 EBR 7.62 mm", 31500],
						["srifle_DMR_03_khaki_F","Mk-I EMR 7.62mm (Khaki)", 36500],
						["srifle_DMR_03_tan_F","Mk-I EMR 7.62mm (Sand)", 36500],
						["srifle_DMR_03_multicam_F","Mk-I EMR 7.62mm (Camo)", 36500],
						["srifle_DMR_03_woodland_F","Mk-I EMR 7.62mm (Woodland)", 36500],
						["srifle_DMR_06_camo_F","Mk14 7.62mm (Camo)", 29000],
						["srifle_DMR_06_olive_F","Mk14 7.62mm (Olive)", 29000],
						["srifle_DMR_06_camo_khs_F","Mk14 7.62mm (Camo)", 29000],
						["arifle_AK12_F","AK-12 7.62mm", 12000],
						["arifle_AKM_F","AKM 7.62mm", 14000],
						["arifle_SPAR_03_blk_F","SPAR-17 7.62mm (Black)", 41500],
						["arifle_SPAR_03_khk_F","SPAR-17 7.62mm (Khaki)", 41500],
						["arifle_SPAR_03_snd_F","SPAR-17 7.62mm (Sand)", 41500],

						["10Rnd_9x21_Mag","10rnd 9mm ", 250],
						["16Rnd_9x21_Mag","16rnd 9mm", 250],
						["16Rnd_9x21_red_Mag","16rnd 9mm (Tracer Red)", 300],
						["16Rnd_9x21_green_Mag","16rnd 9mm (Tracer Green)", 300],
						["16Rnd_9x21_yellow_Mag","16rnd 9mm (Tracer Yellow)", 300],
						["9Rnd_45ACP_Mag",".45 ACP 9Rnd Mag", 350],
						["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag", 400],
						["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder", 300],
						["30Rnd_9x21_Mag","30rnd 9mm", 500],
						["30Rnd_9x21_Mag_SMG_02","30rnd 9mm (Protector)", 500],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Green","30rnd 9mm (Protector)(Tgreen)", 600],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Red","30rnd 9mm (Protector)(Tred)", 600],
						["30Rnd_9x21_Mag_SMG_02_Tracer_Yellow","30rnd 9mm (Protector)(Tyellow)", 600],
						["30Rnd_9x21_Green_Mag","30rnd 9mm (Tracer Green)", 600],
						["30Rnd_9x21_Red_Mag","30rnd 9mm (Tracer Red)", 600],
						["30Rnd_9x21_Yellow_Mag","30rnd 9mm (Tracer Yellow)", 600],
						["30Rnd_45ACP_Mag_SMG_01",".45 ACP 30Rnd Vermin Mag", 400],
						["30Rnd_45ACP_Mag_SMG_01_Tracer_Green",".45 30Rnd Vermin Tracers (Green) Mag", 500],
						["30Rnd_545x39_Mag_F","30rnd 5.45mm ", 400],
						["30Rnd_545x39_Mag_Tracer_Green_F","30rnd 5.45mm (Tracer Green)", 500],
						["30Rnd_545x39_Mag_Tracer_F","30rnd 5.45mm (Tracer Yellow)", 500],
						["30Rnd_545x39_Mag_Green_F","30rnd 5.45mm Green", 450],
						["20Rnd_556x45_UW_mag","20rnd 5.56 SDAR Ammo", 500],
						["30Rnd_556x45_Stanag","30rnd 5.56mm ", 550],
						["30Rnd_556x45_Stanag_Tracer_Green","30rnd 5.56mm (Tracer Green)", 650],
						["30Rnd_556x45_Stanag_Tracer_Red","30rnd 5.56mm (Tracer Red)", 650],
						["30Rnd_556x45_Stanag_Tracer_Yellow","30rnd 5.56mm (Tracer Yellow)", 650],
						["30Rnd_556x45_Stanag_green","30rnd 5.56mm Green", 600],
						["30Rnd_556x45_Stanag_red","30rnd 5.56mm Red", 600],
						["30Rnd_580x42_Mag_F","30rnd 5.8mm", 600],
						["30Rnd_580x42_Mag_Tracer_F","30rnd 5.8mm (Tracer Green)", 700],
						["30Rnd_65x39_caseless_green","6.5mm 30Rnd Caseless Mag", 750],
						["30Rnd_65x39_caseless_mag","6.5mm 30Rnd STANAG Mag", 750],
						["30Rnd_65x39_caseless_green_mag_Tracer","6.5mm 30Rnd Tracer (Green) Mag", 850],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm 30Rnd Tracer (Red) Mag", 850],
						["30Rnd_762x39_Mag_F","30rnd 7.62mm ", 900],
						["30Rnd_762x39_Mag_Tracer_Green_F","30rnd 7.62mm (Tracer Green)", 1200],
						["30Rnd_762x39_Mag_Tracer_F","30rnd 7.62mm (Tracer Yellow)", 1200],
						["30Rnd_762x39_Mag_Green_F","30rnd 7.62mm Green", 1000],
						["10Rnd_762x54_Mag","7.62mm 10Rnd Mag", 1000],
						["20Rnd_762x51_Mag","7.62mm 20Rnd Mag", 1500],
						["SmokeShell","Smoke Grenade (White)", 150],
						["O_IR_Grenade","IR Grenade [CSAT]", 150],

						//Attachments
						["acc_flashlight","Flashlight", 300],
						["optic_Aco","ACO (Red)", 400],
						["optic_ACO_grn","ACO (Green)", 400],
						["optic_Aco_smg","ACO SMG (Red)", 400],
						["optic_ACO_grn_smg","ACO SMG (Green)", 400],
						["muzzle_snds_L","Suppressor (9 mm)", 500],
						["optic_Holosight_blk_F","MK17 Holosight (Black)", 500],
						["optic_Holosight","MK17 Holosight (Sand)", 500],
						["optic_Holosight_khk_F","MK17 Holosight (Khaki)", 500],
						["optic_Holosight_smg_blk_F","MK17 Holosight SMG (Black)", 500],
						["optic_Holosight_smg","Mk17 Holosight SMG (Tan)", 500],
						["muzzle_snds_acp","Suppressor (.45 ACP)", 600],
						["acc_pointer_IR","IR Laser Pointer", 600],
						["muzzle_snds_m_snd_F","Suppressor (5.56mm) (Sand)", 750],
						["muzzle_snds_M","Suppressor (5.56mm) (Black)", 800],
						["optic_Arco_blk_F","ARCO (Black)", 800],
						["optic_Arco","ARCO (Sand)", 800],
						["optic_Arco_ghex_F","ARCO (Greenhex)", 800],
						["optic_Hamr","RCO (Black)", 800],
						["optic_Hamr_khk_F","RCO (Khaki)", 800],
						["optic_MRCO","MRCO", 800],
						["muzzle_snds_m_khk_F","Suppressor (5.56mm) (Khaki)", 850],
						["muzzle_snds_H","Suppressor (6.5mm) (Black)", 900],
						["bipod_01_F_snd","Bipod (Sand) [NATO]", 900],
						["bipod_01_F_blk","Bipod (Black) [NATO]", 900],
						["bipod_01_F_mtp","Bipod (MTP) [NATO]", 900],
						["bipod_02_F_blk","Bipod (Black) [CSAT]", 900],
						["bipod_02_F_tan","Bipod (Tan) [CSAT]", 900],
						["bipod_02_F_hex","Bipod (Hex) [CSAT]", 900],
						["bipod_03_F_blk","Bipod (Black) [AAF]", 900],
						["bipod_03_F_oli","Bipod (Olive) [AAF]", 900],
						["bipod_01_F_khk","Bipod (Khaki) [NATO]", 900],
						["muzzle_snds_H_khk_F","Suppressor (6.5mm) (Khaki)", 1000],
						["optic_ERCO_blK_F","ERCO (Black)", 1000],
						["optic_ERCO_snd_F","ERCO (Sand)", 1000],
						["optic_ERCO_khk_F","ERCO (Khaki)", 1000],
						["muzzle_snds_H_MG","Suppressor MX SW (6.5 mm) (Tan)", 1200],
						["muzzle_snds_H_MG_blk_F","Suppressor MX SW (6.5mm) (Black)", 1400],
						["optic_DMS","DMS", 1500],
						["optic_DMS_ghex_F","DMS (Greenhex)", 1500],
						["muzzle_snds_H_MG_khk_F","Suppressor MX SW (6.5mm) (Khaki)", 1600],
						["muzzle_snds_B_snd_F","Suppressor (7.62mm) (Sand)", 2000],
						["muzzle_snds_B","Suppressor (7.62mm) (Black)", 2200],
						["muzzle_snds_B_khk_F","Suppressor (7.62mm) (Khaki)", 2400],
						["optic_AMS_snd","AMS (Sand)", 2400],
						["optic_AMS_khk","AMS (Khaki)", 2400],
						["optic_AMS","AMS (Black)", 2400],
						["optic_KHS_old","Khalia Old", 2500],
						["optic_KHS_blk","Kahlia (Black)", 2500],
						["optic_KHS_hex","Kahlia (Hex)", 2500],
						["optic_KHS_tan","Kahlia (Tan)", 2500],
						["muzzle_snds_65_TI_blk_F","S-Suppressor (6.5mm) (Black)", 3000],
						["muzzle_snds_65_TI_hex_F","S-Suppressor (6.5mm) (Hex)", 3500],
						["muzzle_snds_65_TI_ghex_F","S-Suppressor (6.5mm) (GreenHex)", 3500]
					]
				];
			};
		};
	};

	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms licence!"};
			default
			{
				["Ardy Emban Firearms",
					[
						//pistols
						//["hgun_P07_F","P07 9 mm", 1000],
						["hgun_Pistol_01_F","PM 9mm", 1200],
						["hgun_Rook40_F","Rook-40 9 mm", 1250],
						["hgun_ACPC2_F","ACP-C2 .45", 1400],
						["hgun_Pistol_heavy_01_F","4-five .45", 1750],
						["hgun_Pistol_heavy_02_F","Zubr .45", 1500],
						["hgun_Pistol_Signal_F","Starter Pistol", 600],
						//ammo
						["10Rnd_9x21_Mag","10rnd 9mm ", 250],
						["16Rnd_9x21_Mag","16rnd 9mm ", 250],
						["16Rnd_9x21_red_Mag","16rnd 9mm (Tracer Red)", 300],
						["16Rnd_9x21_green_Mag","16rnd 9mm (Tracer Green)", 300],
						["16Rnd_9x21_yellow_Mag","16rnd 9mm (Tracer Yellow)", 300],
						["9Rnd_45ACP_Mag",".45 ACP 9Rnd Mag", 350],
						["11Rnd_45ACP_Mag",".45 ACP 11Rnd Mag", 400],
						["6Rnd_45ACP_Cylinder",".45 ACP 6Rnd Cylinder", 300] //,
						//["6Rnd_RedSignal_F","6Rnd Signal Cylinder (Red)", 500]
					]
				];
			};
		};
	};


	case "genstore":
	{
		["General Store",
			[
				["ToolKit","Toolkit", 100],
				["FirstAidKit","First Aid Kit", 75],
				["ItemGPS","GPS", 100],
				["Binocular","Binoculars", 50],
				["ItemCompass","Compass", 100],
				["ItemWatch","Watch", 20],
				["ItemMap","Map", 12],
				["NVGoggles","Civilian NVG", 200]
			]
		];
	};

	case "fuelstore":
	{
		["Fuel Store",
			[
				["ItemGPS","GPS",150],
				["ItemMap","Map",60],
				["ToolKit","Toolkit",120],
				["FirstAidKit","First Aid Kit",80]
			]
		];
	};

	case "kartstore":
	{
		["Stig's Racing Supplies",
			[
				["hgun_Pistol_Signal_F",nil,600],
				["6Rnd_RedSignal_F",nil,500],
				["ToolKit",nil,250],
				["FirstAidKit",nil,300],
				["NVGoggles","Civilian NVG", 300]
			]
		];
	};
};