/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];

switch (_vehicle) do
{

	case "B_UGV_01_rcws_F":
	{
		_ret =
		[
			["a3\drones_f\soft_f_gamma\ugv_01\data\ugv_01_ext_co.paa","civ","a3\drones_f\soft_f_gamma\ugv_01\data\ugv_01_int_co.paa",""]
		];
	};

	case "O_Heli_Transport_04_bench_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa", "reb", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_co.paa"],
			["#(rgb,8,8,3)color(0.8,0.7,0.5,0.2)","reb","#(rgb,8,8,3)color(0.8,0.7,0.5,0.2)","#(rgb,8,8,3)color(0.8,0.7,0.5,0.2)"],
			["#(rgb,8,8,3)color(0.1,0.1,0.1,0.9)","reb","#(rgb,8,8,3)color(0.1,0.1,0.1,0.9)","#(rgb,8,8,3)color(0.1,0.1,0.1,0.9)"]
		];
	};

	case "O_Heli_Transport_04_covered_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)","#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa", "reb", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_co.paa"]
		];
	};

	case "O_Plane_CAS_02_F":
	{
		_path = "\A3\Air_F_EPC\Plane_CAS_02\Data\";
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
		];
	};

	case "C_Offroad_01_repair_F":
	{
		_ret =
		[
			["textures\civilian\arac\arac.paa","civ"]
		];
	};

	case "I_Plane_Fighter_03_AA_F":
	{
		_path = "\A3\Air_F_EPC\Plane_Fighter_03\";
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ","#(argb,8,8,3)color(0.05,0.05,0.05,1)"]
		];
	};

	case "I_Heli_Transport_02_F":
	{
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa","civ",_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["#(rgb,8,8,3)color(0,0,0,0.6)","civ","#(rgb,8,8,3)color(0,0,0,0.6)","#(rgb,8,8,3)color(0,0,0,0.6)"],
			["#(rgb,8,8,3)color(0.8,0.7,0.5,0.2)","civ","#(rgb,8,8,3)color(0.8,0.7,0.5,0.2)","#(rgb,8,8,3)color(0.8,0.7,0.5,0.2)"],
			["#(rgb,8,8,3)color(0.1,0.1,0.1,0.9)","civ","#(rgb,8,8,3)color(0.1,0.1,0.1,0.9)","#(rgb,8,8,3)color(0.1,0.1,0.1,0.9)"],
			["textures\civilian\ba\BAMohawk1.paa","ba", "textures\civilian\ba\BAMohawk2.paa", "textures\civilian\ba\BAMohawk3.paa"]
		];
	};

	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["textures\police\hatchback\policehatchbackwhite.paa","cop"],
			["textures\nhs\paramedichb.paa","med"],
			["textures\police\hatchback\policehatchbackblack.paa","cop"]
			];
	};

	case "C_Offroad_01_F":
	{
		_ret =
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["textures\police\offroad\policeoffroad.paa","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_01_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_01_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_02_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_02_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_03_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_03_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_04_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_04_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_05_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_05_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_06_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_06_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_07_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_07_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_08_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_08_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_09_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_09_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_10_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_10_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_11_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_11_co.paa"],
			["\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_12_co.paa","civ","\A3\soft_F_bootcamp\Offroad_01\Data\offroad_01_ext_ig_12_co.paa"],
			["textures\police\offroad\policeoffroadblack.paa","cop"],
			["textures\nhs\nhsoffroad.paa","med"]
		];
	};

	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["textures\police\hatchback\policehatchbackwhite.paa","cop"],
			["textures\nhs\paramedichb.paa","med"]
		];
	};
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["textures\police\suv\policesuvwhite.paa","cop"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\nhs\nhssuv.paa","med"],
			["textures\civilian\taxi\taxi.paa","taxi"],
			["textures\police\suv\policesuvblack.paa","cop"],
			["textures\civilian\limo.paa","mayor"]
		];
	};

	case "C_Van_01_box_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\nhs\ambulancefront.paa","med","textures\nhs\ambulanceback.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_01_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_01_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_02_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_02_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_03_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_03_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_04_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_04_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_05_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_05_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_06_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_06_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_07_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_07_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_08_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_08_co.paa"]
		];
	};

	case "C_Van_01_transport_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],

			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_01_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_01_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_02_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_02_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_03_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_03_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_04_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_04_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_05_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_05_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_06_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_06_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_07_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_07_co.paa"],
			["\A3\soft_F_bootcamp\Van_01\Data\van_01_ext_ig_08_co.paa","civ","\A3\soft_F_bootcamp\Van_01\Data\van_01_adds_ig_08_co.paa"]
		];
	};

	case "B_Heli_Transport_03_unarmed_F":
	{
		_ret =
		[
			["a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext01_black_co.paa","default","a3\air_f_heli\heli_transport_03\data\heli_transport_03_ext02_black_co.paa"],
			["textures\civilian\ba\BAFront.paa","ba","textures\civilian\ba\BABack.paa"]
		];
	};

	case "B_Quadbike_01_F":
	{
		_ret =
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};

	case "B_Heli_Light_01_F":
	{
		_ret =
		[
			["textures\police\hummingbird\npashummingbirdbench.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"]
		];
	};

	case "C_Heli_Light_01_civil_F":
	{
		_ret =
		[
			["textures\police\hummingbird\npashummingbirddoors.paa","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wasp_co.paa","civ"]
		];
	};

	case "O_Heli_Light_02_unarmed_F":
	{
		_ret =
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\nhs\paramedichems.paa","med"]
		];
	};

	case "B_MRAP_01_F":
	{
		_ret =
		[
			["textures\police\hunter\policehunterfront.paa","cop","textures\police\hunter\policehunterback.paa"],
			["textures\police\hunter\arhunterfront.paa","cop","textures\police\hunter\arhunterback.paa"],
			["textures\police\hunter\ncahunterfront.paa","cop","textures\police\hunter\ncahunterback.paa"]
		];
	};

	case "I_MRAP_03_F":
	{
		_ret =
		[
			["textures\police\land\arstrider.paa","cop"]
		];
	};

	case "I_Truck_02_covered_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"],
			["textures\police\zamak\policezamakfront.paa","cop","textures\police\zamak\policezamakback.paa"]
		];
	};

	case "I_Truck_02_transport_F":
	{
		_ret =
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
			["textures\police\hellcat\policehellcat.paa","cop"],
			["\A3\air_f_epb\Heli_Light_03\data\heli_light_03_base_co.paa","civ"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"]
		];
	};

	case "O_Heli_Attack_02_black_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};

	case "B_Heli_Transport_01_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","cop"]
		];
	};

	case "O_MRAP_02_F":
	{
		_ret =
		[
			["a3\soft_f\MRAP_02\data\mrap_02_ext_01_co.paa","reb","a3\soft_f\MRAP_02\data\mrap_02_ext_02_co.paa"]
		];
	};


		case "C_Offroad_01_repair_F":
	{
		_ret =
		[
			["textures\civilian\arac\arac.paa","civ"]
		];
	};

			case "O_Heli_Transport_04_fuel_F":
	{
		_ret =
		[

			["a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_01_co.paa", "reb", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_base_02_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext01_co.paa", "a3\air_f_heli\heli_transport_04\data\heli_transport_04_pod_ext02_co.paa"]
		];
	};


};

_ret;
