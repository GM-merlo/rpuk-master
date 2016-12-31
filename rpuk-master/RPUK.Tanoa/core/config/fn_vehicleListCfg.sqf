#include <macro.h>
/*
	File: fn_vehicleListCfg.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Ciaran + Wilco
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	
//************ CIVILIAN VEHICLE SHOPS

	
	case "crate_shop":
	{
		_return =
		[
			["Land_Cargo20_blue_F",400000]
		];
	};

	case "kart_shop":
	{
		_return =
		[
			["C_Kart_01_Blu_F",1500],
			["C_Kart_01_Red_F",1500],
			["C_Kart_01_Fuel_F",1500],
			["C_Kart_01_Vrana_F",1500]
		];
	};


	case "civ_car_noquad": 
	{
		_return =
		[
			["C_Hatchback_01_F", 4000],
			["C_Offroad_01_F", 12500],
			["C_SUV_01_F", 10000],
			["I_C_Offroad_02_unarmed_F", 9000],
			["C_Offroad_02_unarmed_F", 9500],
			["O_LSV_02_unarmed_F", 20000]
		];
	};

	case "civ_car":
	{
		_return =
		[
			["C_Quadbike_01_F", 750],
			["C_Hatchback_01_F", 4000],
			["C_Offroad_01_F", 12500],
			["C_SUV_01_F", 10000],
			["I_C_Offroad_02_unarmed_F", 9000],
			["C_Offroad_02_unarmed_F", 9500],
			["O_LSV_02_unarmed_F", 20000]
		];
	};

	case "civ_quad": //Mavis
	{
		_return =
		[
			["C_Quadbike_01_F",750]
		];
	};

	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_transport_F", 30000],
			["C_Van_01_box_F", 36000],
			["I_Truck_02_covered_F", 79100],
			["O_Truck_03_transport_F", 93150],
			["O_Truck_03_covered_F", 97031],
			["O_Truck_03_device_F", 164500],
			["B_Truck_01_transport_F", 193200],
			["B_Truck_01_covered_F", 200100],
			["B_Truck_01_mover_F", 250000],
			["B_Truck_01_box_F", 207000]
		];
	};

	case "civ_bus_garage":
	{
		_return =
		[
			["I_Truck_02_transport_F",1500] //,
//			["I_Truck_02_covered_F",0]
		];
	};

	case "civ_air":
	{
		_return =
		[
			["C_Heli_Light_01_civil_F", 125000],
			["O_Heli_Light_02_unarmed_F", 250000],
			["I_Heli_Transport_02_F", 450000],
			["C_Plane_Civil_01_F", 250000],
			["C_Plane_Civil_01_racing_F", 300000]
		];
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat", 7000],
			["C_Boat_Civil_01_F", 20000],
			["C_Boat_Transport_02_F", 15000],
			["C_Scooter_Transport_01_F", 5000]
		];
		if(license_civ_rebel) then
		{
			_return pushBack ["I_SDV_01_F",70000];
		};
	};

//************ REBEL VEHICLE SHOPS
//************ REBEL VEHICLE SHOPS
//************ REBEL VEHICLE SHOPS

	case "reb_car":
	{
		_return =
		[
			["C_Quadbike_01_F", 750],
			["C_Hatchback_01_F", 4000],
			["C_Offroad_01_F", 12500],
			["C_SUV_01_F", 10000],
			["I_C_Offroad_02_unarmed_F", 9000],
			["C_Offroad_02_unarmed_F", 9500],
			["O_LSV_02_unarmed_F", 20000],
			["C_Van_01_transport_F", 30000],
			["C_Van_01_box_F", 36000],
			["I_Truck_02_covered_F", 79100],
			["O_Truck_03_transport_F", 93150],
			["O_Truck_03_covered_F", 97031],
			["O_Truck_03_device_F", 164500],
			["B_Truck_01_transport_F", 193200],
			["B_Truck_01_covered_F", 200100],
			["B_Truck_01_mover_F", 250000],
			["B_Truck_01_box_F", 207000]


		];
	};

	case "reb_air":
	{
		_return =
		[
			["C_Heli_Light_01_civil_F", 125000],
			["O_Heli_Light_02_unarmed_F", 250000],
			["I_Heli_Transport_02_F", 450000],
			["C_Plane_Civil_01_F", 250000],
			["C_Plane_Civil_01_racing_F", 300000],
			["B_Heli_Transport_03_unarmed_F", 700000],
			["B_Heli_Light_01_F", 175000],
			["I_Heli_light_03_unarmed_F", 275000]
		];
	};

	case "wreb_car":
	{
		_return =
		[
			["B_G_Offroad_01_F",8500],
			["O_Truck_03_covered_F",225000],
			["B_Heli_Light_01_F",450000],
			["I_Heli_light_03_unarmed_F",4000000],
			["O_Heli_Transport_04_bench_F",22000000],
			["B_Heli_Transport_03_unarmed_F",30000000]
		];
	};

//************ MEDIC VEHICLE SHOPS
//************ MEDIC VEHICLE SHOPS
//************ MEDIC VEHICLE SHOPS


	case "med_shop":
	{
		//Default
		_return = [
			["C_Hatchback_01_F",0],
			["C_Van_01_box_F",0],
			["C_Offroad_01_F",0]
		];

		if(__GETC__(life_nhsrank) >= 2) then //FA And Above
		{
			_return pushBack ["C_SUV_01_F",0];
		};

		if(__GETC__(life_nhsrank) >= 3) then //MD And Above
		{
			_return pushBack ["C_Hatchback_01_sport_F",0];
		};

	};

	case "med_ship":
	{
		if(__GETC__(life_nhsrank) >= 3) then //MD And Above
		{
			_return = [
				["C_Boat_Civil_01_rescue_F",0],
				["O_Lifeboat",0]
			];
		};
	};

	case "med_air_hs": {
		if(__GETC__(life_nhsrank) >= 3) then //MD And Above
		{
			_return = [
				["O_Heli_Light_02_unarmed_F",0]
			];
		};
	};

//************ MISC CIV ROLE VEHICLE SHOPS
//************ MISC CIV ROLE VEHICLE SHOPS
//************ MISC CIV ROLE VEHICLE SHOPS


	case "arac_car":
	{
		_return = [
			["C_Offroad_01_repair_F",15000]
		];
	};

	case "taxi_car":
	{
		_return = [
			["C_SUV_01_F",40000]
		];
	};

	case "mayor":
	{
		_return  = [
			["C_SUV_01_F",40000]
		];
	};

//************ POLICE VEHICLE SHOPS
//************ POLICE VEHICLE SHOPS
//************ POLICE VEHICLE SHOPS


	case "cop_car":
	{
		_return = //CSO AND PCSO
		[
			//["C_Hatchback_01_F",0]
			["C_Offroad_01_F",0]
		];

		if(__GETC__(life_plodrank) >= 5) then //SGT AND ABOVE
		{
			_return pushBack ["C_SUV_01_F",0];
			//_return pushBack ["I_Truck_02_covered_F",0];
		};

		if(__GETC__(life_plodrank) >= 8  || call life_fnc_isNIU) then //DI AND ABOVE
		{
			_return pushBack ["B_T_LSV_01_unarmed_F",0];
		};

		if(__GETC__(life_plodrank) >= 10) then
		{
			_return pushBack ["B_UAV_01_F",0];
		};

		if(call life_fnc_isAR) then
		{
			_return pushBack ["B_UGV_01_rcws_F",0];
			_return pushBack ["C_SUV_01_F",0];
			_return pushBack ["B_T_LSV_01_unarmed_F",0];
//			_return pushBack ["B_MRAP_01_F",0];

		};
	};
	case "cop_air":
	{
		if(call life_fnc_isNPAS) then
		{
			_return pushBack ["B_UAV_01_F",0];
			_return pushBack ["I_Heli_light_03_unarmed_F",0]; //Hellcat (I-99)
			_return pushBack ["C_Heli_Light_01_civil_F",0]; //M900 (WA-99)
		};
	};

	case "cop_airhq":
	{
		if(call life_fnc_isNPAS) then
		{
			_return pushBack ["I_Heli_light_03_unarmed_F",0]; //Hellcat (I-99)
			_return pushBack ["C_Heli_Light_01_civil_F",0]; //M900 (WA-99)
			_return pushBack ["B_Heli_Light_01_F",0]; //MH9
			_return pushBack ["O_Heli_Transport_04_covered_black_F",0]; //Taru Transport
			
		};
		if(call life_fnc_isAR || call life_fnc_isNIU || call life_fnc_isNPAS) then  
		{
			_return pushBack ["B_UAV_01_F",0];
		};
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",0],
			["C_Boat_Civil_01_police_F",0],
			["B_Boat_Armed_01_minigun_F",0],
			["B_SDV_01_F",0]
		];
	};

};

_return;