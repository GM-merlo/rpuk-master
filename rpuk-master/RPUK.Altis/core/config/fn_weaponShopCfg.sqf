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
				["Altis ARV Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],
						["hgun_Rook40_F","Rook",0],
						["16Rnd_9x21_Mag","Rookx16 Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG [SPC]",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer [SPC]",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["optic_MRCO","MRCO Scope",0],
						["optic_ARCO","ARCO Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin [SPC]",0],
						["SMG_01_Holo_F","Vermin+HoloScope [SPC]",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd [SPC]",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer [SPC]",0],
						["optic_Holosight_smg","Vermin Holographic [SPC]",0],
						["muzzle_snds_acp",".45 Supressor",0],

						//MX Section
						["arifle_MXC_Black_F","MXC Black [SGT]",0],
						["arifle_MX_Black_F","MX Black [DSGT]",0],
						["arifle_MXM_Black_F","MXM Black [DI]",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd [SGT]",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer [SGT]",0],

						//Officers pistol
						["hgun_Pistol_heavy_02_F","Officer's Pistol [SI]",0],
						["6Rnd_45ACP_Cylinder","6xOfficer's Mags [SI]",0],

						["hgun_Pistol_heavy_01_F","4-Five [CSI]",0],
						["11Rnd_45ACP_Mag","11x4-Five Rnd [CSI]",0],
						["optic_MRD","4-Five Scope [CSI]",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],

						//TFU GEAR
						["srifle_EBR_F","MK18",0],
						["srifle_DMR_03_F","MK-1[MARKSMEN]",0],
						["20Rnd_762x51_Mag","MK18x20 Rnd",0],
						["arifle_MX_GL_Black_F","MX-3GL [AR]",0],
						["3Rnd_Smoke_Grenade_shell","MX-3GL Smoke Grenade Rounds",0],
						["Rangefinder","Rangefinders",0],
						["arifle_MX_SW_Black_F","MX SW",0],
						["100Rnd_65x39_caseless_mag","100xMX SW",0],
						["muzzle_snds_H","6.5 Supressor",0],
						["muzzle_snds_B","MK18 Supressor",0],
						["muzzle_snds_L","9MM Supressor",0],
						["optic_LRPS","LRPS Scope",0],
						["optic_SOS","SOS Scope",0],
						["optic_DMS","DMS Scope",0],
						["HandGrenade_Stone","Flashbang",0],
						["bipod_01_F_blk","Bipod",0],
						["acc_flashlight","Flashlight",0],

						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (call life_fnc_isNIU):
			{
				["Altis NIU Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],
						["hgun_Rook40_F","Rook",0],
						["16Rnd_9x21_Mag","Rookx16 Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG [SPC]",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer [SPC]",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["optic_MRCO","MRCO Scope",0],
						["optic_ARCO","ARCO Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin [SPC]",0],
						["SMG_01_Holo_F","Vermin+HoloScope [SPC]",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd [SPC]",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer [SPC]",0],
						["optic_Holosight_smg","Vermin Holographic [SPC]",0],
						["muzzle_snds_acp",".45 Supressor [NIU]",0],

						//MX Section
						["arifle_MXC_Black_F","MXC Black [SGT]",0],
						["arifle_MX_Black_F","MX Black [NIU][DSGT]",0],
						["arifle_MXM_Black_F","MXM Black [NIU][DI]",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd [NIU][SGT]",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer [NIU][SGT]",0],

						//Officers pistol
						["hgun_Pistol_heavy_02_F","Officer's Pistol [SI]",0],
						["6Rnd_45ACP_Cylinder","6xOfficer's Mags [SI]",0],

						["hgun_Pistol_heavy_01_F","4-Five [CSI]",0],
						["11Rnd_45ACP_Mag","11x4-Five Rnd [CSI]",0],
						["optic_MRD","4-Five Scope [CSI]",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],

						["Rangefinder","Rangefinders",0],
						["optic_DMS","DMS Scope",0],
						["muzzle_snds_H","6.5 Supressor",0],
						["bipod_01_F_blk","Bipod",0],
						["acc_flashlight","Flashlight",0],

						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 11 || __GETC__(life_plodrank) == 12):
			{
				["Altis CSI/CMD Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["optic_MRCO","MRCO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer",0],
						["optic_ARCO","ARCO Scope",0],
						["optic_DMS","DMS Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin",0],
						["SMG_01_Holo_F","Vermin+HoloScope",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer",0],
						["optic_Holosight_smg","Vermin Holographic",0],

						//MX Section
						["arifle_MXC_Black_F","MXC Black",0],
						["arifle_MX_Black_F","MX Black",0],
						["arifle_MXM_Black_F","MXM Black",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer",0],

						["hgun_Rook40_F","Rook",0],
						["16Rnd_9x21_Mag","Rookx16 Rnd",0],

						//Officers pistol
						["hgun_Pistol_heavy_02_F","Officer's Pistol",0],
						["6Rnd_45ACP_Cylinder","6xOfficer's Mags",0],

						["hgun_Pistol_heavy_01_F","4-Five",0],
						["11Rnd_45ACP_Mag","11x4-Five Rnd",0],
						["optic_MRD","4-Five Scope",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["bipod_01_F_blk","Bipod",0],
						["acc_flashlight","Flashlight",0],

						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 10):
			{
				["Altis SI Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer",0],
						["optic_MRCO","MRCO Scope",0],
						["optic_ARCO","ARCO Scope",0],
						["optic_DMS","DMS Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin",0],
						["SMG_01_Holo_F","Vermin+HoloScope",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer",0],
						["optic_Holosight_smg","Vermin Holographic",0],

						//MX Section
						["arifle_MXC_Black_F","MXC Black",0],
						["arifle_MX_Black_F","MX Black",0],
						["arifle_MXM_Black_F","MXM Black",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer",0],

						["hgun_Rook40_F","Rook",0],
						["16Rnd_9x21_Mag","Rookx16 Rnd",0],

						//Officers pistol
						["hgun_Pistol_heavy_02_F","Officer's Pistol",0],
						["6Rnd_45ACP_Cylinder","6xOfficer's Mags",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["bipod_01_F_blk","Bipod",0],
						["acc_flashlight","Flashlight",0],

						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 9):
			{
				["Altis CI Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["optic_MRCO","MRCO Scope",0],
						["optic_ARCO","ARCO Scope",0],
						["optic_DMS","DMS Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin",0],
						["SMG_01_Holo_F","Vermin+HoloScope",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer",0],
						["optic_Holosight_smg","Vermin Holographic",0],

						//MX Section
						["arifle_MXC_Black_F","MXC Black",0],
						["arifle_MX_Black_F","MX Black",0],
						["arifle_MXM_Black_F","MXM Black",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer",0],

						["hgun_Rook40_F","Rook",0],
						["16Rnd_9x21_Mag","Rookx16 Rnd",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["bipod_01_F_blk","Bipod",0],
						["acc_flashlight","Flashlight",0],
						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 8):
			{
				["Altis DI Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["optic_MRCO","MRCO Scope",0],
						["optic_ARCO","ARCO Scope",0],
						["optic_DMS","DMS Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin",0],
						["SMG_01_Holo_F","Vermin+HoloScope",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer",0],
						["optic_Holosight_smg","Vermin Holographic",0],

						//MX Section
						["arifle_MXC_Black_F","MXC Black",0],
						["arifle_MX_Black_F","MX Black",0],
						["arifle_MXM_Black_F","MXM Black",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer",0],

						["hgun_Rook40_F","Rook",0],
						["16Rnd_9x21_Mag","Rookx16 Rnd",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["bipod_01_F_blk","Bipod",0],
						["acc_flashlight","Flashlight",0],
						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 7):
			{
				["Altis Inspector Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["optic_MRCO","MRCO Scope",0],
						["optic_ARCO","ARCO Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin",0],
						["SMG_01_Holo_F","Vermin+HoloScope",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer",0],
						["optic_Holosight_smg","Vermin Holographic",0],

						//MX Section
						["arifle_MXC_Black_F","MXC Black",0],
						["arifle_MX_Black_F","MX Black",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer",0],

						["hgun_Rook40_F","Rook",0],
						["16Rnd_9x21_Mag","Rookx16 Rnd",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["bipod_01_F_blk","Bipod",0],
						["acc_flashlight","Flashlight",0],
						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 6):
			{
				["Altis Desk SGT Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer",0],
						["optic_MRCO","MRCO Scope",0],
						["optic_ARCO","ARCO Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin",0],
						["SMG_01_Holo_F","Vermin+HoloScope",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer",0],
						["optic_Holosight_smg","Vermin Holographic",0],

						//MX Section
						["arifle_MXC_Black_F","MXC Black",0],
						["arifle_MX_Black_F","MX Black",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer",0],


						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["acc_flashlight","Flashlight",0],
						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 5):
			{
				["Altis SGT Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["hgun_Rook40_snds_F","Taser Pistol (Black)",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer",0],
						["optic_MRCO","MRCO Scope",0],
						["acc_pointer_IR",nil,0],

						//Vermin Secton
						["SMG_01_F","Vermin",0],
						["SMG_01_Holo_F","Vermin+HoloScope",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer",0],
						["optic_Holosight_smg","Vermin Holographic",0],

						//MXC Section
						["arifle_MXC_Black_F","MXC Black",0],
						["30Rnd_65x39_caseless_mag","MXx30 Rnd",0],
						["30Rnd_65x39_caseless_mag_Tracer","MXx30 Tracer",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["acc_flashlight","Flashlight",0],
						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 4):
			{
				["Altis SPC Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["arifle_Mk20_plain_F","Taser Rifle LG",0], //Large Taser Rifle
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],
						["muzzle_snds_M","Taser Rifle Silencer",0],

						//Vermin Secton
						["SMG_01_F","Vermin",0],
						["SMG_01_Holo_F","Vermin+HoloScope",0],
						["30Rnd_45ACP_Mag_SMG_01","30xVermin Rnd",0],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","30xVermin Tracer",0],
						["optic_Holosight_smg","Vermin Holographic",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["acc_flashlight","Flashlight",0],
						//Equipment Section
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 3):
			{
				["Altis PC Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["30Rnd_556x45_Stanag","Lethal Bullets",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],
						["optic_Holosight","Holographic Scope",0],
						["optic_Hamr","RCO Scope",0],

						["arifle_SDAR_F",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],
						["acc_flashlight","Flashlight",0],
						//Equipment
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["B_UavTerminal",nil,0]
					]
				];
			};

			case (__GETC__(life_plodrank) == 2):
			{
				["Altis PCSO Armoury",
					[
						//Pistols
						["hgun_P07_snds_F","Taser Pistol",0],
						["16Rnd_9x21_Mag","16xTaser Rnd",0],

						["arifle_Mk20C_plain_F","Taser Rifle",0],
						["30Rnd_556x45_Stanag_Tracer_Green","Rubber Bullets",0],
						["optic_Aco","Red ACO Scope",0],
						["optic_Aco_grn","Green ACO Scope",0],


						["acc_flashlight","Flashlight",0],

						//Equipment
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0]
					]
				];
			};

			default
			{
				["Altis CSO Store",
					[
						//Equipment
						["ToolKit",nil,0],
						["Medikit",nil,0],
						["FirstAidKit",nil,0],
						["Binocular",nil,0],
						["ItemGPS",nil,0],
						["ItemCompass",nil,0],
						["ItemWatch",nil,0],
						["ItemMap",nil,0],
						["ItemRadio",nil,0],
						["NVGoggles_OPFOR",nil,0]
					]
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do
		{
			case (playerSide != independent): {"You are not an NHS Paramedic"};
			default {
				["NHS Hospital Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,0],
						["NVGoggles_INDEP",nil,0]
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

	case "wrebel":
	{
		switch(true) do
		{
			case (!(call life_fnc_isRebel)): {"You don't have Rebel Membership!"};
			default
			{
				["UNMC Armory",
					[

						//Handguns Wilco V1 June2014 Complete
						["hgun_Rook40_F",nil,0],["hgun_ACPC2_F",nil,0],["hgun_Pistol_heavy_02_F",nil,0],["hgun_Pistol_heavy_01_F",nil,0],["hgun_Pistol_Signal_F",nil,0],

						//5.56mm Wilco V1 June2014
						["arifle_SDAR_F",nil,0],["arifle_TRG20_F",nil,0],["arifle_TRG21_F",nil,0],["arifle_Mk20_F",nil,0],

						//6.5mm Wilco V1 June2014 && Ciaran - Add unmc items.
						["arifle_MX_F",nil,0],["arifle_MX_Black_F",nil,0],["arifle_MXC_F",nil,0],["arifle_MXC_Black_F",nil,0],
						["arifle_MX_SW_F",nil,0],["arifle_MX_SW_Black_F",nil,0],["arifle_MXM_F",nil,0],["arifle_MXM_Black_F",nil,0],
						["arifle_Katiba_C_F",nil,0],["arifle_Katiba_F",nil,0],

						//AK Variants
						["arifle_Katiba_ARCO_F",nil,0],
						["arifle_TRG21_MRCO_F",nil,0],

						//7.62mm Wilco V1 June2014
						["srifle_DMR_01_F",nil,0],["srifle_EBR_F",nil,0],

						//9mm&45 Wilco V1 June2014
						["SMG_01_F",nil,0],["SMG_02_F",nil,0],

						//Suppressors Wilco V1 June2014
						["muzzle_snds_acp",nil,0],["muzzle_snds_M",nil,0],["muzzle_snds_H",nil,0],["muzzle_snds_L",nil,0],["muzzle_snds_B",nil,0],

						//Attachments Wilco V1 June2014
						["optic_Aco",nil,0],["optic_ACO_grn",nil,0],["optic_Aco_smg",nil,0],["optic_ACO_grn_smg",nil,0],["optic_Holosight",nil,0],
						["optic_Holosight_smg",nil,0],["optic_Hamr",nil,0],["optic_Arco",nil,0],["optic_MRCO",nil,0],["optic_DMS",nil,0],
						["acc_flashlight",nil,0],["acc_pointer_IR",nil,0],["optic_SOS","SOS Scope",0],

						//Mags
						["16Rnd_9x21_Mag",nil,0],["30Rnd_9x21_Mag",nil,0],["11Rnd_45ACP_Mag",nil,0],["9Rnd_45ACP_Mag",nil,0],["6Rnd_45ACP_Cylinder",nil,0],
						["30Rnd_45ACP_Mag_SMG_01",nil,0],["30Rnd_556x45_Stanag",nil,0],["30Rnd_556x45_Stanag_Tracer_Red",nil,0],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,0],["30Rnd_556x45_Stanag_Tracer_Yellow",nil,0],
						["20Rnd_556x45_UW_mag",nil,0],["30Rnd_65x39_caseless_mag",nil,0],["30Rnd_65x39_caseless_green",nil,0],["30Rnd_65x39_caseless_mag_Tracer",nil,0],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,0],
						["200Rnd_65x39_cased_Box_Tracer",nil,0],["10Rnd_762x54_Mag",nil,0],["20Rnd_762x51_Mag",nil,0],
						["6Rnd_RedSignal_F",nil,0],["150Rnd_762x51_Box_Tracer",nil,0],
						["100Rnd_65x39_caseless_mag",nil,0],["100Rnd_65x39_caseless_mag_Tracer",nil,0],

						//Items
						["FirstAidKit",nil,0],
						["NVGoggles",nil,0],
						["NVGoggles_INDEP",nil,0],
						["NVGoggles_OPFOR",nil,0],
						["RangeFinder",nil,0],
						["SmokeShell",nil,0],
						["B_IR_Grenade",nil,0]
					]
				];
			};
		};
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
						//Handguns Wilco V1 June2014 Complete
						["hgun_Rook40_F",nil,25000],["hgun_ACPC2_F",nil,28000],["hgun_Pistol_heavy_02_F",nil,30000],["hgun_Pistol_heavy_01_F",nil,35000],["hgun_Pistol_Signal_F",nil,10000],

						//5.56mm Wilco V1 June2014
						["arifle_SDAR_F",nil,40000],["arifle_TRG20_F",nil,50000],["arifle_TRG21_F",nil,60000],["arifle_Mk20_F",nil,100000],

						//6.5mm Wilco V1 June2014
						["arifle_MX_F",nil,150000],["arifle_MX_Black_F",nil,250000],["arifle_MXC_F",nil,160000],
						["arifle_MXC_Black_F",nil,260000],["arifle_MX_SW_F",nil,170000],
						["arifle_MX_SW_Black_F",nil,270000],["arifle_MXM_F",nil,210000],
						["arifle_MXM_Black_F",nil,310000],["arifle_Katiba_C_F",nil,130000],

						//AK Variants
						["arifle_Katiba_ARCO_F",nil,137000],
						["arifle_TRG21_MRCO_F",nil,70000],

						//7.62mm Wilco V1 June2014
						["srifle_DMR_01_F",nil,160000],
						["srifle_DMR_06_camo_F",nil,160000],
						["srifle_DMR_06_olive_F",nil,160000],
						["srifle_DMR_06_camo_khs_F",nil,160000],
						["srifle_EBR_F",nil,230000],
						["srifle_DMR_03_khaki_F",nil,460000],
						["srifle_DMR_03_tan_F",nil,460000],
						["srifle_DMR_03_multicam_F",nil,460000],
						["srifle_DMR_03_woodland_F",nil,460000],

						//9mm&45 Wilco V1 June2014
						["SMG_01_F",nil,80000],

						//Suppressors Wilco V1 June2014
						["muzzle_snds_acp",nil,50000],["muzzle_snds_M",nil,100000],["muzzle_snds_H",nil,150000],["muzzle_snds_L",nil,155000],["muzzle_snds_B",nil,160000],

						//Attachments Wilco V1 June2014
						["optic_Aco",nil,5000],["optic_ACO_grn",nil,5000],["optic_Aco_smg",nil,5000],["optic_ACO_grn_smg",nil,5000],["optic_Holosight",nil,5000],["optic_Holosight_smg",nil,5000],["optic_Hamr",nil,7000],["optic_Arco",nil,7000],["optic_MRCO",nil,10000],["optic_DMS",nil,40000],["acc_flashlight",nil,2000],["acc_pointer_IR",nil,5000],
						//Bipods
						["bipod_01_F_snd",nil,15000],
						["bipod_01_F_mtp",nil,15000],
						["bipod_02_F_tan",nil,15000],
						["bipod_02_F_hex",nil,15000],
						["bipod_03_F_oli",nil,15000],

						//Mags
						["16Rnd_9x21_Mag",nil,250],["30Rnd_9x21_Mag",nil,500],["11Rnd_45ACP_Mag",nil,900],["9Rnd_45ACP_Mag",nil,700],["6Rnd_45ACP_Cylinder",nil,500],["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["30Rnd_556x45_Stanag",nil,1000],["30Rnd_556x45_Stanag_Tracer_Red",nil,1500],["30Rnd_556x45_Stanag_Tracer_Green",nil,1500],["30Rnd_556x45_Stanag_Tracer_Yellow",nil,1500],
						["20Rnd_556x45_UW_mag",nil,500],["30Rnd_65x39_caseless_mag",nil,1000],["30Rnd_65x39_caseless_green",nil,1500],["30Rnd_65x39_caseless_mag_Tracer",nil,1500],["30Rnd_65x39_caseless_green_mag_Tracer",nil,1500],
						["200Rnd_65x39_cased_Box_Tracer",nil,3500],
						["10Rnd_762x54_Mag",nil,2000],["20Rnd_762x51_Mag",nil,4000],
						["150Rnd_762x51_Box",nil,2500],["6Rnd_RedSignal_F",nil,5000],

						//Items
						["FirstAidKit",nil,2000],
						["NVGoggles",nil,2000],
						["NVGoggles_INDEP",nil,3000],
						["NVGoggles_OPFOR",nil,4000],
						["RangeFinder",nil,6000],
						["SmokeShell",nil,500],
						["B_IR_Grenade",nil,500]
					]
				];
			};
		};
	};

	case "bhunter":
	{
		switch(true) do {
			case (playerSide != civilian): {"You are not a civilian"};
			case (!license_civ_bounty): {"You are not a bounty hunter"};
			default
			{
				["Bounty Hunter Store",
					[
						//9mm&45 Wilco V1 June2014
						["hgun_PDW2000_F",nil,40000],

						//Attachments Wilco V1 June2014
						["optic_Aco_smg",nil,5000],["optic_ACO_grn_smg",nil,5000],

						//Mags
						["30Rnd_9x21_Mag",nil,500],

						//Items
						["FirstAidKit",nil,2000],
						["NVGoggles",nil,2000]
					]
				];
			}
		}
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
						["hgun_Rook40_F",nil,25000],["hgun_ACPC2_F",nil,28000],["hgun_Pistol_heavy_02_F",nil,30000],["hgun_Pistol_heavy_01_F",nil,35000],["hgun_Pistol_Signal_F",nil,10000],
						["V_Rangemaster_belt",nil,5000],
						["16Rnd_9x21_Mag",nil,250],["30Rnd_9x21_Mag",nil,500],["11Rnd_45ACP_Mag",nil,900],["9Rnd_45ACP_Mag",nil,700],["6Rnd_45ACP_Cylinder",nil,500],["6Rnd_RedSignal_F",nil,10000]
					]
				];
			};
		};
	};


	//Old donator system
	case "donator":
	{
		switch(true) do
		{
			case (__GETC__(life_samaritan) != 5): {"You are not a donator! Visit Roleplay.co.uk"};
			case (__GETC__(life_samaritan) == 5):
			{
				["The VIP Club",
					[
						//Handguns
						["hgun_Rook40_F",nil,5000],["hgun_ACPC2_F",nil,8000],["hgun_Pistol_heavy_02_F",nil,9000],["hgun_Pistol_heavy_01_F",nil,10000],["hgun_Pistol_Signal_F",nil,1000],

						//5.56mm
						["arifle_SDAR_F",nil,12000],["arifle_TRG20_F",nil,15000],["arifle_TRG21_F",nil,18000],["arifle_Mk20_F",nil,20000],

						//6.5mm
						["arifle_MX_F",nil,30000],["arifle_MX_Black_F",nil,50000],["arifle_MXC_F",nil,40000],["arifle_MXC_Black_F",nil,60000],["arifle_MX_SW_F",nil,45000],["arifle_MX_SW_Black_F",nil,65000],["arifle_MXM_F",nil,60000],["arifle_MXM_Black_F",nil,80000],
						["arifle_Katiba_C_F",nil,25000],

						//7.62mm
						["srifle_DMR_01_F",nil,40000],["srifle_EBR_F",nil,75000],

						//9mm&45
						["SMG_01_F",nil,19000],

						//Suppressors
						["muzzle_snds_acp",nil,20000],["muzzle_snds_M",nil,30000],["muzzle_snds_H",nil,40000],["muzzle_snds_L",nil,50000],["muzzle_snds_B",nil,45000],

						//Attachments
						["optic_Aco",nil,500],["optic_ACO_grn",nil,500],["optic_Aco_smg",nil,500],["optic_ACO_grn_smg",nil,500],["optic_Holosight",nil,500],["optic_Holosight_smg",nil,500],["optic_Hamr",nil,1000],["optic_Arco",nil,1000],["optic_MRCO",nil,2000],["optic_DMS",nil,18000],["acc_flashlight",nil,200],["acc_pointer_IR",nil,500],

						//Mags
						["16Rnd_9x21_Mag",nil,50],["30Rnd_9x21_Mag",nil,100],["11Rnd_45ACP_Mag",nil,300],["9Rnd_45ACP_Mag",nil,700],["6Rnd_45ACP_Cylinder",nil,100],["30Rnd_45ACP_Mag_SMG_01",nil,400],
						["30Rnd_556x45_Stanag",nil,400],["30Rnd_556x45_Stanag_Tracer_Red",nil,600],["30Rnd_556x45_Stanag_Tracer_Green",nil,600],["30Rnd_556x45_Stanag_Tracer_Yellow",nil,600],
						["20Rnd_556x45_UW_mag",nil,100],["30Rnd_65x39_caseless_mag",nil,400],["30Rnd_65x39_caseless_green",nil,600],["30Rnd_65x39_caseless_mag_Tracer",nil,600],["30Rnd_65x39_caseless_green_mag_Tracer",nil,600],
						["200Rnd_65x39_cased_Box_Tracer",nil,1600],
						["10Rnd_762x54_Mag",nil,800],["20Rnd_762x51_Mag",nil,1600],
						["150Rnd_762x51_Box",nil,2500],["6Rnd_RedSignal_F",nil,5000],

						//Items
						["FirstAidKit",nil,2000],
						["NVGoggles",nil,2000],
						["NVGoggles_INDEP",nil,3000],
						["NVGoggles_OPFOR",nil,4000],
						["RangeFinder",nil,6000],
						["SmokeShell",nil,500],
						["B_IR_Grenade",nil,500]
					]
				];
			};
		};
	};

	/*case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Arms",
					[
						//Handguns Wilco V1 June2014 Complete
						["hgun_Rook40_F",nil,25000],["hgun_ACPC2_F",nil,28000],["hgun_Pistol_heavy_02_F",nil,30000],["hgun_Pistol_heavy_01_F",nil,35000],["hgun_Pistol_Signal_F",nil,10000],

						//5.56mm Wilco V1 June2014
						["arifle_SDAR_F",nil,40000],["arifle_TRG20_F",nil,50000],["arifle_TRG21_F",nil,60000],["arifle_Mk20_F",nil,100000],

						//6.5mm Wilco V1 June2014
						["arifle_MX_F",nil,150000],["arifle_MX_Black_F",nil,250000],["arifle_MXC_F",nil,160000],["arifle_MXC_Black_F",nil,260000],["arifle_MX_SW_F",nil,170000],["arifle_MX_SW_Black_F",nil,270000],["arifle_MXM_F",nil,210000],["arifle_MXM_Black_F",nil,310000],["LMG_Mk200_F",nil,150000],["arifle_Katiba_C_F",nil,130000],

						//7.62mm Wilco V1 June2014
						["srifle_DMR_01_F",nil,160000],["LMG_Zafir_F",nil,200000],["srifle_EBR_F",nil,230000],

						//9mm&45 Wilco V1 June2014
						["SMG_01_F",nil,80000],

						//Suppressors Wilco V1 June2014
						["muzzle_snds_acp",nil,50000],["muzzle_snds_M",nil,100000],["muzzle_snds_H",nil,150000],["muzzle_snds_L",nil,155000],["muzzle_snds_B",nil,160000],

						//Attachments Wilco V1 June2014
						["optic_Aco",nil,5000],["optic_ACO_grn",nil,5000],["optic_Aco_smg",nil,5000],["optic_ACO_grn_smg",nil,5000],["optic_Holosight",nil,5000],["optic_Holosight_smg",nil,5000],["optic_Hamr",nil,7000],["optic_Arco",nil,7000],["optic_MRCO",nil,10000],["optic_DMS",nil,40000],["acc_flashlight",nil,2000],["acc_pointer_IR",nil,5000],

						//Mags
						["16Rnd_9x21_Mag",nil,250],["30Rnd_9x21_Mag",nil,500],["11Rnd_45ACP_Mag",nil,900],["9Rnd_45ACP_Mag",nil,700],["6Rnd_45ACP_Cylinder",nil,500],["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["30Rnd_556x45_Stanag",nil,1000],["30Rnd_556x45_Stanag_Tracer_Red",nil,1500],["30Rnd_556x45_Stanag_Tracer_Green",nil,1500],["30Rnd_556x45_Stanag_Tracer_Yellow",nil,1500],
						["20Rnd_556x45_UW_mag",nil,500],["30Rnd_65x39_caseless_mag",nil,1000],["30Rnd_65x39_caseless_green",nil,1500],["30Rnd_65x39_caseless_mag_Tracer",nil,1500],["30Rnd_65x39_caseless_green_mag_Tracer",nil,1500],
						["200Rnd_65x39_cased_Box",nil,2500],["200Rnd_65x39_cased_Box_Tracer",nil,3500],
						["10Rnd_762x54_Mag",nil,2000],["20Rnd_762x51_Mag",nil,4000],
						["150Rnd_762x51_Box",nil,2500],["6Rnd_RedSignal_F",nil,5000],["150Rnd_762x51_Box_Tracer",nil,3000],


						//Items
						["FirstAidKit",nil,2000],
						["NVGoggles",nil,2000],
						["NVGoggles_INDEP",nil,3000],
						["NVGoggles_OPFOR",nil,4000],
						["RangeFinder",nil,6000],
						["SmokeShell",nil,500],
						["B_IR_Grenade",nil,500]
					]
				];
			};
		};
	};*/

	case "genstore":
	{
		["Hardware Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemCompass",nil,50],
				["ItemWatch",nil,10],
				["ItemMap",nil,1],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000]				
 			]
		];
	};

		case "fuelstore":
	{
		["Fuel Store",
			[
				["ItemGPS",nil,1000],
				["ItemMap",nil,50],
				["ToolKit",nil,3000],
				["FirstAidKit",nil,4000]
			]
		];
	};

	case "kartstore":
	{
		["Stig's Racing Supplies",
			[
				["hgun_Pistol_Signal_F",nil,30000],
				["6Rnd_RedSignal_F",nil,5000],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000]
			]
		];
	};
};
