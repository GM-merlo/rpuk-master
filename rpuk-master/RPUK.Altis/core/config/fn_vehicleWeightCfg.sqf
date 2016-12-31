/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "C_Quadbike_01_F": {30;};
	case "C_Hatchback_01_F": {50;};
	case "C_Offroad_01_F": {120;};
	case "C_SUV_01_F": {85;};
	case "I_C_Offroad_02_unarmed_F": {75;};
	case "C_Offroad_02_unarmed_F": {80;};
	case "O_LSV_02_unarmed_F": {50;};
	case "C_Van_01_transport_F": {300;};
	case "C_Van_01_box_F": {350;};
	case "I_Truck_02_covered_F": {525;};
	case "I_Truck_02_transport_F": {10;};
	case "I_Truck_02_box_F": {550;};
	case "O_Truck_03_transport_F": {600;};
	case "O_Truck_03_covered_F": {625;};
	case "O_Truck_03_repair_F": {650;};
	case "O_Truck_03_device_F": {625;};
	case "B_Truck_01_transport_F": {700;};
	case "B_Truck_01_covered_F": {725;};
	case "B_Truck_01_mover_F": {100;};
	case "B_Truck_01_box_F": {750;};
	case "B_Truck_01_ammo_F": {750;};
	case "C_Heli_Light_01_civil_F": {50;};
	case "O_Heli_Light_02_unarmed_F": {100;};
	case "I_Heli_Transport_02_F": {250;};
	case "B_Heli_Transport_03_unarmed_F": {500;};
	case "B_Heli_Light_01_F": {60;};
	case "I_Heli_light_03_unarmed_F": {125;};
	case "C_Rubberboat": {50;};
	case "C_Boat_Civil_01_F": {150;};
	case "C_Boat_Transport_02_F": {120;};
	case "C_Scooter_Transport_01_F": {10;};
	case "B_T_LSV_01_unarmed_F (Olive)": {50;};
	case "Box_IND_Grenades_F": {350;};
	case "B_supplyCrate_F": {700;};
	default {-1;};
};