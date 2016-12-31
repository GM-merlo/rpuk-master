/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle"];
_isHomeGarage = [_this,3,false,[false]] call BIS_fnc_param;

if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship","Cargo_base_F"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			if(!isNil "_vehicle") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_vehicle = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint localize "STR_Garage_NoNPC"};
if(isNull _vehicle) exitWith {};

if(_isHomeGarage && _vehicle isKindOf "Truck_F") exitWith {hint "That truck can only be stored at a commercial garage!";};

[[_vehicle,false,(_this select 1)],"TON_fnc_vehicleStore",false,false] spawn life_fnc_MP;
hint localize "STR_Garage_Store_Server";
life_garage_store = true;