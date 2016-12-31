/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{

	case "O_Heli_Transport_04_bench_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Camo"};
			case 2: {_color = "Tan"};
			case 3: {_color = "Grey"};
		};
	};
	
	case "B_Heli_Transport_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Default";};
			case 1: {_color = "British Airways";};
		};
	};

	case "B_UGV_01_rcws_F":
	{
		switch (_index) do
		{
			case 0: {_color = "AR";};
		};
	};

	case "O_Heli_Transport_04_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black";};
			case 1: {_color = "Camo"};
		};
	};

	case "O_Plane_CAS_02_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Black";};
		};
	};


	case "I_Plane_Fighter_03_AA_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Black";};
		};
	};

	case "C_Offroad_01_repair_F":
	{
		switch (_index) do
		{
			case 0: {_color = "ARAC Offroad";};
		};
	};
	
	//Offroad
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Yellow"};
			case 2: {_color = "White"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Dark Red"};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Tanoa Police"};
			case 7: {_color = "Taxi"};
			case 8: {_color = "Jungle Camo"};
			case 9: {_color = "Sand Camo"};
			case 10: {_color = "Sand Camo 2"};
			case 11: {_color = "Sand Jungle Camo"};
			case 12: {_color = "Sand Jungle Camo 2"};
			case 13: {_color = "Sand Jungle Camo 3"};
			case 14: {_color = "Sand Jungle Camo 4"};
			case 15: {_color = "Jungle Camo 2"};
			case 16: {_color = "Jungle Camo 3"};
			case 17: {_color = "Jungle Camo 4"};
			case 18: {_color = "Jungle Camo 5"};
			case 19: {_color = "Jungle Camo 5"};
			case 20: {_color = "Tanoa Police GT"};
		};
	};
	
	//Hatchback
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige"};
			case 1: {_color = "Green"};
			case 2: {_color = "Blue"};
			case 3: {_color = "Dark Blue"};
			case 4: {_color = "Yellow"};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
		};
	};
	
	//Hatchback Sport
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
		};
	};
	
	//SUV
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red"};
			case 1: {_color = "Tanoa Police SUV"};
			case 2: {_color = "Silver"};
			case 3: {_color = "Orange"};
			case 4: {_color = format["%1 Taxis",worldName]};
			case 5: {_color = "Tanoa Police GT"};
			case 6: {_color = "Mayor Limo"};

		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
			case 2: {_color = "Ambulance"};
			case 3: {_color = "Jungle Camo"};
			case 4: {_color = "Sand Camo"};
			case 5: {_color = "Sand/Jungle Camo"};
			case 6: {_color = "Sand/Jungle Camo 2"};
			case 7: {_color = "Sand Camo 2"};
			case 8: {_color = "Sand Camo 3"};
			case 9: {_color = "Jungle Camo 2"};
			case 10: {_color = "Sand Camo 4"};

		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
			case 2: {_color = "Jungle Camo"};
			case 3: {_color = "Sand Camo"};
			case 4: {_color = "Sand/Jungle Camo"};
			case 5: {_color = "Sand/Jungle Camo 2"};
			case 6: {_color = "Sand Camo 2"};
			case 7: {_color = "Sand Camo 3"};
			case 8: {_color = "Jungle Camo 2"};
			case 9: {_color = "Sand Camo 4"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};
	
	case "C_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Blue"};
			case 2: {_color = "Red"};
			case 3: {_color = "White"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "NPAS MH-9"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "Wasp"};
		};
	};

	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "NPAS WA-99"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "Wasp"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "Air Ambulance"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "JAR"};
		};
	};

	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};

		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
//			case 0: {_color = "Orange"};
//			case 1: {_color = "Black"};
			case 0: {_color = "Bus (Open)"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black/Yellow Design"};
			case 1: {_color = "Green/Yellow Design"};
			case 2: {_color = "Black"};
		    case 3: {_color = "Tan"};
		    case 4: {_color = "Grey"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};

	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Tanoa Police"};
		};
	};
	
	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police Black"};
		};
	};

	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Green Camo"};
		};
	};
	
	case "O_Heli_Transport_04_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Camo"};
		};
	};
	
	case "O_LSV_02_unarmed_F": //civ Prowler Lite
	{
		switch (_index) do
		{
			case 0: {_color = "Arid"};
			case 1: {_color = "Black"};
			case 2: {_color = "GreenHex"};
			case 3: {_color = "Hot Pink"};
		};
	};
	
	case "I_C_Offroad_02_unarmed_F": //civ 4x4 open
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Blue"};
			case 2: {_color = "Brown"};
			case 3: {_color = "Green"};
			case 4: {_color = "Olive"};
			case 5: {_color = "Orange"};
			case 6: {_color = "Red"};
			case 7: {_color = "White"};
		};
	};
	
	case "C_Offroad_02_unarmed_F": //civ 4x4 rollbar
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Blue"};
			case 2: {_color = "Brown"};
			case 3: {_color = "Green"};
			case 4: {_color = "Olive"};
			case 5: {_color = "Orange"};
			case 6: {_color = "Red"};
			case 7: {_color = "White"};
		};
	};
	
	
};

_color;