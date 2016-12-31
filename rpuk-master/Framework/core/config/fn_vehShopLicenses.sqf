/*
	File: fn_vehShopLicenses.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Checks what shop it is and sometimes the vehicle to determine whether or not they have the license.
	
	Returns:
	TRUE if they have the license or are allowed to get that specific vehicle without having that license.
	FALSE if they don't have the license or are not allowed to obtain that vehicle.
*/
private["_veh","_ret"];
_veh = _this select 0;
_ret = false;

if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore.

switch (life_veh_shop select 0) do
{
	case "med_shop": {_ret = true;};
	case "med_ship": {_ret = true;};
	case "kart_shop": {_ret = license_civ_driver;};
	case "med_air_hs": {_ret = license_med_air;};
	case "civ_car": {_ret = license_civ_driver;};
	case "civ_car_noquad": {_ret = license_civ_driver;};
	case "civ_quad": {_ret = true;};
	case "donator_sml": {_ret = true;};
	case "donator_lrg": {_ret = true;};
	case "civ_ship": {_ret = license_civ_boat;};
	case "civ_air": {_ret = license_civ_air;};
	case "cop_air": {_ret = true;};
	case "cop_airhq": {_ret = true;};
	case "civ_truck": {_ret = license_civ_truck;};
	case "reb_car": {_ret = license_civ_rebel;};
	case "reb_air": {_ret = license_civ_rebel;};
	case "crate_shop": {_ret = true;};
	case "cop_car": {_ret = true;};
	case "wreb_car": {_ret = call life_fnc_isRebel;};
	case "arac_car": {_ret = license_civ_arac;};
	case "taxi_car": {_ret = license_civ_taxi;};
	case "cop_ship": {_ret = call life_fnc_isMPU;};
	case "mayor": {_ret = (life_mayor_settings select 0 == getPlayerUID player)};
	case "ba_air": {_ret = true;};
	case "civ_bus_garage": {_ret = license_civ_bus;};
};

_ret;